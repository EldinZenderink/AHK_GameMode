# AHK_GameMode

**Important: Only working on Windows 11 at the moment!**
**Important: Only tested with two monitors!**

Switch between monitor or tv (and audio devices) + start big picture using xbox controller.
This allows for two setups, a desktop environment and a gaming environment. Which in my case is handy since I game in a separate room with separate peripherals but using the same pc as for my office/desktop use.
Since I don't want to walk over to my pc in the other room every time I want to play a game, I implemented this AHK script to switch displays and audio device + start big picture with a single button press on my controller.

It is just a very basic and limited script which might be expanded in the future, or might not... you are free to mess around with it.


# How it works
The script uses the DisplaySwitch tool from windows to switch to a external or internal monitor.  The monitor identified as 1 under windows settings -> system -> display monitor is the internal, the other(s) are external.
It also uses the commandline tool nircmd to switch audio devices.

By pressing the menu + hide/show map button on the XBOX controller shortly it enables the Game Mode. By holding the two buttons for more than 3 seconds it switch to desktop mode.

For keyboard use, you can press:

CTRL+ALT+G to enter Game Mode
CTRL+ALT+D to enter Desktop Mode

# Usage

1. Edit config.ini  with a text editor
2. Under [GAMEMODE]:
    2.1 you need to set the action_id for the DisplaySwitch tool, to do so check windows settings -> system -> display. If your display for to be used for gamemode has ID 1 then you must put action_id as 1. If not set as 4.
    2.2 You must set the audio device to be used, you can use the name of the audio peripheral found in windows settings -> system -> sound (e.g. Headphones, Speakers, or in my case my TV (S95F))
3. Under [DESKTOPMODE]:
    2.1 you need to set the action_id for the DisplaySwitch tool, to do so check windows settings -> system -> display. If your display for to be used for desktop has ID 1 then you must put action_id as 1. If not set as 4.
    2.2 You must set the audio device to be used, you can use the name of the audio peripheral found in windows settings -> system -> sound (e.g. Headphones, Speakers, or in my case my TV (S95F))
4. Then run GameMode.ahk




