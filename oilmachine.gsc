#using scripts\zm\_zm_utility;
#using scripts\codescripts\struct;
#using scripts\shared\flag_shared;
#using scripts\zm\_zm_bgb;
#using scripts\zm\_zm_score;
#using scripts\zm\zm_usermap;
#using scripts\codescripts\struct;

#using scripts\shared\array_shared;
#using scripts\shared\callbacks_shared;
#using scripts\shared\clientfield_shared;
#using scripts\shared\compass;
#using scripts\shared\exploder_shared;
#using scripts\shared\laststand_shared;
#using scripts\shared\math_shared;
#using scripts\shared\scene_shared;
#using scripts\shared\util_shared;

#insert scripts\shared\shared.gsh;
#insert scripts\shared\version.gsh;

#insert scripts\zm\_zm_utility.gsh;

#using scripts\zm\_load;
#using scripts\zm\_zm;
#using scripts\zm\_zm_audio;
#using scripts\zm\_zm_powerups;
#using scripts\zm\_zm_utility;
#using scripts\zm\_zm_weapons;
#using scripts\zm\_zm_zonemgr;
//#using scripts\zm\_zm_ai_mechz;
#using scripts\shared\ai\zombie_utility;
#using scripts\zm\_zm_ai_dogs;
#using scripts\Sphynx\_zm_subtitles;
//#using scripts\zm\zm_chilis;
#using scripts\_NSZ\roomserviceeasteregg;
//#using scripts\_redspace\rs_o_jump_pad;
//#using scripts\zm\_zm_ai_mechz;
#using scripts\shared\lui_shared;
#using scripts\zm\_zm_laststand;
#using scripts\shared\objpoints_shared;

#namespace jumpscare; 

#precache( "material", "eral" );
#precache( "material", "pigman_jumpscare" );
#precache( "material", "rhettscare" );
#precache( "material", "stuffmanscare" );
#precache( "material", "number2oil" ); 
#precache( "material", "amongscare" );
#precache( "material", "susscare" );
#precache( "material", "trollscare" );

#precache( "fx", "dlc0/factory/fx_teleporter_beam_factory" ); 
#precache("fx", "dlc2/zmb_weapon/fx_skull_quest_ritual_doorbarrier_island");
#precache( "fx", "dlc1/castle/fx_elec_teleport_flash_sm" );
#precache( "fx", "zombie/fx_ritual_barrier_defend_zod_zmb" );
#precache( "fx", "dlc1/castle/fx_ee_keeper_demongate_portal_open" );
#precache( "fx", "dlc1/castle/fx_ee_keeper_demongate_portal_loop" );
#precache( "fx", "dlc1/castle/fx_infused_115_airspace_sm_barricade_rise" );
#precache( "fx", "dlc1/castle/fx_castle_pap_teleport_parts_float_smk" );
#precache( "fx", "dlc1/castle/fx_ritual_key_soul_exp_igc" );
#precache("fx", "dlc2/zmb_weapon/fx_skull_quest_lightning_hit_island");
#precache( "fx", "dlc1/castle/fx_wolf_quest_platform_glow_loop");

#precache( "fx", "dlc5/theater/fx_teleport_initiate" );
#precache( "fx", "dlc4/genesis/fx_sophia_elec_charge_teleporter" );
#precache( "fx", "weapon/fx_hero_grvity_spk_grnd_hit_concrete" );
#precache( "fx", "zombie/fx_aat_fireworks_zmb" );
#precache("model", "p7_computer_mobile_military_open"); 
#precache("model", "p7_computer_mobile_military_open_mp4"); 
#precache("model", "p7_cai_security_monitor_mp4_off"); 
#precache("model", "p7_cai_security_monitor_mp4"); 
#precache("model", "amongusmemeer"); 


#precache( "material", "objpoint_default" );
#precache( "material", "newobjmarker" );



#define KINO_SWIRL2 "dlc5/theater/fx_teleport_initiate"
#define MOGUS_MODEL "amongusmemeer"
#precache( "fx", KINO_SWIRL2 );

function autoexec init()
{
	level waittill("initial_blackscreen_passed");
	level.newlightingfxaj = "dlc2/zmb_weapon/fx_skull_quest_lightning_hit_island";
	level.questroomtvs = GetEntArray("script_tv_moment", "targetname");
	level.dimensionalinstablefx = "dlc4/genesis/fx_sophia_elec_charge_teleporter";
	level.leavedoorbarrierfx = "dlc1/castle/fx_infused_115_airspace_sm_barricade_rise";
	level.oilappear = "dlc0/factory/fx_teleporter_beam_factory";
	level.oildisappear = "dlc1/castle/fx_elec_teleport_flash_sm";
	level.evilbarrier = "zombie/fx_ritual_barrier_defend_zod_zmb";
	level.bartenddoorfx = "dlc2/zmb_weapon/fx_skull_quest_ritual_doorbarrier_island";
	level.oilbottleplace = GetEnt("oilinitialplacebottle", "targetname");
	level.oilbottle = GetEnt("oilbottle", "targetname");
	level.oilbottletrig = GetEnt("oilbottletrig", "targetname");
	level.oilbottleteleport = GetEnt("oilbottlegrow", "targetname");
	level.oilbottleplacetrig = GetEnt("placeoil", "targetname");
	level.activatesequence = GetEnt("beginoilconversion", "targetname");
	level.oilpool = GetEnt("oilraiseheight", "targetname");
	level.oilpooldetect = GetEnt("oilpooldetect", "targetname");
	level.oilroomdetect = GetEnt("oildoordetect", "targetname");
	level.oilpoolbarrier = GetEnt("oilbarrier", "targetname");
	level.oilroombarrierz = GetEnt("oilfatdoor", "targetname"); 
	level.oiltelepad = GetEnt("oiltelepad", "targetname");
	level.oilsuccz = GetEnt("oilsucctubez", "targetname");
	level.screenchase = GetEnt("littlemoefadeschase", "targetname");
	level.screenlookat = GetEnt("littlemoelook", "targetname");
	level.teleporterdoorfxtest = "dlc2/zmb_weapon/fx_skull_quest_ritual_doorbarrier_island";
	level.militarypc = GetEnt("militarycomputeroilroom", "targetname");
	//level.screenhurt = GetEnt("littlemokill", "targetname");
	level.hallwayend = GetEnt("hallwaychaseend", "targetname");
	level.hallwayhint = GetEnt("hallwayrunhint", "targetname");
	level.killcheck = GetEnt("playerkillerchasecheck", "targetname");
	level.spawnportal = GetEnt("portalexitspawnhall","targetname");
	level.oildoorautomatic = GetEnt("oildoormechanical", "targetname");
	level.portalopen = "dlc1/castle/fx_ee_keeper_demongate_portal_open";
	level.portalloop = "dlc1/castle/fx_ee_keeper_demongate_portal_loop";
	level.fxwoodplanckdoor = GetEnt("fx_woodplanckoilroom", "targetname");
	//level.redfxdoor = GetEnt("reddoorfxoil", "targetname");

	//Oil door open/detect
	level.oildoorsussydetectclip = GetEnt("loweroildetectdoorclip", "targetname");
	level.oildoorsussydetectmodel = GetEnt("loweroildetectdoor", "targetname");
	level.oildoorsussydetecttrig = GetEnt("oildoordetectplayerdistance", "targetname");
	level.oildoorsussydetecthint = GetEnt("oildoordetecthintstring", "targetname");
	level.oildoorsussydetecthint SetHintString( &"ZOMBIE_NEED_POWER" );
	level.oildoorsussydetecthint SetCursorHint("HINT_NOICON");
	level.mogusappeareffect = "dlc1/castle/fx_castle_pap_teleport_parts_float_smk";
	level.moguskill = "dlc1/castle/fx_ritual_key_soul_exp_igc";
	level.amongusmusicalfirststepmodel = GetEnt("amongusmeemeractivatemusicalee", "targetname");
	level.amongusmusicalfirststeptrig = GetEnt("amongusmeemeractivatemusicaleetrig", "targetname");
	wait(0.05);
	//end odo/d
	level.redfxdoor hide();
	level.fxwoodplanckdoor hide();
	level.spawnportal hide();
	level.oilbottleplace hide();
	level.oilbottleteleport hide();
	level.growsize = 1;
	//level.oilroombarrier MoveZ(-200,1);
	//thread waitforoil();
	thread pickupoil();
	thread oilwaitforpower();
	thread amogusmusicalitems();
	level.oilroombarrierz MoveZ(-135,0.5);
	
	thread startamongusmusicalee();
	//Hallway Door Jumpscare items
}

