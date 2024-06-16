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
>^O Up:: ShowSearchGui(URLSearch) ; Right Ctrl + O
>^E Up:: ShowSearchGui(EcosiaSearch) ; Right Ctrl + E
>^G Up:: ShowSearchGui(GoogleSearch) ; Right Ctrl + G
>^T Up:: ShowSearchGui(TranslateSearch) ; Right Ctrl + T
>^I Up:: ShowSearchGui(ImagesSearch) ; Right Ctrl + I
>^Y Up:: ShowSearchGui(YouTubeSearch) ; Right Ctrl + Y
>^F Up:: ShowSearchGui(FlatIconSearch) ; Right Ctrl + F
>^D Up:: ShowSearchGui(DockerHubSearch) ; Right Ctrl + D
>^C Up:: ShowSearchGui(CanIUseSearch) ; Right Ctrl + C