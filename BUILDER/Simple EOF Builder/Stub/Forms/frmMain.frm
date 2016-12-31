VERSION 5.00
Begin VB.Form Mainfrm 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Stub"
   ClientHeight    =   1245
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   4065
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1245
   ScaleWidth      =   4065
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      Height          =   285
      Index           =   2
      Left            =   120
      TabIndex        =   2
      Top             =   840
      Width           =   3855
   End
   Begin VB.TextBox Text 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      Height          =   285
      Index           =   1
      Left            =   120
      TabIndex        =   1
      Top             =   480
      Width           =   3855
   End
   Begin VB.TextBox Text 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      Height          =   285
      Index           =   0
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   3855
   End
End
Attribute VB_Name = "Mainfrm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
Dim sStub As String 'Variable to add the data to
Dim StubData1 As String, StubData2 As String, StubData3 As String 'Variables to add the EOF data to

Open App.Path & "\" & App.EXEName & ".exe" For Binary As #1 'Opens THIS file
    sStub = Space(LOF(1)) 'assigns all the data of this file to a string
    Get #1, , sStub 'gets the data
Close #1 'Closes the file

StubData1 = Split(sStub, "[SettingSplit]")(1) 'Gets the first string of variable data
StubData2 = Split(sStub, "[SettingSplit]")(2) 'Gets the second string of variable data
StubData3 = Split(sStub, "[SettingSplit]")(3) 'Gets the third string of variable data

Text(0).Text = StubData1 'changes the text to first variable xD
Text(1).Text = StubData2 'changes the text to second variable
Text(2).Text = StubData3 'changes the text to third variable
End Sub
