#using scripts\zm\_zm_utility;
#using scripts\codescripts\struct;
#using scripts\shared\flag_shared;
#using scripts\zm\_zm_bgb;

#namespace jumpscare; 

#precache( "material", "eral" );
#precache( "material", "pigman_jumpscare" );
#precache( "material", "rhettscare" );
#precache( "material", "stuffmanscare" );
#precache( "model", "p7_3arc_lobby_picture_29x41_2_travis" );


function autoexec travisscott()
{
	level waittill("initial_blackscreen_passed");
    level.travisitemsCollected = 0;
	travisframes = GetEntArray("travisscottframe", "targetname");
    level.travisitemsRequired = travisframes.size;
    level waittill("power_on");
    foreach(frame in travisframes)
    {
        frame SetModel("p7_3arc_lobby_picture_29x41_2_travis");
        //PlayFX(level._effect["poltergeist"], frame.origin);
        frame Vibrate((-100,0,0), 0.3, 0.4, 1.5);
    }
    wait(1.5);
    foreach(frame in travisframes)
    {
        frame SetCanDamage(true);
        frame thread travisdetect();
    }
}


function travisdetect()
{
    while(1)
    {
        self waittill( "damage", damage, attacker, dir, point, mod, model, tag, part, weapon, flags, inflictor, chargeLevel );
        if(zm_utility::is_melee_weapon(weapon) && level.islevelbranch == false && level.criticaleeactive == false)
        {
            PlayFX(level._effect["powerup_grabbed"], self.origin);
            PlaySoundAtPosition("vineboom", self.origin);
            level.travisitemsCollected ++;
            break;
        }
        wait(0.05);
    }
    level thread eeCheckDone();
}


function speak_to_players( sound )
{
    players = Getplayers(); 
    foreach( player in players )
    {
        player StopLocalSound( "nsz_banana_song" );
        player PlayLocalSound( sound ); 
    }
}

function eral_moment()
{
	jumpscare_overlay = NewClientHudElem( self ); 
	jumpscare_overlay.alignX = "center";
	jumpscare_overlay.alignY = "center";
	jumpscare_overlay.horzAlign = "center";
	jumpscare_overlay.vertAlign = "center";
	
	jumpscare_overlay SetShader( "eral", 854, 480 ); 
	jumpscare_overlay.alpha = 1; 
	
	self PlaySound( "vineboom" );
	//speak_to_players( "suspencemoment" );
    self.ignoreme = true;
	wait(2); 
    self.ignoreme = false;
	jumpscare_overlay FadeOverTime( 3 ); 
	jumpscare_overlay.alpha = 0; 
	//player StopSound( "mediumorlarge" );
	wait( 4 ); 
	jumpscare_overlay destroy();
}

function eeCheckDone(player)
{
    while(1)
    {
        self waittill(level.travisshootablesCollected >= level.travisitemsRequired);
        if(level.travisitemsCollected == level.travisitemsRequired)
        {
            foreach(player in GetPlayers())
            {
            player thread eral_moment();
            }
            wait(5);
            level notify("alltravisitemsnowaquired");
        }
        break;
    }

}