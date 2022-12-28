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


#using scripts\shared\lui_shared;
#precache("fx", "dlc2/zmb_weapon/fx_skull_quest_ritual_doorbarrier_island");
#precache( "fx", "dlc1/castle/fx_elec_teleport_flash_sm" );
#precache( "vehicle", "veh_default_zipline");
#precache( "fx", "redspace/fx_launchpad_blue" );
#precache( "fx", "redspace/fx_launchpad_red" );
#precache("fx", "_mikeyray/perks/phd/fx_perk_phd"); 
#precache("fx", "destruct/fx_dest_paper");
#precache("fx", "dlc1/castle/fx_mech_dmg_sparks");
#precache("fx", "dlc3/stalingrad/fx_steam_door"); 
#precache("fx", "dlc5/cosmo/fx_light_red_vista_sm");
#precache("fx", "dlc5/temple/fx_ztem_meteor_shrink");
#precache("fx", "dlc3/stalingrad/fx_voice_log_blue");
#precache("fx", "zombie/fx_ee_apothigod_beam_success_zod_zmb");
#precache("fx", "dlc1/castle/fx_elec_exp_blue");
#precache( "fx", "dlc1/castle/fx_elec_teleport_flash_sm" );

#precache( "material", "eral" );
#precache( "material", "pigman_jumpscare" );
#precache( "material", "rhettscare" );
#precache( "material", "stuffmanscare" );
#precache( "material", "number2oil" ); 
#precache( "material", "amongscare" );
#precache( "material", "susscare" );
#precache( "material", "trollscare" );
#precache( "material", "zuck153jumpscare" );

#precache("model", "bigmacee_1");
#precache("model", "bigmacee_2c");
#precache("model", "bigmacee_3c");
#precache("model", "bigmacee_4c");
#precache("model", "bigmacee_5c");
#precache("model", "bigmacee_6");
#precache("model", "bigmacee_7");
#precache("model", "bigmacee_8");
#precache("model", "bigmacee_9");
#precache("model", "bigmacee_10");
#precache("model", "p7_3arc_lobby_picture_29x41_2");
#precache("model", "p7_bezoz_photo_ee");
#precache("model", "p7_elon_photo_ee");
#precache("model", "p7_tiktok_photo_ee");
#precache("model", "p7_rdj_photo_ee");
#precache("model", "p7_19dolla_photo_ee");
#define KINO_SWIRL2                                  "dlc5/tomb/fx_teleport_1p"
#precache( "fx", KINO_SWIRL2 );

function autoexec setup()
{
	level.keycarddisappear = "dlc1/castle/fx_elec_teleport_flash_sm";
	level.modelarray = array("bigmacee_6", "bigmacee_1", "bigmacee_7", "bigmacee_2c", "bigmacee_10", "bigmacee_3c", "bigmacee_8", "bigmacee_4c", "bigmacee_9", "bigmacee_5c");
	level.soundarray = array( "twkyata", "twkymcdonalds", "twkyin", "twkyeasternpenn", "twkyin1999", "twkywilliamsmith", "twkydiscovereda", "twkycondom", "twkywhileeatinghis", "twkybigmac" );
	level.soundtimearray = array( 0.2, 0.717, 0.2, 1.474, 1.530, 1.146, 0.523, 0.711, 0.807, 0.929 );
	//bigmac trigs
	level.bigmactrig0 = GetEnt("bigmactrig0", "targetname");
	level.bigmactrig1 = GetEnt("bigmactrig1", "targetname");
	level.bigmactrig2 = GetEnt("bigmactrig2", "targetname");
	level.bigmactrig3 = GetEnt("bigmactrig3", "targetname");
	level.bigmactrig4 = GetEnt("bigmactrig4", "targetname");
	level.bigmactrig5 = GetEnt("bigmactrig5", "targetname");
	level.bigmactrig6 = GetEnt("bigmactrig6", "targetname");
	level.bigmactrig7 = GetEnt("bigmactrig7", "targetname");
	level.bigmactrig8 = GetEnt("bigmactrig8", "targetname");
	level.bigmactrig9 = GetEnt("bigmactrig9", "targetname");
	level.bigmactrigs = array(level.bigmactrig0, level.bigmactrig1, level.bigmactrig2, level.bigmactrig3, level.bigmactrig4, level.bigmactrig5, level.bigmactrig6, level.bigmactrig7, level.bigmactrig8, level.bigmactrig9);
	//end bigmac trigs
	level.verificationbutton = GetEnt("activatebigmacee", "targetname");

	level.verificationbutton TriggerEnable(false);
	foreach(trig in level.bigmactrigs)
	{
		trig TriggerEnable(false);
	}

	level waittill("pantrydoorisnowdown");

	level.verificationbutton TriggerEnable(true);
	foreach(trig in level.bigmactrigs)
	{
		trig TriggerEnable(true);
	}

	level thread restart();
}

