Imports System.Drawing.Drawing2D
Imports System.Threading
Imports System.ComponentModel
Imports System.Drawing.Text
Imports System.Security


Class BitdefenderForm : Inherits ContainerControl

#Region "Init"
    Sub New()
        SetStyle(ControlStyles.AllPaintingInWmPaint Or ControlStyles.DoubleBuffer Or ControlStyles.OptimizedDoubleBuffer Or ControlStyles.ResizeRedraw Or ControlStyles.SupportsTransparentBackColor Or ControlStyles.SupportsTransparentBackColor, True)
        DoubleBuffered = True
        Dock = DockStyle.Fill
        BackColor = Color.Fuchsia
    End Sub
    Protected Overrides Sub OnHandleCreated(ByVal e As EventArgs)
        MyBase.OnHandleCreated(e)
        If FindForm() IsNot Nothing Then
            FindForm.FormBorderStyle = FormBorderStyle.None : FindForm.TransparencyKey = BackColor
        End If

    End Sub

#Region "Property"

    Public Overrides Property Text As String
        Get
            Return MyBase.Text
        End Get
        Set(value As String)
            MyBase.Text = value
            Invalidate(New Rectangle(0, 0, Width, 70), False)
        End Set
    End Property



    Private _DisableMax As Boolean
    Public Property DisableControlboxMax As Boolean
        Get
            Return _DisableMax
        End Get
        Set(value As Boolean)
            _DisableMax = value
            Invalidate(False)
        End Set
    End Property

    Private _DisableMin As Boolean
    Public Property DisableControlboxMin As Boolean
        Get
            Return _DisableMin
        End Get
        Set(value As Boolean)
            _DisableMin = value
            Invalidate(False)
        End Set
    End Property

    Private _DisableClose As Boolean
    Public Property DisableControlboxClose As Boolean
        Get
            Return _DisableClose
        End Get
        Set(value As Boolean)
            _DisableClose = value
            Invalidate(False)
        End Set
    End Property
#End Region


#Region "Flag mouse"
    Dim mouseOffset As Point
    Protected Overrides Sub OnMouseDown(ByVal e As MouseEventArgs)
        MyBase.OnMouseDown(e)
        mouseOffset = New Point(-e.X, -e.Y)
    End Sub
    Protected Overrides Sub OnMouseMove(ByVal e As MouseEventArgs)
        MyBase.OnMouseMove(e)

        '#Zone " Move form "
        For x As Integer = 0 To Width - 1
            For y As Integer = 0 To 30
                If e.Button = MouseButtons.Left AndAlso e.Location.Equals(New Point(x, y)) Then
                    Dim mousePos = Control.MousePosition
                    mousePos.Offset(mouseOffset.X, mouseOffset.Y)
                    FindForm.Location = mousePos
                End If
            Next
        Next
        '#End Zone

        '#Zone " None mouse flag "
        MouseState = State.None
        Cursor = Cursors.Default
        '#End Zone

        '#Zone " minRect "
        Dim minRect As Rectangle = New Rectangle(Right - Padding - (controlSize.Width + 20), Padding, btnSize.Width, btnSize.Height)
        If minRect.Contains(e.Location) Then
            Cursor = Cursors.Hand
            MouseState = State.HoverMin
        End If
        '#End Zone

        '#Zone " maxRect "
        Dim maxRect As New Rectangle(minRect.X + 29, minRect.Y, btnSize.Width, btnSize.Height)
        If maxRect.Contains(e.Location) Then
            Cursor = Cursors.Hand
            MouseState = State.HoverMax
        End If
        '#End Zone

        '#Zone " closeRect "
        Dim closeRect As New Rectangle(maxRect.X + 29, minRect.Y, btnSize.Width, btnSize.Height)
        If closeRect.Contains(e.Location) Then
            Cursor = Cursors.Hand
            MouseState = State.HoverClose
        End If
        '#End Zone




    End Sub
    Protected Overrides Sub OnMouseUp(ByVal e As MouseEventArgs)
        MyBase.OnMouseUp(e)
        Dim min As Rectangle = New Rectangle(Right - Padding - (controlSize.Width + 20), Padding, btnSize.Width, btnSize.Height)
        Dim max As New Rectangle(min.X + 29, min.Y, btnSize.Width, btnSize.Height)
        Dim close As New Rectangle(max.X + 29, max.Y, btnSize.Width, btnSize.Height)

        If min.Contains(e.Location) AndAlso e.Button = MouseButtons.Left AndAlso Not DisableControlboxMin Then
            FindForm.WindowState = FormWindowState.Minimized
        End If

        If max.Contains(e.Location) AndAlso e.Button = MouseButtons.Left AndAlso Not DisableControlboxMax Then
            Select Case FindForm.WindowState
                Case FormWindowState.Maximized
                    FindForm.WindowState = FormWindowState.Normal
                Case FormWindowState.Normal
                    FindForm.WindowState = FormWindowState.Maximized
            End Select

        End If

        If close.Contains(e.Location) AndAlso e.Button = MouseButtons.Left AndAlso Not DisableControlboxClose Then
            FindForm.Close()
        End If

    End Sub

#Region "Draw mouse state"
    Private Enum State
        None
        HoverClose
        HoverMax
        HoverMin
    End Enum
    Private _MouseState As State
    Private Property MouseState As State
        Get
            Return _MouseState
        End Get
        Set(value As State)
            _MouseState = value
            Invalidate(False)
        End Set
    End Property
#End Region

#End Region 'Flag mouse


#End Region 'Init

#Region "Draw"

#Region "Init Draw Object"

#Region "Draw Object Declarations"
    Private G As Graphics
    Private Shadows Const Padding As Integer = 10
    '#Zone " Controlbox "
    Private btnSize As Size = New Size(27, 30)
    Private controlSize As Size = New Size(86, btnSize.Height)
    Private controlboxPath As GraphicsPath
    '#End Zone

    Private R1, R2, R4, R5, R6 As Rectangle
    Private GP1, GP2, GP3, GP4 As GraphicsPath
    Private P1, P2, P3, P4, P5, P6 As Pen
    Private B1 As SolidBrush
    Private LGB1, LGB2, LGB3, LGB4, LGB5, LGB6 As LinearGradientBrush
    Private C1, C2, C3, C4, C5, C6, C7, C8, C9, C10 As Color

    Private containerDisposable As New ContainerObjectDisposable

