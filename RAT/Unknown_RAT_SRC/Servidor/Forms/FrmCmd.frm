VERSION 5.00
Begin VB.Form FrmCmd 
   Caption         =   "Consola"
   ClientHeight    =   4770
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   10080
   BeginProperty Font 
      Name            =   "Courier"
      Size            =   9.75
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "FrmCmd.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   4770
   ScaleWidth      =   10080
   StartUpPosition =   3  'Windows Default
   Begin Servidor.UniText txtTerminal 
      Height          =   2535
      Left            =   360
      TabIndex        =   0
      Top             =   360
      Width           =   3855
      _ExtentX        =   6800
      _ExtentY        =   4471
      Alignment       =   0
      Appearance      =   0
      BackColor       =   0
      BorderStyle     =   0
      Enabled         =   -1  'True
      FileCodepage    =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Courier"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   49152
      HideSelection   =   -1  'True
      Locked          =   0   'False
      MaxLength       =   -1
      MouseIcon       =   "FrmCmd.frx":058A
      MousePointer    =   0
      MultiLine       =   -1  'True
      PasswordChar    =   ""
      RightToLeft     =   0   'False
      ScrollBars      =   2
      Text            =   "FrmCmd.frx":05A6
      UseEvents       =   -1  'True
   End
   Begin VB.PictureBox Picture1 
      BackColor       =   &H0000C000&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   4560
      ScaleHeight     =   255
      ScaleWidth      =   135
      TabIndex        =   1
      Top             =   600
      Visible         =   0   'False
      Width           =   135
   End
End
Attribute VB_Name = "FrmCmd"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'Basado en el proyecto de "Cobein" "Reverse Shell" - http://www.advancevb.com.ar/
Public ParentID As Long
Public SocketID As Long
Private LastLenText As Long
Private hCaret As Long
Private Declare Function CreateCaret Lib "user32" (ByVal hwnd As Long, ByVal hBitmap As Long, ByVal nWidth As Long, ByVal nHeight As Long) As Long
Private Declare Function ShowCaret Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function WideCharToMultiByte Lib "kernel32" (ByVal CodePage As Long, ByVal dwFlags As Long, ByVal lpWideCharStr As Long, ByVal cchWideChar As Long, ByRef lpMultiByteStr As Any, ByVal cchMultiByte As Long, ByVal lpDefaultChar As String, ByVal lpUsedDefaultChar As Long) As Long
Private Declare Function MultiByteToWideChar Lib "kernel32" (ByVal CodePage As Long, ByVal dwFlags As Long, ByRef lpMultiByteStr As Any, ByVal cchMultiByte As Long, ByVal lpWideCharStr As Long, ByVal cchWideChar As Long) As Long

Private Const CF_TEXT                   As Long = 1

Private Sub Form_Activate()
    txtTerminal_GotFocus
End Sub

Private Sub Form_Load()
    Picture1.Width = Me.TextWidth("A")
    Picture1.Height = Me.TextHeight("A")
    Picture1.Picture = Picture1.Image
    MdlINI.ReadFormPosAndSize Me
End Sub

Private Sub Form_Resize()
    On Error Resume Next
    txtTerminal.Move 0, 0, ScaleWidth, ScaleHeight
End Sub

Public Sub Socket_DataArrival(id As Long, IP As String, Puerto As String, Data As String)
    On Error GoTo ErrHaddle
    'Debug.Print Data
    AppendText UTF82Unicode(Data)
    Exit Sub
ErrHaddle:
Debug.Print err.Description
End Sub

Public Sub Socket_Close(id As Long, IP As String, Puerto As String)
    Me.Caption = "Consola - Sin conexión"
    txtTerminal.Enabled = False
    TerminateConnection SocketID
    SocketID = 0
End Sub

Private Sub AppendText(ByVal sData As String)
    Dim lLenght As Long

    With txtTerminal
        .Text = .Text & sData
        lLenght = .Length
        .SetSel lLenght, lLenght
        LastLenText = lLenght
        .ScrollToCaret
    End With
End Sub

