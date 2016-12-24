VERSION 5.00
Begin VB.UserControl UpDownd 
   ClientHeight    =   390
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   3000
   ScaleHeight     =   390
   ScaleWidth      =   3000
   Begin VB.TextBox Text1 
      Height          =   375
      Left            =   0
      MaxLength       =   9
      TabIndex        =   0
      Top             =   0
      Width           =   2295
   End
End
Attribute VB_Name = "UpDownd"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'Autor: Leandro Ascierto
Option Explicit
Private Declare Function CreateUpDownControl Lib "comctl32" (ByVal dwStyle As Long, ByVal X As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal hParent As Long, ByVal nID As Long, ByVal hInst As Long, ByVal hBuddy As Long, ByVal nUpper As Long, ByVal nLower As Long, ByVal nPos As Long) As Long
Private Declare Function SendMessageLong Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Private Declare Function MoveWindow Lib "user32" (ByVal hwnd As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal bRepaint As Long) As Long
Private Declare Function DestroyWindow Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long) As Long
Private Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Private Declare Function LoadLibrary Lib "kernel32" Alias "LoadLibraryA" (ByVal lpLibFileName As String) As Long
Private Declare Function FreeLibrary Lib "kernel32" (ByVal hLibModule As Long) As Long
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Private Declare Function RedrawWindow Lib "user32" (ByVal hwnd As Long, lprcUpdate As Any, ByVal hrgnUpdate As Long, ByVal fuRedraw As Long) As Long
Private Declare Function EnableWindow Lib "user32.dll" (ByVal hwnd As Long, ByVal fEnable As Long) As Long

Private Declare Sub InitCommonControls Lib "comctl32.dll" ()



Private Type EDITBALLOONTIP
   cbStruct As Long
   pszTitle As String
   pszText As String
   ttiIcon As Long
End Type


Private Const ECM_FIRST As Long = &H1500
Private Const EM_SHOWBALLOONTIP As Long = (ECM_FIRST + 3)
Private Const EM_HIDEBALLOONTIP As Long = (ECM_FIRST + 4)

Private Const WS_CHILD As Long = &H40000000
Private Const WS_VISIBLE As Long = &H10000000
Private Const WS_DISABLED As Long = &H8000000


Private Const UDS_SETBUDDYINT = &H2
Private Const UDS_ARROWKEYS = &H20

Private Const WM_USER = &H400
Private Const UDM_SETRANGE = (WM_USER + 101)
Private Const UDM_GETRANGE = (WM_USER + 102)
Private Const UDM_SETPOS = (WM_USER + 103)
Private Const UDM_GETPOS = (WM_USER + 104)
Private Const UDS_NOTHOUSANDS As Long = &H80


Public Event Change()

Const sInclude = "-0123456789"

Private m_hModShell32 As Long
Private m_hWNd As Long
Private m_lMax As Long
Private m_lMin As Long
Private m_lPosition As Long


Public Property Get Max() As Long
    Max = m_lMax
End Property

Public Property Let Max(ByVal lMax As Long)
    If (m_lMax <> lMax) Then
        m_lMax = lMax
        SetRange
        PropertyChanged "Max"
    End If
End Property

Public Property Get Min() As Long
    Min = m_lMin
End Property

Public Property Let Min(ByVal lMin As Long)
    If (m_lMin <> lMin) Then
        m_lMin = lMin
        SetRange
        PropertyChanged "Min"
    End If
End Property

Public Property Get Position() As Long
Attribute Position.VB_UserMemId = 0
Attribute Position.VB_MemberFlags = "200"
    If (m_hWNd <> 0) Then
        Position = val(Text1)
    Else
        Position = m_lPosition
    End If
End Property

