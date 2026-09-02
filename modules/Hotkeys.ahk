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
