VERSION 5.00
Begin VB.UserControl ISPanel 
   Alignable       =   -1  'True
   BorderStyle     =   1  'Fixed Single
   ClientHeight    =   5835
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   5745
   ControlContainer=   -1  'True
   EditAtDesignTime=   -1  'True
   ScaleHeight     =   5835
   ScaleWidth      =   5745
   Begin VB.VScrollBar VScroll 
      Height          =   4815
      Left            =   4500
      Max             =   115
      TabIndex        =   0
      Top             =   120
      Width           =   315
   End
   Begin VB.HScrollBar HScroll 
      Height          =   315
      Left            =   120
      Max             =   80
      TabIndex        =   1
      Top             =   5280
      Width           =   3975
   End
   Begin VB.PictureBox pCorner 
      BorderStyle     =   0  'None
      Height          =   495
      Left            =   4560
      ScaleHeight     =   495
      ScaleWidth      =   555
      TabIndex        =   2
      Top             =   5280
      Width           =   555
   End
   Begin VB.Timer timUpdate 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   4860
      Top             =   60
   End
   Begin VB.PictureBox pView 
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      Height          =   5235
      Left            =   0
      ScaleHeight     =   5235
      ScaleWidth      =   4635
      TabIndex        =   3
      Top             =   0
      Width           =   4635
   End
   Begin VB.Image curMove 
      Height          =   480
      Left            =   5040
      Top             =   660
      Width           =   480
   End
End
Attribute VB_Name = "ISPanel"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'Name: prjPanelTest
'Description: this control is very useful for
' thse who need more space on theri forms,
' you can extend you form space using this
' control, see example form
'how to use:
' 1.- Insert a ISPanel Control in your form
' 2.- Insert controls in a  picture Box
' 3.- In the Form Load Event call the Attatch Function
' 4.- In the Query Unload event call the detatch Function
' Notes:
'   the Control Captures the events of the Picturebox,
'        so if you resize the picturebox, the control adjust the scrollbars.
'   Also, if you resize the ISPanel control, it adjust his properties
'
'   Feedback is GREATLY appreciated... Votes Would be nice ;)
'Author: Fred_Cpp
'   mail:  alfredo_cp@notmail.com
'   mail2: fred_cpp@yahoo.com

Option Explicit

Private Type POINTAPI
        x As Long
        y As Long
End Type

Private Type RECT
        Left As Long
        Top As Long
        Right As Long
        Bottom As Long
End Type


Private Enum State
    Normal
    hover
End Enum

Private gScaleX As Single
Private gScaleY As Single
Private InOut As Boolean
Private iState As State
'Default Property Values:
Const m_def_Enabled = True
Const m_def_BorderStyle = 0
Const m_Def_Align = 0
Const m_def_BackColor = &H8000000C
'Property Variables:
Private m_Enabled As Boolean
Private m_BorderStyle As Integer                'What BorderStyle to Use??
Private m_Align As Integer                      'Align of the Container Control
Private m_BackColor As OLE_COLOR                'BackColor

Private sZoom As Single                         'Zoom Value
Private psWidth As Single, psHeight As Single   'Paper Size
Private lPrevParent As Long
Private sPrevX As Single
Private sPrevY As Single
Private WithEvents pChild As PictureBox
Attribute pChild.VB_VarHelpID = -1

'Event Declarations:
Event Resize()
Event Scroll()
'Constant Declarations
Private Const WM_SIZE = &H5
' API Declarations
Private Declare Function SetParent Lib "user32" (ByVal hWndChild As Long, ByVal hWndNewParent As Long) As Long
Private Declare Function ReleaseCapture Lib "user32" () As Long
Private Declare Function GetCursorPos Lib "user32" (lpPoint As POINTAPI) As Long
Private Declare Function GetWindowRect Lib "user32" (ByVal hwnd As Long, lpRect As RECT) As Long
Private Declare Function DrawEdge Lib "user32" (ByVal hdc As Long, qrc As RECT, ByVal edge As Long, ByVal grfFlags As Long) As Long
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Private Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long) As Long
Private Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Private Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
Private Declare Function CreateDCAsNull Lib "gdi32" Alias "CreateDCA" (ByVal lpDriverName As String, lpDeviceName As Any, lpOutput As Any, lpInitData As Any) As Long
Private Declare Function DeleteDC Lib "gdi32" (ByVal hdc As Long) As Long
Private Declare Function SelectObject Lib "gdi32" (ByVal hdc As Long, ByVal hObject As Long) As Long
Private Declare Function DeleteObject Lib "gdi32" (ByVal hObject As Long) As Long
Private Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
Private Declare Function DrawText Lib "user32" Alias "DrawTextA" (ByVal hdc As Long, ByVal lpStr As String, ByVal nCount As Long, lpRect As RECT, ByVal wFormat As Long) As Long
Private Declare Function SetBkColor Lib "gdi32" (ByVal hdc As Long, ByVal crColor As Long) As Long
Private Declare Function SetTextColor Lib "gdi32" (ByVal hdc As Long, ByVal crColor As Long) As Long
Private Declare Function SetBkMode Lib "gdi32" (ByVal hdc As Long, ByVal nBkMode As Long) As Long
Private Declare Function OffsetRect Lib "user32" (lpRect As RECT, ByVal x As Long, ByVal y As Long) As Long
Private Declare Function OleTranslateColor Lib "OLEPRO32.DLL" (ByVal OLE_COLOR As Long, ByVal hPalette As Long, pccolorref As Long) As Long
Private Declare Function CreateSolidBrush Lib "gdi32" (ByVal crColor As Long) As Long
Private Declare Function DestroyIcon Lib "user32" (ByVal hIcon As Long) As Long
Private Declare Function FillRect Lib "user32" (ByVal hdc As Long, lpRect As RECT, ByVal hBrush As Long) As Long
Private Declare Function DrawState Lib "user32" Alias "DrawStateA" (ByVal hdc As Long, ByVal hBrush As Long, ByVal lpDrawStateProc As Long, ByVal lParam As Long, ByVal wParam As Long, ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal fuFlags As Long) As Long


