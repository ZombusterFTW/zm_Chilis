#using scripts\zm\_zm_utility;

#namespace jumpscare; 

#precache( "material", "pigman_jumpscare" ); 

function autoexec init()
{
	level.jumpscare_reuse = true; // Set to true if you would like the jumpscare to happen more than once
	jumpscare_triggers = GetEntArray( "pigman_trig", "targetname" ); 
	foreach( trig in jumpscare_triggers )
		trig thread wait_to_scare(); 
}

function wait_to_scare()
{
	self SetCursorHint( "HINT_NOICON" );
	self SetHintString( "Press ^2[{+activate}]^7 for Ray Gun" ); // add words inside the "" if you would like the hintstring to say something 
	
	do
	{
		self waittill( "trigger", player ); 
		if( !zm_utility::is_player_valid( player ) )
		{
			self wait_to_scare(); 
			return; 
		}
		
		player do_jumpscare(); 
	}while( level.jumpscare_reuse ); 

}

function do_jumpscare()
{
	jumpscare_overlay = NewClientHudElem( self ); 
	jumpscare_overlay.alignX = "center";
	jumpscare_overlay.alignY = "center";
	jumpscare_overlay.horzAlign = "center";
	jumpscare_overlay.vertAlign = "center";
	
	jumpscare_overlay SetShader( "pigman_jumpscare", 480, 480 ); 
	jumpscare_overlay.alpha = 1; 
	
	self PlayLocalSound( "pigman_jumpscare" ); 
	wait(2); 
	jumpscare_overlay FadeOverTime( 3 ); 
	jumpscare_overlay.alpha = 0; 
	wait( 4 ); 
	jumpscare_overlay destroy(); 
}