; VARIABLES
; 'en' | 'es' | 'de' | 'ja' ...
TranslationTargetLang := "en"

DefaultPrivate := False

; Websites
; 1. Title: Must match the icon name, case insensitive.
; 2. HomeURL: It will open when the text box is empty.
; 3. SearchURL: The value of 'Website.TermTemplate' will be replaced with the search term.
Open := Website("Open", "", "")

Ecosia := Website(
    "Ecosia",
    "https://www.ecosia.org",
    "https://www.ecosia.org/search?method=index&q=" . Website.TermTemplate
)

DuckDuckGo := Website(
    "DuckDuckGo",
    "https://duckduckgo.com/",
    "duckduckgo.com/?q=" . Website.TermTemplate
)

Google := Website(
    "Google",
    "https://www.google.com",
    "https://www.google.com/search?q=" . Website.TermTemplate
)

Translate := Website(
    "Translate",
    "https://translate.google.com.mx/?hl=" . TranslationTargetLang . "&sl=auto&tl=" . TranslationTargetLang . "&op=translate",
    "https://translate.google.com.mx/?hl=" . TranslationTargetLang . "&sl=auto&tl=" . TranslationTargetLang . "&text=" . Website.TermTemplate . "&op=translate"
)

Images := Website(
    "Images",
    "https://images.google.com",
    "https://www.google.com/search?tbm=isch&q=" . Website.TermTemplate
)

YouTube := Website(
    "YouTube",
    "https://www.youtube.com",
    "https://www.youtube.com/results?search_query=" . Website.TermTemplate
)
