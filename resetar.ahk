;--------------------------
;made by surrender)
;--------------------------

#NoEnv
#Persistent
#SingleInstance, Force
#UseHook
#InstallKeybdHook
SendMode Input
SetWorkingDir, %A_ScriptDir%
SetControlDelay -1

;run as admin mode
if not A_IsAdmin{
    Run *RunAs "%A_ScriptFullPath%"
}

userfilespath := "C:\Users\User\Documents\GTA San Andreas User Files" ;gta user files path, dunno if there's a relative path in ahk
icon1path := "cj1.png" ;first icon path or just put name if its in the same folder
icon2path := "cj2.png" ; second icon pathor just put name if its in the same folder

SetTimer, checker, 1000 ;check if the blockinput didn't work properly. it'll close if dont.

f4::
    BlockInput on ;block keystrokes that you might press
    inputblocked := True
    ;close gta_sa.exe or gta-sa.exe
    Process, Close, gta_sa.exe
    Process, Close, gta-sa.exe

    ;delete all saves and replay, edit like you want
    FileDelete, %userfilespath%\GTASAsf1.b
    FileDelete, %userfilespath%\GTASAsf2.b
    FileDelete, %userfilespath%\GTASAsf3.b
    FileDelete, %userfilespath%\GTASAsf4.b
    FileDelete, %userfilespath%\GTASAsf5.b
    FileDelete, %userfilespath%\GTASAsf6.b
    FileDelete, %userfilespath%\GTASAsf7.b
    FileDelete, %userfilespath%\GTASAsf8.b
    FileDelete, %userfilespath%\replay.rep

    WinActivate, ahk_exe dxwnd.exe ;it'll focus the dxwind

    ImageSearch, OutputVarX, OutputVarY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %icon1path% ;search the gta icon on the dxwind gui and saves coordinates
    if (ErrorLevel = 1){
        ImageSearch, OutputVarX, OutputVarY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %icon2path%
        if (ErrorLevel = 1){
            return
        }
    }

    MouseGetPos, MX, MY ;get the current mouse position
    MouseMove, %OutputVarX%, %OutputVarY%, 0 ;move to the gta icon on the dxwind gui
    Click, 2 ;double click it
    MouseMove, MX, MY, 0 ;move the mouse back to the original mouse position

    WinActivate, ahk_exe gta_sa.exe ;it'll focus the gta
    WinActivate, ahk_exe gta-sa.exe ;it'll focus the gta²

    ;----------if your gta dont insta skip to menu, use this, it'll wait and press enter, if dont just delete this part before the blockinput---------------
    Sleep, 1000 ;it'll wait for gta skippable part to enter, it does not work with winactivate, 
    ;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    ;EDIT THE LINE ABOVE, IT MAY VARY FROM COMPUTER TO COMPUTER OR THE PROCESSES YOU HAVE ON YOUR CURRENT SYSTEM! (if you have more 
    ;processes or your pc is slower than mine, it'll need more time in sleep, if your pc is faster than mine or you have less process open, it'll be more faster to load and less time to sleep)
    ;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    ControlSend,, {Enter Down}, ahk_exe gta_sa.exe
    ControlSend,, {Enter Down}, ahk_exe gta-sa.exe
    ControlSend,, {Enter Up}, ahk_exe gta_sa.exe
    ControlSend,, {Enter Up}, ahk_exe gta-sa.exe
    ;-----------------------------------------------------

    BlockInput off ;remove block from keystrockes, you're now free to press something again
    inputblocked := False
return

checker:
    if (A_TimeIdle >= 5000) && (inputblocked = True){
        Reload
    }
return