#End Region 'Draw Object Declarations

    Private Sub Init(e As PaintEventArgs)

        G = e.Graphics

        '#Zone " Rectangle "
        R1 = New Rectangle(Padding, Padding, Width - Padding * 2, Height - Padding * 2)
        R2 = New Rectangle(R1.X + 1, R1.Y + 1, R1.Width - 2, R1.Height - 2)
        R4 = New Rectangle(Padding, Padding, Width, 20)
        R5 = New Rectangle(Right - Padding - (controlSize.Width + 20), Padding, controlSize.Width, controlSize.Height)
        R6 = New Rectangle(R5.X + 1, R5.Y + 1, R5.Width - 2, R5.Height - 2)
        '#End Zone

        '#Zone " Graphic path "
        GP1 = RoundRect(R1, 18)
        GP2 = RoundRect(R2, 18)
        GP3 = ControlRect(R5, 9)
        GP4 = ControlRect(R6, 9)
        controlboxPath = New GraphicsPath
        containerDisposable.AddObjectRange({GP1, GP2, GP3, GP4, controlboxPath})
        '#End Zone

        '#Zone " Brush "
        B1 = New SolidBrush(Color.FromArgb(32, 32, 32))
        containerDisposable.AddObject(B1)
        '#End Zone

        '#Zone " Color "
        C1 = Color.FromArgb(81, 81, 81)
        C2 = Color.FromArgb(43, 43, 43)
        C3 = Color.FromArgb(21, 21, 21)
        C4 = Color.FromArgb(10, 10, 10)
        C5 = Color.FromArgb(167, 167, 167)
        C6 = Color.FromArgb(83, 83, 83)
        C7 = Color.FromArgb(41, 41, 41)
        C8 = Color.FromArgb(33, 33, 33)
        C9 = Color.FromArgb(41, 41, 41)
        C10 = Color.FromArgb(77, 77, 77)
        '#End Zone

        '#Zone " Linear Gradient Brush "
        LGB1 = New LinearGradientBrush(R4, C1, C2, LinearGradientMode.Vertical)
        LGB2 = New LinearGradientBrush(R5, C6, C7, LinearGradientMode.Vertical)
        LGB3 = New LinearGradientBrush(R5, C8, C7, LinearGradientMode.Vertical)
        LGB4 = New LinearGradientBrush(New Point(R5.Left + 27, R5.Top + 2), New Point(R5.Left + 27, R5.Bottom - 2), C3, C4)
        LGB5 = New LinearGradientBrush(New Point(R5.Left + 28, R5.Top + 2), New Point(R5.Left + 28, R5.Bottom - 1), C5, C6)
        LGB6 = New LinearGradientBrush(R5, C9, C10, LinearGradientMode.Vertical)
        containerDisposable.AddObjectRange({LGB1, LGB2, LGB3, LGB4, LGB5, LGB6})

        '#End Zone

        '#Zone " Pen "
        P1 = New Pen(Color.FromArgb(33, 33, 33))
        P2 = New Pen(Color.FromArgb(240, 240, 240))
        P3 = New Pen(LGB3)
        P4 = New Pen(New SolidBrush(Color.FromArgb(83, 83, 83)))
        P5 = New Pen(LGB4)
        P6 = New Pen(LGB5)
        containerDisposable.AddObjectRange({P1, P2, P3, P4, P5, P6})
        '#End Zone


    End Sub

#End Region 'Init Draw Object



    Protected Overrides Sub OnPaint(ByVal e As PaintEventArgs)
        MyBase.OnPaint(e)

        ''#Zone " DebugMode "
#If DEBUG Then
        'Dim ST As New Stopwatch : ST.Start()
#End If

        '#End Zone

        Init(e)

        '#Zone " Draw background"
        G.FillPath(B1, GP1)
        '#End Zone

        '#Zone " Draw header "
        G.SetClip(GP2)
        G.FillRectangle(LGB1, R4)
        G.ResetClip()
        '#End Zone

        '#Zone " Draw title "
        G.DrawString(Text, New Font("Microsoft Sans Serif", 10, FontStyle.Regular), Brushes.White, 27, 22)
        '#End Zone

        '#Zone " Draw border "
        G.DrawPath(P1, GP1)
        G.DrawPath(P2, GP2)
        '#End Zone

        '#Zone " Mouse state "
        Select Case MouseState
            Case State.HoverClose
                DrawControlBox_Close(G)
            Case State.HoverMax
                DrawControlBox_Max(G)
            Case State.HoverMin
                DrawControlBox_Min(G)
            Case State.None
                DrawControlBox(G)
        End Select
        '#End Zone

        '#Zone " Dispose all draw object "
        containerDisposable.Dispose()
        '#End Zone

        '#Zone " DebugMode "
#If DEBUG Then
        'Debug.WriteLine(ST.Elapsed.ToString)
