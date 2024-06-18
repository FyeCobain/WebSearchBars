; DIRECTIVES
#Requires AutoHotkey v2.0

; INCLUDES
#Include %A_WorkingDir%\modules\Config.ahk
#Include %A_WorkingDir%\modules\Websites.ahk
#Include %A_WorkingDir%\modules\WebSearch.ahk

; CONTEXT-SENSITIVE HOTKEYS
#HotIf IsSet(SearchGui)
Esc Up:: DestroySearchBar() ; 'Escape' => Close the search bar

#HotIf IsSet(SearchGui) && WinActive("ahk_id " SearchGui.Hwnd)
Alt Up:: ToggleMultilineSearch() ; 'Left Alt' => Toggle multiline search
RAlt Up:: TogglePrivateSearch() ; 'Right Alt / Alt Gr' => Toggle private search

#HotIf IsSet(SearchGui) && WinActive("ahk_id " SearchGui.Hwnd) && !SearchGui.Multiline
Enter Up:: SubmitSearch() ; 'Enter' => Submit a single line search

#HotIf IsSet(SearchGui) && WinActive("ahk_id " SearchGui.Hwnd) && SearchGui.Multiline
^Enter Up:: SubmitSearch() ; 'Control + Enter' => Submit a multiline search
#HotIf

; HOTKEYS

; Open URLs
>^R Up:: OpenURL("https://github.com/FyeCobain") ; GitHub Repositories
>^Q Up:: OpenURL("https://app.quicktype.io") ; quicktype

; Show web search bars
>^O Up:: ShowSearchBar(URLSearch) ; Right Control + O
>^E Up:: ShowSearchBar(EcosiaSearch) ; Right Control + E
>^G Up:: ShowSearchBar(GoogleSearch) ; Right Control + G
>^T Up:: ShowSearchBar(TranslateSearch) ; Right Control + T
>^I Up:: ShowSearchBar(ImagesSearch) ; Right Control + I
>^Y Up:: ShowSearchBar(YouTubeSearch) ; Right Control + Y
>^F Up:: ShowSearchBar(FlatIconSearch) ; Right Control + F
>^D Up:: ShowSearchBar(DockerHubSearch) ; Right Control + D
>^C Up:: ShowSearchBar(CanIUseSearch) ; Right Control + C