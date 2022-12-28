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

#precache( "fx", "explosions/fx_exp_bomb_demo_mp" );


function autoexec init_maintenance()
{
	level waittill("initial_blackscreen_passed");
	//IPrintLnBold ("maintenance active");
	level.maintenanceinteractepicchungus = GetEnt("maintenancedoorinteract", "targetname");
	level.maintenanceinteractepicchungus UseTriggerRequireLookAt();
	level.maintenanceinteractepicchungus SetHintString("");
	level.maintenanceinteractepicchungus SetCursorHint("HINT_NOICON");
	level.elevatorcogmain = GetEnt("elevator_cog_quest", "targetname"); 
	level.elevatorcog1 = GetEnt("elevator_cog_1", "targetname");
	level.elevatorcog2 = GetEnt("elevator_cog_2", "targetname");
	level.elevatorcogtrig = GetEnt("elevator_cog_quest_trig", "targetname"); 
	level.maintenancetrig = GetEnt("maintenanceroomtrig", "targetname"); 
	level.maintenanceentertrig = GetEnt("maintenanceentrance", "targetname"); 
	level.elevatorcogpickup = GetEnt("cogitempickup", "targetname");
	level.elevatorcogpickuptrig = GetEnt("cogitempickuptrig", "targetname"); 
	level.amongusinteract = GetEnt("amongusinteractspeak", "targetname");
	level.amongusguy = GetEnt("amongusguy", "targetname");
	level.amongusguy Hide();
	level.amongusguy2 = GetEnt("amongusguy2", "targetname");
	level.amongusguyclip = GetEnt("amongusguyclip", "targetname");
	//
	level.amongusguyclip MoveY(53.5, 0.1);
	level.maintenancedoor = GetEnt("maintenancedoorswing", "targetname");
	level.maintenancedoorclip = GetEnt("maintenancedoorswingclip", "targetname"); 
	//level.oillaunchcheck = GetEnt("oil_launch_check", "targetname");
	level.elevatormotoree = GetEnt("elevatormotoree", "targetname");
	level.dripshoes = GetEnt("drip_shoes","targetname");
	level.pickupdrip = GetEnt("pickupdrip","targetname");
	level.wearshoes = GetEnt("drip_shoe_right","targetname");
	level.wearshoes2 = GetEnt("drip_shoe_left","targetname");
	level.wearshoesc = GetEnt("drip_shoe_right2","targetname");
	level.wearshoesc2 = GetEnt("drip_shoe_left2","targetname");
	//hint strings
	//level.oillaunchcheck SetHintString("Oil is required to fly. Dumbass");
	//level.oillaunchcheck SetCursorHint("HINT_NOICON");
	level.amongusinteract SetHintString("");
	level.amongusinteract UseTriggerRequireLookAt();
	level.elevatorcogpickuptrig UseTriggerRequireLookAt();
	level.pickupdrip UseTriggerRequireLookAt();
	level.elevatorcogtrig UseTriggerRequireLookAt();
	level.amongusinteract SetCursorHint("HINT_NOICON");
	level.elevatorcogpickuptrig SetHintString("");
	level.elevatorcogpickuptrig SetCursorHint("HINT_NOICON");
	level.elevatorcogtrig SetHintString("");
	level.elevatorcogtrig SetCursorHint("HINT_NOICON");
	shoes = GetEntArray("thedrip", "script_noteworthy");
	level.amongustime = 3;
	level.elevatorcogmain hide();
	level.amongusguy2 hide();
	level thread powerwait();
	//level thread amongus();
	level thread amongus2();
	level thread cog_immersion();
	level.dripshoes hide();
	level.wearshoes hide();
	level.wearshoes2 hide();
	level.wearshoesc hide();
	level.wearshoesc2 hide();
	
	thread random_spawn(shoes, "secure_drip_flag", "p7_54i_gear_shoes_red", "The Drip");
}

function random_spawn(parts, flag, model, hint){
	r = RandomInt(parts.size);
	foreach(part in parts){
		part_model = GetEnt(part.target, "targetname");
		if(part == parts[r]){
			part thread part_pickup(flag, hint, part_model);
		}else{
			part_model Delete();
			part Delete();
		}
	}
	//Takes in the parts[] array, and flags, you send from your
	//buildable function. The parts array is an array of triggers
	//left behind from stamping a 'random spawn point' - prefab
	//The function then chooses a random trigger to save, and deletes 
	//the rest of the unused triggers and the script_models they're targeting
	//Part pick-up logic is threaded last, right before deleting all
	//the spawn locations of the random parts that weren't chosen to spawn
}

  ///////////////////////////////////////
 //        PART PICKUP LOGIC          //
