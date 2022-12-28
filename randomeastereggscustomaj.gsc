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
#using scripts\shared\lui_shared;
#using scripts\Sphynx\_zm_subtitles;

#using scripts\zm\zm_chilis;
//#using scripts\zm\zm_chilis.csc;
#using scripts\_NSZ\roomserviceeasteregg;
#using scripts\_NSZ\phoneeasteregg;
#using scripts\_redspace\rs_o_jump_pad;
#using scripts\zm\_zm_perks;
#using scripts\shared\flagsys_shared;
#using scripts\zm\_zm_unitrigger;
//#using scripts\zm\_zm_ai_mechz;

#precache( "fx", "dlc1/castle/fx_infused_115_broken_canister" );
#precache( "fx", "dlc4/genesis/fx_rune_glow_purple" ); 
#precache( "fx", "zombie/fx_raygun_geotrail_purple_doa" ); 
#precache( "fx", "zombie/fx_sword_quest_ground_fire_purple_zod_zmb" );
#precache( "fx", "zombie/fx_ritual_gatestone_portal_zod_zmb" );
#precache( "fx", "harry/mpd/fx_mpd_tube_glow" );
#precache( "fx", "dlc1/castle/fx_demon_gate_rune_glow_loop_world" );
#precache( "fx", "zombie/fx_exp_rpg_red_doa" );
#precache( "fx", "dlc4/genesis/fx_corrupteng_pillar_ember_top_red" );
#precache( "fx", "dlc4/genesis/fx_summon_circle_rune_glow" );
#precache( "fx", "dlc1/castle/fx_glow_115_fuse_burst_castle" );
#precache( "fx", "dlc1/castle/fx_demon_gate_rune_glow_loop_world_fast" ); 
#precache( "fx", "dlc1/castle/fx_light_candle_flicker_castle" );
#precache( "fx", "fire/fx_fire_candle_flame_med" );
#precache( "fx", "dlc5/temple/fx_fire_torch_pitch_sm" ); 
#precache( "fx", "explosions/fx_exp_grenade_spark_bounce" );
#precache( "fx", "dlc5/tomb/fx_115_generator_progression_red_light" );
#precache( "fx", "dlc1/castle/fx_ritual_key_soul_tgt_igc" ); 
#precache( "fx", "fire/fx_fire_candle_ritual_zod_zmb" );
#precache( "fx", "zombie/fx_spawn_blood_rise_doa" );
#precache( "fx", "zombie/fx_powerup_on_red_zmb" );
#precache( "fx", "zombie/fx_powerup_on_green_zmb" );
#precache( "fx", "zombie/fx_powerup_grab_red_zmb" );
#precache( "fx", "fx,dlc3/stalingrad/fx_dragonstrike_portal_flash" );

#precache( "model", "p7_photo_frame_budder" );
#precache( "model", "p7_photo_frame_budder2" );
#precache( "model", "p7_photo_frame_budder3" );
#precache( "model", "p7_photo_frame_budder4" );
#precache( "model", "p7_photo_frame_budder5" );
#precache( "model", "p7_photo_frame_budder6" );
#precache( "model", "p7_photo_frame_budder7" );
#precache( "model", "p7_photo_frame_budder8" );
#precache( "model", "p7_photo_frame_budder9" );
#precache( "model", "p7_photo_frame_budder10" );
#precache( "model", "p7_thismanframe" );
#precache( "model", "chungus" );
#precache( "model", "p7_thismanframe2" );
#precache( "material", "elisusscare" );
#precache( "model", "popcatchilisgold" );
#precache( "model", "popcatchilis" );
#precache( "model", "aml_fish_market_02" );
#precache( "model", "zombietron_gold_bricks" );
#precache( "model", "p7_ihop_bag" );
#precache( "model", "p7_zm_zod_magicians_drink_bottle" );
#precache( "model", "p7_squidgamesmile" );
#precache( "model", "loonamodelbigtest" );
#precache( "model", "aml_gen_raven_flying_01_low_fb_cin" ); 
#precache( "model", "p7_cai_igc_monitor_flat_bautista" );
#precache( "fx", "dlc1/castle/fx_elec_teleport_flash_sm" );
#precache( "fx", "dlc2/island/fx_plyr_spores_good_trail");
#precache( "fx", "dlc5/moon/fx_meteorite_debris_impact");
#precache( "fx", "dlc5/moon/fx_moon_qbomb_explo_distort");
#precache( "fx", "dlc1/castle/fx_wolf_quest_platform_glow_loop");
#precache( "fx", "dlc1/castle/fx_wisp_tendril_loop");
#precache( "fx", "zombie/fx_powerup_on_solo_zmb" );
#precache( "fx", "dlc2/island/fx_aa_plane_trail" );
#precache( "fx", "zombie/fx_meatball_trail_sky_zod_zmb" );

#precache( "model", "p7_bautista" );
#precache( "model", "p7_bautistaback" );






function autoexec initfunc()
{
	//bool for if nobody won
	level waittill("initial_blackscreen_passed");
	level.playerhastheelement153 = false;
	level._effect["powerup_on"] = "zombie/fx_powerup_on_green_zmb";
	level.iscustomsoundsystemplaying = false;
	level.customsoundstackcount = 0;
	level.noplayerswonsg = false;
	level.shotcounter = 0;
	level.seating153trigcenter = GetEntArray("seating153trig", "targetname");
	level.seating153trigactivationfx = "dlc1/castle/fx_infused_115_broken_canister";
	level.purplestuffx = "dlc4/genesis/fx_rune_glow_purple"; 
	level.smallpurplestuffx = "zombie/fx_raygun_geotrail_purple_doa"; 
	level.smallpurplestuffxnew = "harry/mpd/fx_mpd_tube_glow";
	level.portal153event = "zombie/fx_ritual_gatestone_portal_zod_zmb";
	//start budder ee
	level.normalframemodels = array("p7_photo_frame_budder", "p7_photo_frame_budder2", "p7_photo_frame_budder3", "p7_photo_frame_budder4", "p7_photo_frame_budder5");
	level.impostorframemodels = array("p7_photo_frame_budder6", "p7_photo_frame_budder7", "p7_photo_frame_budder8", "p7_photo_frame_budder9", "p7_photo_frame_budder10");
	level.budderphototrigs = GetEntArray("budderphototrig", "targetname");
	level.budderphotoeehint = GetEntArray("buddereehint", "targetname");
	level.phonehiddennumbers = GetEntArray("phoneints", "targetname");
	level.chungussecret = GetEnt("brchungusscare", "targetname");
	level.failsquidgamespots = struct::get_array("squidgamedeathspots","targetname");
	level.chungussecret Hide();
	level.chungussecret MoveZ(-200, 0.05);
	foreach(model in level.phonehiddennumbers)
	{
		model Hide();
	}
	//level waittill("initial_blackscreen_passed");
	//end budder ee
	level thread startparedoliaee();
	level thread startbuddereasteregg();
	level thread start153shiningee();
	level thread opendoor153();
	level thread cakeeasteregg153();
	level thread squidgamecards();
	level thread setupsquidgameee(0);
	level thread typewriterjackee();
	//level thread chilisstoryradios();
	level waittill("unhideallnumssquidgame");
	level thread hidephonenumbers();

}


function autoexec chilisstoryradios()
{
	radioarray = GetEntArray("chilisstoryradio", "targetname");
	//level waittill("initial_blackscreen_passed");
	foreach(radio in radioarray)
	{
		radio thread radiologic();
	}
}

function radiologic()
{
	self SetHintString("");
	self SetCursorHint("HINT_NOICON");
	self waittill("trigger", player);
	self PlaySound("staticradiostart");
	wait(.35);
	self PlaySound(self.script_sound);
	wait(SoundGetPlaybackTime(self.script_sound)/1000);
	self Delete();
}

function typewriterjackee()
{
	//level waittill("initial_blackscreen_passed");
	jackvasesrewardspot = struct::get("jackvasesrewardspot","targetname");
	poweruppool = array("full_ammo", "nuke", "carpenter", "double_points", "minigun");
	trig = GetEnt("typewritertrig", "targetname");
	vasearray = GetEntArray("jackvases", "targetname");
	iteration = 0;
	//trig UseTriggerRequireLookAt();
	trig SetHintString("");
	trig SetCursorHint("HINT_NOICON");
	fxModel = util::spawn_model("tag_origin", trig.origin);
	specialrewarditcount = 9;
	e_bool = false;
	firstrew = 0;
	//level waittill("initial_blackscreen_passed");
	while(1)
	{
		trigamount = RandomIntRange(4, 7);
		for(i = 0; i < trigamount; i++)
		{
			trig waittill("trigger", player);
			//IPrintLnBold("trigger");
			trig PlaySound("typewriterpress");
			wait(0.25);
		}
		fxModel Delete();
		choices = 4 + iteration;
		if(choices >= specialrewarditcount)
		{
			if(RandomInt(5) == 0 || firstrew == 0) 
			{
				e_bool = true;
				firstrew ++;
			}
		}
		level thread blinkorder(vasearray, choices, e_bool, jackvasesrewardspot, poweruppool);
		//array::run_all( vasearray, &Kill, choices);
		iteration ++;
		level waittill("jackvasesover");
		e_bool = false;
		level waittill("start_of_round");
		wait(5);
		trig PlaySound("typewriterbell");
		fxModel = util::spawn_model("tag_origin", trig.origin);
		WAIT_SERVER_FRAME;
		PlayFXOnTag(level.smallpurplestuffxnew, fxModel, "tag_origin");
	}
}

function blinkorder(vasearray, choices, e_bool, spot, poweruppool)
{
	level endon("jackvasesover");
	//pull a random number between 1 and 4, the max count of vases
	//create a dynamically sized array that can take a new input n_times
	intarray = array();
	for(i = 0; i < choices; i++)
	{
		randint = 1 + RandomInt(vasearray.size);
		array::add(intarray, randint);
		//IPrintLnBold(randint);
	}

	for(i = 0; i < choices; i++)
	{
		for(k = 0; k < vasearray.size; k++)
		{
			if(vasearray[k].script_int == intarray[i])
			{
				vasearray[k] PlaySound(vasearray[k].script_sound);
				//IPrintLnBold(vasearray[k].script_int);
				jackvasesrewardspotfx = struct::get(vasearray[k].target,"targetname");
				thread PlayFxWithCleanup(level._effect["powerup_grabbed"], jackvasesrewardspotfx.origin, 2);

				wait(1.5);
				continue;
			}
			//IPrintLnBold("not found");
		}
	}
	for(i = 0; i < choices; i++)
	{
		//array::run_all( vasearray, &jackvaseinput, intarray[i]);
		level.jackvasesplayer = undefined;
		foreach(vase in vasearray)
		{
			vase thread jackvaseinput(intarray[i]);
		}
		level waittill("jackvasecorrect");
	}
	if(e_bool)
	{
		level.jackvasesplayer thread upgradegunjacksuperee();
	}
	//IPrintLnBold("ee complete");
	pup = array::random(poweruppool);
	zm_powerups::specific_powerup_drop(pup, spot.origin );
	intarray Delete();
	level notify("jackvasesover");
}


function upgradegunjacksuperee()
{
	//IPrintLnBold(self.playername + " Received a PAPed gun!");
	//wait(2);
	self.ignoreme = true;
	weapon = self GetCurrentWeapon();
	if(zm_weapons::can_upgrade_weapon(weapon))
	{
    	upgrade_weapon = zm_weapons::get_upgrade_weapon(weapon, false);
    	self zm_weapons::weapon_give(upgrade_weapon, true, false, true, true);
    }
    wait(2);
    self.ignoreme = false;
}

