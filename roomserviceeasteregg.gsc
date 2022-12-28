
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
#using scripts\shared\objpoints_shared;

//REGISTER_SYSTEM( "subtitle", init, undefined )

#precache("fx", "dlc2/zmb_weapon/fx_skull_quest_ritual_doorbarrier_island");
#precache("fx", "dlc1/castle/fx_infused_115_airspace_sm_barricade_rise");
#precache( "fx", "dlc1/castle/fx_elec_teleport_flash_sm" );
#precache( "fx", "redspace/fx_launchpad_blue" );
#precache( "fx", "redspace/fx_launchpad_red" );
#precache("fx", "_mikeyray/perks/phd/fx_perk_phd");
#precache( "material", "eral" );
#precache( "material", "pigman_jumpscare" );
#precache( "material", "rhettscare" );
#precache( "material", "stuffmanscare" );
#precache( "material", "number2oil" ); 
#precache( "material", "amongscare" );
#precache( "material", "susscare" );
#precache( "material", "trollscare" );
#precache("fx", "fx_powerup_nuke_zmb");
#precache( "fx", "dlc1/castle/fx_ee_keeper_demongate_portal_open" );
#precache( "fx", "dlc5/moon/fx_moon_soul_swap" );
#precache( "fx", "dlc1/castle/fx_ritual_key_soul_tgt_igc" ); 
#precache( "fx", "dlc1/castle/fx_ritual_key_soul_exp_igc" );
#precache( "fx", "dlc1/castle/fx_battery_lightning_castle" );
#precache( "fx", "dlc3/stalingrad/fx_sophia_elec_explosion_detach" );
#precache( "fx", "dlc3/stalingrad/fx_dragonstrike_portal_flash" );
#precache( "fx", "zombie/fx_ee_apothigod_beam_success_zod_zmb" );
#precache( "fx", "zombie/fx_ee_apothigod_beam_impact_zod_zmb" );
#namespace jumpscare;
#precache( "fx", "dlc3/stalingrad/fx_dest_ceiling_break_cage" );
#precache( "fx", "dlc1/castle/fx_ee_keeper_demongate_portal_loop" );
#define KINO_SWIRL2                                  "dlc5/tomb/fx_teleport_1p"
#precache( "fx", "dlc1/castle/fx_plyr_screen_115_liquid" ); 
#precache( "fx", "zombie/fx_glow_smokeman_doa" );
#precache( "fx", KINO_SWIRL2 );
#precache("model", "masterpassf"); 
#precache( "fx", "dlc2/zmb_weapon/fx_skull_quest_lightning_hit_island" );
#precache( "fx", "harry/mpd/fx_mpd_tube_glow" );
#precache("model", "p7_dinothunder");
#precache("model", "p7_numbersix");
#precache("model", "p7_numberthree");
#precache("model", "p7_numbertwo");
#precache("model", "p7_paimon");
#precache("model", "p7_rimiru");
#precache("model", "p7_zur_register_store_monitor_sussyfuel");
#precache("model", "p7_zur_register_store_monitor_accessdenied");
#precache("model", "p7_zur_register_store_monitor_genshin");
#precache("model", "wpn_t7_zmb_hd_stg44_world_rim");
#precache("model", "wpn_t7_zmb_hd_stg44_mag_world_rim");
#precache( "fx", "dlc1/castle/fx_infused_115_broken_canister" );
#precache( "fx", "harry/mpd/fx_mpd_tube_glow" );
#precache( "fx", "dlc3/stalingrad/fx_fire_hot_sm");
#precache( "material", "objpoint_default" );
#precache( "material", "newobjmarker" );




function autoexec roomserviceinit()
{
	level.criticaleeactive = false;
	level waittill("initial_blackscreen_passed");
	level.randomburger = array(0, 1, 2, 3, 4);
	level.randomburgerorder = array::randomize(level.randomburger);
	level thread burgerqueststart();
	level.travisingredientframe = GetEntArray("ingredientframetravis", "targetname");
	level thread ingredientframesetup();
	level thread randomchatter();
	level.skylaser = "zombie/fx_ee_apothigod_beam_success_zod_zmb";
	level.skylaserimpact = "zombie/fx_ee_apothigod_beam_impact_zod_zmb";
	level.skylaserexplosion = "dlc3/stalingrad/fx_dragonstrike_portal_flash";
	level.newlightingfxzj = "dlc2/zmb_weapon/fx_skull_quest_lightning_hit_island";
	level.terminalfxlinkblue = "harry/mpd/fx_mpd_tube_glow";
	level.chilisskyportal = GetEnt("skyportalchilis","targetname");
	//level.chilisskyportal RotateRoll(180, 0.05);
	level.skylasersource = GetEnt("skylasersource", "targetname");
	level.computerexplode = "dlc3/stalingrad/fx_sophia_elec_explosion_detach";
	level.soulsuccfx = "dlc1/castle/fx_ritual_key_soul_tgt_igc";
	level.computeractivate = "dlc1/castle/fx_battery_lightning_castle";
	level.soulexplode = "dlc1/castle/fx_ritual_key_soul_exp_igc";
	level.portalopen = "dlc1/castle/fx_ee_keeper_demongate_portal_open";
	level.soulfx = "dlc5/moon/fx_moon_soul_swap";
	level.mushroomcloudfx = "fx_powerup_nuke_zmb";
	level.phdnukefx = "_mikeyray/perks/phd/fx_perk_phd";
	level.keycarddisappear = "dlc1/castle/fx_elec_teleport_flash_sm";
	level.bartenderdetect = GetEnt("bartender_man_detect","targetname");
	level.teleporterdoorfxtest = "dlc2/zmb_weapon/fx_skull_quest_ritual_doorbarrier_island";
	level.leavedoorbarrierfx = "dlc1/castle/fx_infused_115_airspace_sm_barricade_rise";
	level.roomdoor = GetEnt("roomservicedoor", "targetname");
	level.roomservicedoortrig = GetEnt("roomservicetrig", "targetname");
	level.playerhallcheck = GetEnt("playerhallwaycheck", "targetname");
	//level.roomservicesound = GetEnt("roomservicesound", "targetname");
	level.roomservicedeliver = GetEnt("roomservicedeliver", "targetname");
	level.roomservicefood = GetEnt("roomservicefood", "targetname");
	level.roomservicefoodtrig = GetEnt("roomservicedelivertrig", "targetname");
	level.roomservicefoodtrig SetCursorHint("HINT_NOICON");
	level.roomservicefoodtrig SetHintString("");
	level.roomservicedeliver SetCursorHint("HINT_NOICON");
	level.roomservicedeliver SetHintString("");
	level.teleportdoortrigger = GetEnt("teleporterdoordetect", "targetname");
	level.teleportdooorclip = GetEnt("teleportguarddoor", "targetname");
	level.teleporterdoorfx = GetEnt("fxmodelteleporterdoor", "targetname");
	level.keycard = GetEnt("employeekeycard","targetname");
	level.keycardtrigger = GetEnt("employeekeycardtrig", "targetname");
	level.bartenderdetectinteracts = GetEnt("bartenderspeakertrig", "targetname");
	level.keycardtrigger SetCursorHint("HINT_NOICON");
	level.keycardtrigger SetHintString("");
	level.bartenderdetectinteracts SetCursorHint("HINT_NOICON");
	level.bartenderdetectinteracts SetHintString("");
	level.bartenderdetectinteract TriggerEnable(false);
	level.keycardtrigger TriggerEnable(false);
	level.keycardpantry = GetEnt("keycardpantry","targetname");
	level.keycardpantrydoor = GetEnt("pantrydoor","targetname");
	level.keycardpantrydoorclip = GetEnt("pantrydoorclip","targetname");
	//level.keycardpantryreader TriggerEnable(false);
	//boxes reveal linkpad
	level.revealboxes = GetEntArray("revealbox","targetname");
	level.revealboxesclip = GetEnt("boxdebris","targetname");
	level.revealboxestrigger = GetEnt("powerboxesgobyebye","targetname");
	//burgercookfx
	level.burgercookdoorblockade = GetEnt("burgercookblockadeplayer","targetname");
	level.burgercookdoorblockadefx = GetEnt("burgercookbarrierfx", "targetname");
	level.burgercookdoorblockade MoveZ(-135,0.01);
	//level.bartenderdetectinteracts SetCursorHint("HINT_NOICON");
	//level.bartenderdetectinteracts SetHintString("");
	//level.keycardtrigger UseTriggerRequireLookAt();
	level.bartenderdetectinteracts show();
	level.questcomplete = 0;
	level.dialougnum = 0;
	level.keycard hide();
	level.teleporterdoorfx hide();
	level.roomservicedeliver hide();
	level.roomservicedoortrig hide();
	level thread dialougedetermine();
	level thread keycarddetect();
	level thread dialoug1();
	level thread dialoug2();
	//level thread door153moment();
	level.keycardpantry hide();

	//FOR TESTING COMMENT THIS LATER
	//level thread delivertoroomie();
	
}


function ingredientframesetup()
{
	foreach(frame in level.travisingredientframe)
	{
		frame SetModel(level.randomizeburgerpartmodelnames[frame.script_int]);
		thread PlayFxWithCleanup(level._effect["poltergeist"], frame.origin, 3.5);
	}
}


function dialoug1()
{
	level endon("dialougset");
	level.bartenderdetect waittill("trigger", player);
	level.dialougenum = 1;
	level notify("dialougset");
}
function dialoug2()
{
	level endon("dialougset");
	level.playerhallcheck waittill("trigger", player);
	level.dialougenum = 2;
	level notify("dialougset");
}

function dialougedetermine()
{
	level waittill("dialougset");
	wait(0.5);
		if (level.dialougenum == 1)
		{
			level thread bartenderfirst();
			//IPrintLnBold ("walked past bartender first");
			//speak_to_meemers("mlg");
			level.bartenderdetectinteract TriggerEnable(true);
			//level.dialougenum = 1;
			break;
		}
		else if (level.dialougenum == 2)
		{
			//level.dialougenum = 2;
			//IPrintLnBold ("walked past 237 first");
			//speak_to_meemers("mlg");
			level.bartenderdetectinteract TriggerEnable(true);
			level thread walkpastfirst();
			break;
		}
}


function walkpastfirst()
{
	thread zm_subtitles::subtitle_display(undefined, 3, "^0Patron", "Hey, I see you out there! Are you my roomservice?");
	level.roomdoor PlaySound("vox_roomservice_1");
	wait(4.2);
	roomieobjmarker = objPoints::create("computerobjmark", level.roomdoor.origin+(0,-25,75), "all", "newobjmarker", 0.8);
    roomieobjmarker SetWayPoint(0, "newobjmarker", 0);
	level.playerhallcheck waittill("trigger", player);
	thread zm_subtitles::subtitle_display(undefined, 3, "^0Patron", "Can you do me a favor and talk to the bartender for me pal?");
	level.roomdoor PlaySound("vox_roomservice_2");
	wait(4.2);
	thread zm_subtitles::subtitle_display(undefined, 3, "^0Patron", "I've been waiting for hours");
	level.roomdoor PlaySound("vox_roomservice_3");
	wait(3.2);
	objPoints::delete(roomieobjmarker);
	level thread bartendertalkpostwalk();		
	//IPrintLnBold ("Please come back, I've been waiting for hours, I'm starving please..");
}

function bartendertalkpostwalk()
{
	//IPrintLnBold ("post walk started");
	bartenderpoint = objPoints::create("computerobjmark", level.bartenderdetectinteracts.origin, "all", "newobjmarker", 0.8);
    bartenderpoint SetWayPoint(0, "newobjmarker", 0);
	level.bartenderdetectinteracts SetCursorHint("HINT_NOICON");
	level.bartenderdetectinteracts SetHintString("Press ^2[{+activate}]^7 To Talk To Lloyd");
	level.bartenderdetectinteracts waittill("trigger", player);
	wait(0.1);
	level.bartenderdetectinteracts SetCursorHint("HINT_NOICON");
	level.bartenderdetectinteracts SetHintString("");
	level.bartenderdetectinteracts PlaySound("lloydfirstdialouge");
	thread zm_subtitles::subtitle_display(undefined, 2, "Lloyd", "The guy in 237? Shit I forgot to make his order.");
	wait(4);
	thread zm_subtitles::subtitle_display(undefined, 2, "Lloyd", "So the guy wants a travis scott burger from the Chili's upstairs, do you mind making it for me?");
	wait(5);
	//level.bartenderman PlaySound("");
	thread zm_subtitles::subtitle_display(undefined, 2, "Lloyd", "In return I'll give you access to the cool shit at the top of the stairs, deal?");
	wait(5.5);
	//level.bartenderman PlaySound("");
	thread zm_subtitles::subtitle_display(undefined, 2, "Lloyd", "Here's my employee keycard. You'll need it to access the pantry upstairs, it might unlock some other stuff too.");
	wait(6.5);
	thread speak_to_meemers("vox_command_playalong");
	thread zm_subtitles::subtitle_display(undefined, 2, "^2Mission Command", "Play along for now, let's see where this goes.");
	level thread keycardanim(bartenderpoint);
}

function keycardanim(bartenderpoint)
{

	//level.keycardtrigger EnableLinkTo();
	//level.keycardtrigger LinkTo(level.keycard);
	level.bartenderdetectinteract TriggerEnable(false);
	level.bartenderdetect TriggerEnable(false);
	level.bartenderdetect hide();
	level.bartenderdetectinteract hide();
	level.keycard show();
	thread PlayFxWithCleanup(level.keycarddisappear, level.keycard.origin, 1.5);
	level.keycard PlaySound("keycardtelein");
	wait(.2);
	level.keycard MoveX(-19, 2);
	wait(2);
	//trigger wont show up the right way FUCK
	level.keycardtrigger TriggerEnable(true);
	//level.keycardtrigger UseTriggerRequireLookAt();
	level.keycardtrigger SetCursorHint("HINT_NOICON");
	level.keycardtrigger SetHintString("Hold ^2[{+activate}]^7 To Pick Up Employee Keycard");
	wait(0.1);
	//level.bartenderman PlaySound("");
	level.keycardtrigger waittill("trigger", player);
	level.bartenderdetect thread llyodmakehint("lloydburgmakeremind", "Hey kid, you get around to makin that burger yet? No?", "I'm not gonna be the one to skin you alive. I ain't cleaning you off the walls neither", 5);
	objPoints::delete(bartenderpoint);
	level notify("keycardpickuplloyd");
	level.keycardtrigger SetCursorHint("HINT_NOICON");
	level.keycardtrigger SetHintString("");
	player PlaySound("zmb_craftable_pickup");
	clientfield::set("employeekeycardchilis", 1);
	wait(0.1);
	level.keycardtrigger Delete();
	level.keycard Delete();
	level.questcomplete = 1;
	level notify("grabbedkeycardemployee");
	//level thread pantrydoorunlock();
	level.keycardtrigger TriggerEnable(false);
	level.bartenderdetect TriggerEnable(true);
	level.bartenderdetect show();
	level.bartenderdetectinteract show();
	level notify("burgergamepartspawn");
	//level notify("burgergameactivate");
	//PlayFX(level._effect["powerup_grabbed"], level.keycard.origin);
	//level.bartenderman PlaySound("");
	//level thread burgerqueststart();
	//level thread bartenderextrareward();
}

