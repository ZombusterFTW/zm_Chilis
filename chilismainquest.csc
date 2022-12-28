#using scripts\codescripts\struct;
#using scripts\shared\audio_shared;
#using scripts\shared\callbacks_shared;
#using scripts\shared\clientfield_shared;
#using scripts\shared\exploder_shared;
#using scripts\shared\scene_shared;
#using scripts\shared\util_shared;
#using scripts\shared\filter_shared;
#insert scripts\shared\shared.gsh;
#insert scripts\shared\version.gsh;



#namespace zm_ev_filter;


//REGISTER_SYSTEM("zm_ev_filter", &__init__, undefined )

function main()
{
	clientfield::register( "world",    "thesourcefx",          VERSION_SHIP, 1, "int", &thesourcefx,       !CF_HOST_ONLY, !CF_CALLBACK_ZERO_ON_NEW_ENT );
}


function thesourcefx(localClientNum, oldVal, newVal, bNewEnt, bInitialSnap, fieldName, bWasTimeJump)
{
	if(IS_TRUE(newVal))
	{
		filter::init_filter_ev_interference(self);
		filter::enable_filter_ev_interference(self);
	}
	else
	{
		filter::disable_filter_ev_interference(self);
	}
}