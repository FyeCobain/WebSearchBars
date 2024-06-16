; Website class
class Website {
    ; Static attributes
    static TermTemplate := "${A_TermTemplate}"

    ; Constructor
    __New(Name, HomeURL := "", SearchURL := "") {
        this.Name := Name
        this.HomeURL := HomeURL
        this.SearchURL := SearchURL
    }

    ; Searches and returns the website object from the websites array
    static FindWebsiteObject(Web) {
        Loop Websites.Length
            if Trim(StrLower(Web)) == Trim(StrLower(Websites[A_Index].Name))
                return Websites[A_Index]
        return False
    }

    ; Creates the final search URL
    GetSearchURL(SearchTerm) {
        if !this.SearchURL
            return SearchTerm

        return StrReplace(this.SearchURL, Website.TermTemplate, StrReplace(SearchTerm, "`n", "%0A"))
    }
}

; Websites array
Websites := [
    Website("Open URL"),
    Website(
        "Ecosia",
        "https://www.ecosia.org",
        "https://www.ecosia.org/search?method=index&q=" Website.TermTemplate
    ),
    Website(
        "Google",
        "https://www.google.com",
        "https://www.google.com/search?q=" Website.TermTemplate
    ),
    Website(
        "Google Translate",
        "https://translate.google.com.mx/?hl=es&sl=auto&tl=es&op=translate",
        "https://translate.google.com.mx/?hl=es&sl=auto&tl=es&text=" Website.TermTemplate "&op=translate"
    ),
    Website(
        "Images",
        "https://images.google.com",
        "https://www.google.com/search?q=" Website.TermTemplate
    ),
    Website(
        "YouTube",
        "https://www.youtube.com",
        "https://www.youtube.com/results?search_query=" Website.TermTemplate
    ),
    Website(
        "Flaticon",
        "https://www.flaticon.com",
        "https://www.flaticon.com/search?word=" Website.TermTemplate
    ),
    Website(
        "Docker Hub",
        "https://hub.docker.com",
        "https://hub.docker.com/search?q=" Website.TermTemplate
    ),
    Website(
        "Can I Use",
        "https://caniuse.com",
        "https://caniuse.com/?search=" Website.TermTemplate
    ),
]