function autoexec sussyfuelpc()
{
	level.seating153trigactivationfx = "dlc1/castle/fx_infused_115_broken_canister";
	//cameron ee generate 3 unique random numbers
	framearray = GetEntArray("cameronframe", "targetname");
	room236doortrig = GetEnt("trigopenanime", "targetname");
	room236doortrig UseTriggerRequireLookAt();
	room236doortrig SetHintString("");
	//level waittill("forvertasda");
	foreach(frame in framearray)
	{
		frame Hide();
	}
	frameint1 = RandomInt(framearray.size);
	frameint2 = RandomInt(framearray.size);
	while(frameint2 == frameint1)
	{
		if(frameint2 == frameint1)
		{
			frameint2 = RandomInt(framearray.size);
		}
		wait(0.05);
	}
	frameint3 = RandomInt(framearray.size);
	while(frameint3 == frameint2 || frameint3 == frameint1)
	{
		if(frameint3 == frameint2 || frameint3 == frameint1)
		{
			frameint3 = RandomInt(framearray.size);
		}
		wait(0.05);
	}
	cameronframe1 = framearray[frameint1];
	cameronframe2 = framearray[frameint2];
	cameronframe3 = framearray[frameint3];

	cameronframes3 = array(cameronframe1, cameronframe2, cameronframe3);

	frametypes = array("p7_dinothunder", "p7_paimon", "p7_rimiru");
	framehints = array("p7_numbertwo", "p7_numberthree", "p7_numbersix");
	frametypes = array::randomize(frametypes);

	for(i = 0; i < cameronframes3.size; i++)
	{
		cameronframes3[i] SetModel(frametypes[i]);
	}
	
	//DELETE UNUSED FRAMES.
	for(i = 0; i < framearray.size; i++)
	{
		if(i != frameint1 && i != frameint2 && i != frameint3)
		{
			framearray[i] Delete();
		}
	}

	keycard = GetEnt("sussyfuelpckeycard", "targetname");
	keycard Hide();
	trig = GetEnt("sussyfuelpc", "targetname");
	pcmodel = GetEnt("sussyfuelmodelpc", "targetname");
	trig UseTriggerRequireLookAt();
    trig SetHintString( &"ZOMBIE_NEED_POWER" );
	trig SetCursorHint("HINT_NOICON");
	level waittill("power_on");
	trig SetHintString("This requires an employee keycard");
	level waittill("grabbedkeycardemployee");
	trig SetHintString("Hold ^2[{+activate}]^7 To Unlock PC");
	trig waittill("trigger", player);
	trig PlaySound("buttonpressaj_2");
	wait(0.2);
	keycard Show();
	thread PlayFxWithCleanup(level.keycarddisappear, keycard.origin, 1.5);
	keycard PlaySound("keycardtelein");
	wait(.2);
	keycard MoveZ (-2.2, 1);
	wait(1);
	keycard PlaySound("longbeep");
	wait(.3);
	thread PlayFxWithCleanup(level.keycarddisappear, keycard.origin, 1.5);
	keycard PlaySound("keycardtelein");
	wait(.2);
	keycard Delete();
	pcmodel SetModel("p7_zur_register_store_monitor_sussyfuel");
	trig SetHintString("Hold ^2[{+activate}]^7 To Play Sussyfuel");
	trig waittill("trigger", player);
	player.ignoreme = true;
	trig SetHintString("");
	player freezecontrols(true);
	player EnableInvulnerability();
	player thread lui::screen_fade_out(0.05, "black");
	player flagsys::set( "playing_movie_hide_hud" );
	player util::show_hud( 0 );
	wait(1);
	player PlayLocalSound("win10error");
	wait(4);
	player thread lui::screen_fade_in(0.1);
	player flagsys::clear( "playing_movie_hide_hud" );
	player util::show_hud( 1 );
	player freezecontrols(false);
	player DisableInvulnerability();
	wait(3);
	player.ignoreme = false;
	PlaySoundAtPosition("sussyfueltheme", trig.origin);
	wait(120);
	randcount = RandomIntRange(5,10);
	for(i = 0; i < randcount; i++)
	{
		trig waittill("trigger", player);
		trig PlaySound("buttonpressaj_2");
		wait(0.1);
	}
	wait(1.5);
	trig SetHintString("Hold ^2[{+activate}]^7 To Play Genshin Impact");
	trig waittill("trigger", player);
	trig SetHintString("");
	trig PlaySound("buttonpressaj_2");
	wait(0.1);
	trig PlaySound("defaultfail");
	pcmodel SetModel("p7_zur_register_store_monitor_accessdenied");
	trig SetHintString("ACCESS DENIED, you can play it in room [REDACTED]");
	thread zm_subtitles::subtitle_display(undefined, 3, "^0Unknown", "Find the room number...");
	//spawn in items themed, genshin, dinothunder, and rimiru
	room236door = GetEnt("kaz_room_door", "targetname");
	room236clip = GetEnt("kazroomclip", "targetname");
	gunspawnspot = struct::get("animegunspawn", "targetname");
	level thread cameronframessequence(cameronframes3, framehints);
	level waittill("allcameronframesfound");
	animegun = util::spawn_model("wpn_t7_zmb_hd_stg44_view_rim", gunspawnspot.origin);
	animegun thread gunspin(3, "animegungrabbed");
	animegunfx = util::spawn_model("tag_origin", gunspawnspot.origin);
	PlayFXOnTag(level.seating153trigactivationfx, animegunfx, "tag_origin"); 
	animegun PlayLoopSound("soulambloop", 1);
	gunfxspot = util::spawn_model("tag_origin", room236door.origin);
	PlayFXOnTag("harry/mpd/fx_mpd_tube_glow", room236doortrig, "tag_origin");
	room236doortrig SetHintString("????");
	room236doortrig waittill("trigger", player);
	gunfxspot Delete();
	room236clip Delete();
	room236doortrig Delete();
	room236door RotateTo(room236door.script_angles, 2);
	room236door PlaySound("dooropen");
	trigger = GetEnt("pickupanimegun", "targetname");
    trigger SetHintString( "Hold ^2[{+activate}]^7 To Receive Rimiru's Tempest" );
    trigger SetCursorHint( "HINT_NOICON" );
    trigger UseTriggerRequireLookAt();
    trigger waittill("trigger", player);
    player PlayLocalSound("buypickup");
    animegunfx Delete();
    trigger PlaySound("rune_cross_done");
    level notify("animegungrabbed");
    animegun Delete();
    trigger SetHintString( "The Genshin Impacter is now in the Mystery Box. (Unpacked version of Rimiru's Tempest)" );
    weaponname = "ar_stg44_upgraded";
	weapon = GetWeapon(weaponname);
    player zm_weapons::weapon_give(weapon, false, false, true, true );
    weaponname = "ar_stg44";
	weapon = GetWeapon(weaponname);
	level._zombie_include_weapons[ weapon ] = true;
	level.zombie_weapons[ weapon ].is_in_box = 1;
	level._zombie_include_weapons[ "ar_stg44" ] = true;
	level.zombie_weapons[ "ar_stg44" ].is_in_box = 1;
	thread zm_weapons::include_zombie_weapon("ar_stg44", true);
	pcmodel SetModel("p7_zur_register_store_monitor_genshin");
	trig SetHintString("Genshin Impact is now playable... In the Mystery Box");
}

function gunspin(spinspeed, notifystring)
{
	level endon(notifystring);
	self endon("death");
	while(1)
	{
		self RotateYaw(360, spinspeed);
		wait(spinspeed);
	}
}


