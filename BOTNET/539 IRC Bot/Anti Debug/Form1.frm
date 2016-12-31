VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   1  'Fest Einfach
   Caption         =   "Anti Debug"
   ClientHeight    =   1605
   ClientLeft      =   45
   ClientTop       =   390
   ClientWidth     =   1965
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1605
   ScaleWidth      =   1965
   StartUpPosition =   2  'Bildschirmmitte
   Begin VB.CommandButton Command3 
      Caption         =   "Test NormanSandbox"
      Height          =   375
      Left            =   120
      TabIndex        =   2
      Top             =   1080
      Width           =   1695
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Test Sandboxie"
      Height          =   375
      Left            =   120
      TabIndex        =   1
      Top             =   600
      Width           =   1695
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Test VM"
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1695
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'//// Demo Source by Five-Three-Nine
'//// Sandboxie Detection V2 by ZiG


Private Sub Command1_Click()
Call vm
End Sub

Private Sub Command2_Click()
If Sandboxed() Then
MsgBox "Sandboxie found!", vbInformation
Else
MsgBox "I'm not running in Sandboxie!", vbInformation
End If
End Sub

Private Sub Command3_Click()
If Environ("username") = "CurrentUser" Then
MsgBox "NormanSandbox found!", vbInformation
Else
MsgBox "I'm Not Running in NormanSandbox!", vbInformation
End If
End Sub
