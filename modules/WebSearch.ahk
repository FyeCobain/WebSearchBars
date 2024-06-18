; Creates and displays the web search bar for the indicated website
ShowSearchBar(WebsiteObj, Private := False, Multiline := False, Browser := DefaultBrowser) {
    global SearchGui
    if IsSet(SearchGui)
        DestroySearchBar()

    SetIcon(WebsiteObj.Title)
    SearchGui := Gui("+LastFound +AlwaysOnTop +Owner")
    SetIcon()
    WinSetTransparent 245
    SearchGui.WebsiteObj := WebsiteObj
    SearchGui.Private := !Private
    SearchGui.Multiline := Multiline
    SearchGui.Browser := Browser
    TogglePrivateSearch()
    SearchGui.OnEvent("Close", GuiObj => DestroySearchBar())
    SearchGui.SetFont("s13 c25003E", "Tahoma")
    EditSearch := SearchGui.AddEdit("+WantTab vEditSearchTerm w444 x2 y2 " (!Multiline ? "-WantReturn" : "r4"))
    SearchGui.Show("w448 h" . (!Multiline ? 33 : 96))
    Try
        ControlFocus EditSearch
}

; Destroys the search bar
DestroySearchBar() {
    global SearchGui
    Try
        SearchGui.Destroy()
    SearchGui := unset
}

; Toggles the multiline search by creating a new search bar
ToggleMultilineSearch() {
    ShowSearchBar(SearchGui.WebsiteObj, SearchGui.Private, !SearchGui.Multiline, SearchGui.Browser)
}

; Toggles the private search by updating the search bar
TogglePrivateSearch() {
    SearchGui.Private := !SearchGui.Private
    SearchGui.BackColor := !SearchGui.Private ? "F9F9FB" : "8000D7"
    SearchGui.Title := !SearchGui.Private ? SearchGui.WebsiteObj.Title : SearchGui.WebsiteObj.Title " (private)"
}

; Submits the search bar
SubmitSearch() {
    SearchTerm := SearchGui['EditSearchTerm'].Value
    WebsiteObj := SearchGui.WebsiteObj
    Private := SearchGui.Private
    Browser := SearchGui.Browser
    
    if !SearchGui.WebsiteObj
        URL := SearchTerm
    else if SearchTerm == ""
        URL := SearchGui.WebsiteObj.HomeURL
    else
        URL := SearchGui.WebsiteObj.GetSearchURL(SearchTerm)

    if URL {
        DestroySearchBar()
        OpenURL(URL, Private, Browser)
    }
}

; Opens the URL in the given mode and browser
OpenURL(URL, Private := False, Browser := DefaultBrowser) {
    URL := StrReplace(URL, "`n", "%0A")
    URL := StrReplace(URL, '"', '\"')
    URL := '"' . URL . '"'

    if StrLower(Browser) == "firefox"
        Run "Firefox.exe " (Private ? "--private-window " URL : URL)
    else
        Run Browser ".exe " (Private ? "-incognito " URL : URL)
}