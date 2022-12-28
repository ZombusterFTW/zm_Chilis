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
#using scripts\zm\_zm_ai_mechz;
#using scripts\shared\ai\zombie_utility;
#using scripts\zm\_zm_ai_dogs;

#using scripts\zm\zm_chilis;
#using scripts\_NSZ\roomserviceeasteregg;
#using scripts\_redspace\rs_o_jump_pad;
#using scripts\zm\_zm_ai_mechz;
#using scripts\shared\lui_shared;

#namespace jumpscare; 

#precache( "material", "eral" );
#precache( "material", "pigman_jumpscare" );
#precache( "material", "rhettscare" );
#precache( "material", "stuffmanscare" );
#precache( "material", "number2oil" );
#precache( "fx", "dlc0/factory/fx_teleporter_beam_factory" ); 
#precache( "fx", "dlc1/castle/fx_elec_teleport_flash_sm" );

function oilfunctioninit()
{
	level.oilappear = "dlc0/factory/fx_teleporter_beam_factory";
	level.oildisappear = "dlc1/castle/fx_elec_teleport_flash_sm";
	level.oilbottleplace = GetEnt("oilinitialplacebottle", "targetname");
	level.oilbottle = GetEnt("oilbottle", "targetname");
	level.oilbottletrig = GetEnt("oilbottletrig", "targetname");
	level.oilbottleteleport = GetEnt("oilbottlegrow", "targetname");
	level.oilbottleplacetrig = GetEnt("placeoil", "targetname");
	level.activatesequence = GetEnt("beginoilconversion", "targetname");
	level.oilpool = GetEnt("oilraiseheight", "targetname");
	level.oilpooldetect = GetEnt("oilpooldetect", "targetname");
	level.oilroomdetect = GetEnt("oilroomdetect", "targetname");
	level.oilpoolbarrier = GetEnt("oilbarrier", "targetname");
	level.oilroombarrier = GetEnt("oildoorblock", "targetname"); 
	level.oiltelepad = GetEnt("oiltelepad", "targetname");
	level.oilsucc = GetEnt("oilsucc", "targetname");
	level.oilbottleplace hide();
	level.oilbottleteleport hide();
	level.growsize = 1;
	level.oilroombarrier MoveY (-200,1);
	//thread waitforoil();
	thread pickupoil();
	thread oilwaitforpower();
}

function oilwaitforpower()
{
	level.oilbottletrig SetCursorHint("HINT_NOICON");
	level.oilbottletrig SetHintString("");
	level.oilbottleplacetrig UseTriggerRequireLookAt();
	level.activatesequence UseTriggerRequireLookAt();
	level.oilbottleplacetrig SetHintString( &"ZOMBIE_NEED_POWER" );
	level.activatesequence SetHintString( &"ZOMBIE_NEED_POWER" );
	level.oilbottleplacetrig SetCursorHint("HINT_NOICON");
	level.activatesequence SetCursorHint("HINT_NOICON");
	level flag::wait_till( "power_on" ); 
	level.oilbottleplacetrig SetHintString("Requires Oil");
	level.oiltankshoweractivate SetCursorHint("HINT_NOICON");
	level.activatesequence SetHintString("Oil Required For Synthesis Activation");
	level waittill("oilgrabbed");
	thread waitforoil();
}

function pickupoil()
{
	level waittill("amongusconvo");
	level waittill("codenum_solved");
	wait(0.5);
	level.oilbottletrig SetCursorHint("HINT_NOICON");
	level.oilbottletrig SetHintString("Hold [{+activate}] To Pick Up Meme Oil");
	level.oilbottletrig UseTriggerRequireLookAt();
	level.oilbottletrig waittill("trigger", player);
	level notify("oilgrabbed");
	player PlaySound("part_pickup");
	level.oilbottletrig Delete();
	PlayFX(level._effect["powerup_grabbed"], level.oilbottle.origin);
	level.oilbottle Delete();
	level notify("oilgrabbed");
}

function waitforoil()
{
	level.oilbottleplacetrig SetCursorHint("HINT_ACTIVATE");
	level.oilbottleplacetrig SetHintString("Press [{+activate}] To Place Oil On Teleport Pad");
	level.oilbottleplacetrig waittill("trigger", player);
	level.oilbottleplace show();
	wait(1);
	PlayFX(level.oildisappear, level.oilbottleplace.origin);
	level.oiltelepad PlaySound("oilteleport");
	wait(.4);
	level.oilbottleplace hide();
	level.oilbottleplacetrig SetCursorHint("HINT_NOICON");
	level.oilbottleplacetrig SetHintString("Oil Teleported To Expansion Chamber");
	wait(0.8);
	PlayFX(level.oilappear, level.oilbottleteleport.origin);
	level.oiltelepad PlaySound("oilappear");
	wait(.4);
	level.oilbottleteleport show();
	wait(0.2);
	level.activatesequence SetCursorHint("HINT_ACTIVATE");
	level.activatesequence SetHintString("Press [{+activate}] To Activate Expansion Sequence, Requires All Players");
	level.activatesequence waittill("trigger", player);
	level.activatesequence PlaySound( "kino_activate_start" );
	wait(0.1);
	level.oilroomdetect waittill("trigger", player);
	level thread beginshower();
}