function startamongusmusicalee()
{
	level.amongusmusicalfirststepmodel thread spinstartquestyamogius();
	level.amongusmusicalfirststepmodel PlayLoopSound("mogusloopominous");
	moguseffect = util::spawn_model("tag_origin", level.amongusmusicalfirststepmodel.origin);
	WAIT_SERVER_FRAME;
	PlayFXOnTag(level.mogusappeareffect, moguseffect, "tag_origin");
	level.amongusmusicalfirststeptrig waittill("trigger", player);
	earthQuake(.6, 3, player.origin, 1500);
	level.amongusmusicalfirststepmodel PlaySound("moguskillsound");
	level.amongusmusicalfirststepmodel StopLoopSound("mogusloopominous");
	//kill noise and end loop sound
	moguseffect Delete();
	moguseffect2 = util::spawn_model("tag_origin", level.amongusmusicalfirststepmodel.origin);
	WAIT_SERVER_FRAME;
	PlayFXOnTag(level.moguskill, moguseffect, "tag_origin");
	moguseffect2 Delete();
	level.amongusmusicalfirststepmodel Delete();
	level notify("startamongusmusicalquest");
}

function spinstartquestyamogius()
{
	self endon("death");
	while(1)
	{
		self RotateYaw(360, 2);
		wait(2);
	}
}

function _mogus_init()
{
  level.amogusmusicalfigurescount++;
  self.mogusmodel = util::spawn_model(MOGUS_MODEL, self.origin);
  wait(0.05);
  self.mogusmodel SetScale(0.13);
  mogusmodel = self.mogusmodel;
  mogusmodel RotateTo(self.angles, 0.05);
  //mogusmodel RotatePitch(-90, 0.05);
  wait(0.05);
  self.mogusmodel thread spinmogus();
  self.mogusmodel thread mogusdamagefunc();
}

function amogusmusicalitems()
{
	level.amongusmusicalactive = false;
	//amongus musical easter egg
	//re-coded to spawn in models on the fly.
	//amogusmusicalfigures = struct::get_array("amogusentryeemodelmus","targetname");
	amongusmusicalgang = struct::get_array("amongusmusicalgang","targetname");
	amongusmusicaltelespots = struct::get_array("amongusmusicaltelespots","targetname");
	amongusmusicalrewardspots = struct::get_array("amonguspowerupspot","targetname");
	hideduringmongus = GetEntArray("hideduringmongus", "targetname");
	mongusscreen = GetEnt("mongusscreen", "targetname");

	enteramongusmusicaltrig = GetEnt("entertheamongusmusicaltrig", "targetname");
	enteramongusmusicaltrig SetHintString("");
	level.amogusmusicalfigurescount = 0;
	level waittill("startamongusmusicalquest");
	level thread amoguswall();
	//spawn in a model and add it to the amongusmusicalfiguresarray
	array::thread_all(struct::get_array("amogusentryeemodelmus","targetname"), &_mogus_init);
	level waittill("allmogusesshot");
	//enteramongusmusicaltrig PlaySound("success");
	PlaySoundAtPosition("vox_foundallamongus",(0,0,0));
	IPrintLnBold("Return to where you last saw amongus");
	level thread zm_subtitles::subtitle_display(undefined, 1, "Amogus", "Oh you found all of me. HAHAHAHAHA. But I don't think anything could prepare you for this suprise..");
	wait(2);
	level thread zm_subtitles::subtitle_display(undefined, 1, "Amogus", "But I don't think anything could prepare you for this suprise..");
	fxspot = util::spawn_model("tag_origin", enteramongusmusicaltrig.origin);
	PlayFXOnTag("dlc1/castle/fx_wolf_quest_platform_glow_loop", fxspot, "tag_origin");
	fxspot PlayLoopSound("soulambloop", 0.5);
	enteramongusmusicaltrig SetHintString("Press ^2[{+activate}]^7 To Go To The Amongus Musical, All Players Are Needed");
	//code to make sure all players are nearby and the level isn't branched.
	while(1)
	{
		players = GetPlayers();
		playersinrange = 0;
		enteramongusmusicaltrig waittill("trigger", player);
		foreach(player in GetPlayers())
		{
			///if(player IsTouching(radius))
			if(Distance(player.origin, enteramongusmusicaltrig.origin)<= 145)
			{
				playersinrange ++;
			}
		}
			if(playersinrange == players.size && !level.islevelbranch)
			{
				break;
			}
		wait(0.05);
	}
	level notify("storycriteescene");
	level notify("videoscreenquestended");
	//level thread killzombiesingoldroomuntil("endamongusmusical");
	fxspot StopLoopSound(0.5);
	enteramongusmusicaltrig Delete();
	fxspot Delete();
	level.amongusmusicalactive = true;
	//COMMENT FOR TESTING!!!!
	//level thread enablezombies(false);
	foreach(player in GetPlayers())
	{
		player thread bunnyscare();
		player thread lui::screen_fade_out(0.5, "white");
		player.ignoreme = true;
		player EnableInvulnerability();
	}
	wait(0.5);
	level notify("videoscreenquest");
	mongusscreen MoveZ(1240, 0.05);
	level util::set_lighting_state(3);
	foreach(curtain in level.westonblackcurtains)
	{
		curtain MoveZ(1000, 0.05);
	}
	//hideduringmongus
	foreach(hideitem in hideduringmongus)
	{
		hideitem Hide();
	}
	foreach(player in GetPlayers())
	{
		player freezecontrols( true );
		player StopLocalSound( "loudnigra" );
		player SetOrigin(amongusmusicaltelespots[player.characterIndex].origin);
        player SetPlayerAngles(amongusmusicaltelespots[player.characterIndex].angles);
	}
	wait(1.5);
	foreach(player in GetPlayers())
	{
		player thread lui::screen_fade_in(1.5);
		player freezecontrols( false );
	}
	wait(1.5);
	amongusgangmodels = array();
	foreach(spot in amongusmusicalgang)
	{
		mongus = util::spawn_model(spot.model, spot.origin);
		WAIT_SERVER_FRAME;
		mongus SetScale(spot.modelscale);
		mongus RotateTo(spot.angles, 0.05);
		mongus.mogusint = spot.script_int;
		PlayFXOnTag("weapon/fx_hero_grvity_spk_grnd_hit_concrete", mongus, "tag_origin");
		array::add(amongusgangmodels, mongus);
		wait(0.5);
	}
	wait(0.10);
	VideoStart("milomorbdance",true);
	foreach(player in GetPlayers())
	{
		player PlayLocalSound("amongusdripchilis");
	}
	foreach(amongus in amongusgangmodels)
	{
		if(amongus.mogusint == 1)
		{
			amongus SetScale(0.6);
			amongus thread spinmogusmusical();
			PlayFXOnTag("zombie/fx_aat_fireworks_zmb", amongus, "tag_origin");
		}
		else
		{
			amongus SetScale(0.45);
		}
	}
	time = SoundGetPlaybackTime("amongusdripchilis")/1000;
  	wait(time);
	foreach(player in GetPlayers())
	{
		player FreezeControls(false);
		player thread lui::screen_fade_out(0.5, "white");
	}
	wait(0.5);
	VideoStop("milomorbdance");
	level util::set_lighting_state(0);
	foreach(amongus in amongusgangmodels)
	{
		PlayFXOnTag("weapon/fx_hero_grvity_spk_grnd_hit_concrete", amongus, "tag_origin");
		amongus notify("killmogus");
		wait(0.05);
		amongus Delete();
	}
	wait(1.0);
	mongusscreen Delete();
	foreach(hideitem in hideduringmongus)
	{
		hideitem Show();
	}
	level.amongusmusicalactive = false;
	foreach(curtain in level.westonblackcurtains)
	{
		curtain MoveZ(-1000, 0.05);
	}
	foreach(player in GetPlayers())
	{
		player thread lui::screen_fade_in(1.5);
		player freezecontrols( false );
	}
	level thread zm_powerups::specific_powerup_drop("free_perk", amongusmusicalrewardspots[0].origin+(0,0,-38), undefined, undefined, undefined, undefined, false );
	level thread zm_powerups::specific_powerup_drop("full_ammo", amongusmusicalrewardspots[1].origin+(0,0,-38), undefined, undefined, undefined, undefined, false );
	level thread zm_powerups::specific_powerup_drop("fire_sale", amongusmusicalrewardspots[2].origin+(0,0,-38), undefined, undefined, undefined, undefined, false );
	level thread enablezombies(false);
	wait(3);
	foreach(player in GetPlayers())
	{
		player.ignoreme = false;
		player DisableInvulnerability();
	}
	level thread enablezombies(true);
	level notify("videoscreenquestended");
	level notify("storycritsceneended");
	level notify("endamongusmusical");
	//thread for each character and count the total amount of characters store this number. set each character able to be damaged and recheck the count after one is shot. if the count equals zero something happens. make each character play fx and spin too.
	//dlc1/castle/fx_castle_pap_teleport_parts_float_smk idle
	//fx_ritual_key_soul_exp_igc when shot
	//play cool sounds too, a looping ambiuent and a destroyed noise.
}

