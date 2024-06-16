; DIRECTIVES
#SingleInstance Force
#NoTrayIcon

; Sets the current icon
SetIcon(IconName := "Search") {
    Try
        TraySetIcon A_WorkingDir "\icons\" IconName ".ico"
}

SetIcon()
A_IconHidden := False