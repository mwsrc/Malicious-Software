VERSION 5.00
Begin VB.Form FrmEditValue 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "FrmEditValue"
   ClientHeight    =   8745
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   16725
   Icon            =   "FrmEditValue.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   8745
   ScaleWidth      =   16725
   StartUpPosition =   1  'CenterOwner
   Begin VB.PictureBox PicContainer 
      BorderStyle     =   0  'None
      Height          =   6735
      Index           =   3
      Left            =   6360
      ScaleHeight     =   6735
      ScaleWidth      =   9375
      TabIndex        =   15
      TabStop         =   0   'False
      Top             =   1080
      Visible         =   0   'False
      Width           =   9375
      Begin VB.PictureBox Picture1 
         BackColor       =   &H8000000C&
         BorderStyle     =   0  'None
         Height          =   6255
         Index           =   2
         Left            =   6960
         ScaleHeight     =   6255
         ScaleWidth      =   15
         TabIndex        =   19
         Top             =   0
         Width           =   10
      End
      Begin VB.PictureBox Picture1 
         BackColor       =   &H8000000C&
         BorderStyle     =   0  'None
         Height          =   6255
         Index           =   0
         Left            =   1140
         ScaleHeight     =   6255
         ScaleWidth      =   15
         TabIndex        =   16
         Top             =   0
         Width           =   10
      End
      Begin VB.TextBox txtHex 
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   6255
         Left            =   0
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         ScrollBars      =   3  'Both
         TabIndex        =   0
         Top             =   320
         Width           =   9375
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
         Left            =   0
         Locked          =   -1  'True
         TabIndex        =   17
         TabStop         =   0   'False
         Text            =   " Offset    0  1  2  3  4  5  6  7  8  9  A  B  C  D  E  F  0123456789ABCDEF"
         Top             =   0
         Width           =   9375
      End
   End
   Begin VB.PictureBox PicContainer 
      BorderStyle     =   0  'None
      Height          =   2895
      Index           =   2
      Left            =   120
      ScaleHeight     =   2895
      ScaleWidth      =   5055
      TabIndex        =   14
      TabStop         =   0   'False
      Top             =   5160
      Visible         =   0   'False
      Width           =   5055
      Begin VB.TextBox Text2 
         Height          =   2685
         Index           =   2
         Left            =   0
         MultiLine       =   -1  'True
         ScrollBars      =   3  'Both
         TabIndex        =   1
         Top             =   0
         Width           =   5055
      End
   End
   Begin VB.PictureBox PicContainer 
      BorderStyle     =   0  'None
      Height          =   1335
      Index           =   1
      Left            =   120
      ScaleHeight     =   1335
      ScaleWidth      =   5055
      TabIndex        =   9
      TabStop         =   0   'False
      Top             =   3600
      Visible         =   0   'False
      Width           =   5055
      Begin VB.Frame Frame1 
         Caption         =   "Base"
         Height          =   1095
         Left            =   2640
         TabIndex        =   10
         Top             =   0
         Width           =   2415
         Begin VB.PictureBox Picture1 
            BorderStyle     =   0  'None
            Height          =   735
            Index           =   1
            Left            =   120
            ScaleHeight     =   735
            ScaleWidth      =   2175
            TabIndex        =   11
            TabStop         =   0   'False
            Top             =   240
            Width           =   2175
            Begin VB.OptionButton Option1 
               Caption         =   "Decimal"
               Height          =   255
               Index           =   1
               Left            =   0
               TabIndex        =   13
               Top             =   360
               Width           =   1215
            End
            Begin VB.OptionButton Option1 
               Caption         =   "Hexadecimal"
               Height          =   255
               Index           =   0
               Left            =   0
               TabIndex        =   12
               Top             =   0
               Value           =   -1  'True
               Width           =   1335
            End
         End
      End
      Begin VB.TextBox Text2 
         Height          =   285
         Index           =   1
         Left            =   0
         MaxLength       =   8
         TabIndex        =   2
         Text            =   "0"
         Top             =   0
         Width           =   2415
      End
   End
   Begin VB.PictureBox PicContainer 
      BorderStyle     =   0  'None
      Height          =   495
      Index           =   0
      Left            =   120
      ScaleHeight     =   495
      ScaleWidth      =   5055
      TabIndex        =   8
      TabStop         =   0   'False
      Top             =   2640
      Visible         =   0   'False
      Width           =   5055
      Begin VB.TextBox Text2 
         Height          =   285
         Index           =   0
         Left            =   0
         TabIndex        =   3
         Top             =   0
         Width           =   5055
      End
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H8000000F&
      Height          =   285
      Left            =   120
      Locked          =   -1  'True
      TabIndex        =   6
      Top             =   360
      Width           =   5055
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "Aceptar"
      Default         =   -1  'True
      Height          =   330
      Left            =   2640
      TabIndex        =   4
      Top             =   1680
      Width           =   1215
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "Cancelar"
      Height          =   330
      Left            =   3960
      TabIndex        =   5
      Top             =   1680
      Width           =   1215
   End
   Begin VB.Label Label3 
      Caption         =   "Información del valor:"
      Height          =   255
      Index           =   0
      Left            =   120
      TabIndex        =   18
      Top             =   840
      Width           =   2055
   End
   Begin VB.Label Label2 
      Caption         =   "Nombre del valor:"
      Height          =   255
      Left            =   120
      TabIndex        =   7
      Top             =   120
      Width           =   1335
   End
   Begin VB.Menu MnuArchivo 
      Caption         =   "Archivo"
      Visible         =   0   'False
      Begin VB.Menu SubMenuArchivo 
         Caption         =   "Impotar"
         Index           =   0
      End
      Begin VB.Menu SubMenuArchivo 
         Caption         =   "Exportar"
         Index           =   1
      End
   End
