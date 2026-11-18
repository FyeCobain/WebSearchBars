; GENERAL

DefaultPrivate := False

; 'en' | 'es' | 'de' | 'ja' ...
TargetLang := "en"

; 'USD' | 'EUR' | 'MXN' | 'JPY' ...
SourceCurrency := "USD"
TargetCurrency := "USd"

; WEB BROWSERS

; 1. Name: Must match the icon name, case insensitive.
; 2. exe: as you would open it from the "Windows + R" dialog.
LibreWolf := Browser("LibreWolf", "C:\Program Files\LibreWolf\librewolf.exe")
Waterfox := Browser("Waterfox", "waterfox")
Floorp := Browser("Floorp", "floorp")
Zen := Browser("Zen", "zen")
Firefox := Browser("Firefox", "firefox")
Brave := Browser("Brave", "brave")
Opera := Browser("Opera", "opera")
Vivaldi := Browser("Vivaldi", "vivaldi")
Chrome := Browser("Chrome", "chrome")
Edge := Browser("Edge", "msedge")

; WEBSITES
TermTemplate := Website.TermTemplate

; 1. Title: Must match the icon name, case insensitive.
; 2. HomeURL: It will open when the text box is empty.
; 3. SearchURL: The value of 'TermTemplate' will be replaced with the search term.

Open := Website("Open", "", "")

Ecosia := Website(
    "Ecosia",
    "https://www.ecosia.org",
    "https://www.ecosia.org/search?method=index&q=" . TermTemplate
)

DuckDuckGo := Website(
    "DuckDuckGo",
    "https://duckduckgo.com/",
    "duckduckgo.com/?q=" . TermTemplate
)

Google := Website(
    "Google",
    "https://www.google.com",
    "https://www.google.com/search?q=" . TermTemplate
)

Translate := Website(
    "Translate",
    "https://translate.google.com.mx/?hl=" . TargetLang . "&sl=auto&tl=" . TargetLang . "&op=translate",
    "https://translate.google.com.mx/?hl=" . TargetLang . "&sl=auto&tl=" . TargetLang . "&text=" . TermTemplate . "&op=translate"
)

XE := Website(
    "XE",
    "https://www.xe.com",
    "https://www.xe.com/es/currencyconverter/convert/?Amount=" . TermTemplate . "&From=" . StrUpper(SourceCurrency) . "&To=" . StrUpper(TargetCurrency)
)

Images := Website(
    "Images",
    "https://images.google.com",
    "https://www.google.com/search?tbm=isch&q=" . TermTemplate
)

YouTube := Website(
    "YouTube",
    "https://www.youtube.com",
    "https://www.youtube.com/results?search_query=" . TermTemplate
)