#End If

        '#End Zone

    End Sub

    Private Sub DrawControlBox(ByVal G As Graphics)

        G.SmoothingMode = SmoothingMode.HighQuality

        G.FillPath(LGB2, GP3)
        G.DrawPath(P3, GP3)
        G.DrawPath(P4, GP4)
        '#Zone " If you want white line "
        G.DrawLine(P2, R5.Left, R5.Top + 1, R5.Right, R5.Top + 1)
        '#End Zone
        '#Zone " Fix     !important "
        G.DrawLine(P3, R5.Right, R5.Top, R5.Right, R5.Bottom - 4)
        G.DrawLine(P4, R6.Right, R6.Top + 1, R6.Right, R6.Bottom - 4)

        G.SmoothingMode = SmoothingMode.Default

        G.FillRectangle(P3.Brush, New Rectangle(R5.X, R5.Y + 1, 1, 1))
        G.FillRectangle(P3.Brush, New Rectangle(R5.Right, R5.Top + 1, 1, 1))
        '#End Zone
        '#Zone " First line "
        G.DrawLine(P5, R5.Left + 29, R5.Top + 2, R5.Left + 29, R5.Bottom - 2)
        G.DrawLine(P6, R5.Left + 30, R5.Top + 2, R5.Left + 30, R5.Bottom - 2)
        '#End Zone
        '#Zone " Second line "
        G.DrawLine(P5, R5.Left + 56, R5.Top + 2, R5.Left + 56, R5.Bottom - 2)
        G.DrawLine(P6, R5.Left + 57, R5.Top + 2, R5.Left + 57, R5.Bottom - 2)
        '#End Zone



        '#Zone " close string "
        controlboxPath.AddString("r", New FontFamily("Webdings"), FontStyle.Regular, 15, New Point(Right - Padding - (btnSize.Width + 20) + 2, Padding + 8), Nothing)
        G.FillPath(Brushes.White, controlboxPath)
        G.DrawPath(Pens.Black, controlboxPath)
        '#End Zone

        '#Zone " max string "
        Select Case FindForm.WindowState
            Case FormWindowState.Maximized
                controlboxPath.AddString("2", New FontFamily("Webdings"), FontStyle.Regular, 15, New Point(Right - Padding - (btnSize.Width * 2 + 20) + 4, Padding + 8), Nothing)
                G.DrawPath(Pens.Black, controlboxPath)
                G.FillPath(Brushes.White, controlboxPath)

            Case FormWindowState.Normal
                controlboxPath.AddString("1", New FontFamily("Webdings"), FontStyle.Bold, 15, New Point(Right - Padding - (btnSize.Width * 2 + 20) + 2, Padding + 8), Nothing)
                G.DrawPath(Pens.Black, controlboxPath)
                G.FillPath(Brushes.White, controlboxPath)
        End Select
        '#End Zone

        '#Zone " min string "
        controlboxPath.AddString("0", New FontFamily("Webdings"), FontStyle.Bold, 15, New Point(Right - Padding - (btnSize.Width * 3 + 20) + 2, Padding + 8), Nothing)
        G.DrawPath(Pens.Black, controlboxPath)
        G.FillPath(Brushes.White, controlboxPath)
        '#End Zone

    End Sub

    Private Sub DrawControlBox_Close(ByVal G As Graphics)
        G.SmoothingMode = SmoothingMode.HighQuality

        G.FillPath(LGB2, GP3)

        G.SetClip(New Rectangle(Right - Padding - (btnSize.Width + 23) + 1, Padding, btnSize.Width + 3, btnSize.Height))
        G.FillPath(LGB6, GP3)
        G.ResetClip()

        G.DrawPath(P3, GP3)
        G.DrawPath(P4, GP4)

        '#Zone " If you want white line "
        G.DrawLine(P2, R5.Left, R5.Top + 1, R5.Right, R5.Top + 1)
        '#End Zone

        '#Zone " Fix     !important "
        G.DrawLine(P3, R5.Right, R5.Top, R5.Right, R5.Bottom - 4)
        G.DrawLine(P4, R6.Right, R6.Top + 1, R6.Right, R6.Bottom - 4)

        G.SmoothingMode = SmoothingMode.Default

        G.FillRectangle(P3.Brush, New Rectangle(R5.X, R5.Y + 1, 1, 1))
        G.FillRectangle(P3.Brush, New Rectangle(R5.Right, R5.Top + 1, 1, 1))
        '#End Zone

        '#Zone " First line "
        G.DrawLine(P5, R5.Left + 29, R5.Top + 2, R5.Left + 29, R5.Bottom - 2)
        G.DrawLine(P6, R5.Left + 30, R5.Top + 2, R5.Left + 30, R5.Bottom - 2)
        '#End Zone

        '#Zone " Second line "
        G.DrawLine(P5, R5.Left + 56, R5.Top + 2, R5.Left + 56, R5.Bottom - 2)
        '#End Zone

        '#Zone " close string "
        controlboxPath.AddString("r", New FontFamily("Webdings"), FontStyle.Regular, 15, New Point(Right - Padding - (btnSize.Width + 20) + 2, Padding + 10), Nothing)
        G.FillPath(Brushes.White, controlboxPath)
        G.DrawPath(Pens.Black, controlboxPath)
        '#End Zone

        '#Zone " max string "
        Select Case FindForm.WindowState
            Case FormWindowState.Maximized
                controlboxPath.AddString("2", New FontFamily("Webdings"), FontStyle.Regular, 15, New Point(Right - Padding - (btnSize.Width * 2 + 20) + 4, Padding + 8), Nothing)
                G.DrawPath(Pens.Black, controlboxPath)
                G.FillPath(Brushes.White, controlboxPath)

            Case FormWindowState.Normal
                controlboxPath.AddString("1", New FontFamily("Webdings"), FontStyle.Bold, 15, New Point(Right - Padding - (btnSize.Width * 2 + 20) + 2, Padding + 8), Nothing)
                G.DrawPath(Pens.Black, controlboxPath)
                G.FillPath(Brushes.White, controlboxPath)
        End Select
        '#End Zone

        '#Zone " min string "
        controlboxPath.AddString("0", New FontFamily("Webdings"), FontStyle.Bold, 15, New Point(Right - Padding - (btnSize.Width * 3 + 20) + 2, Padding + 8), Nothing)
        G.DrawPath(Pens.Black, controlboxPath)
        G.FillPath(Brushes.White, controlboxPath)
        '#End Zone

    End Sub

    Private Sub DrawControlBox_Max(ByVal G As Graphics)
        G.SmoothingMode = SmoothingMode.HighQuality

        G.FillPath(LGB2, GP3)

        G.SetClip(New Rectangle(Right - Padding - (btnSize.Width * 2 + 23) + 1, Padding, btnSize.Width, btnSize.Height))
        G.FillPath(LGB6, GP3)
        G.ResetClip()

        G.DrawPath(P3, GP3)
        G.DrawPath(P4, GP4)

        '#Zone " If you want white line "
        G.DrawLine(P2, R5.Left, R5.Top + 1, R5.Right, R5.Top + 1)
        '#End Zone

        '#Zone " Fix     !important "
        G.DrawLine(P3, R5.Right, R5.Top, R5.Right, R5.Bottom - 4)
        G.DrawLine(P4, R6.Right, R6.Top + 1, R6.Right, R6.Bottom - 4)

        G.SmoothingMode = SmoothingMode.Default

        G.FillRectangle(P3.Brush, New Rectangle(R5.X, R5.Y + 1, 1, 1))
        G.FillRectangle(P3.Brush, New Rectangle(R5.Right, R5.Top + 1, 1, 1))
        '#End Zone

        '#Zone " First line "
        G.DrawLine(P5, R5.Left + 29, R5.Top + 2, R5.Left + 29, R5.Bottom - 2)
        '#End Zone

        '#Zone " Second line "
        G.DrawLine(P5, R5.Left + 56, R5.Top + 2, R5.Left + 56, R5.Bottom - 2)
        G.DrawLine(P6, R5.Left + 57, R5.Top + 2, R5.Left + 57, R5.Bottom - 2)
        '#End Zone

        '#Zone " close string "
        controlboxPath.AddString("r", New FontFamily("Webdings"), FontStyle.Regular, 15, New Point(Right - Padding - (btnSize.Width + 20) + 2, Padding + 8), Nothing)
        G.FillPath(Brushes.White, controlboxPath)
        G.DrawPath(Pens.Black, controlboxPath)
        '#End Zone

        '#Zone " max string "
        Select Case FindForm.WindowState
            Case FormWindowState.Maximized
                controlboxPath.AddString("2", New FontFamily("Webdings"), FontStyle.Regular, 15, New Point(Right - Padding - (btnSize.Width * 2 + 20) + 4, Padding + 10), Nothing)
                G.DrawPath(Pens.Black, controlboxPath)
                G.FillPath(Brushes.White, controlboxPath)

            Case FormWindowState.Normal
                controlboxPath.AddString("1", New FontFamily("Webdings"), FontStyle.Bold, 15, New Point(Right - Padding - (btnSize.Width * 2 + 20) + 2, Padding + 10), Nothing)
                G.DrawPath(Pens.Black, controlboxPath)
                G.FillPath(Brushes.White, controlboxPath)
        End Select
        '#End Zone

        '#Zone " min string "
        controlboxPath.AddString("0", New FontFamily("Webdings"), FontStyle.Bold, 15, New Point(Right - Padding - (btnSize.Width * 3 + 20) + 2, Padding + 8), Nothing)
        G.DrawPath(Pens.Black, controlboxPath)
        G.FillPath(Brushes.White, controlboxPath)
        '#End Zone
    End Sub

    Private Sub DrawControlBox_Min(ByVal G As Graphics)
        G.SmoothingMode = SmoothingMode.HighQuality

        G.FillPath(LGB2, GP3)

        G.SetClip(New Rectangle(Right - Padding - (controlSize.Width + 20) + 1, Padding, btnSize.Width + 3, btnSize.Height))
        G.FillPath(LGB6, GP3)
        G.ResetClip()

        G.DrawPath(P3, GP3)
        G.DrawPath(P4, GP4)

        '#Zone " If you want white line "
        G.DrawLine(P2, R5.Left, R5.Top + 1, R5.Right, R5.Top + 1)
        '#End Zone

        '#Zone " Fix     !important "
        G.DrawLine(P3, R5.Right, R5.Top, R5.Right, R5.Bottom - 4)
        G.DrawLine(P4, R6.Right, R6.Top + 1, R6.Right, R6.Bottom - 4)

        G.SmoothingMode = SmoothingMode.Default

        G.FillRectangle(P3.Brush, New Rectangle(R5.X, R5.Y + 1, 1, 1))
        G.FillRectangle(P3.Brush, New Rectangle(R5.Right, R5.Top + 1, 1, 1))
        '#End Zone

        '#Zone " First line "
        G.DrawLine(P5, R5.Left + 29, R5.Top + 2, R5.Left + 29, R5.Bottom - 2)
        G.DrawLine(P6, R5.Left + 30, R5.Top + 2, R5.Left + 30, R5.Bottom - 2)
        '#End Zone

        '#Zone " Second line "
        G.DrawLine(P5, R5.Left + 56, R5.Top + 2, R5.Left + 56, R5.Bottom - 2)
        G.DrawLine(P6, R5.Left + 57, R5.Top + 2, R5.Left + 57, R5.Bottom - 2)

        '#End Zone

        '#Zone " close string "
        controlboxPath.AddString("r", New FontFamily("Webdings"), FontStyle.Regular, 15, New Point(Right - Padding - (btnSize.Width + 20) + 2, Padding + 8), Nothing)
        G.FillPath(Brushes.White, controlboxPath)
        G.DrawPath(Pens.Black, controlboxPath)
        '#End Zone

        '#Zone " max string "
        Select Case FindForm.WindowState
            Case FormWindowState.Maximized
                controlboxPath.AddString("2", New FontFamily("Webdings"), FontStyle.Regular, 15, New Point(Right - Padding - (btnSize.Width * 2 + 20) + 4, Padding + 8), Nothing)
                G.DrawPath(Pens.Black, controlboxPath)
                G.FillPath(Brushes.White, controlboxPath)

            Case FormWindowState.Normal
                controlboxPath.AddString("1", New FontFamily("Webdings"), FontStyle.Bold, 15, New Point(Right - Padding - (btnSize.Width * 2 + 20) + 2, Padding + 8), Nothing)
                G.DrawPath(Pens.Black, controlboxPath)
                G.FillPath(Brushes.White, controlboxPath)
        End Select
        '#End Zone

        '#Zone " min string "
        controlboxPath.AddString("0", New FontFamily("Webdings"), FontStyle.Bold, 15, New Point(Right - Padding - (btnSize.Width * 3 + 20) + 2, Padding + 10), Nothing)
        G.DrawPath(Pens.Black, controlboxPath)
        G.FillPath(Brushes.White, controlboxPath)
        '#End Zone
    End Sub


    Private Function ControlRect(ByVal R As Rectangle, ByVal radius As Integer)
        Dim GP As New GraphicsPath
        GP.AddArc(R.Right - radius, R.Bottom - radius, radius, radius, 0, 90)
        GP.AddArc(R.X, R.Bottom - radius, radius, radius, 90, 90)
        GP.AddLine(R.Left, R.Top, R.Right, R.Top)
        Return GP
    End Function


