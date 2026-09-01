; Web browsers ("Name", ".exe")
LibreWolf := BrowserClass("LibreWolf", "C:\Program Files\LibreWolf\librewolf.exe")
Waterfox := BrowserClass("Waterfox", "waterfox")
Floorp := BrowserClass("Floorp", "floorp")
Firefox := BrowserClass("Firefox", "firefox")
Brave := BrowserClass("Brave", "brave")
Vivaldi := BrowserClass("Vivaldi", "vivaldi")
Chrome := BrowserClass("Chrome", "chrome")
Edge := BrowserClass("Edge", "msedge")

; 'Browser' class
class BrowserClass {
    ; Static attributes
    static Browsers := []

    ; Constructor
    __New(Name, Exe) {
        this.Name := Name
        this.Icon := "/browsers/" StrLower(Name) ".ico"
        this.Exe := StrReplace(Exe, ".exe", , True)
        BrowserClass.Browsers.Push(this)
    }
}