Private Sub Form_Unload(Cancel As Integer)
    If SocketID <> 0 Then
        Call WinSock32.SendData(SocketID, "Exit" & vbCrLf)
        TerminateConnection SocketID
    End If
    MdlINI.SaveFormPosAndSize Me
End Sub

Private Sub txtTerminal_GotFocus()
     Call CreateCaret(txtTerminal.hwnd, Picture1.Picture, Picture1.ScaleWidth / Screen.TwipsPerPixelX, Picture1.ScaleHeight / Screen.TwipsPerPixelY)
    ShowCaret& txtTerminal.hwnd
    
End Sub

Private Sub txtTerminal_KeyDown(KeyCode As Integer, ByVal Shift As UniTextShift)
    If (KeyCode = 46 And txtTerminal.SelStart <= LastLenText) Then
        KeyCode = 0
    End If
End Sub

Private Sub txtTerminal_KeyPress(KeyAscii As Integer)
    Dim lLenght As Long
    Dim sCommand As String
    
    
    If txtTerminal.SelStart < LastLenText Then
        txtTerminal.SetSel LastLenText, LastLenText
    End If
    
    If (KeyAscii = 8 And txtTerminal.SelStart <= LastLenText) Then
        KeyAscii = 0
    End If

    If KeyAscii = 13 Then
        KeyAscii = 0
        sCommand = Trim(Mid$(txtTerminal.Text, LastLenText + 1))
        
        If Len(sCommand) Then

            
            Select Case UCase(sCommand)
                Case "CLS"
                    txtTerminal.Text = vbNullString
                    LastLenText = 0
                    Exit Sub
                Case "EXIT" '<--- No estoy seguro si deveria ir
                    Unload Me
                    Exit Sub
            End Select
        
            Debug.Print sCommand
            If WinSock32.SendData(SocketID, Unicode2UTF8(sCommand) & vbCrLf) Then
                Debug.Print sCommand, Unicode2UTF8(sCommand)
                txtTerminal.Text = Left(txtTerminal.Text, LastLenText)
                lLenght = txtTerminal.Length
                txtTerminal.SetSel lLenght, lLenght
                txtTerminal.ScrollToCaret
            Else
                Call AppendText("No Server Connected" & vbCrLf)
            End If
        End If
    End If

End Sub

Public Function UTF82Unicode(ByVal sUTF8 As String) As String
    Dim UTF8Size        As Long
    Dim BufferSize      As Long
    Dim BufferUNI       As String
    Dim LenUNI          As Long
    Dim bUTF8()         As Byte
    
    If LenB(sUTF8) = 0 Then Exit Function
    
    bUTF8 = StrConv(sUTF8, vbFromUnicode)
    UTF8Size = UBound(bUTF8) + 1
    
    BufferSize = UTF8Size * 2
    BufferUNI = String$(BufferSize, vbNullChar)
    
    LenUNI = MultiByteToWideChar(CF_TEXT, 0, bUTF8(0), UTF8Size, StrPtr(BufferUNI), BufferSize)
    
    If LenUNI Then UTF82Unicode = Left$(BufferUNI, LenUNI)

End Function


Public Function Unicode2UTF8(ByVal strUnicode As String) As String
    Dim LenUNI          As Long
    Dim BufferSize      As Long
    Dim LenUTF8         As Long
    Dim bUTF8()         As Byte
    
    LenUNI = Len(strUnicode)
    
    If LenUNI = 0 Then Exit Function
    
    BufferSize = LenUNI * 3 + 1
    ReDim bUTF8(BufferSize - 1)
    
    LenUTF8 = WideCharToMultiByte(CF_TEXT, 0, StrPtr(strUnicode), LenUNI, bUTF8(0), BufferSize, vbNullString, 0)
    
    If LenUTF8 Then
        ReDim Preserve bUTF8(LenUTF8 - 1)
        Unicode2UTF8 = StrConv(bUTF8, vbUnicode)
    End If
End Function

Private Sub txtTerminal_MouseEnter()
    txtTerminal_GotFocus
End Sub
