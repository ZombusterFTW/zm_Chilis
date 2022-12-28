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

#precache("model", "partyhat");
#precache("model", "p7_bezoz_photo_ee");
#precache("model", "p7_elon_photo_ee");
#precache("model", "p7_tiktok_photo_ee");
#precache("model", "p7_rdj_photo_ee");
#precache("model", "p7_19dolla_photo_ee");
#define KINO_SWIRL2                                  "dlc5/tomb/fx_teleport_1p"
#precache( "fx", KINO_SWIRL2 );

function autoexec setup()
{
	//set this value to zero to void print out
	level.amongustiledebug = 0;
	level flag::init("gameactivate", false);
	level.gameactivate = GetEnt("activateamongusgame","targetname");
	level.amongustiles = GetEntArray("amongustile", "targetname");
	level.gameactivate SetHintString( &"ZOMBIE_NEED_POWER" );
	level.gameactivate SetCursorHint("HINT_NOICON");
	level flag::wait_till( "power_on" ); 
	level.gameactivate SetHintString( "Press ^2[{+activate}]^7 to start." );
	level thread restart();
}

function numberlistgenerate()
{
	numtiles = array(0, 1, 2, 3, 4, 5, 6, 7, 8);
	level.numtilesshuff = array::randomize(numtiles);
	level.numtilesnum = 0;
	//level.numtilesshuff[0];	
	//level.numtilesshuff[1];
	//level.numtilesshuff[2];
	//level.numtilesshuff[3];
	//level.numtilesshuff[4];
	//level.numtilesshuff[5];
	//level.numtilesshuff[6];
	//level.numtilesshuff[7];
	//level.numtilesshuff[8];
}

function restart()
{
	level notify("resetamongustiles");
	wait 1;
	level.gameactivate SetHintString( "Press ^2[{+activate}]^7 to start." );
	level thread numberlistgenerate();
	level thread wait_for_activation();
	level thread cycletiles();
}

function cycletiles()
{
	level flag::clear("gameactivate");
	while(1)
	{
		level endon("amongustilesstart");
		for(i = 0; i < 9; i++)
		{
			num = level.numtilesshuff[i];
			debugprint("Iteration: " + i + " Generated num: "+ num);
			ent = GetEnt(level.amongustiles[num].target, "targetname");
			ent RotateYaw(180, 0.1);
			playBeepSound(level.amongustiles[num]);
			wait(1.0);
			ent RotateYaw(-180, 0.1);
			if(level flag::get("gameactivate"))
			{
				level notify("amongustilesstart");
				break;
			}
			else
			{
				wait .5;
				continue;
			}
		}
		
	}
}

function presentOrder(num)
{
	wait(.5);
	ent = GetEnt(level.amongustiles[num].target, "targetname");
	ent RotateYaw(180, 0.1);
	playBeepSound(level.amongustiles[num]);
	wait(1.0);
	ent RotateYaw(-180, 0.1);
	level notify("amongusorderpresented");
}

function stayFlipped(num)
{
	ent = GetEnt(level.amongustiles[num].target, "targetname");
	ent2 = GetEnt(level.amongustiles[num], "targetname");
	ent2 TriggerEnable(0);
	ent RotateYaw(180, 0.1);
	playBeepSound(level.amongustiles[num]);
	level waittill("resetamongustiles");
	ent RotateYaw(-180, 0.1);
	level notify("amongustilessuccessreset");
	ent2 TriggerEnable(1);
}

function playBeepSound(amongustileent)
{
	//play that sweet beep sound cheating payphones since 1998!
	newint = amongustileent.script_int;
	switch(newint)
	{
		case 0:
			amongustileent PlaySound("DTMF-1");
			break;
		case 1:
			amongustileent PlaySound("DTMF-2");
			break;
		case 2:
			amongustileent PlaySound("DTMF-3");
			break;
		case 3:
			amongustileent PlaySound("DTMF-4");
			break;
		case 4:
			amongustileent PlaySound("DTMF-5");
			break;
		case 5:
			amongustileent PlaySound("DTMF-6");
			break;
		case 6:
			amongustileent PlaySound("DTMF-7");
			break;
		case 7:
			amongustileent PlaySound("DTMF-8");
			break;
		case 8:
			amongustileent PlaySound("DTMF-9");
			break;
	}
}