function cameronframessequence(cameronframes3, numberarray)
{
	//spawn in the first frame and wait for damage
	numberstwo = array(2,3,6);
	for(i = 0; i < cameronframes3.size; i++)
	{
		cameronframes3[i] Show();
		cameronframes3[i] PlaySound("candleignite03");
		thread PlayFxWithCleanup(level._effect["powerup_grabbed"], cameronframes3[i].origin, 1);
		cameronframes3[i] SetCanDamage(1);
		cameronframes3[i] PlayLoopSound("meteorloopsound");
		while(1)
		{
			cameronframes3[i] waittill( "damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel );
			if(mod == "MOD_GRENADE_SPLASH")
			{
				cameronframes3[i] StopLoopSound(0.5);
				cameronframes3[i] PlaySound("meteorpickupsound");
				wait(0.05);
				break;
			}
		}
		thread zm_subtitles::subtitle_display(undefined, 3, "^0Unknown", numberstwo[i]);
		cameronframes3[i] PlaySound("vox_tempest_"+i);
		thread PlayFxWithCleanup(level._effect["powerup_grabbed"], cameronframes3[i].origin, 1);
		cameronframes3[i] SetModel(numberarray[i]);
	}
	level notify("allcameronframesfound");
	PlaySoundAtPosition("sg_success", (0,0,0));
	wait(1);
	PlaySoundAtPosition("vox_tempest_final", (0,0,0));
	thread zm_subtitles::subtitle_display(undefined, 3, "^0Unknown", "That is the room...");
	level waittill("animegungrabbed");

	foreach(frame in cameronframes3)
	{
		thread PlayFxWithCleanup(level._effect["powerup_grabbed"], frame.origin, 1);
		frame Delete();
	}
}




function autoexec room237hintfordummy()
{
	room237doorhintsbar = array("You talked to llyod, now make my burger.", "Come on, he explained what you are supposed to do...", "Are you a lemon?", "Go to the kitchen and make a travis scott burger for me.", "Where's my burger dummy?");
	room237doorhintsdoor = array("Did you talk to llyod yet?", "Where's my burger dummy?", "I thought you were gonna help me?", "I. AM. STARVING.", "GO. MAKE. MY. BURGER.");
	//add sound name array and time of sound array here
	level waittill("burgergamepartspawn");
	level endon("roomservicereadytodeliver");
	if(level.dialougenum == 1)
	{
		//bar first
		extranum = 0;
		while(1)
		{
			level endon("roomservicereadytodeliver");
			level.playerhallcheck waittill("trigger", player);
			if(extranum > 4)
			{
				extranum = 0;
			}
			level.playerhallcheck PlaySound("vox_roomie_youtalkedtollyod");
			thread zm_subtitles::subtitle_display(undefined, 3, "^0Patron", room237doorhintsbar[extranum]);
			extranum ++;
			wait(15);
		}
	}
	else if(level.dialougenum == 2)
	{
		//door first
		extranum = 0;
		while(1)
		{
			level endon("roomservicereadytodeliver");
			level.playerhallcheck waittill("trigger", player);
			if(extranum > 4)
			{
				extranum = 0;
			}
			level.playerhallcheck PlaySound("vox_roomie_youtalkedtollyod");
			thread zm_subtitles::subtitle_display(undefined, 3, "^0Patron", room237doorhintsdoor[extranum]);
			extranum ++;
			wait(15);
		}
	}
}

function bartenderfirst()
{
	//IPrintLnBold ("bartender startingsada");
	//level.bartenderman PlaySound("");
	players = GetPlayers();
	if(players.size == 1 || players.size < 1)
	{
		thread zm_subtitles::subtitle_display(undefined, 2, "Lloyd", "Hey, kid come do a favor for me.");
		level.bartenderdetectinteracts PlaySound("lloydsoloplayer");
	}
	else
	{
		thread zm_subtitles::subtitle_display(undefined, 2, "Lloyd", "Hey guys, mind doing me a favor real quick?");
		level.bartenderdetectinteracts PlaySound("lloydmultiplayer");
	}
	wait(1);
	bartenderpoint = objPoints::create("computerobjmark", level.bartenderdetectinteracts.origin, "all", "newobjmarker", 0.8);
    bartenderpoint SetWayPoint(0, "newobjmarker", 0);
	wait(2);
	level.bartenderdetectinteracts SetCursorHint("HINT_NOICON");
	level.bartenderdetectinteracts SetHintString("Press ^2[{+activate}]^7 To Talk To Lloyd");
	level.bartenderdetectinteracts waittill("trigger", player);
	level.bartenderdetectinteracts SetCursorHint("HINT_NOICON");
	level.bartenderdetectinteracts SetHintString("");
	//level.bartenderman PlaySound("");
	level.bartenderdetectinteracts PlaySound("lloydaltfirstdialouge");
	thread zm_subtitles::subtitle_display(undefined, 2, "Lloyd", "So there's this guy in room 237 waiting for roomservice, I forgot to make his fucking order and he's kinda pissed");
	wait(7);
	level.bartenderdetectinteracts PlaySound("llyodconstsent");
	thread zm_subtitles::subtitle_display(undefined, 2, "Lloyd", "So the guy wants a travis scott burger from the Chili's upstairs, do you mind making it for me?");
	wait(5);
	//level.bartenderman PlaySound("");
	thread zm_subtitles::subtitle_display(undefined, 2, "Lloyd", "In return I'll give you access to the cool shit at the top of the stairs, deal?");
	wait(5.5);
	//level.bartenderman PlaySound("");
	thread zm_subtitles::subtitle_display(undefined, 2, "Lloyd", "Here's my employee keycard. You'll need it to access the pantry upstairs, it might unlock some other stuff too.");
	wait(6.5);
	thread speak_to_meemers("vox_command_playalong");
	thread zm_subtitles::subtitle_display(undefined, 2, "^2Mission Command", "Play along for now, let's see where this goes.");
	//objPoints::delete(bartenderpoint);
	level thread keycardanim(bartenderpoint);
	//level.bartenderdetect thread llyodmakehint("lloydburgmakeremind", "Hey kid, you get around to makin that burger yet? No?", "I'm not gonna be the one to skin you alive. I ain't cleaning you off the walls neither", 10);
}


function llyodmakehint(soundhint, subtitle, subtitle2 = undefined, time = 0)
{
	level endon("burgerhasbeencrafted");
	level endon("cutsceneover");
	while(1)
	{
		wait(30);
		self waittill("trigger", player);
		self PlaySound(soundhint);
		thread zm_subtitles::subtitle_display(undefined, 2, "Lloyd", subtitle);
		if(isdefined(subtitle2))
		{
			wait(time);
			thread zm_subtitles::subtitle_display(undefined, 2, "Lloyd", subtitle2);
		}
	}
}

function delayedsound(int, string1, string2, string3)
{
	wait(int);
	thread zm_subtitles::subtitle_display(undefined, 3, string2, string3);
	thread speak_to_meemers(string1);
}

function burgerqueststart()
{
//Burger mini "game"
	level.cheese = GetEnt("cheese_pickup","targetname");
	level.topbun = GetEnt("topbun_pickup","targetname");
	level.bottombun = GetEnt("bottombun_pickup","targetname");
	level.patty = GetEnt("patty_pickup","targetname");
	level.lettuce = GetEnt("lettuce_pickup","targetname");
	level.patty UseTriggerRequireLookAt();
	level.lettuce UseTriggerRequireLookAt();
	level.bottombun UseTriggerRequireLookAt();
	level.topbun UseTriggerRequireLookAt();
	level.cheese UseTriggerRequireLookAt();

	level flag::init("cheese_flag", false);
	level flag::init("topbun_flag", false);
	level flag::init("bottombun_flag", false);
	level flag::init("patty_flag", false);
	level flag::init("lettuce_flag", false);
	///thread contructor
	
	/////
	level.cheesemodel hide();
	level.topbunmodel hide();
	level.bottombunmodel hide();
	level.burgerpattymodel hide();
	level.lettucemodel hide();
	level.cheesespot = GetEnt("hamburgerpatty","script_noteworthy");
	level.cheesespot thread clearhintstring();
	level.cheesemodel = GetEnt(level.cheesespot.target, "targetname");
	level.topbunspot = GetEnt("foodspottop","script_noteworthy");
	level.topbunspot thread clearhintstring();
	level.topbunmodel = GetEnt(level.topbunspot.target, "targetname");
	level.bottombunspot = GetEnt("foodspotbottom","script_noteworthy");
	level.bottombunspot thread clearhintstring();
	level.bottombunmodel = GetEnt(level.bottombunspot.target, "targetname");
	level.lettucespot = GetEnt("lettucebad","script_noteworthy");
	level.lettucespot thread clearhintstring();
	level.lettucemodel = GetEnt(level.lettucespot.target, "targetname");
	level.burgerpattyspot = GetEnt("foodspotcheese","script_noteworthy");
	level.burgerpattyspot thread clearhintstring();
	level.burgerpattymodel = GetEnt(level.burgerpattyspot.target, "targetname");
	level.finalburgerinteract = GetEnt("foodspotfinal","script_noteworthy");
	level.finalburgerinteract thread clearhintstring();
	level.finalburgermodel = GetEnt(level.finalburgerinteract.target, "targetname");
	level.cookarea = GetEnt("cookstation","targetname");
	level.cookarea thread clearhintstring();
	level.kitchendetect = GetEnt("kitchendetect","targetname");
	level.burgercook = GetEnt("cookingburgermodel", "targetname");
	level.pattydecoy = GetEnt("pattydecoy", "targetname");
	level.cheese thread burgerparts("cheese_flag", "Cheese", level.cheese.target, level.cheesemodel);
	level.topbun thread burgerparts("topbun_flag", "Top Bun", level.topbun.target, level.topbunmodel);
	level.bottombun thread burgerparts("bottombun_flag", "Bottom Bun", level.bottombun.target, level.bottombunmodel);
	level.patty thread burgerparts("patty_flag", "Raw Burger Patty", level.patty.target, level.pattydecoy);
	level.lettuce thread burgerparts("lettuce_flag", "Lettuce", level.lettuce.target, level.lettucemodel);
	level.failtime = 0;
	//
	level.burgercook hide();
	level.burgerpattymodel hide();
	level.finalburgermodel hide();
	level thread assignburgerpartstoarray();
	level waittill("burgergameactivate");
	//level flag::clear( "zombie_drop_powerups");
	//level flag::clear( "spawn_zombies" );
	//level thread killallzs();
	level thread enablezombies(false);
	fxModellockdoor = util::spawn_model("tag_origin", level.burgercookdoorblockadefx.origin);
	PlayFXOnTag(level.teleporterdoorfxtest, fxModellockdoor, "tag_origin");
	level.burgercookdoorblockadefx PlaySound("oilappear");
	thread PlayFxWithCleanup(level.leavedoorbarrierfx, level.burgercookdoorblockadefx.origin, 1);
	level.burgercookdoorblockade MoveZ(135,0.01);
	//play instuctional video here
	//stop zombies spawns
	//wait for length of video or split vid in parts
	//tell player how to cook patty and how its delicous smell will attract customers, do not be afraid to use lethal force the recipe must not be found
	//lock player in kitchen
	level waittill("travisvideoover");
	while(1)
	{
		if(level.playerhasallburger)
		{
			break;
		}
		WAIT_SERVER_FRAME;
	}
	level.cookarea changehintstring("Press ^2[{+activate}]^7 To Begin Cooking Burger [REQUIRES ALL PLAYERS]");
	cookareaallplayersneeded = GetEnt("allplayersburgercookdetectnew", "targetname");
	level.cookarea waittill("trigger", player);
	cookareaallplayersneeded waittill("trigger", player);
	level.cookarea changehintstring("Burger cooking in progress");
	level.burgercook show();
	foreach(player in GetPlayers())
	{
	player PlayLocalSound("vox_burger_scream");
	}
	//PlaySoundAtPosition("funprotecttheme", level.cookarea.origin);
	cookareaallplayersneeded PlaySound("funprotecttheme");
	//level.burgercookdoorblockadefx PlaySound("braxelbrobots");
	thread zm_subtitles::subtitle_display(undefined, 2, "Burger", "*Various screams of intense agony*");
	level.burgercook PlayLoopSound("sizzleloop");
	//fx door
	
	//tempsound
	//level.burgercook PlaySound("mlg");
	level thread infinitesprintersspawn();
	//the zombies are coming
	burgerfirefxspot = struct::get( "stoveburnerfxspot", "targetname" );
	burgercookfx1 = util::spawn_model("tag_origin", level.burgercook.origin);
	burgercookfx2 = util::spawn_model("tag_origin", level.burgercook.origin);
	burgercookfx3 = util::spawn_model("tag_origin", burgerfirefxspot.origin);
	//spawn in burger fire
	WAIT_SERVER_FRAME;
	PlayFXOnTag("dlc3/stalingrad/fx_fire_hot_sm", burgercookfx3, "tag_origin");
	PlayFXOnTag(level.mushroomcloudfx, burgercookfx1, "tag_origin");
	PlayFXOnTag(level.phdnukefx, burgercookfx2, "tag_origin");
	playersingame = GetPlayers();
	for(i = 0; i < playersingame.size; i++)
	{
		playersingame[i] thread lui::timer(level.burgerprotecttime);
	}
	wait(level.burgerprotecttime);
	level thread zm_powerups::specific_powerup_drop("full_ammo", level.cookarea.origin+(0,0,-25), undefined, undefined, undefined, undefined, false );
	cookareaallplayersneeded StopSound("funprotecttheme");
	level.cookarea StopLoopSound(1);
	burgercookfx1 Delete();
	burgercookfx2 Delete();
	burgercookfx3 Delete();
	cookareaallplayersneeded StopLoopSound(1.0);
	//level.burgercookdoorblockadefx StopSound("braxelbrobots");
	//move to new func, burger order must be attempted once for the door to unlock
	//level.burgercookdoorblockade MoveZ(-135,0.01);
	//level.burgercookdoorblockadefx PlaySound("oilappear");
	//PlayFX(level.leavedoorbarrierfx, level.burgercookdoorblockadefx.origin);
	//fxModellockdoor Delete();
	level thread killdoorfxtokitchen(fxModellockdoor);
	level.burgercook StopLoopSound(0.5);
	level notify("cookcompleted");
	level thread killallzs();
	level thread whitescreenflash();
	level.cookarea changehintstring("Press ^2[{+activate}]^7 To Pick Up Cooked Burger");
	level.cookarea waittill("trigger", player);
	level.cookarea PlaySound("vox_acssixthingredmis");
	thread zm_subtitles::subtitle_display(undefined, 3, "ACS", "Sixth ingredient not detected. Please proceed with burger assembly.");
	level.cookarea thread delayedsound(5, "vox_command_huh", "^2Mission Command", "Huh.");
	level.cookarea changehintstring("");
	level.burgerpattymodel show();
	level.burgercook hide();
	//video with narration explains the correct order of ingredients
	level.choiceiteration = 0;
	level.cheesespot thread enterorder(level.cheesemodel, "Cheese");
	level.topbunspot thread enterorder(level.topbunmodel, "Top Bun");
	level.bottombunspot thread enterorder(level.bottombunmodel, "Bottom Bun");
	level.burgerpattyspot thread enterorder(level.burgerpattymodel, "Burger");
	level.lettucespot thread enterorder(level.lettucemodel, "Lettuce");
	//delete this later debug
	//IPrintLnBold("Burger Order");
	//IPrintLnBold(level.randomizeburgerparthints[0]+ " ", level.randomizeburgerparthints[1]+ " ", level.randomizeburgerparthints[2]+ " ", level.randomizeburgerparthints[3]+ " ", level.randomizeburgerparthints[4]);
	level thread checkorder();
	break;
	/*/
	Player must go into pantry to find the ingredients beef buns and veggies condiments and the secret ingredient which is out
	but the retard in 237 wont notice
	burger must be cooked which takes a set time like 20 - 30 secs
	during this period zombies infinitly spawn and the round progression is halted
	after this the player must then assemble the burger in order, if they fail to do this a panzer spawns and the player must wait a round to try again
	after this the player can deliver the burger to room 237 where they get a dialouge from the patron thanking them, and they receive some points maybe
	the player can then access the teleporter and packapunch and if they speak to the bartender again an altered version of the deadshot daq dialouge plays
	with deadshot being a secondary reward.
	later the player finds that the secret ingredient of the travis scott burger is zombie souls?
	default dance music for success
	karen for fail
	/*/
}

function assignburgerpartstoarray()
{
	level.randomizedburgerparts = array(level.topbunspot, level.lettucespot, level.burgerpattyspot, level.cheesespot, level.bottombunspot);
	level.randomizeburgerparthints = array("Top Bun", "Lettuce", "Burger", "Cheese", "Bottom Bun");
	level.randomizeburgerpartmodelnames = array("p7_topbunframe", "p7_lettuceframe", "p7_burgerframe", "p7_cheeseframe", "p7_bottombunframe");
	for(i = 0; i < level.randomburgerorder.size; i++)
	{
		switch(level.randomburgerorder[i])
		{
			//each case is a burger part, lazy but working with old code here and i dont wanna do a full rewrite
			/*/
			topbun=0, lettuce = 1, burger = 2, cheese = 3, bottombun = 4
			use randomized int array to assign each piece a spot in a different array
			also assigns a hint to another array for the subtitle
			/*/
			case 0:
			{
				level.randomizedburgerparts[i] = level.topbunspot;
				level.randomizeburgerparthints[i] = "Top Bun";
				level.randomizeburgerpartmodelnames[i] = "p7_topbunframe";
				break;
			}

			case 1:
			{

				level.randomizedburgerparts[i] = level.lettucespot;
				level.randomizeburgerparthints[i] = "Lettuce";
				level.randomizeburgerpartmodelnames[i] = "p7_lettuceframe";
				break;
			}

			case 2:
			{
				level.randomizedburgerparts[i] = level.burgerpattyspot;
				level.randomizeburgerparthints[i] = "Burger";
				level.randomizeburgerpartmodelnames[i] = "p7_burgerframe";
				break;
			}
			case 3:
			{

				level.randomizedburgerparts[i] = level.cheesespot;
				level.randomizeburgerparthints[i] = "Cheese";
				level.randomizeburgerpartmodelnames[i] = "p7_cheeseframe";
				break;
			}

			case 4:
			{
				level.randomizedburgerparts[i] = level.bottombunspot;
				level.randomizeburgerparthints[i] = "Bottom Bun";
				level.randomizeburgerpartmodelnames[i] = "p7_bottombunframe";
				break;
			}

		}
	}
}

function changehintstring(user_hint)
{
	self SetCursorHint("HINT_NOICON");
	self SetHintString(""+user_hint);
}

function enterorder(model, hint)
{

	//chungus153moiment
	level.firstchoice = level.randomburgerorder[0];
	level.secondchoice = level.randomburgerorder[1];
	level.thirdchoice = level.randomburgerorder[2];
	level.fourthchoice = level.randomburgerorder[3];
	level.fifthchoice = level.randomburgerorder[4];

	//randomize these somehow
	level.first = 0;
	level.second = 0;
	level.third = 0;
	level.fourth = 0;
	level.fifth = 0;
	self SetCursorHint("HINT_NOICON");
	self UseTriggerRequireLookAt();
	self SetHintString("Press ^2[{+activate}]^7 To Choose "+hint);
	self waittill("trigger", player);
	self SetCursorHint("HINT_NOICON");
	self SetHintString("");
	self PlaySound("shortbeep");
	thread PlayFxWithCleanup(level._effect["powerup_grabbed"], model.origin, 1);
	model hide();
	switch(level.choiceiteration)
	{
		case 0:
		{
			level.first = self.script_int;
			level.choiceiteration ++;
			level waittill("fivechoices");
			thread PlayFxWithCleanup(level._effect["powerup_grabbed"], self.origin, 1);
			self PlaySound(self.script_sound);
			thread zm_subtitles::subtitle_display(undefined, 3, "ACS", hint);
			wait(1);
			level notify("firstchoiceplayed");
			break;
			
		}
		case 1:
		{
			level.second = self.script_int;
			level.choiceiteration ++;
			level waittill("firstchoiceplayed");
			thread PlayFxWithCleanup(level._effect["powerup_grabbed"], self.origin, 1);
			self PlaySound(self.script_sound);
			thread zm_subtitles::subtitle_display(undefined, 3, "ACS", hint);
			wait(1);
			level notify("secondchoice");
			break;
		}
		case 2:
		{
			level.third = self.script_int;
			level.choiceiteration ++;
			level waittill("secondchoice");
			thread PlayFxWithCleanup(level._effect["powerup_grabbed"], self.origin, 1);
			self PlaySound(self.script_sound);
			thread zm_subtitles::subtitle_display(undefined, 3, "ACS", hint);
			wait(1);
			level notify("thirdchoice");
			break;
		}
		
		case 3:
		{
			level.fourth = self.script_int;
			level.choiceiteration ++;
			level waittill("thirdchoice");
			thread PlayFxWithCleanup(level._effect["powerup_grabbed"], self.origin, 1);
			self PlaySound(self.script_sound);
			thread zm_subtitles::subtitle_display(undefined, 3, "ACS", hint);
			wait(1);
			level notify("fourthchoice");
			break;
		}
		
		case 4:
		{
			level.fifth = self.script_int;
			level.choiceiteration ++;
			level waittill("fourthchoice");
			thread PlayFxWithCleanup(level._effect["powerup_grabbed"], self.origin, 1);
			self PlaySound(self.script_sound);
			thread zm_subtitles::subtitle_display(undefined, 3, "ACS", hint);
			wait(1);
			level notify("finalchoicemade");
			break;
		}
	}

}

function postplayerfail()
{
	level.randomburgerorder = array::randomize(level.randomburger);
	level thread assignburgerpartstoarray();
	level thread ingredientframesetup();
	wait(4);
	thread speak_to_meemers("defaultfail");
	//playsound
	level thread spawnpanzer();
	//level flag::set( "zombie_drop_powerups" );
	//level flag::set( "spawn_zombies" );
	//level thread enablezombies(true);
	fxModelfinalinteractmomentcooldown = util::spawn_model("tag_origin", level.finalburgerinteract.origin);
	wait(1);
	//zombies = GetAiSpeciesArray( level.zombie_team, "all" );
       // foreach(zombie in zombies)
        //{
        	//zombie zombie_utility::set_zombie_run_cycle_restore_from_override();
       // }
    PlayFXOnTag(level.phdnukefx, fxModelfinalinteractmomentcooldown, "tag_origin");
	level.finalburgerinteract thread changehintstring("You FUCKED Up! Burger Station Is Cooling Down");
	wait(30);
	fxModelfinalinteractmomentcooldown Delete();
	level.finalburgerinteract PlaySound("longbeep");
	if(isdefined(level.fxzModel)) level.fxzModel Delete();
	if(isdefined(level.fxzzModel)) level.fxzzModel Delete();
	fxModelfinalinteractmoment = util::spawn_model("tag_origin", level.finalburgerinteract.origin);
	WAIT_SERVER_FRAME;
	PlayFXOnTag("redspace/fx_launchpad_blue", fxModelfinalinteractmoment, "tag_origin");
	level.finalburgerinteract thread changehintstring("Press ^2[{+activate}]^7 To Activate Burger Station");
	level.finalburgerinteract waittill("trigger", player);
	fxModelfinalinteractmoment Delete();
	level.finalburgerinteract thread changehintstring("");
	level.cheesemodel thread appearfximmerse();
	level.topbunmodel thread appearfximmerse();
	level.bottombunmodel thread appearfximmerse();
	level.burgerpattymodel thread appearfximmerse();
	level.lettucemodel thread appearfximmerse();
	level.finalburgerinteract thread clearhintstring();
	//level thread killallzs();
	//level flag::clear( "spawn_zombies" );
	level.choiceiteration = 0;
	//delete this later debug
	//IPrintLnBold("Burger Order");
	//IPrintLnBold(level.randomizeburgerparthints[0]+ " ", level.randomizeburgerparthints[1]+ " ", level.randomizeburgerparthints[2]+ " ", level.randomizeburgerparthints[3]+ " ", level.randomizeburgerparthints[4]);
	level.cheesespot thread enterorder(level.cheesemodel, "Cheese");
	level.topbunspot thread enterorder(level.topbunmodel, "Top Bun");
	level.bottombunspot thread enterorder(level.bottombunmodel, "Bottom Bun");
	level.burgerpattyspot thread enterorder(level.burgerpattymodel, "Burger Patty");
	level.lettucespot thread enterorder(level.lettucemodel, "Lettuce");
	level thread checkorder();
	//allow the player to attempt the correct order once again
	break;
}

function killdoorfxtokitchen(fxModellockdoor)
{
	level waittill("roomservicereadytodeliver");
	level.burgercookdoorblockade MoveZ(-135,0.01);
	level.burgercookdoorblockadefx PlaySound("oilappear");
	thread PlayFxWithCleanup(level.leavedoorbarrierfx, level.burgercookdoorblockadefx.origin, 1);
	fxModellockdoor Delete();
	wait(0.5);
}


function dissapearfximmerse()
{
	thread PlayFxWithCleanup(level.keycarddisappear, self.origin, 1);
	self PlaySound("keycardtelein");
	wait(.2);
	self hide();
}

function appearfximmerse()
{
	thread PlayFxWithCleanup(level.keycarddisappear, self.origin, 1);
	self PlaySound("keycardtelein");
	wait(.2);
	self show();
}
function endtvvid()
{
	VideoStart("tvturnoff",true);
    level.finalburgerinteract PlaySound("tvbeepof");
    wait(1);
    VideoStop("tvturnoff");
    //level notify("videoscreenquestended");
}


function checkorder()
{
	//level waittill("finalchoicemade");
	level.finalburgerinteract PlaySound("smoothjazzburger");
	while(1)
	{
		if(level.choiceiteration == 5)
		{
			fxModel = util::spawn_model("tag_origin", level.finalburgerinteract.origin);
			PlayFXOnTag("redspace/fx_launchpad_blue", fxModel, "tag_origin");
			level.finalburgerinteract thread changehintstring("Press ^2[{+activate}]^7 To Confirm Ingredient Order");
			level.finalburgerinteract waittill("trigger", player);
			level.finalburgerinteract StopSound("smoothjazzburger");
			fxModel Delete();
			level.finalburgerinteract thread clearhintstring();
			wait(0.1);
					if((level.firstchoice == level.first) && (level.secondchoice == level.second) && (level.thirdchoice == level.third) && (level.fourthchoice == level.fourth) && (level.fifthchoice == level.fifth))
					{
						level thread announceorder();
						level waittill("orderannouced");
						level notify("burgerhasbeencrafted");
						level.cookarea PlaySound("vox_acscorrectorder");
						thread zm_subtitles::subtitle_display(undefined, 3, "ACS", "That was the correct order!");
						thread speak_to_meemers("defaultdance");
						level notify("videoscreenquest");
						VideoStart("richtofendefaultdance",true);
						wait(7.1);
						VideoStop("richtofendefaultdance");
						level thread endtvvid();
						thread PlayFxWithCleanup(level._effect["powerup_grabbed"], level.finalburgermodel.origin, 1);
						level.finalburgermodel show();
						level.finalburgerinteract thread changehintstring("Press ^2[{+activate}]^7 To Pick Up Order");
						//objective marker
						burgerobjectivemarker = objPoints::create("computerobjmark", level.finalburgerinteract.origin, "all", "newobjmarker", 0.8);
    					burgerobjectivemarker SetWayPoint(0, "newobjmarker", 0);
						level.finalburgerinteract waittill("trigger", player);
						level.bartenderdetect thread llyodmakehint("lloydburgdeliverremind", "Hey woah, woah, what are you giving me the burger for?", "Run it to the poor slapper in 237, get the fuck outa here go.", 1.5);
						objPoints::delete(burgerobjectivemarker);
						level.cookarea PlaySound("vox_acsdeliveryprotocals");
						thread zm_subtitles::subtitle_display(undefined, 3, "ACS", "Proceed with delivery protocols.");
						player thread barryburger();
						level.finalburgerinteract thread changehintstring("");
						player PlaySound("zmb_craftable_pickup");
						level.finalburgermodel Delete();
						level notify("roomservicereadytodeliver");
						//thread deliver script
						//and the announcer says that the burger is ready for the special ingredient but the tape fails, so the burger is delivered as is this is a stroke of luck as big chungus is actually the roomie!
						thread speak_to_meemers("mlg");
						//dialouge from lloyd
						//level flag::set( "zombie_drop_powerups" );
						//level flag::set( "spawn_zombies" );
						level thread enablezombies(true);
						wait(1);
						level thread delivertoroomie();
						level.kitchendetect Delete();
						//zombies = GetAiSpeciesArray( level.zombie_team, "all" );
        				//foreach(zombie in zombies)
        				//{
        				//	zombie zombie_utility::set_zombie_run_cycle_restore_from_override();
        				//}
						break;
					}
					else
					{
						level thread announceorder();
						level waittill("orderannouced");
						//level.fxzModel = util::spawn_model("tag_origin", level.finalburgermodel.origin);
						//level.fxzzModel = util::spawn_model("tag_origin", level.finalburgermodel.origin);
						//PlayFXOnTag(level.mushroomcloudfx, level.fxzModel, "tag_origin");
						//PlayFXOnTag(level.phdnukefx, level.fxzzModel, "tag_origin");
						level.cookarea PlaySound("vox_acsincorrectorder");
						thread zm_subtitles::subtitle_display(undefined, 1, "ACS", "That order was incorrect, summoning a manager.");
						//thread speak_to_meemers("vox_fail_long");
						level thread failsound();
						level thread postplayerfail();
						break;
					}
		}
		else
		{
			wait(0.01);
		}
	}
}

function failvid()
{
	if(level.failtime == 0)
	{
		level notify("videoscreenquest");
		VideoStart("failvidmoment",true);
		wait(17);
		VideoStop("failvidmoment");
		level thread endtvvid();
		break;
	}
	else if(level.failtime != 0)
	{
		level notify("videoscreenquest");
		VideoStart("failvidmoment",true);
		wait(1);
		VideoStop("failvidmoment");
		level thread endtvvid();
		break;
	}
}

function failsound()
{
	if(level.failtime == 0)
	{
		level thread failvid();
		level.finalburgerinteract PlaySound("vox_fail_longy");
		level.burgerinteract PlaySound("defaultfail");
		thread zm_subtitles::subtitle_display(undefined, 1, "ACS", "Angered long expression");
		level.failtime++;
		break;
	}
	else if(level.failtime == 10)
	{
		foreach(player in GetPlayers())
		{
			player thread dumbassplayer();
		}
		//thread speak_to_meemers("loudnigra");
		wait(5);
		level.custom_game_over_hud_elem = &dumbass_game_over;
		level notify("end_game");
		level.failtime++;
		break;
	}
	else
	{
		level.finalburgerinteract PlaySound("vox_fail_shortz");
		level.burgerinteract PlaySound("defaultfail");
		thread zm_subtitles::subtitle_display(undefined, 1, "ACS", "Do it again!");
		level.failtime++;
		break;
	}
}

function dumbass_game_over(player, game_over, survived)
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
	game_over SetText("YOU'RE A DUMBASS!!!");

	game_over FadeOverTime( 1 );
	game_over.alpha = 1;
	if ( player isSplitScreen() )
	{
		game_over.fontScale = 2;
		game_over.y += 40;
	}
}

