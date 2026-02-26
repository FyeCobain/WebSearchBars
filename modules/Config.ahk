; DIRECTIVES
#SingleInstance Force
#NoTrayIcon

; CONFIGURTATION
SetIcon()
A_IconHidden := False
SplitPath A_AhkPath, , &AHKDir
SearchGuiHeight := 49
MultilineSearchGuiHeight := 136

; VARIABLES
TranslationTargetLang := "en" ; 'en' | 'es' | 'de' ...

; Tray menu configuration
A_IconTip := "Web Search Bars"
A_TrayMenu.Delete()
A_TrayMenu.Add("Reload Script", (ItemName, ItemPos, MyMenu) => Reload())
A_TrayMenu.SetIcon("Reload Script", "Shell32.dll", 296)
A_TrayMenu.Add("Suspend Hotkeys", (ItemName, ItemPos, MyMenu) => SuspendScript())
A_TrayMenu.SetIcon("Suspend Hotkeys", "Shell32.dll", 28)
A_TrayMenu.Add("Edit Script", (ItemName, ItemPos, MyMenu) => Edit())
A_TrayMenu.SetIcon("Edit Script", "Shell32.dll", 270)
A_TrayMenu.Add()
A_TrayMenu.Add("Open Working Directory", (ItemName, ItemPos, MyMenu) => Run(A_WorkingDir))
A_TrayMenu.SetIcon("Open Working Directory", "Shell32.dll", 46)
A_TrayMenu.Add("Repository / Docs", (ItemName, ItemPos, MyMenu) => Run("https://github.com/FyeCobain/WebSearchBars"))
A_TrayMenu.SetIcon("Repository / Docs", "Shell32.dll", 264)
A_TrayMenu.Add("AutoHotkey v2 Help", (ItemName, ItemPos, MyMenu) => Run(AHKDir "\AutoHotkey.chm"))
A_TrayMenu.SetIcon("AutoHotkey v2 Help", "Shell32.dll", 24)
A_TrayMenu.Add()
A_TrayMenu.Add("Run on Windows Startup", (ItemName, ItemPos, MyMenu) => ToggleRunOnStartup())
A_TrayMenu.SetIcon("Run on Windows Startup", "Shell32.dll", 132)
A_TrayMenu.Add()
A_TrayMenu.Add("Exit", (ItemName, ItemPos, MyMenu) => ExitApp())
A_TrayMenu.SetIcon("Exit", "Shell32.dll", 265)
ToggleRunOnStartup()
ToggleRunOnStartup()

; Sets the current icon
SetIcon(IconName := "search") {
    Try
        TraySetIcon(A_WorkingDir "\icons\" IconName ".ico", , True)
}

; Suspend / Unsuspend script
SuspendScript() {
    Suspend
    if A_IsSuspended {
        A_TrayMenu.SetIcon("Suspend Hotkeys", "Shell32.dll", 138)
        A_TrayMenu.Rename("Suspend Hotkeys", "Unsuspend Hotkeys")
        SetIcon("suspended")
    }
    else {
        A_TrayMenu.SetIcon("Unsuspend Hotkeys", "Shell32.dll", 28)
        A_TrayMenu.Rename("Unsuspend Hotkeys", "Suspend Hotkeys")
        SetIcon()
    }
}

; Creates / deletes the auto run shortcut
ToggleRunOnStartup() {
    if !FileExist(A_Startup "\WebSearchBars.lnk") {
        FileCreateShortcut A_ScriptFullPath, A_Startup "\WebSearchBars.lnk", A_WorkingDir, , "Web Search Bars", A_WorkingDir "\icons\search.ico"
        A_TrayMenu.SetIcon("Run on Windows Startup", "Shell32.dll", 295)
    }
    else {
        FileDelete A_Startup "\WebSearchBars.lnk"
        A_TrayMenu.SetIcon("Run on Windows Startup", "Shell32.dll", 132)
    }
}
