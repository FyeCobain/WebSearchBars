; DIRECTIVES
#Requires AutoHotkey v2.0

; INCLUDES
#Include %A_WorkingDir%\modules\Config.ahk
#Include %A_WorkingDir%\modules\Browsers.ahk
#Include %A_WorkingDir%\modules\Websites.ahk
#Include %A_WorkingDir%\modules\Searches.ahk

; CONTEXT-SENSITIVE HOTKEYS
#HotIf IsSet(SearchGui)
Esc Up:: DestroySearchBar() ; 'Escape' => Close the search bar

#HotIf IsSet(SearchGui) && WinActive("ahk_id " SearchGui.Hwnd)
Alt Up:: ToggleMultilineSearch() ; 'Left Alt' => Toggle multiline search
RAlt Up:: TogglePrivateSearch() ; 'Right Alt / Alt Gr' => Toggle private search
+Tab:: ChangeBrowser() ; Shift + Tab => Previous browser
Tab:: ChangeBrowser(False) ; Tab => Next browser

#HotIf IsSet(SearchGui) && WinActive("ahk_id " SearchGui.Hwnd) && !SearchGui.Multiline
Enter Up:: SubmitSearch() ; 'Enter' => Submit a single line search

#HotIf IsSet(SearchGui) && WinActive("ahk_id " SearchGui.Hwnd) && SearchGui.Multiline
^Enter Up:: SubmitSearch() ; 'Control + Enter' => Submit a multiline search
#HotIf

; HOTKEYS

; Open URLs
>^R Up:: OpenURL("https://github.com/FyeCobain/WebSearchBars") ; 'Right Control + R' => Open repository in the default browser
>^N Up:: OpenURL("https://www.netflix.com", Brave, true) ; 'Right Control + N' => Open Netflix in a private Brave window

; Show web search bars
>^O Up:: ShowSearchBar(OpenURLSearch) ; 'Right Control + O' => Open URL
>^E Up:: ShowSearchBar(EcosiaSearch) ; 'Right Control + E' => Ecosia
>^G Up:: ShowSearchBar(GoogleSearch) ; 'Right ontrol + G' => Google
>^T Up:: ShowSearchBar(TranslateSearch) ; 'Right ontrol + T' => Google Translate
>^I Up:: ShowSearchBar(ImagesSearch, Brave, True) ; 'Right Control + I' => Google Images in Brave, default in private mode
>^Y Up:: ShowSearchBar(YouTubeSearch) ; 'Right Control + Y' => YouTube in Edge
