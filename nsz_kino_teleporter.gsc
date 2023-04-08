// Kino Teleporter by NSZ
#using scripts\zm\_zm_score;
#using scripts\codescripts\struct;
#using scripts\shared\flag_shared;
#using scripts\shared\util_shared;
#using scripts\zm\_zm_utility;
#using scripts\shared\scene_shared;
#using scripts\shared\lui_shared;

#define KINO_SWIRL2                                  "dlc5/theater/fx_teleport_initiate"
#define KINO_SWIRL									"_NSZ/Kino_Tele/kino_swirl"
#precache( "fx", KINO_SWIRL ); 
#precache( "fx", KINO_SWIRL2 );
#precache( "fx", "dlc1/castle/fx_elec_teleport_flash_sm" );
#precache( "fx", "dlc0/factory/fx_teleporter_beam_factory" ); 
#precache( "fx", "dlc5/theater/fx_teleport_player_flash" );
#precache( "fx", "dlc5/theater/fx_teleport_initiate" ); 
#precache( "fx", "dlc5/theater/fx_teleport_cooldown" );

// Kino Teleporter 
function init()
{
	// ================ Begin: Variables You Can Change if You Like :Begin =====================
	level.tele_kill_radius = 100; 		// The radius that kills zom at the main frame
	//change back to 90
	level.cooldown_time = 90; 			// Cooldown Time after teleporting in seconds
	level.tele_cost = undefined; 		// Cost to Use Teleporter, if undefined it is free
	level.time_in_pap = 30; 			// The amount of time you will spend in the PaP room
	level.nsz_debug = false; 			// Used to bug test and display features
	level.temp_room_time = 10; 			// The amount of time in the temp rooms
	level.chance_to_rand = 0; 			// The chance to spawn in a random room. The higher the num the lower the chance. 0 is 100% chance. 1 is %50
	level.thesourcerandomtp = true;     //When true the player may be randomly teleported to the source.
	// ================ End: Variables You Can Change if You Like :End =====================
	level.sourceeetriggered = false;
	level.startteleportfx = "dlc5/theater/fx_teleport_initiate";
	level.playerteleportfxplayer = "dlc5/theater/fx_teleport_player_flash";
	//level.teleportfinalbeam = "dlc0/factory/fx_teleporter_beam_factory";
	//Difference engines
	//level.differenceengine1 = GetEnt("fxanim_diff_engine_zone_a1", "targetname");
	//level.differenceengine2 = GetEnt("fxanim_diff_engine_zone_a2","targetname");
	//link amount
	level.linktimescounted = 0;
	//End Difference engines
	level.link_pad_trigger = GetEnt( "link_pad", "targetname" ); 
	level.teleport_trigger = GetEnt( "tele_trigger", "targetname" ); 
	level.teleportdetectplayerzombies = GetEnt("kinoteleporterzombieskilplayerdetect", "targetname");
	level.tele_room_spots = struct::get_array( "tele_room_org", "targetname" );
	level.mainframe_spots = struct::get_array( "mainframe_org", "targetname" ); 
	level.thesourcespots = struct::get_array( "upperforesttelespots", "targetname" );
	level.black_spots = struct::get_array( "black_orgs", "targetname" );
	level.oildisappear = "dlc1/castle/fx_elec_teleport_flash_sm";
	level.teleportbeamfxjaunt = "dlc0/factory/fx_teleporter_beam_factory";
	level.telemainframecooldown = "dlc5/theater/fx_teleport_cooldown";
	level.finaltelepadmodel = GetEnt("returnteleporterpadchilis", "targetname");
	level.finaltelepadmodel Hide();
	level.mainframetelefx = GetEnt("mainframeteleporterfx", "targetname");
	level.mainframetelefx Hide();
	level.black_spots_targets = []; 
	for( i=0;i<level.black_spots.size;i++ )
		level.black_spots_targets[i] = struct::get( level.black_spots[i].target, "targetname" ); 
	level.temp_rooms = struct::get_array( "temp_room", "targetname" );
	level waittill("initial_blackscreen_passed");
	main(); 
}


