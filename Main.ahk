; DIRECTIVES
#Requires AutoHotkey v2.0

; INCLUDES
#Include %A_WorkingDir%\modules\Config.ahk
#Include %A_WorkingDir%\modules\Websites.ahk
#Include %A_WorkingDir%\modules\WebSearch.ahk

; CONTEXT-SENSITIVE HOTKEYS
#HotIf IsSet(SearchGui)
Esc Up:: DestroySearchGui() ; 'Escape' => Close the search bar

#HotIf IsSet(SearchGui) && WinActive("ahk_id " SearchGui.Hwnd)
Alt Up:: ToggleMultilineSearch() ; 'Left Alt' => Toggle multiline search
RAlt Up:: TogglePrivateSearch() ; 'Right Alt' => Toggle private search

#HotIf IsSet(SearchGui) && WinActive("ahk_id " SearchGui.Hwnd) && !SearchGui.Multiline
Enter Up:: SubmitSearch() ; 'Enter' => Submit a single line search

#HotIf IsSet(SearchGui) && WinActive("ahk_id " SearchGui.Hwnd) && SearchGui.Multiline
^Enter Up:: SubmitSearch() ; 'Ctrl + Enter' => Submit a multiline search
#HotIf

; HOTKEYS

; Open URLs
^>R Up:: OpenURL("https://github.com/FyeCobain") ; GitHub Repositories

; Open web search bars
>^O Up:: ShowSearchGui(URLSearch) ; RCtrl + O
>^E Up:: ShowSearchGui(EcosiaSearch) ; RCtrl + E
>^G Up:: ShowSearchGui(GoogleSearch) ; RCtrl + G
>^T Up:: ShowSearchGui(TranslateSearch) ; RCtrl + T
>^I Up:: ShowSearchGui(ImagesSearch) ; RCtrl + I
>^Y Up:: ShowSearchGui(YouTubeSearch) ; RCtrl + Y
>^F Up:: ShowSearchGui(FlatIconSearch) ; RCtrl + F
>^D Up:: ShowSearchGui(DockerHubSearch) ; RCtrl + D
>^C Up:: ShowSearchGui(CanIUseSearch) ; RCtrl + C