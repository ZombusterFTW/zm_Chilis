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

//#using scripts\zm\zm_chilis;
#using scripts\_NSZ\roomserviceeasteregg;
#using scripts\_redspace\rs_o_jump_pad;
//#using scripts\zm\_zm_ai_mechz;
#using scripts\_NSZ\randomeastereggscustomaj;


#precache( "fx", "zombie/fx_spawn_blood_rise_doa" );
#precache( "fx", "zombie/fx_powerup_on_red_zmb" );
#precache( "fx", "zombie/fx_powerup_on_green_zmb" );
#precache( "fx", "zombie/fx_spawn_blood_rise_doa" );

function autoexec setupphones()
{
	level waittill("initial_blackscreen_passed");
	level thread playersdidntwinsg();
	level.eephonetrigs = GetEntArray("eephonetrigarray", "targetname");
	level.phoneupstairsdetect = GetEnt("phonetrigupstairsdetect", "targetname");
	level.playernamescustomaj = array("[SWAG]Brynjar", "[EPIC]ZombusterFTW", "[4SKN]Fungus", "Kaz");
	level.playernamescustomajsoundssg = array("vox_brynjar_sg", "vox_zombuster_sg", "vox_fungus_sg", " ");
	level.playernamescustomajsoundssgsubs = array("You may be a king Bryn, but does that really matter in the SQUIDGAME?","Ohh the maps creator found an Easter Egg? I'm sure it was hard for you.", "You may be an Artist Fungus, but does that really matter in the SQUIDGAME?", "You may be a Weeb Kaz, but does that really matter in the SQUIDGAME?");
	level.phoneorder = generaterandomorder();
	level.nexusphone = undefined;
	//function to make phone ring randomly on higher rounds, but also can be stopped when a phone ring is purposely scripted
	//level thread roundphonering();
}


function findphonenearplayer(player, string)
{
	closephones = ArraySortClosest(level.eephonetrigs, player.origin);
	level.phoneeefloor = 0;
	//phoneindex = 0;
	//closephones[phoneindex] thread ringphone(string);

	if(player IsTouching(level.phoneupstairsdetect))
	{
		for(i = 0; i < closephones.size; i++)
		{
			if(closephones[i].script_int == 1)
			{
				closephones[i] thread ringphone(string);
				level.phoneeefloor = 1;
				break;
			}
		}
	}
	else if(!player IsTouching(level.phoneupstairsdetect))
	{
		for(i = 0; i < closephones.size; i++)
		{
			if(closephones[i].script_int == 0)
			{
				closephones[i] thread ringphone(string);
				level.phoneeefloor = 0;
				break;
			}
		}
	}
}

function spawngreenfxonphone()
{
	phoneinteractfx = util::spawn_model("tag_origin", self.origin);
	WAIT_SERVER_FRAME;
	PlayFXOnTag("zombie/fx_powerup_on_green_zmb", self, "tag_origin");
	level waittill("squidphonesfail");
	phoneinteractfx Delete();
}




