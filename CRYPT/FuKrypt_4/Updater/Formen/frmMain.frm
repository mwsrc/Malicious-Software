VERSION 5.00
Object = "{A8E5842E-102B-4289-9D57-3B3F5B5E15D3}#13.2#0"; "COA2A4~1.OCX"
Begin VB.Form frmMain 
   BorderStyle     =   4  'Festes Werkzeugfenster
   Caption         =   "Fukrypt 4 Updater"
   ClientHeight    =   1155
   ClientLeft      =   45
   ClientTop       =   360
   ClientWidth     =   10155
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1155
   ScaleWidth      =   10155
   StartUpPosition =   2  'Bildschirmmitte
   Begin XtremeSuiteControls.GroupBox GroupBox1 
      Height          =   1035
      Left            =   60
      TabIndex        =   0
      Top             =   60
      Width           =   10035
      _Version        =   851970
      _ExtentX        =   17701
      _ExtentY        =   1826
      _StockProps     =   79
      Caption         =   "Update:"
      Appearance      =   1
      Begin XtremeSuiteControls.ProgressBar PG 
         Height          =   315
         Left            =   120
         TabIndex        =   1
         Top             =   300
         Width           =   9795
         _Version        =   851970
         _ExtentX        =   17277
         _ExtentY        =   556
         _StockProps     =   93
      End
      Begin XtremeSuiteControls.Label LblDLStatus 
         Height          =   255
         Left            =   120
         TabIndex        =   2
         Top             =   660
         Width           =   4935
         _Version        =   851970
         _ExtentX        =   8705
         _ExtentY        =   450
         _StockProps     =   79
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

        
Dim WithEvents FileDownload As clsDownload
Attribute FileDownload.VB_VarHelpID = -1

Private Declare Function ShellExecute Lib "shell32.dll" Alias _
        "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation _
        As String, ByVal lpFile As String, ByVal lpParameters _
        As String, ByVal lpDirectory As String, ByVal nShowCmd _
        As Long) As Long
        

Private Sub FileDownload_Progress(ByVal BytesLoaded As Long, ByVal FileSize As Long)
PG.Max = CStr(FileSize)
PG.Value = CStr(BytesLoaded)

LblDLStatus.Caption = Round(CStr(BytesLoaded) / 1000000, 2) & " MB / " & Round(CStr(FileSize) / 1000000, 2) & " MB"
End Sub

Sub FileDownload_Finished()
On Error GoTo err
Const ph = "<*This*Section*>"
Const SPU = "h97h847hf387h8f73h487fh3n4zbn34u2093m2coirtj3o5uihzn45z4n985m948"
Const SPU2 = "f294hr924tf8h4gi464zhon5ophin5049jh094j54095j9358hjngo9203hdf293"
Dim DatenPacket As String
Dim Datei As String
Dim e As New clsGost
Dim DateiName As String
Dim SubFolder As String

Open Environ$("Temp") & "\rev.rrr" For Binary As #1
    DatenPacket = Space(LOF(1))
    Get #1, , DatenPacket
Close #1

For i = 0 To UBound(Split(DatenPacket, SPU)) - 1
    If Split((Split(DatenPacket, SPU)(i)), SPU2)(1) = "<?NoSubFolder?>" Then
        DateiName = Split((Split(DatenPacket, SPU)(i)), SPU2)(0)
        Datei = Split((Split(DatenPacket, SPU)(i)), SPU2)(2)
        Open App.Path + "\" + DateiName For Binary As #1
            Put #1, , e.Decode64(Datei)
        Close #1
    Else
        CreateFolder UpDatePath & "\" & Split((Split(DatenPacket, SPU)(i)), SPU2)(1)
        DateiName = Split((Split(DatenPacket, SPU)(i)), SPU2)(0)
        SubFolder = Split((Split(DatenPacket, SPU)(i)), SPU2)(1)
        Datei = Split((Split(DatenPacket, SPU)(i)), SPU2)(2)
        CreateFolder App.Path & "\" & SubFolder
        Open App.Path & "\" & SubFolder & "\" & DateiName For Binary As #1
            Put #1, , e.Decode64(Datei)
        Close #1
    End If
Next i

Kill Environ$("Temp") & "\rev.rrr"

LblDLStatus.Caption = "Update geladen!"
LblDLStatus.ForeColor = vbGreen
If MsgBox("Update erfolgreich installiert!" & vbCrLf & vbCrLf & "Programm starten?", vbQuestion + vbYesNo, "Erfolg!") = vbYes Then
Call ShellExecute(Me.hwnd, "Open", App.Path & "\FuKrypt4.exe", "", App.Path & "\FuKrypt4.exe", 1)
End
End If
End
Exit Sub
err:
MsgBox err.Description, vbCritical, "Fehler!"
End
End Sub


Public Function CreateFolder(Folder As String)
On Error GoTo err
Dim i As Integer
Dim OrdnerAnzahl As Integer
Dim Ordner() As String
Dim Pfad As String

Ordner = Split(Folder, "\")
OrdnerAnzahl = UBound(Ordner)
Pfad = Mid(Folder, 1, 3)

For i = 1 To OrdnerAnzahl
Pfad = Pfad + Ordner(i) & "\"
If Not DirExists(Pfad) = True Then MkDir Pfad
Next i

Exit Function
err:
End Function

Public Function DirExists(Path As String)
  On Error Resume Next
    DirExists = CBool(GetAttr(Path) And vbDirectory)
  On Error GoTo 0
End Function

Private Sub Form_Load()
DownloadUpdate
End Sub

Sub DownloadUpdate()
Dim enc As New cldBlowfish
  Set FileDownload = New clsDownload
  If FileDownload.DoDownload("________CENSORED_________") Then
  Else
    Set FileDownload = Nothing
  End If
End Sub

Public Function FileExists(Path As String) As Boolean
  Const NotFile = vbDirectory Or vbVolume

  On Error Resume Next
    FileExists = (GetAttr(Path) And NotFile) = 0
  On Error GoTo 0
End Function
