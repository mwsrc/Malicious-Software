Attribute VB_Name = "modSelfKill"
Option Explicit

Private Befehl$
Private MeFile$
Private BatFile$
Private Comment As Boolean

Private Declare Function CharToOemA Lib "user32.dll" (ByVal _
        lpszSrc As String, ByVal lpszDst As String) As Long

Public Sub Selfdestruction()

 Dim ff As Long
 ff = FreeFile


 'verhindert das auftauchen von "\\" im Dateinamen:
 If Len(App.Path) > 3 Then 'In einem Unterverzeichnis
    MeFile = App.Path & "\" & App.ExeName & ".exe"
    BatFile = App.Path & "\" & "Kill.bat"
 Else 'Direkt auf der Festplatte
    MeFile = App.Path & App.ExeName & ".exe"
    BatFile = App.Path & "Kill.bat"
 End If
 
 'falls Attribute (wie z.B. Schreibschutz)
 'gesetzt sind, werden diese augeschaltet
 If GetAttr(MeFile) Then SetAttr MeFile, 0

 'Konvertiert Dateinamen zu ANSI-Code
 Call CharToOemA(MeFile, MeFile)

 
 If Comment Then Befehl = "@echo off" & vbCrLf 'verhindert Anzeigen der Befehle im DOS-Fenster
 Befehl = Befehl & ":Marke" & vbCrLf
 Befehl = Befehl & "Del " & Chr(34) & MeFile & Chr(34) & vbCrLf  'Befehl zum Zerstören der EXE
 Befehl = Befehl & "If Exist " & Chr(34) & MeFile & Chr(34) & " Goto Marke" & vbCrLf 'falls EXE noch vorhanden (Zugriff verweigert) --> zurück zu :Marke
 If Comment Then Befehl = Befehl & "echo." & vbCrLf & "echo EXE wurde zerstoert" & vbCrLf & "echo." & vbCrLf 'gibt Text aus
 Befehl = Befehl & "del " & Chr(34) & BatFile & Chr(34) 'Bat-Datei zerstört sich selbst


 'Bat-Datei muss binär erstellt werden
 Open BatFile For Binary As #ff
    Put #ff, , Befehl
 Close #ff
 
 If Not Comment Then
    Shell BatFile, vbHide
 Else
    Shell BatFile, vbNormalFocus
 End If

 End

End Sub