function ringphone(string)
{
	self UseTriggerRequireLookAt();
	model = GetEnt(self.target, "targetname");
	model PlayLoopSound("phoneringlp", 1);
	phoneinteractfx = util::spawn_model("tag_origin", model.origin);
	WAIT_SERVER_FRAME;
	PlayFXOnTag("zombie/fx_powerup_on_green_zmb", phoneinteractfx, "tag_origin");
	self SetHintString("Press ^2[{+activate}]^7 To Answer.");
	self waittill("trigger", player);
	self SetHintString("");
	//IPrintLnBold(string);
	model StopLoopSound(0.5);
	self PlaySound("phonepickup");
	phoneinteractfx Delete();
	phoneinteractfx2 = util::spawn_model("tag_origin", model.origin);
	WAIT_SERVER_FRAME;
	PlayFXOnTag("zombie/fx_powerup_on_red_zmb", phoneinteractfx2, "tag_origin");

	if(string == "squidgame")
	{
		level.nexusphone = self;
		if(checkplayername(player.playername))
		{
			for(i = 0; i < level.playernamescustomaj.size; i++)
			{
				if(player.playername == level.playernamescustomaj[i])
				{
					model PlaySoundWithNotify(level.playernamescustomajsoundssg[i], "soundfinished");
					thread zm_subtitles::subtitle_display(undefined, 2, "GameMaster", level.playernamescustomajsoundssgsubs[i]);
					model waittill("soundfinished");
					wait(1);
				}
			}
		}
		else
		{
			model PlaySoundWithNotify("vox_sgcallhello", "soundfinished");
			thread zm_subtitles::subtitle_display(undefined, 2, "GameMaster", "You found our cards, you know the drill.");
			model waittill("soundfinished");
			wait(1);
		}
		model PlaySoundWithNotify("vox_sgacceptcall", "soundfinished");
		thread zm_subtitles::subtitle_display(undefined, 2, "GameMaster", "Would you like to join the SQUIDGAME?");
		model waittill("soundfinished");
		phoneinteractfx2 Delete();
		phoneinteractfx = util::spawn_model("tag_origin", model.origin);
		WAIT_SERVER_FRAME;
		PlayFXOnTag("zombie/fx_powerup_on_green_zmb", phoneinteractfx, "tag_origin");
		self SetHintString("Press ^2[{+activate}]^7 To Accept. [WARNING: THIS WILL TELEPORT ALL PLAYERS]");
		self waittill("trigger", player);
		phoneinteractfx Delete();
		self SetHintString("");
		self PlaySound("phonepickup");
		wait(0.5);
		model PlaySoundWithNotify("youthoughteasy_sgphones", "soundfinished");
		thread zm_subtitles::subtitle_display(undefined, 2, "GameMaster", "Psssh. You thought it would be that easy? I'm gonna need your verification code.");
		model waittill("soundfinished");
		level notify("unhideallnumssquidgame");
		wait(1);
		model PlaySoundWithNotify("youforgot_sgphones", "soundfinished");
		thread zm_subtitles::subtitle_display(undefined, 2, "GameMaster", "You forgot it? Fine, I'll play it back here.");
		model waittill("soundfinished");
		level thread zombiesignoreallplayers();
		model thread playbeepcode();
		model waittill("allbeepscomplete");
		level notify("beepsplayedsgee");
		model PlaySoundWithNotify("codewillreset_sgphones", "soundfinished");
		thread zm_subtitles::subtitle_display(undefined, 2, "GameMaster", "After you enter the codes return here. If you get the code wrong it will reset.");
		model waittill("soundfinished");
		model PlaySoundWithNotify("returnherefornewcode_sgphones", "soundfinished");
		thread zm_subtitles::subtitle_display(undefined, 2, "GameMaster", "If that happens return here for the new code.");
		model waittill("soundfinished");
		level thread runallphones();
		self SetHintString("Knife the phone to repeat the code.");
		model thread repeatcode();
		level waittill("squidgamecodesentered");
		level notify("squidphonesfail");
		model PlayLoopSound("phoneringlp", 1);
		phoneinteractfx = util::spawn_model("tag_origin", model.origin);
		WAIT_SERVER_FRAME;
		PlayFXOnTag("zombie/fx_powerup_on_green_zmb", phoneinteractfx, "tag_origin");
		self SetHintString("Press ^2[{+activate}]^7 To Accept. [WARNING: THIS WILL TELEPORT ALL PLAYERS] for real this time.");
		model StopLoopSound(0.5);
		//radius = spawn( "trigger_radius", level.nexusphone.origin, 1, 150, 150);
		while(1)
		{
			playersinrange = 0;
			self waittill("trigger", player);
			foreach(player in GetPlayers())
			{
				///if(player IsTouching(radius))
				if(Distance(player.origin, level.nexusphone.origin)<= 75)
				{
					playersinrange ++;
				}
			}
			if(playersinrange == level.players.size)
			{
				break;
			}
			wait(0.05);
		}
		self SetHintString("");
		phoneinteractfx Delete();
		self PlaySound("phonepickup");
		wait(0.5);
		model PlaySoundWithNotify("letssee_sgphones", "soundfinished");
		thread zm_subtitles::subtitle_display(undefined, 2, "GameMaster", "Lets see how you fare in my SQUIDGAME.");
		model waittill("soundfinished");
		level notify("allsquidgamecardsfound");
	}
	else
	{
		IPrintLnBold("No call string.");
		model notify("phonecallcomplete");
	}
	//model waittill("phonecallcomplete");
	//radius Delete();
}