function beginshower()
{
	level.oilroombarrier MoveZ (135,1);
	foreach( player in GetPlayers())
    {
        player PlayLocalSound("loonboon"); 
    }
	level.oilbottleteleport playsound( "oilgrow" );
	level.activatesequence SetHintString("Expansion In Progress, Lockdown In Effect...");
	level.oilbottleplacetrig SetHintString("Expansion In Progress, Lockdown In Effect...");
	thread spawn_panzers();
	level thread growoil();
	wait(50);
	level.activatesequence PlaySound( "kino_activate_start" );
	wait(.5);
	foreach( player in GetPlayers())
    {
        player PlayLocalSound("oilcomplete"); 
    }
    level.oilsucc MoveZ (-16.3,2);
    level.oilsucc PlaySound("tubeextract");
	level notify( "oiltankfilling" );
	zombies = GetAiSpeciesArray( level.zombie_team, "all" );
        if ( isdefined( zombies ) )
        {
            array::run_all( zombies, &Kill );
        }
    wait(2);
    level.oilsucc PlayLoopSound("succnoise");
    level.oilpool PlaySound( "oilslosh" );
    level.oilpool MoveZ (81,8);
    IPrintLnBold ("Dispensing Oil.....");
    wait(8);
    level.oilsucc StopLoopSound("succnoise");
    level.activatesequence SetCursorHint("HINT_NOICON");
	level.activatesequence SetHintString("Oil Expansion Complete, Please Submerge Yourself In The Oil");
	level.oilbottleplacetrig SetCursorHint("HINT_NOICON");
	level.oilbottleplacetrig SetHintString("Oil Expansion Complete, Please Submerge Yourself In The Oil");
	level.oilpoolbarrier MoveZ (-114,0.5);
	wait(0.5);
	level.oilpooldetect waittill("trigger", player);
	wait(4);
	level thread fade_all_players();
	level thread speak_to_players("success");
	wait(1);
	level thread teleporttofinalposoil();
	level.activatesequence SetCursorHint("HINT_NOICON");
	level.activatesequence SetHintString("");
	level.oilbottleplacetrig SetCursorHint("HINT_NOICON");
	level.oilbottleplacetrig SetHintString("");
	IPrintLnBold ("You are now covered in oil. You may now fly.....");
    level notify( "playercoveredinoil" );
    level.oilroombarrier MoveZ (-135,0.5);
    //level thread fade_all_players();
    level thread increaseroundz();
    wait(3);
    level flag::set( "spawn_zombies" );
}

function spawn_panzers()
{
	level flag::clear( "spawn_zombies" );
	zombie_utility::set_zombie_run_cycle( "super_sprint" );
	while(1)
	{
		level endon("oiltankfilling");
		e_ai = zombie_utility::spawn_zombie( level.zombie_spawners[ 0 ] );
        e_ai._rise_spot = array::random( struct::get_array( "start_zone_spawners", "targetname" ) );
        e_ai.ignore_enemy_count = 1;
        wait(1);
	}
}


function speak_to_players( sound )
{
    players = GetPlayers(); 
    foreach( player in players )
    {
        player PlayLocalSound( sound ); 
    }
}

function increaseroundz()
{
    level.roundjaunt = level.round_number;
    level.roundjaunt++;
    level thread zm_utility::zombie_goto_round( level.roundjaunt );
    IPrintLnBold ("roundshifted");
}

function growoil()
{
	level.growjaunt = 0.01875;
	for(i=0;i<373;i++)
    {
    	level endon ("oiltankfilling");
    	level.growsize = level.growsize + level.growjaunt;
    	level.oilbottleteleport SetScale(level.growsize);
    	wait(0.13404826);
    }
}

function teleporttofinalposoil()
{
        oilendposition = struct::get_array( "oilroomspawn", "targetname" );  // use structs instead of script_origins as they don't go towards the entity limit
        players = GetPlayers();
        level thread fade_all_players();
        wait(.5);
        foreach(player in players)
        {
                player SetOrigin(oilendposition[player.characterIndex].origin);
                player SetPlayerAngles(oilendposition[player.characterIndex].angles);
        }
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
    	//Example: level lui::screen_flash( 0.2, 0.1, .5, 1.0, "white" ); // fade to 1.0 alpha white over 0.2s, hold for 0.5s, and fade back in over 1.0s"
    player thread lui::screen_flash( 1, 0.1, 1.0, 1.0, "white" );
    }
}