#End Region 'Draw

End Class

Class BitdefenderSeparator : Inherits Control
    Sub New()
        SetStyle(ControlStyles.AllPaintingInWmPaint Or ControlStyles.DoubleBuffer Or ControlStyles.OptimizedDoubleBuffer Or ControlStyles.SupportsTransparentBackColor Or ControlStyles.UserPaint, True)
        Width = 400
        Height = 3
        BackColor = Color.Transparent
    End Sub

#Region "Declarations"
    Private G As Graphics
    Private LGB1, LGB2 As LinearGradientBrush
    Private P1, P2 As Pen
    Private CB1, CB2 As ColorBlend
    Private C1, C2 As Color
    Private conObj As New ContainerObjectDisposable
#End Region 'Declarations
    Protected Overrides Sub OnPaint(ByVal e As PaintEventArgs)
        MyBase.OnPaint(e)
        '#Zone " Declarations "
        Dim Colors1, Colors2 As New List(Of Color)

        C1 = Color.FromArgb(62, 62, 62)
        C2 = Color.FromArgb(1, 1, 1)

        G = e.Graphics

        LGB1 = New LinearGradientBrush(New Point(0, 0), New Point(Width, 0), Nothing, Nothing)
        LGB2 = New LinearGradientBrush(New Point(0, 1), New Point(Width, 1), Nothing, Nothing)
        conObj.AddObjectRange({LGB1, LGB2})

        CB1 = New ColorBlend
        CB2 = New ColorBlend
        '#End Zone

        '#Zone " Colors first line "
        For i As Integer = 0 To 255 Step 51
            Colors1.Add(Color.FromArgb(i, C1))
        Next
        For i As Integer = 255 To 0 Step -51
            Colors1.Add(Color.FromArgb(i, C1))
        Next
        '#End Zone

        '#Zone " Colors Second line "
        For i As Integer = 0 To 255 Step 51
            Colors2.Add(Color.FromArgb(i, C2))
        Next
        For i As Integer = 255 To 0 Step -51
            Colors2.Add(Color.FromArgb(i, C2))
        Next
        '#End Zone

        '#Zone " colorblend first line  "
        CB1.Colors = Colors1.ToArray
        CB1.Positions = {0.0, 0.08, 0.16, 0.24, 0.32, 0.4, 0.48, 0.56, 0.64, 0.72, 0.8, 1.0}
        '#End Zone

        '#Zone " colorblend second line "
        CB2.Colors = Colors2.ToArray
        CB2.Positions = {0.0, 0.08, 0.16, 0.24, 0.32, 0.4, 0.48, 0.56, 0.64, 0.72, 0.8, 1.0}
        '#End Zone

        '#Zone " Pen "
        LGB1.InterpolationColors = CB1
        LGB2.InterpolationColors = CB2

        P1 = New Pen(LGB1)
        P2 = New Pen(LGB2)
        conObj.AddObjectRange({P1, P2})
        '#End Zone

        G.DrawLine(P1, 0, 0, Width, 0)
        G.DrawLine(P2, 0, 1, Width, 1)

        conObj.Dispose()
    End Sub
