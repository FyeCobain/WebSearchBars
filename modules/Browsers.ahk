; 'Browser' class
class BrowserClass {
    ; Static attributes
    static Browsers := []

    ; Constructor
    __New(Name, Exe) {
        this.Name := Name
        this.Exe := StrReplace(Exe, ".exe", , True)
        BrowserClass.Browsers.Push(this)
    }
}

; VARIABLES
; 'en' | 'es' | 'de' | 'ja' ...
TranslationTargetLang := "en"

DefaultPrivate := False

; Web browsers ("Name", ".exe")
Edge := BrowserClass("Edge", "msedge")
LibreWolf := BrowserClass("LibreWolf", "C:\Program Files\LibreWolf\librewolf.exe")
Firefox := BrowserClass("Firefox", "firefox")
Brave := BrowserClass("Brave", "brave")
Chrome := BrowserClass("Chrome", "chrome")

; Setting the default browser
DefaultBrowser := Edge