function playersdidntwinsg()
{
	//wait till game has concluded and wait till the start of the next round
	//then check if a player won, if they didnt allow the player to interact and play again, recurse and stop the next time if a player has now won
	model = GetEnt(level.nexusphone.target, "targetname");
	level waittill("squidgameisnowoverbakak");
	level waittill("start_of_round");
	if(level.noplayerswonsg == false)
	{
		wait(10);
		//record audio for here play a 2d sound
		//model PlaySoundWithNotify("nobodywonplayagain_sgphones", "soundfinished");
		PlaySoundAtPosition("nobodywonplayagain_sgphones", (0,0,0));
		thread zm_subtitles::subtitle_display(undefined, 2, "GameMaster", "Looks like nobody won the last game, return to the starting phone to play again.");
		wait(SoundGetPlaybackTime("nobodywonplayagain_sgphones")/1000);
		//model waittill("soundfinished");
		level thread randomeastereggscustomaj::setupsquidgameee(1);
		level.nexusphone SetHintString("Press ^2[{+activate}]^7 To Play Again, All Players Are Needed ^2[You can keep playing untill a player wins]");
		model PlayLoopSound("phoneringlp", 1);
		phoneinteractfx = util::spawn_model("tag_origin", level.nexusphone.origin);
		WAIT_SERVER_FRAME;
		PlayFXOnTag("zombie/fx_powerup_on_green_zmb", phoneinteractfx, "tag_origin");		
		radius = spawn( "trigger_radius", level.nexusphone.origin, 1, 150, 150);
		while(1)
		{
			playersinrange = 0;
			level.nexusphone waittill("trigger", player);
			foreach(player in GetPlayers())
			{
				if(player IsTouching(radius))
				{
					playersinrange ++;
				}
			}
			if(playersinrange == level.players.size && !level.islevelbranch)
			{
				break;
			}
			else 
			{
				WAIT_SERVER_FRAME;
				continue;
			}
		}
		phoneinteractfx Delete();
		level.nexusphone SetHintString("");
		model StopLoopSound(0.5);
		self PlaySound("phonepickup");
		wait(0.5);
		model PlaySoundWithNotify("letssee_sgphones", "soundfinished");
		thread zm_subtitles::subtitle_display(undefined, 2, "GameMaster", "Lets see how you fare in my SQUIDGAME.");
		model waittill("soundfinished");
		level notify("allsquidgamecardsfound");
		level thread playersdidntwinsg();
		break;
	}
}