End Class

<DefaultEvent("ChangeChecked")>
Class BitdefenderCheckbox : Inherits Control
#Region "Init"
#Region "Event"
    Public Event ChangeChecked(ByVal sender As Object, ByVal check As Boolean)
    Private _Check As Boolean
    Public Property Checked As Boolean
        Get
            Return _Check
        End Get
        Set(value As Boolean)
            _Check = value
            Invalidate()

            RaiseEvent ChangeChecked(Me, value)
        End Set
    End Property

    Protected Overrides Sub OnMouseUp(ByVal e As MouseEventArgs)
        MyBase.OnMouseUp(e) : Checked = Not Checked
    End Sub

#End Region 'Event

    Sub New()
        SetStyle(ControlStyles.AllPaintingInWmPaint Or ControlStyles.DoubleBuffer Or ControlStyles.OptimizedDoubleBuffer Or ControlStyles.SupportsTransparentBackColor Or ControlStyles.UserPaint, True)
        Width = 55
        Height = 25
        BackColor = Color.Transparent
        oldsize = New Size(55, 25)
    End Sub
#End Region 'Init

#Region "draw"

#Region "draw init object"

#Region "Declaration draw object"
    Private cn As ContainerObjectDisposable
    Private R1, R2, R3, R4, R5, R6 As Rectangle
    Private GP1, GP2, GP3, GP4, GP5, GP6 As GraphicsPath
    Private LGB1, LGB2, LGB3, LGB4 As LinearGradientBrush
    Private PGB1 As PathGradientBrush
    Private B1, B2, B3 As SolidBrush
    Private G As Graphics
    Private P1, P2 As Pen
    Dim CheckSize As Size