function killzombiesingoldroomuntil(stringnotify)
{
	level endon(stringnotify);
	goldroomtrigger = GetEnt("goldroomdetect","target");
    while(1)
    {
      zombs = GetAiSpeciesArray( level.zombie_team, "all" );
      for(k=0;k<zombs.size;k++)
      {
        if( zombs[k] IsTouching( goldroomtrigger ) )
        {
          zombs[k] Kill();
        }
      }
      wait(2);
    }
}

function spinmogusmusical()
{
	self endon("death");
	while(1)
	{
		self RotateYaw(360, 1);
		wait(1);
	}
}


function amoguswall()
{
	moguswall = GetEnt("moguswalldmgtrig", "targetname");
	moguswalldelete = GetEnt("moguswalldelete", "targetname");
	moguswall waittill("trigger", player);
	moguswalldelete PlaySound("moguskillsoundwall");
	moguswall Delete();
	moguswalldelete Delete();
}

function checkamoguscount()
{
	///amongusmusicaleasteregg
	if(level.amogusmusicalfigurescount == 0)
	{
		level notify("allmogusesshot");
	}
	else
	{
		IPrintLnBold (level.amogusmusicalfigurescount + " left.");
		break;
	}
}

function spinmogus()
{
	self endon("death");
	while(1)
	{
		self RotateYaw(360, 2);
		wait(2);
	}
}

function mogusdamagefunc()
{
	//loop sound here
	self PlayLoopSound("mogusloopominous");
	moguseffect = util::spawn_model("tag_origin", self.origin);
	WAIT_SERVER_FRAME;
	PlayFXOnTag(level.mogusappeareffect, moguseffect, "tag_origin");
	self SetCanDamage(1);
	self waittill( "damage");
	self PlaySound("moguskillsound");
	self StopLoopSound("mogusloopominous");
	//kill noise and end loop sound
	moguseffect Delete();
	WAIT_SERVER_FRAME;
	PlayFXOnTag(level.moguskill, moguseffect, "tag_origin");
	self Delete();
	level.amogusmusicalfigurescount --;
	level thread checkamoguscount();
}

function goto_round(round_number = undefined)
{
    if(!isdefined(round_number))
        round_number = zm::get_round_number();
    if(round_number == zm::get_round_number())
        return;
    if(round_number < 0)
        return;

    // kill_round by default only exists in debug mode
    /#
    level notify("kill_round");
    #/
    // level notify("restart_round");
    level notify("end_of_round");
    level.zombie_total = 0;
    zm::set_round_number(round_number);
    round_number = zm::get_round_number(); // get the clamped round number (max 255)

    zombie_utility::ai_calculate_health(round_number);
    SetRoundsPlayed(round_number);

    foreach(zombie in zombie_utility::get_round_enemy_array())
    {
        zombie Kill();
    }

    if(level.gamedifficulty == 0)
        level.zombie_move_speed = round_number * level.zombie_vars["zombie_move_speed_multiplier_easy"];
    else
        level.zombie_move_speed = round_number * level.zombie_vars["zombie_move_speed_multiplier"];

    level.zombie_vars["zombie_spawn_delay"] = [[level.func_get_zombie_spawn_delay]](round_number);

    level.sndGotoRoundOccurred = true;
    level waittill("between_round_over");
}

function oilwaitforpower()
{

	level.oilbottletrig SetCursorHint("HINT_NOICON");
	level.oilbottletrig SetHintString("");
	level.oilbottleplacetrig UseTriggerRequireLookAt();
	level.activatesequence UseTriggerRequireLookAt();
	level.oilbottleplacetrig SetHintString( &"ZOMBIE_NEED_POWER" );
	level.activatesequence SetHintString( &"ZOMBIE_NEED_POWER" );
	level.oilbottleplacetrig SetCursorHint("HINT_NOICON");
	level.activatesequence SetCursorHint("HINT_NOICON");
	level flag::wait_till( "power_on" ); 
	level.militarypc PlayLoopSound("tower_radio_lp");
	level.oilbottleplacetrig SetHintString("Requires Oil");
	level.oiltankshoweractivate SetCursorHint("HINT_NOICON");
	level.activatesequence SetHintString("Oil Required For Synthesis Activation.");
	level.oildoorsussydetecthint SetHintString( &"ZOMBIE_NEED_POWER" );
	level.oildoorsussydetecthint SetCursorHint("HINT_NOICON");
	thread oildooropendetect();
}

