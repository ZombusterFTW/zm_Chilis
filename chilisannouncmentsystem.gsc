#using scripts\zm\_zm_utility;
#using scripts\codescripts\struct;
#using scripts\shared\flag_shared;
#using scripts\zm\_zm_bgb;
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
#using scripts\shared\util_shared;
#using scripts\shared\vehicle_shared;
#insert scripts\shared\shared.gsh;
#insert scripts\shared\version.gsh;
#using scripts\shared\animation_shared;



function autoexec chilisannouncments()
{
    level waittill("initial_blackscreen_passed");
    level.scriptedvideoactive = false;
    level.videoisplaying = false;
    level.upstairsannouncmenttrig = GetEnt("phonetrigupstairsdetect", "targetname");
    level.chilisspeakersystem = GetEnt("chilissoundsystem", "targetname");
    level.emergencyactivationnum = 0;
    //set me back to 75!!!!
    level.announcmentschiliscooldown = 95;
    //normal announcment arrays
    level.soundannouncmentstringsulta = array("heyyouchilisannounce", "chilistravissco", "mitchellchilisannouncment", "mediumorlarge", "brianchilisannouncment", "chaosbesttakekino");
    level.soundannouncmenttimesulta = array(3.0, 5.0, 14.0, 29.0, 7.0, 6.0, 4.1);
    level.videoannouncementstringsulta = array("easwarning", "amongus", "susimpostor", "sleeperagentvideo", "fortnitedancerapepic", "lobamomentvideo", "brynvoletnew", "wewerethevanguard", "unfourseenjumpscare", "itsmorbintime"); 
    level.videoannouncementsoundsulta = array("fakeeas", "amongushappymeal", "susimpostoraudio", "sleeperagentvideoaudio", "fortniterapvideoaudio", "lobamomentaudio", "brynvoletaudio", "wewerethevanguardaudio", "unfourseenconseqjumpscareaudio", "itsmorbintimeaudio"); 
    level.videoannouncementtimesulta = array(48, 3.5, 6, 61, 10, 3.5, 14, 50.0, 19.0, 16.0);
    //branched announcment arrays
    level.soundannouncmentstringsultabr = array("amongushorrortestannounce");
    level.soundannouncmenttimesultabr = array(29.0);
    level.videoannouncementstringsultabr = array("sleeperagentvideo"); 
    level.videoannouncementsoundsultabr = array("sleeperagentvideoaudio"); 
    level.videoannouncementtimesultabr = array(61);
    //Default to the unbranched announcments
    level.mastersoundannouncmentstrings = level.soundannouncmentstringsulta;
    level.mastersoundannouncmenttimes =  level.soundannouncmenttimesulta;
    level.mastervideoannouncmentstrings = level.videoannouncementstringsulta;
    level.mastervideoannouncmentsounds = level.videoannouncementsoundsulta;
    level.mastervideoannouncmenttimes = level.videoannouncementtimesulta;
    level.videostringname = "";
    level.videosongstringname = "";
    level.soundstringname = "";
    level.soundannouncmentpre = "intercommessagepre";
    level thread changeannouncmentarrays();
    level thread checkforpower();
    level thread travisscottvideo();
    level thread masterpassee();
    //level thread endVideoOverride();
}



function changeannouncmentarrays()
{
    level endon("intermission");
    while(1)
    {
        //Set the master array equal to the lower ones
        //STOP ANNOUNCEMENTS BEFORE RUNNING THIS!
        level waittill("level_branched");
        level.mastersoundannouncmentstrings = level.soundannouncmentstringsultabr;
        level.mastersoundannouncmenttimes =  level.soundannouncmenttimesultabr;
        level.mastervideoannouncmentstrings = level.videoannouncementstringsultabr;
        level.mastervideoannouncmentsounds = level.videoannouncementsoundsultabr;
        level.mastervideoannouncmenttimes = level.videoannouncementtimesultabr;
        level.soundannouncmentpre = "intercommessageprelp";
        level waittill("level_unbranched");
        level.mastersoundannouncmentstrings = level.soundannouncmentstringsulta;
        level.mastersoundannouncmenttimes =  level.soundannouncmenttimesulta;
        level.mastervideoannouncmentstrings = level.videoannouncementstringsulta;
        level.mastervideoannouncmentsounds = level.videoannouncementsoundsulta;
        level.mastervideoannouncmenttimes = level.videoannouncementtimesulta;
        level.soundannouncmentpre = "intercommessagepre";
    }
}


function masterpassee()
{
    level waittill("cutsceneover");
    while(1)
    {
        if(level.masterpasseefound)
        {
            break;
        }
        wait(2);
    }
    level.upstairsannouncmenttrig waittill("trigger", player);
    wait(2);
    level notify("videoscreenquest");
    wait(0.05);
    VideoStart("tvbeep",false);
    level thread padoAnnounce("tvbeep");
    wait(1);
    VideoStop("tvbeep");
    wait(.2);
    VideoStart("masterpasschilisedit",false);
    level thread padoAnnounce("masterpassvidaudio");
    wait(18);
    level notify("masterpassvidcompletion");
    wait(3);
    VideoStart("tvturnoff",false);
    level thread padoAnnounce("tvbeepof");
    wait(1);
    VideoStop("tvturnoff");
    wait(2);
    level notify("videoscreenquestended");
}

