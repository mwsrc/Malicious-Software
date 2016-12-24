VERSION 5.00
Begin VB.UserControl ucProgressBar 
   ClientHeight    =   405
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   3660
   ScaleHeight     =   405
   ScaleWidth      =   3660
End
Attribute VB_Name = "ucProgressBar"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
Private Declare Function CreateWindowEx Lib "user32" Alias "CreateWindowExA" (ByVal dwExStyle As Long, ByVal lpClassName As String, ByVal lpWindowName As String, ByVal dwStyle As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hWndParent As Long, ByVal hMenu As Long, ByVal hInstance As Long, lpParam As Any) As Long
Private Declare Function DestroyWindow Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Private Declare Function SendMessageLong Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Private Declare Function MoveWindow Lib "user32.dll" (ByVal hwnd As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal bRepaint As Long) As Long

Private Const PROGRESS_CLASSA   As String = "msctls_progress32"

Public Enum eOrientation
    Orizontal = 0
    Vertical = 1
End Enum
 
Private Const WS_VISIBLE        As Long = &H10000000
Private Const WS_CHILD          As Long = &H40000000
 
Private Const WM_USER           As Long = &H400
Private Const PBM_GETPOS As Long = (WM_USER + 8)
Private Const PBM_SETPOS As Long = (WM_USER + 2)
Private Const PBM_SETRANGE As Long = (WM_USER + 1)
Private Const PBM_GETRANGE As Long = (WM_USER + 7)
Private Const PBM_SETRANGE32 As Long = (WM_USER + 6)


Private Const PBS_SMOOTH        As Long = &H1
Private Const PBS_VERTICAL      As Long = &H4
Private Const PBS_MARQUEE       As Long = 8

Private Const PBM_SETMARQUEE = (WM_USER + 10)

Private c_lhWnd As Long
Private m_Value As Long
Private m_Max As Long
Private m_Min As Long
Private m_Orientation As eOrientation
Private m_Smooth As Boolean
Private m_Marquee As Boolean
Private m_MarqueeVelocity As Long


Private Sub UserControl_Initialize()
    m_Max = 100
    Call pvCreate
End Sub

Private Sub pvCreate()
    
    Dim lFlag As Long
     
    If c_lhWnd Then DestroyWindow c_lhWnd
    
    lFlag = WS_CHILD Or WS_VISIBLE
    If m_Orientation = Vertical Then lFlag = lFlag Or PBS_VERTICAL
    If m_Smooth Then lFlag = lFlag Or PBS_SMOOTH
    If m_Marquee Then lFlag = lFlag Or PBS_MARQUEE
 
    c_lhWnd = CreateWindowEx(0, PROGRESS_CLASSA, vbNullString, lFlag, 0, 0, UserControl.ScaleWidth / Screen.TwipsPerPixelX, _
    UserControl.ScaleHeight / Screen.TwipsPerPixelY, UserControl.hwnd, vbNull, App.hInstance, ByVal 0&)
    
    Me.Max = Me.Max
    Me.Value = Me.Value
    
    If m_Marquee Then Call SendMessage(c_lhWnd, PBM_SETMARQUEE, 1, ByVal m_MarqueeVelocity)
End Sub

Private Sub UserControl_Resize()
  If c_lhWnd Then MoveWindow c_lhWnd, 0, 0, UserControl.ScaleWidth / Screen.TwipsPerPixelX, UserControl.ScaleHeight / Screen.TwipsPerPixelY, True
End Sub

Private Sub UserControl_Terminate()
    If c_lhWnd Then DestroyWindow c_lhWnd
End Sub

Public Property Get hwnd() As Long
    hwnd = UserControl.hwnd
End Property

Public Property Let Value(ByVal lVal As Long)
    If c_lhWnd Then
        m_Value = lVal
        Call SendMessage(c_lhWnd, PBM_SETPOS, ByVal lVal, ByVal 0&)
    End If
End Property
 
Public Property Get Value() As Long
        Value = m_Value
End Property

Public Property Let Max(ByVal lVal As Long)
    If c_lhWnd Then
        m_Max = lVal
        Call SendMessage(c_lhWnd, PBM_SETRANGE32, ByVal m_Min, ByVal m_Max)
    End If
End Property

Public Property Get Max() As Long
        Max = m_Max
End Property

Public Property Let Min(ByVal lVal As Long)
    If c_lhWnd Then
        m_Min = lVal
        Call SendMessage(c_lhWnd, PBM_SETRANGE32, ByVal m_Min, ByVal m_Max)
    End If
End Property

Public Property Get Min() As Long
        Min = m_Min
End Property

Public Property Let Orientation(ByVal Pos As eOrientation)
    m_Orientation = Pos
    pvCreate
End Property

Public Property Get Orientation() As eOrientation
    Orientation = m_Orientation
End Property

Public Property Let Smooth(ByVal Value As Boolean)
    m_Smooth = Value
    pvCreate
End Property

Public Property Get Smooth() As Boolean
    Smooth = m_Smooth
End Property

Public Property Let Marquee(ByVal Value As Boolean)
    m_Marquee = Value
    pvCreate
End Property

Public Property Get Marquee() As Boolean
    Marquee = m_Marquee
End Property

Public Property Let Velocity(ByVal Value As Long)
    m_MarqueeVelocity = Value
    If m_Marquee Then Call SendMessage(c_lhWnd, PBM_SETMARQUEE, m_MarqueeVelocity, ByVal m_MarqueeVelocity)
End Property

Public Property Get Velocity() As Long
    Velocity = m_MarqueeVelocity
End Property


