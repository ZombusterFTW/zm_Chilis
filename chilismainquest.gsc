
#using scripts\zm\_zm_utility;
#using scripts\codescripts\struct;
#using scripts\zm\_zm_bgb;
#using scripts\zm\_zm_score;
#using scripts\zm\zm_usermap;

#using scripts\shared\array_shared;
#using scripts\shared\callbacks_shared;
#using scripts\shared\clientfield_shared;
#using scripts\shared\compass;
#using scripts\shared\exploder_shared;
#using scripts\shared\flag_shared;
#using scripts\shared\laststand_shared;
#using scripts\shared\math_shared;
#using scripts\shared\scene_shared;
#using scripts\shared\util_shared;
#using scripts\shared\util_shared;
#using scripts\shared\vehicle_shared;
#insert scripts\shared\shared.gsh;
#insert scripts\shared\version.gsh;
#using scripts\shared\animation_shared;
#using scripts\zm\zm_chilis;
#using scripts\shared\system_shared;
//#using scripts\shared\filter_shared.csc;
#insert scripts\zm\_zm_utility.gsh;

#using scripts\zm\_zm_spawner;
#using scripts\zm\_load;
#using scripts\zm\_zm;
#using scripts\zm\_zm_audio;
#using scripts\zm\_zm_powerups;
#using scripts\zm\_zm_utility;
#using scripts\zm\_zm_weapons;
#using scripts\zm\_zm_zonemgr;
#using scripts\shared\ai\zombie_utility;
#using scripts\zm\_zm_ai_dogs;
#using scripts\zm\_zm_perks;
#using scripts\Sphynx\_zm_subtitles;
#using scripts\shared\flagsys_shared;
//#using scripts\zm\zm_chilis;
//#using scripts\_NSZ\roomserviceeasteregg;
#using scripts\_redspace\rs_o_jump_pad;

#using scripts\zm\_zm_ai_mechz;
#using scripts\shared\lui_shared;
#using scripts\zm\_zm_spawner;
#using scripts\shared\objpoints_shared;
#using scripts\shared\visionset_mgr_shared;
#using scripts\zm\_zm_unitrigger;

#define ENDGAME_WAIT_FOR_FLAG			"" //if you want the ending to require a flag to be set from another script you have, enter the flag here.
#define ENDGAME_WAIT_FOR_NOTIFY			"" //if you want the ending to require a level notify to be sent from another script you have, enter the notify string here.
#define ENDGAME_COST					153000 //how much should it cost to end the game?
#define ENDGAME_CUSTOM_TRIGGER_HINT		"Press ^2[{+activate}]^7 to release the souls of The Weston Hotel. This ends the game." //Customize the endgame trigger hintstring here. Cost will be appended automatically.
#define ENDGAME_CUSTOM_GAME_OVER "^1The Death Of Our World Approaches..."

#precache( "fx", "light/fx_light_button_red_train_zod_zmb" );
#precache( "fx", "light/fx_light_button_green_traincar_zod_zmb" ); 
#precache( "fx", "light/fx_light_button_yellow_traincar_zod_zmb" );
#precache( "fx", "dlc0/factory/fx_teleporter_beam_factory" ); 
#precache("fx", "dlc2/zmb_weapon/fx_skull_quest_ritual_doorbarrier_island");
#precache( "fx", "dlc1/castle/fx_elec_teleport_flash_sm" );
#precache( "fx", "zombie/fx_ritual_barrier_defend_zod_zmb" );
#precache( "fx", "dlc1/castle/fx_ee_keeper_demongate_portal_open" );
#precache( "fx", "dlc1/castle/fx_ee_keeper_demongate_portal_loop" );
#precache( "fx", "dlc1/castle/fx_infused_115_airspace_sm_barricade_rise" );
#precache( "fx", "dlc1/castle/fx_castle_pap_teleport_parts_float_smk" );
#precache( "fx", "dlc1/castle/fx_ritual_key_soul_exp_igc" );
#precache( "fx", "zombie/fx_trail_blood_soul_zmb" );
#precache("fx", "dlc2/zmb_weapon/fx_skull_quest_lightning_hit_island");
#precache( "fx", "fx,dlc3/stalingrad/fx_dragonstrike_portal_flash" );
#precache("fx", "fx,dlc1/castle/fx_ee_pyramid_energy_ball");
#precache("fx", "dlc1/castle/fx_light_castle_ruinorb_vol");
#precache("fx", "dlc1/castle/fx_undercroft_energy_orb");
#precache( "fx", "dlc4/genesis/fx_rune_glow_purple" ); 
#precache( "fx", "zombie/fx_ritual_gatestone_tentacle_glow" ); 
#precache( "fx", "zombie/fx_ritual_gatestone_portal_zod_zmb" ); 
#precache( "fx", "zombie/fx_trail_gem_blue_doa" ); 
#precache( "fx", "dlc1/skyjacked/fx_light_blue_flashing_md_02" ); 
#precache( "fx", "dlc3/stalingrad/fx_elec_sparks_loop_blue_1x1" ); 
#precache( "fx", "dlc2/zmb_weapon/fx_wpn_skull_beam_loop_3p_island" );
#precache( "fx", "dlc4/genesis/fx_corrupteng_pillar_ember_top_red" );
#precache( "fx", "dlc3/stalingrad/fx_ritual_key_soul_beam_stl_igc" );
#precache( "fx", "destruct/fx_dest_robot_body_sparks" );
#precache( "fx", "light/fx_light_doa_flashlight" );
#precache( "fx", "_custom/testplayerflashlight" );
#precache( "fx", "dlc1/castle/fx_castle_electric_cherry_trail" );
#precache( "fx", "dlc1/castle/fx_ritual_key_soul_exp_igc" );
#precache( "fx", "zombie/fx_trail_blood_soul_zmb" );


#precache( "model", "p7_cai_sign_aframe_menu_compeat" ); 
#precache( "model", "p7_cai_sign_aframe_menu_compeatalt" ); 
#precache( "model", "p7_cafe_wall_menu_04_loona" ); 
#precache( "model", "p7_cafe_wall_menu_04_charlie" ); 
#precache( "model", "p7_3arc_lobby_picture_29x41_2_travisalt" ); 
#precache( "model", "p7_3arc_lobby_picture_29x41_2_travis" ); 

#precache( "model", "p7_chilisteleerrorscreen" ); 
#precache( "model", "p7_chilistelenavscreen" ); 
#precache( "model", "p7_chilisteleroofscreen" ); 
#precache( "model", "p7_chilistelesourcescreen" ); 
#precache( "model", "p7_chilistelehotelscreen" ); 
#precache( "model", "p7_chilistelehotelpicscreen" ); 
#precache( "model", "p7_chilistelerooflpicscreen" ); 
#precache( "model", "p7_chilistelesourcepicscreen" ); 
#precache( "model", "navigationcard" ); 
#precache( "model", "p7_chilistelenavcarddetected" ); 
#precache( "model", "loona" ); 
#precache( "model", "ghoti" ); 
#precache( "model", "aml_fish_bass" ); 
#precache( "model", "p7_corpse_zsf_male_floor_01" ); 
#precache( "model", "p7_corpse_zsf_male_floor_02" ); 
#precache( "model", "p7_corpse_zsf_male_bentover_01" ); 
#precache( "model", "p7_collectible_stand_11_charged" ); 
#precache( "material", "creator" );

 

#define KINO_SWIRL2                                  "dlc5/theater/fx_teleport_initiate"
#precache( "fx", KINO_SWIRL2 );
//#namespace zm_ev_filter;
//REGISTER_SYSTEM_EX( "zm_ev_filter", &__init__, undefined, undefined )
function autoexec mainquestinit()
{
	level waittill("initial_blackscreen_passed");
	//fx
	//level.keycarddisappear = "dlc1/castle/fx_elec_teleport_flash_sm";
	//clientfield::register( "world", "thesourcefx",	VERSION_SHIP, 1, "int" );
	//Set both of us to false WHEN TESTING OR FULL RELEASE
	level.islevelbranch = false;
	level.mainquestdisabled = false;
	level.mainquestdebug = true;
	level.dimensionalinstablefx = "dlc4/genesis/fx_sophia_elec_charge_teleporter";
	level.leavedoorbarrierfx = "dlc1/castle/fx_infused_115_airspace_sm_barricade_rise";
	level.oilappear = "dlc0/factory/fx_teleporter_beam_factory";
	level.oildisappear = "dlc1/castle/fx_elec_teleport_flash_sm";
	level.evilbarrier = "zombie/fx_ritual_barrier_defend_zod_zmb";
	level.bartenddoorfx = "dlc2/zmb_weapon/fx_skull_quest_ritual_doorbarrier_island";
	level.newlightingfxaj = "dlc2/zmb_weapon/fx_skull_quest_lightning_hit_island";
	level.teleporterdoorfxtest = "dlc2/zmb_weapon/fx_skull_quest_ritual_doorbarrier_island";
	level.portalopen = "dlc1/castle/fx_ee_keeper_demongate_portal_open";
	level.portalloop = "dlc1/castle/fx_ee_keeper_demongate_portal_loop";
	level.mogusappeareffect = "dlc1/castle/fx_castle_pap_teleport_parts_float_smk";
	level.moguskill = "dlc1/castle/fx_ritual_key_soul_exp_igc";
	level.navcardint = GetEnt("navcardinteract", "targetname");
	level.playerhasnavcard = 0;
	teleporterfxspot = GetEnt("chilisteleporterfxspot", "targetname");
	temproofspots = struct::get_array( "roofarrivalspots", "targetname" );
	level.ihopmeteorspots = struct::get_array("ihopmeteorspot","targetname");
	upperforesttelespots = struct::get_array("upperforesttelespots", "targetname");
	level.chnugusunstuck = struct::get_array("playerchungusscriptarray","targetname");
	level.teleportdestinationschilis = array(temproofspots, upperforesttelespots, level.chnugusunstuck);
	level.chilisteleportdestination = temproofspots;
	teleporterfxspot Hide();
	//level flag::init("qdfiretime", false);
	//level flag::init("qdplayer1", false);
	//level flag::init("qdplayer2", false);
	//pantry switch
	//thread zm_subtitles::subtitle_display(undefined, 1, "ACS", "test");
	//start
	//level.qdplayerdetect = GetEnt("playersqdplayerdetect", "targetname");
	///level.qdtriggeractivate = GetEnt("startqdtrig", "targetname");
	//level.playerqdend = struct::get_array("qdendspot", "targetname");
	//level.playerqdstart = struct::get_array("qdstartspot", "targetname");
	  // use structs instead of script_origins as they don't go towards the entity limit
	//level thread qditemssetup();
	//level thread towerscenetest();
	//level thread sourcefoglighttest();
	level thread pantrystepsetup();
	level thread eegatewaydeliversetup();
	level thread moveQuestTableItems(0);
	level thread navcardrandomization();
	level thread zulubodies();
	level thread element153tube();
	if(level.mainquestdebug)
	{
		wait(2);
		IPrintLnBold("Main Quest Debug Is Active");
	}
	if(level.mainquestdisabled) 
	{
		level thread tempbuyableending();
		level waittill("startact2mainquest");
	}
	else
	{
		level thread westonhotelsoulcollection();
	}
	level thread branchscenetest();
	wait(10);
	level notify("teleport_returned");
}