///////////////////////////////////////
function part_pickup(flag, hint, part)
{
	self SetCursorHint("HINT_NOICON");
	self SetHintString("");
	part hide();
	self hide();
	level waittill("timetofinddrip");
	//PlayFX(level._effect["powerup_grabbed"], self.origin);
	thread PlayFxWithCleanup(level._effect["powerup_grabbed"], self.origin);
	part show();
	self show();
	self SetCursorHint("HINT_NOICON");
	self SetHintString("Press ^2[{+activate}]^7 to pickup "+hint);
	self waittill("trigger", player);
	IPrintLnBold ("^2"+player.playername+" ^7Picked up ^6The Drip");
	level flag::set(flag);
	player PlaySound("part_pickup");
	wait(0.1);
	//PlayFX(level._effect["powerup_grabbed"], self.origin);
	thread PlayFxWithCleanup(level._effect["powerup_grabbed"], self.origin);
	part Delete();
	self Delete();
	level notify("dripsecuredhomie");
}


function powerwait()
{
	trig = GetEnt("elevatorinitdamage", "targetname");
	callswitch = GetEnt("elevatorcallswitch", "targetname");
	callswitch SetCursorHint("HINT_NOICON");
	callswitch SetHintString("");
	level waittill("startelevatorexplosionscene");
	callswitch PlaySound("elevatorstart");
	wait 1.5;
	//PlayFX(level._effect["powerup_grabbed"], level.elevatorcogmain.origin);
	thread PlayFxWithCleanup(level._effect["powerup_grabbed"], level.elevatorcogmain.origin);
	foreach( player in GetPlayers())
    {
        player PlayLocalSound("explosionelevator"); 
    }
    thread zm_subtitles::subtitle_display(undefined, 3, "^0Chili's", "*large explosion*");
    thread PlayFxWithCleanup("explosions/fx_exp_bomb_demo_mp", callswitch.origin);
    //PlayFX("explosions/fx_exp_bomb_demo_mp", callswitch.origin);
    trig thread playerradiuscheck();
    wait 0.05;
    trig Delete();
    wait 1.5;
    level notify("endelevatorignoreplayer");
    callswitch Delete();
	wait(1.5);
	foreach( player in GetPlayers())
    {
        player PlayLocalSound("vox_command_elevatormal"); 
    }
    thread zm_subtitles::subtitle_display(undefined, 2, "^2Mission Command", "Jesus Christ was that the elevator? Great we're gonna have to do maintenance on it.");
	level thread startmaintenance();
}

function playerradiuscheck()
{
	earthQuake(.6, 5, self.origin, 1000);
	foreach(player in GetPlayers())
	{
		if(player IsTouching(self))
		{
			player thread elevatorstunscene();
		}
	}
}

function elevatorstunscene()
{
	self shellshock( "explosion", 4 );
	self.ignoreme = true;
	level waittill("endelevatorignoreplayer");
	self.ignoreme = false;
}

function amongus()
{
	while(1)
	{
		level endon("power_on");
		level.amongusinteract SetHintString("Press ^2[{+activate}]^7");
		level.amongusinteract SetCursorHint("HINT_NOICON");
		level.amongusinteract waittill ("trigger", player);
		//IPrintLnBold ("Still haven't turned the power on? That's Awfully SUS");
		thread zm_subtitles::subtitle_display(undefined, 1, "Amogus", "You still haven't turned the power on? That's Awfully SUS");
		PlaySoundAtPosition("vox_powerz", level.amongusguy.origin);
		level.amongusinteract SetHintString("");
		wait(4);
		level.amongusinteract SetHintString("Press ^2[{+activate}]^7");
		level.amongusinteract waittill ("trigger", player);
		thread zm_subtitles::subtitle_display(undefined, 1, "Amogus", "Can you just get your tasks done?");
		//IPrintLnBold ("Do Your TASKS");
		PlaySoundAtPosition("vox_tasksz", level.amongusguy.origin);
		level.amongusinteract SetHintString("");
		wait(level.amongustime);
		level.amongusinteract SetHintString("Press ^2[{+activate}]^7");
		level.amongusinteract waittill ("trigger", player);
		//IPrintLnBold ("Amog us");
		thread zm_subtitles::subtitle_display(undefined, 1, "Amogus", "amogus");
		PlaySoundAtPosition("vox_amogusz", level.amongusguy.origin);
		level.amongusinteract SetHintString("");
		wait(level.amongustime);
	}
}