function jackvaseinput(correctint)
{
	level endon("jackvasesover");
	level endon("jackvasecorrect");
	//self SetCanDamage(true);
	jackvasesrewardspot = struct::get(self.target,"targetname");
	while(1)
	{
		self waittill( "damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel );
    	//if(zm_utility::is_melee_weapon(weapon) && IsPlayer(attacker))
   		//{
	    	if(self.script_int == correctint)
	    	{
	    		thread PlayFxWithCleanup(level._effect["powerup_grabbed"], jackvasesrewardspot.origin, 2);
	        	self PlaySound(self.script_sound);
	        	level.jackvasesplayer = attacker;
	        	level notify("jackvasecorrect");
	        	//return attacker;
	        }
	    	else
	    	{
	    		thread PlayFxWithCleanup("zombie/fx_powerup_grab_red_zmb", jackvasesrewardspot.origin, 2);
	    		self PlaySound("defaultfail");
	    		level notify("jackvasesover");
	    	}
    	//}
    	//wait(0.05);
	}
}





function hidephonenumbers()
{
	foreach(model in level.phonehiddennumbers)
	{
		PlayFXOnTag("zombie/fx_spawn_blood_rise_doa", model, "tag_origin");
		model PlaySound("soulabsorb");
		model Show();
	}
}




function startbuddereasteregg()
{
	level thread findrandomhintframe();
	level thread figureoutframes();
}

function cleanupbuddereefunc()
{
	foreach(item in level.budderphototrigs)
	{
		item Delete();
	}
}

function findrandomhintframe()
{
	randint = RandomInt(level.budderphotoeehint.size);
	foreach(part in level.budderphotoeehint)
	{
		part_model = GetEnt(part.target, "targetname");
		if(part == level.budderphotoeehint[randint])
		{
			part thread budderframeinteraction(part_model);
		}
		else
		{
			part_model Delete();
			part Delete();
		}
	}
	/*/Assigns an int to a frame and deletes the frames that lack an int, and lastly threads an interaction function.
	framecount = level.budderphotoeehint.size;
	framenumber = RandomIntRange(0, framecount + 1);
	level.currentbudderhintframe = level.budderphotoeehint[framenumber];
	level.currentbudderhintframe UseTriggerRequireLookAt();
	level.currentbudderhintframe.script_int = 1;
	foreach(frame in level.budderphotoeehint)
	{
		if(frame.script_int == 0)
		{
			frame.target Delete();
			frame Delete();
		}
		else if(frame.script_int == 1)
		{
			frame 
		}
	}
	/*/
}
function checkbudderframecount()
{
	if(level.budderphotocollectcount == 5 && level.budderimpostorphotocount == 0)
	{
		level notify("allbudderframescollected");
		level thread eliscareallplayers();
	}
}

function eliscareallplayers()
{
	foreach(player in GetPlayers())
	{
		player thread eliscare();
	}
}

function eliscare()
{
	self EnableInvulnerability();
	self.ignoreme = true;
	jumpscare_overlay = NewClientHudElem( self ); 
	jumpscare_overlay.alignX = "center";
	jumpscare_overlay.alignY = "center";
	jumpscare_overlay.horzAlign = "center";
	jumpscare_overlay.vertAlign = "center";
	jumpscare_overlay SetShader( "elisusscare", 480, 480 ); 
	jumpscare_overlay.alpha = 1; 
	self PlayLocalSound( "memesirensus" ); 
	wait(0.5); 
	jumpscare_overlay FadeOverTime( .5 ); 
	jumpscare_overlay.alpha = 0; 
	wait( .6 ); 
	jumpscare_overlay destroy(); 
	self.ignoreme = false;
	self DisableInvulnerability();
}


function budderframeinteraction(model)
{
	self UseTriggerRequireLookAt();
	model Hide();
	level waittill("playercoveredinoil");
	//level waittill("maintenancecomplete");
	model Show();
	self SetHintString("????");
	thread PlayFxWithCleanup(level._effect["powerup_grabbed"], model.origin);
	self PlaySound("darkaether_6");
	self waittill("trigger", player);
	self SetHintString("");
	player PlaySound("vox_budee_thisman");
	thread zm_subtitles::subtitle_display(undefined, 2, "-... .- ... . -..", "Have you seen this man?");
	self PlaySound("buddereeactivate");
	while(1)
	{
		level notify("buddereeconcluded");
		level notify("spawnbudderframes");
		level waittill("allbudderframescollected");
		level thread cleanupbuddereefunc();
		thread PlayFxWithCleanup(level._effect["powerup_grabbed"], model.origin);
		model SetModel("p7_thismanframe2");
		self PlaySound("buddereecomplete");
		self PlaySound("vox_budee_howdidyou");
		radius = spawn( "trigger_radius", self.origin, 1, 10, 10);
		thread zm_subtitles::subtitle_display(undefined, 2, "-... .- ... . -..", "You found all the frames.");
		wait(1);
		thread zm_subtitles::subtitle_display(undefined, 2, "-... .- ... . -..", "How did you know what to do?");
		wait(3);
		while(1)
		{
			radius waittill("trigger", player);
			if(IsPlayer(player) && !level.islevelbranch)
			{
				break;
			}
			wait(0.05);
		}
		radius Delete();
		self PlaySound("vox_budee_herereward");
		thread zm_subtitles::subtitle_display(undefined, 2, "-... .- ... . -..", "Well, here's your reward I guess?");
		wait(2.5);
		thread zm_subtitles::subtitle_display(undefined, 2, "-... .- ... . -..", "The BUDDER BLASTER.");
		self SetCursorHint("HINT_NOICON");
		self SetHintString("Press ^2[{+activate}]^7 To Claim.");
		self waittill("trigger", player);
		self Delete();
		//Set frame model to the alt frame with red eyes
		//sound here
		weaponname = "thundergun";
		weapon = GetWeapon(weaponname);
		//Give player thundergun
		player zm_weapons::weapon_give(weapon, false, false, true, true );
		level._zombie_include_weapons[ weapon ] = true;
		level.zombie_weapons[ weapon ].is_in_box = 1;
		level._zombie_include_weapons[ "thundergun" ] = true;
		level.zombie_weapons[ "thundergun" ].is_in_box = 1;
		thread zm_weapons::include_zombie_weapon("thundergun", true);
		wait(2);
		player PlayLocalSound("vox_budee_forgottochangeit");
		thread zm_subtitles::subtitle_display(player, 2, "-... .- ... . -..", "Wait does it still say Thundergun? I forgot to change its name, aw SHIT.");
		wait(7);
		//player PlaySound("samanthatheme2021");
		break;
	}
	//insert dialouge here
	//level waittill(somenotify)
	//player has to find the correct frames then return to the orignal frame, player can collect too many pictures and if they do it triggers a fail. The player isn't aware of this unless they reinteract with the original frame however
	//if they have only collected the correct frames and have collected all the real frames they are given a reward. If they are missing some they are told this 
}

function figureoutframes()
{
	level.normalframeint = RandomIntRange(0, 2);
	normalframesshuffled = array::randomize(level.normalframemodels);
	impostorframesshuffled = array::randomize(level.impostorframemodels);
	level.budderphotocollectcount = 0;
	level.budderimpostorphotocount = 0;
	impostorframeindex = 0;
	normalframeindex = 0;
	foreach(budframe in level.budderphototrigs)
	{
		budframe Hide();

		if(budframe.script_int == level.normalframeint)
		{
			budframe thread assignnormalframe(normalframesshuffled, normalframeindex);
			normalframeindex ++;
		}
		else
		{
			budframe thread assignimpostorframe(impostorframesshuffled, impostorframeindex);
			impostorframeindex ++;
		}
	}


	/*
	trash code u a bitch
	//assign a script int to the frame 1-6, 1-3 are real frames and 4-6 are impostor frames
	//threads a function occording to the given int
	level.budderphotocollectcount = 0;
	level.budderimpostorphotocount = 0;
	photosrandom = array(0, 1, 2, 3, 4);
	level.photosrandomshuff = array::randomize(photosrandom);
	level.budderphotosshuffled = array::randomize(level.budderphototrigs);

	for(i = 0; i < level.budderphotosshuffled.size; i++)
	{
		level.budderphotosshuffled[i].script_int = i;

		if(level.budderphotosshuffled[i].script_int <= 3)
		{
			level.budderphotosshuffled[i].isimpostor = False;
			level.budderphotosshuffled[i] thread assignnormalframe(i-1);
		}
		else if(level.budderphotosshuffled[i].script_int >= 4)
		{
			level.budderphotosshuffled[i].isimpostor = True;
			level.budderphotosshuffled[i] thread assignimpostorframe(i-1);
		}
	}
	/*/
}

function assignimpostorframe(framearray, int)
{
	self SetModel(framearray[int]);
	self thread checkfordamagebudder(framearray[int]);
}

function assignnormalframe(framearray, int)
{
	self SetModel(framearray[int]);
	self thread checkfordamagebudder(framearray[int]);
	//check if damage and add more to a seperate value if the shot frame is an impostor frame
}

function spawnfxframedamage()
{
	seatinginteractfx = util::spawn_model("tag_origin", self.origin);
	WAIT_SERVER_FRAME;
	PlayFXOnTag(level.seating153trigactivationfx, seatinginteractfx, "tag_origin");
	wait(1.5);
	seatinginteractfx Delete();
}

function checkfordamagebudder(string)
{
	level endon("budderframesfail");
	level waittill("spawnbudderframes");
	self Show();
	PlayFXOnTag(level._effect["powerup_grabbed"], self, "tag_origin");
	self SetCanDamage(1);
	while(1)
	{
		self waittill( "damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel);
		if(isplayer(attacker) && (mod == "MOD_PROJECTILE_SPLASH" || mod == "MOD_EXPLOSIVE" || mod == "MOD_EXPLOSIVE_SPLASH" || mod == "MOD_GRENADE" || mod == "MOD_GRENADE_SPLASH" ))
		{
			wait(0.05);
			continue;
		}
		else break;
	}
	//testing jumpscare logic comment line under this later
	//level thread eliscareallplayers();
	//IPrintLnBold(string + " " + self.script_int + " " + self.isimpostor);
	self Hide();
	self thread spawnfxframedamage();
	if(self.script_int != level.normalframeint)
	{
		//if the script isn't the currently set normal frame value its treated as an impostor frame
		attacker shellshock( "electrocution", 3);
		attacker PlaySound("defaultfail");
		level.budderimpostorphotocount ++;
		level thread delayedframerestart();
	}
	self PlaySound(randominteractsound());
	level.budderphotocollectcount ++;
	level thread checkbudderframecount();
}

function delayedframerestart()
{
	foreach(budframe in level.budderphototrigs)
	{
		budframe Hide();
	}
	level notify("budderframesfail");
	wait(30);
	level thread figureoutframes();
	level notify("spawnbudderframes");
}


function startparedoliaee()
{
	level.paredoliaint = 0;
	level thread waitforparedolia();
	level thread paredoliahotel();
	level thread restarteggseating();
	level thread paredoliachilis();
}


function restarteggseating()
{
	//THIS FUNCTION IS CURRENTLY DISABLED! MAYBE USE IT AS AN EE STEP?
	//UNCOMMENT WHEN NEEDED
	level.shotcounter = 0;
	level notify("seating153trigfaildelete");
	level notify("seating153trigfail");
	//foreach(trig in level.seating153trigcenter)
	//{
	//	trig Delete();
	//}
	foreach(trig in level.seating153trigcenter)
	{
		trig thread seating153trigcenter();
	}
}



function seating153trigcenter()
{
	while(1)
	{
		level endon("seating153trigfail");
		self UseTriggerRequireLookAt();
		self waittill("trigger", player);
		if(level.islevelbranch) continue;
		switch(level.shotcounter)
		{
			case 0:
			{
				if(self.script_int == 1)
				{
					level.shotcounter ++;
					//IPrintLnBold("1 shot");
					self thread spawnseating153fx();
					self PlaySound(randominteractsound());
					break;
				}
				else 
				{
					//self PlaySound("defaultfail");
					level thread restarteggseating();
					break;
				}
			}

			case 1:
			{
				if(self.script_int == 5)
				{
					level.shotcounter ++;
					//IPrintLnBold("5 shot");
					self thread spawnseating153fx();
					self PlaySound(randominteractsound());
					break;
				}
				else 
				{
					//self PlaySound("defaultfail");
					level thread restarteggseating();
					break;
				}
			}

			case 2:
			{
				if(self.script_int == 3)
				{
					level.shotcounter ++;
					//IPrintLnBold("3 shot");
					self thread spawnseating153fx();
					self PlaySound(randominteractsound());
					wait(1);
					level thread seating153eggreward();
					break;
				}
				else 
				{
					//self PlaySound("defaultfail");
					level thread restarteggseating();
					break;
				}
			}

		}
		break;
	}
}

function paredoliahotel()
{
	level notify("hotelparedoliafail2");
	level.hotelparedoliacount = 0;
	paredoliaspots = struct::get_array("paredoliahotel","targetname");
	foreach(paredoliaspot in paredoliaspots)
	{
		paredoliaspot zm_unitrigger::create_unitrigger( "" , undefined, &unitrigger_prompt_and_visibilitylookat);
		paredoliaspot UseTriggerRequireLookAt();
		paredoliaspot thread hotelparedoliatrig(paredoliaspots);
	}
}


function hotelparedoliatrig(susarray)
{
	level endon("hotelparedoliafail2");
	while(1)
	{
		self waittill("trigger_activated", player);
		if(level.islevelbranch) continue;
		if(self.script_int == 1 && level.hotelparedoliacount == 0)
		{
			level.hotelparedoliacount ++;
			PlaySoundAtPosition(randominteractsound(), self.origin);
			self thread hotelparedoliafx();
			break;
		}
		else if(self.script_int == 5 && level.hotelparedoliacount == 1)
		{
			level.hotelparedoliacount ++;
			PlaySoundAtPosition(randominteractsound(), self.origin);
			self thread hotelparedoliafx();
			break;
		}
		else if(self.script_int == 3 && level.hotelparedoliacount == 2)
		{
			level.paredoliaint ++;
			PlaySoundAtPosition(randominteractsound(), self.origin);
			self thread hotelparedoliafx();
			wait(1);
			level notify("hotelparedoliafail");
			foreach(item in susarray)
			{
				item Delete();
			}
			foreach(player in GetPlayers())
			{
				player PlayLocalSound("rune_cross_01");
			}
			level notify("hotelparedoliafail2");
			break;
		}
		else
		{
			player PlayLocalSound("defaultfail");
			level notify("hotelparedoliafail");
			wait(1);
			level thread paredoliahotel();
			break;
		}
	}
}




function paredoliachilis()
{
	level notify("chilispaperparedoliafail2");
	level.chilispaperparedoliacount = 0;
	paredoliaspots = struct::get_array("paperparedolia","targetname");
	foreach(paredoliaspot in paredoliaspots)
	{
		paredoliaspot zm_unitrigger::create_unitrigger( "" , undefined, &unitrigger_prompt_and_visibilitylookat);
		//paredoliaspot UseTriggerRequireLookAt();
		paredoliaspot thread chilisparedoliatrig(paredoliaspots);
	}
}


function chilisparedoliatrig(susarray)
{
	level endon("chilispaperparedoliafail2");
	while(1)
	{
		self waittill("trigger_activated", player);
		if(level.islevelbranch) continue;
		if(self.script_int == 1 && level.chilispaperparedoliacount == 0)
		{
			level.chilispaperparedoliacount ++;
			PlaySoundAtPosition(randominteractsound(), self.origin);
			self thread chilispaperparedoliafx();
			break;
		}
		else if(self.script_int == 5 && level.chilispaperparedoliacount == 1)
		{
			level.chilispaperparedoliacount ++;
			PlaySoundAtPosition(randominteractsound(), self.origin);
			self thread chilispaperparedoliafx();
			break;
		}
		else if(self.script_int == 3 && level.chilispaperparedoliacount == 2)
		{
			level.paredoliaint ++;
			PlaySoundAtPosition(randominteractsound(), self.origin);
			self thread chilispaperparedoliafx();
			wait(1);
			level notify("chilispaperparedoliafail");
			foreach(item in susarray)
			{
				item Delete();
			}
			foreach(player in GetPlayers())
			{
				player PlayLocalSound("rune_cross_01");
			}
			level notify("chilispaperparedoliafail2");
			break;
		}
		else
		{
			player PlayLocalSound("defaultfail");
			level notify("chilispaperparedoliafail");
			wait(1);
			level thread paredoliachilis();
			break;
		}
	}
}

function unitrigger_prompt_and_visibilitylookat( player )
{	
	if(player zm_utility::is_player_looking_at(self.origin, 0.98, true, player)) b_visible = true;
	else b_visible = false;
	return b_visible;
}

function chilispaperparedoliafx()
{
	seatinginteractfx = util::spawn_model("tag_origin", self.origin);
	WAIT_SERVER_FRAME;
	PlayFXOnTag(level.seating153trigactivationfx, seatinginteractfx, "tag_origin");
	level waittill("chilispaperparedoliafail");
	seatinginteractfx Delete();
}

function hotelparedoliafx()
{
	seatinginteractfx = util::spawn_model("tag_origin", self.origin);
	WAIT_SERVER_FRAME;
	PlayFXOnTag(level.seating153trigactivationfx, seatinginteractfx, "tag_origin");
	level waittill("hotelparedoliafail");
	seatinginteractfx Delete();
}


function spawnseating153fx()
{
	seatinginteractfx = util::spawn_model("tag_origin", self.origin);
	WAIT_SERVER_FRAME;
	PlayFXOnTag(level.seating153trigactivationfx, seatinginteractfx, "tag_origin");
	level waittill("seating153trigfaildelete");
	seatinginteractfx Delete();
}

function randominteractsound()
{
	randseatint = RandomInt(10);
	randsound = ("darkaether_"+randseatint);
	if(randsound == "") return "darkaether_1";
	return randsound;
}

function seating153eggreward()
{
	level.paredoliaint ++;
	level notify("seating153trigfail");
	foreach(player in GetPlayers())
	{
		player PlayLocalSound("rune_cross_01");
	}
	level notify("seating153trigfaildelete");
	foreach(trig in level.seating153trigcenter)
	{
		trig Delete();
	}
}

function waitforparedolia()
{
	fishscarymoment = struct::get("imoutside","targetname");
	while(1)
	{
		if(level.paredoliaint == 3) break;
		wait(0.05);
	}
	foreach(player in GetPlayers())
	{
		player PlayLocalSound("success");
	}
	level notify("seating153eggdone");
	//IPrintLnBold("I'M OUTSIDE");
	level thread waitforplayertogooutsideparedolia(fishscarymoment);
}


function waitforplayertogooutsideparedolia(fishscarymoment)
{
	evilfishtouch = GetEnt("evilfishtouch", "targetname");
	fishscarymodel = util::spawn_model(fishscarymoment.model, fishscarymoment.origin);
	wait(0.05);
	fishscarymodel SetScale(40);
	while(1)
	{
		bool = false;
		foreach(player in GetPlayers())
		{
			if(player IsTouching(evilfishtouch))
			{
				bool = true;
				break;
			}
		}
		if(bool) break;
		wait(0.05);
	}
	fishscarymodel MoveZ(384, 1.5);
	wait(1.5);
	//time = SoundGetPlaybackTime("fishsoundscary")/1000;
	fishscarymodel PlaySound("fishsoundscary");
	fishscarymodel Vibrate( (1,1,1), 10, .4, 4 );
	wait(3);
	PlayFXOnTag("dlc3/stalingrad/fx_dragonstrike_portal_flash", fishscarymodel, "tag_origin");
	wait(0.25);
	fishscarymodel Hide();
	foreach(player in GetPlayers())
	{
		if(player IsTouching(evilfishtouch))
		{
			player shellshock( "explosion", 2.5);
		}
	}
	earthQuake(.6, 3, fishscarymodel.origin, 1500);
	wait(9);
	fishscarymodel Delete();
	evilfishtouch Delete();
}

//start backrooms ee
function start153shiningee()
{
	bgtrigs = GetEntArray("br153bgtrig", "targetname");
	level.backroomshiningtrigs = GetEntArray("shining153eggdet", "targetname");
	level.backroomshiningdmgtrigs = GetEntArray("153shiningdmgtrig", "targetname");
	level.backroomdoorframes = GetEntArray("brdoorframe", "targetname");
	foreach(item in level.backroomshiningtrigs)
	{
		doorframe = GetEnt(item.target, "targetname");
		doorframe Hide();
	}
	foreach(item in bgtrigs)
	{
		doorframe = GetEnt(item.target, "targetname");
		doorframe Hide();
	}
	foreach(item in level.backroomshiningdmgtrigs)
	{
		doorframe = GetEnt(item.target, "targetname");
		doorframe Hide();
	}
	level thread hidedemonicgraffiti();
	level waittill("start153backrooms");
	level thread startupdoordetect();
	//delete the door triggers and the fx spots
	//TEMP UNTILL PROVEN THAT THIS FUNCTIONS AS INTENDED, TEST ME!
	level waittill("elements153received");
	level notify("spawnfxshiningdelete");
	//wait(10);
	foreach(trig in level.backroomshiningdmgtrigs)
	{
		part = GetEnt(trig.target, "targetname");
		part Delete();
		trig Delete();
	}
	foreach(multtrig in level.backroomshiningtrigs)
	{
		part = GetEnt(multtrig.target, "targetname");
		part Delete();
		multtrig Delete();
	}
	foreach(item in bgtrigs)
	{
		doorframe = GetEnt(item.target, "targetname");
		doorframe Delete();
		item Delete();
	}
}

function startupdoordetect()
{
	level notify("spawnfxshiningdelete");
	level notify("brtimerisup");
	level notify("brplayerfaildoors");
	level.doordetectcount = 0;
	level.knivesmarkcount = 0;
	level notify("spawnfxshiningdelete");
	level notify("spawnfxshiningdelete");
	level notify("brplayerfaildoors");
	wait(2);
	level notify("brplayerfaildoors");
	foreach(dmgtrig in level.backroomshiningdmgtrigs)
	{
		dmgtrig thread brwaitforknife();
	}
	level waittill("brallscratchknives");
	foreach(multtrig in level.backroomshiningtrigs)
	{
		multtrig thread brwaitforplayertrig();
	}
}

function spawnfxshining()
{
	seatinginteractfx = util::spawn_model("tag_origin", self.origin);
	WAIT_SERVER_FRAME;
	PlayFXOnTag(level.purplestuffx, seatinginteractfx, "tag_origin");
	level waittill("spawnfxshiningdelete");
	seatinginteractfx Delete();
}

function spawndoorframefx()
{
	
	seatinginteractfx = util::spawn_model("tag_origin", self.origin);
	WAIT_SERVER_FRAME;
	PlayFXOnTag(level.smallpurplestuffxnew, seatinginteractfx, "tag_origin");
	level waittill("brplayerfaildoors");
	seatinginteractfx Delete();
}

function spawndoorframefxspecial()
{
	
	seatinginteractfx = util::spawn_model("tag_origin", self.origin);
	WAIT_SERVER_FRAME;
	PlayFXOnTag(level.portal153event, seatinginteractfx, "tag_origin");
	level waittill("brplayerhasteleported");
	seatinginteractfx Delete();
}



function brwaitforknife()
{
	level endon("brtimerisup");
	self waittill("trigger", player);
	level.knivesmarkcount ++;
	doorframe = GetEnt(self.target, "targetname");
	doorframe thread spawnfxshining();
	self PlaySound(randominteractsound());
	if(level.knivesmarkcount == 5)
	{
		level notify("brallscratchknives");
		level notify("brtimerisup");
		return;
	}
	wait(10);
	level thread startupdoordetect();
}

function brwaitforplayertrig()
{
	level endon("brplayerfaildoors");
	part = GetEnt(self.target, "targetname");
	self waittill("trigger", player);
	switch(level.doordetectcount)
	{
		case 0:
		{
			if(self.script_int == 1)
			{
				self PlaySound("rune_cross_03");
				part thread spawndoorframefx();
				level.doordetectcount ++;
				level notify("doortriggersuccessbr");
				self thread brdoortimer();
				//wait(0.2);
				//self waittill("trigger", player);
				//self PlaySound("aetherdoorfail");
				//level thread startupdoordetect();
				//level notify("brplayerfaildoors");
				break;
			}
			else
			{
				self PlaySound("aetherdoorfail");
				level thread startupdoordetect();
				level notify("brplayerfaildoors");
				break;
			}
		}
		case 1:
		{
			if(self.script_int == 5)
			{
				self PlaySound("rune_cross_04");
				part thread spawndoorframefx();
				level.doordetectcount ++;
				level notify("doortriggersuccessbr");
				self thread brdoortimer();
				//wait(0.2);
				//self waittill("trigger", player);
				//self PlaySound("aetherdoorfail");
				//level thread startupdoordetect();
				//level notify("brplayerfaildoors");
				break;
			}
			else
			{
				self PlaySound("aetherdoorfail");
				level thread startupdoordetect();
				level notify("brplayerfaildoors");
				break;
			}
		}
		case 2:
		{
			if(self.script_int == 3)
			{
				self PlaySound("rune_cross_done");
				part thread spawndoorframefxspecial();
				level.doordetectcount ++;
				self thread breastereggreward();
				level notify("brplayerfaildoors");
				break;
			}
			else
			{
				self PlaySound("aetherdoorfail");
				level thread startupdoordetect();
				level notify("brplayerfaildoors");
				break;
			}
		}
	}
}

function brdoortimer()
{
	level endon("doortriggersuccessbr");
	level endon("brplayerfaildoors");
	wait(15);
	if(level.doordetectcount < 3)
	{
		level thread startupdoordetect();
		self PlaySound("defaultfail");
	}
}


function killallzs()
{
	zombies = GetAiSpeciesArray( level.zombie_team, "all" );
        if ( isdefined( zombies ) )
        {
        	level.zombie_respawns += zombies.size;
        	level.zombie_total += zombies.size;
        	WAIT_SERVER_FRAME;
        	//zm_powerups::specific_powerup_drop( "nuke", player.origin );
            array::run_all( zombies, &Kill );
        }
}

function breastereggreward()
{
	level notify("sideeeteleportstarted");
	level notify("brplayerfaildoors");

	//level notify("spawnfxshiningdelete");
	level notify("brtimerisup");
	level.brroomsplayerdetect = GetEnt("backroomsplayerdetect", "targetname");
	level.hotelteleportspots = struct::get_array("backroomteleportspots","targetname");
	//IPrintLnBold("You are looking too far into these things.");
	//IPrintLnBold("You should fear what lies beyond.");
	//self waittill("trigger", player);
	level notify("storycriteescene");
	foreach(player in GetPlayers())
	{
		player notify("stop_player_out_of_playable_area_monitor");
	}
	self thread brteleportallplayers();
	wait(1);
	level thread killallzs();
	level thread enablezombies(false);
	//level flag::clear( "zombie_drop_powerups");
	//level flag::clear( "spawn_zombies" );
	level notify("videoscreenquest");
	level notify("brplayerhasteleported");
	foreach(player in GetPlayers())
	{
		player.ignoreme = true;
		if(player.inbrooms == false || player.inbrooms == undefined)
		{
			player DisableOffhandWeapons();
			player DisableWeapons();
			player thread lui::screen_fade_out(0.3);
			player freezecontrols( true );
        	player SetOrigin( level.black_spots[player.characterIndex].origin ); 
        	player SetPlayerAngles( level.black_spots[player.characterIndex].angles );
			//player thread lui::screen_flash( .1, 0.1, 1.0, 1.0, "white" );
			//player thread blackandwhitevis();
			
			//player thread confirmteleport(level.hotelteleportspots, 0);
			level notify("brplayerhasteleported");
		}
	}
	wait(0.5);
	foreach(player in GetPlayers())
	{
		if(player.inbrooms == false || player.inbrooms == undefined)
		{
			player thread confirmteleport(level.hotelteleportspots, 0);
			player.inbrooms = true;
			//player flagsys::set( "playing_movie_hide_hud" );
			//player util::show_hud( 0 );
			level notify("brplayerhasteleported");
		}
	}
	wait(2);
	foreach(player in GetPlayers())
	{
		player freezecontrols( false ); 
		player shellshock( "explosion", 5);
		player thread lui::screen_fade_in(5);
	}
	level.brroomsplayerdetect PlaySound("theroaddistorted");
	level.brroomsplayerdetect PlayLoopSound("amb_sign_buzz", 0.5);
	
	level thread brdemonicwait();
	level waittill("brredenter");
	level.brroomsplayerdetect StopLoopSound(1.5);
	level.brroomsplayerdetect StopSound("theroaddistorted");
	level.brroomsplayerdetect PlaySound("theroaddistortedpitch");
	//level thread brwatcheecompletion(1);
	level waittill("br153riddlesolved");
	level.brroomsplayerdetect StopSound("theroaddistortedpitch");
	//sound coming from the center here
	foreach(player in GetPlayers())
	{
		player thread blackandwhitevis(3);
	}
	//level waittill("brmonologecomplete");
	level notify("sideeeteleportfullycomplete");
	level notify("storycritsceneended");
}


function brwatcheecompletion(int)
{
	//alternate code that ended the segment if a player took too long to complete it, this is slightly altered now, if the player fails to complete it in 60 seconds there is no free gun upgrade when they return to room 153
	if(int == 1)
	{
		level endon("br153riddlesolved");
		wait(60);
		level.completedbroomsee = false;
		break;
	}
	
	//here we wait for the player to go to the center where they will find the cheytrium, then chungus appears and screams and the floor gives outs
	//wait(3);
	level thread dropfloorbr();
	wait(0.5);
	level util::set_lighting_state(0);
	level notify("brmonologecomplete");
	level notify("videoscreenquestended");
	wait(5);
	//level flag::set( "zombie_drop_powerups");
	//level flag::set( "spawn_zombies" );
	level thread enablezombies(true);
	foreach(player in GetPlayers())
	{
		player flagsys::clear( "playing_movie_hide_hud" );
		player util::show_hud( 1 );
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
function PlayFxWithCleanupNotify(fx, origin, stringnotify)
{
    level thread _PlayFxWithCleanupNotify(fx, origin, stringnotify);
}

function _PlayFxWithCleanupNotify(fx, origin, stringnotify)
{
    fxModel = Spawn("script_model", origin);
    fxModel SetModel("tag_origin");
    wait(0.05);
    fx = PlayFXOnTag(fx, fxModel, "tag_origin");
    level waittill(stringnotify);
    fxModel Delete();

    if (isdefined(fx))
        fx Delete();
}




function brdemonicwait()
{
	level.bgtrigs = GetEntArray("br153bgtrig", "targetname");
	level.completedbroomsee = true;
	chungussecretlook = GetEnt("brchunguslookdetect", "targetname");
	fishtrig = GetEnt("br153fishtrig", "targetname");
	fish153 = GetEnt("br153eefish", "targetname");
	damagetriggerred = GetEnt("backroomsdamagetrig", "targetname");
	circleaurafxspot = GetEnt("brrunecircleaura", "targetname");
	broomstrigrad = GetEnt("br153eeplayercenterdetect", "targetname");
	element153 = GetEnt("element153meteor", "targetname");
	element153trig = GetEnt("element153meteortrigger", "targetname");
	element153 Hide();
	element153trig Hide();


	//fishtrig EnableLinkTo();
  	//fishtrig LinkTo(fish153);
  	//foreach(trig in level.bgtrigs)
	//{
		//trig SetHintString(" ");
		//trig SetCursorHint("HINT_NOICON");
	//}
  	fishtrig SetHintString("????");
	fishtrig SetCursorHint("HINT_NOICON");
	fishtrig waittill("trigger", player);
	broomstrigrad waittill("trigger", player);
	damagetriggerred TriggerEnable(1);
	fishtrig SetHintString("");
	level notify("changememorypitch");
	//maybe comment this later
	broomstrigrad Delete();
	fishtrig Delete();
	thread PlayFxWithCleanupNotify("dlc4/genesis/fx_summon_circle_rune_glow", circleaurafxspot.origin, "eebrroomsfail");
	earthQuake(.6, 3, broomstrigrad.origin, 1500);
	fish153 MoveZ(40, 2);
	fish153 RotateRoll(90, 2);
	fish153 PlaySound("darkchoir");
	wait(2);
	//fish153 StopSound("darkchoir");
	WAIT_SERVER_FRAME;
	thread PlayFxWithCleanup("zombie/fx_exp_rpg_red_doa", fish153.origin);
	fish153 PlaySound("orb_start_move");
	foreach(player in GetPlayers())
	{
		player thread lui::screen_flash( .1, 0.1, 1.0, 1.0, "red" );
		player shellshock( "explosion", 3);
		player.filteractivated = true;
		player.filtertype = "rooms";
	}
	fish153 PlayLoopSound("fishchantloop");
	wait(.1);
	thread PlayFxWithCleanupNotify("dlc4/genesis/fx_corrupteng_pillar_ember_top_red", fish153.origin, "eebrroomsfail");
	fish153 thread infinitespin();
	level notify("brredenter");
	level util::set_lighting_state(1);

	level thread bginteract153();
	fish153 PlaySound("vox_unknown_lastchance");
	wait(1);
	thread zm_subtitles::subtitle_display(undefined, 2, "-.-.-", "Find a way out.");
	wait(3.4);
	thread zm_subtitles::subtitle_display(undefined, 2, "-.-.-", "This is your last chance.");
	wait(4);
	fish153 PlaySound("j2111morse");
	wait(4);
	thread zm_subtitles::subtitle_display(undefined, 2, "-.-.-", "John 21:11");
	//fish slowly raises and begins to shake then red explosion and lighting scape change.
	//dialouge then morse code
	level waittill("br153riddlesolved");
	fish153 StopLoopSound(0.5);
	fish153 Hide();
	//clean up the triggers and the other script models
	foreach(trig in level.bgtrigs)
	{
		model = GetEnt(trig.target, "targetname");
		trig Delete();
		model Delete();
	}
	element153 Show();
	fxModel153 = util::spawn_model("tag_origin", element153.origin);
	WAIT_SERVER_FRAME;
	PlayFXOnTag(level.smallpurplestuffxnew, fxModel153, "tag_origin");
	element153trig Show();
	element153trig SetHintString("Press ^1[{+activate}]^7 To Pickup Element 153");
	element153trig waittill("trigger", player);
	level notify("elements153received");
	level.playerhastheelement153 = true;
	fxModel153 Delete();
	clientfield::set("element153pic", 1);
	player PlaySound("part_pickup");
	element153trig SetHintString("");
	element153trig Delete();
	element153 Delete();
	level.chungussecret MoveZ(200, 0.05);
	level.chungussecret Show();
	level.chungussecret thread fastspin();
	PlaySoundAtPosition("chungrealityscare", level.chungussecret.origin);
	thread zm_subtitles::subtitle_display(undefined, 2, "-.-.-", "run");
	level thread brwatcheecompletion(2);
	wait(10);
	chungussecretlook Delete();
	level.chungussecret Delete();
	level notify("eebrroomsfail");
}

function fastspin()
{
	self endon("death");
	while(1)
	{
		self RotateYaw(360, 0.1);
		wait(0.1);
	}
}

function bginteract153()
{
	level notify("eebrroomsfail");
	level.brtrigiterationcount = 0;
	foreach(trig in level.bgtrigs)
	{
		trig thread eeinteractbrooms();
		trig SetHintString("????");
		trig SetCursorHint("HINT_NOICON");
	}
}

function spawndoorframefxspecialzz()
{
	seatinginteractfx = util::spawn_model("tag_origin", self.origin);
	WAIT_SERVER_FRAME;
	PlayFXOnTag("dlc5/tomb/fx_115_generator_progression_red_light", seatinginteractfx, "tag_origin");
	level waittill("eebrroomsfail");
	seatinginteractfx Delete();
}

function eeinteractbrooms()
{
	level endon("eebrroomsfail");
	trigfxspot = GetEnt(self.target, "targetname");
	self SetHintString("????");
	self SetCursorHint("HINT_NOICON");
	self waittill("trigger", player);
	self SetHintString("");
	switch(level.brtrigiterationcount)
	{
		case 0:
		{
			if(self.script_int == 0 || self.script_int == 3)
			{
				self PlaySound("glyphactivate");
				trigfxspot thread spawndoorframefxspecialzz();
				level.brtrigiterationcount ++;
				break;
			}
			else
			{
				self PlaySound("defaultfail");
				wait(0.5);
				level thread bginteract153();
				break;
			}
		}
		case 1:
		{
			if(self.script_int == 0 || self.script_int == 1)
			{
				self PlaySound("glyphactivate");
				trigfxspot thread spawndoorframefxspecialzz();
				level.brtrigiterationcount ++;
				break;
			}
			else
			{
				self PlaySound("defaultfail");
				wait(0.5);
				level thread bginteract153();
				break;
			}
		}
		case 2:
		{
			if(self.script_int == 2 || self.script_int == 1)
			{
				self PlaySound("glyphactivate");
				trigfxspot thread spawndoorframefxspecialzz();
				level.brtrigiterationcount ++;
				break;
			}
			else
			{
				self PlaySound("defaultfail");
				wait(0.5);
				level thread bginteract153();
				break;
			}
		}
		case 3:
		{
			if(self.script_int == 3 || self.script_int == 2)
			{
				self PlaySound("glyphactivate");
				trigfxspot thread spawndoorframefxspecialzz();
				level.completedbroomsee = true;
				level.brtrigiterationcount ++;
				foreach(player in GetPlayers())
				{
					player thread lui::screen_flash( .1, 0.1, 0.5, 1.0, "white" );
					player PlayLocalSound("clock_complete_00");
					player shellshock( "electrocution", 2);
				}
				self PlaySound("success");
				level notify("br153riddlesolved");
				//level thread brwatcheecompletion(2);
				level thread zm_chilis::attract_zombies();
				earthQuake(.6, 3, self.origin, 1500);
				break;
			}
			else
			{
				self PlaySound("defaultfail");
				wait(0.5);
				level thread bginteract153();
				break;
			}
		}
	}
}

function infinitespin()
{
	level endon("intermission");
	self endon("death");
	while(1)
	{
		self RotateYaw(360, 3);
		wait(3);
	}
}


function brdemonicplayercount(trigrad)
{
	playercount = 0;
	players = GetPlayers();
	foreach(player in GetPlayers())
	{
		if(player IsTouching(trigrad))
		{
			playercount ++;
		}
	}
	if(playercount >= players.size)
	{
		return true;
	}
	else
	{
		return false;
	}
}



function hidedemonicgraffiti()
{
	brgraffiti = GetEntArray("brhiddendecal", "targetname");
	foreach(graffiti in brgraffiti)
	{
		graffiti thread hideeachgraf();
	}
}

function hideeachgraf()
{
	self Hide();
	level waittill("brredenter");
	self Show();
	level waittill("brmonologecomplete");
	wait(2);
	self Delete();
	//cleanup old scriptmodels
	trigfxspot = GetEnt(self.target, "targetname");
	trigfxspot thread deleteallinarrayaj();

	//wait(2);
	//level notify("teleport_returned");
	return;
}


function deleteallinarrayaj()
{
	foreach(item in self)
	{
		item Delete();
	}
}


function blackandwhitevis(int)
{
	foreach(player in GetPlayers())
		player.filteractivated = false;
	VisionSetNaked( "zombie_last_stand", int);
	level waittill("brplayerreturnedtohotel");
	VisionSetNaked("zm_factory", 7 );
}
function brteleportallplayers()
{
	level endon("brplayerhasteleported");
    while(1)
    {
    	//self thread blackandwhitevis();
        self waittill("trigger", player);
        player DisableOffhandWeapons();
		player DisableWeapons();
		player thread lui::screen_fade_out(0.05);
		player freezecontrols( true );
        player SetOrigin( level.black_spots[player.characterIndex].origin ); 
        player SetPlayerAngles( level.black_spots[player.characterIndex].angles );
		wait(0.1);
		//player flagsys::set( "playing_movie_hide_hud" );
		//player util::show_hud( 0 );
        //player thread lui::screen_flash( .1, 0.1, 1.0, 1.0, "white" );
        level thread checkplayerbrcount();
        player shellshock( "explosion", 4 );
        player thread confirmteleport(level.hotelteleportspots);
        player.inbrooms = true;
        wait 0.05;
    }
}

function checkplayerbrcount()
{
	players = GetPlayers();
	level.brplayercounter = 0;
	for(i = 0; i < players.size; i++)
	{
		if(players[i] IsTouching(level.brroomsplayerdetect))
		{
			level.brplayercounter ++;
		}
		if(level.brplayercounter == players.size)
		{
			level notify("brplayerhasteleported");
		}
	}
}

function confirmteleport(structarray, int)
{
	self SetOrigin(structarray[self.characterIndex].origin);
	self SetPlayerAngles(structarray[self.characterIndex].angles);
	self setstance( "stand" ); 
	self AllowJump(false);
	self SetMoveSpeedScale(0);
	if(int == 0)
	{
		level waittill("brplayerhasteleported");
	}
	self AllowJump(true);
	self SetMoveSpeedScale(1);
}

function autoexec act2graffiti()
{
	level waittill("initial_blackscreen_passed");
	act2graf = GetEntArray("act2graffiti", "targetname");
	foreach(graf in act2graf)
	{
		graf Hide();
	}
	level waittill("brmonologecomplete");
	foreach(graf in act2graf)
	{
		graf Show();
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

function dropfloorbr()
{
	hotelteleportspots = struct::get_array("playerchungusscriptarray","targetname");
	brfloorclip = GetEntArray("brfloorclipping", "targetname");
	foreach(clip in brfloorclip)
	{
		level waittill("brmonologecomplete");
		clip Delete();
	}
	foreach(player in GetPlayers())
	{
		player shellshock( "electrocution", 4 );
	}
	level lui::screen_fade_out(.75);
	wait(4);
	foreach(player in GetPlayers())
	{
		player.filteractivated = false;
		player thread isplayerinvincible();
		player thread confirmteleport(hotelteleportspots, 1);
		player thread zm::player_out_of_playable_area_monitor();
		player EnableOffhandWeapons();
		player EnableWeapons();
		level notify("brplayerreturnedtohotel");
		level notify("teleport_returned");
	}
	level lui::screen_fade_in( 1.5 );
}

function isplayerinvincible()
{
	self EnableInvulnerability();
	self.ignoreme = true;
	wait(2);
	self DisableInvulnerability();
	self.ignoreme = false;
}

function opendoor153()
{
	room153secretskepic = GetEnt("room153secretsk", "targetname");
	room153secretskepic thread infinitespin();
	room153secretskepic PlayLoopSound("darkchoirlp");
	fish153doorclip = GetEnt("fish153secretdoor", "targetname");
	door153interact = GetEnt("room153interactdoor", "targetname");
	godfish153 = GetEnt("godfish153", "targetname");
	fishhat = GetEnt(godfish153.target, "targetname");
	fishhat EnableLinkTo();
	fishhat LinkTo(godfish153);
	room235pla = GetEnt("br_235roompla", "targetname");
	room153pla = GetEnt("br_153roompla", "targetname");
	rewarddoor153 = GetEnt("rewarddoor153","targetname");
	room153pla Hide();
	radius = spawn( "trigger_radius", rewarddoor153.origin, 1, 100, 100);
	level waittill("brplayerreturnedtohotel");
	godfish153 thread infinitespin();
	godfish153 PlayLoopSound("fishchantloopalt");
	PlayFXOnTag("dlc1/castle/fx_demon_gate_rune_glow_loop_world_fast", godfish153, "tag_origin");
	radius waittill("trigger", player);
	room153pla PlaySound("piano153");
	wait(1);
	PlayFXOnTag("dlc1/castle/fx_glow_115_fuse_burst_castle", room153pla, "tag_origin");
	room235pla Delete();
	room153pla Show();
	radius Delete();
	door153interact SetCursorHint("HINT_NOICON");
  	door153interact SetHintString("????");
  	door153interact waittill("trigger", player);
  	door153interact SetHintString("");
  	fish153doorclip Delete();
  	door153interact Delete();
  	rewarddoor153 PlaySound("dooropen");
  	rewarddoor153 RotateYaw(-100, 2);
  	//upgrade player weapon here
  	weapon = player GetCurrentWeapon();
	if(zm_weapons::can_upgrade_weapon(weapon) && level.completedbroomsee == true)
	{
    	upgrade_weapon = zm_weapons::get_upgrade_weapon(weapon, false);
    	player zm_weapons::weapon_give(upgrade_weapon, true, false, true, true);
    }
}

function secret153roommusic()
{
	level endon("intermission");
	while(1)
	{
		self waittill("trigger", player);
		if(player.music153played == false || player.music153played == undefined && level.hotelthemeplayed)
		{
			player.music153played = true;
			player PlayLocalSound("bellthemefadein");
		}
		wait 0.05;
	}
	
}

function cakeeasteregg153()
{
	level.secret153roomdetectmusic = GetEnt("secret153roomdetectmusic", "targetname");
	level.beginingcandles = GetEntArray("begincandles153","targetname");
	level.cakeandcandles = GetEntArray("cake153andcandle", "targetname");
	level.cakeshootspots = GetEntArray("candleshootspot153", "targetname");
	level.cakefinalfxlight = GetEnt("candle153overlightfx", "targetname");

	level.cakefinalfxlight Hide();

	level.secret153roomdetectmusic thread secret153roommusic();

	foreach(item in level.cakeshootspots)
	{
		fxball = GetEnt(item.target, "targetname");
		fxball Hide();
		item thread cakewait(fxball);
	}

	foreach(cnadle in level.beginingcandles)
	{
		fxball = GetEnt(cnadle.target, "targetname");
		fxball Hide();
		fxballz = GetEnt(fxball.target, "targetname");
		fxballz Hide();
	}

	foreach(item in level.cakeandcandles)
	{
		item Hide();
	}

	level.begincandleamount = level.beginingcandles.size;
	level.candle153start = 0;
	level.cakecandleamount = level.cakeshootspots.size;
	level.candles153 = 0;

	level thread begincandledetect();
	level thread cakewait();


	foreach(item in level.beginingcandles)
	{
		item thread begincandledetect();
	}
}



function begincandledetect()
{
	self waittill("trigger", player);
	level.candle153start ++;
	fxball = GetEnt(self.target, "targetname");
	fxballz = GetEnt(fxball.target, "targetname");
	candlefx = util::spawn_model("tag_origin", fxball.origin);
	WAIT_SERVER_FRAME;
	candlelight = util::spawn_model("tag_origin", fxballz.origin);
	WAIT_SERVER_FRAME;
	PlayFXOnTag("explosions/fx_exp_grenade_spark_bounce", candlefx, "tag_origin");
	PlayFXOnTag("fire/fx_fire_candle_flame_med", candlefx, "tag_origin");
	PlayFXOnTag("dlc1/castle/fx_light_candle_flicker_castle", candlelight, "tag_origin");
	self PlaySound(randomignitesound());
	if(level.candle153start == level.begincandleamount)
	{
		level notify("candles153shot");
		foreach(item in level.cakeandcandles)
		{
			fxball = GetEnt(item.target, "targetname");
			PlayFXOnTag(level._effect["poltergeist"], fxball, "tag_origin");
			item Show();
		}
		seatinginteractfxzz = util::spawn_model("tag_origin", level.cakefinalfxlight.origin);
		WAIT_SERVER_FRAME;
		PlayFXOnTag(level._effect["poltergeist"], seatinginteractfxzz, "tag_origin");
	}
}

function cakewait(fxspot)
{
	level waittill("candles153shot");
	self waittill("trigger", player);
	level.candles153 ++;
	seatinginteractfxz = util::spawn_model("tag_origin", fxspot.origin);
	WAIT_SERVER_FRAME;
	PlayFXOnTag("explosions/fx_exp_grenade_spark_bounce", seatinginteractfxz, "tag_origin");
	PlayFXOnTag("fire/fx_fire_candle_flame_med", seatinginteractfxz, "tag_origin");
	self PlaySound(randomignitesound());
	if(level.candles153 == level.cakecandleamount)
	{
		seatinginteractfx = util::spawn_model("tag_origin", level.cakefinalfxlight.origin);
		WAIT_SERVER_FRAME;
		PlayFXOnTag("dlc1/castle/fx_light_candle_flicker_castle", seatinginteractfx, "tag_origin");
		level.cakefinalfxlight PlaySound("cake153soundtrig");
		wait(20);
		foreach(item in level.cakeshootspots)
		{
			fxball = GetEnt(item.target, "targetname");
			fxball Delete();
			item Delete();
		}

		foreach(cnadle in level.beginingcandles)
		{
			fxball = GetEnt(cnadle.target, "targetname");
			fxballz = GetEnt(fxball.target, "targetname");
			fxballz Delete();
			fxball Delete();
			cnadle Delete();
		}

		foreach(item in level.cakeandcandles)
		{
			item Delete();
		}
	}
}

function randomignitesound()
{
	soundname = "candleignite";
	randint = RandomIntRange(0,3);
	soundname = "candleignite0" + randint;
	return soundname;
}

function autoexec loadsquidgamestrings()
{
	level waittill("all_players_connected");
	level.customsgnames = array("[SWAG]Brynjar", "[EPIC]ZombusterFTW", "[4SKN]Fungus", "Kaz");
	level.customsgnamessounds = array("vox_brynjar_callout", "vox_zombuster_callout", "vox_fungus_callout", "vox_kaz_callout");
	level.customsgnamessubs = array("Brynjar","Zombuster", "Fungus", "Kaz");
	level.standardsgnamessounds = array("vox_player1_callout", "vox_player2_callout", "vox_player3_callout", "vox_player4_callout");
	level.standardsgnamessubs = array("Player 1", "Player 2", "Player 3", "Player 4");
}


function checkplayername()
{
	//plays sound on the threaded object after checking if the player was on the list
	//player is the threaded obj, play the announcement as a 2d soun on the startzone
	//if the player isn't on the list we take their character index and callout player 1 - 4
	//customsgnames = array("[SWAG]Brynjar", "[EPIC]ZombusterFTW", "[4SKN]Fungus", "Kaz");
	//customsgnamessounds = array("vox_brynjar_callout", "vox_zombuster_callout", "vox_fungus_callout", "vox_kaz_callout");
	//customsgnamessubs = array("Brynjar","Zombuster", "Fungus", "Kaz");
	//standardsgnamessounds = array("vox_player1_callout", "vox_player2_callout", "vox_player3_callout", "vox_player4_callout");
	//standardsgnamessubs = array("Player 1", "Player 2", "Player 3", "Player 4");
	for(i = 0; i < level.customsgnames.size; i++)
	{
		if(self.playername == level.customsgnames[i])
		{
			//level.squidgamestartzone PlaySoundWithNotify(customsgnamessounds[i], "soundfinished");
			thread zm_subtitles::subtitle_display(undefined, 2, "GameMaster", level.customsgnamessubs[i]);
			//level.squidgamestartzone waittill("soundfinished");
			//self notify("soundfinished");
			return level.customsgnamessounds[i];
		}
		wait(0.05);
	}
	//level.squidgamestartzone PlaySoundWithNotify(standardsgnamessounds[self.characterIndex], "soundfinished");
	thread zm_subtitles::subtitle_display(undefined, 2, "GameMaster", self.playername);
	//level.squidgamestartzone waittill("soundfinished");
	//self notify("soundfinished");
	return level.standardsgnamessounds[self.characterIndex];
}



function squidgamecards()
{
	//add card prefabs into the map, use trigger with a card model as its target
	level.squidgamecards = GetEntArray("squidgamecards", "targetname");
	level.squidgamecardscount = level.squidgamecards.size;
	foreach(card in level.squidgamecards)
	{
		//card UseTriggerRequireLookAt();
		card zm_unitrigger::create_unitrigger( "" , undefined, &unitrigger_prompt_and_visibilitylookat);
		//cardmodel = GetEnt(card.target, "targetname");
		card thread sqcardinteract();
	}
}


function sqcardinteract()
{
	while(1)
	{
		self waittill("trigger_activated", player);
		if(level.islevelbranch) continue;
		//Comment this for LIVE BUILD!! Causes teleport after one card pickup, also causes game to repeat at the start of a round if no players win since the nexus phone isn't set
		//level notify("allsquidgamecardsfound");
		//IPrintLnBold(""+level.squidgameplayercount);
		//temp sound
		self PlaySound("buttonpressaj_1");
		//PlayFXOnTag("explosions/fx_exp_grenade_spark_bounce", model, "tag_origin");
		self Delete();
		level.squidgamecardscount --;
		//IPrintLnBold(level.squidgamecardscount + " cards left.");
		if(level.squidgamecardscount == 0)
		{
			//start the game, I might add more to the preq
			//level notify("allsquidgamecardsfound");
			thread phoneeasteregg::findphonenearplayer(player, "squidgame");
		}
		//self Delete();
		break;
	}
}


function setupsquidgameee(int)
{
	//allow players to retry if nobody wins add bool for total game state and make them wait a round to play again if they fail
	//IPrintLnBold(""+players);
	if(level flag::get("solo_game"))
	{
		level.squidgameplayercount = 1;
		level.squidgamestaticcount = 1;
	}
	else
	{
		players = GetPlayers();
		level.squidgameplayercount = players.size;
		level.squidgamestaticcount = players.size;
	}
	/*
	else
	{
		for(i = 0; i < level.players.size; i++)
		{
			level.squidgameplayercount += 1;
			level.squidgamestaticcount += 1;
		}	
	}
	*/
	
	level.squidgamemaxtime = 11.0;
	level.squidgamemaxtimeredlight = 12.0;
	level.squidgamemintime = 2.0;
	level.sqgraceperiod = .7;
	level.sgprizemoney = 10000;
	level.sgrlgltimer = 120000 + 50000;
	servercurrenttime = 0;
	//level.sgrlgltimer = 113000; // this value is in miliseconds
	squidgamespots = struct::get_array("squidgamestartspots","targetname"); 
	squidgamereturnspots = struct::get_array("squidgamereturnspots","targetname");
	//we need to change lighting scape from 1 to zero, zero is power on. EE can't be completed unless the power is on so it will be set back to 0 at the end of the EE.
	//We want to start the light red and restrict player movement until the game "starts"
	squidgamefacefront = GetEnt("squidgameface", "targetname");
	squidgamefaceback = GetEnt("squidgamefaceback", "targetname");
	squidgamefaceback EnableLinkTo();
	squidgamefaceback LinkTo(squidgamefacefront);
	level.squidgamestartzone = GetEnt("squidgamestart","targetname");
	level.squidgamemidzone = GetEnt("squidgamemidzone","targetname");
	level.squidgameendzone = GetEnt("squidgameend","targetname");
	level.squidgamedeadplayers = 0;
	level.squidgamefinishedplayers = 0;
	wait(0.05);
	foreach(player in GetPlayers())
	{
		player.sgisalive = true;
		player.sgfinish = false;
	}
	//waittill prereq ee complete
	level waittill("allsquidgamecardsfound");
	level thread enablezombies(false);
	//level flag::clear( "zombie_drop_powerups");
	//level flag::clear( "spawn_zombies" );
	level thread killallzs();
	//IPrintLnBold(""+level.squidgameplayercount);
	level notify("videoscreenquest");
	foreach(player in GetPlayers())
	{
		player DisableOffhandWeapons();
		player DisableWeapons();
		player thread lui::screen_flash( 0.1, 0.1, 4.0, 1.0, "white" );
		player PlayLocalSound("clock_complete_00");
		player flagsys::set( "playing_movie_hide_hud" );
		player util::show_hud( 0 );
	}
	wait(0.5);
	foreach(player in GetPlayers())
	{
        player shellshock( "explosion", 2);
        player.ignoreme = true;
        player notify("stop_player_out_of_playable_area_monitor");
	}
	foreach(player in GetPlayers())
	{
		player thread confirmteleportsg(squidgamespots, 0);
	}
	level util::set_lighting_state(1);
	level.squidgameendzone thread sgcheckplayerfinish();
	//We check an int that becomes larger after the first time this function runs, so we skip the squid tutorial after the player plays the game atleast once.
	if(int == 0)
	{
		//game introduction here
		wait(5);
		level.squidgamestartzone PlaySound("sgmaintheme");
		level.squidgamestartzone PlaySoundWithNotify("vox_rlglrules1_sg", "soundfinished");
		thread zm_subtitles::subtitle_display(undefined, 2, "GameMaster", "You may move during greenlight, but if the head sees you move during redlight you will be eliminated.");
		level.squidgamestartzone waittill("soundfinished");
		wait(1);
		level.squidgamestartzone PlaySound("vox_rlglrules2_sg");
		thread zm_subtitles::subtitle_display(undefined, 2, "GameMaster", "The prize pool is: " + level.sgprizemoney + " points.");
		wait(3.5);
		level.squidgamestartzone PlaySoundWithNotify("vox_rlglrules3_sg", "soundfinished3");
		thread zm_subtitles::subtitle_display(undefined, 2, "GameMaster", "It can be given to a single player or split depending on how many players successfully finish.");
		level.squidgamestartzone waittill("soundfinished3");
		wait(1);
		level.squidgamestartzone PlaySoundWithNotify("vox_rlglrules4_sg", "soundfinished4");
		thread zm_subtitles::subtitle_display(undefined, 2, "GameMaster", "Remember if you fail to finish within the time limit, you will also will be eliminated. The game will begin shortly.");
		level.squidgamestartzone waittill("soundfinished4");
		wait(3);
	}
	
	//write better intro later
	//play round squid game music
	//level.squidgamestartzone StopLoopSound(1);
	level.squidgamestartzone PlaySound("seconds3count");
	wait(0.3);
	VideoStart("squidgamestartcountdown", false);
	IPrintLnBold("3");
	wait(.7);
	IPrintLnBold("2");
	wait(1);
	IPrintLnBold("1");
	wait(1);
	//VideoStop("squidgamestartcountdown");
	level notify("squidgamestarted");
	//end intro
	//get the current time and add on to create the timer, previously 2:50 minutes now 1:53 minutes
	//120000 + 50000 2:50 min
	//change to 1:53 seconds
	//1:53 to ms 113000
	servercurrenttime = level.sgrlgltimer + GetTime();
	randtime = 0;
	VideoStart("squidtimer250",false);
	// && level.squidgameplayercount > 0
	while(GetTime() < servercurrenttime && level.squidgameplayercount > 0)
	{
		//IPrintLnBold(""+level.squidgameplayercount);
		//start greenlight
		level.squidgamestartzone PlaySound("sggreenlight");
		IPrintLnBold("Greenlight");
		squidgamefacefront RotateYaw(180, level.sqgraceperiod);
		//change lighting scape
		level util::set_lighting_state(0);
		//generate the random time between 2 and 7
		randtime = RandomFloatRange(level.squidgamemintime, level.squidgamemaxtime);
		//wait for that time
		wait(randtime);
		level.squidgamestartzone PlaySound("sgredlight");
		//go to red light state
		IPrintLnBold("Redlight");
		//change lighting scape
		level util::set_lighting_state(1);
		//generate a new random time for redlight duration
		//set grace period and time for "watcher" to turn around
		squidgamefacefront RotateYaw(180, level.sqgraceperiod);
		wait(level.sqgraceperiod);
		level thread sgcheckplayervelocity();
		randtime = RandomFloatRange(level.squidgamemintime, level.squidgamemaxtimeredlight);
		//wait for that time and reiterate
		wait(randtime);
		level notify("sqendredlight");
	}
	VideoStop("squidtimer250");
	VideoStart("squidgameover",true);
	//time up go back to red light
	//make sure to go back to this lighting state after the game is concluded
	level util::set_lighting_state(0);
	level notify("squidgameended");
	//play squidgaurd music here
	level.squidgamestartzone PlaySound("sgmaintheme");
	wait(5);	
	//level thread sgtimeoutcheckplayers();
	sgtimeoutcheckplayers();
	//level waittill("failedsgplayerskilled");
	//level.squidgamestartzone PlaySound("");
	players = GetPlayers();
	foreach(player in players)
	{
		if(player.sgfinish == true)
		{
			//player waittill("soundfinished");
			level.squidgamestartzone PlaySound(player checkplayername());
			wait(1);
			level.squidgamestartzone PlaySoundWithNotify("vox_survivedthesquidgame_sg", "soundfinished");
			thread zm_subtitles::subtitle_display(undefined, 2, "GameMaster", "Survived The SQUIDGAME.");
			level.squidgamestartzone waittill("soundfinished");
			//IPrintLnBold(player.playername + " survived the SQUIDGAME");
		}
		else
		{
			//player waittill("soundfinished");
			level.squidgamestartzone PlaySound(player checkplayername());
			wait(1);
			level.squidgamestartzone PlaySoundWithNotify("vox_diedinthesquidgame_sg", "soundfinished");
			thread zm_subtitles::subtitle_display(undefined, 2, "GameMaster", "Died In The SQUIDGAME.");
			level.squidgamestartzone waittill("soundfinished");
			//IPrintLnBold(player.playername + " died in the SQUIDGAME");
		}
		wait(1);
	}

	if(level.squidgamedeadplayers == level.squidgamestaticcount)
	{
		level.squidgamestartzone PlaySoundWithNotify("vox_nosurvivors_sg", "soundfinished");
		thread zm_subtitles::subtitle_display(undefined, 2, "GameMaster", "There were no survivors.");
		level.squidgamestartzone waittill("soundfinished");
		//IPrintLnBold("There were no survivors.");
	}
	if(level.squidgamefinishedplayers == 1)
	{
		foreach(player in players)
		{
			if(player.sgfinish == true)
			{
				level.squidgamestartzone PlaySound(player checkplayername());
				wait(1);
				level.squidgamestartzone PlaySoundWithNotify("vox_solesurvivor_sg", "soundfinished");
				thread zm_subtitles::subtitle_display(undefined, 2, "GameMaster", "Takes the whole pot of " +level.sgprizemoney+" points!");
				level.squidgamestartzone waittill("soundfinished");
			}	//IPrintLnBold(player.playername + " takes the whole pot of "+level.sgprizemoney+" points!");
		}
	}
	level thread sgreward();
	//wait like 15 seconds
	wait(11);
	//level.squidgamestartzone StopLoopSound(1);
	//add noahj456 to list and make a seperate squid game where he has to make the firebow tutorial
	foreach(player in GetPlayers())
	{
		player thread lui::screen_flash( .1, 0.1, 1.0, 1.0, "white" );
		player thread confirmteleport(squidgamereturnspots, 1);
		player PlayLocalSound("success");
		player thread zm::player_out_of_playable_area_monitor();
		player EnableOffhandWeapons();
		player EnableWeapons();
		player.ignoreme = false;
		player flagsys::clear( "playing_movie_hide_hud" );
		player util::show_hud( 1 );
	}
	VideoStop("squidgameover");
	wait(3);
	level notify("videoscreenquestended");
	level notify("squidgameisnowoverbakak");
	//level flag::set( "zombie_drop_powerups");
	//level flag::set( "spawn_zombies" );
	wait(3);
	level thread enablezombies(true);
}



function sgtimeoutcheckplayers()
{
	//level.failsquidgamespots = struct::get_array("squidgamedeathspots","targetname");
	players = GetPlayers();
	if(level flag::get("solo_game"))
	{
		foreach( player in players)
		{
			if(player.sgfinish == false && player.sgisalive == true)
			{
				player PlaySound("sggunshot"); 
				PlaySoundAtPosition("sgdeathnoise", player.origin);
				level.squidgamedeadplayers ++;
				player.sgisalive = false;
				player thread lui::screen_flash( .1, 0.1, 3.0, 2.0, "black" );
				thread PlayFxWithCleanup("zombie/fx_spawn_blood_rise_doa", player.origin);
				level.squidgameplayercount --;
				wait(0.3);
				player thread confirmteleport(level.failsquidgamespots, 1);
				//IPrintLnBold(player.playername + " was eliminated");
				level.squidgamestartzone PlaySound(player checkplayername());
				wait(.5);
				level.squidgamestartzone PlaySoundWithNotify("vox_eliminated_sg", "soundfinished");
				thread zm_subtitles::subtitle_display(undefined, 2, "GameMaster", "Was eliminated.");
				level.squidgamestartzone waittill("soundfinished");
				
				wait(1);
			}
		}
	}
	else
	{
		for(i = 0; i < players.size; i++)
		{
			if(players[i].sgfinish == false && players[i].sgisalive == true)
			{
				players[i] PlaySound("sggunshot"); 
				PlaySoundAtPosition("sgdeathnoise", players[i].origin);
				level.squidgamedeadplayers += 1;
				players[i].sgisalive = false;
				players[i] thread lui::screen_flash( .1, 0.1, 3.0, 2.0, "black" );
				thread PlayFxWithCleanup("zombie/fx_spawn_blood_rise_doa", players[i].origin);
				level.squidgameplayercount -= 1;
				wait(0.3);
				players[i] thread confirmteleport(level.failsquidgamespots, 1);
				level.squidgamestartzone PlaySound(players[i] checkplayername());
				wait(0.5);
				level.squidgamestartzone PlaySoundWithNotify("vox_eliminated_sg", "soundfinished");
				thread zm_subtitles::subtitle_display(undefined, 2, "GameMaster", "Was eliminated.");
				level.squidgamestartzone waittill("soundfinished");
				
			}
		}
	}
	//level notify("failedsgplayerskilled");
}

function sgcheckplayerfinish()
{
	level endon("squidgameended");
	while(1)
	{
		self waittill("trigger", player);
		if(!player.sgfinish)
		{
			player thread handleplayerfinish();
			
		}
		WAIT_SERVER_FRAME;
	}
}

function handleplayerfinish()
{
	level.squidgameplayercount -= 1;
	level.squidgamefinishedplayers += 1;
	//IPrintLnBold(player.playername + " finished");
	self.sgfinish = true;
	thread PlayFxWithCleanup(level._effect["powerup_grabbed"], self.origin, 1.5);
	level.noplayerswonsg = true;
	//self thread checkplayername();
	level.squidgamestartzone PlaySound(self thread checkplayername());
	wait(0.5);
	level.squidgamestartzone PlaySoundWithNotify("vox_finished_sg", "soundfinished");
	thread zm_subtitles::subtitle_display(undefined, 2, "GameMaster", "Finished.");
	level.squidgamestartzone waittill("soundfinished");
}

/*
function customsoundsystem(string)
{
	level.customsoundstackcount
	if(level.iscustomsoundsystemplaying == false)
	{
		if(string == "sg_elim")
		{
			self thread checkplayername();
			self waittill("soundfinished");
			level.squidgamestartzone PlaySoundWithNotify("vox_eliminated_sg", "soundfinished");
			thread zm_subtitles::subtitle_display(undefined, 2, "GameMaster", "Was eliminated.");
			level.squidgamestartzone waittill("soundfinished");
		}
		else if(string == "sg_finish")
		{

		}
	}
	else
	{

	}
//Come back to this later, idea to have a sound system than can play one sound at a time and play the ones after it after the first sound in the list completes
}
*/


function sgcheckplayervelocity()
{
	level endon("sqendredlight");
	players = GetPlayers();
	zerovector = (0, 0, 0);
	zerovectorlength = LengthSquared(zerovector);
	while(1)
	{
		for(i = 0; i < players.size; i++)
		{
			playervelocity = players[i] GetVelocity();
			playervelocity = LengthSquared(playervelocity);
			if(!players[i].sgfinish && players[i].sgisalive && (playervelocity > zerovectorlength) && ((players[i] IsTouching(level.squidgamemidzone) || players[i] IsTouching(level.squidgamestartzone))))
			{
				players[i] thread playerhandlemovementelim();
				//players[i] thread customsoundsystem("sg_elim");
			}
		}
		WAIT_SERVER_FRAME;
	}
}

function playerhandlemovementelim()
{
	self PlaySound("sggunshot"); 
	PlaySoundAtPosition("sgdeathnoise", self.origin);
	level.squidgamedeadplayers += 1;
	self.sgisalive = false;
	self thread lui::screen_flash( .1, 0.1, 3.0, 2.0, "black" );
	thread PlayFxWithCleanup("zombie/fx_spawn_blood_rise_doa", self.origin);
	level.squidgameplayercount -= 1;
	wait(0.2);
	self thread confirmteleport(level.failsquidgamespots, 1);
	level.squidgamestartzone PlaySound(self thread checkplayername());
	wait(1);
	level.squidgamestartzone PlaySoundWithNotify("vox_eliminated_sg", "soundfinished");
	thread zm_subtitles::subtitle_display(undefined, 2, "GameMaster", "Was eliminated.");
}

function confirmteleportsg(structarray, int)
{
	self SetOrigin(structarray[self.characterIndex].origin);
	self SetPlayerAngles(structarray[self.characterIndex].angles);
	self setstance( "stand" ); 
	self AllowJump(false);
	self SetMoveSpeedScale(0);
	if(int == 0)
	{
		level waittill("squidgamestarted");
	}
	self AllowJump(true);
	self SetMoveSpeedScale(1);
}

function sgreward()
{
	if(level.squidgamefinishedplayers == 0)
	{
		return;
	}
	else
	{
		level.dividedprizemoney = level.sgprizemoney/level.squidgamefinishedplayers;
		players = GetPlayers();
		for(i = 0; i < players.size; i++)
		{
			if(players[i].sgfinish == true)
			{
				players[i] PlayLocalSound("cha_ching");
				thread PlayFxWithCleanup(level._effect["powerup_grabbed"], players[i].origin);
				players[i] zm_score::add_to_player_score(level.dividedprizemoney);
				players[i] thread zm_perks::give_random_perk();
			}
		}
	}
}

//make tomoorow
function autoexec popcatbautistasetup()
{
	//level waittill("initial_blackscreen_passed");
	level.popcattimer = 3;
	level.ihopdeliverycost = 2000;
	level.ihopcatcooldown = 40;
	level.maxihoptraveltime = 11;
	level.minihoptraveltime = 8;
	level.bautistatime = 10;
	level.rewardclaimtimelimit = 30;
	level.keycarddisappear = "dlc1/castle/fx_elec_teleport_flash_sm";
	level.soulsuccfx2 = "dlc1/castle/fx_wisp_tendril_loop";
	level.meteortrailfx = "zombie/fx_meatball_trail_sky_zod_zmb";
	level.meteorimpactfx = "dlc5/moon/fx_meteorite_debris_impact";
	level.meteorspawnfx = "dlc5/moon/fx_moon_qbomb_explo_distort";
	level.catchargedaura = "dlc1/castle/fx_wolf_quest_platform_glow_loop";
	popcatspawnspots = struct::get_array("popcatspawnspots","targetname");
	level.ihopdeliveryspots = struct::get_array("ihopdeliveryspots","targetname");
	level.ihopmeteorspots = struct::get_array("ihopmeteorspot","targetname");
	level.ihoprandomweaponnames = array("The Genshin Impacter", "PPSH-41", "Small Chungus", "The Mauser", "The Olympia", "The Path Of Sorrows");
	level.ihoprandomweaponignnames = array("ar_stg44", "smg_ppsh", "smg_nailgun", "pistol_c96", "shotgun_olympia", "melee_katana");
	level.randomlorestrings = array("You've done this countless times, haven't you?", "He lies to you.", "You are being held against your will.", "The loop isn't without consequences.", "The burger is your ticket out of here.", "Cheytrium did this.");
	popcatinteracttrigger = GetEnt("ihoporderinteract","targetname");
	level.popcathubmodel = GetEnt("mainpopcat", "targetname");
	level.popcathubmodel Hide();
	level.popcathubmodel.shouldbevisible = false;
	level waittill("playercoveredinoil");
	radius = spawn( "trigger_radius", popcatinteracttrigger.origin, 1, 50, 50);
	while(1)
	{
		radius waittill("trigger", player);
		if(IsPlayer(player) && !level.islevelbranch)
		{
			break;
		}
		WAIT_SERVER_FRAME;
	}
	radius Delete();
	level.popcathubmodel.shouldbevisible = true;
	popcatinteracttrigger thread startpopcatsequence(level.popcathubmodel, popcatspawnspots);
}

function startpopcatsequence(model, structarray)
{
	level endon("popcattimerfail");
	level.popcatmodels = array();
	thread PlayFxWithCleanup(level.keycarddisappear, level.popcathubmodel.origin, 1.5);
	level.popcathubmodel PlaySound("keycardteleinlarge");
	wait(0.2);
	level.popcathubmodel Show();
	self SetHintString("????");
	self waittill("trigger", player);
	self SetHintString("");
	self PlaySound(returnmeow());
	thread PlayFxWithCleanup(level.keycarddisappear, level.popcathubmodel.origin, 1.5);
	level.popcathubmodel PlaySound("keycardteleinlarge");
	wait(0.2);
	level.popcathubmodel Hide();
	wait(1);
	//randomize the array
	popcatspotsarray = array::randomize(structarray);
	for(i = 0; i < popcatspotsarray.size/2; i++)
	{
		level thread popcattimerfunc(level.popcattimer, self, model, structarray);
		//spawn model wait a server frame, add the model to the popcat array, play sound and fx, wait for damage, play out fx and sound and delete it
		popcat = util::spawn_model("popcatchilis", popcatspotsarray[i].origin);
		WAIT_SERVER_FRAME;
		//popcat SetScale(2.0);
		//angles = popcatspotsarray[i] GetTagAngles();
		//popcat RotateYaw(popcatspotsarray[i].angles.z, 0.05);
		popcat RotateTo(popcatspotsarray[i].angles, 0.05);
		array::add(level.popcatmodels, popcat);
		thread PlayFxWithCleanup(level.keycarddisappear, popcat.origin, 1);
		popcat PlaySound("keycardtelein");
		popcat SetCanDamage(true);
		popcat waittill( "damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel );
		level thread notifyallplayers("popcattimersuccess");
		level notify("popcattimersuccess");
		//level notify("popcattimersuccess");
		thread PlayFxWithCleanup(level.keycarddisappear, popcat.origin, 1);
		popcat PlaySound("keycardteleinlarge");
		popcat Delete();
		//level thread popcattimerfunc(level.popcattimer, self, model, structarray);
		wait(1);
	}
	//if we get here the player completed it in the alloted time
	//notify to kill the timer
	level thread notifyallplayers("popcattimersuccess");
	level notify("popcattimersuccess");
	//Give the player time to interact with the cat, if they fail to do so in the alloted time they must restart the entire process.
	level thread popcattimerfunc((level.popcattimer*2), self, model, structarray);
	PlaySoundAtPosition("sg_success", (0,0,0));
	wait(1);
	level.popcathubmodel Show();
	thread PlayFxWithCleanup(level.keycarddisappear, level.popcathubmodel.origin, 1);
	model PlaySound("keycardteleinlarge");
	self SetHintString("Press ^2[{+activate}]");
	self waittill("trigger", player);
	self SetHintString("");
	level notify("popcattimersuccess");
	level thread notifyallplayers("popcattimersuccess");
	fxspot = util::spawn_model("tag_origin", level.popcathubmodel.origin);
	fxspot EnableLinkTo();
	fxspot LinkTo(level.popcathubmodel);
	WAIT_SERVER_FRAME;
	PlayFXOnTag(level.soulsuccfx2, fxspot, "tag_origin");
	fxspot PlayLoopSound("soulambloop", 0.5);
	fxspot StopLoopSound(1);
	model SetModel("popcatchilisgold");
	growsize = 0.5;
	level.popcathubmodel MoveZ(7, 2);
	level.popcathubmodel PlayLoopSound("soulambloop", 0.5);
	wait(2);
	popcatorigin = level.popcathubmodel.origin;
	//level.popcathubmodel MoveZ(5, 1.5);
	//level thread shakemodel(level.popcathubmodel, 0.5, 15, "shakeend");
	level.popcathubmodel Vibrate((100,100,100), 1, 0.3, 2);
	level.popcathubmodel SetModel("popcatchilisgold");
	level.popcathubmodel PlaySound("orb_start_move");
	for(i = 0; i < 25; i++)
	{
		growsize += 0.02;
		level.popcathubmodel SetScale(growsize);
		wait(0.05);
	}
	level notify("shakeend");
	level.popcathubmodel MoveTo(popcatorigin, 1.5);
	PlaySoundAtPosition("success", (0,0,0));
	fxspot Delete();
	level.popcathubmodel StopLoopSound(1);
	self thread ihopdeliveryfunc();
}

function notifyallplayers(str_notify)
{
	foreach(player in GetPlayers())
	{
		player notify(str_notify);
	}
}

function spincat(speed, stringnotify)
{
	level endon(stringnotify);
	self endon("death");
	while(1)
	{
		self RotateYaw(360, speed);
		wait(speed);
	}
}

function spawncatfxandspin(speed, stringnotify)
{
	level.popcathubmodel MoveZ(7, 2);
	level.popcathubmodel PlayLoopSound("popcatloop");
	moguseffect = util::spawn_model("tag_origin", level.popcathubmodel.origin);
	WAIT_SERVER_FRAME;
	PlayFXOnTag(level.catchargedaura, moguseffect, "tag_origin");
	popcatangles = level.popcathubmodel.angles;
	level.popcathubmodel thread spincat(speed, stringnotify);
	level waittill(stringnotify);
	level.popcathubmodel RotateTo(popcatangles, 2);
	level.popcathubmodel StopLoopSound(1.5);
	moguseffect Delete();
	level.popcathubmodel MoveZ(-7, 2);
}

function returnmeow()
{
	meow = array("wafflesmeow00", "wafflesmeow01", "wafflesmeow02", "wafflesmeow03");
	meowint = RandomInt(meow.size);
	return meow[meowint];
}

function ihopdeliveryfunc()
{
	level endon("intermission");
	while(1)
	{
		level thread spawncatfxandspin(4, "popcatcooldown");
		wait(2);
		self SetHintString("Press ^2[{+activate}]^7 To Have IHOP Delivered [Cost: "+ level.ihopdeliverycost + "]");
		self SetCursorHint("HINT_NOICON");

		while(1)
		{
			self PlaySound(returnmeow());
			self waittill("trigger", player);
			if(player.score >= level.ihopdeliverycost)
			{
				player zm_score::minus_to_player_score( level.ihopdeliverycost );
				player PlaySound("cha_ching");
				level notify("popcatcooldown");
				break;
			}
			else
			{
				self SetHintString(player.playername + " lacks the required funds.");
				//temp change later
				player PlayLocalSound("defaultfail");
				wait(1);
				self SetHintString("Press ^2[{+activate}]^7 To Have IHOP Delivered [Cost: "+ level.ihopdeliverycost + "]");
			}
		}
		earthQuake(.1, 3, self.origin, 750);
		self PlaySound(returnmeow());
		//play waffles meow here
		//self PlaySound("waffles_meow");
		self SetHintString(player.playername + "'s IHOP order is inbound.");
		//order comes in from the portal? phases through ceiling, takes 5-10 seconds to arrive
		level thread spawnihopitem();
		level waittill("ihopdeliveryarrived");
		self SetHintString("Your order has been delivered. Find it before he does...");
		level waittill("ihopdeliverypickedup");
		self SetHintString("Waffles is cooling down...");
		fxspot = util::spawn_model("tag_origin", level.popcathubmodel.origin);
		fxspot EnableLinkTo();
		fxspot LinkTo(level.popcathubmodel);
		WAIT_SERVER_FRAME;
		PlayFXOnTag(level.soulsuccfx2, fxspot, "tag_origin");
		fxspot PlayLoopSound("soulambloop", 0.5);
		wait(level.ihopcatcooldown-2);
		fxspot Delete();
		fxspot StopLoopSound(1);
		self PlaySound(returnmeow());
		//self PlaySound("waffles_meow");
	}
}

function spawnihopitem()
{
	level endon("bautistastoleihop");
	//find a random spot to spawn the item on in the sky, and its target spot
	skyspawnint = RandomInt(level.ihopmeteorspots.size);
	tabletargetint = RandomInt(level.ihopdeliveryspots.size);
	traveltime = RandomFloatRange(level.minihoptraveltime, level.maxihoptraveltime);
	deliveryitem = util::spawn_model("p7_ihop_bag", level.ihopmeteorspots[skyspawnint].origin);
	deliveryitemfx = util::spawn_model("tag_origin", deliveryitem.origin);
	deliveryitemfx EnableLinkTo();
	deliveryitemfx LinkTo(deliveryitem);
	WAIT_SERVER_FRAME;
	thread PlayFxWithCleanup(level.meteorspawnfx, deliveryitem.origin, 3);
	PlaySoundAtPosition("portalexplodesee", deliveryitem.origin);
	wait(0.2);
	deliveryitem PlaySound("ihopspawnsound");
	deliveryitem PlayLoopSound("meteorloopsound");
	deliveryitem thread chaoticmodelspin("itemlanded", traveltime/8);
	PlayFXOnTag(level.meteortrailfx, deliveryitemfx, "tag_origin");
	deliveryitem MoveTo(level.ihopdeliveryspots[tabletargetint].origin + ( 0, 0, -9), traveltime);
	wait(traveltime/2);
	deliveryitem PlaySound("ihopspawnsound");
	wait(traveltime/2);
	//deliveryitem MoveZ(-10, 0.05);
	level notify("ihopdeliveryarrived");
	deliveryitem notify("itemlanded");
	deliveryitem PlaySound("ihopcrashdown");
	radiusmeteor = spawn( "trigger_radius", deliveryitem.origin, 0, 40, 80);
	foreach(player in GetPlayers())
	{
		if(player IsTouching(radiusmeteor))
		{
			player ShellShock("electrocution", 3);
		}
	}
	zombs = getaispeciesarray("axis","all");
      for(k=0;k<zombs.size;k++)
      {
        if( zombs[k] IsTouching( radiusmeteor ) )
        {
          zombs[k] Kill();
        }
      }
      radiusmeteor Delete();
	deliveryitem RotateTo(level.ihopdeliveryspots[tabletargetint].angles, 0.05);
	thread PlayFxWithCleanup(level.meteorimpactfx, deliveryitem.origin, 3);
	earthQuake(.6, 3, deliveryitem.origin, 750);
	deliveryitemfx Delete();
	//spawn the bautista here
	//triguse = Spawn( "trigger_radius_use", level.ihopdeliveryspots[tabletargetint].origin, 0, 80, 80); 
	trigger = Spawn( "trigger_radius_use", level.ihopdeliveryspots[tabletargetint].origin + ( 0, 0, 0 ), 0, 60, 90 );
	level thread ihopbautistatimer(deliveryitem, level.bautistatime, "playergrabbedihop", trigger);
	WAIT_SERVER_FRAME;
	trigger UseTriggerRequireLookAt();
	trigger SetVisibleToAll();
	trigger SetTeamForTrigger( "none" );
	trigger TriggerIgnoreTeam();
	trigger SetCursorHint("HINT_NOICON");
	trigger SetHintString("Press ^2[{+activate}]^7 To Claim This IHOP And Ward Him Off..");
	trigger waittill("trigger", player);
	deliveryitem StopLoopSound(0.5);
	deliveryitem PlaySound("meteorpickupsound");
	
	level notify("playergrabbedihop");
	IPrintLnBold(player.playername + " Warded Him Off...");
	wait(1);
	//add random reward, random perk, gun, ee item, points, etc
	trigger SetHintString("Press ^2[{+activate}]^7 To Claim Reward");
	trigger waittill("trigger", player);
	thread PlayFxWithCleanup(level._effect["powerup_grabbed"], deliveryitem.origin, 1.5);
	trigger thread spawnihopreward(deliveryitem, "ihopdeliverypickedup", player);
	//deliveryitem Delete();
	//trigger Delete();
	//level notify("ihopdeliverypickedup");
}

function rewardclaimtimer(time, trig, model, notifystring)
{
	level endon(notifystring);
	wait(time);
	thread PlayFxWithCleanup(level._effect["powerup_grabbed"], model.origin, 1.5);
	PlaySoundAtPosition("pwrupgrab", model.origin);
	trig Delete();
	model Delete();
	level notify(notifystring);
	level notify("rewardtimerihopexpired");
}

function spawnihopreward(deliveryitem, notifystring, storedplayer)
{
	level endon("rewardtimerihopexpired");
	rewardint = RandomInt(5);
	//for testing comment later.
	//rewardint = 4;
	level thread rewardclaimtimer(level.rewardclaimtimelimit, self, deliveryitem, notifystring);
	switch(rewardint)
	{
		case 0:
		{
			gunint = RandomInt(level.ihoprandomweaponnames.size);
			weapon = GetWeapon(level.ihoprandomweaponignnames[gunint]);
			deliveryitem SetModel(weapon.worldModel);
			deliveryitem thread powerupfxandbigspin("killitem");
			self SetHintString("Press ^2[{+activate}]^7 To Claim " + level.ihoprandomweaponnames[gunint]);
			self waittill("trigger", player);
			deliveryitem notify("killitem");
			player PlaySound("buypickup");
    		player zm_weapons::weapon_give(weapon, false, false, true, true );
    		break;
		}
		case 1:
		{
			//give a player between 500 and 3000 points
			randomPoints = RandomIntRange(1900, 3500);
			deliveryitem SetModel("zombietron_gold_bricks");
			deliveryitem thread powerupfxandbigspin("killitem");
			self SetHintString("Press ^2[{+activate}]^7 To Claim Points");
			self waittill("trigger", player);
			deliveryitem notify("killitem");
			player zm_score::add_to_player_score(randomPoints);
			player PlaySound("cha_ching");
			break;

		}
		case 2:
		{
			//chungus scare, will be replaced with ee thingy
			randomPoints = RandomIntRange(500, 750);
			deliveryitem MoveZ(10, 0.05);
			randomLoreNum = RandomInt(level.randomlorestrings.size);
			self SetHintString(level.randomlorestrings[randomLoreNum]);
			//self waittill("trigger", player);
			storedplayer shellshock( "electrocution", 3);
			//PlayFX("dlc4/genesis/fx_corrupteng_pillar_ember_top_red", deliveryitem.origin);
			thread PlayFxWithCleanup("zombie/fx_exp_rpg_red_doa", deliveryitem.origin, 1.5);
			deliveryitem SetModel("aml_fish_market_02");
			storedplayer zm_score::minus_to_player_score(randomPoints);
			storedplayer PlaySound("chungrealityscare");
			wait(2);
			//PlayFX("dlc4/genesis/fx_corrupteng_pillar_ember_top_red", deliveryitem.origin);
			deliveryitem Delete();
			break;
		}
		case 3:
		{
			deliveryitem SetModel("p7_zm_zod_magicians_drink_bottle");
			deliveryitem thread powerupfxandbigspin("killitem");
			self SetHintString("Press ^2[{+activate}]^7 To Claim A Random Perk");
			self waittill("trigger", player);
			player thread zm_perks::give_random_perk();
			deliveryitem notify("killitem");
			break;
		}
		case 4:
		{
			deliveryitem SetModel("aml_gen_raven_flying_01_low_fb_cin");
			deliveryitem thread powerupfxandbigspin("killitem");
			self SetHintString("Press ^2[{+activate}]^7 To Claim A Random Powerup");
			self waittill("trigger", player);
			player thread zm_powerups::special_powerup_drop(player.origin);
			deliveryitem notify("killitem");
			break;
		}
		default:
		{
			//give a player between 500 and 3000 points
			randomPoints = RandomIntRange(300, 2500);
			deliveryitem SetModel("zombietron_gold_bricks");
			deliveryitem thread powerupfxandbigspin("killitem");
			self SetHintString("Press ^2[{+activate}]^7 To Claim Points");
			self waittill("trigger", player);
			deliveryitem notify("killitem");
			player zm_score::add_to_player_score(randomPoints);
			player PlaySound("cha_ching");
			break;
		}
	}
	level notify(notifystring);
	self SetHintString("");
	self Delete();
}


function powerupfxandbigspin(stringnotify)
{
	self MoveZ(15, 3);
	thread PlayFxWithCleanup(level._effect["powerup_grabbed"], self.origin, 1.5);
	self PlaySound("pwrupspawn");
	self PlayLoopSound("pwruploop", 1.5);
	PlayFXOnTag("zombie/fx_powerup_on_solo_zmb", self, "tag_origin");
	self thread infinitespin();
	self waittill(stringnotify);
	self PlaySound("pwrupgrab");
	self StopLoopSound(0.5);
	thread PlayFxWithCleanup(level._effect["powerup_grabbed"], self.origin, 1.5);
	self Delete();
}

function ihopbautistatimer(model, time, stringnotify, trigger)
{
	//add bautista flat pic that moves towards item overtime, explodes if player interacts
	level endon(stringnotify);
	bautistamodel = util::spawn_model("p7_cai_igc_monitor_flat_bautista", model.origin + (700, 700, 0));
	WAIT_SERVER_FRAME;
	newRotate = VectortoAngles(model.origin - bautistamodel.origin);
	bautistamodel RotateTo(newRotate, 0.05);
	WAIT_SERVER_FRAME;
	bautistamodel RotateYaw(-90, 0.05);
	thread PlayFxWithCleanup("zombie/fx_exp_rpg_red_doa", bautistamodel.origin, 2);
	bautistamodel thread deletebautistatimer(stringnotify);
	bautistamodel MoveTo(model.origin, time);
	wait(time);
	//IPrintLnBold("IHOP was stolen");
	PlaySoundAtPosition("draxlaugh", model.origin);
	thread PlayFxWithCleanup(level.meteorimpactfx, model.origin, 2);
	model Delete();
	trigger Delete();
	bautistamodel Delete();
	thread PlayFxWithCleanup("zombie/fx_exp_rpg_red_doa", bautistamodel.origin, 2);
	level notify("bautistastoleihop");
	level notify("ihopdeliverypickedup");
}

function deletebautistatimer(stringnotify)
{
	level endon("bautistastoleihop");
	level waittill(stringnotify);
	thread PlayFxWithCleanup("zombie/fx_exp_rpg_red_doa", self.origin, 2);
	self MoveTo(level.bautistaorigin, 0.05);
	self Delete();
}

function chaoticmodelspin(notifystring, time)
{
	self endon(notifystring);
	self endon("death");
	while(1)
	{
		self RotateYaw(360, time);
		self RotateRoll(360, time);
		self RotatePitch(360, time);
		wait(time);
	}
}


function shakemodel(model, speed, amount, notifystring)
{
	level endon(notifystring);
	while(1)
	{
		model MoveTo((model.origin.x + sin(speed * amount)), (model.origin.y + sin(speed * amount)), (model.origin.z + sin(speed * amount)), speed);
		wait(speed);
	}

}

function popcattimerfunc(timer, trig, model, structarray)
{
	level endon("popcattimersuccess");
	foreach(player in GetPlayers())
	{
		player thread lui::timer(timer, "popcattimersuccess");
	}
	wait(timer);
	trig SetHintString("");
	if(timer == level.popcattimer*2)
	{
		IPrintLnBold("Interact with Waffles before he disapears!");
	}
	level notify("popcattimerfail");
	//fail sound
	PlaySoundAtPosition("defaultfail", (0,0,0));
	//delete all spawned cats
	foreach(popcat in level.popcatmodels)
	{
		thread PlayFxWithCleanup(level.keycarddisappear, popcat.origin, 2);
		popcat PlaySound("keycardtelein");
		popcat Delete();
	}
	wait(3);
	trig thread startpopcatsequence(model, structarray);
}

