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
//#using scripts\zm\_zm_settings_menu;

function autoexec init()
{
	
	//audio logs become available from the terminal pc after the player completes the roomservice delivery ee. Audiologs can be skipped and they can be scripted to replace previous ones in EE moments.
	//first audio log is about the hotel and the questions the striketeam leader has about the unknown character. "A 1920s hotel, a talking burger, and a god entity? we need to talk. Come back to the terminal PC inside of chilis."
	level waittill("cutsceneover");
	pcaurafxspot = GetEnt("pcreadyfxterminal", "targetname");
	pcaurafxspot3 = util::spawn_model("tag_origin", pcaurafxspot.origin);
	//level.computeritem = GetEnt("computerterminalinteract", "targetname");
	uplinktrig = GetEnt("pcuplinkterminalint", "targetname");
	computerobjmark = objPoints::create("computerobjmark", uplinktrig.origin, "all", "newobjmarker", 0.8);
    computerobjmark SetWayPoint(0, "newobjmarker", 0);
    level.computeritem vibrate((0,-100,0), 0.3, 0.4, 3);
	uplinktrig PlaySound("striketeamdetect");
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