function westonhotelsoulcollection()
{
	westonsoulrandomloc = struct::get_array("randomroamchiliee", "targetname");
	box2 = GetEnt("soulboxhahalol", "targetname");
	box = util::spawn_model("tag_origin", box2.origin);
	level waittill("allplayershavecanisters");
	playersinrange = false;
	while(!playersinrange)
	{
		foreach(player in GetPlayers())
		{
			if(DistanceSquared(player.origin, box.origin) <= 9500)
			{
				IPrintLnBold("ladies and gentlemen, we  got him.");
				playersinrange = true;
				break;
			}
		}
		wait(0.05);
	}
	box2 EnableLinkTo();
	box2 LinkTo(box);
	//IPrintLnBold("The souls have awakened");
	box PlayLoopSound("box_rise_loop", 0.5);
	for(i = 0; i < westonsoulrandomloc.size; i++)
	{
		if(westonsoulrandomloc[i].script_int == 0) 
		{
			boxpath = westonsoulrandomloc[i].origin;
			box MoveTo(boxpath, 3);
			westonsoulrandomloc[i] = undefined;
			break;
		}
	}
	if(!isdefined(boxpath))
	{
		IPrintLnBold("Error");
	}
	wait(0.25);
	box Vibrate( (1,1,1), 15, .4, 2.75);
	box StopLoopSound(2.75);
	wait(2.75);
	thread PlayFxWithCleanup("dlc1/castle/fx_ritual_key_soul_exp_igc", box.origin, 4);
	box PlaySound("box_rise_exp");
	wait(0.25);
	box2 Hide();
	box.box2 = box2;
	PlayFXOnTag("zombie/fx_trail_blood_soul_zmb", box, "tag_origin");
	box PlayLoopSound("box_orb_follow", 1);
	prevint = undefined;
	box2 SetCanDamage(1);
	box thread westonboxsoulstep(westonsoulrandomloc);
	box2 endon("damage");
	while(1)
	{
		while(1)
		{
			randint = RandomInt(westonsoulrandomloc.size);
			if(isdefined(westonsoulrandomloc[randint]) && isdefined(prevint) && randint == prevint || westonsoulrandomloc[randint].script_int == 0) randint = RandomInt(westonsoulrandomloc.size);
			else break;
		}
		box MoveTo(westonsoulrandomloc[randint].origin, 11);
		prevint = randint;
		box.prevint = prevint;
		wait(11.5);
	}
}

function westonboxsoulstep(structarray, box2)
{
	firstspot = struct::get("westonfirstspotee", "script_noteworthy");
	secondspot = struct::get("westonsecondeespot", "script_noteworthy");
	thirdspot = struct::get("westonthirdeespot", "script_noteworthy");
	finalspot = struct::get("westonfinaleespot", "script_noteworthy");
	level.westonsoulorbmodel = self;
	self.box2 waittill("damage");
	box2 Delete();
	thread PlayFxWithCleanup("dlc1/castle/fx_ritual_key_soul_exp_igc", self.origin, 4);
	self PlaySound("box_rise_exp");
	self MoveTo(firstspot.origin, 8.5);
	wait(8.5);
	self StopLoopSound(1);
	self PlayLoopSound("box_orb_stop", 1);
	IPrintLnBold("success");
	//set up canister steps for different amounts of players
	if(level flag::get("solo_game")) canistersoulcount = 8;
	else canistersoulcount = 16;
	if(level.mainquestdebug) canistersoulcount = 1;
	level.westoncanistersoulcountee = canistersoulcount;
	self.soulpoints = 0;
	level.canisterspotpoints = 3;
	self.currentsoulcount = 0;
	self.isfullycharged = false;
	nextspot = undefined;
	for(i = 0; i < level.canisterspotpoints; i++)
	{
		zm_spawner::register_zombie_death_event_callback(&zombiedeathcheckcanister);
		//find a random spot to move to and then move the ball to it and delete the spot.
		level waittill("westonspotfilledboi");
		zm_spawner::deregister_zombie_death_event_callback(&zombiedeathcheckcanister);
		IPrintLnBold("proceeding to next spot");
		//Set soul box procedding in fixed order
		//make it so the last filling location is always in front of the fireplace, add another variable to the script ent to make this easier, maybe bool?
		//soul box moves with each filling but the player in required to interact with it, each time a small cutscene/dialouge plays that discusses what happened at the weston hotel. WE end at the first interaction point the player touched in the weston hotel. Forcibily changing it.
		//make it so last soul box begins with the hotel lit, but after the player interacts with it lights in the hotel shut off flashlights activate for the lobby and 237 hallway, lights remain on in the gold room. Soul locations, gold room stage, 153 secret room, and finally the fireplace. Reactivating the seal causes the flame of the fire place to extinguish as the souls have been vacated from the hotel. "they've suffered long enough. Now its your turn..."
		//script int on the point is == 1 use that to build out the logic.
		//perhaps have filter if player is in range of soul box
		switch(i)
		{
			case 0:
			{
				nextspot = secondspot; 
				break;
			}
			case 1:
			{
				nextspot = thirdspot;
				break;
			}
			case 2:
			{
				IPrintLnBold("Proceed to final spot");
				nextspot = finalspot;
				break;
			}
			default:
			{
				IPrintLnBold("Something went wrong");
			}
		}
		IPrintLnBold("found the next spot");
		self StopLoopSound(1);
		self PlayLoopSound("box_orb_follow", 1);
		self MoveTo(nextspot.origin, 8.5);
		IPrintLnBold(nextspot.origin);
		wait(8.5);
		self StopLoopSound(1);
		self PlayLoopSound("box_orb_stop", 1);
		self.currentsoulcount = 0;
		if(i == 2) break;
	}
	trigger = Spawn( "trigger_radius_use", self.origin + ( 0, 0, 0 ), 0, 60, 90 );
	WAIT_SERVER_FRAME;
	trigger UseTriggerRequireLookAt();
	trigger SetVisibleToAll();
	trigger SetTeamForTrigger( "none" );
	trigger TriggerIgnoreTeam();
	trigger SetCursorHint("HINT_NOICON");
	trigger SetHintString("Press ^2[{+activate}]^7 To Release The Souls Of The Weston Hotel...");
	trigger waittill("trigger", player);
	earthQuake(.6, 4, trigger.origin, 1500);
	trigger Delete();
	//we get here when all canisters have been filled
	PlaySoundAtPosition("success",(0,0,0));
	foreach(player in GetPlayers())
	{
		PlayFXOnTag(level.soulfx, player.playercanister, "tag_origin");
		PlayFXOnTag("dlc3/stalingrad/fx_ritual_key_soul_beam_stl_igc", player, "tag_origin");
	}
	IPrintLnBold("All Soul Canisters Have Been Filled!");
	level notify("soulcanisterfilledchiliseequest");
	level.aresoulcanistersfilledee = true;
	thread teleportersoulcanisterfxhint();
	level.westonfireplacespot MoveTo(self.origin, 1.5);
	wait(1.5);
	level.westonfireplacespot EnableLinkTo();
	level.westonfireplacespot LinkTo(self);
	thread PlayFxWithCleanup("dlc3/stalingrad/fx_ritual_key_soul_beam_stl_igc", self.origin, 15);
	self MoveZ(1500, 4);
	foreach(player in GetPlayers())
	{
		player thread lui::screen_flash( 1, 1, 5.0, 4.5, "white" );
		//player shellshock( "explosion", 0.1 );
	}
	self Delete();
	level.westonfireplacespot Delete();
	level util::set_lighting_state(3);
	level.darknessactive = true;
	wait(20);
	level util::set_lighting_state(0);
	level.darknessactive = false;
}


function zombiedeathcheckcanister()
{
	//model = level.westonsoulorbmodel;
	//canistersoulcount = level.westoncanistersoulcountee;
	//These 2 fx are used in the moving soul box sequence, 
	//#precache( "fx", "dlc1/castle/fx_ritual_key_soul_exp_igc" );
	//#precache( "fx", "zombie/fx_trail_blood_soul_zmb" );
	//After the players grab all of the canisters, a hint will tell them about the nature of soul energy and how its potency increases overtime. This is a subtle hint to investigate The Weston Hotel. 
	//Once in The Weston Hotel, players just need to walk past the strange box in front of the elevator. If all players have a cylinder the box will rise up and begin to shake until it explodes revealing a ghostly blue spirit.
	//These souls represent the trapped souls inside of The Weston Hotel, players must follow the spirits to set spots where they must fill the soul with zombie souls, each time the souls move a yellow explosion happens which causes each player's soul canister to increase in charge by 25% percent.
	//Possible lore dialouge in-between soul moves? After fully charging the souls all players canisters will become fully charged and a beam of light will take the soul orb straight up. After this a hint will play about how to convert soul energy into temporal energy and how its a very costly process that requires a lot of additional energy, "That could electrocute you! Wait maybe that could actually work."
	//all players must go into the teleporter after this hint to activate the next step.
	if(DistanceSquared(self.attacker.origin, level.westonsoulorbmodel.origin) <= 22500)
	{
		//Base soul collection off of the position of the player not where the zombie is. 
		if(level.westonsoulorbmodel.currentsoulcount < level.westoncanistersoulcountee)
		{
			IPrintLnBold("zombie killed");
			iscanisterfilled = false;
			level.westonsoulorbmodel.currentsoulcount ++;
			if(level.westonsoulorbmodel.currentsoulcount == level.westoncanistersoulcountee) iscanisterfilled = true;
			soul = util::spawn_model("tag_origin", self.origin);
		    WAIT_SERVER_FRAME;
		    soul PlaySound("soulsuckzz");
		    PlayFXOnTag(level.soulfx, soul, "tag_origin");
		    soul MoveTo(level.westonsoulorbmodel.origin, 1);
		    wait 1;
		    soul Delete();
		    level.westonsoulorbmodel PlaySound("soulabsorb");
		    if(iscanisterfilled == true) 
			{
				level.westonsoulorbmodel PlaySound("memento_pickup");
				PlayFXOnTag("dlc1/castle/fx_ritual_key_soul_exp_igc", level.westonsoulorbmodel, "tag_origin");
				//Initial canister fill notif, invert bool to prevent it going off multiple times.
				wait(1);
				level notify("westonspotfilledboi");
				level.filledcanisters ++;

			}
			else return;
		}
	}
	else return;
}


