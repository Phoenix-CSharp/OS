set FSO = WScript.CreateObject("Scripting.FileSystemObject")
msgbox "Успешно"
set File= FSO.CreateTextFile("Ping.txt",true)
msgbox "Успешно"