function soundobjwithnotify(sound)
{
	self PlaySoundWithNotify(sound, "soundcomplete");
	self waittill("soundcomplete");
	wait(.5);
	return;
}


function amongus2()
{
	level.amongusinteract SetHintString("");
	level.amongusinteract SetCursorHint("HINT_NOICON");
	level flag::wait_till( "power_on" );
	level waittill("startelevatorexplosionscene");
	level notify("videoscreenquest");
	wait(5);
	level.maintenanceinteractepicchungus SetHintString("Press ^2[{+activate}]^7 Open Maintenance Door.");
	level.maintenanceinteractepicchungus waittill("trigger", player);
	level.maintenanceinteractepicchungus PlaySound("doorlockedfail");
	level.maintenanceinteractepicchungus SetHintString("");
	wait 0.5;
	//ghfdfdh
	level.amongusguyclip MoveY(-53.5, 0.3);
	level.amongusguy Show();
	//PlayFX(level._effect["powerup_grabbed"], level.amongusguy.origin);
	thread PlayFxWithCleanup(level._effect["powerup_grabbed"], level.amongusguy.origin);
	level.amongusguy PlaySound("oilappear");
	thread zm_subtitles::subtitle_display(undefined, 3, "^2Mission Command", "Who the fuck is this?");
	PlaySoundAtPosition("vox_command_whottfisthis", level.amongusguy.origin);
	//length of sound clip
	wait(1.3);
	level.amongusinteract SetHintString("Press ^2[{+activate}]^7 To Ask Him To Move");
	level.amongusinteract waittill ("trigger", player);
	level.amongusinteract SetHintString("");
	level.amongusinteract SetCursorHint("HINT_NOICON");
	level thread zm_subtitles::subtitle_display(undefined, 1, "Amogus", "Woah woah woah, your trying to get in here? That's pretty sus man.");
	level.amongusinteract soundobjwithnotify("vox_amogusdia1");
	level.amongusinteract SetHintString("Press ^2[{+activate}]^7 To Continue");
	level.amongusinteract waittill ("trigger", player);
	level.amongusinteract SetHintString("");
	level thread zm_subtitles::subtitle_display(undefined, 1, "Amogus", "What does a ******** like you want even need to do in the maintenance room?");
	level.amongusinteract soundobjwithnotify("vox_amogusdia2");
	level.amongusinteract SetHintString("Press ^2[{+activate}]^7 To Continue");
	level.amongusinteract waittill ("trigger", player);
	level.amongusinteract SetHintString("");
	level thread zm_subtitles::subtitle_display(undefined, 1, "Amogus", "Here's the deal, if you can find my drip I'll let you through.");
	level.amongusinteract soundobjwithnotify("vox_amogusdia3");
	level notify("timetofinddrip");
	level thread findthedrip();
}