function oildooropendetect()
{
	level.oildoorsussydetecthint UseTriggerRequireLookAt();
	level.oildoorsussydetecthint SetHintString( "Oil required for entry." );
	level.oildoorsussydetecthint SetCursorHint("HINT_NOICON");
	level.oilsussyint = 0;
	wait(10);
	thread oildoorsequenceactivate();
	level waittill("oilgrabbed");
	level.oilsussyint = 1;
	level.oildoorsussydetecttrig waittill("trigger", player);
	level thread speak_to_players("vox_terminalai_oildetected");
	thread zm_subtitles::subtitle_display(undefined, 3, "^5Chili's Lab", "Oil signature detected. Welcome, Dr. Chungus...");
	level.oildoorsussydetectclip PlaySound("computerterminalcomplete");
	wait(0.5);
	level.oildoorsussydetectclip MoveZ(-144,1.5);
	level.oildoorsussydetectmodel MoveZ(-144,1.5);
	level.oildoorsussydetectmodel PlaySound("dooropen_1");
	level.oildoorsussydetecthint Delete();
	level.oildoorsussydetecttrig Delete();
	thread waitforoil();
	wait(2);
	level.oildoorsussydetectclip Delete();
	level.oildoorsussydetectmodel Delete();
}

function oildoorsequenceactivate()
{
	while(1)
	{
		level endon("oilgrabbed");
		level.oildoorsussydetecttrig waittill("trigger", player);
		if(level.oilsussyint == 0)
		{
			PlaySoundAtPosition("aetherdoorfail", level.oildoorsussydetecttrig.origin);
			wait(0.3);
			PlaySoundAtPosition("vox_terminalai_nooildetected", level.oildoorsussydetecttrig.origin);
			thread zm_subtitles::subtitle_display(undefined, 3, "^5Chili's Lab", "Oil not detected, entry denied...");
			wait(3.0);
		}
		else
		{
			break;
		}
		wait(2.5);
	}
}

function pickupoil()
{
	level waittill("amongusconvo");
	level waittill("codenum_solved");
	wait(0.5);
	level.oilbottletrig SetCursorHint("HINT_NOICON");
	level.oilbottletrig SetHintString("Hold ^2[{+activate}]^7 To Pick Up Meme Oil");
	level.oilbottletrig UseTriggerRequireLookAt();
	level.oilbottletrig waittill("trigger", player);
	level notify("oilgrabbed");
	player PlaySound("zmb_craftable_pickup");
	level.oilbottletrig Delete();
	//PlayFX(level._effect["powerup_grabbed"], level.oilbottle.origin);
	thread PlayFxWithCleanup(level._effect["powerup_grabbed"], level.oilbottle.origin);
	level.oilbottle Delete();
	level notify("oilgrabbed");
}

function waitforoil()
{
	level.oilbottleplacetrig SetCursorHint("HINT_ACTIVATE");
	level.oilbottleplacetrig SetHintString("Press ^2[{+activate}]^7 To Place Oil On Teleport Pad");
	level.oilbottleplacetrig waittill("trigger", player);
	level.oilbottleplace show();
	wait(1);
	//PlayFX(level.oildisappear, level.oilbottleplace.origin);
	thread PlayFxWithCleanup(level.oildisappear, level.oilbottleplace.origin);
	level.oiltelepad PlaySound("oilteleport");
	wait(.2);
	level.oilbottleplace hide();
	level.oilbottleplacetrig SetCursorHint("HINT_NOICON");
	level.oilbottleplacetrig SetHintString("Oil Teleported To Expansion Chamber");
	wait(0.8);
	//PlayFX(level.oilappear, level.oilbottleteleport.origin);
	thread PlayFxWithCleanup(level.oildisappear, level.oilbottleteleport.origin);
	level.oiltelepad PlaySound("oilappear");
	level.oilbottleplace Delete();
	wait(.4);
	level.oilbottleteleport show();
	wait(0.2);
	level.activatesequence SetCursorHint("HINT_ACTIVATE");
	level.activatesequence SetHintString("Press ^2[{+activate}]^7 To Activate Expansion Sequence [Requires All Players]");
	level.activatesequence waittill("trigger", player);
	while(1)
			{
				players = GetPlayers();
				playersinrange = 0;
				level.activatesequence waittill("trigger", player);
				foreach(player in GetPlayers())
				{
					///if(player IsTouching(radius))
					if(Distance(player.origin, level.activatesequence.origin)<= 115)
					{
						playersinrange ++;
					}
				}
				if(playersinrange == players.size && !level.islevelbranch)
				{
					break;
				}
				wait(0.05);
			}
	//level.oilroomdetect waittill("trigger", player);
	level.activatesequence PlaySound( "kino_activate_start" );
	wait(0.1);
	level.oilroombarrierz MoveZ(135,0.1);
	level thread beginshower();
}

function teleport_aftereffect_fov()
{
	util::setClientSysState( "levelNotify", "tae", self );
}
function turnonmilitarypcscreen(bool, int)
{
	/*/
	if(bool == true && int == undefined)
	{
		self SetModel("p7_computer_mobile_military_open_mp4");
	}
	/*/
	if(bool == true && int == 1)
	{
		self SetModel("p7_computer_mobile_military_open_mp4");
		wait(60);
		self SetModel("p7_computer_mobile_military_open");
	}
	else
	{
		self SetModel("p7_computer_mobile_military_open");
	}
}

function changetvmodel()
{
	foreach(tv in level.questroomtvs)
	{
		tv SetModel("p7_cai_security_monitor_mp4_off");
	}
	level waittill("playercoveredinoil");
	foreach(tv in level.questroomtvs)
	{
		tv SetModel("p7_cai_security_monitor_mp4");
	}	
}
function enablezombies(bool)
{
	if(!bool)
	{
		level flag::clear( "spawn_zombies" );
		level flag::clear( "zombie_drop_powerups");
		zombies = GetAiSpeciesArray( level.zombie_team, "all" );
		level.zombie_respawns += zombies.size;
	    level.zombie_total += zombies.size;
	      foreach(zombie in zombies)
	      {
	      	zombie Kill();
	      }
	      //loop setting flags to prevent possible problems
	   //   while(1)
	    //  {
	     // 	level flag::clear( "spawn_zombies" );
		//	level flag::clear( "zombie_drop_powerups");
		//	wait(0.05);
	     // }
	}
	else
	{
			level flag::set( "spawn_zombies" );
			level flag::set( "zombie_drop_powerups");
	}
}