function restart()
{
	/*/thread triggers
	level.bigmactrig0 thread buildsentence();
	level.bigmactrig1 thread buildsentence();
	level.bigmactrig2 thread buildsentence();
	level.bigmactrig3 thread buildsentence();
	level.bigmactrig4 thread buildsentence();
	level.bigmactrig5 thread buildsentence();
	level.bigmactrig6 thread buildsentence();
	level.bigmactrig7 thread buildsentence();
	level.bigmactrig8 thread buildsentence();
	level.bigmactrig9 thread buildsentence();
	/*/

	foreach(trig in level.bigmactrigs)
	{
		trig thread buildsentence();
	}
	
	//thread activation button
	level.verificationbutton thread playsentence();
}

function buildsentence()
{
	level endon("bigmacsequencestarted");
	self UseTriggerRequireLookAt();
	//self SetHintString("Press ^2[{+activate}]^8 To Cycle Frame " + self.bigmacorder);
	self SetCursorHint("HINT_NOICON");
	part = GetEnt(self.target, "targetname");
	int = RandomInt(level.bigmactrigs.size);
	self.script_int = int;
	part SetModel(level.modelarray[int]);
	PlayFX(level.keycarddisappear, part.origin);
	while(1)
	{
		level endon("bigmacsequencestarted");
		self waittill("trigger", player);
		PlayFX(level.keycarddisappear, part.origin);
		self PlaySound("shortbeep");
		int ++;
		if(int > level.bigmactrigs.size - 1)
		{
			int = 0;
		}
		//IPrintLnBold (int + " " + self.bigmac_order);
		self.script_int = int;
		part SetModel(level.modelarray[int]);
		wait 0.25;
	}

	//script int must equal order int to count
}


function playsentence()
{
	//correctordercounter = 0;
	self SetHintString("Press [{+activate}] to confirm word order.");
	self SetCursorHint("HINT_NOICON");
	self UseTriggerRequireLookAt();
	self waittill("trigger", player);
	level notify("bigmacsequencestarted");
	wait 0.05;
	self SetHintString("Now playing entered order.");

	for(i = 0; i < level.bigmactrigs.size; i++)
	{
		self PlaySound(level.soundarray[level.bigmactrigs[i].script_int]);
		//IPrintLnBold(level.bigmactrigs[i].script_int);
		//IPrintLnBold(level.bigmactrigs[i].bigmacorder);
		wait(level.soundtimearray[level.bigmactrigs[i].script_int]);
	}
	
	if(level.bigmactrig0.script_int == 0 && level.bigmactrig1.script_int == 1 && level.bigmactrig2.script_int == 2 && level.bigmactrig3.script_int == 3 && level.bigmactrig4.script_int == 4 && level.bigmactrig5.script_int == 5 && level.bigmactrig6.script_int == 6 && level.bigmactrig7.script_int == 7 && level.bigmactrig8.script_int == 8 && level.bigmactrig9.script_int == 9)
	{
		self SetHintString("That was the correct order!");
		IPrintLnBold ("that was the correct order!");
		level thread temp();
		//level thread restart();
		level notify("condomssussedagreare");
		//door unlock or reward func
	}
	else
	{
		IPrintLnBold ("that was the incorrect order!");
		self SetHintString("That order was incorrect.");
		//wait here for cooldown
		wait 1;
		level thread restart();
	}


}

function temp()
{
	foreach(player in GetPlayers())
	{
		player thread jermasus();
	}
}

function jermasus()
{
	jumpscare_overlay = NewClientHudElem( self ); 
	jumpscare_overlay.alignX = "center";
	jumpscare_overlay.alignY = "center";
	jumpscare_overlay.horzAlign = "center";
	jumpscare_overlay.vertAlign = "center";
	jumpscare_overlay SetShader( "susscare", 480, 480 ); 
	jumpscare_overlay.alpha = 1; 
	self PlayLocalSound("easwarning"); 
	jumpscare_overlay FadeOverTime( 9 ); 
	jumpscare_overlay.alpha = 0; 
	wait(8); 
	jumpscare_overlay destroy();
}