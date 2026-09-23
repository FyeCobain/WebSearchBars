class Browser {
    ; Static attributes
    static Browsers := []

    ; Constructor
    __New(Name, Exe) {
        this.Name := Name
        this.Icon := "/browsers/" StrLower(Name) ".ico"
        this.Exe := StrReplace(Exe, ".exe")
        Browser.Browsers.Push(this)
    }

    ; Returns the installed browsers
    static GetBrowsers() {
        InstalledExes := []
        Loop Reg "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths", "K"
            InstalledExes.Push(A_LoopRegName)
        Loop Reg "HKCU\Software\Microsoft\Windows\CurrentVersion\App Paths", "K"
            InstalledExes.Push(A_LoopRegName)

        InstalledBrowsers := []
        for _, CurrentBrowser in Browser.Browsers
            if !InStr(CurrentBrowser.Exe, ":") {
                for _, InstalledExe in InstalledExes
                    if InStr(InstalledExe, CurrentBrowser.Exe) {
                        InstalledBrowsers.Push(CurrentBrowser)
                        break
                    }
            }
            else if FileExist(CurrentBrowser.Exe ".exe")
                InstalledBrowsers.Push(CurrentBrowser)

        return InstalledBrowsers
    }
}

class Website {
    ; Static attributes
    static TermTemplate := "A_TermTemplate_" A_TickCount

    ; Constructor
    __New(Title, HomeURL, SearchURL) {
        this.Title := Title
        this.Icon := "/websites/" StrLower(Title) ".ico"
        this.HomeURL := HomeURL
        this.SearchURL := SearchURL
    }

    ; Creates and returns the search URL
    GetSearchURL(SearchTerm) {
        return !this.SearchURL ? SearchTerm : StrReplace(this.SearchURL, Website.TermTemplate, SearchTerm)
    }
}