End
Attribute VB_Name = "FrmEditValue"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Public Enum rcRegType
    REG_NONE = 0
    REG_SZ = 1
    REG_EXPAND_SZ = 2
    REG_BINARY = 3
    REG_DWORD = 4
    REG_DWORD_LITTLE_ENDIAN = 4
    REG_DWORD_BIG_ENDIAN = 5
    REG_LINK = 6
    REG_MULTI_SZ = 7
    REG_RESOURCE_LIST = 8
    REG_FULL_RESOURCE_DESCRIPTOR = 9
    REG_RESOURCE_REQUIREMENTS_LIST = 10
End Enum

Private mRegType As rcRegType
Private mKey As String
Private InitValue As Variant
Private NewValue As Variant
Private mName As String

Public Event UserOK(Key As String, Name As String, RegType As rcRegType, Value As Variant)

Public Property Let KeyName(ByVal sName As String)

        mName = sName
        Text1.Text = sName

End Property

Public Property Let Key(ByVal sKey As String)
    mKey = sKey
End Property

Public Property Let Value(ByVal vValue As Variant)
    Select Case mRegType
    
        Case REG_SZ, REG_EXPAND_SZ
            InitValue = CStr(vValue)
            Text2(0) = vValue
            
        Case REG_DWORD
            InitValue = vValue
            Text2(1) = BigHex(InitValue)
            
        Case REG_MULTI_SZ
            InitValue = CStr(vValue)
            Text2(2) = Replace(InitValue, vbNullChar, vbCrLf)
            
        Case REG_BINARY
            InitValue = vValue
            NewValue = vValue
            PrintArray vValue
    End Select
End Property

'Private Function HexToByteArray(ByVal sHex As String) As Byte()
'On Error Resume Next
'    Dim Arr() As String
'    Dim b() As Byte
'    Dim i As Long
'    Arr = Split(sHex, " ")
'    ReDim b(UBound(Arr))
'    For i = 0 To UBound(Arr)
'        'Debug.Print CByte("&H" & Arr(i))
'    Next
'    HexToByteArray = b
'End Function