' Commons Functions Support
Private Function InBox(ObjectHWnd As Long) As Boolean
    Dim mpos As POINTAPI
    Dim oRect As RECT
    GetCursorPos mpos
    GetWindowRect ObjectHWnd, oRect
    If mpos.x >= oRect.Left And mpos.x <= oRect.Right And _
        mpos.y >= oRect.Top And mpos.y <= oRect.Bottom Then
        InBox = True
    Else
        InBox = False
   End If
End Function

Private Sub pChild_Resize()
    UserControl_Resize
End Sub

Private Sub timUpdate_Timer()
    If InBox(UserControl.hwnd) Then
        If InOut = False Then
            iState = hover
            DrawRaised
            'RaiseEvent MouseHover
        End If
        InOut = True
    Else
        If InOut Then
            iState = Normal
            DrawFlat
            timUpdate.Enabled = False
            'RaiseEvent MouseOut
        End If
        InOut = False
    End If
End Sub


Private Sub DragObj(hwnd As Long)
    ReleaseCapture
    SendMessage hwnd, &HA1, 2, 0&
End Sub


Private Sub UserControl_MouseMove(Button As Integer, shift As Integer, x As Single, y As Single)
'    timUpdate.Enabled = True
End Sub

'Cargar valores de propiedad desde el almacén
Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
    m_Enabled = PropBag.ReadProperty("Enabled", m_def_Enabled)
    m_BackColor = PropBag.ReadProperty("BackColor", m_def_BackColor)
    m_BorderStyle = PropBag.ReadProperty("BorderStyle", m_def_BorderStyle)
    pView.BackColor = m_BackColor
End Sub

Private Sub UserControl_Resize()
    On Error Resume Next
    Dim loff As Integer
    loff = 45
    VScroll.Move UserControl.Width - VScroll.Width - loff, 0, VScroll.Width, UserControl.Height - HScroll.Height - loff
    HScroll.Move 0, UserControl.Height - HScroll.Height - loff, UserControl.Width - VScroll.Width - loff, HScroll.Height
    pCorner.Move UserControl.Width - VScroll.Width - loff, UserControl.Height - HScroll.Height - loff, VScroll.Width, HScroll.Height
    Dim sV As Single
    Dim sH As Single
    pView.Move 0, 0, Width - VScroll.Width, Height - HScroll.Height
    HScroll.Min = 1
    VScroll.Min = 1
    sH = pChild.Width - pView.Width
    sV = pChild.Height - pView.Height
    'Modify Vertical ScrollBar
    If sV = 0 Then
        VScroll.Max = 1
    ElseIf sV < 0 Then
        VScroll.Max = 1 ' -sV
    Else
        VScroll.Max = sV
    End If
    'Modify Horizontal Scrollbar
    If sH = 0 Then
        HScroll.Max = 1
    ElseIf sH < 0 Then
        HScroll.Max = 1 '-sH
    Else
        HScroll.Max = sH
    End If
    
    HScroll.LargeChange = UserControl.Width
    HScroll.SmallChange = 15
    
    VScroll.LargeChange = UserControl.Height
    VScroll.SmallChange = 15
    RaiseEvent Resize
End Sub

'Escribir valores de propiedad en el almacén
Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
    Call PropBag.WriteProperty("Enabled", m_Enabled, m_def_Enabled)
    Call PropBag.WriteProperty("BorderStyle", m_BorderStyle, m_def_BorderStyle)
    Call PropBag.WriteProperty("BackColor", m_BackColor, m_def_BackColor)
End Sub

Private Sub UserControl_Initialize()
    'Initialization Code
    psWidth = 8000
    psHeight = 11500
    
End Sub