function watchforsideeeteleport()
{
	while(1)
	{
		level waittill("sideeeteleportstarted");
		level.link_pad_trigger SetHintString( "Not Active During Side EE Teleport." ); 
		level.teleport_trigger SetHintString( "Not Active During Side EE Teleport." );
		level notify("endallkinoteleports");
		level waittill("sideeeteleportfullycomplete");
		level thread main();
	}
}

function PlayFxWithCleanup(fx, origin, duration = 3)
{
    level thread _PlayFxWithCleanup(fx, origin, duration);
}

function _PlayFxWithCleanup(fx, origin, duration)
{
    fxModel = Spawn("script_model", origin);
    fxModel SetModel("tag_origin");
    wait(0.05);
    fx = PlayFXOnTag(fx, fxModel, "tag_origin");
    wait(duration);
    fxModel Delete();

    if (isdefined(fx))
        fx Delete();
}


function main()
{
	level endon( "intermission" ); 
	//level endon( "endallkinoteleports" );
	
	wait_for_power(); 

	

	level waittill("teleporterdoorunlocked");
	
	while(1)
	{
		level.link_pad_trigger SetHintString( "Link not Active." ); 
		level.teleport_trigger SetHintString( "Hold ^3[{+activate}]^7 to Initiate Link to Pad" ); 
		level.teleport_trigger waittill( "trigger", player ); 
		level.finaltelepadmodel Show();
		level.teleport_trigger playsound( "kino_activate_start" ); 
		level.teleport_trigger SetHintString( "Waiting for Link to Mainframe" ); 
		level.link_pad_trigger SetHintString( "Hold ^3[{+activate}]^7 to Link Pad with Core" ); 
		level.link_pad_trigger waittill( "trigger", player ); 
		level.link_pad_trigger playsound( "kino_activate_finish" ); 
		level.link_pad_trigger SetHintString( "" ); 

		
		if( isDefined(level.tele_cost) )
			while(1)
			{
				level.teleport_trigger SetHintString( "Hold ^3[{+activate}]^7 to Use Teleporter [Cost: "+level.tele_cost+"]" ); 
				level.teleport_trigger waittill( "trigger", player ); 
				if( isDefined(level.tele_cost) && player.score >= level.tele_cost )
				{
					player zm_score::minus_to_player_score( level.tele_cost );
					level.teleport_trigger playsound( "cha_ching" );
					thread PlayFxWithCleanup(level.teleportbeamfxjaunt, level.teleport_trigger.origin, 5);
					//wait(40);
					//PlayFX(level.teleportbeamfxjaunt, level.link_pad_trigger.origin);
					break; 
				}
				else if( isDefined( level.tele_cost ) && player.score < level.tele_cost )
				{
					level.teleport_trigger playsound( "nsz_deny" ); 
					nsz_iprintlnbold( "Cost Can Be Turned ON or OFF" ); 
					wait(1); 
					continue; 
				}
			}
		else 
		{
			level.teleport_trigger SetHintString( "Hold ^3[{+activate}]^7 to Use Teleporter" ); 
			level.teleport_trigger waittill( "trigger", player ); 
		}
		if(level.thesourcerandomtp == true && level.sourceeetriggered == false)
		{
			//comment this to guarantee this event
			sourcechance = RandomIntRange( 0, 2 );
			//sourcechance = 1;
			if(sourcechance == 1)
			{
				//Uncomment for debug
				//IPrintLnBold("Random chance TP activated");
				//level.sourceeetriggered = true;
			}
		}
		thread PlayFxWithCleanup(KINO_SWIRL2, level.teleport_trigger.origin, 5);
		thread PlayFxWithCleanup(KINO_SWIRL2, level.mainframetelefx.origin, 5);
		level.teleport_trigger SetHintString( "" ); 
		nsz_iprintlnbold( "Kill Radius of Teleporter is Customizable" ); 
		//radius = spawn( "trigger_radius", level.teleport_trigger.origin, 1, level.tele_kill_radius, level.tele_kill_radius );
		level.teleportdetectplayerzombies thread zom_watcher(); 
		players = GetPlayers(); 

		foreach(player in GetPlayers())
		{
			player.quedtoteleport = false;
		}

		time_to_wait = GetTime() + 2200; 
		allplayerstouching = false;
		while(GetTime() < time_to_wait)
		{
			allplayerstouching = checkplayerfunction();
			for( i=0;i<players.size;i++ )
			{
				if( players[i] isTouching(level.teleportdetectplayerzombies) )
				{
					
					if(players[i].quedtoteleport != true)
					{
						chance = RandomIntRange( 0, level.chance_to_rand+1 );
						if(chance == level.chance_to_rand )
						{
								players[i].quedtoteleport = true;
								nsz_iprintlnbold( "^3Case Teleport to Random" );
								//if(sourcechance == 1 && level.sourceeetriggered == false)
								//{
									//players[i] thread tele_to_temp_room_thesource( level.time_in_pap*1.5, players[i].characterIndex); 
								//}
								players[i] thread tele_to_temp_room( level.time_in_pap, players[i].characterIndex); 
								//teleporter_sounds(); 	
						}
						else 
						{
								players[i].quedtoteleport = true;
								nsz_iprintlnbold( "^3Case Teleport straight to PaP" );
								players[i] thread tele_to_room( level.time_in_pap, players[i].characterIndex); 
								//teleporter_sounds(); 	
						}
					}
					
				}
			}
			wait(0.05);	
		}

		

		if(level.aresoulcanistersfilledee == true)
		{
			teleportingplayercount = 0;
			temproofspots = struct::get_array( "roofarrivalspots", "targetname" );
			foreach(player in GetPlayers())
			{
				if(player isTouching(level.teleportdetectplayerzombies))
				{
					teleportingplayercount ++;
				}
			}
			if(teleportingplayercount == players.size)
			{
				//IPrintLnBold("All players in TP");
				level notify("endallkinoteleports");
				players = GetPlayers();
				for(i = 0; i < players.size; i++)
				{
					players[i] thread move_to_room_ee_roof(temproofspots, players[i].characterIndex);
				}
				PlaySoundAtPosition("timebombactivate",(0,0,0));
			}
		}

		//Main EE teaser
		if(allplayerstouching && sourcechance == 1 && level.sourceeetriggered == false)
		{	level notify("endallkinoteleports");
			players = GetPlayers();
			for(i = 0; i < players.size; i++)
			{
				players[i] thread tele_to_temp_room_thesource( level.time_in_pap*1.5, players[i].characterIndex);
			}
		}


		//Source teleportation main EE teaser
		if(sourcechance == 1 && level.sourceeetriggered == false)
		{
			IPrintLnBold("Warning: Teleporter Malfunction!");
			PlaySoundAtPosition("timebombactivate",(0,0,0));
			level.sourceeetriggered = true;
		}

		level notify("initiatekinoteleportsequence");
		foreach(player in GetPlayers())
		{
			player.quedtoteleport = false;
		}
		
		level thread teleporter_sounds();
		//radius delete(); 
		level.teleport_trigger SetHintString( "Teleporter is Cooling Down" ); 
		nsz_iprintlnbold( "Cooldown Time is Customizable" );
		//cooldownfx
		teleportercooldownfxspawn = util::spawn_model("tag_origin", level.mainframetelefx.origin);
		PlayFXOnTag(level.telemainframecooldown, teleportercooldownfxspawn, "tag_origin");
		wait( level.cooldown_time );
		teleportercooldownfxspawn Delete(); 
	}
}


