; DIRECTIVES / CONFIGURATION
#SingleInstance Force
#NoTrayIcon
SetTitleMatchMode "RegEx"

; INCLUDES
#Include Config.ahk
#Include modules\CoreConfig.ahk
#Include modules\Classes.ahk
#Include modules\Searches.ahk
#Include modules\CoreHotkeys.ahk

; HOTKEYS

; Open URLs
>^R Up:: OpenURL("https://github.com/FyeCobain/WebSearchBars") ; 'Right Control + R' => Open repository in the default browser

; Show web search bars
>^O Up:: ShowSearchBar(Open) ; 'Right Control + O' => Open URL
>^E Up:: ShowSearchBar(Ecosia) ; 'Right Control + E' => Ecosia
>^D Up:: ShowSearchBar(DuckDuckGo) ; 'Right Control + D' => DuckDuckGo
>^G Up:: ShowSearchBar(Google) ; 'Right ontrol + G' => Google
>^T Up:: ShowSearchBar(Translate) ; 'Right ontrol + T' => Google Translate
>^I Up:: ShowSearchBar(Images, , True) ; 'Right Control + I' => Google Images, default in private mode
>^Y Up:: ShowSearchBar(YouTube) ; 'Right Control + Y' => YouTube in Edge