Private Sub UserControl_InitProperties()
    gScaleX = Screen.TwipsPerPixelX
    gScaleY = Screen.TwipsPerPixelY
    m_Enabled = m_def_Enabled
    m_BorderStyle = m_def_BorderStyle
End Sub

Private Sub UserControl_Paint()
    If iState = Normal Then
        DrawFlat
    ElseIf iState = hover Then
        DrawRaised
    End If
End Sub

Private Sub DrawFlat()
    Cls
End Sub

Private Sub DrawRaised()
    Line (0, 0)-(Width, 0), vb3DShadow
    Line (0, 0)-(0, Height), vb3DShadow
    Line (Width - 15, 0)-(Width - 15, Height - 15), vb3DHighlight
    Line (0, Height - 15)-(Width - 15, Height - 15), vb3DHighlight
    
    Line (15, 15)-(ScaleWidth - 30, 15), vb3DHighlight
    Line (15, 15)-(15, ScaleHeight - 30), vb3DHighlight
    Line (ScaleWidth - 30, 15)-(ScaleWidth - 30, ScaleHeight - 30), vb3DShadow
    Line (15, ScaleHeight - 30)-(ScaleWidth - 30, ScaleHeight - 30), vb3DShadow
End Sub


'ADVERTENCIA: NO QUITAR NI MODIFICAR LAS SIGUIENTES LINEAS CON COMENTARIOS
'MemberInfo=0,0,0,0
Public Property Get Enabled() As Boolean
    Enabled = m_Enabled
End Property

Public Property Let Enabled(ByVal New_Enabled As Boolean)
    m_Enabled = New_Enabled
    PropertyChanged "Enabled"
End Property


'ADVERTENCIA: NO QUITAR NI MODIFICAR LAS SIGUIENTES LINEAS CON COMENTARIOS
'MemberInfo=7,0,0,0
Public Property Get BorderStyle() As Integer
    BorderStyle = m_BorderStyle
End Property

Public Property Let BorderStyle(ByVal New_BorderStyle As Integer)
    m_BorderStyle = New_BorderStyle
    UserControl_Paint
    PropertyChanged "BorderStyle"
End Property

Public Property Get BackColor() As OLE_COLOR
    BackColor = m_BackColor
End Property

Public Property Let BackColor(ByVal New_BackColor As OLE_COLOR)
    m_BackColor = New_BackColor
    pView.BackColor = New_BackColor
    UserControl_Paint
    PropertyChanged "BackColor"
End Property

Public Property Get hwnd() As Long
    hwnd = UserControl.hwnd
End Property

'****************************************************************
'   Functionality Routines
Private Sub VScroll_Change()
    'pPage.SetFocus
    UpdatePos
End Sub
   
Private Sub HScroll_Change()
    'pPage.SetFocus
    UpdatePos
End Sub

Sub UpdatePos()
    'Called when Scrolls Heve Changed
    On Error Resume Next
    pChild.Move -HScroll.Value, -VScroll.Value
    pView.SetFocus
    RaiseEvent Scroll
End Sub

Private Sub pChild_MouseDown(Button As Integer, shift As Integer, x As Single, y As Single)
    '
    pChild.MousePointer = 99
    sPrevX = HScroll.Max - HScroll.Value - x + pView.Width
    sPrevY = VScroll.Max - VScroll.Value - y + pView.Height
End Sub

Private Sub pChild_MouseMove(Button As Integer, shift As Integer, x As Single, y As Single)
    '
    If Button <> vbLeftButton Then Exit Sub
    Dim vx As Single
    Dim vy As Single
    vx = 1 + (x + sPrevX) / 2
    vy = 1 + (y - sPrevY) / 2
    'Check X Value
    If vx < HScroll.Max And vx > HScroll.Min Then
        HScroll.Value = vx
    ElseIf vx > HScroll.Max Then
        HScroll.Value = HScroll.Max
    ElseIf vx < HScroll.Min Then
        HScroll.Value = HScroll.Min
    End If
    'Check Y Value
    If vy < VScroll.Max And vy > VScroll.Min Then
        VScroll.Value = vy
    ElseIf vy > VScroll.Max Then
        VScroll.Value = VScroll.Max
    ElseIf vy < VScroll.Min Then
        VScroll.Value = VScroll.Min
    End If
    
End Sub

Private Sub pChild_MouseUp(Button As Integer, shift As Integer, x As Single, y As Single)
    '
    If Button <> vbLeftButton Then Exit Sub
    pChild.MousePointer = 0
End Sub


Public Sub Zoom(sValue As Single)
    'Set  Zoom Value
End Sub

Public Sub Attatch(newChild As PictureBox)
    Set pChild = newChild
    lPrevParent = SetParent(newChild.hwnd, pView.hwnd)
    pChild.Move 0, 0
    pChild.MouseIcon = curMove.Picture
    pChild.MousePointer = 0
    UserControl_Resize
    UpdatePos
End Sub

Public Sub Detatch()
    SetParent pChild.hwnd, lPrevParent
    Set pChild = Nothing
End Sub
