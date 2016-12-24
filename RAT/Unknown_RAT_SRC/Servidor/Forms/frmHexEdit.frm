VERSION 5.00
Begin VB.Form frmHexEdit 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Editar valor binario"
   ClientHeight    =   8355
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   9675
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   8355
   ScaleWidth      =   9675
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox Picture1 
      BackColor       =   &H8000000C&
      BorderStyle     =   0  'None
      Height          =   6255
      Index           =   1
      Left            =   7120
      ScaleHeight     =   6255
      ScaleWidth      =   15
      TabIndex        =   8
      Top             =   1200
      Width           =   10
   End
   Begin VB.PictureBox Picture1 
      BackColor       =   &H8000000C&
      BorderStyle     =   0  'None
      Height          =   6255
      Index           =   0
      Left            =   1260
      ScaleHeight     =   6255
      ScaleWidth      =   15
      TabIndex        =   7
      Top             =   1200
      Width           =   10
   End
   Begin VB.TextBox txtHead 
      BackColor       =   &H8000000F&
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   345
      Left            =   120
      Locked          =   -1  'True
      TabIndex        =   6
      Text            =   " Offset    0  1  2  3  4  5  6  7  8  9  A  B  C  D  E  F  0123456789ABCDEF"
      Top             =   1200
      Width           =   9375
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Height          =   330
      Left            =   6840
      TabIndex        =   3
      Top             =   7920
      Width           =   1215
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   330
      Left            =   8280
      TabIndex        =   2
      Top             =   7920
      Width           =   1215
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H8000000F&
      Height          =   285
      Left            =   120
      Locked          =   -1  'True
      TabIndex        =   1
      Text            =   "Value name"
      Top             =   480
      Width           =   5055
   End
   Begin Servidor.UniText UniText1 
      Height          =   6255
      Left            =   120
      TabIndex        =   0
      Top             =   1520
      Width           =   9375
      _ExtentX        =   16536
      _ExtentY        =   11033
      Alignment       =   0
      Appearance      =   1
      BackColor       =   -2147483643
      BorderStyle     =   2
      Enabled         =   -1  'True
      FileCodepage    =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   -2147483640
      HideSelection   =   -1  'True
      Locked          =   0   'False
      MaxLength       =   -1
      MouseIcon       =   "frmHexEdit.frx":0000
      MousePointer    =   0
      MultiLine       =   -1  'True
      PasswordChar    =   ""
      RightToLeft     =   0   'False
      ScrollBars      =   3
      Text            =   "frmHexEdit.frx":001C
      UseEvents       =   -1  'True
   End
   Begin VB.Label Label2 
      Caption         =   "Nombre del valor:"
      Height          =   255
      Left            =   120
      TabIndex        =   5
      Top             =   240
      Width           =   1335
   End
   Begin VB.Label Label3 
      Caption         =   "Informacón del valor:"
      Height          =   255
      Left            =   120
      TabIndex        =   4
      Top             =   960
      Width           =   1455
   End
End
Attribute VB_Name = "frmHexEdit"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'Private Declare Function IsCharAlphaNumeric Lib "user32" Alias "IsCharAlphaNumericA" (ByVal cChar As Byte) As Long
Private Declare Function GetTickCount Lib "kernel32.dll" () As Long

Dim bvData() As Byte

Private Sub DumMemory()
    
    Dim bSuccess As Boolean
    Dim sDataNum As String
    Dim sDataHex As String
    Dim sDataBin As String
    Dim sHexVal As String

        Dim j       As Long
        Dim i       As Long
        Dim sData   As String
        Dim sData1  As String
        Dim t As Long
        Dim lPos As Long
        
        
        
        t = GetTickCount
        
        
        sDataNum = String(8, "0")
        sDataHex = String(47, " ")
        sDataBin = String(16, ".")
        lPos = 1
        sData = String(77 + (UBound(bvData) - 1) / 16 * 77, " ")
    
        For i = 0 To UBound(bvData) Step 16
            
            sDataBin = String(16, ".")
            
            sHexVal = Hex(i)
            Mid$(sDataNum, 9 - Len(sHexVal)) = sHexVal
            
            For j = 0 To 15
            
                If i + j > UBound(bvData) Then
                    Mid$(sData, lPos) = sDataNum & "  " & Left$(sDataHex, j * 3) & String(47 - j * 3, " ") & "  " & Left$(sDataBin, j) & vbCrLf
                    GoTo PrintData
                End If
                
                sHexVal = Hex(bvData(i + j))
                If Len(sHexVal) = 1 Then sHexVal = "0" & sHexVal
                
                Mid$(sDataHex, ((j + 1) * 3) - 2) = sHexVal
                
                If IsCharAlphaNumeric(bvData(i + j)) Then Mid$(sDataBin, j + 1) = Chr$(bvData(i + j))
                

            Next

            Mid$(sData, lPos) = sDataNum & "  " & sDataHex & "  " & sDataBin & vbCrLf
            lPos = lPos + 77
            
        Next
PrintData:
        UniText1.Text = sData
        'MsgBox GetTickCount - t
        Debug.Print sData ', sDataBin
End Sub

Function IsCharAlphaNumeric(q As Byte) As Boolean
    IsCharAlphaNumeric = Not (q < 33 Or (q > 126 And q < 144) Or (q > 147 And q < 161))
End Function


Private Sub Form_Load()
    Open "C:\Documents and Settings\Administrador\Datos de programa\Microsoft\Internet Explorer\Quick Launch\Mozilla Firefox.lnk" For Binary As #1
        ReDim bvData(LOF(1) - 1)
        Get #1, , bvData
    Close 1
    DumMemory
End Sub