function wait_for_activation()
{
	level.gameactivate waittill("trigger", player);
	level.gameactivate PlaySound("shortbeep");
	level flag::set("gameactivate");
	level waittill("amongustilesstart");
	wait(.5);
	level thread starttilegame();
	level.gameactivate SetHintString( "Game has started. Shoot tiles in the order presented." );
}

function waitforshot(num)
{
	level.numtilesnum = num;
	foreach(tile in level.amongustiles)
	{
		tile thread playershootdetect();
	}
}

function reenabletiles()
{
	foreach(tile in level.amongustiles)
	{
		tile TriggerEnable(1);
	}
}

function playershootdetect()
{
	level endon("amongusstagecompleted");
	level endon("amongustilefail");
	self waittill("trigger", player);
	if(self.script_int == level.numtilesnum)
	{
		
		level thread stayFlipped(level.numtilesnum);
		self TriggerEnable(0);
		level notify("amongusstagecompleted");
	}
	else
	{
		level.gameactivate PlaySound("defaultfail");
		level thread restart();
		level notify("amongustilefail");
	}
}


function starttilegame()
{
	level endon("amongustilefail");
	level thread numberlistgenerate();
	for(i = 0; i < 9; i++)
		{
			level thread reenabletiles();
			switch(i)
				{
					case 0:
					{
						num = level.numtilesshuff[i];
						debugprint("Iteration: " + i + " Generated num: "+ num);
						level thread presentOrder(num);
						level waittill("amongusorderpresented");
						wait .1;
						debugprint("order presented");
						level thread waitforshot(num);
						level waittill("amongusstagecompleted");
						wait 1;
						debugprint("correct tile shot");
						debugprint("Completed stage 1");
						level notify("resetamongustiles");
						continue;
					}
						
					case 1:
					{
						//order builds each turn as user is prompted to enter more and more
						num1 = level.numtilesshuff[0];
						num2 = level.numtilesshuff[i];
						wait(1.5);
						level thread presentOrder(num1);
						level waittill("amongusorderpresented");
						level thread presentOrder(num2);
						level waittill("amongusorderpresented");
						debugprint("order presented");
						wait .1;
						level thread waitforshot(num1);
						level waittill("amongusstagecompleted");
						level thread waitforshot(num2);
						level waittill("amongusstagecompleted");
						wait 1;
						debugprint("Completed stage 2");
						level notify("resetamongustiles");
						continue;
					}
					case 2:
					{
						num1 = level.numtilesshuff[0];
						num2 = level.numtilesshuff[1];
						num3 = level.numtilesshuff[i];
						level thread presentOrder(num1);
						level waittill("amongusorderpresented");
						level thread presentOrder(num2);
						level waittill("amongusorderpresented");
						level thread presentOrder(num3);
						level waittill("amongusorderpresented");
						debugprint("order presented");
						wait .1;
						level thread waitforshot(num1);
						level waittill("amongusstagecompleted");
						level thread waitforshot(num2);
						level waittill("amongusstagecompleted");
						level thread waitforshot(num3);
						level waittill("amongusstagecompleted");
						wait 1;
						debugprint("Completed stage 3");
						level notify("resetamongustiles");
						continue;
					}
					case 3:
					{
						num1 = level.numtilesshuff[0];
						num2 = level.numtilesshuff[1];
						num3 = level.numtilesshuff[2];
						num4 = level.numtilesshuff[i];
						level thread presentOrder(num1);
						level waittill("amongusorderpresented");
						level thread presentOrder(num2);
						level waittill("amongusorderpresented");
						level thread presentOrder(num3);
						level waittill("amongusorderpresented");
						level thread presentOrder(num4);
						level waittill("amongusorderpresented");
						debugprint("order presented");
						wait .1;
						level thread waitforshot(num1);
						level waittill("amongusstagecompleted");
						level thread waitforshot(num2);
						level waittill("amongusstagecompleted");
						level thread waitforshot(num3);
						level waittill("amongusstagecompleted");
						level thread waitforshot(num4);
						level waittill("amongusstagecompleted");
						wait 1;
						debugprint("Completed stage 4");
						level notify("resetamongustiles");
						continue;
					}
					case 4:
					{
						num1 = level.numtilesshuff[0];
						num2 = level.numtilesshuff[1];
						num3 = level.numtilesshuff[2];
						num4 = level.numtilesshuff[3];
						num5 = level.numtilesshuff[i];
						level thread presentOrder(num1);
						level waittill("amongusorderpresented");
						level thread presentOrder(num2);
						level waittill("amongusorderpresented");
						level thread presentOrder(num3);
						level waittill("amongusorderpresented");
						level thread presentOrder(num4);
						level waittill("amongusorderpresented");
						level thread presentOrder(num5);
						level waittill("amongusorderpresented");
						debugprint("order presented");
						wait .1;
						level thread waitforshot(num1);
						level waittill("amongusstagecompleted");
						level thread waitforshot(num2);
						level waittill("amongusstagecompleted");
						level thread waitforshot(num3);
						level waittill("amongusstagecompleted");
						level thread waitforshot(num4);
						level waittill("amongusstagecompleted");
						level thread waitforshot(num5);
						level waittill("amongusstagecompleted");
						wait 1;
						debugprint("Completed stage 5");
						level notify("resetamongustiles");
						continue;
					}
					case 5:
					{
						num1 = level.numtilesshuff[0];
						num2 = level.numtilesshuff[1];
						num3 = level.numtilesshuff[2];
						num4 = level.numtilesshuff[3];
						num5 = level.numtilesshuff[4];
						num6 = level.numtilesshuff[i];
						level thread presentOrder(num1);
						level waittill("amongusorderpresented");
						level thread presentOrder(num2);
						level waittill("amongusorderpresented");
						level thread presentOrder(num3);
						level waittill("amongusorderpresented");
						level thread presentOrder(num4);
						level waittill("amongusorderpresented");
						level thread presentOrder(num5);
						level waittill("amongusorderpresented");
						level thread presentOrder(num6);
						level waittill("amongusorderpresented");
						debugprint("order presented");
						wait .1;
						level thread waitforshot(num1);
						level waittill("amongusstagecompleted");
						level thread waitforshot(num2);
						level waittill("amongusstagecompleted");
						level thread waitforshot(num3);
						level waittill("amongusstagecompleted");
						level thread waitforshot(num4);
						level waittill("amongusstagecompleted");
						level thread waitforshot(num5);
						level waittill("amongusstagecompleted");
						level thread waitforshot(num6);
						level waittill("amongusstagecompleted");
						debugprint("Completed stage 6");
						wait 1;
						level notify("resetamongustiles");
						continue;
					}
					case 6:
					{
						num1 = level.numtilesshuff[0];
						num2 = level.numtilesshuff[1];
						num3 = level.numtilesshuff[2];
						num4 = level.numtilesshuff[3];
						num5 = level.numtilesshuff[4];
						num6 = level.numtilesshuff[5];
						num7 = level.numtilesshuff[i];
						level thread presentOrder(num1);
						level waittill("amongusorderpresented");
						level thread presentOrder(num2);
						level waittill("amongusorderpresented");
						level thread presentOrder(num3);
						level waittill("amongusorderpresented");
						level thread presentOrder(num4);
						level waittill("amongusorderpresented");
						level thread presentOrder(num5);
						level waittill("amongusorderpresented");
						level thread presentOrder(num6);
						level waittill("amongusorderpresented");
						level thread presentOrder(num7);
						level waittill("amongusorderpresented");
						debugprint("order presented");
						wait .1;
						level thread waitforshot(num1);
						level waittill("amongusstagecompleted");
						level thread waitforshot(num2);
						level waittill("amongusstagecompleted");
						level thread waitforshot(num3);
						level waittill("amongusstagecompleted");
						level thread waitforshot(num4);
						level waittill("amongusstagecompleted");
						level thread waitforshot(num5);
						level waittill("amongusstagecompleted");
						level thread waitforshot(num6);
						level waittill("amongusstagecompleted");
						level thread waitforshot(num7);
						level waittill("amongusstagecompleted");
						wait 1;
						debugprint("Completed stage 7");
						level notify("resetamongustiles");
						continue;
					}
					case 7:
					{
						num1 = level.numtilesshuff[0];
						num2 = level.numtilesshuff[1];
						num3 = level.numtilesshuff[2];
						num4 = level.numtilesshuff[3];
						num5 = level.numtilesshuff[4];
						num6 = level.numtilesshuff[5];
						num7 = level.numtilesshuff[6];
						num8 = level.numtilesshuff[i];
						level thread presentOrder(num1);
						level waittill("amongusorderpresented");
						level thread presentOrder(num2);
						level waittill("amongusorderpresented");
						level thread presentOrder(num3);
						level waittill("amongusorderpresented");
						level thread presentOrder(num4);
						level waittill("amongusorderpresented");
						level thread presentOrder(num5);
						level waittill("amongusorderpresented");
						level thread presentOrder(num6);
						level waittill("amongusorderpresented");
						level thread presentOrder(num7);
						level waittill("amongusorderpresented");
						level thread presentOrder(num8);
						level waittill("amongusorderpresented");
						debugprint("order presented");
						wait .1;
						level thread waitforshot(num1);
						level waittill("amongusstagecompleted");
						level thread waitforshot(num2);
						level waittill("amongusstagecompleted");
						level thread waitforshot(num3);
						level waittill("amongusstagecompleted");
						level thread waitforshot(num4);
						level waittill("amongusstagecompleted");
						level thread waitforshot(num5);
						level waittill("amongusstagecompleted");
						level thread waitforshot(num6);
						level waittill("amongusstagecompleted");
						level thread waitforshot(num7);
						level waittill("amongusstagecompleted");
						level thread waitforshot(num8);
						level waittill("amongusstagecompleted");
						wait 1;
						debugprint("Completed stage 8");
						level notify("resetamongustiles");
						continue;
					}
					case 8:
					{
						num1 = level.numtilesshuff[0];
						num2 = level.numtilesshuff[1];
						num3 = level.numtilesshuff[2];
						num4 = level.numtilesshuff[3];
						num5 = level.numtilesshuff[4];
						num6 = level.numtilesshuff[5];
						num7 = level.numtilesshuff[6];
						num8 = level.numtilesshuff[7];
						num9 = level.numtilesshuff[i];
						level thread presentOrder(num1);
						level waittill("amongusorderpresented");
						level thread presentOrder(num2);
						level waittill("amongusorderpresented");
						level thread presentOrder(num3);
						level waittill("amongusorderpresented");
						level thread presentOrder(num4);
						level waittill("amongusorderpresented");
						level thread presentOrder(num5);
						level waittill("amongusorderpresented");
						level thread presentOrder(num6);
						level waittill("amongusorderpresented");
						level thread presentOrder(num7);
						level waittill("amongusorderpresented");
						level thread presentOrder(num8);
						level waittill("amongusorderpresented");
						level thread presentOrder(num9);
						level waittill("amongusorderpresented");
						debugprint("order presented");
						wait .1;
						level thread waitforshot(num1);
						level waittill("amongusstagecompleted");
						level thread waitforshot(num2);
						level waittill("amongusstagecompleted");
						level thread waitforshot(num3);
						level waittill("amongusstagecompleted");
						level thread waitforshot(num4);
						level waittill("amongusstagecompleted");
						level thread waitforshot(num5);
						level waittill("amongusstagecompleted");
						level thread waitforshot(num6);
						level waittill("amongusstagecompleted");
						level thread waitforshot(num7);
						level waittill("amongusstagecompleted");
						level thread waitforshot(num8);
						level waittill("amongusstagecompleted");
						level thread waitforshot(num9);
						level waittill("amongusstagecompleted");
						wait 1;
						debugprint("Completed game!");
						level notify("resetamongustiles");
						wait 1;
						break;
					}

		}
			level thread restart();
			level thread temp();
		
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
	self PlayLocalSound("vineboom"); 
	wait(0.1); 
	self StopLocalSound("vineboom");
	jumpscare_overlay FadeOverTime( 0.15 ); 
	jumpscare_overlay.alpha = 0; 
	wait( .1 ); 
	jumpscare_overlay destroy();
}

function debugprint(string)
{
	if(level.amongustiledebug == 1)
	{
		IPrintLnBold(string);
	}
	else
	{
		break;
	}
}