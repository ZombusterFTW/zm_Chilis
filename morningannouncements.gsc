#using scripts\zm\_zm_utility;
#using scripts\codescripts\struct;
#using scripts\shared\flag_shared;
#using scripts\zm\_zm_bgb;

#namespace jumpscare; 

#precache( "material", "pigman_jumpscare" );
#precache( "material", "rhettscare" );
#precache( "material", "stuffmanscare" );


function autoexec tardy_challengesinit()
{
	level.tardybook = GetEnt("ee_obj1", "targetname");
	level.tardybooktrig = GetEnt("tardy_trig", "targetname");
	level.playercheck = GetEnt("tardyallplayercheck", "targetname");
	green_fx = level._effect["powerup_grabbed"];
	level.playercheck SetCursorHint("HINT_ACTIVATE");
	level.playercheck SetHintString("Hold [{+activate}] To Begin Challenge. All Players Must Interact To Begin");
	level.tardybooktrig SetCursorHint("HINT_ACTIVATE");
	level.tardybooktrig SetHintString("Hold [{+activate}] To Begin Challenge. All Players Must Interact To Begin");

	level.playercheck waittill("trigger", player);
	IPrintLnBold ("All players present");
	level.tardybooktrig waittill("trigger", player);
	PlayFX(level._effect["powerup_grabbed"], level.tardybook.origin);
	level.playercheck Delete();
	level.tardybooktrig Delete();
	//player do_wholesome1();
	thread begin_challange();
}



function begin_challange()
{
	players = GetPlayers();
    //players_count = 0;
    foreach (player in players)
	//foreach(player in GetPlayers())
    {
	level.tardybooktrig SetCursorHint("HINT_NOICON");
	level.tardybooktrig SetHintString("");
	//player PlaySoundWithNotify("mediumorlarge", "soundcomplete");
	IPrintLnBold ("You May Be Tardy But You Still Must Complete The Morning Routine");
	wait(1);
	IPrintLnBold ("Im going to give you ten seconds to get ready");
	wait(1);
	IPrintLnBold ("Starting NOW");
    //player waittill("soundcomplete");
    wait(10); //temp til sound recorded
    //player PlaySoundWithNotify("mediumorlarge", "soundcomplete");
	IPrintLnBold ("Lets start with the first thing of the day");
	wait(1);
	IPrintLnBold ("The Pledge of Allegance");
	wait(1);
	IPrintLnBold ("Remember to stand up and stop moving >:D");
	//player waittill("soundcomplete");
	wait(5); //temp till sound recorded
	thread disable_movement();
	foreach(player in GetPlayers())
	{
    player thread do_wholesome(); 
	}
	//wait(7);
	//thread do_wholesome1();
	//wait(8);
	//thread do_wholesome2();
	wait(15);
	thread enable_movement();
	//PlaySoundWithNotify("mediumorlarge", "soundcomplete")
	IPrintLnBold ("You know what's next don't you?");
	wait(1);
	IPrintLnBold ("The MOMENT of SILENCE. No SHOOTING or explosions of anykind");
	wait(2);
	IPrintLnBold ("Starting NOW");
	//waittill("soundcomplete");
	thread disable_guns();
	foreach(player in GetPlayers())
	{
    player thread do_wholesome(); 
	}
	//wait(9);
	//t/hread do_wholesome1();
	//wait(9);
	//thread do_wholesome2();
	wait(9);
	//wait(30);
	//player PlaySoundWithNotify("mediumorlarge", "soundcomplete");
	IPrintLnBold ("Good, you completed the challenge");
	thread enable_guns();
	wait(1);
	IPrintLnBold ("NOW GET TO CLASS!!");
	//player waittill("soundcomplete")
	//player PlaySoundWithNotify("mediumorlarge", "soundcomplete")
	//player waittill("soundcomplete")
	thread giveplayerreward();
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
	//player FreezeControlsAllowLook(true);
	
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
	//player FreezeControlsAllowLook(false);
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

function speak_to_players( sound )
{
    players = GetPlayers(); 
    foreach( player in players )
    {
        player StopLocalSound( "nsz_banana_song" );
        player PlayLocalSound( sound ); 
    }
}

function do_wholesome()
{
	players = GetPlayers();
    //players_count = 0;
	jumpscare_overlay = NewClientHudElem( self ); 
	jumpscare_overlay.alignX = "center";
	jumpscare_overlay.alignY = "center";
	jumpscare_overlay.horzAlign = "center";
	jumpscare_overlay.vertAlign = "center";
	
	jumpscare_overlay SetShader( "rhettscare", 480, 480 ); 
	jumpscare_overlay.alpha = 1; 
	
	self PlaySound( "mediumorlarge" );
	//speak_to_players( "suspencemoment" );

	wait(2); 
	jumpscare_overlay FadeOverTime( 3 ); 
	jumpscare_overlay.alpha = 0; 
	//player StopSound( "mediumorlarge" );
	wait( 4 ); 
	jumpscare_overlay destroy();
	wait(7)
	thread do_wholesome1();
}

function do_wholesome1()
{
	players = GetPlayers();
    //players_count = 0;
    foreach (player in players)
	//foreach(player in GetPlayers())
	jumpscare_overlay = NewClientHudElem( self ); 
	jumpscare_overlay.alignX = "center";
	jumpscare_overlay.alignY = "center";
	jumpscare_overlay.horzAlign = "center";
	jumpscare_overlay.vertAlign = "center";
	
	jumpscare_overlay SetShader( "stuffmanscare", 480, 480 ); 
	jumpscare_overlay.alpha = 1; 
	
	//player PlayLocalSound( "suspencemoment" );
	speak_to_players( "pigman_jumpscare" ); 
	wait(2); 
	jumpscare_overlay FadeOverTime( 1.5 ); 
	jumpscare_overlay.alpha = 0; 
	wait( 4 ); 
	jumpscare_overlay destroy();
	wait(8);
	thread do_wholesome2();
}

function do_wholesome2()
{
	players = GetPlayers();
    //players_count = 0;
	jumpscare_overlay = NewClientHudElem( self ); 
	jumpscare_overlay.alignX = "center";
	jumpscare_overlay.alignY = "center";
	jumpscare_overlay.horzAlign = "center";
	jumpscare_overlay.vertAlign = "center";
	
	jumpscare_overlay SetShader( "pigman_jumpscare", 480, 480 ); 
	jumpscare_overlay.alpha = 1; 
	
	//player PlayLocalSound( "suspencemoment" );
	speak_to_players( "comicalnoise" ); 
	//wait(2); 
	jumpscare_overlay FadeOverTime( 1 ); 
	jumpscare_overlay.alpha = 0; 
	wait( 4 ); 
	jumpscare_overlay destroy();
}

function giveplayerreward()
{
	//foreach(player in GetPlayers())
	players = GetPlayers();
    //players_count = 0;
    foreach (player in players)
    {
        player bgb::give("zm_bgb_perkaholic");
    }
}