function tempbuyableending()
{
	buyableendingcost = 153000;
	box = GetEnt("soulboxhahalol", "targetname");
	while(1)
	{
		if(level.round_number >= 15) break;
		wait(0.05);
	}
	box2 = util::spawn_model("tag_origin", box.origin);
	wait(0.05);
	box2 EnableLinkTo();
	box2 LinkTo(box);
	//IPrintLnBold("The souls have awakened");
	box PlayLoopSound("box_rise_loop", 0.5);
	boxpath = struct::get(box.target, "targetname");
	box MoveTo(boxpath.origin, 3);
	wait(0.25);
	box Vibrate( (1,1,1), 15, .4, 2.75);
	box StopLoopSound(2.75);
	wait(2.75);
	thread PlayFxWithCleanup("dlc1/castle/fx_ritual_key_soul_exp_igc", box2.origin, 4);
	box PlaySound("box_rise_exp");
	wait(0.25);
	box Hide();
	PlayFXOnTag("zombie/fx_trail_blood_soul_zmb", box2, "tag_origin");
	box PlayLoopSound("evt_souls_full_loop", 1);
	while(1)
	{
		boxpath = struct::get(boxpath.target, "targetname");
		if(isdefined(boxpath))
		{
			box MoveTo(boxpath.origin, 3);
			wait(3);
		}
		else break;
	}
	//box3 = util::spawn_model("tag_origin", box2.origin);
	wait(0.05);
	//box3 zm_unitrigger::create_unitrigger( ENDGAME_CUSTOM_TRIGGER_HINT + "[Cost: " +ENDGAME_COST+ "] ^1Knife to see remaining cost.", 64, &unitrigger_prompt_and_visibilitylookat);
	PlayFXOnTag("dlc3/stalingrad/fx_ritual_key_soul_beam_stl_igc", box2, "tag_origin");
	box2 PlaySound("soul_door_arrive");
	box StopLoopSound(0.5);
	wait(0.5);
	//box Delete();
	box2 PlayLoopSound("evt_souls_full_loop2", 0.5);
	buyableendingtrigger = GetEnt("buyableendingtrigger", "targetname");
	buyableendingtrigger UseTriggerRequireLookAt();
	buyableendingtrigger SetHintString(ENDGAME_CUSTOM_TRIGGER_HINT + "[Cost: " +ENDGAME_COST+ "] Total Cost is ^2Contributable. ^1Knife to see remaining cost.");
	while(1)
	{
		box thread checkremainingcost(buyableendingcost);
		buyableendingtrigger waittill("trigger", player);
		if(player.score == 0)
		{
			player PlayLocalSound("defaultfail");
			continue;
		}
		else if(player.score < buyableendingcost)
		{
			level notify("moneyaddedtoending");
			buyableendingcost = buyableendingcost - player.score;
			player zm_score::minus_to_player_score(player.score); 
			player PlayLocalSound("zmb_cha_ching");
			

		}
		else if(player.score >= buyableendingcost)
		{
			level notify("moneyaddedtoending");
			player zm_score::minus_to_player_score(buyableendingcost); 
			buyableendingcost = 0;
			player PlayLocalSound("zmb_cha_ching");
			box thread checkremainingcost(buyableendingcost);
		}
		if(buyableendingcost == 0) break;
		wait(0.1);
	}
	foreach(player in GetPlayers())
	{
		player EnableInvulnerability();
		player freezecontrols( true );
	}
	level.custom_game_over_hud_elem = &buyable_game_over;
	wait(1);
	level notify("end_game");
}

function checkremainingcost(cost)
{
	level endon("moneyaddedtoending");
	level endon("end_game");
	self SetCanDamage(1);
	while(1)
	{
		self waittill( "damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel );
		if(zm_utility::is_melee_weapon(weapon) && mod == "MOD_MELEE" && IsPlayer(attacker))
		{
			IPrintLnBold("Remaining cost is: " + cost + " points.");
		}
		else if(mod == "MOD_GRENADE_SPLASH") 
		{
			continue;
		}
		wait(1);
	}
}

function unitrigger_prompt_and_visibilitylookat( player )
{	
	if(player zm_utility::is_player_looking_at(self.origin, 0.98, true, player)) b_visible = true;
	else b_visible = false;
	return b_visible;
}


function buyable_game_over(player, game_over, survived)
{
	game_over.alignX = "center";
	game_over.alignY = "middle";
	game_over.horzAlign = "center";
	game_over.vertAlign = "middle";
	game_over.y -= 130;
	game_over.foreground = true;
	game_over.fontScale = 3;
	game_over.alpha = 0;
	game_over.color = ( 1.0, 1.0, 1.0 );
	game_over.hidewheninmenu = true;
	game_over SetText(ENDGAME_CUSTOM_GAME_OVER);

	game_over FadeOverTime( 1 );
	game_over.alpha = 1;
	if ( player isSplitScreen() )
	{
		game_over.fontScale = 2;
		game_over.y += 40;
	}
}




function navcardrandomization()
{
	navcardlocs = struct::get_array( "navcardspawnloc", "targetname" );
	randint = RandomInt(navcardlocs.size);
	navcardspawn = util::spawn_model("navigationcard", navcardlocs[randint].origin);
	WAIT_SERVER_FRAME;
	navcardspawn SetScale(1.5);
	navcardspawn RotateTo(navcardlocs[randint].angles, 0.05);
	WAIT_SERVER_FRAME;
	navcardspawn RotateYaw(270, 0.05);
	navcardspawn RotateRoll(90, 0.05);
	navcardspawn Hide();
	level waittill("level_branched");
	navcardspawn Show();
	trigger = Spawn( "trigger_radius_use", navcardspawn.origin + ( 0, 0, 0 ), 0, 60, 90 );
	WAIT_SERVER_FRAME;
	trigger UseTriggerRequireLookAt();
	trigger SetVisibleToAll();
	trigger SetTeamForTrigger( "none" );
	trigger TriggerIgnoreTeam();
	trigger SetCursorHint("HINT_NOICON");
	trigger SetHintString("Press ^2[{+activate}]^7 To Pick Up Navigation Card");
	trigger waittill("trigger", player);
	player PlaySound("zmb_craftable_pickup");
	navcardspawn Delete();
	foreach(loc in navcardlocs)
	{
		loc Delete();
	}
	level notify("navcardgrabalt");
	trigger Delete();
}

function autoexec sourcefoglighttest()
{
	//level endon("intermission");
	//level waittill("initial_blackscreen_passed");
	//IPrintLnBold("fog test work");
	fogtrig = GetEnt("thesourcefog", "targetname");
	chilistrig = GetEnt("chilisfogrecheck", "targetname");
	foreach(player in GetPlayers())
	{
		player.atchilis = true;
	}
	fogtrig thread foglightplayertrigsource(3, 3, false);
	chilistrig thread foglightplayertrigsource(1, 0, true);
	//IPrintLnBold("Player at source");
	//source fog = 3 source light = 2
	//normal fog = 1 normal light = 0 power must be on at this point
}

function foglightplayertrigsource(bank, light, up)
{
	level endon("intermission");
	while(1)
	{
		self waittill("trigger", player);
		if(player.atchilis != up)
		{
			//IPrintLnBold("player changed fog and light");
			player thread setsourcefog(bank, light);
			player.atchilis = up;
			if(!player.atchilis)
			{
				player.filtertype = "source";
				WAIT_SERVER_FRAME;
				player.filteractivated = true;
			}
			else
			{
				player.filteractivated = false;
			}
		}
		WAIT_SERVER_FRAME;
	}
}

function setsourcefog(bank, light)
{
	self SetWorldFogActiveBank(bank);
	self thread util::set_lighting_state(light);
}

function element153tube()
{
	modelerrortextmonitors = array("p7_chilisteleerrorscreen","p7_chilistelenavscreen","p7_chilistelenavcarddetected");
	modeltextmonitors = array("p7_chilisteleroofscreen", "p7_chilistelesourcescreen","p7_chilistelehotelscreen");
	modelprevmonitors = array("p7_chilistelerooflpicscreen","p7_chilistelesourcepicscreen","p7_chilistelehotelpicscreen");
	telescreenselect = GetEnt("chilisteleselectscreen", "targetname");
	telescreenshow = GetEnt("chilisteleshowscreen", "targetname");
	startpath153 = struct::get("element153path", "targetname");
	computer = GetEnt("teleporterselectpc", "targetname");
	trig = GetEnt("tube153reacttrig", "targetname");
	rock = GetEnt("element153tuberock", "targetname");
	tube = GetEnt("153tubesuck", "targetname");
	level.navcardint UseTriggerRequireLookAt();
	navcarddrop = GetEnt("navcarddrop", "targetname");
	navcarddrop Hide();
	computer UseTriggerRequireLookAt();
	locationstrings = array("ROOF", "THE SOURCE", "THE WESTON HOTEL");
	level.locationstringchilis = "Roof";
	reactorfx = GetEnt("chilisreactorfxspot", "targetname");
	reactorfx Hide();
	trig SetCursorHint("HINT_NOICON");
	trig UseTriggerRequireLookAt();
	rock Hide();
	level.mainquestteleportactivate SetHintString("ERROR: Machine is currently offline");
	computer SetHintString("ERROR: Teleporter verification required to proceed");
	trig SetHintString("ERROR: Area is currently on lockdown, lockdown must be lifted to proceed");
	if(!level.mainquestdebug) level waittill("condomssussedagreare");
	trig SetHintString("This requires Element [REDACTED].");
	computer SetHintString("ERROR: Reactor is offline");
	while(1)
	{
			players = GetPlayers();
			player = ArrayGetClosest(trig.origin, players);
			if(level.playerhastheelement153 && DistanceSquared(player.origin, trig.origin) <= 5625)
			{
				thread zm_subtitles::subtitle_display(undefined, 3, "^5Davis", "It seems this reactor was designed for an element containing 153 protons.");
				wait(2.5);
				thread zm_subtitles::subtitle_display(undefined, 3, "^5Davis", "Unfourtunately an element with these parameters has not yet been discovered.");
				wait(3.5);
				thread zm_subtitles::subtitle_display(undefined, 3, "^5Davis", "Hold on. My sensors are detecting trace amounts of this 'element' on your person. How did you come into possession of this element?");
				break;
			}
			//if we dont have 153 and the players distance is less than or equal to 75^2
			else if(!level.playerhastheelement153 && DistanceSquared(player.origin, trig.origin) <= 5625 && !level.mainquestdebug)
			{
				//thread dialouge, and wait for it to finish.
				thread zm_subtitles::subtitle_display(undefined, 3, "^5Davis", "It seems this reactor was designed for an element containing 153 protons.");
				wait(2.5);
				thread zm_subtitles::subtitle_display(undefined, 3, "^5Davis", "Unfourtunately an element with these parameters has not yet been discovered.");
				wait(3.5);
				thread zm_subtitles::subtitle_display(undefined, 2, "^2Mission Command", "Wait 153? Check the hotel. Doctor Gray obsessed over that number, perhaps he knew more than we thought?");
				wait(10);
			}
			//for debug reasons
			else if(DistanceSquared(player.origin, trig.origin) <= 5625 && level.mainquestdebug) 
			{
					thread zm_subtitles::subtitle_display(undefined, 3, "^5Davis", "It seems this reactor was designed for an element containing 153 protons.");
					wait(2.5);
					thread zm_subtitles::subtitle_display(undefined, 3, "^5Davis", "Unfourtunately an element with these parameters has not yet been discovered.");
					wait(3.5);
					thread zm_subtitles::subtitle_display(undefined, 3, "^5Davis", "Hold on. My sensors are detecting trace amounts of this 'element' on your person. How did you come into possession of this element?");
					break;
			}
			wait(0.05);
	}
	//level thread ee153roomrewards();
	trig SetHintString("Press ^2[{+activate}]^7 Load Element 153");
	trig waittill("trigger", player);
	rock Show();
	rock PlaySound("build_done");
	trig SetHintString("Press ^2[{+activate}]^7 To Initialize The Reactor");
	trig waittill("trigger", player);
	trig SetHintString("");
	trig SetHintString("");
	tube MoveZ(-16.3, 1.8);
	tube PlaySound("tubeextract");
	wait(2.3);
	PlayFXOnTag("zombie/fx_trail_gem_blue_doa", rock, "tag_origin");
	tube PlaySound("tubesuckup");
	rock thread spinallaxis(3);
	rock PlayLoopSound("wispportalloop", 0.5);
	for(i = 0; i < 3; i++)
	{
		rock MoveTo(startpath153.origin, 2);
		startpath153 = struct::get(startpath153.target, "targetname");
		wait(2);
	}
	rock StopLoopSound(0.5);
	fxorb = util::spawn_model("tag_origin", reactorfx.origin);
	fxorb2 = util::spawn_model("tag_origin", reactorfx.origin);
	fxorb MoveZ(-20, 0.05);
	WAIT_SERVER_FRAME;
	PlayFXOnTag("dlc1/skyjacked/fx_light_blue_flashing_md_02", fxorb, "tag_origin");
	PlayFXOnTag("dlc3/stalingrad/fx_elec_sparks_loop_blue_1x1", fxorb2, "tag_origin");
	reactorfx PlaySound("reactorstartup");
	foreach(player in GetPlayers())
		player thread lui::screen_flash( .1, 0.1, 1.0, 1.0, "white" );
	radius = spawn( "trigger_radius", reactorfx.origin, 1, 100, 75);
	WAIT_SERVER_FRAME;
	zombies = GetAiSpeciesArray( level.zombie_team, "all" );
        foreach(zombie in zombies)
        {
        	if(zombie IsTouching(radius))
        	{
        		zombie Kill();
        		level.zombie_respawns ++;
        		level.zombie_total ++;
        	}
        }
    WAIT_SERVER_FRAME;
    radius Delete();
	fxorb2 PlayLoopSound("reactorchargeloop", 1.0);
	earthQuake(.6, 4, rock.origin, 1000);
	//IPrintLnBold("Reactor loaded with fuel");
	//fxorb Delete();
	rock Delete();
	trig Delete();
	wait(2);
	level thread questteleporter();
	telescreenselect SetModel(modelerrortextmonitors[0]);
	telescreenshow SetModel(modelerrortextmonitors[0]);
	telescreenselect SetModel(modelerrortextmonitors[1]);
	telescreenshow SetModel(modelprevmonitors[0]);
	computer SetHintString("ERROR: Nav Card Missing, teleport destination set to ^1ROOF");
	level.navcardint SetHintString("This requires a ^1Nav Card");
	level waittill("navcardgrabalt");
	//Nav card randomly spawns in the dimensional branch, player must find it and grab it. Then they must rebuild the tower to return to chili's prime.
	//for test
	//wait(15);
	level.navcardint SetHintString("Press ^2[{+activate}]^7 to insert ^1Nav Card");
	level.navcardint waittill("trigger", player);
	level.teleporterchilisfxspot Delete();
	telescreenselect SetModel(modelerrortextmonitors[2]);
	telescreenshow SetModel(modelerrortextmonitors[2]);
	level notify("resetchilisteleporter");
	level.mainquestteleportactivate SetHintString("");
	level.teleporterchilisfxspot Delete();
	level.navcardint SetHintString("");
	thread PlayFxWithCleanup(level.oildisappear, navcarddrop.origin, 1);
	wait 0.2;
	navcarddrop Show();
	navcarddrop MoveY(-5.0, 1);
	wait(1);
	navcarddrop PlaySound("buttonpressaj_2");
	computer SetHintString("Press ^2[{+activate}]^7 to cycle location");
	int = 0;
	while(1)
	{
		level endon("intermission");
		computer waittill("trigger", player);
		level notify("resetchilisteleporter");
		level thread alteleporterfunction();
		if(int > level.teleportdestinationschilis.size-1)
		{
			int = 0;
		}
		telescreenselect SetModel(modeltextmonitors[int]);
		telescreenshow SetModel(modelprevmonitors[int]);
		level.chilisteleportdestination = level.teleportdestinationschilis[int];
		level.locationstringchilis = locationstrings[int];
		computer SetHintString("Press ^2[{+activate}]^7 to cycle location");
		computer PlaySound("buttonpressaj_2");
		int ++;
		wait(1);
	}
}





function alteleporterfunction()
{
	level endon("resetchilisteleporter");
	level.teleporterchilisfxspot Delete();
	teleporterfxspot = GetEnt("chilisteleporterfxspot", "targetname");
	teleporterfxspot Hide();
    level.black_spots = struct::get_array( "black_orgs", "targetname" );
    level.tpamount = 0;
    //level thread playerdeathcallback();
    level.black_spots_targets = []; 
    for( i=0;i<level.black_spots.size;i++ )
    {
		level.black_spots_targets[i] = struct::get( level.black_spots[i].target, "targetname" );
    }
    level.mainquestteleportactivate SetHintString("Press ^2[{+activate}]^7 To Activate Teleporter");
	level.mainquestteleportactivate SetCursorHint("HINT_NOICON");
	level.mainquestteleportactivate waittill("trigger", player);
	level.mainquestteleportactivate SetHintString("");
	level.mainquestteleportactivate PlaySound("buttonpressaj_2");
	wait(0.1);
	level.mainquestteleportactivate PlaySound("altcomputeractivate");
	level.mainquestteleportactivate SetHintString("Teleporter is currently active.");
	level.mainquestteleportactivate PlaySound("computerterminalcomplete");
	level.teleporterchilisfxspot = util::spawn_model("tag_origin", teleporterfxspot.origin);
	WAIT_SERVER_FRAME;
	PlayFXOnTag("zombie/fx_ritual_gatestone_tentacle_glow", level.teleporterchilisfxspot, "tag_origin");
	level.teleporterchilisfxspot PlaySound("chilisportalopen");
	wait(0.5);
	level.teleporterchilisfxspot PlayLoopSound("chilisportallp", 0.5);
	PlayFXOnTag("zombie/fx_ritual_gatestone_portal_zod_zmb", level.teleporterchilisfxspot, "tag_origin");
	while(1)
	{
		level.mainquestteleportdetect waittill("trigger", player);
		player thread roofteleport();
		WAIT_SERVER_FRAME;
	}
}


function autoexec ee153roomrewards()
{
	//Changed on june 2nd 2022 got rid of excess hintstrings
	podiumstrings = array("You have not completed the challenge for this reward.","Here's 1530 points on the house. Press ^3[{+activate}]^7 to claim", "Feeling light? here's a max ammo. Press ^3[{+activate}]^7 to claim", "Built the shield yet? Press ^3[{+activate}]^7 to claim a Carpenter and receive the Golden Shield.");
	hintstrings = array("Discover a 153 year old mystery to unlock this reward.", "Discover the meaning of April 4th to unlock this reward.", "Set your paredolia free to unlock this reward.");
	firstchall = GetEnt("easteregg0153", "targetname");
	secondchall = GetEnt("easteregg1153", "targetname");
	thirdchall = GetEnt("easteregg2153", "targetname");
	level waittill("initial_blackscreen_passed");
	//init func add podiums to arrays and thread, classic stuffs
	level thread setup153challenge(1, firstchall, "brplayerreturnedtohotel", podiumstrings, hintstrings);
	level thread setup153challenge(2, secondchall, "lightsonsuprise", podiumstrings, hintstrings);
	level thread setup153challenge(3, thirdchall, "seating153eggdone", podiumstrings, hintstrings);
	
}

function setup153challenge(int, trig, stringnotify = "power_on", podiumstrings, hintstrings)
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		trig UseTriggerRequireLookAt();
		trig SetCursorHint("HINT_NOICON");
		//trigarray[i] SetHintString(players[i].playername + podiumstrings[0]);
		//removed player name from the hint to prevent creating excess hintstrings
		trig SetHintStringForPlayer(players[i], "^7" + hintstrings[int - 1]);
	}
	fxorb = util::spawn_model("tag_origin", trig.origin);
	WAIT_SERVER_FRAME;
	PlayFXOnTag("dlc4/genesis/fx_corrupteng_pillar_ember_top_red", fxorb, "tag_origin");
	level waittill(stringnotify);
	fxorb Delete();
	WAIT_SERVER_FRAME;
	for(i = 0; i < players.size; i++)
	{
		trig SetCursorHint("HINT_NOICON");
		//trigarray[i] SetHintString(players[i].playername + "'s Altar");
		trig SetHintStringForPlayer(players[i], "^7" + podiumstrings[int]);
	}
	fxorb = util::spawn_model("tag_origin", trig.origin);
	WAIT_SERVER_FRAME;
	PlayFXOnTag("dlc2/zmb_weapon/fx_wpn_skull_beam_loop_3p_island", fxorb, "tag_origin");
	trig thread playertrigger153challenge(int, i, players, fxorb);
}