#End Region 'Declaration draw object
    Private Sub Init(e As PaintEventArgs)
        G = e.Graphics
        cn = New ContainerObjectDisposable
        R1 = New Rectangle(1, 1, Width - 2, Height - 2)
        R2 = New Rectangle(2, 2, Width - 4, Height - 4)

        GP1 = RoundRect(R1, 11) : cn.AddObject(GP1)
        GP2 = RoundRect(R2, 11) : cn.AddObject(GP2)

        B1 = New SolidBrush(Color.FromArgb(40, 40, 40)) : cn.AddObject(B1)
        If Checked Then
            B2 = New SolidBrush(Color.FromArgb(84, 135, 171))
            PGB1 = New PathGradientBrush(GP2) With {.CenterColor = Color.FromArgb(84, 135, 171), .SurroundColors = {Color.FromArgb(113, 176, 200)}, .FocusScales = New PointF(0.85, 0.65)}

        Else
            B2 = New SolidBrush(Color.FromArgb(29, 29, 29))
            PGB1 = New PathGradientBrush(GP2) With {.CenterColor = Color.FromArgb(29, 29, 29), .SurroundColors = {Color.FromArgb(39, 39, 39)}, .FocusScales = New PointF(0.85, 0.65)}
        End If
        cn.AddObjectRange({B2, PGB1})
        B3 = New SolidBrush(Color.FromArgb(107, 107, 107))
        cn.AddObject(B3)

        CheckSize = New Size(22, R2.Height)
        R3 = New Rectangle(Width - 2 - 22, 2, CheckSize.Width, CheckSize.Height)
        GP3 = RoundRect(R3, 11)
        R4 = New Rectangle(R3.X + 1, R3.Y + 1, R3.Width - 2, R3.Height - 2)
        GP4 = RoundRect(R4, 11)

        R5 = New Rectangle(0, 2, CheckSize.Width, CheckSize.Height)
        GP5 = RoundRect(R5, 11)
        R6 = New Rectangle(R5.X + 1, R5.Y + 1, R5.Width - 2, R5.Height - 2)
        GP6 = RoundRect(R6, 11)
        cn.AddObjectRange({GP3, GP4, GP5, GP6})
        If Hover Then
            LGB1 = New LinearGradientBrush(R3, Color.FromArgb(86, 86, 86), Color.FromArgb(42, 42, 42), LinearGradientMode.Vertical)
            LGB2 = New LinearGradientBrush(New Rectangle(R4.X - 1, R4.Y - 1, R4.Width + 2, R4.Height + 2), Color.FromArgb(147, 147, 147), Color.FromArgb(68, 68, 68), LinearGradientMode.Vertical)
            P1 = New Pen(LGB2)

            LGB3 = New LinearGradientBrush(R5, Color.FromArgb(86, 86, 86), Color.FromArgb(42, 42, 42), LinearGradientMode.Vertical)
            LGB4 = New LinearGradientBrush(New Rectangle(R6.X - 1, R6.Y - 1, R6.Width + 2, R6.Height + 2), Color.FromArgb(147, 147, 147), Color.FromArgb(68, 68, 68), LinearGradientMode.Vertical)
            P2 = New Pen(LGB4)

        Else
            LGB1 = New LinearGradientBrush(R3, Color.FromArgb(59, 59, 59), Color.FromArgb(29, 29, 29), LinearGradientMode.Vertical)
            LGB2 = New LinearGradientBrush(New Rectangle(R4.X - 1, R4.Y - 1, R4.Width + 2, R4.Height + 2), Color.FromArgb(101, 101, 101), Color.FromArgb(42, 42, 42), LinearGradientMode.Vertical)
            P1 = New Pen(LGB2)

            LGB3 = New LinearGradientBrush(R5, Color.FromArgb(59, 59, 59), Color.FromArgb(29, 29, 29), LinearGradientMode.Vertical)
            LGB4 = New LinearGradientBrush(New Rectangle(R6.X - 1, R6.Y - 1, R6.Width + 2, R6.Height + 2), Color.FromArgb(101, 101, 101), Color.FromArgb(42, 42, 42), LinearGradientMode.Vertical)
            P2 = New Pen(LGB4)

        End If
        cn.AddObjectRange({LGB1, LGB2, LGB3, LGB4, P1, P2})


    End Sub
#End Region 'draw init object

    Protected Overrides Sub OnPaint(ByVal e As PaintEventArgs)
        MyBase.OnPaint(e)
        Init(e)
        G.SmoothingMode = SmoothingMode.AntiAlias
        G.InterpolationMode = InterpolationMode.HighQualityBicubic
        G.FillPath(B1, GP1)

        If Checked Then

            G.FillPath(B2, GP2)
            G.FillPath(PGB1, GP2)
            G.DrawPath(Pens.Black, GP2)
            If Hover Then
                G.FillPath(LGB1, GP3)
                G.DrawPath(Pens.Black, GP3)
                G.DrawPath(P1, GP4)
                G.DrawString("ON", New Font("Microsoft Sans Serif", 7, FontStyle.Bold), Brushes.Black, 7, 6)
                G.DrawString("ON", New Font("Microsoft Sans Serif", 7, FontStyle.Bold), Brushes.White, 7, 7)
            Else
                G.FillPath(LGB1, GP3)
                G.DrawPath(Pens.Black, GP3)
                G.DrawPath(P1, GP4)
                G.DrawString("ON", New Font("Microsoft Sans Serif", 7, FontStyle.Bold), Brushes.Black, 7, 6)
                G.DrawString("ON", New Font("Microsoft Sans Serif", 7, FontStyle.Bold), Brushes.White, 7, 7)
            End If
        Else
            G.FillPath(B1, GP1)
            G.FillPath(B2, GP2)
            G.FillPath(PGB1, GP2)
            G.DrawPath(Pens.Black, GP2)
            If Hover Then
                G.FillPath(LGB3, GP5)
                G.DrawPath(Pens.Black, GP5)
                G.DrawPath(P2, GP6)
                G.DrawString("OFF", New Font("Microsoft Sans Serif", 7, FontStyle.Bold), Brushes.Black, Width - 29, 6)
                G.DrawString("OFF", New Font("Microsoft Sans Serif", 7, FontStyle.Bold), B3, Width - 29, 7)
            Else
                G.FillPath(LGB3, GP5)
                G.DrawPath(Pens.Black, GP5)
                G.DrawPath(P2, GP6)
                G.DrawString("OFF", New Font("Microsoft Sans Serif", 7, FontStyle.Bold), Brushes.Black, Width - 29, 6)
                G.DrawString("OFF", New Font("Microsoft Sans Serif", 7, FontStyle.Bold), B3, Width - 29, 7)
            End If

        End If
        cn.Dispose()
    End Sub
    Private _Hover As Boolean
    Private Property Hover As Boolean
        Get
            Return _Hover
        End Get
        Set(value As Boolean)
            _Hover = value
            Invalidate()
        End Set
    End Property
    Protected Overrides Sub onmouseenter(ByVal e As EventArgs)
        MyBase.OnMouseEnter(e)
        Hover = True
    End Sub
    Protected Overrides Sub onmouseleave(ByVal e As EventArgs)
        MyBase.OnMouseLeave(e)
        Hover = False
    End Sub
    Dim oldsize As Size

    Protected Overrides Sub onclientsizechanged(e As EventArgs)
        MyBase.OnClientSizeChanged(e)
        Me.Size = oldsize

    End Sub
#End Region 'draw

End Class

Class BitdefenderButton : Inherits Control

