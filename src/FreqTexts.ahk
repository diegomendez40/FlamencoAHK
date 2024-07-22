#Requires AutoHotkey v2.0

;Name
;Signature
;===
;Description
; Personal signature -- provides hotstring and hotkey
;===
;Content

; Definir el hotstring para tu nombre y cargo
::minfo::Diego Méndez Romero{Enter}PhD, Multimedia and Communications (UC3M)

; Tecla de acceso rápido (Ctrl+Shift+N) para insertar nombre y cargo
^+n::
{
    A_Clipboard := "--`nDiego Méndez Romero`nPhD, Multimedia and Communications (UC3M)"
    Send "^v"
    return
}
;===
;Active
;endScript


;Name
;Signature
;===
;Description
; Frequent German-language reply to customers -- provides hotstring and hotkey
;===
;Content

; Definir el hotstring para la respuesta positiva en alemán
::accept_de::Hallo Frau ___,{Enter}{Enter}Herzlichen Dank für Ihre Anfrage. Ja, ich kann den Auftrag annehmen.{Enter}{Enter}Mit freundlichen Grüßen,{Enter}--{Enter}Diego Méndez Romero{Enter}PhD, Multimedia and Communications (UC3M)

; Tecla de acceso rápido (Ctrl+Shift+1) para insertar respuesta positiva en alemán
^+1::
{
    A_Clipboard := "Hallo Frau ___,`n`nHerzlichen Dank für Ihre Anfrage. Ja, ich kann den Auftrag annehmen.`n`nMit freundlichen Grüßen,`n--`nDiego Méndez Romero`nPhD, Multimedia and Communications (UC3M)"
    Send "^v"
    return
}
;===
;Active
;endScript