function beginshower()
{
	level notify("videoscreenquest");
	level thread enablezombies(false);
	level.fxwoodplanckdoor PlaySound("oilappear");
	fxModellockdoor = util::spawn_model("tag_origin", level.fxwoodplanckdoor.origin);
	WAIT_SERVER_FRAME;
	PlayFXOnTag(level.teleporterdoorfxtest, fxModellockdoor, "tag_origin");
	level notify("startlockdown");
	level.militarypc thread turnonmilitarypcscreen(true, 1);
	VideoStart("oilconvert",false);
	foreach( player in GetPlayers())
    {
        player PlayLocalSound("loonboon"); 
    }
	level.oilbottleteleport playsound( "oilgrow" );
	level thread speak_to_players("vox_terminalai_lockdownstarted");
	thread zm_subtitles::subtitle_display(undefined, 3, "^5Chili's Lab", "Oil expansion In Progress, Lockdown In Effect...");
	level.activatesequence SetHintString("Expansion In Progress, Lockdown In Effect...");
	level.oilbottleplacetrig SetHintString("Expansion In Progress, Lockdown In Effect...");
	level thread spawn_panzers();
	level thread growoil();
	wait(50);
	powerupspotoilholdout = struct::get("powerupspotoilholdout", "targetname");
	level thread zm_powerups::specific_powerup_drop("full_ammo", powerupspotoilholdout.origin, undefined, undefined, undefined, undefined, false );
	level.activatesequence PlaySound( "kino_activate_start" );
	level.oilsucc PlaySound("tubeextract");
	level.oilsuccz MoveZ(-15,2);
	wait(.5);
	level notify( "oiltankfilling" );
	level thread killthezombies();
	WAIT_SERVER_FRAME;
	//PhysicsExplosionCylinder(level.activatesequence.origin, 800, 300, 25);
    wait(2);
    level.oilsucc PlayLoopSound("succnoise");
    level.oilpool PlaySound( "oilslosh" );
    level.oilpool MoveZ(81,8);
    thread zm_subtitles::subtitle_display(undefined, 3, "^5Chili's Lab", "Dispensing Oil.....");
    wait(8);
    foreach( player in GetPlayers())
    {
        player PlayLocalSound("vox_terminalai_oilexpansioncomplete"); 
    }
    level.oilsucc StopLoopSound(0.3);
    level.activatesequence SetCursorHint("HINT_NOICON");
	level.activatesequence SetHintString("Oil Expansion Complete, Please Submerge Yourself In The Oil");
	level.oilbottleplacetrig SetCursorHint("HINT_NOICON");
	level.oilbottleplacetrig SetHintString("Oil Expansion Complete, Please Submerge Yourself In The Oil");
	level.oilpoolbarrier MoveZ(-144,1.5);
	level.oildoorautomatic MoveZ(-144,1.5);
	level.oildoorautomatic PlaySound("dooropen_1");
	//make invincible here
	level thread makeplayersinvincible();

	wait(0.5);
	level.oilpooldetect waittill("trigger", player);
	level thread disable_guns();
	wait(2);
	level thread speak_to_players("vox_command_dimesionalbreakdown");
	thread zm_subtitles::subtitle_display(undefined, 2, "^2Mission Command", "Dimensional stability is breaking down.!! WE'RE LOSING THEM.!!");
	level thread dimensionalbreakallplayers();
	level.oildoorautomatic PlaySound("dooropen_2");
	level.oilpoolbarrier MoveZ(144,1.5);
	level.oildoorautomatic MoveZ(144,1.5);
	//level thread instakillplayer();
	level waittill("teleporttohall");
	
	level thread changetvmodel();
	VideoStop("oilconvert");
	level thread chase_scene();
	level waittill("playerescapehall");
	level.activatesequence SetCursorHint("HINT_NOICON");
	level.activatesequence SetHintString("");
	level.oilbottleplacetrig SetCursorHint("HINT_NOICON");
	level.oilbottleplacetrig SetHintString("");
    level notify( "playercoveredinoil" );
    level thread enable_guns();
    level.fxwoodplanckdoor PlaySound("oilappear");
	//PlayFX(level.leavedoorbarrierfx, level.fxwoodplanckdoor.origin);
	thread PlayFxWithCleanup(level.leavedoorbarrierfx, level.fxwoodplanckdoor.origin);
    //level.oilroombarrierz Delete();
    fxModellockdoor Delete();
    level.oilroombarrierz MoveZ(-135,0.5);
    level.fxwoodplanckdoor Delete();
    oil_launch_check = GetEnt("oil_launch_check", "targetname");
    //level.redfxdoor Delete();
    foreach(player in GetPlayers())
    {
    	player thread zm::spectator_respawn_player();
    }
    wait(3);
    level thread speak_to_players("vox_terminalai_coveredinoil");
	thread zm_subtitles::subtitle_display(undefined, 3, "^5Chili's Lab", "You are now covered in oil. Plot restricted flight capabilities are now available.");
	oil_launch_check thread objectivemarkercustom();
	wait(7);
	level thread speak_to_players("vox_command_thoughtlostyou");
	thread zm_subtitles::subtitle_display(undefined, 3, "^2Mission Command", "Good to see you back, I thought we lost you there.");
	wait(4);
	thread zm_subtitles::subtitle_display(undefined, 3, "^2Mission Command", "Your designated flight spot is in the second parking lot outside of Chili's, its marked by a blue aura.");

	//level thread killthezombies();
    //level thread enablezombies(false);
    level thread enablezombies(true);
    //level thread goto_round(zm::get_round_number() + 1);
   // level thread increaseroundz();
    wait(15);
    level notify("videoscreenquestended");
    
}

function objectivemarkercustom()
{
	newobjemarker = objPoints::create("computerobjmark", self.origin, "all", "newobjmarker", 0.8);
    newobjemarker SetWayPoint(0, "newobjmarker", 0);
    while(1)
    {
    	 self waittill("trigger", player);
    	 if(isPlayer(player)) break;
    	 wait(0.05);
    }
	objPoints::delete(newobjemarker);
}



function PlayFxWithCleanup(fx, origin, duration = 1.5)
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

function makeplayersinvincible()
{
		foreach(player in GetPlayers())
		{
				player EnableInvulnerability();
		}
}

function killthezombies()
{
	zombies = GetAiSpeciesArray( level.zombie_team, "all" );
        if ( isdefined( zombies ) )
        {
        	level.zombie_respawns += zombies.size;
        	level.zombie_total += zombies.size;
        	WAIT_SERVER_FRAME;
        	//players = GetPlayers();
        	//player = array::random(players);
        	//zm_powerups::specific_powerup_drop( "nuke", player.origin );
            array::run_all( zombies, &Kill );
        }
}

function spawn_panzers()
{
	level endon("oiltankfilling");
	//level flag::clear( "spawn_zombies" );
	
	while(1)
	{
		//level endon("cookcompleted");
		//level flag::clear( "spawn_zombies" );
		zombies = GetAiSpeciesArray( level.zombie_team, "all" );
		if(zombies.size < 25)
		{
			//zombie_utility::set_zombie_run_cycle( "super_sprint" );
			//zombies = GetAiSpeciesArray( level.zombie_team, "all" );
		
			e_ai = zombie_utility::spawn_zombie( level.zombie_spawners[ 0 ] );
			e_ai zombie_utility::set_zombie_run_cycle_override_value( "sprint" );
			e_ai thread no_points();
	        e_ai._rise_spot = array::random( struct::get_array( "infinite_quest_sprinter", "targetname" ) );
	        e_ai.ignore_enemy_count = 0;

	        players = GetPlayers();
	        if(players.size > 1)
	        {
	        	wait(1);
	        }
	        else
	        {
	        	wait(1.5);
	        }
		}
		WAIT_SERVER_FRAME;
	}
}

function no_points(n_state = true)
{
    self.no_damage_points = n_state;
    self.deathpoints_already_given = n_state;
}