function announceoilsafecode(firstcode, secondcode, thirdcode)
{
	//firstcode = 1;
	//secondcode = 5;
	//thirdcode = 3;
	//firstcodefull = "vox_amogusdiacount0"+firstcode;
	//secondcodefull = "vox_amogusdiacount0"+secondcode;
	//thirdcodefull =  "vox_amogusdiacountz0"+thirdcode;
	uqarray = array("vox_amogusdiacount00", "vox_amogusdiacount01", "vox_amogusdiacount02", "vox_amogusdiacount03", "vox_amogusdiacount04", "vox_amogusdiacount05", "vox_amogusdiacount06", "vox_amogusdiacount07", "vox_amogusdiacount08", "vox_amogusdiacount09");
	//uqarraytime = array(1,);
	narray = array("vox_amogusdiacountz00", "vox_amogusdiacountz01", "vox_amogusdiacountz02", "vox_amogusdiacountz03", "vox_amogusdiacountz04", "vox_amogusdiacountz05", "vox_amogusdiacountz06", "vox_amogusdiacountz07", "vox_amogusdiacountz08", "vox_amogusdiacountz09");
	narraytime = array(1.5, 1.5, 1.5, 1.5, 1.5, 1.0, 2.5, 1, 2.5, 1);
	normaltime = 1.3;

	level waittill("startannouncecodeamogus");
	//wait(1);
	//level.amongusguy PlaySound("vox_thecodeis");
	//IPrintLnBold ("The Code Is...");
	level thread zm_subtitles::subtitle_display(undefined, 1, "Amogus", "The Code Is...");
	level.amongusinteract PlaySound("vox_amogusdiacodeis");
	//level.amongusinteract soundobjwithnotify("vox_amogusdiacodeis");
	wait(1.5);
	level notify("unhidehint1amog");
	level thread zm_subtitles::subtitle_display(undefined, 1,  "Amogus", firstcode);
	///level.amongusinteract soundobjwithnotify("vox_amogusdiacount0"+firstcode);
	level.amongusinteract PlaySound(uqarray[firstcode]);
	wait(normaltime);
	
	level notify("unhidehint2amog");
	level thread zm_subtitles::subtitle_display(undefined, 1,  "Amogus", secondcode);
	level.amongusinteract PlaySound(uqarray[secondcode]);
	wait(normaltime);
	
	level thread zm_subtitles::subtitle_display(undefined, 1,  "Amogus", "And the last number in the code is uhhhhhhhhh.");
	//level.amongusinteract soundobjwithnotify("vox_amogusdialastcode");
	level.amongusinteract PlaySound("vox_amogusdialastcode");
	wait(5.5);
	level notify("unhidehint3amog");
	level thread zm_subtitles::subtitle_display(undefined, 1,  "Amogus", thirdcode);
	level.amongusinteract PlaySound(narray[thirdcode]);
	wait(narraytime[thirdcode]);

	if(firstcode == 1 && secondcode == 5 && thirdcode == 3)
	{
		earthQuake(.6, 7, level.amongusinteract.origin, 1000);
		PlaySoundAtPosition("timebombactivate",(0,0,0));
		foreach(player in GetPlayers())
		{
			player shellshock( "explosion", 7 );
			player.ignoreme = true;
			VisionSetNaked( "zombie_last_stand", 1);
		}
		wait(7);
		foreach(player in GetPlayers())
		{
			player.ignoreme = false;
			VisionSetNaked( "zm_factory", 2);
		}
		wait(1.5);
	}

	level notify("amoguscodeannounced");
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

function findthedrip()
{
	level endon("maintenancecomplete");
	level waittill("dripsecuredhomie");
	level.amongusinteract SetHintString("Press ^2[{+activate}]^7 To Return The Drip");
	level.amongusinteract SetCursorHint("HINT_NOICON");
	level.amongusinteract waittill ("trigger", player);
	level.amongusinteract SetHintString("");
	level.amongusinteract SetCursorHint("HINT_NOICON");
	level.wearshoes show();
	level.wearshoes2 show();
	thread PlayFxWithCleanup(level._effect["powerup_grabbed"], level.wearshoes.origin);
	thread PlayFxWithCleanup(level._effect["powerup_grabbed"], level.wearshoes2.origin);

	level thread zm_subtitles::subtitle_display(undefined, 1, "Amogus", "Woah you found my drip? Sweet, I'm gonna look so drippy now.");
	level.amongusinteract soundobjwithnotify("vox_amogusdia4");
	wait(1);
	level thread zm_subtitles::subtitle_display(undefined, 1,  "Amogus", "So the thing is, the door actually opens from the otherside. Got ya.");
	level.amongusinteract soundobjwithnotify("vox_amogusdia5");
	wait(1);
	level thread zm_subtitles::subtitle_display(undefined, 1,  "Amogus", "You'll have to cover yourself in oil and fly through the maintenance room skylight.");
	level.amongusinteract soundobjwithnotify("vox_amogusdia6");
	//wait(1);
	level thread zm_subtitles::subtitle_display(undefined, 1,  "Amogus", "But you will need the mananger's oilsafe code, but I have it right here!");
	level.amongusinteract soundobjwithnotify("vox_amogusdia7");
	wait(1);
	level notify("startannouncecodeamogus");
	level waittill("amoguscodeannounced");
	
	level thread zm_subtitles::subtitle_display(undefined, 1, "Amogus", "I almost forgot it there.");
	//level.amongusinteract soundobjwithnotify("vox_amogusdia8");
	level.amongusinteract PlaySound("vox_amogusdia8");
	wait(1.5);

	level thread zm_subtitles::subtitle_display(undefined, 1, "Amogus", "Well I finished my tasks, so come find me later for a suprise.");
	level.amongusinteract soundobjwithnotify("vox_amogusdia10");

	level.amongusinteract PlaySound("vox_command_humiditylevels");
	level thread amongdrip();
	
	level thread zm_subtitles::subtitle_display(undefined, 3, "^2Mission Command", "As I much as I hate to say it he might be right, scanners are showing that humidity levels outside are perfect for oil flight.");
	wait(6);
	level notify("amongusconvo");
	//disable announcements until the player goes into oil
	//level notify("videoscreenquestended");
	while(1)
	{
		level.maintenanceinteractepicchungus SetHintString("Press ^2[{+activate}]^7 Open Maintenance Door.");
		level.maintenanceinteractepicchungus waittill("trigger", player);
		level.maintenanceinteractepicchungus PlaySound("doorlockedfail");
		level.maintenanceinteractepicchungus SetHintString("The door is locked.");
		wait(10);
	}
	
	
}

function amongdrip()
{
	//wait(29.8);
	//PlayFX(level._effect["powerup_grabbed"], level.amongusguy.origin);
	thread PlayFxWithCleanup(level._effect["powerup_grabbed"], level.amongusguy.origin);
	//PlaySoundAtPosition("comicalnoise", level.amongusguy.origin);
	level.wearshoesc show();
	level.wearshoesc2 show();
	level.wearshoes Delete();
	level.wearshoes2 Delete();
	level.amongusinteract Delete();
	level.amongusguy Delete();
	level.amongusguyclip Delete();
	level.amongusguy2 show();
	level waittill("endamongusmusical");
	level.amongusguy2 Delete();
	level.wearshoesc Delete();
	level.wearshoesc2 Delete();
}

function startmaintenance()
{
 	level waittill ("playercoveredinoil");
 	level.maintenanceinteractepicchungus SetHintString("Find another way in. I thought I told you this?");
 	//level.oillaunchcheck Delete();
 	//IPrintLnBold ("Wait, oil? that all works out perfectly");
 	//thread zm_subtitles::subtitle_display(undefined, 3, "^2Mission Command", "Wait, oil? that all works out perfectly");
 	level.maintenancetrig waittill ("trigger", player);
 	level.maintenanceinteractepicchungus Delete();
 	level.maintenancetrig PlaySound("vox_missingelevgear");
 	thread zm_subtitles::subtitle_display(undefined, 3, "^2Davis", "Looks like one of the cogs is missing");
 	level thread cog_quest();
 	wait(3);
 	level.maintenancetrig Delete();
}

function cog_quest()
{
	level.elevatorcogpickuptrig SetHintString("Press ^2[{+activate}]^7 To Pickup Replacement Cog");
	level.elevatorcogpickuptrig SetCursorHint("HINT_NOICON");
	level.elevatorcogpickuptrig waittill ("trigger", player);
	player PlaySound("part_pickup");
	thread PlayFxWithCleanup(level._effect["powerup_grabbed"], level.elevatorcogpickup.origin);
	level.elevatorcogpickuptrig Delete();
	level.elevatorcogpickup Delete();
	wait(0.5);
	level.elevatorcogtrig SetHintString("Press ^2[{+activate}]^7 To Place Cog");
	level.elevatorcogtrig SetCursorHint("HINT_NOICON");
	level.elevatorcogtrig waittill ("trigger", player);
	player PlaySound("build_done");
	thread PlayFxWithCleanup(level._effect["powerup_grabbed"], level.elevatorcogmain.origin);
	level.elevatorcogtrig Delete();
	level.elevatorcogmain show();
	level.elevatorcogmain RotatePitch(375, 10);
	level.elevatorcog1 RotatePitch(375, 10);
	level.elevatorcog2 RotatePitch(375, 10);
	level.elevatormotoree PlayLoopSound("mechanical_whirring");
	wait(1);
	PlaySoundAtPosition("dooropen", level.maintenancedoor.origin);
	level.maintenancedoor RotateYaw(-90, 1);
	level.maintenancedoorclip Delete();
	level notify("maintenancecomplete");
	level.maintenanceinteractepicchungus Delete();
	//PlaySoundAtPosition("vox_elevatormaintenancecomplete",(0,0,0))
	level.maintenancedoor PlaySound("vox_elevatormaintenancecomplete");
	thread zm_subtitles::subtitle_display(undefined, 2, "^5Davis", "Sounds like the elevator has returned to its normal functions");
	wait(1);
	level notify("amonguskilled");
	wait(2);
	thread zm_subtitles::subtitle_display(undefined, 2, "^5Davis", "It should proceed once all players are inside.");
}

function cog_immersion()
{
	level endon("end_game");
	while(1)
	{
		level waittill ("Elevator_Used");
		level.elevatorcogmain RotatePitch(375, 10);
		level.elevatorcog1 RotatePitch(375, 10);
		level.elevatorcog2 RotatePitch(375, 10);
		wait(.05);
	}
}