function checkplayerfunction()
{
	count = 0;
	foreach(player in GetPlayers())
	{
		if(player IsTouching(level.teleportdetectplayerzombies)) count++;
	}

	return count == GetPlayers().size;
}


function move_to_room_ee_roof( spawns, player_num )
{ 
	self thread lui::screen_flash( .1, 0.1, 1.0, 1.0, "white" );
	VisionSetNaked( "zombie_last_stand", 1);
	self SetElectrified( 4 ); 
	self playlocalsound( "kino_cooldown" ); 
	level waittill("initiatekinoteleportsequence"); 
	self notify("playerhasteleportedchilis");
	//IPrintLnBold("EE teleport triggered");
	PlaySoundAtPosition( "kino_beam_fx", self.origin ); 
	self stopsound( "kino_cooldown" );
	self playlocalsound( "kino_teleport_2d" );
	self disable_weap_states();
	self SetOrigin( level.black_spots[player_num].origin ); 
	self SetPlayerAngles( level.black_spots[player_num].angles ); 
	thread PlayFxWithCleanup(KINO_SWIRL, level.black_spots_targets[player_num].origin, 5);
	wait(4);
	VisionSetNaked( "zm_factory", 1);
	level notify("temporalenergycanisterscharged");
	level.fxhintitem Delete();
	self enable_weap_states();   
	self SetOrigin( spawns[player_num].origin );
	self SetPlayerAngles( spawns[player_num].angles);
	wait(0.05); 
	thread PlayFxWithCleanup(level.teleportbeamfxjaunt, self.origin, 5);
	self playsound( "kino_beam_fx" );
	self shellshock( "electrocution", 1);
}

