/*
    @author Eldin Zenderink
    @brief AutoHotKey script to trigger switch to TV screen + audio device and start steam big picture (e.g as if launching a console!) based on pressing toggle view and map/hide map button simultaneously.
    @usage: Short press (simultaneously) toggle view and map/hide map -> switch to TV, long press (3+ seconds) -> switch to monitor. (Or CTRL+ALT+G = Game Mode, CTRL+ALT+D = Desktop Mode)
    @dependencies:
        - nircmd (https://www.nirsoft.net/utils/nircmd.html)
        - XInput.ahk (https://www.autohotkey.com/boards/viewtopic.php?f=83&t=106254)
    @version 0.0.1
*/

#Requires AutoHotkey v2.0
#Include XInput.ahk

SetAudioDevice(device) { ; Found at: https://superuser.com/a/1885559
    Run A_ScriptDir . '\nircmd.exe setdefaultsounddevice "' . device . '"'
}

SwitchToTvAndStartBigPicture() {
    action_id := IniRead(A_ScriptDir . '\config.ini', "GAMEMODE", "action_id")
    audio_device := IniRead(A_ScriptDir . '\config.ini', "GAMEMODE", "audio_device")
    SetAudioDevice(audio_device)
    Run "C:\Windows\System32\DisplaySwitch.exe " . action_id
    Sleep 2000
    Run 'steam://open/bigpicture'
}

SwitchToMonitorAndStopBigPicture() {
    action_id := IniRead(A_ScriptDir . '\config.ini', "DESKTOPMODE", "action_id")
    audio_device := IniRead(A_ScriptDir . '\config.ini', "DESKTOPMODE", "audio_device")
    Run 'steam://close/bigpicture'
    SetAudioDevice(audio_device)
    Run "C:\Windows\System32\DisplaySwitch.exe " . action_id
}

XInput_Init()
SetTimer(CheckController, 250)

PressedTimer := 0
Executed := true ; start as if it is executed otherwise the short press will trigger continuously

CheckController() {
    global PressedTimer
    global Executed

    state := XInput_GetState(0) ; 0 represents Player 1 controller
    if state {
        ; Bitwise check for XInput buttons (e.g., Back button is 0x20)
        if (state.wButtons & 0x30) {
            PressedTimer := PressedTimer + 0.25
            if (PressedTimer > 3) {
                ToolTip(Format("Release Now To Enter Desktop Mode! (Time Pressed: {1} > 3 seconds!).", PressedTimer))
            }
            else {
                ToolTip(Format("Release Now To Enter Game Mode! (Time Pressed: {1} <= 3 seconds!).", PressedTimer))
            }
            Executed := false
        } else {
            ToolTip()

            if (Executed == false) {
                Executed := true
                if (PressedTimer > 3) {
                    SwitchToMonitorAndStopBigPicture()
                }
                else {
                    SwitchToTvAndStartBigPicture()
                }
            }
            PressedTimer := 0
        }
    }
}

; If no controller in reach use CTRL+1 to switch to game mode

^!g::
{
    SwitchToTvAndStartBigPicture()
}

; If no controller in reach use CTRL+2 to switch to monitor mode

^!d::
{
    SwitchToMonitorAndStopBigPicture()
}
