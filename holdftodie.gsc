#using scripts\zm\_zm_utility;

#namespace jumpscare; 


function autoexec init()
{
	level.jumpscare_reuse = true; // Set to true if you would like the jumpscare to happen more than once
	jumpscare_triggers = GetEntArray( "holdfanddie", "targetname" ); 
	foreach( trig in jumpscare_triggers )
		trig thread wait_to_scare(); 
}

function wait_to_scare()
{
	self SetCursorHint( "HINT_NOICON" );
	self SetHintString( "Press Interact To Say Hello" ); // add words inside the "" if you would like the hintstring to say something 
	
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
	self DoDamage(player.health,player.origin);	 
}