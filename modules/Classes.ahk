; 'Browser' class
class Browser {
    ; Static attributes
    static Browsers := []

    ; Constructor
    __New(Name, Exe) {
        this.Name := Name
        this.Icon := "/browsers/" StrLower(Name) ".ico"
        this.Exe := StrReplace(Exe, ".exe", , True)
        Browser.Browsers.Push(this)
    }
}

; 'Website' class
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