#Region "Init"
    Sub New()
        SetStyle(ControlStyles.AllPaintingInWmPaint Or ControlStyles.DoubleBuffer Or ControlStyles.OptimizedDoubleBuffer Or ControlStyles.SupportsTransparentBackColor Or ControlStyles.UserPaint, True)
        Width = 100
        Height = 55
        BackColor = Color.Transparent
    End Sub


    Public Overrides Property Text As String
        Get
            Return MyBase.Text
        End Get
        Set(value As String)
            MyBase.Text = value
            Invalidate()
        End Set
    End Property

    Private _Down As Boolean
    Private Property Down As Boolean
        Get
            Return _Down
        End Get
        Set(value As Boolean)
            _Down = value
            Invalidate()
        End Set
    End Property
    Protected Overrides Sub OnMouseDown(ByVal e As MouseEventArgs)
        MyBase.OnMouseDown(e) : Down = True
    End Sub
    Protected Overrides Sub OnMouseUp(ByVal e As MouseEventArgs)
        MyBase.OnMouseUp(e) : Down = False
    End Sub

#Region "Mouse state"

    Private OpenT As Thread
    Protected Overrides Sub OnMouseEnter(ByVal e As EventArgs)
        MyBase.OnMouseEnter(e)
        OpenT = New Thread(AddressOf EnterAnimation)
        If Not OpenT.IsAlive Then
            OpenT.IsBackground = True
            OpenT.Start()
        End If
    End Sub
    Private Sub EnterAnimation()
        Dim G As Graphics = Me.CreateGraphics()
        R2 = New Rectangle(5, 5, Width - 10, Height - 10)
        GP2 = RoundRect(R2, 11)
        G.SetClip(GP2)
        For fade As Integer = 0 To 5 Step 0.85
            Thread.Sleep(50)
            G.FillRectangle(New SolidBrush(Color.FromArgb(fade, Color.White)), ClientRectangle)
        Next
    End Sub


#End Region 'Mouse state

#End Region 'Init


#Region "Draw"
#Region "Draw init Object"
    Private C1, C3, C4, C5, C6 As Color
    Private R1, R2, R3 As Rectangle
    Private GP1, GP2, GP3 As GraphicsPath
    Private B1, B2 As SolidBrush
    Private P1, P2 As Pen
    Private LGB1, LGB2 As LinearGradientBrush
    Private SF1 As StringFormat
    Private G As Graphics

    Private Sub Init(e As PaintEventArgs)
        G = e.Graphics
        R1 = New Rectangle(3, 3, Width - 6, Height - 6)
        R2 = New Rectangle(5, 5, Width - 10, Height - 10)
        R3 = New Rectangle(6, 6, Width - 12, Height - 12)

        GP1 = RoundRect(R1, 11)
        GP2 = RoundRect(R2, 11)
        GP3 = RoundRect(R3, 11)


        C1 = Color.FromArgb(100, 41, 41, 41)
        C3 = Color.FromArgb(101, 101, 101)
        C4 = Color.FromArgb(60, 60, 60)
        C5 = Color.FromArgb(28, 28, 28)
        C6 = Color.FromArgb(45, 45, 45)

        B1 = New SolidBrush(C1)
        B2 = Brushes.White
        LGB1 = New LinearGradientBrush(R2, C4, C5, LinearGradientMode.Vertical)
        LGB2 = New LinearGradientBrush(R3, C3, C6, LinearGradientMode.Vertical)

        P1 = New Pen(Brushes.Black)
        P2 = New Pen(LGB2)

        SF1 = New StringFormat With {.Alignment = StringAlignment.Center, .LineAlignment = StringAlignment.Center, .Trimming = StringTrimming.Character}


    End Sub
#End Region 'Draw init Object

    Protected Overrides Sub OnPaint(ByVal e As PaintEventArgs)
        MyBase.OnPaint(e)
        Init(e)
        G.SmoothingMode = SmoothingMode.HighQuality
        G.FillPath(B1, GP1)
        G.FillPath(LGB1, GP2)
        G.DrawPath(P1, GP2)
        G.DrawPath(P2, GP3)
        If Not Down Then
            G.DrawString(Text, Font, B2, R3, SF1)
        Else
            R3.X += 1 : R3.Y += 1
            G.DrawString(Text, Font, B2, R3, SF1)
        End If


    End Sub


#End Region 'Draw

End Class

Class BitdefenderGroupbox : Inherits ContainerControl
    Sub New()
        SetStyle(ControlStyles.AllPaintingInWmPaint Or ControlStyles.DoubleBuffer Or ControlStyles.OptimizedDoubleBuffer Or ControlStyles.SupportsTransparentBackColor Or ControlStyles.UserPaint, True)
        Width = 100
        Height = 55
        BackColor = Color.Transparent
    End Sub

#Region "property"
    <Browsable(False)>
    Public Overloads Property Text As String

    Private _Title As String = "Title"
    Private _SubTitle As String = "Subtitle"

    Public Property Title As String
        Get
            Return _Title
        End Get
        Set(value As String)
            _Title = value
            Invalidate(False)
        End Set
    End Property
    Public Property Subtitle As String
        Get
            Return _SubTitle
        End Get
        Set(value As String)
            _SubTitle = value
            Invalidate(False)
        End Set
    End Property
#End Region 'property


    Private R1, R2 As Rectangle
    Private GP1, GP2 As GraphicsPath
    Private P1, P2 As Pen
    Private B1, B2 As SolidBrush
    Private SZ1, SZ2 As Size
    Private F1, F2 As Font
    Private S1, S2 As String
    Private G As Graphics
    Private Sub Init(e As PaintEventArgs)
        G = e.Graphics

        R1 = New Rectangle(3, 3, Width - 6, Height - 6)
        R2 = New Rectangle(4, 4, Width - 8, Height - 8)

        GP1 = RoundRect(R1, 11)
        GP2 = RoundRect(R2, 11)

        P1 = Pens.Black
        P2 = New Pen(New SolidBrush(Color.FromArgb(68, 68, 68)))

        B1 = New SolidBrush(Color.FromArgb(41, 41, 41))
        B2 = Brushes.White

        F1 = New Font("Verdana", 10, FontStyle.Bold)
        F2 = New Font("Verdana", 7, FontStyle.Regular)

        S1 = Title.ToUpper
        S2 = Subtitle

        SZ1 = G.MeasureString(S1, F1, Width).ToSize
        SZ2 = G.MeasureString(S2, F2, Width).ToSize

    End Sub
    Protected Overrides Sub OnPaint(ByVal e As PaintEventArgs)
        MyBase.OnPaint(e) : Init(e)
        G.SmoothingMode = SmoothingMode.HighQuality
        G.FillPath(B1, GP1)

        G.DrawPath(P1, GP1)
        G.DrawPath(P2, GP2)

        G.DrawString(S1, F1, B2, CInt((Width - SZ1.Width) / 2), 20)
        G.DrawString(S2, F2, B2, CInt((Width - SZ2.Width) / 2), 32)

    End Sub