Public Property Let Position(ByVal lPos As Long)
    If (lPos <> m_lPosition) Then
        
        If (m_lMax > m_lMin) Then
            If (lPos > m_lMax) Then
                lPos = m_lMax
            ElseIf (lPos < m_lMin) Then
                lPos = m_lMin
            End If
        Else
            If (lPos < m_lMax) Then
                lPos = m_lMax
            ElseIf (lPos > m_lMin) Then
                lPos = m_lMin
            End If
        End If
        
        m_lPosition = lPos
        If (m_hWNd <> 0) Then
            SendMessageLong m_hWNd, UDM_SETPOS, 0, lPos
        End If
        PropertyChanged "Position"
    End If
End Property

Private Sub SetRange()
    If (m_hWNd <> 0) Then
        Text1.ToolTipText = "Escriva un valor comprendido entre " & m_lMin & " y " & m_lMax
        SendMessageLong m_hWNd, UDM_SETRANGE, 0, MakeDWord(m_lMax, m_lMin)
        RedrawWindow m_hWNd, ByVal 0&, ByVal 0&, &H1
    End If
End Sub

Private Function LoWord(ByVal Numero As Long) As Long
    LoWord = Numero And &HFFFF&
End Function

Private Function HiWord(ByVal Numero As Long) As Long
    HiWord = Numero \ &H10000 And &HFFFF&
End Function

Private Function MakeDWord(ByVal LoWord As Integer, ByVal HiWord As Integer) As Long
    MakeDWord = (HiWord * &H10000) Or (LoWord And &HFFFF&)
End Function



Private Sub pInitialise()
    Dim lStyle As Long
    
    Call pTerminate

    m_hModShell32 = LoadLibrary("Shell32.dll")
    
    Call InitCommonControls
    
    'Call SetWindowLong(Text1.hwnd, GWL_STYLE, GetWindowLong(Text1.hwnd, GWL_STYLE) Or ES_NUMBER)
    lStyle = WS_VISIBLE Or WS_CHILD Or UDS_SETBUDDYINT Or UDS_NOTHOUSANDS Or UDS_ARROWKEYS
    
    If UserControl.Enabled = False Then lStyle = lStyle Or WS_DISABLED
    
    m_hWNd = CreateUpDownControl(lStyle, _
            (UserControl.ScaleWidth \ Screen.TwipsPerPixelX) - 18, 2, 16, (UserControl.ScaleHeight \ Screen.TwipsPerPixelY) - 4, _
            UserControl.hwnd, UserControl.hwnd, App.hInstance, Text1.hwnd, m_lMax, m_lMin, m_lPosition)
    Text1.ZOrder 1
End Sub

Private Sub pTerminate()
    If (m_hWNd <> 0) Then
        Call DestroyWindow(m_hWNd)
        m_hWNd = 0
    End If
    
    If m_hModShell32 <> 0 Then
        Call FreeLibrary(m_hModShell32)
        m_hModShell32 = 0
    End If
    
End Sub


Private Sub Text1_LostFocus()
    If Text1 = "" Then
        Restablecer
    End If
End Sub

Private Sub Restablecer()
Dim iTemp   As Integer
    iTemp = Text1.SelStart
    Text1.Text = m_lPosition
    Text1.SelStart = IIf(iTemp > 0, iTemp - 1, iTemp)
End Sub

Private Function ShowBalloonTip(Text As String, Optional Title As String, Optional Icon As Long)
    Dim ebt As EDITBALLOONTIP
    'Si o si debe haber un .manifest
    With ebt
       .cbStruct = Len(ebt)
       .pszTitle = StrConv(Title, vbUnicode)
       .pszText = StrConv(Text, vbUnicode)
       .ttiIcon = Icon
    End With

    ShowBalloonTip = SendMessage(Text1.hwnd, EM_SHOWBALLOONTIP, 0&, ebt)
    If Not ShowBalloonTip Then Beep
End Function

Public Function ValidateControls() As Boolean
On Error GoTo Exit_ValidateControls
    UserControl.ValidateControls
    ValidateControls = True
Exit_ValidateControls:
End Function

Private Sub Text1_Change()

