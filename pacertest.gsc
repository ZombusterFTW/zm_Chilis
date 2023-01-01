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

#using scripts\shared\ai\zombie_utility;


//This file is no longer used in the map since around 2020. I wrote this script before I learned how loops worked lmao.

function autoexec pacertestinit()
{
    level.positioncheck = GetEnt("pacerpositioncheck", "targetname");
    level.killarea = GetEnt("pacerkillarea", "targetname");
    level.pacerbegin = GetEnt("pacerbegin", "targetname");
    level.pacerbegin SetCursorHint("HINT_ACTIVATE");
    level.pacerbegin SetHintString("Hold [{+activate}] To Start The Pacer Test");
    level.pacerbegincheck = GetEnt("pacerbegincheck", "targetname");
    level.pacerkill1 = GetEnt("pacerdamage1", "targetname");
    level.pacerkill2 = GetEnt("pacerdamage2", "targetname");
    thread pacerwaittobegin();
    thread timerlogic();
    level.pacerkill1 hide();
    level.pacerkill2 hide();
    level.killarea hide();
}

function pacerwaittobegin()
{   
    while(1)
    {
    players = GetPlayers();
    players_pacercount = 0;
    foreach(player in GetPlayers())
    {
    if(player IsTouching(level.pacerbegincheck))
      {
        players_pacercount++; 
      }
    }
    if (players_pacercount >= players.size)
    {
      IPrintLnBold ("All Players Present");
      level.pacerbegin waittill("trigger", player);
      level.lockinwalls = GetEntArray( "lockinwall", "targetname" );
      foreach(lockinwall in level.lockinwalls)
      {
      lockinwall movez( 160, 2, 0 );
      }
      level.pacerbegin SetCursorHint("HINT_NOICON");
      level.pacerbegin SetHintString("");
      earthQuake(.6, 3, level.pacerbegin.origin, 200);
      thread disable_movement();
      foreach(player in GetPlayers())
      {
      player PlayLocalSound( "pacerbegin" );
      wait(39.8);
      break;
      }
      thread enable_movement();
      thread pacercheck();
      break;
    }

    else if (players_pacercount < players.size)
    {
    IPrintLnBold ("All Players Not Present");
    break;
    }
    thread pacerwaittobegin();
    }  
}

function timerlogic()
{
    level.pacerinittime = 8.47;
    //wait
}

function pacercheck()
{
    thread enable_movement();
    wait(level.pacerinittime);
    level.pacerkill1 show();
    level.killarea show();
    wait(0.1);
    level.pacerkill1 hide();
    level.killarea hide();
    wait(level.pacerinittime);
    level.pacerkill2 show();
    level.killarea show();
    wait(0.1);
    level.pacerkill2 hide();
    level.killarea hide();
    wait(level.pacerinittime);
    level.pacerkill1 show();
    level.killarea show();
    wait(0.1);
    level.pacerkill1 hide();
    level.killarea hide();
    wait(level.pacerinittime);
    level.pacerkill2 show();
    level.killarea show();
    wait(0.1);
    level.pacerkill2 hide();
    level.killarea hide();
    wait(level.pacerinittime);
    level.pacerkill1 show();
    level.killarea show();
    wait(0.1);
    level.pacerkill1 hide();
    level.killarea hide();
    wait(level.pacerinittime);
    level.pacerkill2 show();
    level.killarea show();
    wait(0.1);
    level.pacerkill2 hide();
    level.killarea hide();
    wait(level.pacerinittime);
    level.pacerkill1 show();
    level.killarea show();
    wait(0.1);
    level.pacerkill1 hide();
    level.killarea hide();
    //wait(level.pacerinittime);
    //level.pacerkill2 show();
    //level.killarea show();
    //wait(0.1);
    level.pacerkill2 hide();
    level.killarea hide();
    level.pacerkill1 hide();
    level.lockinwalls = GetEntArray( "lockinwall", "targetname" );
    foreach(lockinwall in level.lockinwalls)
      {
      lockinwall movez( -160, 2, 0 );
      }
    IPrintLnBold ("Pacer Complete");
}


function disable_movement()
{
    foreach(player in GetPlayers())
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
    foreach(player in GetPlayers())
    {
    player setstance( "stand" );
    wait(0.1); 
    player SetMoveSpeedScale(1);
    player AllowJump(true);
    //player FreezeControlsAllowLook(false);
    } 
}