Private Function GetVal(ByVal sValue As String) As Currency
    Dim Ret1 As Long, Ret2 As Long
    Ret1 = InStr(sValue, "(")
    Ret2 = InStr(sValue, ")")

    If Ret1 > 0 And Ret2 > 0 Then
        GetVal = CCur(Mid(sValue, Ret1 + 1, Ret2 - Ret1 - 1))
    End If
End Function


Public Property Let RegType(ByVal sRegType As rcRegType)
    Dim oPic As PictureBox
    
    mRegType = sRegType
    
    Select Case sRegType
        Case REG_SZ, REG_EXPAND_SZ
            Set oPic = PicContainer(0)
            Me.Caption = "Editar cadena"

        Case REG_BINARY
            Set oPic = PicContainer(3)
            MnuArchivo.Visible = True
            Me.Caption = "Editar valor binario"
            
        Case REG_DWORD
            Set oPic = PicContainer(1)
            Me.Caption = "Editar valor DWORD"

        Case REG_MULTI_SZ
            Set oPic = PicContainer(2)
            cmdOK.Default = False
            Me.Caption = "Modificar cadenas múltiples"
        Case Else
            Exit Property
    End Select
    
    With oPic
        .Move 120, 1080
        cmdOK.Move .Left + .Width - (cmdOK.Width * 2) - 100, .Top + .Height
        cmdCancel.Move .Left + .Width - cmdCancel.Width, .Top + .Height
        Me.Width = .Width + 300
        Me.Height = .Top + .Height + 940 + IIf(MnuArchivo.Visible, 300, 0)
        .Visible = True
    End With
     
End Property


Private Function IsEqual(a As Variant, b As Variant) As Boolean
    On Error GoTo ErrHandler
    Dim i As Long

    Select Case VarType(a)
        Case vbString, vbLong
            IsEqual = (a = b)
            
        Case (vbByte Or vbArray)
            If UBound(a) <> UBound(b) Then Exit Function
            For i = 0 To UBound(a)
                If a(i) <> b(i) Then
                    Exit Function
                End If
            Next
            IsEqual = True
           
    End Select
ErrHandler:
    
End Function

Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdOK_Click()
On Error GoTo Handler
    If mRegType = REG_DWORD Then
        If NewValue > 4294967295# Then
            If MsgBox("El valor exede el valor DWORD maximo" & vbCrLf & "¿Deve truncarse el valor para poder continuar?", vbOKCancel) = vbOK Then
                NewValue = 4294967295#
            Else
                Exit Sub
            End If
        End If
        NewValue = CurrencyToLong(NewValue)
    End If

    If Not IsEqual(InitValue, NewValue) Then
        RaiseEvent UserOK(mKey, mName, mRegType, NewValue)
    End If
    Unload Me
    Exit Sub
Handler:
    MsgBox Err.Description, vbExclamation
End Sub



Private Sub Command1_Click()
'Dim b() As Byte
'Open "C:\Documents and Settings\Administrador\Escritorio\Copia de Regedit mio\val2.ico" For Binary As #1
'    ReDim b(LOF(1) - 1)
'    Get #1, , b
'Close
'NewValue = b

'PrintArray NewValue
End Sub


Private Sub Option1_Click(Index As Integer)
    If Index = 0 Then
        Text2(1).MaxLength = 8
        Text2(1) = BigHex(NewValue)
    Else
        Text2(1).MaxLength = 10
        Text2(1) = NewValue
    End If
End Sub

Private Sub SubMenuArchivo_Click(Index As Integer)
    On Error GoTo ErrHandler
    Dim sPath As String
    Dim sBuff As String
    Dim FF As Integer
    If Index = 0 Then
        sPath = ShowOpenFile(Me.hwnd)
        If sPath <> vbNullString Then
            FF = FreeFile
            Open sPath For Binary As #FF
                sBuff = String(LOF(FF), Chr$(0))
                Get #FF, , sBuff
                NewValue = sBuff
                PrintArray sBuff
            Close #FF
        End If
    Else
        sPath = ShowSaveFile(Me.hwnd, mName & ".txt")
        If sPath <> vbNullString Then
            If Dir(sPath) <> vbNullString Then Kill sPath
            FF = FreeFile
            Open sPath For Binary As #FF
                If VarType(NewValue) = vbString Then
                    sBuff = NewValue
                    Put #FF, 1, sBuff
                Else
                    Put #FF, , NewValue
                End If
            Close #FF
        End If
    End If
    Exit Sub