Dim sLetra  As String
Dim sTotal  As String
Dim iPos    As Integer
Dim NotNumeric As Boolean

    For iPos = 1 To Len(Text1.Text)
        sLetra = Mid(Text1.Text, iPos, 1)
        If InStr(1, LCase(sInclude), LCase(sLetra)) = 0 Then
            NotNumeric = True
        End If
    Next iPos
    
    If NotNumeric Then
        Restablecer
        ShowBalloonTip "La entrada no puede contener ningún caracter que no sea numérico"
        
        Exit Sub
    End If
    
    If m_lMin >= 0 And Left(Text1, 1) = "-" Then
        Restablecer
        ShowBalloonTip "La entrada debe ser un número positivo"

        Exit Sub
    End If
    
    If InStr(Text1, "--") Then
        Restablecer
        Exit Sub
    End If
    
    If InStr(Text1, "-") Then
        If Left(Text1, 1) <> "-" Then
            Restablecer
            ShowBalloonTip "El signo negativo únicamente puede aparecer al principio del número"
            Exit Sub
        End If
    End If
    
    If val(Text1.Text) < m_lMin Or val(Text1.Text) > m_lMax Then
        Exit Sub
    End If
    
    'If m_lPosition <> Val(Text1.Text) Then
        m_lPosition = val(Text1.Text)
        RaiseEvent Change
    'End If
    
End Sub


Private Sub Text1_Validate(Cancel As Boolean)



    If Text1.Visible = False Then Exit Sub

    If Text1 = "" Then
        ShowBalloonTip "La entrada debe contener un número"
        Cancel = True
        Exit Sub
    End If
 
    If val(Text1.Text) < m_lMin Then
        Restablecer
        ShowBalloonTip "La entrada debe ser superior o igual a " & m_lMin
        Cancel = True
        Exit Sub
    End If
    
    If val(Text1.Text) > m_lMax Then
        Restablecer
        ShowBalloonTip "La entrada debe ser menor o igual a " & m_lMax
        Cancel = True
        Exit Sub
    End If
    
    If m_lPosition <> val(Text1.Text) Then
        m_lPosition = val(Text1.Text)
        RaiseEvent Change
    End If
End Sub

Private Sub UserControl_ExitFocus()
On Error Resume Next
If Not ValidateControls Then Text1.SetFocus
End Sub


Property Get Enabled() As Boolean
    Enabled = UserControl.Enabled
End Property

Property Let Enabled(ByVal Value As Boolean)

    UserControl.Enabled = Value
    Text1.Enabled = Value
    EnableWindow m_hWNd, Value
    PropertyChanged "Enabled"
End Property


Private Sub UserControl_Initialize()
    Max = 5000
End Sub

Private Sub UserControl_InitProperties()
    pInitialise
End Sub

Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
    Min = PropBag.ReadProperty("Min", 0)
    Max = PropBag.ReadProperty("Max", 1000)
    Position = PropBag.ReadProperty("Position", 0)
    UserControl.Enabled = PropBag.ReadProperty("Enabled", True)
    Text1.Enabled = UserControl.Enabled
    pInitialise
End Sub

Private Sub UserControl_Resize()
    Text1.Move 0, 0, UserControl.ScaleWidth, UserControl.ScaleHeight
    Text1.ZOrder 1
    If (m_hWNd <> 0) Then
        MoveWindow m_hWNd, (UserControl.ScaleWidth \ Screen.TwipsPerPixelX) - 18, 2, 16, (UserControl.ScaleHeight \ Screen.TwipsPerPixelY) - 4, 1
    End If
End Sub

Private Sub UserControl_Terminate()
    pTerminate
End Sub

Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
    PropBag.WriteProperty "Min", Min, 0
    PropBag.WriteProperty "Max", Max, 1000
    PropBag.WriteProperty "Position", Position, 0
    PropBag.WriteProperty "Enabled", UserControl.Enabled, True

    pTerminate
End Sub

