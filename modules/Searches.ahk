EditSearchTerm := ""
FirefoxBasedRegEx := "i)Firefox|Waterfox|LibreWolf|Floorp"

; Creates and displays the web search bar for the indicated website
ShowSearchBar(WebsiteObj, BrowserObj := DefaultBrowser, Private := DefaultPrivate, Multiline := False) {
    global SearchGui
    global EditSearchTerm
    if IsSet(SearchGui)
        DestroySearchBar(SearchGui.Multiline == Multiline)

    SetIcon(WebsiteObj.Title)
    SearchGui := Gui("+LastFound +AlwaysOnTop +Owner", WebsiteObj.Title)
    SetIcon()
    WinSetTransparent 245
    SearchGui.WebsiteObj := WebsiteObj
    SearchGui.Private := Private
    SearchGui.Multiline := Multiline
    SearchGui.Browser := BrowserObj
    SearchGui.OnEvent("Close", GuiObj => DestroySearchBar())
    SearchGui.SetFont("s13 c25003E", "Tahoma")
    EditSearch := SearchGui.AddEdit("+WantTab vEditSearchTerm x0 y0 w444 " (!Multiline ? "-WantReturn" : "r5"), EditSearchTerm)
    SearchGui.Show("w444 h" (!Multiline ? SearchGuiHeight : MultilineSearchGuiHeight))

    SearchGui.SetFont("s9 c25003E", "Tahoma")
    SearchGui.AddStatusBar("vStatusBar x30 y20")
    ControlFocus EditSearch
    Send "{Right}"
    SetStatusBarIcon()
    SetStatusBarText()
}

; Destroys the search bar
DestroySearchBar(SaveSearchTerm := False) {
    global SearchGui
    global EditSearchTerm

    EditSearchTerm := !SaveSearchTerm ? "" : SearchGui['EditSearchTerm'].Value
    try
        SearchGui.Destroy()
    SearchGui := unset
}

; Changes the browser by creating a new search bar
ChangeBrowser(Backward := True) {
    global DefaultBrowser
    CurrentBrowserIndex := 1
    for Index, Browser in BrowserClass.Browsers
        if Browser == SearchGui.Browser {
            CurrentBrowserIndex := Index
            break
        }
    NewBrowserIndex := Mod(CurrentBrowserIndex, BrowserClass.Browsers.Length) + 1
    if (Backward)
        if (NewBrowserIndex == 1)
            NewBrowserIndex := BrowserClass.Browsers.Length - 1
        else if (NewBrowserIndex == 2)
            NewBrowserIndex := BrowserClass.Browsers.Length
        else
            NewBrowserIndex -= 2
    SearchGui.Browser := BrowserClass.Browsers[NewBrowserIndex]
    DefaultBrowser := SearchGui.Browser
    SetStatusBarIcon()
    SetStatusBarText()
}

; Toggles the multiline search by creating a new search bar
ToggleMultilineSearch() {
    if (SearchGui.WebsiteObj.HomeURL != "")
        ShowSearchBar(SearchGui.WebsiteObj, SearchGui.Browser, SearchGui.Private, !SearchGui.Multiline)
}

; Toggles the private search by updating the search bar
TogglePrivateSearch(FirstExecution := False) {
    global DefaultPrivate
    DefaultPrivate := !DefaultPrivate
    Exe := Trim(StrLower(SearchGui.Browser.Exe))
    SearchGui.Private := DefaultPrivate
    SearchGui.BackColor := !DefaultPrivate ? "F9F9FB" : "8000D7"
    SetStatusBarText()
}

SetStatusBarIcon() {
    try
        SearchGui['StatusBar'].SetIcon(A_WorkingDir "\icons\" SearchGui.Browser.Name ".ico")
}

SetStatusBarText() {
    try {
        Exe := Trim(StrLower(SearchGui.Browser.Exe))
        SearchGui['StatusBar'].SetText(SearchGui.Browser.Name (!SearchGui.Private ? "" : (" - " (RegExMatch(Exe, "i)Firefox|Waterfox|LibreWolf|Floorp|msedge") ? "Private" : "Incognito" ))))
    }
}

; Submits the search bar
SubmitSearch() {
    SearchTerm := SearchGui['EditSearchTerm'].Value
    WebsiteObj := SearchGui.WebsiteObj
    if !WebsiteObj.HomeURL && !Trim(SearchTerm)
        return
    Private := SearchGui.Private
    Browser := SearchGui.Browser

    if !SearchGui.WebsiteObj
        URL := SearchTerm
    else if SearchTerm == ""
        URL := SearchGui.WebsiteObj.HomeURL
    else
        URL := SearchGui.WebsiteObj.GetSearchURL(SearchTerm)

    DestroySearchBar()
    OpenURL(URL, Browser, Private)
}

; Opens the URL in the given mode and browser
OpenURL(URL, Browser := DefaultBrowser, Private := False) {
    URL := StrReplace(URL, "`n", "%0A")
    URL := StrReplace(URL, '"', '\"')
    URL := '"' . URL . '"'

    if RegExMatch(Browser.Exe, "i)msedge")
        Command := Browser.Exe ".exe " (Private ? "-inprivate " URL : URL)
    else if RegExMatch(Browser.Exe, FirefoxBasedRegEx)
        Command := Browser.Exe ".exe " (Private ? "--private-window " URL : URL)
    else
        Command := Browser.Exe ".exe " (Private ? "-incognito " URL : URL)

    try {
        Run Command
        MaximizeNewWindow(Browser.Exe)
    }
    catch
        MsgBox Browser.Exe ".exe not found", "Error", 16 + 4096
}

; Waits for a new browser window to open for a few seconds and then maximizes it
MaximizeNewWindow(BrowserExe) {
    ; Find all windows in the current browser
    BrowserExe := RegExReplace(BrowserExe, ".+\\")
    BrowserWindowsIds := []
    for Id in WinGetList("ahk_exe i)" BrowserExe "\.exe")
        BrowserWindowsIds.Push(Id)

    Sleep 500

    NewIdFound := False
    StartSearchTime := A_TickCount
    loop {
        for NewId in WinGetList("ahk_exe i)" BrowserExe "\.exe") {
            for Id in BrowserWindowsIds
                if NewId == Id
                    continue 2
            NewIdFound := NewId
            break 2
        }        
    } until NewIdFound || A_TickCount >= StartSearchTime + 3000

    if !NewIdFound
        return

    try
        WinMaximize "ahk_id " NewIdFound
}