function repeatcode()
{
	level endon("squidgamecodesentered");
	level endon("squidphonesfail");
	self SetCanDamage(1);
	while(1)
	{
		self waittill( "damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel );
		if(zm_utility::is_melee_weapon(weapon) == true)
		{
			self thread playbeepcode();
			self waittill("allbeepscomplete");
		}
		WAIT_SERVER_FRAME;
	}
}

function addtodefinedarray(arraytoaddto, contentarray)
{
	for(i = 0; i < contentarray.size; i++)
	{
		array::add(arraytoaddto, contentarray[i]);
	}
	return arraytoaddto;
}

function generaterandomorder()
{
	//level.phoneeefloor = 1;
	//1 upstairs 0 downstairs

	if(level flag::get("solo_game"))
	{
		phonecodeorder = array();
		phonenums1 = array(1,2,3,4);
		phonenums2 = array(5,6,7);
		phonenums1 = array::randomize(phonenums1);
		phonenums2 = array::randomize(phonenums2);
		if(level.phoneefloor == 0)
		{
			phonecodeorder = addtodefinedarray(phonecodeorder, phonenums1);
			phonecodeorder = addtodefinedarray(phonecodeorder, phonenums2);
		}
		else
		{
			phonecodeorder = addtodefinedarray(phonecodeorder, phonenums2);
			phonecodeorder = addtodefinedarray(phonecodeorder, phonenums1);
		}
		return phonecodeorder;
	}
	else
	{
		phonenums = array(1, 2, 3, 4, 5, 6, 7);
		phoneorder = array::randomize(phonenums);
		return phoneorder;
	}
	
}


function checkplayername(string)
{
	//check if the player is on the hardcoded list and if they are return true
	for(i = 0; i < level.playernamescustomaj.size; i++)
	{
		if(string == level.playernamescustomaj[i])
		{
			return true;
		}
	}
	return false;
}

function spawnmodelandfx()
{
	seatinginteractfx = util::spawn_model("tag_origin", self.origin);
	WAIT_SERVER_FRAME;
	PlayFXOnTag(level.seating153trigactivationfx, seatinginteractfx, "tag_origin");
	level waittill("seating153trigfaildelete");
	seatinginteractfx Delete();
}

//prompt code retell with a detection of a player knifing the "nexus" phone, the first phone to ring.
function playBeepSound(int)
{
	//play that sweet beep sound cheating payphones since 1998!
	//this is zero indexed so minus one on it play on self
	newint = int - 1;
	switch(newint)
	{
		case 0:
			self PlaySoundWithNotify("DTMF-1", "beepcomplete");
			thread zm_subtitles::subtitle_display(undefined, 2, "*beep*", "1");
			break;
		case 1:
			self PlaySoundWithNotify("DTMF-2", "beepcomplete");
			thread zm_subtitles::subtitle_display(undefined, 2, "*beep*", "2");
			break;
		case 2:
			self PlaySoundWithNotify("DTMF-3", "beepcomplete");
			thread zm_subtitles::subtitle_display(undefined, 2, "*beep*", "3");
			break;
		case 3:
			self PlaySoundWithNotify("DTMF-4", "beepcomplete");
			thread zm_subtitles::subtitle_display(undefined, 2, "*beep*", "4");
			break;
		case 4:
			self PlaySoundWithNotify("DTMF-5", "beepcomplete");
			thread zm_subtitles::subtitle_display(undefined, 2, "*beep*", "5");
			break;
		case 5:
			self PlaySoundWithNotify("DTMF-6", "beepcomplete");
			thread zm_subtitles::subtitle_display(undefined, 2, "*beep*", "6");
			break;
		case 6:
			self PlaySoundWithNotify("DTMF-7", "beepcomplete");
			thread zm_subtitles::subtitle_display(undefined, 2, "*beep*", "7");
			break;
		case 7:
			self PlaySoundWithNotify("DTMF-8", "beepcomplete");
			thread zm_subtitles::subtitle_display(undefined, 2, "*beep*", "8");
			break;
		case 8:
			self PlaySoundWithNotify("DTMF-9", "beepcomplete");
			thread zm_subtitles::subtitle_display(undefined, 2, "*beep*", "9");
			break;
	}
}

function playbeepcode()
{
	//take the beep order from the current order
	for(i = 0; i < level.eephonetrigs.size; i++)
	{
		self thread playBeepSound(level.phoneorder[i]);
		self waittill("beepcomplete");
		wait(0.5);
	}
	self notify("allbeepscomplete");
}


function runallphones()
{
	level.phoneentrynumber = 1;
	foreach(phone in level.eephonetrigs)
	{
		phone thread sgphonescodeentry();
	}
}

function ringindividualfx()
{
	phoneinteractfx = util::spawn_model("tag_origin", self.origin);
	WAIT_SERVER_FRAME;
	PlayFXOnTag("zombie/fx_powerup_on_green_zmb", phoneinteractfx, "tag_origin");
	self waittill("playerphonecodeentryfailed");
	phoneinteractfx Delete();
}

function deleteexcessphoneeffects()
{
	foreach(phone in level.eephonetrigs)
	{
		phone notify ("playerphonecodeentryfailed");
	}
}

function sgphonescodeentry()
{
	//computerterminalcomplete defaultfail
	level endon("squidphonesfail");
	model = GetEnt(self.target, "targetname");
	self waittill("trigger", player);
	switch(level.phoneentrynumber)
	{
		case 1:
		{
			//IPrintLnBold(""+model.script_int);
			if(model.script_int == level.phoneorder[level.phoneentrynumber-1])
			{	
				level.phoneentrynumber ++;
				self PlaySound("phonepickup");
				model thread playBeepSound(model.script_int);
				model waittill("beepcomplete");
				player PlaySound("phone_success");
				self thread ringindividualfx();
				return;
			}
			break;
		}
		case 2:
		{
			if(model.script_int == level.phoneorder[1])
			{
				level.phoneentrynumber ++;
				self PlaySound("phonepickup");
				model thread playBeepSound(model.script_int);
				model waittill("beepcomplete");
				player PlaySound("phone_success");
				self thread ringindividualfx();
				return;
			}
			break;
		}
		case 3:
		{
			if(model.script_int == level.phoneorder[2])
			{
				level.phoneentrynumber ++;
				self PlaySound("phonepickup");
				model thread playBeepSound(model.script_int);
				model waittill("beepcomplete");
				player PlaySound("phone_success");
				self thread ringindividualfx();
				return;
			}
			break;
		}
		case 4:
		{
			if(model.script_int == level.phoneorder[3])
			{
				level.phoneentrynumber ++;
				self PlaySound("phonepickup");
				model thread playBeepSound(model.script_int);
				model waittill("beepcomplete");
				player PlaySound("phone_success");
				self thread ringindividualfx();
				return;
			}
			break;
		}
		case 5:
		{
			if(model.script_int == level.phoneorder[4])
			{
				level.phoneentrynumber ++;
				self PlaySound("phonepickup");
				model thread playBeepSound(model.script_int);
				model waittill("beepcomplete");
				player PlaySound("phone_success");
				self thread ringindividualfx();
				return;
			}
			break;
		}
		case 6:
		{
			if(model.script_int == level.phoneorder[5])
			{
				level.phoneentrynumber ++;
				self PlaySound("phonepickup");
				model thread playBeepSound(model.script_int);
				model waittill("beepcomplete");
				player PlaySound("phone_success");
				self thread ringindividualfx();
				return;
			}
			break;
		}
		case 7:
		{
			if(model.script_int == level.phoneorder[6])
			{
				level.phoneentrynumber ++;
				self PlaySound("phonepickup");
				model thread playBeepSound(model.script_int);
				model waittill("beepcomplete");
				wait(0.2);
				player PlaySound("phone_success");
				self thread ringindividualfx();
				model PlaySoundWithNotify("sg_success", "soundfinished");
				model waittill("soundfinished");
				model PlaySoundWithNotify("thatsitreturn_sgphones", "soundfinished");
				thread zm_subtitles::subtitle_display(undefined, 2, "GameMaster", "That's it, now return to the starting phone...");
				model waittill("soundfinished");
				level thread deleteexcessphoneeffects();
				level notify("squidgamecodesentered");
				return;
			}
			break;
		}
	}
	//IPrintLnBold("fail");
	level thread deleteexcessphoneeffects();
	level thread squidphonesfail(self, model);
}

function squidphonesfail(trig, model)
{
	nexusphonemodel = GetEnt(level.nexusphone.target, "targetname");
	level.phoneorder = generaterandomorder();
	level notify("squidphonesfail");
	model PlaySound("phonepickup");
	wait(0.2);
	model thread playBeepSound(model.script_int);
	model waittill("beepcomplete");
	model PlaySound("defaultfail");
	wait(0.5);
	model PlaySoundWithNotify("nicejobcomeback_sgphones", "soundfinished");
	thread zm_subtitles::subtitle_display(undefined, 2, "GameMaster", "Nice job, return to the starting phone for the new code.");
	model waittill("soundfinished");
	level.nexusphone SetHintString("Press ^2[{+activate}]^7 To Hear A New Code.");
	level.nexusphone waittill("trigger", player);
	level.nexusphone SetHintString("New code is now playing.");
	level thread zombiesignoreallplayers();
	level.nexusphone PlaySoundWithNotify("heresnewcode_sgphones", "soundfinished");
	thread zm_subtitles::subtitle_display(undefined, 2, "GameMaster", "Alright here's the new code.");
	level.nexusphone waittill("soundfinished");
	nexusphonemodel thread playbeepcode();
	nexusphonemodel waittill("allbeepscomplete");
	level notify("beepsplayedsgee");
	level.nexusphone SetHintString("");
	wait(0.5);
	level.nexusphone thread repeatcode();
	self SetHintString("Knife the phone to repeat the code.");
	level thread runallphones();
}

function zombiesignoreallplayers()
{
	foreach(player in GetPlayers())
	{
		player.ignoreme = true;
	}
	level waittill("beepsplayedsgee");
	foreach(player in GetPlayers())
	{
		player.ignoreme = false;
	}
}