function isplayerinlist(name,namesarray)
{
	for(i = 0; i < namesarray.size; i++)
	{
		if(namesarray[i] == name)
		{
			return true;
		}
	}
	return false;
}

function playertrigger153challenge(challint, playerint, playerarray, fxorb)
{
	playerslist = array();
	playersused = 0;
	players = GetPlayers();
	playerscount = players.size;
	if(playerscount < 1)
	{
		playerscount = 1;
	}
	while(playersused != playerscount)
	{
		while(1)
		{
			self waittill("trigger", player);
			//player PlaySound("cha_ching");
			if(!isplayerinlist(player.playername, playerslist))
			{
				playersused ++;
				array::add(playerslist, player.playername);
				self SetHintStringForPlayer(player, "");
				break;
			}
			WAIT_SERVER_FRAME;
		}

		switch(challint)
		{
			case 1:
			{
				player zm_score::add_to_player_score(1530);
				player PlaySound("cha_ching");
				break;
			}
			case 2:
			{
				zm_powerups::specific_powerup_drop( "full_ammo", player.origin );
				break;
			}
			case 3:
			{
				zm_powerups::specific_powerup_drop( "carpenter", player.origin );
				player.b_has_upgraded_origins_shield = true;
				ClientPrint(player, "Your shield has been upgraded! You may need to pick it up from the table again for the upgrade to work!");
				break;
			}
		}
		WAIT_SERVER_FRAME;
	}
	self Delete();
	fxorb Delete();
}

function spinallaxis(speed)
{
	self endon("death");
	while(1)
	{
		self RotatePitch(360, speed);
		self RotateRoll(360, speed);
		self RotateYaw(360, speed);
		wait(speed);	
	}
}

function zulubodies()
{
	//delete bodies so the amount of bodies matches the player count
	maxplayercount = 4;
	zulubodies = GetEntArray("zulubody", "targetname");
	level waittill("initial_blackscreen_passed");
	players = GetPlayers();
	player_count = players.size;
	if(player_count == 0) player_count = 1;
	excessbodies = maxplayercount - player_count;
	if(excessbodies != 0)
	{
		for(i = 0; i < excessbodies; i++)
		{
			zulubodies[i] Delete();
		}
	}

}

function flytheplayer(index, roofcanisters, time)
{
	//moving_ent = Spawn( "script_model",self.origin );
	//moving_ent SetModel( "tag_origin" );
	//WAIT_SERVER_FRAME;
	//modeltolink = util::spawn_model("tag_origin", self.origin);
	//ent = spawn("script_origin",self.origin);
	self DisableOffhandWeapons();
	self DisableWeapons();
	self SetStance("stand");
	self FreezeControlsAllowLook(true);
	roofcanisters[index] EnableLinkTo();
	ogloc = roofcanisters[index].origin;
	self PlayerLinkTo(roofcanisters[index]);
	roofcanisters[index] MoveTo(level.ihopmeteorspots[index].origin, time, 1, .3);
	wait(time);
	roofcanisters[index] MoveTo(ogloc, time);
	//if(bool) filter::enable_filter_ev_interference(self);
	///else filter::disable_filter_ev_interference(self);
	wait(time);
	self Unlink();
	self EnableWeapons();
	self EnableOffhandWeapons();
	self FreezeControlsAllowLook(false);
}


function canistersoulboxes()
{
	if(!level.mainquestdebug) level waittill("condomssussedagreare");
	if(level.mainquestdisabled) return;
	level.aresoulcanistersfilledee = false;
	foreach(player in GetPlayers())
	{
		player.hascanister = false;
	}
	roofcanisters = GetEntArray("roofcanister", "targetname");
	
	//level thread playercansitersoulboxes();
	//each canister is a personal soulbox per player that must be filled. 
	players = GetPlayers();
	//Self is the canister array here
	level.playercanisterscount = 0;
	for(i = 0; i < players.size; i++)
	{
		level thread spawnandcreatetrig(i, roofcanisters, players);
	}
}

