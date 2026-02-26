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

; Search options
DefaultPrivate := False

; Web browsers ("Name", ".exe")
Edge := BrowserClass("Edge", "msedge")
Brave := BrowserClass("Brave", "brave")
LibreWolf := BrowserClass("LibreWolf", "C:\Program Files\LibreWolf\librewolf.exe")

; Setting the default browser
DefaultBrowser := Edge
