; Website class
class Website {
    ; Static attributes
    static TermTemplate := "${A_TermTemplate}"

    ; Constructor
    __New(Title, HomeURL := "", SearchURL := "") {
        this.Title := Title
        this.HomeURL := HomeURL
        this.SearchURL := SearchURL
    }

    ; Creates the final search URL
    GetSearchURL(SearchTerm) {
        if !this.SearchURL
            return SearchTerm

        return StrReplace(this.SearchURL, Website.TermTemplate, StrReplace(SearchTerm, "`n", "%0A"))
    }
}

; Websites
URLSearch := Website("Open URL")

EcosiaSearch := Website(
    "Ecosia",
    "https://www.ecosia.org",
    "https://www.ecosia.org/search?method=index&q=" Website.TermTemplate
)

GoogleSearch := Website(
    "Google",
    "https://www.google.com",
    "https://www.google.com/search?q=" Website.TermTemplate
)

TranslateSearch := Website(
    "Translate",
    "https://translate.google.com.mx/?hl=es&sl=auto&tl=es&op=translate",
    "https://translate.google.com.mx/?hl=es&sl=auto&tl=es&text=" Website.TermTemplate "&op=translate"
)

ImagesSearch := Website(
    "Images",
    "https://images.google.com",
    "https://www.google.com/search?q=" Website.TermTemplate
)

YouTubeSearch := Website(
    "YouTube",
    "https://www.youtube.com",
    "https://www.youtube.com/results?search_query=" Website.TermTemplate
)

FlatIconSearch := Website(
    "Flaticon",
    "https://www.flaticon.com",
    "https://www.flaticon.com/search?word=" Website.TermTemplate
)

DockerHubSearch := Website(
    "Docker Hub",
    "https://hub.docker.com",
    "https://hub.docker.com/search?q=" Website.TermTemplate
)

CanIUseSearch := Website(
    "Can I Use",
    "https://caniuse.com",
    "https://caniuse.com/?search=" Website.TermTemplate
)