function tele_to_room( time, num )
{
	level endon( "endallkinoteleports" );
	self move_to_rand_room( level.tele_room_spots, num ); 
	thread PlayFxWithCleanup(level.playerteleportfxplayer, self.origin, time);
	nsz_iprintlnbold( "The Amount of Time Spent in PaP is Customizable" ); 
	wait( time ); 
	self move_to_room( level.mainframe_spots, num ); 
	level thread telebeamfx();
}

function telebeamfx()
{
	thread PlayFxWithCleanup(level.teleportbeamfxjaunt, level.finaltelepadmodel.origin, 5);
}

function tele_to_temp_room( time, num )
{
	level endon( "endallkinoteleports" );
	self move_to_rand_room_temp( level.temp_rooms, num ); 
	thread PlayFxWithCleanup(level.playerteleportfxplayer, self.origin, time);
	self DisableWeapons(); 
	self DisableOffhandWeapons(); 
	nsz_iprintlnbold( "The Amount of Time Spent in PaP is Customizable" ); 
	wait( level.temp_room_time ); 
	self tele_to_room( time, num );
}

function tele_to_temp_room_thesource( time, num )
{
	level endon( "endallkinoteleports" );
	self move_to_rand_room_temp( level.thesourcespots, num, true); 
	thread PlayFxWithCleanup(level.playerteleportfxplayer, self.origin, time);
	self DisableWeapons(); 
	self DisableOffhandWeapons(); 
	nsz_iprintlnbold( "The Amount of Time Spent in PaP is Customizable" ); 
	//wait(2);
	//music plays
	self PlayLocalSound("demisechilisthesource");
	totaltime = 35;
	textarray = array("It's me again.", "I will speak this way forward.", "They cannot hear me.", "You've been here before.", "It all started here.", "For the good of us all, don't let these events repeat once again...");
	int = 0;
	foreach(string in textarray)
	{
		ClientPrint(self, "^3"+textarray[int]);
		wait(totaltime/textarray.size);
		int ++;
	}
	//wait(35); 
	self StopLocalSound("demisechilisthesource");
	self tele_to_room( time, num );
}


function teleporter_sounds()
{
	level endon( "endallkinoteleports" );
	level.teleport_trigger PlaySound( "kino_top_spark" ); 
	wait(0.5); 
	level.teleport_trigger PlaySound( "kino_arc_loop" ); 
	level.teleport_trigger PlaySound( "kino_top_spark" ); 
	wait(0.5); 
	level.teleport_trigger PlaySound( "kino_top_spark" ); 
	wait(2); 
	level.teleport_trigger PlaySound( "kino_beam_fx" ); 
}

function zom_watcher()
{
	time_to_wait = GetTime() + 3000; 
	while( GetTime() < time_to_wait )
	{
		zoms = GetAISpeciesArray( "axis" ); 
		for( i=0;i<zoms.size;i++ )
		{
			if( zoms[i] isTouching( self ) )
				zoms[i] Kill();
				//zoms[i] doDamage( zoms[i].health + 666, zoms[i].origin ); 
		}
		wait( 0.05 );
	}
}

function disable_weap_states()
{
	level endon( "endallkinoteleports" );
	self setstance( "stand" );
	self EnableInvulnerability();
	wait(0.1); 
	self DisableWeapons(); 
	self DisableOffhandWeapons(); 
	self freezecontrols( true ); 
}