function spawnandcreatetrig(i, arraystuff, players)
{
		triguse = Spawn( "trigger_radius_use", arraystuff[i].origin + ( 0, 0, 23 ), 0, 90, 90 );
		WAIT_SERVER_FRAME;
		triguse UseTriggerRequireLookAt();
		triguse SetVisibleToAll();
		triguse SetTeamForTrigger( "none" );
		triguse TriggerIgnoreTeam();
		triguse SetCursorHint("HINT_NOICON");
		triguse SetHintString(players[i].playername+"'s Depleted Canister");
		triguse SetHintStringForPlayer(players[i],"Press ^2[{+activate}]^7 To Pickup Depleted Canister");
		triguse.playerint = i;
		triguse thread handlecanisterpickupandfill(players, arraystuff);
}
function handlecanisterpickupandfill(playerarray, modelarray)
{
	//this causes a crash somehow, infinite loop somewhere? investigate it.
	while(1)
	{
		self waittill("trigger", player);
		if(player == playerarray[self.playerint] && player GetStance() == "stand")
		{
			modelarray[self.playerint] thread spawnmodelandfxwithnotifydestroy("destruct/fx_dest_robot_body_sparks", self.playerint, modelarray);
			modelarray[self.playerint] Hide();
			//+ (0,-15,50)
			playercanister = util::spawn_model("p7_collectible_stand_11", player.origin + (0,-15,37));
			WAIT_SERVER_FRAME;
			playercanister SetScale(2);
			playercanister EnableLinkTo();
			playercanister MoveTo(player GetTagOrigin("tag_stowed_back"),0.05);
			playercanister LinkToBlendToTag( player, "tag_stowed_back", false, false);
			//player Attach(playercanister, "tag_stowed_back", true);
			//playercanister LinkTo(player);
			//playercanister LinkTo(player);
			player.playercanister = playercanister;
			player PlaySound("zmb_craftable_pickup");
			player.canisterkilledzombies = 0;
			//array::add(player, level.canistersoulboxlist);
			player.hascanister = true;
			//IPrintLnBold("triggered");
			level.playercanisterscount ++;
			level thread checkplayercanistercount(level.playercanisterscount);
			//think about the possibility of a player bleedout here, could cause canister to disappear.
			break;
		}
		else player SetStance( "stand" );
		WAIT_SERVER_FRAME;
	}
	WAIT_SERVER_FRAME;
	self Delete();
}

function checkplayercanistercount(int)
{
	players = GetPlayers();
	if(int == players.size) 
	{
		level notify("allplayershavecanisters");
		IPrintLn("All canistersgrabb");
	}
	
}

function teleportersoulcanisterfxhint()
{
	fxhintspot = GetEnt("soulcanistertphintfx", "targetname");
	level endon("temporalenergycanisterscharged");
	players = GetPlayers();
	while(1)
	{
		playerstouching = 0;
		foreach(player in GetPlayers())
		{
			if(player isTouching(level.teleportdetectplayerzombies))
			{
				playerstouching++;
			}
		}
		if(players.size == playerstouching)
		{
			if(!isdefined(level.fxhintitem))
			{
				level.fxhintitem = util::spawn_model("tag_origin", fxhintspot.origin);
				WAIT_SERVER_FRAME;
				level.fxhintitem PlaySound("glyphactivate");
				PlayFXOnTag("dlc4/genesis/fx_rune_glow_purple", level.fxhintitem, "tag_origin");
			}
		}
		else
		{
			if(isdefined(level.fxhintitem)) level.fxhintitem Delete();
		}
		WAIT_SERVER_FRAME;
	}
}

function watchplayerstouchingforhint()
{
	players = GetPlayers();
	while(1)
	{
		playerstouching = 0;
		foreach(player in GetPlayers())
		{
			if(player isTouching(level.teleportdetectplayerzombies))
			{
				playerstouching++;
			}
		}
		if(playerstouching == players.size)
		{
			continue;
		}
		else
		{
			return;
		}
		WAIT_SERVER_FRAME;
	}
}

function placedowncanisterandfx(int, modelarray, fxmod)
{
	i = int;
	players = GetPlayers();
	fxstartpoint = struct::get("fxtowerstart", "targetname");
	triguse = Spawn( "trigger_radius_use", modelarray[int].origin + ( 0, 0, 23 ), 0, 90, 90 );
	WAIT_SERVER_FRAME;
	triguse UseTriggerRequireLookAt();
	triguse SetVisibleToAll();
	triguse SetTeamForTrigger( "none" );
	triguse TriggerIgnoreTeam();
	triguse SetCursorHint("HINT_NOICON");
	triguse SetHintString("");
	triguse SetHintStringForPlayer(players[i],"Press ^2[{+activate}]^7 To Place Filled Canister");
	triguse.playerint = i;
	triguse thread handlecanisterplaceandfx(players, modelarray[int], fxmod);
}

function handlecanisterplaceandfx(playerarray, model, fxmod)
{
	//this causes a crash somehow, infinite loop somewhere? investigate it.
	fxstartpoint = struct::get("fxtowerstart", "targetname");
	while(1)
	{
		self waittill("trigger", player);
		if(player == playerarray[self.playerint])
		{
			player.playercanister StopLoopSound(0.5);
			player.playercanister Delete();
			model SetModel("p7_collectible_stand_11_charged");
			model PlayLoopSound("mogusloopominous", 1);
			model Show();
			fxmod Delete();
			fxmod2 = util::spawn_model("tag_origin", self.origin+ (0,0,5));
			WAIT_SERVER_FRAME;
			fxmod2 EnableLinkTo();
			fxmod2 LinkTo(model);
			PlayFXOnTag(level.soulfx, fxmod2, "tag_origin");
			player PlaySound("build_done");
			level.placedcanistercounter ++;
			self TriggerEnable(false);
			break;
		}
		WAIT_SERVER_FRAME;
	}
	
	earthQuake(.3, 3, model.origin, 250);
	fxmod3 = util::spawn_model("tag_origin", model.origin + (0,0,5));
	WAIT_SERVER_FRAME;
	PlayFXOnTag(level.soulfx, fxmod3, "tag_origin");
	fxmod3 MoveTo(fxstartpoint.origin, 2.5);
	fxmod3 PlaySound("soulabsorbtotower");
	wait 2.5;
	PlaySoundAtPosition("soulabsorb", fxmod3.origin);
	WAIT_SERVER_FRAME;
	if(level.placedcanistercounter == playerarray.size)
	{
		level notify("allcanistersplacedee");
		earthQuake(.6, 3, fxstartpoint.origin, 1500);
		PlaySoundAtPosition("towerfullyloaded", (0,0,0));
		ttowerbuttonfxspot = GetEnt("ttowerbuttonfxspot", "targetname");
		PlayFXOnTag("light/fx_light_button_red_train_zod_zmb", ttowerbuttonfxspot, "tag_origin");
		ttowerbuttonfxspot PlaySound("buttonflipaj");

	}
	fxmod3 Delete();
	self Delete();
}


function spawnmodelandfxwithnotifydestroy(fx, int, modelarray)
{
	fxmod = util::spawn_model("tag_origin", self.origin);
	WAIT_SERVER_FRAME;
	PlayFXOnTag(fx, fxmod, "tag_origin");
	level waittill("temporalenergycanisterscharged");
	self thread placedowncanisterandfx(int, modelarray, fxmod);
}

function creatoreasteregginit()
{
	fishcreator = GetEntArray("fishcreator", "targetname");
	foreach(fish in fishcreator)
	{
		fish thread playercreatlook();
	}
}

function playercreatlook()
{
	level endon("creatorjumpscare");
	while(level.islevelbranch)
	{
		foreach(player in GetPlayers())
		{
			if(player zm_utility::is_player_looking_at(self.origin, 0.85, true, player) && player PlayerADS() == 1 && player checkifplayerhassniper())// 
			{
				player thread playercreatorjumpscare();
			}
		}
		wait(0.05);
	}
}

function checkifplayerhassniper()
{
	//check if a player has a sniper and that they are adsing to trigger the jumpscare
	snipers = array("sniper_fastbolt","sniper_fastsemi","sniper_powerbolt","sniper_double","sniper_quickscope","sniper_mosin","sniper_chargeshot","sniper_xpr50");
	foreach(sniper in snipers)
	{
		if(self GetCurrentWeapon() == GetWeapon(sniper))
		{
			return true;
		}
	}
	return false;
}

function playercreatorjumpscare()
{
	level notify("creatorjumpscare");
	jumpscare_overlay = NewClientHudElem( self ); 
	jumpscare_overlay.alignX = "center";
	jumpscare_overlay.alignY = "center";
	jumpscare_overlay.horzAlign = "center";
	jumpscare_overlay.vertAlign = "center";
	jumpscare_overlay SetShader( "creator", 960, 540 ); 
	jumpscare_overlay.alpha = 1; 
	self PlayLocalSound("chungrealityscare"); 
	wait(1); 
	jumpscare_overlay FadeOverTime( 1 ); 
	jumpscare_overlay.alpha = 0; 
	wait( 1 ); 
	jumpscare_overlay destroy();
	self PlayLocalSound("j2111morse");
}