function checkforpower()
{
    level waittill("power_on");
    level thread poweronchilisannounce();
    level thread stopchilisannounce();
}


function stopVideosArray(stringarray)
{
    for(i = 0; i < stringarray.size; i++)
    {
        VideoStop(stringarray[i]);
    }
}


function stopchilisannounce()
{

    while(1)
    {
        level waittill("videoscreenquest");
        level.scriptedvideoactive = true;
        level thread stopAllPA();
        level thread stopVideosArray(level.videoannouncementstringsultabr);
        level thread stopVideosArray(level.videoannouncementstringsulta);
        VideoStop("bigchungusdisaster");
        VideoStop("easwarning");
        VideoStop("sleeperagentvideo");
        //WAIT_SERVER_FRAME;
        level waittill("videoscreenquestended");
        level.scriptedvideoactive = false;
        //level thread endVideoOverride();
        level thread poweronchilisannounce();
        //wait(15);
        //level notify("pcactivation");
    }
}

function endVideoOverride()
{
    //this function ends a video when all players leave the chilis, to prevent bugs with certain functions
    playersinchilis = 0;
    while(level.videoisplaying == true)
    {
        playersinchilis = 0;
        foreach(player in GetPlayers())
        {
            if(player IsTouching(level.upstairsannouncmenttrig)) playersinchilis++;
        }
        if(playersinchilis == 0)
        {
            level notify("videoscreenquest");
            WAIT_SERVER_FRAME;
            level notify("videoscreenquestended");
            break;
        }
        WAIT_SERVER_FRAME;
    }
}


function padoAnnounce(soundname)
{
    level.chilisspeakersystem PlaySound(soundname);
}

function pastopAnnounce(soundname)
{
    level.chilisspeakersystem StopSound(soundname);
}

function stopAllPA()
{
        //need to store the currently played video as a string, looping seems to cause excess entities to be formeed.
        //get rid of the waits and just store in a level.variable that gets updated.
        for(i = 0; i < level.soundannouncmentstringsulta.size; i++)
        {
            level.chilisspeakersystem StopSound(level.soundannouncmentstringsulta[i]);
            wait(0.05);
        }
        for(i = 0; i < level.videoannouncementsoundsulta.size; i++)
        {
           level.chilisspeakersystem StopSound(level.videoannouncementsoundsulta[i]);
            wait(0.05);
        }
        for(i = 0; i < level.soundannouncmentstringsultabr.size; i++)
        {
            level.chilisspeakersystem StopSound(level.soundannouncmentstringsultabr[i]);
            wait(0.05);
        }
        for(i = 0; i < level.videoannouncementsoundsultabr.size; i++)
        {
           level.chilisspeakersystem StopSound(level.videoannouncementsoundsultabr[i]);
            wait(0.05);
        }

        level.chilisspeakersystem StopSound("tvturnoffeffect");
        level.chilisspeakersystem StopSound("bigchungusdisasteraudio");
}


function travisscottvideo()
{
    level waittill("alltravisitemsnowaquired");
    level notify("videoscreenquest");
    wait(1);
    VideoStart("bigchungusdisaster",true);
    /*
    for(i = 0; i < level.chilisspeakersystem.size; i++)
            {
                level.chilisspeakersystem[i] PlaySound("bigchungusdisasteraudio");  
            }
    */
    level thread padoAnnounce("bigchungusdisasteraudio");
    //level.ceilingent PlaySound("bigchungusdisasteraudio");
    wait(128);
    VideoStop("bigchungusdisaster");
    level notify("chungusvideoend");
    level notify("videoscreenquestended");
}