ErrHandler:
    MsgBox Err.Description, vbCritical, "Error " & Err.Number
End Sub

Private Sub Text2_Change(Index As Integer)
On Error GoTo Handler
    Select Case Index
        Case 0
            NewValue = CStr(Text2(Index))
        Case 1
            If Option1(0).Value Then
                NewValue = LongToCurrency("&H" & Text2(Index))
            Else
                NewValue = CCur(Text2(Index))
            End If
        Case 2
            NewValue = Replace$(Text2(Index), vbCrLf, vbNullChar)
    End Select
    Exit Sub
Handler:
    Beep
    Text2(Index) = NewValue
    
End Sub

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

Private Sub Text2_GotFocus(Index As Integer)
    With Text2(Index)
        .SelStart = 0
        .SelLength = Len(.Text)
    End With
End Sub

Private Sub Text2_KeyPress(Index As Integer, KeyAscii As Integer)
    If Index = 1 Then
        If Option1(0).Value Then
            If (KeyAscii < 48 Or KeyAscii > 57) And (KeyAscii < 65 Or KeyAscii > 70) And (KeyAscii < 97 Or KeyAscii > 102) Then
               If KeyAscii <> 8 Then KeyAscii = 0
            End If
        Else
            If (KeyAscii < 48 Or KeyAscii > 57) Then
               If KeyAscii <> 8 Then KeyAscii = 0
            End If
        End If
    End If
End Sub


Private Sub PrintArray(ByVal bvData As Variant)
    
    Dim bSuccess As Boolean
    Dim sDataNum As String
    Dim sDataHex As String
    Dim sDataBin As String
    Dim sHexVal As String
    Dim ArrData() As Byte
    Dim j       As Long
    Dim i       As Long
    Dim sData   As String
    Dim sData1  As String

    Dim lPos As Long

    If VarType(bvData) = 0 Then
        txtHex = String(8, "0")
        Exit Sub
    End If
    
    If VarType(bvData) = vbString Then
        If Len(bvData) = 0 Then
            txtHex = String(8, "0")
            Exit Sub
        End If
        
        ArrData = StrConv(bvData, vbFromUnicode)
    End If
    
    sDataNum = String(8, "0")
    sDataHex = String(47, " ")
    sDataBin = String(16, ".")
    lPos = 1
    sData = String(77 + (UBound(ArrData) - 1) / 16 * 77, " ")

    For i = 0 To UBound(ArrData) Step 16
        
        sDataBin = String(16, ".")
        
        sHexVal = Hex(i)
        Mid$(sDataNum, 9 - Len(sHexVal)) = sHexVal
        
        For j = 0 To 15
        
            If i + j > UBound(ArrData) Then
                Mid$(sData, lPos) = sDataNum & "  " & Left$(sDataHex, j * 3) & String(47 - j * 3, " ") & "  " & Left$(sDataBin, j) & vbCrLf
                GoTo PrintData
            End If
            
            sHexVal = Hex(ArrData(i + j))
            If Len(sHexVal) = 1 Then sHexVal = "0" & sHexVal
            
            Mid$(sDataHex, ((j + 1) * 3) - 2) = sHexVal
            
            If IsCharAlphaNumeric(ArrData(i + j)) Then Mid$(sDataBin, j + 1) = Chr$(ArrData(i + j))
            
        Next

        Mid$(sData, lPos) = sDataNum & "  " & sDataHex & "  " & sDataBin & vbCrLf
        lPos = lPos + 77
        
    Next
PrintData:
    txtHex = sData

End Sub

Function IsCharAlphaNumeric(ByVal q As Byte) As Boolean
    IsCharAlphaNumeric = Not (q < 33 Or (q > 126 And q < 144) Or (q > 147 And q < 161))
End Function
