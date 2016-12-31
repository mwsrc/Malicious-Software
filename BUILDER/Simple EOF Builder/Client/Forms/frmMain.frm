VERSION 5.00
Begin VB.Form frmMain 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Simple EOF Builder - Client"
   ClientHeight    =   1695
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   4095
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1695
   ScaleWidth      =   4095
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdBuild 
      Caption         =   "&Build"
      Height          =   375
      Left            =   2280
      TabIndex        =   3
      Top             =   1200
      Width           =   1695
   End
   Begin VB.TextBox Text 
      Appearance      =   0  'Flat
      Height          =   285
      Index           =   2
      Left            =   120
      TabIndex        =   2
      Text            =   "Settings String 3..."
      Top             =   840
      Width           =   3855
   End
   Begin VB.TextBox Text 
      Appearance      =   0  'Flat
      Height          =   285
      Index           =   1
      Left            =   120
      TabIndex        =   1
      Text            =   "Settings String 2..."
      Top             =   480
      Width           =   3855
   End
   Begin VB.TextBox Text 
      Appearance      =   0  'Flat
      Height          =   285
      Index           =   0
      Left            =   120
      TabIndex        =   0
      Text            =   "Settings String 1..."
      Top             =   120
      Width           =   3855
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdBuild_Click()
Dim bytz() As Byte 'Variable to add the resource stub to
Dim sStub As String 'Variable to get the stub source/data after its opened

bytz() = LoadResData(101, "CUSTOM") 'loads the resource stub to the variable

Open App.Path & "\BuildFile.exe" For Binary As #1 'Open whatever file you want to build
    Put #1, , bytz() 'Put the stub source/data first
    Put #1, , "[SettingSplit]" & Text(0).Text & "[SettingSplit]" & Text(1).Text & "[SettingSplit]" & Text(2).Text & "[SettingSplit]" 'This adds the data to EOF to be read on the form load event of the stub
    '^^ make sure that you put some kind a string that wont be anywheres else in the stub, like I did with "[SettingSplit]"
Close #1 'Closes the file

MsgBox "Your File Has Been Successfully Built!", vbInformation, "Success!"
End Sub
