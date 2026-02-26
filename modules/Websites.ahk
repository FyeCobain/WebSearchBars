; 'Website' class
class Website {
    ; Static attributes
    static TermTemplate := "A_TermTemplate_" A_TickCount

    ; Constructor
    __New(Title, HomeURL, SearchURL) {
        this.Title := Title
        this.HomeURL := HomeURL
        this.SearchURL := SearchURL
    }

    ; Creates and returns the search URL
    GetSearchURL(SearchTerm) {
        return !this.SearchURL ? SearchTerm : StrReplace(this.SearchURL, Website.TermTemplate, SearchTerm)
    }
}

; Websites
OpenURLSearch := Website("Open URL", "", "")

EcosiaSearch := Website(
    "Ecosia",
    "https://www.ecosia.org",
    "https://www.ecosia.org/search?method=index&q=" . Website.TermTemplate
)

GoogleSearch := Website(
    "Google",
    "https://www.google.com",
    "https://www.google.com/search?q=" . Website.TermTemplate
)

TranslateSearch := Website(
    "Translate",
    "https://translate.google.com.mx/?hl=" . TranslationTargetLang . "&sl=auto&tl=" . TranslationTargetLang . "&op=translate",
    "https://translate.google.com.mx/?hl=" . TranslationTargetLang . "&sl=auto&tl=" . TranslationTargetLang . "&text=" . Website.TermTemplate . "&op=translate"
)

ImagesSearch := Website(
    "Images",
    "https://images.google.com",
    "https://www.google.com/search?tbm=isch&q=" . Website.TermTemplate
)

YouTubeSearch := Website(
    "YouTube",
    "https://www.youtube.com",
    "https://www.youtube.com/results?search_query=" . Website.TermTemplate
)
