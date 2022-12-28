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
#using scripts\shared\lui_shared;

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

#using scripts\shared\ai\zombie_utility;

#namespace jumpscare; 

//#precache( "material", "number2oil" );


function autoexec chungusbossfight()
{
    level.bossfightstart = GetEnt("startbossfight", "targetname");
    level.largechungus = GetEnt("largechungus", "targetname");
    level.chunguscrit = GetEnt("chunguscrit", "targetname");
    level.pillar1 = GetEnt("chunguspillar1", "targetname");
    level.pillar2 = GetEnt("chunguspillar2", "targetname");
    level.pillar3 = GetEnt("chunguspillar3", "targetname");
    level.pillar4 = GetEnt("chunguspillar4", "targetname");
    level.chungustank1 = GetEnt("chungustank1", "targetname");
    level.chungustank2 = GetEnt("chungustank2", "targetname");
    level.chungustank3 = GetEnt("chungustank3", "targetname");
    level.chungustank4 = GetEnt("chungustank4", "targetname");
    level.chungusliquid1 = GetEnt("chungusliquid1", "targetname");
    level.chungusliquid2 = GetEnt("chungusliquid2", "targetname");
    level.chungusliquid3 = GetEnt("chungusliquid3", "targetname");
    level.chungusliquid4 = GetEnt("chungusliquid4", "targetname");
    level thread fightbegin();
    level.phase1time = 60;
    //level.phase2time = 
    level.bossfightteleportcheck = GetEnt("bossfightteleportcheck", "targetname");
    level.bossfightteleportactivate = GetEnt("bossfightteleport", "targetname");
    level.reddithqspeaker = GetEnt("reddithqspeaker", "targetname");
    level.reddithqdetect = GetEnt("reddithqdetect", "targetname");
    level thread bossfightteleportstart();
    level thread waitforreddit();
}

function waitforreddit()
{
    level.reddithqdetect waittill("trigger", player);
     level.dognon_stop = false;
    while(1)
    {
        //PlaySoundAtPosition("reddithqaudio", level.reddithqspeaker.origin);
        speak_to_players( "reddithqaudio" );
        VideoStart("anothertest",true);
        wait(60);
        break;
    }
    level thread teleportimage();
    level thread teleporttochungusboss();
}



function teleporttoreddit()
{
        IPrintLnBold ("teleport started");
        reddithqdestination = struct::get_array( "reddittp", "targetname" );  // use structs instead of script_origins as they don't go towards the entity limit
        players = GetPlayers();
        level thread fade_all_players();
        wait(.5);
        foreach(player in players)
        {
                player SetOrigin(reddithqdestination[player.characterIndex].origin);
                player SetPlayerAngles(reddithqdestination[player.characterIndex].angles);
        }
}

function teleporttochungusboss()
{
        destinations2 = struct::get_array( "chungusfighttp", "targetname" );  // use structs instead of script_origins as they don't go towards the entity limit
        players = GetPlayers();
        level thread fade_all_players();
        wait(.5);
        foreach(player in players)
        {
                player SetOrigin(destinations2[player.characterIndex].origin);
                player SetPlayerAngles(destinations2[player.characterIndex].angles);
        }
}

function teleportbacktospawn()
{
        destinationshome = struct::get_array( "spawnendfight", "targetname" );  // use structs instead of script_origins as they don't go towards the entity limit
        players = GetPlayers();
        level thread fade_all_players();
        wait(.5);
        foreach(player in players)
        {
                player SetOrigin(destinationshome[player.characterIndex].origin);
                player SetPlayerAngles(destinationshome[player.characterIndex].angles);
        }
}

function bossfightteleportstart()
{
    level waittill("bossfightdevtest");
    while(1)
    {
    level endon("graceperiod");
    level.bossfightteleportactivate SetCursorHint("HINT_ACTIVATE");
    level.bossfightteleportactivate SetHintString("Hold [{+activate}] To Ascend REQUIRES ALL PLAYERS");
    level.bossfightteleportcheck waittill("trigger", player);
    IPrintLnBold ("all players at table");
    level thread telegrace();
    level.bossfightteleportactivate waittill("trigger", player);
    IPrintLnBold ("teleport triggered");
    level flag::clear( "spawn_zombies" );
    level thread fucktheworld();
    level thread teleportimage();
    level thread teleporttoreddit();
    level notify("killgrace");
    level.bossfightteleportactivate delete();
    level.bossfightteleportcheck delete();
    break;
    }
    
}

function telegrace()
{
    level.graceperiod = 5;
    while(1)
    {
        level endon("killgrace");
        wait(level.graceperiod);
        level notify("graceperiod");
        level thread bossfightteleportstart();
    }

}


function fightbegin()
{
    level.bossfightstart SetCursorHint("HINT_ACTIVATE");
    level.bossfightstart SetHintString("Hold [{+activate}] To Start Boss Fight");
    level.bossfightstart waittill("trigger", player);
    level.bossfightstart SetCursorHint("HINT_ACTIVATE");
    level.bossfightstart SetHintString("Boss Fight Started");
    level thread fucktheworld();
    level flag::clear( "zombie_drop_powerups" );

while(1)
{
    players = GetPlayers();
    if (players.size >= 4)
    {
        //add play sound here
        IPrintLnBold ("4 Unwholesome entities detected....");
        wait(1);
        IPrintLnBold ("Initiating Phase 1 defense protocal");
        thread phase1();
        break;
    }
    else if (players.size == 3)
    {
        //add play sound here
        IPrintLnBold ("3 Unwholesome entities detected....");
        wait(1);
        IPrintLnBold ("Initiating Phase 1 defense protocal");
        thread phase1();
        break;
    }
    else if (players.size == 2)
    {
        //add play sound here
        IPrintLnBold ("2 Unwholesome entities detected....");
        wait(1);
        IPrintLnBold ("Initiating Phase 1 defense protocal");
        thread phase1();
        break;
    }
    else if (players.size <= 1)
    {
        //add play sound here
        IPrintLnBold ("1 Unwholesome entity detected....");
        wait(1);
        IPrintLnBold ("Initiating Phase 1 defense protocal");
        thread phase1();
        break;
    }
    break;
}

}

