ShowSearchGui(Web, Private := False, Multiline := False) {
    global SearchGui
    if IsSet(SearchGui)
        DestroySearchGui()

    SetIcon(Web)
    SearchGui := Gui("+LastFound +AlwaysOnTop +Owner", (!Private ? Web : Web " (Private)"))
    SetIcon()
    WinSetTransparent 245
    SearchGui.BackColor := !Private ? "F9F9FB" : "8000D7"
    SearchGui.Web := Web
    SearchGui.Private := Private
    SearchGui.Multiline := Multiline
    SearchGui.OnEvent("Close", GuiObj => DestroySearchGui())
    SearchGui.SetFont("s13 c25003E", "Tahoma")
    EditSearch := SearchGui.AddEdit("+WantTab vEditSearchTerm w444 x2 y2 " (!Multiline ? "-WantReturn" : "r4"))
    SearchGui.Show("w448 h" . (!Multiline ? 33 : 96))
    ControlFocus EditSearch
}

DestroySearchGui() {
    global SearchGui
    SearchGui.Destroy()
    SearchGui := unset
}

TogglePrivateSearch() {
    SearchGui.Private := !SearchGui.Private
    SearchGui.BackColor := !SearchGui.Private ? "F9F9FB" : "8000D7"
    SearchGui.Title := !SearchGui.Private ? SearchGui.Web : SearchGui.Web " (Private)"
}

ToggleMultilineSearch() {
    ShowSearchGui(SearchGui.Web, SearchGui.Private, !SearchGui.Multiline)
}

SubmitSearch() {
    DestroySearchGui()
    MsgBox "TO-DO"
}