function speak_to_players( sound )
{
    players = GetPlayers(); 
    foreach( player in players )
    {
        player PlayLocalSound( sound ); 
    }
}

function increaseroundz()
{
    level.roundjaunt = level.round_number;
    level.roundjaunt++;
    zombies = GetAiSpeciesArray( level.zombie_team, "all" );
        if ( isdefined( zombies ) )
        {
            array::run_all( zombies, &Kill );
        }
    level thread zm_utility::zombie_goto_round(level.roundjaunt);
    //IPrintLnBold ("roundshifted");
}

function growoil()
{
	level.growjaunt = 0.01875;
	for(i=0;i<373;i++)
    {
    	level endon ("oiltankfilling");
    	level.growsize = level.growsize + level.growjaunt;
    	level.oilbottleteleport SetScale(level.growsize);
    	wait(0.13404826);
    }
}

function teleporttofinalposoil()
{	
		//self SetElectrified( 1.0 );
		self setstance( "stand" );
		wait(0.1);
        self playlocalsound( "kino_teleport_2d" );
        self DisableWeapons();
        self DisableOffhandWeapons();
        self freezecontrols( true );
        self SetOrigin( level.black_spots[self.characterIndex].origin ); 
        self SetPlayerAngles( level.black_spots[self.characterIndex].angles );
        //playfx( KINO_SWIRL2, level.black_spots_targets[self.characterIndex].origin ); 
        thread PlayFxWithCleanup(KINO_SWIRL2, level.black_spots_targets[self.characterIndex].origin);
        wait(2);
        self EnableWeapons(); 
        self EnableOffhandWeapons(); 
        self freezecontrols( false );
        self SetOrigin(level.oilendposition[self.characterIndex].origin);
        self SetPlayerAngles(level.oilendposition[self.characterIndex].angles);
        //PlayFX(level.oildisappear, self.origin);
        thread PlayFxWithCleanup(level.oildisappear, self.origin);
        self StopLoopSound(1);
        wait(0.05); 
        self playlocalsound( "kino_beam_fx" );
        self setstance( "stand" );
}

function teleportplayersmoment()
{
	level.oilendposition = struct::get_array( "oilroomspawn", "targetname" );  // use structs instead of script_origins as they don't go towards the entity limit
    level.black_spots = struct::get_array( "black_orgs", "targetname" );
    level.tpamount = 0;
    //level thread playerdeathcallback();
    level.black_spots_targets = []; 
    for( i=0;i<level.black_spots.size;i++ )
    {
		level.black_spots_targets[i] = struct::get( level.black_spots[i].target, "targetname" );
    }
    level thread managefinaloilteleport();
	while(level.teleportertimer != 0)
	{
		level.hallwayend waittill("trigger", player);
		player thread teleporttofinalposoil();
		wait(0.05);
	}
}

function managefinaloilteleport()
{	
		level waittill("playerreturnoilnotifyzz");
		//thread zm_subtitles::subtitle_display(undefined, 2, "The OG Memer", "I thought we lost you there. Things will only get more chaotic from here...");
		level.screenchase StopLoopSound(0.1);
	    level notify("playerescapehall");
        VideoStop("runchase");
        level.spawnportal StopLoopSound(0.5);
        level.spawnportal Delete();
        level.hallwayhint Delete();
        level.screenchase Delete();
        level.hallwayhint Delete();
        
}



function teleporttoevilhallway()
{
        level thread fade_all_players();
        level thread speak_to_players("success");
        wait(1);
        level thread disable_movement();
        level.screenchase PlayLoopSound("hallwayalarm");
        players = GetPlayers();
        foreach(player in players)
        {
        	player thread teleporttoevilhallwaynodelay();
        }
}

function teleporttoevilhallwaynodelay()
{
	oilhallway2 = struct::get_array( "evilredhallway", "targetname" );  // use structs instead of script_origins as they don't go towards the entity limit
	self EnableInvulnerability();
    self SetOrigin(oilhallway2[self.characterIndex].origin);
    self SetPlayerAngles(oilhallway2[self.characterIndex].angles);
    //PlayFX(level.oildisappear, self.origin);
    thread PlayFxWithCleanup(level.oildisappear, self.origin);
    wait(1);
    self DisableInvulnerability();
}

function teleporttonormalhallway()
{
		level thread fade_all_players();
        level thread speak_to_players("success");
        level thread zm_audio::sndMusicSystem_StopAndFlush();
        //stop round sounds hopefully?
        wait(1);
        players = GetPlayers();
        foreach(player in players)
        {
        		player thread teleporttonormalhallwaynodelay();
        		//player PlayLocalSound("theroaddistorted");
        		player PlayLocalSound("scaryhalltheme");
        }
        players[0] PlayLoopSound("ghostwhispers_lp");
        //Hallway Door Jumpscare items
		level.scarescreen = GetEnt("scaryjumpscarescreen","targetname");
		level.knockdoors = GetEntArray("hallwaydoorknock","targetname");
		level.scarescreendetect = GetEnt("knockeedoorscare", "targetname");
		level.scarescreen hide();
		level.knockcounter = 0;
		foreach(door in level.knockdoors)
		{
			door UseTriggerRequireLookAt();
			door thread doorquestknock();
			door thread questy153moment();
		}
		level.questycodenumber = 0;
		wait(4);
		level thread speak_to_players("vox_terminalai_heslying");
		thread zm_subtitles::subtitle_display(undefined, 3, "^1Unknown", "He's lying...");
}

function questy153moment()
{
	level endon("fail153doorknockquest");
	level endon("doorqueesteneded");
	firstint = 1;
	secondint = 5;
	thirdint = 3;
	level.currentquestyint = firstint;
	self waittill("trigger", player);
	switch(level.questycodenumber)
	{
		case 0:
		{
			if(self.script_int == firstint)
			{
				//thread zm_subtitles::subtitle_display(undefined, 3, "^5Chili's Lab", "1");
				currentint = secondint;
				level.questycodenumber ++;
			}
			else
			{
				level notify("fail153doorknockquest");
			}
			break;
		}
		case 1:
		{
			if(self.script_int == secondint)
			{
				//thread zm_subtitles::subtitle_display(undefined, 3, "^5Chili's Lab", "5");
				currentint = thirdint;
				level.questycodenumber ++;
			}
			else
			{
				level notify("fail153doorknockquest");
			}
			break;
		}
		case 2:
		{
			if(self.script_int == thirdint)
			{
				//thread zm_subtitles::subtitle_display(undefined, 3, "^5Chili's Lab", "3");
				level thread hallwayjumpscare();
				self PlaySound("screamingscary");
				level notify("fail153doorknockquest");
			}
			else
			{
				level notify("fail153doorknockquest");
			}
			break;
		}
	}
}

function doorquesttimer()
{
	level notify("doorqueesteneded");
	foreach(door in level.knockdoors)
		{
			door SetCursorHint("HINT_NOICON");
			door SetHintString("you shouldn't be here.");
		}
		players = GetPlayers();
		players[0] StopLoopSound(0.5);
		foreach(player in players)
        {
        		//player StopLocalSound("theroaddistorted");
        		player StopLocalSound("scaryhalltheme");
        }
	wait(2);
	level notify("playerleavenormalhallwaypushout");
}