function dumbassplayer()
{
	jumpscare_overlay = NewClientHudElem( self ); 
	jumpscare_overlay.alignX = "center";
	jumpscare_overlay.alignY = "center";
	jumpscare_overlay.horzAlign = "center";
	jumpscare_overlay.vertAlign = "center";
	jumpscare_overlay SetShader( "susscare", 480, 480 ); 
	jumpscare_overlay.alpha = 1; 
	self PlayLocalSound("loudnigra");  
	jumpscare_overlay.alpha = 0; 
	wait(.15); 
	jumpscare_overlay destroy();
	jumpscare_overlay = NewClientHudElem( self ); 
	jumpscare_overlay.alignX = "center";
	jumpscare_overlay.alignY = "center";
	jumpscare_overlay.horzAlign = "center";
	jumpscare_overlay.vertAlign = "center";
	jumpscare_overlay SetShader( "susscare", 480, 480 ); 
	jumpscare_overlay.alpha = 1; 
	self PlayLocalSound("loudnigra");  
	jumpscare_overlay.alpha = 0; 
	wait(.25); 
	jumpscare_overlay destroy();
	jumpscare_overlay = NewClientHudElem( self ); 
	jumpscare_overlay.alignX = "center";
	jumpscare_overlay.alignY = "center";
	jumpscare_overlay.horzAlign = "center";
	jumpscare_overlay.vertAlign = "center";
	jumpscare_overlay SetShader( "susscare", 480, 480 ); 
	jumpscare_overlay.alpha = 1; 
	self PlayLocalSound("loudnigra");  
	jumpscare_overlay.alpha = 0; 
}

function announceorder()
{
	level.cheesemodel thread appearfximmerse();
	level.topbunmodel thread appearfximmerse();
	level.bottombunmodel thread appearfximmerse();
	level.burgerpattymodel thread appearfximmerse();
	level.lettucemodel thread appearfximmerse();
	level.finalburgerinteract PlaySound("vox_orderentered");
	thread zm_subtitles::subtitle_display(undefined, 3, "ACS", "The Entered Order Was....");
	wait(2);
	level notify("fivechoices");
	wait(0.5);
	level waittill("finalchoicemade");
	thread zm_subtitles::subtitle_display(undefined, 3, "ACS", "The Correct Order Was....");
	level.finalburgerinteract PlaySound("vox_correctorder");
	wait(2);

	for(i=0; i < level.randomizedburgerparts.size; i++)
	{
		thread zm_subtitles::subtitle_display(undefined, 3, "ACS", level.randomizeburgerparthints[i]);
		level.randomizedburgerparts[i] PlaySound(level.randomizedburgerparts[i].script_sound);
		thread PlayFxWithCleanup(level._effect["powerup_grabbed"], level.randomizedburgerparts[i].origin, 1);
		wait(1);
	}

	/*/Old order reading code
	thread zm_subtitles::subtitle_display(undefined, 3, "ACS", "Top Bun");
	level.topbunspot PlaySound(level.topbunspot.script_sound);
	PlayFX(level._effect["powerup_grabbed"], level.topbunspot.origin);
	wait(1);
	thread zm_subtitles::subtitle_display(undefined, 3, "ACS", "Lettuce");
	level.lettucespot PlaySound(level.lettucespot.script_sound);
	PlayFX(level._effect["powerup_grabbed"], level.lettucespot.origin);
	wait(1);
	thread zm_subtitles::subtitle_display(undefined, 3, "ACS", "Burger Patty");
	level.burgerpattyspot PlaySound(level.burgerpattyspot.script_sound);
	PlayFX(level._effect["powerup_grabbed"], level.burgerpattyspot.origin);
	wait(1);
	thread zm_subtitles::subtitle_display(undefined, 3, "ACS", "Cheese");
	level.cheesespot PlaySound(level.cheesespot.script_sound);
	PlayFX(level._effect["powerup_grabbed"], level.cheesespot.origin);
	wait(1);
	thread zm_subtitles::subtitle_display(undefined, 3, "ACS", "Bottom Bun");
	level.bottombunspot PlaySound(level.bottombunspot.script_sound);
	PlayFX(level._effect["powerup_grabbed"], level.bottombunspot.origin);
	wait(1);
	/*/
	level notify("orderannouced");
	level.cheesemodel thread dissapearfximmerse();
	level.topbunmodel thread dissapearfximmerse();
	level.bottombunmodel thread dissapearfximmerse();
	level.burgerpattymodel thread dissapearfximmerse();
	level.lettucemodel thread dissapearfximmerse();
}

