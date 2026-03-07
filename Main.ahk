; DIRECTIVES
#Requires AutoHotkey v2.0

; INCLUDES
#Include modules\Config.ahk
#Include modules\Browsers.ahk
#Include modules\Websites.ahk
#Include modules\Searches.ahk

; CONTEXT-SENSITIVE HOTKEYS
#HotIf IsSet(SearchGui)
Esc Up:: DestroySearchBar() ; 'Escape' => Close the search bar

#HotIf IsSet(SearchGui) && WinActive("ahk_id " SearchGui.Hwnd)
Alt Up:: ToggleMultilineSearch() ; 'Left Alt' => Toggle multiline search
RAlt Up:: TogglePrivateSearch() ; 'Right Alt / Alt Gr' => Toggle private search
+Tab Up:: ChangeBrowser() ; Shift + Tab => Previous browser
Tab Up:: ChangeBrowser(False) ; Tab => Next browser

#HotIf IsSet(SearchGui) && WinActive("ahk_id " SearchGui.Hwnd) && !SearchGui.Multiline
Enter Up:: SubmitSearch() ; 'Enter' => Submit a single line search

#HotIf IsSet(SearchGui) && WinActive("ahk_id " SearchGui.Hwnd) && SearchGui.Multiline
^Enter Up:: SubmitSearch() ; 'Control + Enter' => Submit a multiline search
#HotIf

; HOTKEYS

; Open URLs
>^R Up:: OpenURL("https://github.com/FyeCobain/WebSearchBars") ; 'Right Control + R' => Open repository in the default browser

; Show web search bars
>^O Up:: ShowSearchBar(DirectURL) ; 'Right Control + O' => Open URL
>^E Up:: ShowSearchBar(Ecosia) ; 'Right Control + E' => Ecosia
>^G Up:: ShowSearchBar(Google) ; 'Right ontrol + G' => Google
>^T Up:: ShowSearchBar(Translate) ; 'Right ontrol + T' => Google Translate
>^I Up:: ShowSearchBar(Images, Brave, True) ; 'Right Control + I' => Google Images in Brave, default in private mode
>^Y Up:: ShowSearchBar(YouTube) ; 'Right Control + Y' => YouTube in Edge