function doorquestknock()
{
	level endon("doorqueesteneded");
	self SetCursorHint("HINT_NOICON");
	self SetHintString("Press ^2[{+activate}]^7 to knock");
	self waittill("trigger", player);
	self PlaySound("doorknock");
	level.knockcounter ++;
	if(level.knockcounter == 5)
	{
		level thread doorquesttimer();
		
	}
	else
	{
		self SetCursorHint("HINT_NOICON");
		self SetHintString("Nobody answers...");
	}
}

function hallwayjumpscare()
{
	level notify("doorqueesteneded");
	foreach(door in level.knockdoors)
		{
			door SetCursorHint("HINT_NOICON");
			door SetHintString("walk to the windows.");
		}
		players = GetPlayers();
		players[0] StopLoopSound(0.5);
		foreach(player in players)
        {
        		//player StopLocalSound("theroaddistorted");
        		player StopLocalSound("scaryhalltheme");
        }
	level.scarescreendetect waittill("trigger", player);
	level.scarescreen MoveZ(138.5, 0.05);
	level.scarescreen show();
	level.scarescreen PlaySound("screamerhallway");
	wait(2);
	level.scarescreen Delete();
	level.knockdoors Delete();
	//wait 1;
	level notify("playerleavenormalhallwaypushout");
}

function teleporttonormalhallwaynodelay()
{
		oilhallway1 = struct::get_array( "normalhallway", "targetname" );  // use structs instead of script_origins as they don't go towards the entity limit
        self EnableInvulnerability();
        self SetOrigin(oilhallway1[self.characterIndex].origin);
        self SetPlayerAngles(oilhallway1[self.characterIndex].angles);
       // PlayFX(level.oildisappear, self.origin);
        thread PlayFxWithCleanup(level.oildisappear, self.origin);
        wait(1);
        self DisableInvulnerability();
        break;
}

function fade_all_players()
{
foreach(player in GetPlayers())
    player thread fade_player();
}

function fade_player()
{
    	//Example: level lui::screen_flash( 0.2, 0.1, .5, 1.0, "white" ); // fade to 1.0 alpha white over 0.2s, hold for 0.5s, and fade back in over 1.0s"
    self thread lui::screen_flash( .85, 0.1, 1.2, 1.0, "white" );
}

function fade_all_players2()
{
foreach(player in GetPlayers())
    player thread fade_player2();
}

function fade_player2()
{
    	//Example: level lui::screen_flash( 0.2, 0.1, .5, 1.0, "white" ); // fade to 1.0 alpha white over 0.2s, hold for 0.5s, and fade back in over 1.0s"
   self thread lui::screen_flash( .5, 0.1, 1.5, 1.0, "red" );
}

function dimensionalbreakallplayers()
{
	level thread disable_movement();
	foreach(player in GetPlayers())
	{
		player thread dimensionalbreakdown();
		player PlayLocalSound("scaryhalltheme");
	}
	wait(1.5);
	level thread flashplayervisred();  
	level thread blackandwhitevis();
	wait(3.1);
	//PlayFX(level.newlightingfxaj, level.oilpool.origin);
	level waittill("teleporttohall");
	level thread enable_movement();
}


function teleport_aftereffect_flashy_vision( localClientNum )
{
	util::setClientSysState( "levelNotify", "tae", self );
}

function flashplayervisred()
{
	while(1)
	{
		level endon("teleporttohall");
		VisionSetNaked("zombie_cosmodrome_blackhole", 0.1 );
		wait( 0.4 );
		VisionSetNaked("zm_factory", 0.1 );
		wait( 0.4 );
		VisionSetNaked("zombie_cosmodrome_blackhole", 0.1 );
		wait( 0.4 );
		VisionSetNaked("zm_factory", 0.1 );
	}
}

function blackandwhitevis()
{
	level waittill("teleporttohall");
	VisionSetNaked( "zombie_last_stand", 0.05);
	level waittill("playerleavenormalhallwaypushout");
	VisionSetNaked("zm_factory", 5 );
}

function dimensionalbreakdown()
{   
	//self SetElectrified( 5 );
	//PlayFXOnTag(level.dimensionalinstablefx, self, "tag_eye");
	self.filtertype = "rooms";
	self.filteractivated = true;
	self thread teleport_aftereffect_fov();
	self shellshock( "explosion", 10 );
    self shellshock( "electrocution", 10 );
	level util::clientNotify("player_fling_blur_0");
	jumpscare_overlay = NewClientHudElem( self ); 
	jumpscare_overlay.alignX = "center";
	jumpscare_overlay.alignY = "center";
	jumpscare_overlay.horzAlign = "center";
	jumpscare_overlay.vertAlign = "center";
	jumpscare_overlay SetShader( "stuffmanscare", 480, 480 ); 
	jumpscare_overlay.alpha = 1; 
	self PlayLocalSound("comicalnoise"); 
	wait(1); 
	jumpscare_overlay FadeOverTime( 1 ); 
	jumpscare_overlay.alpha = 0; 
	wait( 1 ); 
	jumpscare_overlay destroy();
	jumpscare_overlay = NewClientHudElem( self ); 
	jumpscare_overlay.alignX = "center";
	jumpscare_overlay.alignY = "center";
	jumpscare_overlay.horzAlign = "center";
	jumpscare_overlay.vertAlign = "center";
	jumpscare_overlay SetShader( "rhettscare", 480, 480 ); 
	jumpscare_overlay.alpha = 1; 
	self PlayLocalSound("comicalnoise"); 
	wait(0.5); 
	jumpscare_overlay FadeOverTime( 0.5 ); 
	jumpscare_overlay.alpha = 0; 
	wait( 0.5 ); 
	jumpscare_overlay destroy();
	jumpscare_overlay = NewClientHudElem( self ); 
	jumpscare_overlay.alignX = "center";
	jumpscare_overlay.alignY = "center";
	jumpscare_overlay.horzAlign = "center";
	jumpscare_overlay.vertAlign = "center";
	jumpscare_overlay SetShader( "pigman_jumpscare", 960, 540 ); 
	jumpscare_overlay.alpha = 1; 
	self PlayLocalSound("comicalnoise"); 
	wait(0.25); 
	jumpscare_overlay FadeOverTime( 0.25 ); 
	jumpscare_overlay.alpha = 0; 
	wait( .25 ); 
	jumpscare_overlay destroy();
	jumpscare_overlay = NewClientHudElem( self ); 
	jumpscare_overlay.alignX = "center";
	jumpscare_overlay.alignY = "center";
	jumpscare_overlay.horzAlign = "center";
	jumpscare_overlay.vertAlign = "center";
	jumpscare_overlay SetShader( "rhettscare", 480, 480 ); 
	jumpscare_overlay.alpha = 1; 
	self PlayLocalSound("comicalnoise"); 
	wait(0.25); 
	jumpscare_overlay FadeOverTime( 0.25 ); 
	jumpscare_overlay.alpha = 0; 
	wait( .25 ); 
	jumpscare_overlay destroy();
	jumpscare_overlay = NewClientHudElem( self ); 
	jumpscare_overlay.alignX = "center";
	jumpscare_overlay.alignY = "center";
	jumpscare_overlay.horzAlign = "center";
	jumpscare_overlay.vertAlign = "center";
	jumpscare_overlay SetShader( "stuffmanscare", 480, 480 ); 
	jumpscare_overlay.alpha = 1; 
	self PlayLocalSound("comicalnoise"); 
	wait(0.25); 
	jumpscare_overlay FadeOverTime( 0.25 ); 
	jumpscare_overlay.alpha = 0; 
	wait( .25 ); 
	jumpscare_overlay destroy();
	jumpscare_overlay = NewClientHudElem( self ); 
	jumpscare_overlay.alignX = "center";
	jumpscare_overlay.alignY = "center";
	jumpscare_overlay.horzAlign = "center";
	jumpscare_overlay.vertAlign = "center";
	jumpscare_overlay SetShader( "trollscare", 480, 480 ); 
	jumpscare_overlay.alpha = 1; 
	self PlayLocalSound("comicalnoise"); 
	wait(0.25); 
	jumpscare_overlay FadeOverTime( 0.25 ); 
	jumpscare_overlay.alpha = 0; 
	wait( .1 ); 
	jumpscare_overlay destroy();
	jumpscare_overlay = NewClientHudElem( self ); 
	jumpscare_overlay.alignX = "center";
	jumpscare_overlay.alignY = "center";
	jumpscare_overlay.horzAlign = "center";
	jumpscare_overlay.vertAlign = "center";
	jumpscare_overlay SetShader( "susscare", 480, 480 ); 
	jumpscare_overlay.alpha = 1; 
	self PlayLocalSound("vineboom"); 
	wait(0.1); 
	self StopLocalSound("vineboom");
	jumpscare_overlay FadeOverTime( 0.15 ); 
	jumpscare_overlay.alpha = 0; 
	wait( .1 ); 
	jumpscare_overlay destroy();
	level notify("teleporttohall");
	level util::clientNotify("player_fling_blur_disable_0");
	wait(0.5);
	self.filteractivated = false;
}