function enable_weap_states()
{
	level endon( "endallkinoteleports" );
	self EnableWeapons(); 
	self EnableOffhandWeapons(); 
	self freezecontrols( false ); 
	wait(0.05);
	self DisableInvulnerability();
}

function move_to_room( spawns, player_num )
{ 
	level endon( "endallkinoteleports" );
	self SetElectrified( 3.5 ); 
	self playlocalsound( "kino_cooldown" ); 
	wait( 2.5 ); 
	PlaySoundAtPosition( "kino_beam_fx", self.origin ); 
	self stopsound( "kino_cooldown" );
	self playlocalsound( "kino_teleport_2d" );
	self disable_weap_states();
	self SetOrigin( level.black_spots[player_num].origin ); 
	self SetPlayerAngles( level.black_spots[player_num].angles ); 
	thread PlayFxWithCleanup(KINO_SWIRL, level.black_spots_targets[player_num].origin, 4);
	wait(2);
	self enable_weap_states();   
	self SetOrigin( spawns[player_num].origin );
	self SetPlayerAngles( spawns[player_num].angles);
	wait(0.05); 
	self playsound( "kino_beam_fx" );
}

function move_to_rand_room_temp( spawns, player_num, specialtp = false )
{ 
	level endon( "endallkinoteleports" );
	self SetElectrified( 3.5 ); 
	self playlocalsound( "kino_cooldown" ); 
	level waittill("initiatekinoteleportsequence");
	if(specialtp) self notify("playerhasteleportedchilis");
	//wait( 2.5 ); 
	PlaySoundAtPosition( "kino_beam_fx", self.origin ); 
	self stopsound( "kino_cooldown" );
	self playlocalsound( "kino_teleport_2d" );
	self disable_weap_states();
	self SetOrigin( level.black_spots[player_num].origin ); 
	self SetPlayerAngles( level.black_spots[player_num].angles ); 
	thread PlayFxWithCleanup(KINO_SWIRL, level.black_spots_targets[player_num].origin, 4);
	wait(2);
	self enable_weap_states(); 
	self SetOrigin( spawns[player_num].origin );
	self SetPlayerAngles( spawns[player_num].angles);
	wait(0.05); 
	self playsound( "kino_beam_fx" );
	//thread cooldown_choice( spawns[random] ); 
}
function move_to_rand_room( spawns, player_num )
{ 
	level endon( "endallkinoteleports" );
	self SetElectrified( 3.5 ); 
	self playlocalsound( "kino_cooldown" ); 
	wait( 2.5 ); 
	PlaySoundAtPosition( "kino_beam_fx", self.origin ); 
	self stopsound( "kino_cooldown" );
	self playlocalsound( "kino_teleport_2d" );
	self disable_weap_states();
	self SetOrigin( level.black_spots[player_num].origin ); 
	self SetPlayerAngles( level.black_spots[player_num].angles ); 
	thread PlayFxWithCleanup(KINO_SWIRL, level.black_spots_targets[player_num].origin, 4);
	wait(2);
	self enable_weap_states(); 
	
	//*random = RandomIntRange( 0, spawns.size ); 
	
	self SetOrigin( spawns[player_num].origin );
	self SetPlayerAngles( spawns[player_num].angles);
	wait(0.05); 
	self playsound( "kino_beam_fx" );
	//thread cooldown_choice( spawns[random] ); 
}

function nsz_iprintlnbold( string )
{
	if( isDefined(level.nsz_debug) && level.nsz_debug )
		iprintlnbold( "^6NSZ Debug:^7 "+string ); 
}

function wait_for_power()
{
	level.teleport_trigger SetCursorHint( "HINT_NOICON" ); 
	level.link_pad_trigger SetCursorHint( "HINT_NOICON" ); 
	level.teleport_trigger SetHintString( &"ZOMBIE_NEED_POWER" );
	level.link_pad_trigger SetHintString( &"ZOMBIE_NEED_POWER" );
	level.link_pad_trigger SetHintString( "" );
	level flag::wait_till( "power_on" ); 
}

function cooldown_choice( spawn )
{
	spawn.chosen_already = true; 
	wait(5); 
	spawn.chosen_already = undefined; 
}