function branchscenetest()
{
	sight = "zm_factory";
	level.ttowerelectricfx = array();
	level.placedcanistercounter = 0;
	roofcanisters = GetEntArray("roofcanister", "targetname");
	roofcanisters thread canistersoulboxes();
	roofcanisters thread hideinrelationtopcount();
	startingtrig = GetEnt("temporaltoweractivation", "targetname");
	startingtrig SetCursorHint("HINT_NOICON");
	startingtrig SetHintString("WARNING: Temporal Distortion Energy Is Low. Please Charge Canisters.");
	fxstartpoint = struct::get("fxtowerstart", "targetname");
	fxstartpointend = struct::get(fxstartpoint.target, "targetname");
	triggerstodisable = GetEntArray("hideduringee", "script_noteworthy");
	modelstohide = GetEntArray("modelhideduringee", "script_noteworthy");
	forcefieldparts = GetEntArray("branchforcefield", "targetname");
	foreach(part in forcefieldparts)
	{
		part Hide();
	}
	branchitems = GetEntArray("branchitem", "script_noteworthy");
	startingtrig UseTriggerRequireLookAt(1);
	level waittill("temporalenergycanisterscharged");
	foreach(player in GetPlayers())
	{
		player.playercanister SetModel("p7_collectible_stand_11_charged");
		player.playercanister PlayLoopSound("mogusloopominous", 1);
	}
	level waittill("allcanistersplacedee");
	//wait for canister charge
	startingtrig SetHintString("Press ^2[{+activate}]^7 To Bridge To Branch 2-B.");
	//upperforesttelespots = struct::get_array("upperforesttelespots", "targetname");
	//triggerstodisable = array(level.navcardint, level.elevator_trigger, level.elevator_trigger_top, level.elevator_trigger_outside_bottom, level.elevator_trigger_outside_top);
	isaltdimesion = true;
	if(level.mainquestdisabled)
	{
		startingtrig SetHintString("This functionality isn't ready in this build.");
		return;
		//level waittill("mainquestenabledagain");
	}
	while(1)
	{
		startingtrig SetHintString("Press ^2[{+activate}]^7 To Bridge To Branch 2-B.");
		startingtrig waittill("trigger", player);
		if(isaltdimesion == true)
		{
			//sight = "zombie_last_stand";
			//visionset_mgr::deactivate("visionset", sight);
			//sight = "desaturatedred";
			sight = "zombie_last_stand";
			//visionset_mgr::activate("visionset", sight);
			//sight = "zm_factory";
			level.islevelbranch = true;
			thread creatoreasteregginit();
			level.controlpanel StopLoopSound(0.5);
			//foreach(player in GetPlayers())
			//{
				//player clientfield::set("thesourcefx", 1);
			//}
		}
		else
		{
			//visionset_mgr::deactivate("visionset", sight);
			sight = "zm_factory";
			//visionset_mgr::activate("visionset", sight);
			level.islevelbranch = false;
			level.controlpanel PlayLoopSound("damneddrip", 5);
			//foreach(player in GetPlayers())
			//{
				//player clientfield::set("thesourcefx", 0);
			//}
		}
		startingtrig SetHintString("It cannot be stopped...");
		startingtrig PlaySound("buttonpressaj_2");
		wait(0.2);
		startingtrig PlaySound("altcomputeractivate");
		fxorb = util::spawn_model("tag_origin", fxstartpoint.origin);
		fxorb3 = util::spawn_model("tag_origin", fxstartpoint.origin);
		fxorb3 EnableLinkTo();
		WAIT_SERVER_FRAME;
		fxorb3 LinkTo(fxorb);
		PlayFXOnTag("dlc1/castle/fx_ee_pyramid_energy_ball", fxorb, "tag_origin");
		PlayFXOnTag("dlc1/castle/fx_castle_electric_cherry_trail", fxorb, "tag_origin");
		PlayFXOnTag("dlc1/castle/fx_light_castle_ruinorb_vol", fxorb3, "tag_origin");
		fxorb PlayLoopSound("mogusloopominous");
		//thread talktoallplayers("unravelingee");
		//fxorb MoveTo(fxstartpointend.origin, 90);
		movedistance = 1312.25 - 237;
		fxorb MoveZ(movedistance, 5);
		wait(5);
		foreach(player in GetPlayers())
		{
			player EnableInvulnerability();
			player notify("stop_player_out_of_playable_area_monitor");
		}
		fxorb2 = util::spawn_model("tag_origin", fxorb.origin);
		WAIT_SERVER_FRAME;
		fxorb Delete();
		PlayFXOnTag("dlc3/stalingrad/fx_dragonstrike_portal_flash", fxorb2, "tag_origin");
		earthQuake(.6, 3, fxstartpoint.origin, 1500);
		fxorb2 PlaySound("portalexplodesee");
		wait(1);
		players = GetPlayers();
		foreach(player in GetPlayers())
		{
			player.filteractivated = true;
			player.filtertype = "rooms";
		}
		for(i = 0; i < players.size; i++)
		{
			player thread flytheplayer(i, roofcanisters, 3);
			
		}
		foreach(player in GetPlayers())
		{
			player thread lui::screen_fade_out(0.5, "white");
		}
		wait(0.5);
		foreach(player in GetPlayers())
		{
			player.filteractivated = false;
			player.filtertype = "branch";
			player.filteractivated = true;
			player.filtertype = "branch";
			player.filteractivated = false;
		}
		wait(0.05);
		level thread changemodelstobranch(isaltdimesion, branchitems);
		level thread branchhidetriggers(isaltdimesion, triggerstodisable);
		level thread hideeemodelssometimes(isaltdimesion, modelstohide);
		level thread movebranchforcefield(isaltdimesion, forcefieldparts);
		if(isaltdimesion)
		{
			level notify("level_branched");
			level notify("storycriteescene");
			level thread enablezombies(false);
			//level flag::clear( "spawn_zombies" );
			//level flag::clear( "zombie_drop_powerups");
			level util::set_lighting_state(2);
			level.darknessactive = true;
			foreach(player in GetPlayers())
			{
				player.filteractivated = true;
				player.filtertype = "branch";
			}
				
		}
		else
		{
			level notify("level_unbranched");
			level notify("storycritsceneended");
			level thread enablezombies(true);
			//level flag::set( "spawn_zombies" );
			//level flag::set( "zombie_drop_powerups");
			level util::set_lighting_state(0);
			level.darknessactive = false;
			foreach(player in GetPlayers())
				player.filteractivated = false;
		}
		level thread killallzs();
		PhysicsExplosionCylinder(startingtrig.origin, 800, 300, 50);
        fxorb2 Delete();
		fxorb3 Delete();
		wait(2.5);
		level notify("videoscreenquest");
		foreach(player in GetPlayers())
		{
			VisionSetNaked(sight, 1);
			player thread lui::screen_fade_in(7);
			player shellshock( "explosion", 2);

		}
		wait(8);
		foreach(player in GetPlayers())
		{
			player DisableInvulnerability();
			player thread zm::player_out_of_playable_area_monitor();
		}		
		isaltdimesion = !isaltdimesion;
		wait(10);
		level notify("videoscreenquestended");
	}
}

function movebranchforcefield(bool, brusharray)
{
	movedistance = 5054;
	if(bool)
	{
		temp = movedistance * -1;
	}
	else
	{
		temp = movedistance;
	}
	foreach(brush in brusharray)
	{
		if(bool)
		{
			brush Show();
		}
		else
		{
			brush Hide();
		}
		brush MoveZ(temp, 0.05);
	}
}

function branchhidetriggers(bool, trigarray)
{
	//During the branch scene multiple easter eggs are disabled to prevent the player from possibly being teleported out of the area. All teleport eggs and content should be disabled here to prevent major problems.
	if(bool)
	{
		foreach(trig in trigarray)
		{
			trig TriggerEnable(0);
			//trig Hide();
		}
	}
	else
	{
		foreach(trig in trigarray)
		{
			trig TriggerEnable(1);
			//trig Show();
		}
	}
	
}

function hideeemodelssometimes(bool, modelarray)
{
	if(bool)
	{
		foreach(model in modelarray)
		{
			model Hide();
		}
	}
	else
	{
		foreach(model in modelarray)
		{
			if(model.shouldbevisible) model Show();
		}
	}
}

function changemodelstobranch(bool, branchitems)
{
	//Implementation is a single script_noteworthy on all items that "branch", each item also has a script_string that is two model names seperated by commas. The first model in the list is the default model and the second model in the list is the "branched" model.
	//Changing the models can be done in a simple for loop that grabs the item's alt or original model and sets the model to that value.
	for(i = 0; i < branchitems.size; i++)
	{
		modelstrings = StrTok(branchitems[i].script_string, ",");
		/*
		foreach(string in modelstrings)
		{
			wait(1);
			IPrintLnBold(string);
		}
		*/
		//When we change the model we check if an altangles or normal angles rotation vector exists, and we rotate to it.
		if(bool == true)
		{
			branchitems[i] SetModel(""+modelstrings[1]);
			//if(isdefined(branchitems[i].altangles)) branchitems RotateTo(branchitems[i].altangles, 0.05);
		}
		else
		{
			branchitems[i] SetModel(""+modelstrings[0]);
			//if(isdefined(branchitems[i].normalangles)) branchitems RotateTo(branchitems[i].normalangles, 0.05);
		}
	}	
}


function hideinrelationtopcount()
{
	players = GetPlayers();
	//if the player size is smaller than the array size
	//this hides objects that may nessicary for an EE we don't delete just in case someone joins in progress as this could break the whole egg
	if(players.size < self.size)
	{
		missingplayers = self.size - players.size;
		//for each "missing player" we hide one of the array items. 
		//we use two variables, one to track iterations and one that starts at the max spot in the array, we subtract from the i variable until the amount of iterations equals the missing players. Hiding an item each time
		compint = 0;
		i = self.size - 1;
		//for(compint = 0, i = self.size - 1; compint != missingplayers; i--, compint++)
		//{
			//self[i] Hide();
		//}
		while(1)
		{
			self[i] Hide();
			compint ++;
			i --;
			if(compint == missingplayers) break;
		}
	}
}

//this function is depreciated and dosen't run or function any more!
function towerscenetest()
{
	//this code is depreaciated and not threaded to run at all
	//hide canisters if the player is count isn't "full" 4 players is considered full
	roofcanisters = GetEntArray("roofcanister", "targetname");
	
	startingtrig = GetEnt("temporaltoweractivation", "targetname");
	startingtrig SetCursorHint("HINT_NOICON");
	startingtrig SetHintString("Press ^2[{+activate}]^7 To Leave This Plain.");
	fxstartpoint = struct::get("fxtowerstart", "targetname");
	fxstartpointend = struct::get(fxstartpoint.target, "targetname");
	upperforesttelespots = struct::get_array("upperforesttelespots", "targetname");
	startingtrig UseTriggerRequireLookAt(1);
	startingtrig waittill("trigger", player);
	startingtrig SetHintString("It cannot be stopped...");
	startingtrig PlaySound("buttonpressaj_2");
	wait(0.2);
	startingtrig PlaySound("altcomputeractivate");
	fxorb = util::spawn_model("tag_origin", fxstartpoint.origin);
	fxorb3 = util::spawn_model("tag_origin", fxstartpoint.origin);
	fxorb3 EnableLinkTo();
	WAIT_SERVER_FRAME;
	fxorb3 LinkTo(fxorb);
	PlayFXOnTag("dlc1/castle/fx_ee_pyramid_energy_ball", fxorb, "tag_origin");
	PlayFXOnTag("dlc1/castle/fx_light_castle_ruinorb_vol", fxorb3, "tag_origin");
	fxorb PlayLoopSound("mogusloopominous");
	//thread talktoallplayers("unravelingee");
	//fxorb MoveTo(fxstartpointend.origin, 90);
	movedistance = 1312.25 - 237;
	fxorb MoveZ(movedistance, 10);
	//for(i = 0; i < level.players.size; i++)
	//{
		//level.players[i] thread flytheplayer(i, roofcanisters);
	//}
	wait(10);
	//for(i = 0; i < level.players.size; i++)
	//{
		//level.players[i] thread flytheplayer(i, roofcanisters);
	//}
	//foreach(player in GetPlayers())
		//player EnableInvulnerability();
	fxorb2 = util::spawn_model("tag_origin", fxorb.origin);
	WAIT_SERVER_FRAME;
	fxorb Delete();
	PlayFXOnTag("dlc3/stalingrad/fx_dragonstrike_portal_flash", fxorb2, "tag_origin");
	earthQuake(.6, 3, fxstartpoint.origin, 1500);
	fxorb2 PlaySound("portalexplodesee");
	foreach(player in GetPlayers())
		player thread lui::screen_fade_out(1, "white");
	wait(0.5);
	level flag::clear( "spawn_zombies" );
	level flag::clear( "zombie_drop_powerups");
	zombies = GetAiSpeciesArray( level.zombie_team, "all" );
        if ( isdefined( zombies ) )
        {
            array::run_all( zombies, &Kill );
        }
	fxorb2 Delete();
	fxorb3 Delete();
	wait(1.5);



	/*
	normalhallwayspots = struct::get_array( "normalhallway", "targetname" );
	chunguscinematic1 = struct::get_array( "chunguscinematicpos1", "targetname" );
	foreach(player in GetPlayers())
	{
		player notify("stop_player_out_of_playable_area_monitor");
		
		player DisableWeapons();
        player DisableOffhandWeapons();
		player EnableInvulnerability();
        player SetOrigin(normalhallwayspots[player.characterIndex].origin);
        player SetPlayerAngles(normalhallwayspots[player.characterIndex].angles);
        player.ignoreme = true;
        PlayFX(level.oildisappear, player.origin);
        player flagsys::set( "playing_movie_hide_hud" );
		player util::show_hud( 0 );
	}
	wait(5);
	*/
	foreach(player in GetPlayers())
	{
		VisionSetNaked( "zombie_last_stand", 1);
		player thread lui::screen_fade_in(1.5);
		player shellshock( "explosion", 2);
	}
	/*
	wait(10);
	foreach(player in GetPlayers())
	{
		VisionSetNaked( "zm_factory", 1);
        player EnableWeapons();
        player EnableOffhandWeapons();
        player DisableInvulnerability();
        player.ignoreme = false;
        player SetOrigin(upperforesttelespots[player.characterIndex].origin);
        player SetPlayerAngles(upperforesttelespots[player.characterIndex].angles);
	}
	wait(40);
	foreach(player in GetPlayers())
	{
		VisionSetNaked( "zm_factory", 1);
		player flagsys::clear( "playing_movie_hide_hud" );
		player util::show_hud( 1 );
		player thread zm::player_out_of_playable_area_monitor();
        player EnableWeapons();
        player EnableOffhandWeapons();
        player DisableInvulnerability();
        player.ignoreme = false;
        player SetOrigin(level.temproofspots[player.characterIndex].origin);
        player SetPlayerAngles(level.temproofspots[player.characterIndex].angles);
	}*/
	wait(1);
	level flag::set( "spawn_zombies" );
	level flag::set( "zombie_drop_powerups");
	level thread towerscenetest();
}