function bosstimer()
{
    wait(level.phase1time);
    level notify("phaseover");
}

function phase1()
{
    level thread bosstimer();
    level thread spawnzombies();
    level thread spawndogs();
    wait(15);
    level thread spawnpanzer();
    level thread spawndogs();
    wait(45);
    level thread spawnpanzer();
    level thread spawndogs();
    IPrintLnBold ("Phase 1 over");
    zm_powerups::specific_powerup_drop("full_ammo", level.bossfightstart.origin);
    level thread phase2();
}

function phase2()
{
    IPrintLnBold ("Begining phase 2");
    speak_to_players( "chungusominous" ); 
    foreach(player in GetPlayers())
    {
    earthQuake(.6, 7, player.origin, 900);
    }
    level.pillar1 movez( 1072.8, 5, 0 );
    level.chungustank1 movez( 1072.8, 5, 0 );
    level.chungusliquid1 movez( 1072.8, 5, 0 );
    wait(30);
    IPrintLnBold ("end test");
    level notify("stopzombies");
    level thread returnhome();
}

function returnhome()
{
    level thread fucktheworld();
    level flag::set( "spawn_zombies" );

    IPrintLnBold ("Teleporting in 5...");
    wait(1);
    IPrintLnBold ("Teleporting in 4...");
    wait(1);
    IPrintLnBold ("Teleporting in 3...");
    wait(1);
    IPrintLnBold ("Teleporting in 2...");
    wait(1);
    IPrintLnBold ("Teleporting in 1...");
    wait(1);
    level thread teleportimage();
    level thread teleportbacktospawn();
    level notify("stopzombies");
    level thread fucktheworld();
    level notify("stopdogs");
    level thread fucktheworld();
    level notify("stoppanzer");
    level thread fucktheworld();
    zombie_utility::set_zombie_run_cycle();
    wait(1);
    IPrintLnBold ("Welcome home");
    //increase round by 1
    level thread increaseround();
    level flag::set( "zombie_drop_powerups" );
    level.dognon_stop = true;
}

function spawnpanzer()
{
    level.panzeramount = 5;
    for( i=0;i<level.panzeramount;i++ )
    {
    level endon("stoppanzer");
    //e_ai = zm_ai_mechz::spawn_mechz(500);
    //e_ai.ignore_enemy_count = 1;
    wait(3);
    }

}

function spawnzombies()
{
    zombie_utility::set_zombie_run_cycle( "super_sprint" );
    time = 0.5;
    while(1)
    {
        level endon("stopzombies");
        e_ai = zombie_utility::spawn_zombie( level.zombie_spawners[ 0 ] );
        e_ai._rise_spot = array::random( struct::get_array( "chungus_fight_spawners_zombie", "targetname" ) );
        e_ai.ignore_enemy_count = 1;
        wait(time);
    }
}

function spawndogs()
{
    level.dogamount = 7;
    for( i=0;i<level.dogamount;i++ )
    {
        level endon("stopdogs");
        zm_ai_dogs::special_dog_spawn(1);
        wait(2);
    }
}

function speak_to_players( sound )
{
    wait(10);
    players = Getplayers(); 
    foreach( player in players )
    {
        player StopLocalSound( "nsz_banana_song" );
        player PlayLocalSound( sound ); 
    }
}

function teleportimage()
{
    players = GetPlayers();
    //players_count = 0;
    //foreach (player in players)
    foreach(player in GetPlayers())
    {
    jumpscare_overlay = NewClientHudElem( player ); 
    jumpscare_overlay.alignX = "center";
    jumpscare_overlay.alignY = "center";
    jumpscare_overlay.horzAlign = "center";
    jumpscare_overlay.vertAlign = "center";
    jumpscare_overlay SetShader( "rhettscare", 480, 480 ); 
    jumpscare_overlay.alpha = 1; 
    player PlaySound( "comicalnoise" );
    //speak_to_players( "suspencemoment" );
    //wait(2); 
    jumpscare_overlay FadeOverTime( 3 ); 
    jumpscare_overlay.alpha = 0; 
    //player StopSound( "mediumorlarge" );
    //wait( 4 ); 
    jumpscare_overlay destroy();
    }
}

function increaseround()
{
    level.roundjaunt = level.round_number;
    level.roundjaunt++;
    level thread zm_utility::zombie_goto_round( level.roundjaunt );
    IPrintLnBold ("roundshifted");
}

function fucktheworld()
{
    //Clear zombies
    zombies = GetAiSpeciesArray( level.zombie_team, "all" );
        if ( isdefined( zombies ) )
        {
            array::run_all( zombies, &Kill );
        }
    IPrintLnBold ("Zombies wiped");
}

function fade_all_players()
{
foreach(player in GetPlayers())
    player thread fade_player();
}

function fade_player()
{
foreach(player in GetPlayers())
    {
    player thread lui::screen_flash( 0.1, 0.5, 1.0, 0.8, "white" );
    }
}