function killplayerswhotouch(stringnotify)
{
	level endon("death");
	level endon(stringnotify);
	while(1)
	{
		foreach(player in GetPlayers())
		{
			if(player IsTouching(self))
			{
				player Kill();
			}
		}
		WAIT_SERVER_FRAME;
	}
}

function chase_scene()
{
	level.killcheck EnableLinkTo();
	level.killcheck LinkTo(level.screenchase);
	//level.screenhurt EnableLinkTo();
	//level.screenhurt LinkTo(level.screenchase);
	level notify("teleporttohall");
	level thread teleporttonormalhallway();
	level waittill("playerleavenormalhallwaypushout");
	level.scarescreen Delete();
	foreach(knock in level.knockdoors)
	{
		knock Delete();
	}
	 
	level.scarescreendetect Delete();
	level thread teleporttoevilhallway();
	level thread freezelook();
	VideoStart("moestatic",true);
	wait(1);
	level thread waitforlook();
	wait(1);
	level thread unfreezelook();
	level.screenlookat waittill("trigger", player);
	level.spawnportal PlaySound("oilappear");
	//wait(1);
	level thread enable_movement();
	level.killcheck thread killplayerswhotouch("ttriggerkilltraceover");
	level notify("moelookedat");
	level.screenchase PlaySound("usstare");
	wait(2.5);
	level.spawnportal PlayLoopSound("portal");
	VideoStop("moestatic");
	VideoStart("runchase",true);
	level.screenchase PlaySound("runrunrunrunz");
	//PlayFX(level.portalopen, level.spawnportal.origin);
	thread PlayFxWithCleanup(level.portalopen, level.spawnportal.origin);
	wait(1);
	level thread speak_to_players("vox_command_gettoportal");
	thread zm_subtitles::subtitle_display(undefined, 3, "^2Mission Command", "*static* Strike-Team get to that portal NOW");
	//level.killcheck PlaySound("vox_commandwehavelockon");
	//PlayFX(level.portalloop, level.spawnportal.origin);
	thread PlayFxWithCleanup(level.portalloop, level.spawnportal.origin, 40);
	level.screenchase MoveX(2500, 10);
	level.hallwayhint Delete();
	level.teleportertimer = 1;
	level thread teleportplayersmoment();
	level thread teleportertimer();
	level thread teleporttimercancel();
	wait(15);
	level notify("ttriggerkilltraceover");
	//june 3rd changed jaunts here
	level.screenchase Delete();
	level.spawnportal Delete();
	level.screenlookat Delete();
	wait(5);
	level.killcheck Delete();
}

function teleportertimer()
{
	wait(11);
	level notify("teleportplayersover");
	level.teleportertimer = 0;
	level notify("playerreturnoilnotifyzz");
}

function teleporttimercancel()
{
	level.oilroomdetect waittill("trigger", player);
	level.teleportertimer = 0;
	level notify("playerreturnoilnotifyzz");
}

function waitforlook()
{
	while(1)
	{
		level endon("moelookedat");
		level.screenchase PlaySound("hesbehindu");
		wait(3.5);
		level.screenchase PlaySound("hescoming");
		wait(3.5);
	}
}

function freezelook()
{
	players = GetPlayers();
    
    foreach (player in players)
	{
	player FreezeControls(true);
	}
}

function unfreezelook()
{
	players = GetPlayers();
    foreach (player in players)
    {
	player FreezeControls(false);
	}
}

function disable_movement()
{
	players = GetPlayers();
    //players_count = 0;
    foreach (player in players)
	//foreach(player in GetPlayers())
    {
	player setstance( "stand" );
	wait(0.1); 
	player AllowJump(false);
	player SetMoveSpeedScale(0);
	//player FreezeControls(true);
	
	}
}

function enable_movement()
{
	players = GetPlayers();
    //players_count = 0;
    foreach (player in players)
	//foreach(player in GetPlayers())
    {
	player setstance( "stand" );
	wait(0.1); 
	player SetMoveSpeedScale(1);
	player AllowJump(true);
	//player FreezeControls(false);
	} 
}

function disable_guns()
{
	players = GetPlayers();
    //players_count = 0;
    foreach (player in players)
	//foreach(player in GetPlayers())
    {
	player DisableWeapons(); 
	player DisableOffhandWeapons();
	}
}

function enable_guns()
{
	players = GetPlayers();
    //players_count = 0;
    foreach (player in players)
	//foreach(player in GetPlayers())
    {
	player EnableWeapons(); 
	player EnableOffhandWeapons(); 
	}
}

function bunnyscare()
{
	jumpscare_overlay = NewClientHudElem( self ); 
	jumpscare_overlay.alignX = "center";
	jumpscare_overlay.alignY = "center";
	jumpscare_overlay.horzAlign = "center";
	jumpscare_overlay.vertAlign = "center";
	jumpscare_overlay SetShader( "amongscare", 480, 480 ); 
	jumpscare_overlay.alpha = 1; 
	self PlayLocalSound( "loudnigra" ); 
	wait(0.5); 
	//jumpscare_overlay FadeOverTime( 3 ); 
	jumpscare_overlay.alpha = 0; 
	//wait( 4 ); 
	jumpscare_overlay destroy(); 
}



function startbunny()
{
	level.bunnydamage = GetEnt("bunnydamage","targetname");
	level.bunnydamage = GetEnt("damagebunnytrig","targetname");
	level.bunnydamage waittill("trigger", player);
	foreach(player in GetPlayers())
	{
    player thread bunnyscare();
	}
}