function killallzs()
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

function talktoallplayers(sound)
{
	foreach(player in GetPlayers())
	{
		player PlayLocalSound(sound);
	}
}

/*
function qditemssetup()
{
	level waittill("initial_blackscreen_passed");
	foreach(player in GetPlayers())
	{
		player.inqdzone = false;
	}
	level.qd_player_count = 0;
	level.qdisrunning = true;
	level flag::clear("qdfiretime");
	level flag::clear("qdplayer1");
	level flag::clear("qdplayer2");
	level thread qd_checkplayers();
	level thread qdtriggerhintcheck();
	level thread qdteleportplayers();
	level waittill("end_game");
	level.qdisrunning = false;
}

function qd_checkplayers()
{
	players = GetPlayers();
	while(level.qdisrunning == true)
	{
		for(i = 0; i < players.size; i++)
		{
			if(players[i] IsTouching(level.qdplayerdetect))
			{
				if(level.qd_player_count < 2)
				{
					if(players[i].inqdzone != true)
					{
						players[i].inqdzone = true;
						level.qd_player_count ++;
					}
				}
				else
				{
					continue;
				}
			}
			else
			{
				if(players[i].inqdzone != false)
				{
					if(level.qd_player_count > 0)
					{
						players[i].inqdzone = false;
						level.qd_player_count --;
					}
				}
			}
			wait(0.05);
		}
		level thread qdtriggerhintcheck();
		//IPrintLnBold(level.qd_player_count);
		wait(0.05);
	}
}

function checkplayerqdtimes(player1, player2, player1time, player2time, overallservertime)
{
	//get the difference in time between the fire command and the player reaction.
	player1time -= overallservertime;
	player2time -= overallservertime;

	if(player1time > player2time)
	{
		IPrintLnBold ("^2"+player1.playername + " Won!");
		IPrintLnBold (player1.playername + ": "+player1time + " vs " + player2.playername + ": "+ player2time);
		wait(3);
		
	}
	if(player2time > player1time)
	{
		IPrintLnBold ("^2"+player2.playername + " Won!");
		IPrintLnBold (player1.playername + ": "+player1time + " vs " + player2.playername + ": "+ player2time);
		wait(3);
	}
	if(player1time == player2time)
	{
		IPrintLnBold ("^2"+player1.playername + " and " + player2.playername + " Drawed!");
		IPrintLnBold (player1time + " vs " + player2time);
		wait(3);
	}
	level notify("playertimeschecked");
}

function qdtriggerhintcheck()
{
	if(level.qd_player_count == 2)
	{
		level.qdtriggeractivate UseTriggerRequireLookAt();
		level.qdtriggeractivate SetCursorHint("HINT_NOICON");
		level.qdtriggeractivate SetHintString("Press ^2[{+activate}]^8 To Activate Quickdraw " + level.qd_player_count + " Players in range.");
	}
	else
	{
		level.qdtriggeractivate UseTriggerRequireLookAt();
		level.qdtriggeractivate SetCursorHint("HINT_NOICON");
		level.qdtriggeractivate SetHintString("This game only supports 2 players. " + level.qd_player_count + " Players in range.");
	}
}

function qdstartgameattempt()
{
	level.qdisrunning = false;
	playerqdamount = 0;

	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		if(players[i].inqdzone == true)
		{
			players[i] SetOrigin( level.playerqdstart[playerqdamount].origin ); 
        	players[i] SetPlayerAngles( level.playerqdstart[playerqdamount].angles );
        	players[i] DisableOffhandWeapons();
        	players[i] AllowJump(false);
			players[i] SetMoveSpeedScale(0);
			if(playerqdamount == 0)
			{
				players[i].qdnum = playerqdamount;
				player1save = players[i];
			}
			else if(playerqdamount == 1)
			{
				players[i].qdnum = playerqdamount;
				player2save = players[i];
			}
			playerqdamount ++;
		}
		else
		{
			continue;
		}
	}
		player1time = level thread qdgamethread(player1save, "qdplayer1");
		player2time = level thread qdgamethread(player2save, "qdplayer2");
		player1save PlaySound("vox_qdfaceeachother");
		IPrintLnBold ("Face Each Other");
		intrandtime = RandomFloatRange(5.0, 11.0);
		wait(intrandtime);
		IPrintLnBold ("FIRE");
		player1save PlaySound("vox_qdfire");
		overallservertime = GetTime();
		level flag::set("qdfiretime");
		while(1)
		{
			if(level flag::get("qdplayer1") && level flag::get("qdplayer2"))
			{
				break;
			}
			else
			{
				wait(0.05);
				continue;
			}
		}
		level thread checkplayerqdtimes(player1save, player2save, player1time, player2time, overallservertime);
		level waittill("playertimeschecked");
		player1save PlaySound("vox_qdwelldone");
		player1save SetOrigin( level.playerqdend[player1save.qdnum].origin ); 
        player1save SetPlayerAngles( level.playerqdend[player1save.qdnum].angles );
        player1save DisableOffhandWeapons();
        player1save AllowJump(true);
		player1save SetMoveSpeedScale(1);
		player2save SetOrigin( level.playerqdend[player1save.qdnum].origin ); 
        player2save SetPlayerAngles( level.playerqdend[player1save.qdnum].angles );
        player2save DisableOffhandWeapons();
        player2save AllowJump(true);
		player2save SetMoveSpeedScale(1);
		level thread qditemssetup();
}


function qdteleportplayers()
{
	while(level.qdisrunning == true)
	{	
		level.qdtriggeractivate waittill("trigger", player);
		if(level.qd_player_count != 2)
		{
			IPrintLnBold ("This game is only built to work with 2 players.");
			level.qdtriggeractivate PlaySound("defaultfail");
			continue;
		}
		level thread qdstartgameattempt();
		wait(0.05);
	}
}


function qdgamethread(player, flag)
{
	while(1)
	{
		player waittill("weapon_fired", weap);
		if(!level flag::get("qdfiretime"))
		{
			IPrintLnBold ("^2"+player.playername + " Jumped the gun");
		}
		else
		{
			level flag::set(flag);
			return GetTime();
			break;
		}
	}
}
*/

function questteleporter()
{
	level endon("resetchilisteleporter");
	teleporterfxspot = GetEnt("chilisteleporterfxspot", "targetname");
	teleporterfxspot Hide();
	//level.mainquestteleportactivate SetHintString("Teleportation Verification Failed.");
	//if(!level.mainquestdebug) level waittill("condomssussedagreare");
    level.black_spots = struct::get_array( "black_orgs", "targetname" );
    level.tpamount = 0;
    //level thread playerdeathcallback();
    level.black_spots_targets = []; 
    for( i=0;i<level.black_spots.size;i++ )
    {
		level.black_spots_targets[i] = struct::get( level.black_spots[i].target, "targetname" );
    }
    level.mainquestteleportactivate SetHintString("Press ^2[{+activate}]^7 To Activate Teleporter");
	level.mainquestteleportactivate SetCursorHint("HINT_NOICON");
	level.mainquestteleportactivate waittill("trigger", player);
	level.mainquestteleportactivate PlaySound("buttonpressaj_2");
	wait(0.1);
	level.mainquestteleportactivate PlaySound("altcomputeractivate");
	level.mainquestteleportactivate SetHintString("Teleporter is currently active. Destination set to ROOF");
	level.mainquestteleportactivate PlaySound("computerterminalcomplete");

	level.teleporterchilisfxspot = util::spawn_model("tag_origin", teleporterfxspot.origin);
	WAIT_SERVER_FRAME;
	PlayFXOnTag("zombie/fx_ritual_gatestone_tentacle_glow", level.teleporterchilisfxspot, "tag_origin");
	level.teleporterchilisfxspot PlaySound("chilisportalopen");
	wait(0.5);
	level.teleporterchilisfxspot PlayLoopSound("chilisportallp", 0.5);
	PlayFXOnTag("zombie/fx_ritual_gatestone_portal_zod_zmb", level.teleporterchilisfxspot, "tag_origin");
	while(1)
	{
		level.mainquestteleportdetect waittill("trigger", player);
		player thread roofteleport();
		WAIT_SERVER_FRAME;
	}
}

 
function roofteleport()
{
		self setstance( "stand" );
		wait(0.1);
        self playlocalsound( "kino_teleport_2d" );
        self DisableWeapons();
        self DisableOffhandWeapons();
        self freezecontrols( true );
        self SetOrigin( level.black_spots[self.characterIndex].origin ); 
        self SetPlayerAngles( level.black_spots[self.characterIndex].angles );
        playfx( KINO_SWIRL2, level.black_spots_targets[self.characterIndex].origin ); 
        wait(2);
        self EnableWeapons(); 
        self EnableOffhandWeapons(); 
        self freezecontrols( false );
        self SetOrigin(level.chilisteleportdestination[self.characterIndex].origin);
        self SetPlayerAngles(level.chilisteleportdestination[self.characterIndex].angles);
        PlayFX(level.oildisappear, self.origin);
        self StopLoopSound(1);
        wait(0.05); 
        self playlocalsound( "kino_beam_fx" );
        self setstance( "stand" );
}



	

