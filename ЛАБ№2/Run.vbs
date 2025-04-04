Function ConvertSTR (strVV)
	dim strVK
	dim simbolVV 
	For x = 1 To len (strVV)
		simbolVV = Mid (strVV, x, 1)
		if ((asc (simbolVV) >= 128) AND (asc (simbolVV) <= 175)) Then
			strVK = strVK + chr (asc (simbolVV) + 64)
		Else 
			if ((asc (simbolVV) >= 224) AND (asc (simbolVV) <= 239)) Then
				strVK = strVK + chr (asc (simbolVV) + 16)
			Else 
				strVK = StrVK + Mid (strVV, x, 1)
			End If
		End If
	Next
	ConvertSTR = strVK
End Function

Dim Message, Title, Default, MyValue, String, Flag, Mystring
Message = "Enter a website adress: "
Title = "InputBox"
Buttons = 1    
MyValue = InputBox(Message, Title, Default)

set vShell=WScript.CreateObject("WScript.Shell")
set FSO=WScript.CreateObject("Scripting.FileSystemObject")
set File=FSO.CreateTextFile("Ping_Result.txt", true)
Flag = 0
set objRegExp = CreateObject("VBScript.RegExp")
objRegExp.Pattern=ConvertSTR("TTL=")

set vProcess=vShell.Exec ("cmd.exe /C ping "+MyValue)
while(NOT vProcess.StdOut.AtEndOfStream)
	String=vProcess.StdOut.ReadLine()
	if (objRegExp.Test(String)) Then
		Flag = 1
	End If
	File.WriteLine(ConvertSTR(String))
wend

if (Flag=1) Then
	Mystring = "Access is allowed"
	File.WriteLine(ConvertSTR(Mystring))
Else
	Mystring = "Access is unavailable"
	File.WriteLine(ConvertSTR(Mystring))
End If
vProcess.Terminate()
set vProcess=vShell.Exec("cmd.exe /C notepad Ping_Result.txt")