#Requires AutoHotkey v2.0

SetTimer(UPDATEDSCRIPT,1000)

UPDATEDSCRIPT() {
    attribs := FileGetAttrib(A_ScriptFullPath)
    if InStr(attribs, "A") {
        FileSetAttrib("-A", A_ScriptFullPath)
        ToolTip("Updated script")
        SetTimer(() => ToolTip(), -500)
        Reload()
    }
}


;Name
;Paste several segments at once
;===
;Description
; Ctrl+Alt+V to paste several segments at once in SDL Trados Studio,
; i.e. several lines at once (there is no limit to the number of pasted lines),
; so that each line goes into its respective segment in in SDL Trados Studio.
; This is very powerful if you have guided an LLM to translate, say, 100 segments
; in a customized way and now you want to paste the translation back into Trados
; for a final review / terminology / QA, etc.
; NOTE: Ensure target segments in Trados are empty
; and cursor is at the first empty segment before running the script
; NOTA: Asegúrate de que los segmentos objetivo en Trados estén vacíos
; y el cursor esté en el primer segmento vacío antes de ejecutar el script
; Original idea by: diegomendez40
; Implementation by: diegomendez40 
;===
;Content
#HotIf WinActive("ahk_exe SDLTradosStudio.exe") and WinActive("Trados Studio")

^!v::  ; Ctrl+Alt+V to activate the script
{
    if (A_Clipboard == "")
    {
        MsgBox "The clipboard is empty. Please copy the text you want to paste before running this script."
        return
    }

    Lines := StrSplit(A_Clipboard, "`n", "`r")
    for line in Lines
    {
        if (line != "")
        {
            SendText line
            Send "{Down}"
            Sleep 20  ; Short pause to ensure the action is completed
        }
    }
}

#HotIf
;===
;Active
;endScript

;Name
;Clear AT Statuses
;===
;Description
; Ctrl+Shift+F to clear AT statuses in SDL Trados Studio.
;===
;Content
#HotIf WinActive("ahk_exe SDLTradosStudio.exe") and WinActive("Trados Studio")

^+f::
{
    Send("^a^c!{Ins}^a^v")
}

#HotIf
;===
;Active
;endScript


;Name
;Character count
;===
;Description
; Ctrl+Alt+C to count characters in a selected text
; (this is an updated version by diegomendez40 based on an old version by Selcuk Akyuz)
;===
;Content
#HotIf WinActive("ahk_exe SDLTradosStudio.exe") and WinActive("Trados Studio")

^!c::
{
    Send "^c"
    ClipWait
    Chars := StrLen(A_Clipboard)
    Spaces := StrLen(RegExReplace(A_Clipboard, "\s"))
    MsgBox "The highlighted text is " . Chars . " characters in length and contains " . Spaces . " spaces."
    A_Clipboard := ""  ; Empty the clipboard
}

#HotIf
;===
;Active
;endScript


;Name
;Copy text to target
;===
;Description
;  Ctrl+Alt+x to copy selected text to the target segment. Great for transferring concordance results to the target segment for example.
;===
;Content
#HotIf WinActive("ahk_exe SDLTradosStudio.exe") and WinActive("Trados Studio")

^!x::
{
    Send "^c!+{F6}^v"
}

#HotIf
;===
;Active
;endScript

;Name
;Merge adjacent segments
;===
;Description
;  Ctrl+m to merge adjacent segments in Studio
;===
;Content
#HotIf WinActive("ahk_exe SDLTradosStudio.exe") and WinActive("Trados Studio")


^m::
{
    Send "!{Space}"
    Send "!{Down}"
    Send "!{Space}"
    Send "^!s"
}

#HotIf
;===
;Active
;endScript


;Name
;Move to next segment
;===

;Description
; Alt+Right Arrow for improved navigation between segments, brilliant for long segments with many lines of text (idea courtesy of Epameinondas Soufleros)
;===
;Content
#HotIf WinActive("ahk_exe SDLTradosStudio.exe") and WinActive("Trados Studio")

!Right::
{
    Send "{ctrl down}{pgdn}{ctrl up}"
    Send "{down}"
    Send "{ctrl down}{pgup}{ctrl up}"
}

#HotIf
;===
;Active
;endScript


;Name
;Move to previous segment
;===
;Description
; Alt+Left Arrow for improved navigation between segments, brilliant for long segments with many lines of text
; (updated plugin by diegomendez40 based on idea of Epameinondas Soufleros)
;===
;Content
#HotIf WinActive("ahk_exe SDLTradosStudio.exe") and WinActive("Trados Studio")

!Left::
{
    Send "{ctrl down}{pgup}{ctrl up}"
    Send "{up}"
    Send "{ctrl down}{pgup}{ctrl up}"
}

#HotIf
;===
;Active
;endScript