function pantrystepsetup()
{
	//init game objects
	pantryswitchinteract = GetEnt("pantrysecretdoortrigger","targetname");
	pantryswitchinteract SetHintString("");
	pantryswitchinteract SetCursorHint("HINT_NOICON");
	pantryswitchfxspot = GetEnt("pantrysecretdoorfxspot","targetname");
	pantrysecretdoor = GetEnt("pantrysecretdoor_door","targetname");
	pantryblockade = GetEntArray("pantrysecretdoorblockade","targetname");
	//teleporter
	level.mainquestteleportdetect = GetEnt("questteleporter","targetname");
	level.mainquestteleportactivate = GetEnt("questteleporteractivate","targetname");
	level.mainquestteleportactivate UseTriggerRequireLookAt();
	level.mainquestteleportactivate SetHintString("How tf are u in here...");
	level.mainquestteleportactivate SetCursorHint("HINT_NOICON");
	//level.temproofspots = struct::get_array( "roofarrivalspots", "targetname" );  // use structs instead of script_origins as they don't go towards the entity limit
	//level thread questteleporter();
	//endteleporter
	//end game objects
	pantryswitchfxspot Hide();
	buttonfxspotred = util::spawn_model("tag_origin", pantryswitchfxspot.origin);
	WAIT_SERVER_FRAME;
	PlayFXOnTag("light/fx_light_button_yellow_traincar_zod_zmb", buttonfxspotred, "tag_origin");
	level thread triggerdoorfail(pantryswitchinteract);
	if(!level.mainquestdebug) level waittill("startact2mainquest");
	WAIT_SERVER_FRAME;
	if(level.mainquestdisabled)
	{
		pantryswitchinteract SetHintString("This functionality isn't ready in this build");
		break;
	}
	pantryswitchinteract SetHintString("????");
	pantryswitchinteract PlaySound("buttonflipaj");
	buttonfxspotred Delete();
	buttonfxspotred = util::spawn_model("tag_origin", pantryswitchfxspot.origin);
	WAIT_SERVER_FRAME;
	PlayFXOnTag("light/fx_light_button_green_traincar_zod_zmb", buttonfxspotred, "tag_origin");
	pantryswitchinteract PlayLoopSound("questpantrybutton");
	pantryswitchinteract waittill("trigger", player);
	pantryswitchinteract SetHintString("");
	pantryswitchinteract StopLoopSound(0.2);
	pantryswitchinteract PlaySound("buttonpressaj_1");
	wait(.1);
	pantryswitchinteract PlaySound("longbeep");
	earthQuake(.6, 3, pantrysecretdoor.origin, 700);
	buttonfxspotred Delete();
	buttonfxspotred = util::spawn_model("tag_origin", pantryswitchfxspot.origin);
	WAIT_SERVER_FRAME;
	PlayFXOnTag("light/fx_light_button_yellow_traincar_zod_zmb", buttonfxspotred, "tag_origin");

	//move door down
	foreach(item in pantryblockade)
	{
		PlayFX(level._effect["poltergeist"], item.origin);
		item MoveZ(120, 2);
	}
	pantrysecretdoor PlayLoopSound("cent_alarm");
	pantrysecretdoor MoveZ(-200, 3);
	pantrysecretdoor PlaySound("dooropen_2");
	wait(2);
	foreach(item in pantryblockade)
	{
		item Delete();
	}
	wait(1);
	pantrysecretdoor StopLoopSound(0.1);
	pantrysecretdoor Delete();
	level thread moveQuestTableItems(1);
	pantryswitchinteract Delete();

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

//Move old items in the room and replace them with the epic meme table
//Probably temp solutiion

function moveQuestTableItems(int)
{
	hideItems = GetEntArray("questbigmactabledebirs", "script_noteworthy");
	deleteItems = GetEntArray("questbigmactabledebirs2", "script_noteworthy");
	largertableclip = GetEnt("largerbigmactableclip", "targetname");

	if(int == 0)
	{
		foreach(item in hideItems)
		{
			item Hide();
		}

	}
	else if(int == 1)
	{
		IPrintLnBold("Verification Required, please verify at maintenance room station.");

		largertableclip Delete();

		foreach(item in deleteItems)
		{
			thread PlayFxWithCleanup(level._effect["poltergeist"], item.origin);
			item MoveZ(300, 2);
		}

		wait(1);

		foreach(item in deleteItems)
		{
			item Delete();
		}

		foreach(item in hideItems)
		{
			thread PlayFxWithCleanup(level._effect["poltergeist"], item.origin);
			item Show();
		}

		level notify("pantrydoorisnowdown");
	}
}

function triggerdoorfail(trigger)
{
	level endon("startact2mainquest");
	trigger UseTriggerRequireLookAt();
	while(1)
	{
		trigger waittill("trigger", player);
		trigger PlaySoundWithNotify("aetherdoorfail", "soundcomplete");
		trigger waittill("soundcomplete");
		wait(5);
	}
}

function deliveryteleportcutscenevideo()
{
	self PlayLocalSound("ingredientcutscene");
    self lui::play_movie( "chungusingredientcutscene", "fullscreen", true, false);
}


function deliveryteleportcutscene()
{
		self notify("stop_player_out_of_playable_area_monitor");
		normalhallwayspots = struct::get_array( "normalhallway", "targetname" );
		chunguscinematic1 = struct::get_array( "chunguscinematicpos1", "targetname" );
		self DisableWeapons();
        self DisableOffhandWeapons();
		self EnableInvulnerability();
        self SetOrigin(chunguscinematic1[self.characterIndex].origin);
        self SetPlayerAngles(chunguscinematic1[self.characterIndex].angles);
        self.ignoreme = true;
        thread PlayFxWithCleanup(level.oildisappear, self.origin, 1);
        self FreezeControls(true);
        self shellshock( "explosion", 0.5 );
        //self thread lui::screen_flash( .1, 0.1, 1.0, 1.0, "white" );
        //wait(0.2);
        level notify("maincutscenestarted");
        foreach (player in GetPlayers())
        {
        	player StopSound("barrybhint");
        }
        self thread lui::screen_fade_out(0.5);
        wait(2);
        self SetOrigin(normalhallwayspots[self.characterIndex].origin);
        self SetPlayerAngles(normalhallwayspots[self.characterIndex].angles);
        WAIT_SERVER_FRAME;
        //Example: level lui::screen_flash( 0.2, 0.1, .5, 1.0, "white" ); // fade to 1.0 alpha white over 0.2s, hold for 0.5s, and fade back in over 1.0s"
        self PlayLocalSound("ingredientcutscene");
        self thread lui::play_movie( "chungusingredientcutscene", "fullscreen", true, false);
       // PlayFX(level.oildisappear, self.origin);
       //this is to prevent a possible hard lock
       	wait(13);
        //self waittill("movie_done");
        self thread lui::screen_fade_in(5);
        //wait(13);
        VisionSetNaked( "zombie_last_stand", 1);
        self FreezeControls( false );
       	self PlayLocalSound("mozartscary");
        level notify("deliveryvideoconcluded");
    	//self lui::play_movie("chungusingredientcutscene", "fullscreen", false);
    	//self lui::stop_movie("chungusingredientcutscene");
    	//self thread lui::screen_flash( 0.0, 0.1, 7.0, 1.0, "black" );

    	
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


function eegatewaydeliversetup()
{
	//teleport players to gateway and block their vision with a cutscene until it concludes, fade from back to normal vision, lacrymosa plays again and a random door opens loud squeak, player enters door to be teleported back to the hotel. Player cannot move untill all players return or a 10 second timer is hit which forces teleport on the players, then the normal dialouge plays
	//after cutscene mute player audio and shake players screen to give a crazy broken down effect.
	gatewaydoors = GetEntArray("maineegatewaydoors", "targetname");
	teleportmainee1 = GetEnt("gatewayteleportmainee1", "targetname");
	teleportmainee2 = GetEnt("gatewayteleportmainee2", "targetname");
	chunguscinematic1 = struct::get_array( "chunguscinematicpos1", "targetname" );
	foreach(player in GetPlayers())
	{
		player thread lui::prime_movie( "chungusingredientcutscene" );
	}
	level waittill("beginchunguscutsceneee");
	level thread enablezombies(false);
	foreach(player in GetPlayers())
	{
		player thread deliveryteleportcutscene();
		player.acttwotele = false;
	}
	level waittill("deliveryvideoconcluded");
	wait(2);
	gatewaydoors[0] PlaySound("vox_unknown_findwhatsmissing");
	//gatewaydoors[1] PlayLoopSound("mozartscary", 0.5);
	thread zm_subtitles::subtitle_display(undefined, 3, "^1Unknown", "find the missing ingredient.");
	wait(15);
	randint = RandomInt(gatewaydoors.size);
	doorclip = GetEnt(gatewaydoors[randint].target, "targetname");
	ogdoorangles = gatewaydoors[randint] GetAngles();
	//save this int to open the same door later
	gatewaydoors[randint] RotateTo(gatewaydoors[randint].script_angles, 3);
	gatewaydoors[randint] PlaySound("louddoorsqueak");
	doorclip MoveZ(-200, 0.05);
	//doorclip Delete();
	level.acttwotelecount = 0;
	WAIT_SERVER_FRAME;
	teleportmainee1 thread gatewayteleports(chunguscinematic1);
	teleportmainee2 thread gatewayteleports(chunguscinematic1);
	if(level flag::get("solo_game") == false)
	{
		level thread acttwoforceteleport(30, chunguscinematic1);
	}
	level waittill("acttwoallplayerstele");
	foreach(player in GetPlayers())
	{
		earthQuake(.6, 3, player.origin, 450);
	}
	gatewaydoors[1] StopLoopSound(0.5);
	gatewaydoors[randint] RotateTo(ogdoorangles, 3);
	gatewaydoors[randint] PlaySound("louddoorsqueak");
	level notify("cutsceneover");
	level thread enablezombies(true);
	foreach(player in GetPlayers())
	{
		player flagsys::clear( "playing_movie_hide_hud" );
		player util::show_hud( 1 );
		player thread zm::player_out_of_playable_area_monitor();
        player EnableWeapons();
        player EnableOffhandWeapons();
        player DisableInvulnerability();
        player.ignoreme = false;
        player StopLocalSound("mozartscary");
	}
	doorclip MoveZ(200, 0.05);
	wait(1);
}


function restartmapandsave()
{
	level waittill("initial_blackscreen_passed");
	level thread alterplayervalues();
	foreach(player in GetPlayers())
	{
		if(isdefined(player.haslived))
		{
			player.haslived ++;
			IPrintLnBold(player.playername + " has lived "+ player.haslived+ " times");
		}
		else
		{
			IPrintLnBold(player.playername + " has not lived previously.");
		}

	}
	while(1)
	{
		level waittill("restmapsave");
		Map_Restart(true);
	}
}


function alterplayervalues()
{
	level waittill("power_on");
	foreach(player in GetPlayers())
	{
		player.haslived = 0;
	}
}


function acttwoforceteleport(inttimer, structarray)
{
	level endon("acttwoallplayerstele");
	wait(inttimer);
	foreach(player in GetPlayers())
	{
		if(player.acttwotele == false)
		{
			player StopLocalSound("mozartscary");
			player thread playerteleport(structarray,1);
			player.acttwotele = true;
			player SetVisionSetForPlayer("zm_factory", 5);
			//VisionSetNaked("zm_factory", 5 );
		}
	}
	level notify("acttwoallplayerstele");
}

		

function gatewayteleports(structarray)
{
	players = GetPlayers();
	level endon("cutsceneover");
	while(1)
	{
		players = GetPlayers();
		if(level.acttwotelecount == players.size && level flag::get("solo_game") == false)
		{
			level notify("acttwoallplayerstele");
		}
		if(level flag::get("solo_game") == true && level.acttwotelecount > 0)
		{
			level notify("acttwoallplayerstele");
		}

		self waittill("trigger", player);
		//IPrintLnBold ("trig");
		if(player.acttwotele == false)
		{
			player StopLocalSound("mozartscary");
			player thread playerteleport(structarray, 1);
			player PlaySound("bathroomteleportin");
			player.acttwotele = true;
			level.acttwotelecount += 1;
			//VisionSetNaked("zm_factory", 5 );
			player SetVisionSetForPlayer("zm_factory", 5);
		}
		WAIT_SERVER_FRAME;
	}
}

function playerteleport(structarray, scriptint)
{
	self SetOrigin(structarray[self.characterIndex].origin);
    self SetPlayerAngles(structarray[self.characterIndex].angles);
    thread PlayFxWithCleanup(level.oildisappear, self.origin, 1);
    self AllowJump(false);
	self SetMoveSpeedScale(0);
	if(scriptint == 1)
	{
		//VisionSetNaked("zm_factory", 5 );
		//vision set for player seems to be broken?
		self SetVisionSetForPlayer("zm_factory", 5);
		level waittill("acttwoallplayerstele");
		VisionSetNaked("zm_factory", 5 );
	}
	self AllowJump(true);
	self SetMoveSpeedScale(1);
}