function delivertoroomie()
{
	cutscenetriggerallplayers = GetEnt("cutsceneteleport", "targetname");
	level.chungusfly = GetEntArray("chungus_float","targetname");
	level.cutscenetrackstart = GetEnt("cutscenetrack", "targetname");
	level.cutscenetrackend = GetEnt(level.cutscenetrackstart.target, "targetname");
	level.roomservicedeliver changehintstring("Press ^2[{+activate}]^7 To Deliver Roomservice [REQUIRES ALL PLAYERS]");
	level.roomservicedeliver show();
	while(1)
	{
		players = GetPlayers();
		playersinrange = 0;
		level.roomservicedeliver waittill("trigger", player);
		foreach(player in GetPlayers())
		{
			///if(player IsTouching(radius))
			if(Distance(player.origin, level.roomservicedeliver.origin)<= 115)
			{
				playersinrange ++;
			}
		}
			if(playersinrange == players.size)
			{
				break;
			}
		wait(0.05);
	}

	level notify("roomservicedeliverdone");
	foreach(player in GetPlayers()) 
	{
		player StopSound("barrybhint");
	}
	level notify("videoscreenquestended");
	wait(0.05);
	level notify("videoscreenquest");
	wait(0.25);
	level.roomservicedeliver clearhintstring();
	level.roomservicedeliver hide();
	level.questcomplete = 2;
	//IPrintLnBold("ROOMSERVICE DELIVERED PAP NOW AVALIBLE");
	//level thread killallzs();
	//level flag::clear( "spawn_zombies" );
	level thread dooropensequence();
	//foreach(player in GetPlayers())
	//{
		//player thread playercutscene();
		
	//}
	//level thread chungusscarefunc();
	//thread the new func in chilismainquest.gsc here
	level notify("beginchunguscutsceneee");
	level waittill("cutsceneover");
	level.criticaleeactive = false;
	foreach(player in GetPlayers())
	{
		player.ignoreme = true;
	}
    //level notify("cutsceneover");
    wait(1.5);
    IPrintLnBold ("Delivery Completed. This is the end of the current main quest, but many side EE's are ready to go!");
    foreach(player in GetPlayers())
    {
    	player PlayLocalSound("vox_deliverycomplete");
    }
    level thread delayaudiocommander("vox_commanderpostdelivery", 2);
	//IPrintLnBold ("ACT II: New Friends And Old Places");
	teledoorhint = objPoints::create("computerobjmark", level.teleportdoortrigger.origin, "all", "newobjmarker", 0.8);
    teledoorhint SetWayPoint(0, "newobjmarker", 0)
	thread zm_subtitles::subtitle_display(undefined, 3, "^1Patron^7", "If you are gonna freak out somewhere, can you not do it in front of my room please");
	//level flag::set( "spawn_zombies" );
	level thread enablezombies(true);
	//notify to begin act2/start of main quest
	level notify("startact2mainquest");
	level notify("videoscreenquestended");
	foreach(player in GetPlayers())
	{
		player.ignoreme = false;
	}
	level waittill("teleporterdoorunlocked");
	objPoints::delete(teledoorhint);
	//playsound here
	//cinematic cutscene
}

function delayaudiocommander(string, int)
{
	wait(int);
	foreach(player in GetPlayers())
	{
		player PlayLocalSound(string);
	}
	level thread zm_subtitles::subtitle_display(undefined, 3, "^2Mission Command", "Connection reestablished.");
	wait(2);
	level thread zm_subtitles::subtitle_display(undefined, 3, "^2Mission Command", "Strike-Team I think the upcoming road is way more dangerous than we could have possibly expected.");
	wait(3);
	level thread zm_subtitles::subtitle_display(undefined, 3, "^2Mission Command", "You should check the stairs and see if that door is unlocked, it could give us access to the PaP machine inside of Chili's.");
}

function chungusscarefunc()
{
	level waittill("playerinlair");
	foreach(player in GetPlayers())
	{
		//Example: level lui::screen_flash( 0.2, 0.1, .5, 1.0, "white" ); // fade to 1.0 alpha white over 0.2s, hold for 0.5s, and fade back in over 1.0s"
		player thread lui::screen_flash( 0.1, 0.1, 7.0, 1.0, "black" );
	}
	//speak_to_meemers("vox_unknown_findwhatsmissing");
	//thread zm_subtitles::subtitle_display(undefined, 3, "^5Unknown", "seems like you got my order wrong.");
	//wait(2);
	//thread zm_subtitles::subtitle_display(undefined, 3, undefined, "seems like you got my order wrong.");
	//play the video here
	wait(3);
	thread zm_subtitles::subtitle_display(undefined, 3, "^5Unknown", "find the missing ingredient.");
	/*/foreach(chungus_float in level.chungusfly)
	{
	chungus_float MoveZ(-5, 0.8);
	chungus_float MoveY(717, 2);
	}
	wait(2.1);
	level notify("chungusscream");
	wait(1);
	*/
	level notify("chungusscare");
	
}

function playercutscene()
{
		chunguslair = struct::get_array("chungusscaryroom_player","targetname");
		chunguscinematic1 = struct::get_array( "chunguscinematicpos1", "targetname" );
		self DisableWeapons();
        self DisableOffhandWeapons();
		self EnableInvulnerability();
        self SetOrigin(chunguscinematic1[self.characterIndex].origin);
        self SetPlayerAngles(chunguscinematic1[self.characterIndex].angles);
        self.ignoreme = true;
        thread PlayFxWithCleanup(level.oildisappear, self.origin, 0.5);
        self FreezeControls(true);
        wait(0.2);
        self shellshock( "explosion", 1.2 );
        wait(0.2);
        //Example: level lui::screen_flash( 0.2, 0.1, .5, 1.0, "white" ); // fade to 1.0 alpha white over 0.2s, hold for 0.5s, and fade back in over 1.0s"
        self thread lui::screen_flash( .1, 0.1, 1.0, 1.0, "white" );
        wait(0.6);
        self notify("stop_player_out_of_playable_area_monitor");
        playerenttrack = Spawn("script_origin", self.origin);
        self PlayerLinkToDelta(playerenttrack, "tag_origin");
        playerenttrack MoveTo(level.cutscenetrackstart.origin, 2);
        //
        //wait(2);
        playerenttrack MoveTo(level.cutscenetrackend.origin, 1);
        //wait(.8);
        self unlink();
		playerenttrack delete();
        self SetOrigin(chunguslair[self.characterIndex].origin);
        self SetPlayerAngles(chunguslair[self.characterIndex].angles);
        self FreezeControls(true);
        level notify("playerinlair");
        level waittill("chungusscream");
        self PlayLocalSound("scaryscream");
        level waittill("chungusscare");
        //self thread lui::screen_flash( 1, 0.1, 0.1, 1.0, "black" );
        wait(0.6);
        self SetOrigin(chunguscinematic1[self.characterIndex].origin);
        self SetPlayerAngles(chunguscinematic1[self.characterIndex].angles);
        self FreezeControls(true);
        thread PlayFxWithCleanup(level.oildisappear, self.origin, 0.5);
        
        //player DisableInvulnerability();
		//cin_1 = struct::get("cinematic_struct", "targetname");
		//cin_1look = struct::get("cinematic_structz", "targetname");
        //self CameraSetPosition(self GetTagOrigin("j_head"), self GetAngles());
        //self CameraActivate(true);
        //distance = Distance(self GetTagOrigin("j_head"), cin_1.origin);
        //time = 12.5;
        //time = 10;
        //self StartCameraTween(time);
        //self CameraSetPosition(cin_1.origin);
       //self CameraSetLookAt(self GetTagOrigin("j_head"));
        //wait(time);
        //player StartCameraTween(3);
        //player CameraSetPosition(player.origin, player GetAngles());
        //player CameraSetLookAt(player GetTagOrigin("j_head"));
        //wait(3);
        //player DisableInvulnerability();
        self thread zm::player_out_of_playable_area_monitor();
        self FreezeControls(false);
        self.ignoreme = false;
        //self CameraActivate(false);
        self DisableInvulnerability();
        self EnableWeapons();
        self EnableOffhandWeapons();
        self thread teleport_aftereffect_fov();
        self shellshock( "explosion", 4 );
        self shellshock( "electrocution", 4 );
        level notify("cutsceneover");
}

function teleport_aftereffect_fov()
{
	util::setClientSysState( "levelNotify", "tae", self );
}

/*/
function suckedin()
{
	vehicle_path_start = GetVehicleNode("playersuckin", "targetname");
	self.vehicle = SpawnVehicle("veh_default_zipline",(0,0,0),(0,0,0));
	self.vehicle SetIgnorePauseWorld(1);
	self HideViewModel();
	self util::magic_bullet_shield();
	self FreezeControls(1);
	self AllowSprint(0);
	self AllowJump(0);
	self DisableWeapons();
	self SetPlayerAngles(vehicle_path_start.angles);
	self.vehicle.origin = vehicle_path_start.origin;
	self.vehicle.angles = vehicle_path_start.angles;
	self SetOrigin(self.vehicle GetTagOrigin("tag_zipline"));self.vehicle.e_parent = self;
	self.vehicle SetSpeed("playersuckin",1000);
	self.vehicle vehicle::get_on_path(vehicle_path_start);
	self PlayerLinkToDelta(self.vehicle, "tag_zipline", 1, 70, 70, 15, 60);
	wait(.05);
	self thread animation::Play("cp_mi_sing_blackstation_water_flail");
	self.model_linked unlink();
	self.model_linked Delete();
	self ShowViewModel();
	self.vehicle vehicle::go_path();
	self.vehicle notify("finish_path");
	self Unlink();
	self animation::stop();
	self notify("vehicle_over");
	self util::stop_magic_bullet_shield();
	self FreezeControls(0);
	self AllowSprint(1);
	self AllowJump(1);
	self enableWeapons();
	wait (2);
}
/*/

function dooropensequence()
{
	level.roomdoor RotateYaw(90, 1.0);
	level waittill("deliveryvideoconcluded");
	level.roomdoor RotateYaw(-90, 0.8);
	
}

function killallzs()
{
	zombies = GetAiSpeciesArray( level.zombie_team, "all" );
        if ( isdefined( zombies ) )
        {
        	level.zombie_respawns += zombies.size;
        	level.zombie_total += zombies.size;
        	WAIT_SERVER_FRAME;
        	players = GetPlayers();
        	player = array::random(players);
        	//zm_powerups::specific_powerup_drop( "nuke", player.origin );
            array::run_all( zombies, &Kill );
        }
}

function clearhintstring()
{
	self SetCursorHint("HINT_NOICON");
	self SetHintString("");
}

