;; Mouse Wheel Scroll Emulation
; MouseWheelEmulator.ahk created by Blahman (blah238 at gmail dot com)
; v1.0, 10/18/2009
#Include %A_ScriptDir%\MouseWheelEmulator.ahk


;; Virtual Media Keys
; follows apple keyboard layout

#F7::Send {Media_Prev}
#F8::Send {Media_Play_Pause}
#F9::Send {Media_Next}

#F11::Send {Volume_Down}
#F12::Send {Volume_Up}
#F10::Send {Volume_Mute}

#F3::Send {LWinDown}{Tab}