End Class

Class BitdefenderRadiobutton : Inherits Control
#Region "Init"
#Region "Event"
    Public Event ChangeChecked(ByVal sender As Object, ByVal check As Boolean)
    Private _Check As Boolean
    Public Property Checked As Boolean
        Get
            Return _Check
        End Get
        Set(value As Boolean)
            _Check = value
            Invalidate()

            RaiseEvent ChangeChecked(Me, value)
        End Set
    End Property

    Protected Overrides Sub OnMouseUp(ByVal e As MouseEventArgs)
        MyBase.OnMouseUp(e) : Checked = Not Checked
    End Sub

#End Region 'Event
    Private oldHeight As Integer
    Sub New()
        SetStyle(ControlStyles.AllPaintingInWmPaint Or ControlStyles.DoubleBuffer Or ControlStyles.OptimizedDoubleBuffer Or ControlStyles.SupportsTransparentBackColor Or ControlStyles.UserPaint, True)
        Width = 100
        Height = 15
        BackColor = Color.Transparent
        oldHeight = 15
    End Sub

    Protected Overrides Sub OnClientSizeChanged(ByVal e As EventArgs)
        MyBase.OnClientSizeChanged(e) : Height = oldHeight
    End Sub

    Public Overrides Property Text() As String
        Get
            Return MyBase.Text
        End Get
        Set(value As String)
            MyBase.Text = value
            Invalidate()
        End Set
    End Property
#End Region 'Init



    Private R1, R2, R3 As Rectangle
    Private GP1, GP2, GP3 As GraphicsPath
    Private LGB1, LGB2 As LinearGradientBrush
    Private P1, P2 As Pen
    Private G As Graphics
    Private S1 As String
    Private F1 As Font
    Private Sub Init(e As PaintEventArgs)
        G = e.Graphics

        R1 = New Rectangle(0, 0, Height - 1, Height - 1)
        R2 = New Rectangle(R1.X + 1, R1.Y + 1, R1.Width - 2, R1.Height - 2)
        R3 = New Rectangle(r2.X + 1, r2.Y + 1, R2.width - 2, R2.Height - 2)

        GP1 = New GraphicsPath : GP1.AddEllipse(R1)
        GP2 = New GraphicsPath : GP2.AddEllipse(R2)
        GP3 = New GraphicsPath : GP3.AddEllipse(R3)

        LGB1 = New LinearGradientBrush(R1, Color.FromArgb(29, 29, 29), Color.FromArgb(39, 39, 39), LinearGradientMode.Vertical)
        LGB2 = New LinearGradientBrush(R3, Color.FromArgb(84, 135, 171), Color.FromArgb(113, 176, 200), LinearGradientMode.Vertical)

        P1 = Pens.Black
        P2 = New Pen(New SolidBrush(Color.FromArgb(68, 68, 68)))

        S1 = Text

        F1 = New Font("Verdana", 8, FontStyle.Regular)
    End Sub

    Protected Overrides Sub OnPaint(ByVal e As PaintEventArgs)
        MyBase.OnPaint(e) : Init(e)
        G.InterpolationMode = InterpolationMode.HighQualityBicubic
        G.SmoothingMode = SmoothingMode.AntiAlias
        If Checked Then
            G.FillPath(LGB2, GP3)
            G.DrawPath(P1, GP3)
            G.DrawPath(P2, GP2)
            G.DrawString(S1, F1, New SolidBrush(Color.FromArgb(106, 166, 193)), 18, 1)
        Else
            G.FillPath(LGB1, GP1)
            G.DrawPath(P1, GP1)
            G.DrawPath(P2, GP2)
            G.DrawString(S1, F1, New SolidBrush(Color.FromArgb(147, 147, 147)), 18, 1)
        End If

    End Sub
End Class


Class ContainerObjectDisposable : Implements IDisposable
    Private iList As New List(Of IDisposable)

    Public Sub AddObject(ByVal Obj As IDisposable)
        iList.Add(Obj)
    End Sub
    Public Sub AddObjectRange(ByVal Obj() As IDisposable)
        iList.AddRange(Obj)
    End Sub
#Region "IDisposable Support"
    Private disposedValue As Boolean
    Protected Overridable Sub Dispose(disposing As Boolean)
        If Not Me.disposedValue Then
            If disposing Then
                For Each ObjectDisposable As IDisposable In iList
                    ObjectDisposable.Dispose()
#If DEBUG Then
                    Debug.WriteLine("Dispose : " & ObjectDisposable.ToString)
#End If
                Next
            End If

        End If
        iList.Clear()
        Me.disposedValue = True
    End Sub
    Public Sub Dispose() Implements IDisposable.Dispose
        Dispose(True)
        GC.SuppressFinalize(Me)
    End Sub
#End Region

End Class

Module Helper

    Friend Function RoundRect(ByVal R As Rectangle, radius As Integer) As GraphicsPath
        Dim GP As New GraphicsPath
        GP.AddArc(R.X, R.Y, radius, radius, 180, 90)
        GP.AddArc(R.Right - radius, R.Y, radius, radius, 270, 90)
        GP.AddArc(R.Right - radius, R.Bottom - radius, radius, radius, 0, 90)
        GP.AddArc(R.X, R.Bottom - radius, radius, radius, 90, 90)
        GP.CloseFigure()
        Return GP
    End Function

End Module