#using scripts\zm\_zm_utility;
#using scripts\codescripts\struct;
#using scripts\shared\flag_shared;
#using scripts\zm\_zm_bgb;
#using scripts\zm\_zm_score;


function autoexec roomservice()
{
	level.roomdoor = GetEnt("roomservicedoor", "targetname");
	level.roomservicedoortrig = GetEnt("roomservicetrig", "targetname");
	level.playerhallcheck = GetEnt("playerhallwaycheck", "targetname");
	level.roomservicesound = GetEnt("roomservicesound", "targetname");
	level.roomservicedeliver = GetEnt("roomservicedeliver", "targetname");
	level.roomservicefood = GetEnt("roomservicefood", "targetname");
	level.roomservicefoodtrig = GetEnt("roomservicedelivertrig", "targetname");
	level.roomservicefoodtrig SetCursorHint("HINT_NOICON");
	level.roomservicefoodtrig SetHintString("");
	level.roomservicedeliver SetCursorHint("HINT_NOICON");
	level.roomservicedeliver SetHintString("");
	level.delivery_value = 420;
	thread playercheck();
	thread startquest();
}

function playercheck()
{
	level.playerhallcheck waittill("trigger", player);
	while(1)
	{
		level endon( "doorknockz" );
		PlaySoundAtPosition("placeholdernoise", level.roomservicesound.origin);
		IPrintLnBold ("Where the FUCK is my room service!?!?");
		wait(13);
		PlaySoundAtPosition("placeholdernoise", level.roomservicesound.origin);
		IPrintLnBold ("I Placed my order 3 HOURS ago!");
		wait(13);
		PlaySoundAtPosition("placeholdernoise", level.roomservicesound.origin);
		IPrintLnBold ("I can see you out there, why don't you do your JOB and get me my damn food!");
	}
	break;
}

function startquest()
{
	wait(10);
	level.roomservicedoortrig waittill("trigger", player);
	level notify("doorknockz");
	PlaySoundAtPosition("doorknock", level.roomdoor.origin);
	PlaySoundAtPosition("placeholdernoise", level.roomservicesound.origin);
	IPrintLnBold ("Its about time");
	wait(3.5);
	PlaySoundAtPosition("placeholdernoise", level.roomservicesound.origin);
	IPrintLnBold ("What do you mean there's zombies outside? I ordered room service not a comedian");
	wait(2);
	PlaySoundAtPosition("placeholdernoise", level.roomservicesound.origin);
	IPrintLnBold ("Go talk to the bartender before I come outside and kill you myself");
	wait(2);
	level.roomservicefoodtrig SetCursorHint("HINT_ACTIVATE");
	level.roomservicefoodtrig SetHintString("Hold [{+activate}] To Pick Up Food");
	level.roomservicefoodtrig waittill("trigger", player);
	level.roomservicefoodtrig Delete();
	PlayFX(level._effect["powerup_grabbed"], level.roomservicefood.origin);
	level.roomservicefood Delete();
	IPrintLnBold ("Head back to room 237");
	thread rewardtime();
}

function rewardtime()
{
	level.roomservicedeliver SetCursorHint("HINT_ACTIVATE");
	level.roomservicedeliver SetHintString("Hold [{+activate}] To Deliver Food");
	level.roomservicedeliver waittill("trigger", player);
	level.roomservicedeliver SetCursorHint("HINT_NOICON");
	level.roomservicedeliver SetHintString("");
	PlaySoundAtPosition("doorknock", level.roomdoor.origin);
	wait(1);
	PlaySoundAtPosition("placeholdernoise", level.roomservicesound.origin);
	IPrintLnBold ("Finally");
	wait(1.5);
	PlaySoundAtPosition("placeholdernoise", level.roomservicesound.origin);
	IPrintLnBold ("Sorry if I was rude earlier, here's a tip to show my appreciation");
	wait(2);
	PlaySoundAtPosition( "cha_ching", level.roomdoor.origin);
	players = GetPlayers();
	foreach (player in players)
    {
        player zm_score::add_to_player_score( level.delivery_value );
    }
	IPrintLnBold ("TIP AQUIRED!!!");
	level notify("roomservicecomplete");
}