function infinitesprintersspawn()
{
	//zombies = GetAiSpeciesArray( level.zombie_team, "all" );
	while(1)
	{
		level endon("cookcompleted");
		if(level.zombie_team.size < 25)
		{
			
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

function spawnpanzer()
{
	//play sound here
	wait(1.5);
	rise_spot = array::random( struct::get_array( "infinite_quest_sprinter", "targetname" ) );
	zm_ai_mechz::spawn_mechz(rise_spot, false);
    //e_ai.ignore_enemy_count = 1;

}

function checkifplayerhasallburg()
{
	level.playerhasallburger = false;
	level.cookarea SetCursorHint("HINT_NOICON");
	level.cookarea SetHintString("You are missing some burger items");
	//level.cookarea thread cookareacontexthint();
	while(1)
	{
		if(level flag::get("cheese_flag") && level flag::get("topbun_flag") && level flag::get("patty_flag") && level flag::get("bottombun_flag") && level flag::get("lettuce_flag")) 
		{
			level notify("alltravisingredientscollected");
			level.playerhasallburger = true;
			if(level.intructionalvideoplaying == false) level thread cookareahintcheck();
			break;
		}
		WAIT_SERVER_FRAME;
	}
}

function autoexec loadinstrings()
{
	level.boolstrings = array("cheese_flag", "topbun_flag", "patty_flag", "bottombun_flag", "lettuce_flag");
	level.audiostrings = array("vox_acscheese", "vox_acstopbun", "vox_acsburger", "vox_acsbottombun", "vox_acslettuce");
	level.stringstrings = array("Cheese", "Top Bun", "Burger", "Bottom Bun", "Lettuce");
}


function cookareacontexthint()
{
	level endon("alltravisingredientscollected");
	while(!level.playerhasallburger)
	{
		self waittill("trigger", player);
		level thread cookareahintcheck();
		wait(10);
	}
}


function cookareahintcheck()
{
	boolstrings = level.boolstrings;
	audiostrings = level.audiostrings;
	stringstrings = level.stringstrings;
	//Temp fix to stop all possible sounds when this function runs. Try a better option with a instance bool variable for the 'level.cookarea'. Could use this to also prevent the subtitle from going off multiple times.
	for(i = 0; i < audiostrings.size; i++)
	{
		level.cookarea StopSound(audiostrings[i]);
	}
	level.cookarea StopSound("vox_acsallcollected");
	WAIT_SERVER_FRAME;
	if(!level.playerhasallburger)
	{
		level.cookarea SetCursorHint("HINT_NOICON");
		level.cookarea SetHintString("You are missing some burger items");
		wait(1);
		level.cookarea PlaySound("vox_acsmissingingred");
		thread zm_subtitles::subtitle_display(undefined, 3, "ACS", "The following ingredients are missing...");
		wait(2.5);
		for(i = 0; i < boolstrings.size; i++)
		{
			if(!level flag::get(boolstrings[i]))
			{
				if(level.playerhasallburger) break;
				level.cookarea PlaySound(audiostrings[i]);
				thread zm_subtitles::subtitle_display(undefined, 3, "ACS", stringstrings[i]);
				wait(1.5);
			}
		}
	}
	else
	{
		level.cookarea PlaySound("vox_acsallcollected");
		thread zm_subtitles::subtitle_display(undefined, 3, "ACS", "All ingredients have been collected, you may begin cooking at the cooking area.");
	}
}

function travisvidhintaudio()
{
	level endon("travisvideoover");
	level endon("travisvidskipped");
	while(1)
	{
		self waittill("trigger", player);
		self PlaySound("vox_acsvideoplaying");
		thread zm_subtitles::subtitle_display(undefined, 3, "ACS", "The Intructional video is currently playing.");
		wait(20);
	}
}
function spawnfood()
{
	//bakasussyamogus
	level.travisskipmodel = util::spawn_model("tag_origin", level.finalburgerinteract.origin);
	level endon("travisvidskipped");
	level thread checkifplayerhasallburg();
	//start the burger game sequence, lock the players in the kitchen after they enter and start the video, they may skip at the burger station if they do't want to watch.
		//level.kitchendetect waittill("trigger", player);
		
		//if(level flag::get("cheese_flag") && level flag::get("topbun_flag") && level flag::get("patty_flag") && level flag::get("bottombun_flag") && level flag::get("lettuce_flag"))
		//{
		level.cookarea SetCursorHint("HINT_NOICON");
		level.cookarea SetHintString("Instructional Video Is Playing");
		level.cookarea thread travisvidhintaudio();
		level notify("burgergameactivate");
		level notify("videoscreenquest");
		wait(1);
		level.cookarea PlaySound("vox_acsburgervidintro");
		thread zm_subtitles::subtitle_display(undefined, 3, "ACS", "Beginning Instructional Employee Video.");
		level.intructionalvideoplaying = true;
		wait(3);
		VideoStart("tvbeep",true);
		level.kitchendetect PlaySound("tvbeep");
        wait(1);
        VideoStop("tvbeep");
        wait(.2);
        level.kitchendetect PlaySound("travisburgeraudio");
       	VideoStart("travisburgvid",false);
       	wait(2);
       	level thread skiptravisvideo();
        wait(161);
        level.burgerprotecttime = 45;
        level.travisskipmodel Delete();
		level.finalburgerinteract SetCursorHint("HINT_NOICON");
		level.finalburgerinteract SetHintString("");
        VideoStart("tvbeep",true);
		level.kitchendetect PlaySound("tvbeep");
        wait(1);
        VideoStop("tvbeep");
        wait(.2);
        level.cookarea StopSound("vox_acsvideoplaying");
		wait(1);
		level.cookarea PlaySound("vox_acsvideoconclude");
		thread zm_subtitles::subtitle_display(undefined, 3, "ACS", "The Intructional video has concluded.");
		level.intructionalvideoplaying = false;
		wait(4);
		level notify("travisvideoended");
		level notify("travisvideoover");
		level thread cookareahintcheck();
}


function skiptravisvideo()
{
	level endon("travisvideoended");
	wait(3);
	PlayFXOnTag("redspace/fx_launchpad_blue", level.travisskipmodel, "tag_origin");
	level.finalburgerinteract SetHintString("Press ^2[{+activate}]^7 To Skip Educational Video");
	level.finalburgerinteract SetCursorHint("HINT_NOICON");
	level.finalburgerinteract waittill("trigger", player);
	level.finalburgerinteract SetHintString("Are you sure? Failing the next step will cause a Panzer to spawn. The holdout section of this step will be shorter if the video isn't skipped.");
	wait(1);
	level.finalburgerinteract waittill("trigger", player);
	level.burgerprotecttime = 60;
	level.intructionalvideoplaying = false;
	level.cookarea PlaySound("vox_acsskippedvideo");
	thread zm_subtitles::subtitle_display(undefined, 3, "ACS", "You've chosen to skip the intruction employee video. Lame.");

	level.cookarea StopSound("vox_acsburgervidintro");
	level.travisskipmodel Delete();
	level.cookarea SetCursorHint("HINT_NOICON");
	level.cookarea SetHintString("");
	level.kitchendetect StopSound("travisburgeraudio");
	VideoStop("tvbeep");
	VideoStop("travisburgvid");
	VideoStart("tvbeep",true);
	level.kitchendetect PlaySound("tvbeep");
    wait(1);
    VideoStop("tvbeep");
    wait(.2);
	level.finalburgerinteract SetHintString("");
	level.cookarea StopSound("vox_acsvideoplaying");
	wait(2.5);
	level notify("travisvidskipped");
	level notify("travisvideoover");
	level thread cookareahintcheck();
}

function barryburger(stringnotify)
{
	level endon("maincutscenestarted");
	self thread burgertimenudge(60, "elev_descent");
	level waittill("elev_descent");
	//wait(1);
	self PlaySound("barrybelevator");
	self StopSound("barrybhint");
	thread zm_subtitles::subtitle_display(undefined, 3, "^2Barry The Burger", "You know I've never actually been to the hotel.");
	wait(2);
	thread zm_subtitles::subtitle_display(undefined, 3, "^2Barry The Burger", "Which is weird considering I've heard a lot of spooky things about it.");
	wait(5);
	thread zm_subtitles::subtitle_display(undefined, 3, "^2Barry The Burger", "Like ghosts and ghosts and yeah that's about it.");
	wait(1);
	self thread burgertimenudge(60, "roomservicedeliverdone");
}

function burgertimenudge(time, stringnotify)
{
	level endon("maincutscenestarted");
	level endon(stringnotify);
	wait(time);
	self PlaySound("barrybhint");
	thread zm_subtitles::subtitle_display(undefined, 3, "^2Barry The Burger", "*Various humming and singing*");
	wait(9);
	thread zm_subtitles::subtitle_display(undefined, 3, "^2Barry The Burger", "Oh I'm sorry, I'm just thinking about how your dumbass hasn't gotten me TO THE OBJECTIVE.");
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

function burgerparts(flag, hint, part, otherpart)
{
	self SetCursorHint("HINT_NOICON");
	self SetHintString("");
	part = GetEnt(self.target, "targetname");
	part hide();
	otherpart hide();
	level waittill("burgergamepartspawn");
	part show();
	self SetCursorHint("HINT_NOICON");
	self SetHintString("Press ^2[{+activate}]^7 to pickup "+hint);
	self waittill("trigger", player);
	level flag::set(flag);
	player PlaySound("zmb_craftable_pickup");
	wait(0.1);
	thread PlayFxWithCleanup(level._effect["powerup_grabbed"], self.origin, 1);
	otherpart show();
	part Delete();
	self Delete();
}


function autoexec pantrydoorunlock()
{
	level.keycardpantryreader = GetEnt("keycardreaderpantry","targetname");
	level.keycardpantryreader SetCursorHint("HINT_NOICON");
	level.keycardpantryreader SetHintString(&"ZOMBIE_NEED_POWER");
	level waittill("initial_blackscreen_passed");
	level waittill("power_on");
	level.keycardpantryreader SetHintString("This requires an employee keycard.");
	level waittill("keycardpickuplloyd");
	pantrypoint = objPoints::create("computerobjmark", level.keycardpantryreader.origin, "all", "newobjmarker", 0.8);
    pantrypoint SetWayPoint(0, "newobjmarker", 0);
	level.keycardpantryreader SetHintString("Press ^2[{+activate}]^7 To Unlock Pantry [REQUIRES ALL PLAYERS]");
	//level.keycardpantryreader waittill("trigger", player);
	//level.keycardpantryreader waittill("trigger", player);
	while(1)
	{
		players = GetPlayers();
		playersinrange = 0;
		level.keycardpantryreader waittill("trigger", player);
		foreach(player in GetPlayers())
		{
			///if(player IsTouching(radius))
			if(Distance(player.origin, level.keycardpantryreader.origin)<= 115)
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
	objPoints::delete(pantrypoint);
	level.criticaleeactive = true;
	level thread spawnfood();
	level.keycardpantryreader Delete();
	level.keycardpantry show();
	thread PlayFxWithCleanup(level.keycarddisappear, level.keycardpantry.origin, 1);
	level.keycardpantry PlaySound("keycardtelein");
	wait(.2);
	level.keycardpantry MoveX (-15, 1.5);
	wait(1.2);
	level.keycardpantryreader PlaySound("longbeep");
	wait(.3);
	thread PlayFxWithCleanup(level.keycarddisappear, level.keycardpantry.origin, 1);
	level.keycardpantry PlaySound("keycardtelein");
	wait(.2);
	level.keycardpantry Delete();
	wait(1);
	level.keycardpantrydoor PlaySound("safe_door_unlock");
	level.keycardpantrydoor RotateYaw(-100, 1.2);
	level.keycardpantrydoorclip EnableLinkTo();
	level.keycardpantrydoorclip LinkTo(level.keycardpantrydoor);
	level.questcomplete = 1;
}

function whitescreenflash()
{
	foreach(player in GetPlayers())
	{
		player thread playerscreenfash();
	}
}

function playerscreenfash()
{
	speak_to_meemers("success");
	self thread lui::screen_flash( 0.2, 0.1, .5, .87, "white" );
}

function whitescreenflash12()
{
	foreach(player in GetPlayers())
	{
		player thread playerscreenfash13();
	}
}

function playerscreenfash13()
{
	speak_to_meemers("trial_completez");
	self thread lui::screen_flash( 0.2, 0.1, .5, .87, "white" );
}

function startsoulcanisterfx()
{
	foreach(tube in level.soul_tubes)
    {
    	fxModellockdoor2 = util::spawn_model("tag_origin", tube.origin);
		PlayFXOnTag(level.soulsuccfx, fxModellockdoor2, "tag_origin");
		fxModellockdoor2 PlayLoopSound("soulambloop");
		fxModellockdoor2 PlaySound("oilappear");
		level waittill("deletesoulsucc");
		fxModellockdoor2 StopLoopSound(0.5);
		fxModellockdoor2 Delete();
    }
}

function playerdetectuplinkpc()
{
	level endon("power_on");
	self waittill("trigger", player);
	self PlaySound("fly_tac_insert_plant");
	wait(1);
	self PlaySound("vox_terminalai_powerlow");
	thread zm_subtitles::subtitle_display(undefined, 3, "^0Terminal", "Strike team detected, reserve power at critically low levels. External power required.");
	level notify("firstterminalhintactivated");
}

function loopingcomputerring()
{
	level waittill("power_on");
	pcaurafxspot = GetEnt("pcreadyfxterminal", "targetname");
	level.loopcomputerfxmoment = util::spawn_model("tag_origin", pcaurafxspot.origin);
	PlayFXOnTag(level.terminalfxlinkblue, level.loopcomputerfxmoment, "tag_origin");
	while(1)
	{
		level endon("computersequencestartedmoment");
		self PlaySound("fly_tac_insert_plant");
		wait(15);
	}
}

function pcterminalfailsafetimer(time)
{
	level endon("soulcanisterfilledchilis");
	wait(time);
	level thread soulnotifysus();
	level notify("soulcanisterfilledchilis");
}


function soulnotifysus()
{
	wait(0.1);
	level notify("lastsoulabsorbeduplinkpc");
}

function moveclipsandfx()
{
	self MoveZ(221.8, 0.05);
	PlaySoundAtPosition("oilappear", self.origin);
	level waittill("computeractivatedplayerinteract");
	PlaySoundAtPosition("oilappear", self.origin);
	self MoveZ(-221.8, 0.1);
	wait(0.1);
	self Delete();
}

function autoexec uplinkpc()
{
	level waittill("initial_blackscreen_passed");
	level endon("skipstartingdialougechilis");
	pcaurafxspot = GetEnt("pcreadyfxterminal", "targetname");
	pcaurafxspot3 = util::spawn_model("tag_origin", pcaurafxspot.origin);
	level.soulzombiedetectbaka = GetEnt("zombiesouldetectpc", "targetname");
	level.soulzombiedetectbaka thread playerdetectuplinkpc();
	level.soulzombiedetectbaka thread loopingcomputerring();
	//level endon("pcactivation");
	level.soul_tubes = GetEntArray("terminalsoulcylinder","targetname");
	level.computeritem = GetEnt("computerterminalinteract", "targetname");
    uplinktrig = GetEnt("pcuplinkterminalint", "targetname");
    uplinktrig UseTriggerRequireLookAt();
    uplinktrig SetHintString( &"ZOMBIE_NEED_POWER" );
	uplinktrig SetCursorHint("HINT_NOICON");
    level waittill("power_on");
    computerobjmark = objPoints::create("computerobjmark", uplinktrig.origin, "all", "newobjmarker", 0.8);
    computerobjmark SetWayPoint(0, "newobjmarker", 0);
    level.computeritem vibrate((0,-100,0), 0.3, 0.4, 3);
    uplinktrig PlaySound("striketeamdetect");
    thread zm_subtitles::subtitle_display(undefined, 3, "^0Terminal", "Computer power stable, ready to establish uplink");
    uplinktrig SetHintString( "Hold ^3[{+activate}]^7 to activate Uplink Console. [REQUIRES ALL PLAYERS]" );
	uplinktrig SetCursorHint("HINT_NOICON");
	//uplinktrig waittill("trigger", player);
	terminalpcclips = GetEntArray("terminalpcclip", "targetname");
	uplinkterminalplayercheck = GetEnt("uplinkterminalplayercheck", "targetname");
	while(1)
	{
		players = GetPlayers();
		playersinrange = 0;
		uplinktrig waittill("trigger", player);
		foreach(player in GetPlayers())
		{
			if(player IsTouching(uplinkterminalplayercheck))
			{
				playersinrange ++;
			}
		}
		if(playersinrange == players.size)
		{
			break;
		}
		wait(0.05);
	}
	//flash screen and earthquake
	uplinkterminalplayercheck Delete();
	level thread whitescreenflash12();
	earthQuake(.45, 3, uplinktrig.origin, 1500);
	foreach(clip in terminalpcclips)
	{
		clip thread moveclipsandfx();
	}
	level thread enablezombies(false);
	wait(0.05);
	//level thread pcterminalfailsafetimer(50);
	level.loopcomputerfxmoment Delete();
	level notify("computersequencestartedmoment");
	foreach(player in GetPlayers())
	{
		player PlayLocalSound("80srush");
	}
	level thread infinitesprintersspawn();
    level thread startsoulcanisterfx();
	uplinktrig SetHintString( "Souls are required to establish a stable connection." );
	uplinktrig SetCursorHint("HINT_NOICON");
    level.soulcylindercount = 0;
    zm_spawner::register_zombie_death_event_callback(&zombie_death_check);
    level waittill("soulcanisterfilledchilis");
    zm_spawner::deregister_zombie_death_event_callback(&zombie_death_check);
    level waittill("lastsoulabsorbeduplinkpc");
	level thread soulcansiterfxdelete();
    level notify("deletecylindermodelsoulbox");
    uplinktrig PlaySound("computerterminalcomplete");
    fxModellockdoor23 = util::spawn_model("tag_origin", level.computeritem.origin);
    pcaurafxspot2 = util::spawn_model("tag_origin", pcaurafxspot.origin);
	PlayFXOnTag(level.computeractivate, pcaurafxspot2, "tag_origin");
	uplinktrig SetHintString( "Hold ^3[{+activate}]^7 to establish connection." );
	uplinktrig SetCursorHint("HINT_NOICON");
	level notify("cookcompleted");
	level thread killallzs();
	WAIT_SERVER_FRAME;
	////////PhysicsExplosionCylinder(uplinktrig.origin, 600, 400, 25);
	foreach(player in GetPlayers())
	{
		player StopLocalSound("80srush");
	}
	uplinktrig waittill("trigger", player);
	level notify("computeractivatedplayerinteract");
	objPoints::delete(computerobjmark);
	pcaurafxspot2 Delete();
	level thread skylaseractivate();
	zombies = GetAiSpeciesArray( level.zombie_team, "all" );
	WAIT_SERVER_FRAME;
        //foreach(zombie in zombies)
        //{
        //	zombie zombie_utility::set_zombie_run_cycle_restore_from_override();
        //}
	uplinktrig PlaySound("connectionestablished");
	level thread whitescreenflash12();
	fxModellockdoor234 = util::spawn_model("tag_origin", level.computeritem.origin);
	PlayFXOnTag(level.computerexplode, fxModellockdoor23, "tag_origin");
	uplinktrig PlaySound("trial_completez");
	fxModellockdoor23 Delete();
	uplinktrig SetHintString( "" );
	uplinktrig SetCursorHint("HINT_NOICON");
	level thread waitforloredrop();
    thread zm_subtitles::subtitle_display(undefined, 3, "^0Terminal", "Connection established.");
    level notify("pcactivation");
    wait(2);
    //the demise of Zulu is regrettable, but we need to move on
    level thread skipstartingchilisdialouge();
    uplinktrig PlaySound("vox_command_commsestablished");
    thread zm_subtitles::subtitle_display(undefined, 3, "^2Mission Command", "Confirmed uplink from inside of the anomaly. Strike-Team this is command.");
    wait(4);
    thread zm_subtitles::subtitle_display(undefined, 3, "^2Mission Command", "You likely don't know who I am or where you currently are. This is a side effect of being inside of the temporal fracture.");
    wait(9);
    uplinktrig PlaySound("vox_command_shortexplanation");
    thread zm_subtitles::subtitle_display(undefined, 3, "^2Mission Command", "So here's a short explanation. I am the Strike-Team commander, you are Strike-Team Zulu.");
    wait(6);
    thread zm_subtitles::subtitle_display(undefined, 3, "^2Mission Command", "You were sent into a dimensional fracture that appeared roughly 42hrs ago.");
    wait(5);
    thread zm_subtitles::subtitle_display(undefined, 3, "^2Mission Command", "Before you were sent in, Strike-Team X-Ray was also sent in. Unfourtunately Team X-Ray has not survived.");
    wait(9);
    thread zm_subtitles::subtitle_display(undefined, 3, "^2Mission Command", "Their bodies are the ones that lay in the lobby of the restaraunt.");
    wait(5);
    uplinktrig PlaySound("vox_command_startinvestigation");
    thread zm_subtitles::subtitle_display(undefined, 3, "^2Mission Command", "As for why the dimesional fracture took the form of America's favorite family restaraunt, or why there's undead sieging it consistently.");
    wait(8);
    thread zm_subtitles::subtitle_display(undefined, 3, "^2Mission Command", "We really don't have any idea, which is why we sent you there to investigate what's happening.");
    wait(5.5);
    thread zm_subtitles::subtitle_display(undefined, 3, "^2Mission Command", "We need you to start investigation with the service elevator at the back of the restaraunt.");
    wait(5);
    //have short moment here where no zombies spawn to establish lore
    level notify("pregameloredrop");
    uplinktrig SetHintString( "" );
	uplinktrig SetCursorHint("HINT_NOICON");
    //add sounds here
}

function skipstartingchilisdialouge()
{
	level endon("pregameloredrop");
	wait(1);
	uplinktrig = GetEnt("pcuplinkterminalint", "targetname");
	uplinktrig SetHintString("Press ^3[{+activate}]^7 to skip");
	uplinktrig SetCursorHint("HINT_NOICON");
	uplinktrig waittill("trigger", player);
	uplinktrig PlaySound("buttonpressaj_1");
	uplinktrig SetHintString("");
	uplinktrig SetCursorHint("HINT_NOICON");
	level notify("skipstartingdialougechilis");
	uplinktrig StopSound("vox_command_commsestablished");
	uplinktrig StopSound("vox_command_shortexplanation");
	uplinktrig StopSound("vox_command_startinvestigation");
	wait(1);
	uplinktrig PlaySound("vox_command_gostraittoelevator");
	thread zm_subtitles::subtitle_display(undefined, 3, "^2Mission Command", "Alright, go straight to the service elevator.");
	level notify("pregameloredrop");
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

function waitforloredrop()
{
	level waittill("pregameloredrop");
	level thread enablezombies(true);
	wait(1);
	//zombies = GetAiSpeciesArray( level.zombie_team, "all" );
        //foreach(zombie in zombies)
        //{
        	//zombie zombie_utility::set_zombie_run_cycle_restore_from_override();
      //  }
}

function skylaseractivate()
{
	earthQuake(.75, 3, level.skylasersource.origin, 1500);
	skylaser = util::spawn_model("tag_origin", level.skylasersource.origin);
	PlayFXOnTag(level.skylaser, skylaser, "tag_origin");
	skylaser RotatePitch(270, 0.05);
	skylaser PlayLoopSound("skylazersound");
	wait 2;
	skylaserexplosion = util::spawn_model("tag_origin", level.chilisskyportal.origin);
	PlayFXOnTag(level.skylaserexplosion, skylaserexplosion, "tag_origin");
	level.chilisskyportal RotateRoll(180, 0.05);
	PlayFXOnTag(level.skylaserimpact, skylaserexplosion, "tag_origin");
	//test scene
}

function checkzombiecount()
{
	level endon("soulcanisterfilledchilis");

	players = GetPlayers();
	if(players.size > 1)
	{
		//coop limit
		soullimit = 10;
	}
	else
	{
		//solo limit
		soullimit = 6;
	}


	if(level.soulcylindercount == soullimit)
        {
            level notify("soulcanisterfilledchilis");
        }
        else
        {
            break;
        }
        break;
}
function soulcansiterfxdelete()
{
	foreach(tube in level.soul_tubes)
    {
    	fxModellockdoor = util::spawn_model("tag_origin", tube.origin);
    	level notify("deletesoulsucc");
		PlayFXOnTag(level.soulexplode, fxModellockdoor, "tag_origin");
		level waittill("deletecylindermodelsoulbox");
		fxModellockdoor Delete();
    }
}

function zombie_death_check()
{
soul_tubes = GetEntArray("terminalsoulcylinder","targetname");
tube = ArrayGetClosest(self.origin,soul_tubes);

	//if(self IsTouching(level.soulzombiedetectbaka))
	    //{
	    fxModellockdoor = util::spawn_model("tag_origin", self.origin);
	    WAIT_SERVER_FRAME;
	    fxModellockdoor PlaySound("soulsuckzz");
	    PlayFXOnTag(level.soulfx, fxModellockdoor, "tag_origin");
	    fxModellockdoor MoveTo(tube.origin, 2);
	    level thread checkzombiecount();
	    level.soulcylindercount ++;
	    wait 2;
	    fxModellockdoor PlaySound("soulabsorb");
	    fxModellockdoor Delete();
	    level notify("lastsoulabsorbeduplinkpc");
	    //}
	//else
	//{
		//break;
	//}
}
//start fast travel ee
function autoexec bathroomfasttravel()
{
	level waittill("initial_blackscreen_passed");
	level.goldroomfasttp = struct::get_array( "goldroomfasttravelspots", "targetname" );
	level.upstairsbroomsoulscount = 0;
    level.goldroombromsoulscount = 0;
	level.portalloop = "dlc1/castle/fx_ee_keeper_demongate_portal_loop";
	level.bathroomfasttravelnum = 0;
    level.bathroomint = RandomInt(2);

    if(level.bathroomint == 0)
    {
    	
        level.zombietriggerdet = GetEnt("upstairsbroom2eezmb", "targetname");
        level.toilet = GetEnt("upstairsbroom2eetoilet", "targetname");
        level.stalldoor = GetEntArray("upstairsbroom2ee", "targetname");
        level.stalltrigger = GetEnt("upstairsbroom2eetrig", "targetname");
        level.chilisfasttp = struct::get_array( "bathroom2structs", "targetname" );
    }
    else
    {
    	
        level.zombietriggerdet = GetEnt("upstairsbroom1eezmb", "targetname");
        level.toilet = GetEnt("upstairsbroom1eetoilet", "targetname");
        level.stalldoor = GetEntArray("upstairsbroom1ee", "targetname");
        level.stalltrigger = GetEnt("upstairsbroom1eetrig", "targetname");
        level.chilisfasttp = struct::get_array( "bathroom1structs", "targetname" );
    }

    level waittill("startfasttravelee");
    doorhintfx = util::spawn_model("tag_origin", level.stalltrigger.origin);
    doorhintfx PlayLoopSound("bathroomdoorsussy");
    PlayFXOnTag("zombie/fx_glow_smokeman_doa", doorhintfx, "tag_origin");
    level.stalltrigger waittill("trigger", player);
    doorhintfx StopLoopSound(0.5);
    doorhintfx Delete();
    level.stalltrigger PlaySound("shortbeep");
    foreach(item in level.stalldoor)
    {
    	doordelete = util::spawn_model("tag_origin", item.origin);
		PlayFXOnTag(level.computerexplode, doordelete, "tag_origin");
		doordelete Delete();
		item Delete();
    }
    level.stalltrigger Delete();
    level.toilet thread spininfinite();
    level waittill("soulup");
    sumoningkeysucc = util::spawn_model("tag_origin", level.toilet.origin);
    sumoningkeysucc MoveZ(3, 0.001);
	PlayFXOnTag(level.soulsuccfx, level.toilet, "tag_origin");
    
    zm_spawner::register_zombie_death_event_callback(&zombie_death_check_upbath);
    level waittill("upstairsbathroomeecharge");
    zm_spawner::deregister_zombie_death_event_callback(&zombie_death_check_upbath);
    level waittill("lastsoulabsorbedupstairbroom");
    foreach(player in GetPlayers())
    {
    	if(player IsTouching(level.zombietriggerdet))
    	{
    		player thread lui::screen_flash( 0.2, 0.1, .5, .87, "white" );
    	}
    }
    PlayFXOnTag(level.computerexplode, sumoningkeysucc, "tag_origin");
    level.toiletfinish = util::spawn_model("tag_origin", sumoningkeysucc.origin);
	PlayFXOnTag(level.portalloop, level.toiletfinish, "tag_origin");
	sumoningkeysucc PlaySound("trial_completez"); 
	sumoningkeysucc PlaySound("arsandrescuerooter");
	sumoningkeysucc Delete();
	level.toilet Delete();
	level notify("upstairsbromcompleted");
	level.bathroomfasttravelnum ++;
	level thread checkfasttravelnumber();
	level.toiletfinish PlayLoopSound("wispportalloop");
	level waittill("bothbathroomscharged");
	level.toiletfinish StopLoopSound(0.5);
	PlayFXOnTag(level.portalopen, level.toiletfinish, "tag_origin");
	level.toiletfinish PlayLoopSound("portalbathloop");
	level.zombietriggerdet Delete();
	level thread teleporttopfloor();
	wait(2);
	level.toiletfinish PlaySound("jumpscarearcadecraniancs");
}

function teleporttopfloor()
{
	//IPrintLnBold ("triggered");
	if(level.bathroomint == 0)
	{
		level.chilisportal = GetEnt("bathroomfasttravelupstairs2", "targetname");
	}
	else
	{
		level.chilisportal = GetEnt("bathroomfasttravelupstairs1", "targetname");
	}
	while(1)
	{
		level.chilisportal waittill("trigger", player);
		//IPrintLnBold ("triggered");
		player thread teleportfasttravelee(level.goldroomfasttp);
	}
}

function checkfasttravelnumber()
{
	if(level.bathroomfasttravelnum == 2)
	{
		//IPrintLnBold ("both rooms charged");
		wait(1);
		level notify("bothbathroomscharged");
		level.black_spots = struct::get_array( "black_orgs", "targetname" );
		level.black_spots_targets = []; 
    	for( i=0;i<level.black_spots.size;i++ )
    	{
			level.black_spots_targets[i] = struct::get( level.black_spots[i].target, "targetname" );
    	}	
	}
	else
	{
		break;
	}
}

function spininfinite()
{
	PlayFXOnTag(level.soulfx, self, "tag_origin");
	self PlayLoopSound("soulambloop");
	self MoveZ(20, 2);
	wait(2);
	level notify("soulup");
	self PlaySound("oilappear");
	level endon("upstairsbromcompleted");
	while(1)
	{
		self RotateYaw(360, 2);
		wait(2);
	}
}

function zombie_death_check_upbath()
{
    if(self IsTouching(level.zombietriggerdet))
        {
        fxModellockdoor = util::spawn_model("tag_origin", self.origin);
        WAIT_SERVER_FRAME;
        fxModellockdoor PlaySound("soulsuckzz");
        PlayFXOnTag(level.soulfx, fxModellockdoor, "tag_origin");
        fxModellockdoor MoveTo(level.toilet.origin, 2);
        level.upstairsbroomsoulscount ++;
        level thread checkzombiecountsoulsboxz();
        wait 2;
        fxModellockdoor PlaySound("soulabsorb");
        fxModellockdoor Delete();
        level notify("lastsoulabsorbedupstairbroom");
        }
    else
    {
        break;
    }
}

function checkzombiecountsoulsboxz()
{
    if(level.goldroombromsoulscount == 25)
    {
       level.goldroombromsoulscount ++;
       level notify("goldroombroomsoulscollected");
       //IPrintLnBold ("gold room done");
    }
    else if(level.upstairsbroomsoulscount == 15)
    {
        level.upstairsbroomsoulscount ++;
        level notify("upstairsbathroomeecharge");
        //IPrintLnBold ("upstairs done");
    }
    else
    {
    	break;
    }
}

function unstickplayerChungus()
{
	thread zm_subtitles::subtitle_display(undefined, 2, "-... .- ... . -..", "Didn't your mom ever tell you not to stand in front of closing doors?");
	self PlayLocalSound("playergotchungusstuck");
	self.ignoreme = true;
    wait(1.1);
    self thread teleportfasttravelee(level.chnugusunstuck);
    wait(0.5);
    self.ignoreme = false;
}



//goldroom bathroom
function autoexec medium_chungus()
{
  level.chnugusunstuck = struct::get_array("playerchungusscriptarray","targetname");
  level waittill("initial_blackscreen_passed");
  //level waittill("power_on");
  level.masterpasseefound = false;
  //vase
  vase = GetEnt("pricelessvase","targetname");
  vasetrig = GetEnt("breakvasedmgtrig","targetname");
  vaseinteract = GetEnt("masterpassinteract","targetname");
  vase Hide();
  vaseinteract SetCursorHint("HINT_NOICON");
  vaseinteract SetHintString("");
  //end vase
  level.chungussoultrig = GetEnt("goldroomsoultrigger", "targetname");
  level.portalchungusspawn = GetEnt("goldroomportalspawn", "targetname");
  level.goldroomsummkey = GetEnt("goldroomsummkey", "targetname");
  level.portalchungusspawn hide();
  chungus_trig = GetEnt("chungus_trigger", "targetname");
  doorfx1 = GetEnt("doorfx1","targetname");
  doorfx2 = GetEnt("doorfx2","targetname");
  chungus_door = GetEnt("chungus_door", "targetname");
  chungus_man = GetEnt("fatchungus", "targetname");
  chungus_clip = GetEnt("chungusclip", "targetname");
  chungus_trig2 = GetEnt("chungustrigfasttravelinteract","targetname");
  chungus_clip EnableLinkTo();
  chungus_clip LinkTo(chungus_door);
  chungusfootprintclip = GetEnt("chungusclipee", "targetname");
    chungus_trig waittill ("trigger", player);
    thread PlayFxWithCleanup(level._effect["powerup_grabbed"], doorfx1.origin, 1);
    doorfx1 Delete();
    PlaySoundAtPosition("elish1", chungus_man.origin);
    doorfx1 Delete();
    wait(11);
    chungus_trig waittill ("trigger", player);
    thread PlayFxWithCleanup(level._effect["powerup_grabbed"], doorfx2.origin, 1);
    PlaySoundAtPosition("elish2", chungus_man.origin);
    doorfx2 Delete();
    wait(1);
    PlaySoundAtPosition("dooropen", chungus_door.origin);
    chungus_door RotateYaw(100, 1);
    PlaySoundAtPosition("jumpscarearcadecraniancs", chungus_man.origin);
    PlaySoundAtPosition("dempseychungus", player.origin);
    //change this later
    //IPrintLnBold ("what.");
    wait(22);
    wait(1);
    chungus_door RotateYaw(-100, .7);
    wait(.7);
    chungusfootprintclip MoveY(-45, 0.01);
    wait(0.1);
    //check if a player got stuck
    playerstuckdetect = GetEnt("detectplayerstuckchungus", "targetname");
    //level.chnugusunstuck = struct::get_array("playerchungusscriptarray","targetname");

    chungusfootprintclip MoveY(45, 0.01);
    PlaySoundAtPosition("doorslam", chungus_man.origin);
    chungus_man Delete();
    chungus_trig Delete();
    wait(1.5);
    foreach(player in GetPlayers())
    {
    	if(player IsTouching(playerstuckdetect))
    	{
    		player thread lui::screen_flash( 0.2, 0.1, .5, .87, "white" );
    		player thread unstickplayerChungus();
    	}
    }
     zombs = GetAiSpeciesArray( level.zombie_team, "all" );
      for(k=0;k<zombs.size;k++)
      {
        if( zombs[k] IsTouching( playerstuckdetect ) )
        {
          zombs[k] Kill();
        }
      }
    wait(0.5);
  wait(3);
  //chungus_trig2 PlaySound("masterpasshint");
  //level notify("masterpasseebeginnow");

  //level flag here
  level.masterpasseefound = true;
  level waittill("masterpassvidcompletion");
  vase = GetEnt("pricelessvase","targetname");
  vasetrig = GetEnt("breakvasedmgtrig","targetname");
  vaseinteract = GetEnt("masterpassinteract","targetname");
  vase Hide();
  vaseinteract SetCursorHint("HINT_NOICON");
  vaseinteract SetHintString("");
  vase Show();
  thread PlayFxWithCleanup(level._effect["powerup_grabbed"], vase.origin, 1);
  vasetrig waittill("trigger", player);
  thread PlayFxWithCleanup("dlc3/stalingrad/fx_dest_ceiling_break_cage", vase.origin, 1);
  vase PlaySound("oilappear");
  vase SetModel("masterpassf");
  vase MoveZ(15, 0.1);
  vase RotatePitch(180, 0.05);
  vase thread epicspin();
  wait(0.1);
  vase PlayLoopSound("bathroomdoorsussy");
  //sussybakas23e
  vaseinteract waittill("trigger", player);
  level.masterpassfx Delete();
  vase StopLoopSound(0.5);
  IPrintLnBold ("You got your self a masterpass to fast.");
  player PlaySound("memento_pickup");
  vase Delete();
  vasetrig Delete();
  vaseinteract Delete();
  doorhintfx = util::spawn_model("tag_origin", chungus_trig2.origin);
  WAIT_SERVER_FRAME;
  doorhintfx PlayLoopSound("bathroomdoorsussy");
  PlayFXOnTag("zombie/fx_glow_smokeman_doa", doorhintfx, "tag_origin");
  level notify("startfasttravelee");
  chungus_trig2 waittill ("trigger", player);
  doorhintfx StopLoopSound(0.5);
  doorhintfx Delete();
  chungus_trig2 PlaySound("shortbeep");
  chungusfootprintclip Delete();
  PlaySoundAtPosition("dooropen", chungus_door.origin);
  chungus_door RotateYaw(100, 1);
  wait(1.5);
  level.goldroomsummkey thread spininfinite2();
  level waittill("soulupgoldroom");
  sumoningkeysucc = util::spawn_model("tag_origin", level.goldroomsummkey.origin);
  WAIT_SERVER_FRAME;
  sumoningkeysucc MoveZ(3, 0.001);
  sumoningkeysucc EnableLinkTo();
  sumoningkeysucc LinkTo(level.goldroomsummkey);
  PlayFXOnTag(level.soulsuccfx, sumoningkeysucc, "tag_origin");
  zm_spawner::register_zombie_death_event_callback(&zombie_death_check_downbath);
    level waittill("goldroombroomsoulscollected");
    zm_spawner::deregister_zombie_death_event_callback(&zombie_death_check_downbath);
    level waittill("lastsoulabsorbeddownstairbroom");
    foreach(player in GetPlayers())
    {
    	if(player IsTouching(level.chungussoultrig))
    	{
    		player thread lui::screen_flash( 0.2, 0.1, .5, .87, "white" );
    	}
    }
    PlayFXOnTag(level.computerexplode, sumoningkeysucc, "tag_origin");
    level.goldtoiletfinish = util::spawn_model("tag_origin", level.portalchungusspawn.origin);
    sumoningkeysuccgg = util::spawn_model("tag_origin", level.portalchungusspawn.origin);
    WAIT_SERVER_FRAME;
	PlayFXOnTag(level.portalloop, sumoningkeysuccgg, "tag_origin");
	sumoningkeysucc PlaySound("trial_completez");
	sumoningkeysucc Delete();
	level.goldroomsummkey MoveX(78.5, 2);
	wait(1.5);
	level.goldroomsummkey Delete();
	level notify("downstairsbromcompleted");
	level.bathroomfasttravelnum ++;
	level thread checkfasttravelnumber();
	level.goldtoiletfinish PlayLoopSound("wispportalloop");
	level waittill("bothbathroomscharged");
	level.goldtoiletfinish StopLoopSound(0.5);
	PlayFXOnTag(level.portalopen, sumoningkeysuccgg, "tag_origin");
	level.goldtoiletfinish PlayLoopSound("portalbathloop");
	level.goldroomportal = GetEnt("goldroomportalfasttravel", "targetname");
	while(1)
	{
		level endon("intermission");
		level.goldroomportal waittill("trigger", player);
		player thread teleportfasttravelee(level.chilisfasttp);
	}
}

function epicspin()
{
	level.masterpassfx = util::spawn_model("tag_origin", self.origin);
	WAIT_SERVER_FRAME;
	level.masterpassfx EnableLinkTo();
	level.masterpassfx LinkTo(self);
	PlayFXOnTag("zombie/fx_glow_smokeman_doa", level.masterpassfx, "tag_origin");
	level endon("startfasttravelee");
	self endon("death");
	while(1)
	{
		self RotateYaw(360, 2);
		wait(2);
	}
}

function teleportfasttravelee(structarray)
{	
		self SetElectrified( 1.0 );
		self setstance( "stand" );
		//wait(0.1);
        self playlocalsound( "kino_teleport_2d" );
        self DisableWeapons();
        self DisableOffhandWeapons();
        self freezecontrols( true );
        self SetOrigin( level.black_spots[self.characterIndex].origin ); 
        self SetPlayerAngles( level.black_spots[self.characterIndex].angles );
        thread PlayFxWithCleanup(KINO_SWIRL2, level.black_spots_targets[self.characterIndex].origin, 5);
        wait(2);
        self EnableWeapons(); 
        self EnableOffhandWeapons(); 
        self freezecontrols( false );
        self SetOrigin(structarray[self.characterIndex].origin);
        self SetPlayerAngles(structarray[self.characterIndex].angles);
        thread PlayFxWithCleanup(level.oildisappear, self.origin, 1);
        self StopLoopSound(1);
        wait(0.05); 
        self PlaySound("bathroomteleportin");
        self playlocalsound( "kino_beam_fx" );
        self setstance( "stand" );
        self.ignoreme = true;
        wait(1.5);
        self.ignoreme = false;
}

function zombie_death_check_downbath()
{
    if(self IsTouching(level.chungussoultrig))
        {
        fxModellockdoor = util::spawn_model("tag_origin", self.origin);
        WAIT_SERVER_FRAME;
        fxModellockdoor PlaySound("soulsuckzz");
        PlayFXOnTag(level.soulfx, fxModellockdoor, "tag_origin");
        fxModellockdoor MoveTo(level.goldroomsummkey.origin, 2);
        level.goldroombromsoulscount ++;
        level thread checkzombiecountsoulsboxz();
        wait 2;
        fxModellockdoor PlaySound("soulabsorb");
        fxModellockdoor Delete();
        level notify("lastsoulabsorbeddownstairbroom");
        }
    else
    {
        break;
    }
}

function spininfinite2()
{
	PlayFXOnTag(level.soulfx, self, "tag_origin");
	self PlayLoopSound("soulambloop");
	self MoveX(-78.5, 3);
	wait(3);
	level notify("soulupgoldroom");
	self PlaySound("oilappear");
	level endon("downstairsbromcompleted");
	self endon("death");
	while(1)
	{
		self RotateYaw(360, 2);
		wait(2);
	}
}
//end fast travel ee

function keycarddetect()
{
	level.fxmodelteleporterdoor hide();
	fxModellockdoor = util::spawn_model("tag_origin", level.teleporterdoorfx.origin);
	WAIT_SERVER_FRAME;
	PlayFXOnTag(level.teleporterdoorfxtest, fxModellockdoor, "tag_origin");
	while(1)
	{
	level.teleportdoortrigger waittill("trigger", player);
		if (level.questcomplete == 0)
		{
			//IPrintLnBold ("This area requires an employee keycard.");
			thread zm_subtitles::subtitle_display(undefined, 3, "^0The Weston Hotel", "This area requires an employee keycard.");
			PlaySoundAtPosition("aetherdoorfail", level.teleportdoortrigger.origin);
			//play sound error beep
			//play dialouge
			wait(3);
			continue;
		}
		else if(level.questcomplete == 1)
		{
			//IPrintLnBold ("You'll have to deliver that roomservice for access, friend.");
			thread zm_subtitles::subtitle_display(undefined, 3, "^0The Weston Hotel", "You'll have to deliver that roomservice for access, friend.");
			PlaySoundAtPosition("aetherdoorfail", level.teleportdoortrigger.origin);
			//play sound error beep
			//play dialouge
			wait(3);
			continue;
		}
		else if(level.questcomplete == 2)
		{
			//IPrintLnBold ("This area is now unlocked, welcome.");
			thread zm_subtitles::subtitle_display(undefined, 3, "^0The Weston Hotel", "This area is now unlocked, welcome.");
			PlaySoundAtPosition("aetherdoorunlock", level.teleportdoortrigger.origin);
			level notify("teleporterdoorunlocked");
			//play dialouge
			//play unlock sound
			//door clip delete
			//door fx model delete
			//play delete fx
			fxModellockdoor2 = util::spawn_model("tag_origin", level.teleporterdoorfx.origin);
			WAIT_SERVER_FRAME;
			PlayFXOnTag(level.leavedoorbarrierfx, fxModellockdoor2, "tag_origin");
			level.teleportdooorclip PlaySound("oilappear");
			level.teleportdooorclip Delete();
			level.fxmodelteleporterdoor Delete();
			fxModellockdoor Delete();
			fxModellockdoor2 Delete();
			level thread bartenderextrareward();
			level thread linkpadreveal();
			break;
		}
	}
}

function linkpadreveal()
{
 	//level.revealboxes = GetEntArray("revealbox","targetname");
	//level.revealboxesclip = GetEnt("boxdebrisclip","targetname");
	//level.revealboxestrigger = GetEnt("powerboxesgobyebye","targetname");
	level.flytarget = GetEnt("powerboxdebrisskytarget","targetname");
	
	level.revealboxestrigger waittill("trigger", player);
	wait(0.2);
	level.revealboxesclip Delete();
	level.revealboxestrigger PlaySound("lightningdoor");
	foreach(revealbox in level.revealboxes)
	{
		//revealboxtarget = GetEnt(revealbox.target, "targetname");
		thread PlayFxWithCleanup(level._effect["poltergeist"], revealbox.origin, 3.5);
		//revealbox MoveTo(level.flytarget.origin, 2);
		revealbox MoveZ(25, 1);
		revealbox MoveZ(800, 1);
	}
	wait(1);

	foreach(revealbox in level.revealboxes)
	{
		thread PlayFxWithCleanup(level._effect["poltergeist"], revealbox.origin, 3.5);
		revealbox Delete();
	} 
}

function speak_to_meemers( sound )
{
    players = Getplayers(); 
    foreach( player in players )
    {
        player StopLocalSound( "nsz_banana_song" );
        player PlayLocalSound( sound ); 
    }
}

function bartenderextrareward()
{
daqs = GetEntArray("daq","targetname");
level.bartenderdetectinteract TriggerEnable(true);
level.bartenderdetectinteracts SetHintString("Press ^2[{+activate}]^7 To Ask Lloyd What He Drinking");
level.bartenderdetectinteracts SetCursorHint("HINT_NOICON");
level.bartenderdetectinteracts waittill("trigger", player);
//PlaySoundAtPosition( "nowigottadrinkemall", level.bartenderdetectinteracts.origin );
level.bartenderdetectinteracts PlaySound("nowigottadrinkemall");
level.bartenderdetectinteracts SetHintString("");
thread zm_subtitles::subtitle_display(undefined, 2, "Lloyd", "This Gulag Peterson guy placed an order for a full case of Deadshot and didn't fucking pick em up. Now I gotta drink em all.");
//use the get playback time and a wait function, maybe an array of subtiles in a for loop?
level.bartenderdetectinteracts SetCursorHint("HINT_NOICON");
wait(8);
//PlaySoundAtPosition( "theyfuckingsuck", level.bartenderdetectinteracts.origin );
level.bartenderdetectinteracts PlaySound("theyfuckingsuck");
//level.bartenderdetectinteracts SetHintString("You Really Want One? They Fucking Suck");
thread zm_subtitles::subtitle_display(undefined, 2, "Lloyd", "You telling me you actually want one? They fucking suck.");
wait(5);
level.bartenderdetectinteracts SetCursorHint("HINT_NOICON");
level.bartenderdetectinteracts PlaySound("enjoyitkitten");
level.bartenderdetectinteracts SetHintString("Press ^2[{+activate}]^7 To Claim");
//level.bartenderdetectinteracts SetHintStringForPerk("specialty_deadshot", "You already have the perk ^1BAKA");
thread zm_subtitles::subtitle_display(undefined, 2, "Lloyd", "You go ahead and enjoy that kitten.");
level.bartenderdetectinteracts SetCursorHint("HINT_NOICON");
level notify("daqsdrinken");
int = 0;
while(daqs.size > 0)
{
	level.bartenderdetectinteracts waittill("trigger", player);
	if(!player HasPerk("specialty_deadshot"))
	{
		daqs[int] Delete();
  		player thread drinkdaqbrynjar();
  		int ++;
	}
	else
	{
		level.bartenderdetectinteracts thread changehintstringplayer(player);
	}
	WAIT_SERVER_FRAME;
}
//level.bartenderdetectinteracts SetHintString("Looks like you drank em all, haha, wasn't expecting that");
level.bartenderdetectinteracts SetHintString("");
thread zm_subtitles::subtitle_display(undefined, 2, "Lloyd", "Looks like you drank em all, haha, wasn't expecting that");
level.bartenderdetectinteracts SetCursorHint("HINT_NOICON");
}

function changehintstringplayer(player)
{
	self SetHintStringForPlayer(player, "You already have the perk ^1BAKA");
	wait(1);
	self SetHintStringForPlayer(player, "Press ^2[{+activate}]^7 To Claim");

}

function drinkdaqbrynjar()
{
  //self clientfield::set_to_player( "deadshot_perk", 1);
  self zm_perks::vending_trigger_post_think( self, "specialty_deadshot" );
  self zm_perks::give_perk( "specialty_deadshot", true );
}

function randomchatter()
{
	level waittill("daqsdrinken");//game waits till all perks have been drank
	while(true)//
	{
		level endon("intermission");
		wait(42);
		level.bartenderdetect waittill("trigger", player);
		wait(6);
		level.randomchatterchance = RandomInt(4);
		if(level.randomchatterchance == 2)
		{
			level.llyodchatterselect = RandomInt(5);
			wait(1);
			level.bartenderdetectinteracts PlaySound("lloydchatter_"+level.llyodchatterselect);
			wait(20);
			continue;
		}
		else
		{
			wait(1);
			continue;
		}
	}
}