function poweronchilisannounce()
{
    level endon("videoscreenquest");
    level endon("allplayersleftchilis");
    //level.upstairsannouncmenttrig = GetEnt("detectannounceplayer", "targetname");
    playercount = 0;
    //level waittill("playerreturnoilnotifyzz");
    while(1)
    {
    level.emergencyactivationnum ++;
    //hardcoded sequence for obvious reasons
        if(level.emergencyactivationnum == 1)
        {
            level waittill("pcactivation");
            VideoStart("tvbeep",true);
            /*
            for(i = 0; i < level.chilisspeakersystem.size; i++)
            {
                level.chilisspeakersystem[i] PlaySound("tvbeep");  
            }
            */
            level thread padoAnnounce("tvbeep");
            wait(1);
            VideoStop("tvbeep");
            wait(.2);
            VideoStart("easwarning",false);
            /*
            for(i = 0; i < level.chilisspeakersystem.size; i++)
            {
                level.chilisspeakersystem[i] PlaySound("fakeeas");
            }
            */
            level thread padoAnnounce("fakeeas");
            wait(16);
            level thread stopAllPA();
            /*
            for(i = 0; i < level.chilisspeakersystem.size; i++)
            {
                level.chilisspeakersystem[i] StopSound("fakeeas");
            }
            */
            VideoStop("easwarning");
            VideoStart("tvturnoff",true);
            level thread padoAnnounce("tvbeepof");
            /*
            for(i = 0; i < level.chilisspeakersystem.size; i++)
            {
                level.chilisspeakersystem[i] PlaySound("tvbeepof");
            }
            */
            wait(1);
            VideoStop("tvturnoff");
        }

        else
        {
            //set the player count to 3
            playercount = 0;
            //check how many players are in the chilis area of the map, if its greater than 1 allow the program to proceed
            foreach(player in GetPlayers())
            {
                if(player IsTouching(level.upstairsannouncmenttrig))
                {
                    playercount ++;
                }
            }

            //branch announcments
            //have master arrays that are set equal to the respective video and announcement arrays of each segement
                //add third number here so it isnt always guaranteed to occur every 45 seconds.
                //player also must be inside of chilis to trigger the message
                //bianary choice for if a video or sound clip is played
                if(playercount >= 1)
                {
                    level.videoisplaying = true;
                    //roll = RandomInt(4);
                    //below is for hardcoded testing comment it later.
                    roll = 3;
                    //find a random int between 0 and 5, if its 3 then play a video, if its not 3 wait for the defined time and try again.
                    if(roll == 3)
                    {
                        //Choose a random int between 0 and 1, if its zero play a video, and if its one play an audio announcment
                        intstart = RandomInt(2);
                        //below is for hardcoded testing comment it later.
                        //intstart = 0;
                        if(intstart == 0)
                        {
                            //random integer found from the size of the video announcement array, this value is actually its size -1, so the random value wont be out of range for the array's index
                            int = RandomInt(level.mastervideoannouncmentstrings.size);
                            while(level.videostringname == level.mastervideoannouncmentstrings[int])
                            {
                                int = RandomInt(level.mastervideoannouncmentstrings.size);
                                wait(0.05);
                            }
                            level.videostringname = level.mastervideoannouncmentstrings[int];
                            level.videosongstringname = level.mastervideoannouncmentsounds[int];
                            //below is for hardcoded testing comment it later.
                            //int = 4;
                            //prefix vid and audio
                            VideoStart("tvbeep",true);
                            level thread padoAnnounce("tvbeep");
                            //level.ceilingent PlaySound("tvbeep");
                            wait(1);
                            VideoStop("tvbeep");
                            wait(.2);
                            //prefix vid and audio - end
                            //choose video name from video string, sound, and time array, all indexed the same way.
                            VideoStart(level.videostringname,true);
                            level thread padoAnnounce(level.videosongstringname);
                            /*
                            for(i = 0; i < level.chilisspeakersystem.size; i++)
                            {
                                level.chilisspeakersystem[i] PlaySound(level.videoannouncementsoundsulta[int]);
                            }
                            */
                            wait(level.mastervideoannouncmenttimes[int]);
                            VideoStop(level.videostringname);
                            level thread pastopAnnounce(level.videosongstringname);
                            //postfix vid and audio
                            VideoStart("tvturnoff",true);
                            level thread padoAnnounce("tvbeepof");
                            /*
                            for(i = 0; i < level.chilisspeakersystem.size; i++)
                            {
                                level.chilisspeakersystem[i] PlaySound("tvbeepof");
                            }
                            */
                            wait(1);
                            VideoStop("tvturnoff");
                            //postfix vid and audio - end
                        }
                        else if(intstart == 1)
                        {
                            //same idea as the video array, choose the audio using the size of the array minus-1 so we can get an array indexed random integer
                            int = RandomInt(level.mastersoundannouncmentstrings.size);
                            while(level.soundstringname == level.mastersoundannouncmentstrings[int])
                            {
                                int = RandomInt(level.mastersoundannouncmentstrings.size);
                                wait(0.05);
                            }
                            //play the prefix sound
                            level thread padoAnnounce(level.soundannouncmentpre); //"intercommessagepre"
                            /*
                            for(i = 0; i < level.chilisspeakersystem.size; i++)
                            {
                                level.chilisspeakersystem[i] PlaySound("intercommessagepre");
                            }
                            */
                            //level.ceilingent PlaySound("intercommessagepre");
                            wait(2);
                            //play the actual sound and wait for the length of the sound found from a different array with the same index
                            //check so we don't play the same last sound. loop while/if they are equal
                            
                            level.soundstringname = level.mastersoundannouncmentstrings[int];
                            level thread padoAnnounce(level.soundstringname);
                            /*
                            for(i = 0; i < level.chilisspeakersystem.size; i++)
                            {
                                level.chilisspeakersystem[i] PlaySound(level.soundannouncmentstringsulta[int]);
                            }
                            */
                            wait(level.mastersoundannouncmenttimes[int]);
                        }
                    }
                    
                }
        }
        //wait for the time defined at the top of this file
        level.videoisplaying = false;
        wait(level.announcmentschiliscooldown);
    }
                
}
