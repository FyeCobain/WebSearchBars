; DIRECTIVES
#Requires AutoHotkey v2.0

; INCLUDES
#Include %A_WorkingDir%\modules\Config.ahk
#Include %A_WorkingDir%\modules\Websites.ahk
#Include %A_WorkingDir%\modules\WebSearch.ahk

; CONTEXT-SENSITIVE HOTKEYS
#HotIf IsSet(SearchGui)
Esc Up:: DestroySearchGui() ; 'Escape' => Closes the search bar

#HotIf IsSet(SearchGui) && WinActive("ahk_id " SearchGui.Hwnd)
Alt Up:: ToggleMultilineSearch() ; 'Left Alt' => Toggles the multiline search
RAlt Up:: TogglePrivateSearch() ; 'Right Alt' => Toggles the private search

#HotIf IsSet(SearchGui) && WinActive("ahk_id " SearchGui.Hwnd) && !SearchGui.Multiline
Enter Up:: SubmitSearch() ; 'Enter' => Submits a single line search

#HotIf IsSet(SearchGui) && WinActive("ahk_id " SearchGui.Hwnd) && SearchGui.Multiline
^Enter Up:: SubmitSearch() ; 'Ctrl + Enter' => Submits a multiline search
#HotIf

; HOTKEYS

; Open URLs
^>R Up:: OpenURL("https://github.com/FyeCobain") ; GitHub Repositories

; Open web search bars
>^O Up:: ShowSearchGui("Open URL") ; Right Ctrl + O
>^E Up:: ShowSearchGui("Ecosia") ; Right Ctrl + E
>^G Up:: ShowSearchGui("Google") ; Right Ctrl + G
>^T Up:: ShowSearchGui("Google Translate") ; Right Ctrl + T
>^I Up:: ShowSearchGui("Images") ; Right Ctrl + I
>^Y Up:: ShowSearchGui("YouTube") ; Right Ctrl + Y
>^F Up:: ShowSearchGui("Flaticon") ; Right Ctrl + F
>^D Up:: ShowSearchGui("Docker Hub") ; Right Ctrl + D
>^C Up:: ShowSearchGui("Can I Use") ; Right Ctrl + C