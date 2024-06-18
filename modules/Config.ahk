; DIRECTIVES
#SingleInstance Force
#NoTrayIcon

; VARIABLES

; 'Firefox' | 'MSEdge' | 'Brave' | 'Vivaldi' | 'Chrome' ...
DefaultBrowser := "Firefox"

; 'en' | 'es' | 'de' ...
TranslationTargetLang := "en"

; Icon configuration
SetIcon()
A_IconHidden := False

; Tray menu configuration
A_IconTip := "Web Search Bars"
A_TrayMenu.Delete()
A_TrayMenu.Add("Reload Script", (ItemName, ItemPos, MyMenu) => Reload())
A_TrayMenu.Add("Suspend Hotkeys", (ItemName, ItemPos, MyMenu) => SuspendScript())
A_TrayMenu.Add("Edit Script", (ItemName, ItemPos, MyMenu) => Edit())
A_TrayMenu.Add()
A_TrayMenu.Add("Open Working Directory", (ItemName, ItemPos, MyMenu) => Run(A_WorkingDir))
A_TrayMenu.Add("Go to documentation", (ItemName, ItemPos, MyMenu) => Run("https://github.com/FyeCobain/WebSearchBars"))
A_TrayMenu.Add()
A_TrayMenu.Add("Run on Windows Startup", (ItemName, ItemPos, MyMenu) => ToggleRunOnStartup())
A_TrayMenu.Add()
A_TrayMenu.Add("Exit", (ItemName, ItemPos, MyMenu) => ExitApp())
ToggleRunOnStartup()
ToggleRunOnStartup()

; Sets the current icon
SetIcon(IconName := "Search") {
    Try
        TraySetIcon A_WorkingDir "\icons\" IconName ".ico"
}

; Suspend / Unsuspend script
SuspendScript() {
    Suspend
    if A_IsSuspended
        A_TrayMenu.Rename("Suspend Hotkeys", "Unsuspend Hotkeys")
    else
        A_TrayMenu.Rename("Unsuspend Hotkeys", "Suspend Hotkeys")
}

; Sets the checked / unchecked state of the "Run on Startup" button
SetRunOnStartupButtonCheckState() {
    FileExist(A_Startup "\WebSearchBars.lnk") ? A_TrayMenu.Check("Run on Windows Startup") : A_TrayMenu.Uncheck("Run on Windows Startup")
}

; Creates / deletes the auto run shortcut
ToggleRunOnStartup() {
    if !FileExist(A_Startup "\WebSearchBars.lnk")
        FileCreateShortcut A_ScriptFullPath, A_Startup "\WebSearchBars.lnk", A_WorkingDir, , "Web Search Bars", A_WorkingDir "\icons\search.ico"
    else
        FileDelete A_Startup "\WebSearchBars.lnk"
    SetRunOnStartupButtonCheckState()
}