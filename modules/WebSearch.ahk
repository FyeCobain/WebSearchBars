; Creates and displays the web search bar for the indicated website
ShowSearchGui(Web, Private := False, Multiline := False) {
    global SearchGui
    if IsSet(SearchGui)
        DestroySearchGui()

    SetIcon(Web)
    SearchGui := Gui("+LastFound +AlwaysOnTop +Owner")
    SetIcon()
    WinSetTransparent 245
    SearchGui.Private := !Private
    SearchGui.Multiline := Multiline
    SearchGui.WebsiteObj := Website.FindWebsiteObject(Web)
    SearchGui.OnEvent("Close", GuiObj => DestroySearchGui())
    SearchGui.SetFont("s13 c25003E", "Tahoma")
    EditSearch := SearchGui.AddEdit("+WantTab vEditSearchTerm w444 x2 y2 " (!Multiline ? "-WantReturn" : "r4"))
    SearchGui.Show("w448 h" . (!Multiline ? 33 : 96))
    TogglePrivateSearch()
    ControlFocus EditSearch
}

; Destroys the search bar
DestroySearchGui() {
    global SearchGui
    SearchGui.Destroy()
    SearchGui := unset
}

; Toggles the multiline search by creating a new search bar
ToggleMultilineSearch() {
    ShowSearchGui(SearchGui.WebsiteObj.Name, SearchGui.Private, !SearchGui.Multiline)
}

; Toggles the private search by updating the search bar
TogglePrivateSearch() {
    SearchGui.Private := !SearchGui.Private
    SearchGui.BackColor := !SearchGui.Private ? "F9F9FB" : "8000D7"
    SearchGui.Title := !SearchGui.Private ? SearchGui.WebsiteObj.Name : SearchGui.WebsiteObj.Name " (Private)"
}

; Submits the search bar
SubmitSearch() {
    WebsiteObj := SearchGui.WebsiteObj
    Private := SearchGui.Private
    SearchTerm := SearchGui['EditSearchTerm'].Value
    
    if !SearchGui.WebsiteObj
        URL := SearchTerm
    else if SearchTerm == ""
        URL := SearchGui.WebsiteObj.HomeURL
    else
        URL := SearchGui.WebsiteObj.GetSearchURL(SearchTerm)

    if URL {
        DestroySearchGui()
        OpenURL(URL)
    }
}

; Opens the final URL in the indicated browser
OpenURL(URL) {
    ; TODO
}