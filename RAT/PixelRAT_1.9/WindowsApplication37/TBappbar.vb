Imports System.Runtime.InteropServices

Public Class TBAppBar

    Private Declare Function GetAppBarMessage Lib "shell32" Alias "SHAppBarMessage" _
       (ByVal dwMessage As Integer, ByRef pData As APPBARDATA) As Integer 'Get Message Sent By App Bar

    Private Declare Function SetAppBarMessage Lib "shell32" Alias "SHAppBarMessage" _
       (ByVal dwMessage As Integer, ByRef pData As APPBARDATA) As Integer 'Send Message To App BAr

    Private Structure APPBARDATA 'AppBar Structure
        Dim cbSize As Integer
        Dim hwnd As Integer
        Dim uCallbackMessage As Integer
        Dim uEdge As Integer
        Dim rc As Rectangle
        Dim lParam As Integer
    End Structure

    Private Const ABM_GETSTATE As Int32 = &H4 'Get Current State
    Private Const ABM_GETTASKBARPOS As Int32 = &H5 'Get TaskBar Position
    Private Const ABM_SETSTATE As Int32 = &HA 'Apply Setting(s)
    Private Const ABS_AUTOHIDE As Int32 = &H1 'Autohide
    Private Const ABS_ALWAYSONTOP As Int32 = &H2 'Always on Top

    Private TBAppBAutoHide As Boolean
    Private TBAppBarAlwaysOnTop As Boolean

    Public Sub New()
        Me.GetState() 'Get Current State
    End Sub

    Private Sub GetState()

        Dim AppBarSetting As New APPBARDATA 'What Setting?

        AppBarSetting.cbSize = Marshal.SizeOf(AppBarSetting) 'Initialise

        Dim AppBarState As Int32 = GetAppBarMessage(ABM_GETSTATE, AppBarSetting) 'Get Current State

        Select Case AppBarState

            Case 0 'Nothing Set
                TBAppBAutoHide = False
                TBAppBarAlwaysOnTop = False

            Case ABS_ALWAYSONTOP 'Always On Top
                TBAppBAutoHide = False
                TBAppBarAlwaysOnTop = True

            Case Else
                TBAppBAutoHide = True 'AutoHide

        End Select

    End Sub

    Private Sub SetState() 'Apply Settings

        Dim AppBarSetting As New APPBARDATA 'Setting We Want To Apply
        AppBarSetting.cbSize = Marshal.SizeOf(AppBarSetting) 'Initialise

        If Me.AutoHide Then
            AppBarSetting.lParam = ABS_AUTOHIDE 'AutoHide
        End If

        If Me.AlwaysOnTop Then
            AppBarSetting.lParam = AppBarSetting.lParam Or ABS_ALWAYSONTOP 'Always On Top
        End If

        SetAppBarMessage(ABM_SETSTATE, AppBarSetting)

    End Sub

    Public Property AutoHide() As Boolean 'Autohide
        Get
            Return TBAppBAutoHide
        End Get
        Set(ByVal Value As Boolean)
            TBAppBAutoHide = Value
            Me.SetState()
        End Set
    End Property

    Public Property AlwaysOnTop() As Boolean 'Always On Top
        Get
            Return TBAppBarAlwaysOnTop
        End Get
        Set(ByVal Value As Boolean)
            TBAppBarAlwaysOnTop = Value
            Me.SetState()
        End Set
    End Property

End Class