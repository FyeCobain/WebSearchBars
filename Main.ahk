; DIRECTIVES
#Requires AutoHotkey v2.0

; INCLUDES
#Include %A_WorkingDir%\modules\Config.ahk
#Include %A_WorkingDir%\modules\Web.ahk

; CONTEXT-SENSITIVE HOTKEYS
#HotIf IsSet(SearchGui)
Esc Up:: DestroySearchGui() ; Esc
Alt Up:: ToggleMultilineSearch() ; Left Alt
RAlt Up:: TogglePrivateSearch() ; Right Alt
#HotIf IsSet(SearchGui) && !SearchGui.Multiline
Enter Up:: SubmitSearch() ; Enter
#HotIf IsSet(SearchGui) && SearchGui.Multiline
^Enter Up:: SubmitSearch() ; Ctrl + Enter
#HotIf

; HOTKEYS
>^G Up:: ShowSearchGui("Google") ; Right Ctrl + G