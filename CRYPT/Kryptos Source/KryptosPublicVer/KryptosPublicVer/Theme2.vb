Imports System.Drawing, System.Drawing.Drawing2D
'Theme
Class CyberTheme
    Inherits Theme

    Sub New()
        MoveHeight = 24
        BackColor = Color.FromArgb(34, 34, 34)

        SetColor("Back", 25, 25, 25)
        SetColor("Gradient1", 35, 35, 35)
        SetColor("Gradient2", 20, 20, 20)
        SetColor("Border1", 34, 34, 34)
        SetColor("Border2", 49, 49, 49)
        SetColor("Border3", Color.Black)
        SetColor("Line1", Color.Black)
        SetColor("Line2", Color.Black)
        SetColor("Hatch1", Color.Black)
        SetColor("Hatch2", 34, 34, 34)
        SetColor("Shade1", 70, Color.Black)
        SetColor("Shade2", Color.Transparent)
        SetColor("Text", Color.LightBlue)
    End Sub

    Private C1, C2, C3, C4, C5 As Color
    Private P1, P2, P3, P4, P5 As Pen
    Private B1 As HatchBrush
    Private B2 As SolidBrush

    Protected Overrides Sub ColorHook()
        C1 = GetColor("Back")
        C2 = GetColor("Gradient1")
        C3 = GetColor("Gradient2")
        C4 = GetColor("Shade1")
        C5 = GetColor("Shade2")

        P1 = New Pen(GetColor("Border1"))
        P2 = New Pen(GetColor("Line1"))
        P3 = New Pen(GetColor("Line2"))
        P4 = New Pen(GetColor("Border2"))
        P5 = New Pen(GetColor("Border3"))

        B1 = New HatchBrush(HatchStyle.DarkUpwardDiagonal, GetColor("Hatch1"), GetColor("Hatch2"))
        B2 = New SolidBrush(GetColor("Text"))

        BackColor = C1
    End Sub

    Private RT1 As Rectangle

    Protected Overrides Sub PaintHook()
        G.Clear(C1)

        RT1 = New Rectangle(1, 1, Width - 2, 22)
        DrawGradient(C2, C3, RT1, 90.0F)
        DrawBorders(P1, RT1)

        G.DrawLine(P2, 0, 23, Width, 23)

        DrawBorders(P4, 1, 24, Width - 2, Height - 24)

        DrawText(B2, HorizontalAlignment.Center, 5, 0)

        DrawBorders(P5)
    End Sub

End Class

'Button
Class CyberButton
    Inherits ThemeControl

    Sub New()
        SetColor("BackColor", Color.FromArgb(40, 40, 40))
        SetColor("TextColor", Color.LightBlue)
        Size = New Size(100, 30)
    End Sub


    Dim C1, T1 As Color
    Protected Overrides Sub ColorHook()
        C1 = GetColor("BackColor")
        T1 = GetColor("TextColor")
    End Sub


    Protected Overrides Sub PaintHook()
        G.Clear(C1)
        Select Case State
            Case 0
                DrawGradient(Color.FromArgb(50, 50, 50), Color.FromArgb(42, 42, 42), ClientRectangle, 90S)
                Cursor = Cursors.Arrow
            Case 1
                DrawGradient(Color.FromArgb(42, 42, 42), Color.FromArgb(38, 38, 38), ClientRectangle, 90S)
                Cursor = Cursors.Arrow
            Case 2
                DrawGradient(Color.FromArgb(30, 30, 30), Color.FromArgb(20, 20, 20), ClientRectangle, 90S)
                Cursor = Cursors.Arrow
        End Select
        DrawBorders(New Pen(New SolidBrush(Color.FromArgb(20, 20, 20))), 1)
        DrawBorders(New Pen(New SolidBrush(Color.FromArgb(35, 35, 35))))
        DrawCorners(Color.FromArgb(35, 35, 35))
        DrawText(New SolidBrush(T1), HorizontalAlignment.Center, 0, 0)
    End Sub
End Class

'Top Button
Class CyberTopButton
    Inherits ThemeControl

    Sub New()
        SetColor("BackColor", Color.FromArgb(40, 40, 40))
        SetColor("TextColor", Color.LightBlue)
        Size = New Size(35, 22)
        LockHeight = 22
        LockWidth = 35
    End Sub
    Dim C1, T1 As Color
    Protected Overrides Sub ColorHook()
        C1 = GetColor("BackColor")
        T1 = GetColor("TextColor")
    End Sub
    Protected Overrides Sub PaintHook()
        G.Clear(C1)
        Select Case State
            Case 0
                DrawGradient(Color.FromArgb(38, 38, 38), Color.FromArgb(30, 30, 30), ClientRectangle, 90S)
                Cursor = Cursors.Arrow
            Case 1
                DrawGradient(Color.FromArgb(50, 50, 50), Color.FromArgb(42, 42, 42), ClientRectangle, 90S)
                Cursor = Cursors.Hand
            Case 2
                DrawGradient(Color.FromArgb(42, 42, 42), Color.FromArgb(50, 50, 50), ClientRectangle, 90S)
                Cursor = Cursors.Hand
        End Select
        DrawBorders(New Pen(New SolidBrush(Color.FromArgb(65, 65, 65))), New Rectangle(1, 0, Width - 2, Height))
        DrawBorders(New Pen(New SolidBrush(Color.FromArgb(22, 22, 22))))
        G.DrawLine(New Pen(New SolidBrush(Color.FromArgb(22, 22, 22))), 2, Height - 1, Width - 3, Height - 1)
        G.DrawLine(New Pen(New SolidBrush(Color.FromArgb(65, 65, 65))), 0, 1, Width - 1, 1)
        G.DrawLine(New Pen(New SolidBrush(Color.Black)), 0, 0, Width, 0)
        DrawText(New SolidBrush(T1), HorizontalAlignment.Center, 0, 0)
    End Sub
End Class

'CheckBox
Class CyberCheckBox
    Inherits ThemeControl
    Private _CheckedState As Boolean
    Public Property CheckedState() As Boolean
        Get
            Return _CheckedState
        End Get
        Set(ByVal v As Boolean)
            _CheckedState = v
            Invalidate()
        End Set
    End Property
    Sub New()
        Size = New Size(118, 16)
        MinimumSize = New Size(16, 16)
        MaximumSize = New Size(600, 16)
        CheckedState = False
        SetColor("CheckBorderOut", Color.FromArgb(25, 25, 25))
        SetColor("CheckBorderIn", Color.FromArgb(59, 59, 59))
        SetColor("TextColor", Color.LightBlue)
        SetColor("CheckBack1", Color.FromArgb(132, 192, 240))
        SetColor("CheckBack2", Color.LightBlue)
        SetColor("CheckFore1", Color.LightBlue)
        SetColor("CheckFore2", Color.FromArgb(42, 242, 77))
        SetColor("ColorUncheck", Color.FromArgb(35, 35, 35))
        SetColor("BackColor", Color.FromArgb(25, 25, 25))
    End Sub
    Dim C1, C2, C3, C4, C5, C6, P1, P2, B1 As Color
    Protected Overrides Sub ColorHook()
        C1 = GetColor("CheckBack1")
        C2 = GetColor("CheckBack2")
        C3 = GetColor("CheckFore1")
        C4 = GetColor("CheckFore2")
        C5 = GetColor("ColorUncheck")
        C6 = GetColor("BackColor")
        P1 = GetColor("CheckBorderOut")
        P2 = GetColor("CheckBorderIn")
        B1 = GetColor("TextColor")
    End Sub
    Protected Overrides Sub PaintHook()
        G.Clear(C6)
        Select Case CheckedState
            Case True
                DrawGradient(C1, C2, 3, 3, 9, 9, 90S)
                DrawGradient(C3, C4, 4, 4, 7, 7, 90S)
            Case False
                DrawGradient(C5, C5, 0, 0, 15, 15, 90S)
        End Select
        G.DrawRectangle(New Pen(New SolidBrush(P1)), 0, 0, 14, 14)
        G.DrawRectangle(New Pen(New SolidBrush(P2)), 1, 1, 12, 12)
        DrawText(New SolidBrush(B1), 17, 0)
        DrawCorners(C6, New Rectangle(0, 0, 13, 13))
    End Sub
    Sub changeCheck() Handles Me.Click
        Select Case CheckedState
            Case True
                CheckedState = False
            Case False
                CheckedState = True
        End Select
    End Sub
End Class

'ProgressBar
Class CyberProgressBar
    Inherits Control

#Region " Properties "
    Private _Maximum As Double = 100
    Public Property Maximum() As Double
        Get
            Return _Maximum
        End Get
        Set(ByVal v As Double)
            _Maximum = v
            Progress = _Current / v * 100
            Invalidate()
        End Set
    End Property
    Private _Current As Double
    Public Property Current() As Double
        Get
            Return _Current
        End Get
        Set(ByVal v As Double)
            _Current = v
            Progress = v / _Maximum * 100
            Invalidate()
        End Set
    End Property
    Private _Progress As Integer
    Public Property Progress() As Double
        Get
            Return _Progress
        End Get
        Set(ByVal v As Double)
            If v < 0 Then v = 0 Else If v > 100 Then v = 100
            _Progress = Convert.ToInt32(v)
            _Current = v * 0.01 * _Maximum
            If Width > 0 Then UpdateProgress()
            Invalidate()
        End Set
    End Property

    Dim C2 As Color = Color.FromArgb(0, 192, 192) 'Dark Color
    Public Property Color1() As Color
        Get
            Return C2
        End Get
        Set(ByVal v As Color)
            C2 = v
            UpdateColors()
            Invalidate()
        End Set
    End Property
    Dim C3 As Color = Color.FromArgb(0, 238, 238) 'Light color
    Public Property Color2() As Color
        Get
            Return C3
        End Get
        Set(ByVal v As Color)
            C3 = v
            UpdateColors()
            Invalidate()
        End Set
    End Property

#End Region

    Protected Overrides Sub OnPaintBackground(ByVal pevent As PaintEventArgs)
    End Sub

    Dim G As Graphics, B As Bitmap, R1, R2 As Rectangle, X As ColorBlend
    Dim C1 As Color, P1, P2, P3 As Pen, B1, B2 As LinearGradientBrush, B3 As SolidBrush
    Sub New()

        C1 = Color.FromArgb(22, 22, 22) 'Background
        P1 = New Pen(Color.FromArgb(70, Color.White), 2)
        P2 = New Pen(C2)
        P3 = New Pen(Color.FromArgb(49, 49, 49)) 'Highlight
        B3 = New SolidBrush(Color.FromArgb(100, Color.White))
        X = New ColorBlend(4)
        X.Colors = {C2, C3, C3, C2}
        X.Positions = {0.0F, 0.1F, 0.9F, 1.0F}
        R2 = New Rectangle(2, 2, 2, 2)
        B2 = New LinearGradientBrush(R2, Nothing, Nothing, 180.0F)
        B2.InterpolationColors = X

    End Sub

    Sub UpdateColors()
        P2.Color = C2
        X.Colors = {C2, C3, C3, C2}
        B2.InterpolationColors = X
    End Sub

    Protected Overrides Sub OnSizeChanged(ByVal e As System.EventArgs)
        R1 = New Rectangle(0, 1, Width, 4)
        B1 = New LinearGradientBrush(R1, Color.FromArgb(60, Color.Black), Color.Transparent, 90.0F)
        UpdateProgress()
        Invalidate()
        MyBase.OnSizeChanged(e)
    End Sub

    Sub UpdateProgress()
        If _Progress = 0 Then Return
        R2 = New Rectangle(2, 2, Convert.ToInt32((Width - 4) * (_Progress * 0.01)), Height - 4)
        B2 = New LinearGradientBrush(R2, Nothing, Nothing, 180.0F)
        B2.InterpolationColors = X
    End Sub

    Protected Overrides Sub OnPaint(ByVal e As PaintEventArgs)
        B = New Bitmap(Width, Height)
        G = Graphics.FromImage(B)

        G.Clear(C1)

        G.FillRectangle(B1, R1)

        If _Progress > 0 Then
            G.FillRectangle(B2, R2)

            G.FillRectangle(B3, 2, 3, R2.Width, 4)
            G.DrawRectangle(P1, 4, 4, R2.Width - 4, Height - 8)

            G.DrawRectangle(P2, 2, 2, R2.Width - 1, Height - 5)
        End If

        G.DrawRectangle(P3, 0, 0, Width - 1, Height - 1)

        e.Graphics.DrawImage(B, 0, 0)
        G.Dispose()
        B.Dispose()
    End Sub
End Class

'Label
Class CyberLabel
    Inherits ThemeControl
    Sub New()
        Size = New Size(73, 16)
        MinimumSize = New Size(16, 16)
        MaximumSize = New Size(600, 16)
        SetColor("TextColor", Color.LightBlue)
        SetColor("BackColor", Color.FromArgb(25, 25, 25))
    End Sub
    Dim C6, B1 As Color
    Protected Overrides Sub ColorHook()
        C6 = GetColor("BackColor")
        B1 = GetColor("TextColor")
    End Sub
    Protected Overrides Sub PaintHook()
        G.Clear(C6)
        DrawText(New SolidBrush(B1), 0, 0)
    End Sub
End Class

'TextBox
Class CyberTextBox
    Inherits ThemeControl
    Dim WithEvents CyberTextBox As TextBox
    Public Sub New()
        CyberTextBox = New TextBox
        CyberTextBox.Parent = Me
        CyberTextBox.Size = New Size(New Point(10, 19))
        CyberTextBox.ForeColor = Color.LightBlue
        CyberTextBox.BackColor = Color.FromArgb(30, 30, 30)
        CyberTextBox.BorderStyle = BorderStyle.FixedSingle
    End Sub
    Protected Overrides Sub ColorHook()
    End Sub
    Protected Overrides Sub PaintHook()
    End Sub
    Public Property Multilined() As Boolean
        Get
            Return CyberTextBox.Multiline
        End Get
        Set(ByVal value As Boolean)
            CyberTextBox.Multiline = value
            Invalidate()
        End Set
    End Property
    Sub s() Handles Me.Invalidated
        If CyberTextBox.Multiline = False Then
            Me.MinimumSize = New Size(100, 20)
            Me.MaximumSize = New Size(1000, 20)
        Else
            Me.MinimumSize = New Size(100, 20)
            Me.MaximumSize = New Size(1000, 20)
        End If
    End Sub
    Private Sub res() Handles Me.SizeChanged
        CyberTextBox.Width = Width
        CyberTextBox.Height = Height
    End Sub
    Private Sub tt() Handles Me.TextChanged
        CyberTextBox.Text = Me.Text
    End Sub
    Private Sub ttt() Handles CyberTextBox.TextChanged
        Me.Text = CyberTextBox.Text
    End Sub
End Class

'Seperator
Class CyberSeparator
    Inherits Control

    Private _Orientation As Orientation
    Public Property Orientation() As Orientation
        Get
            Return _Orientation
        End Get
        Set(ByVal v As Orientation)
            _Orientation = v
            UpdateOffset()
            Invalidate()
        End Set
    End Property

    Dim G As Graphics, B As Bitmap, I As Integer
    Dim C1 As Color, P1, P2 As Pen
    Sub New()
        SetStyle(ControlStyles.AllPaintingInWmPaint Or ControlStyles.UserPaint, True)
        C1 = Color.FromArgb(25, 25, 25)
        P1 = New Pen(Color.LightBlue)
        P2 = New Pen(Color.FromArgb(22, 22, 22))
    End Sub

    Protected Overrides Sub OnSizeChanged(ByVal e As EventArgs)
        UpdateOffset()
        MyBase.OnSizeChanged(e)
    End Sub

    Sub UpdateOffset()
        I = Convert.ToInt32(If(_Orientation = 0, Height / 2 - 1, Width / 2 - 1))
    End Sub

    Protected Overrides Sub OnPaint(ByVal e As PaintEventArgs)
        B = New Bitmap(Width, Height)
        G = Graphics.FromImage(B)

        G.Clear(C1)

        If _Orientation = 0 Then
            G.DrawLine(P1, 0, I, Width, I)
            G.DrawLine(P2, 0, I + 1, Width, I + 1)
        Else
            G.DrawLine(P2, I, 0, I, Height)
            G.DrawLine(P1, I + 1, 0, I + 1, Height)
        End If

        e.Graphics.DrawImage(B, 0, 0)
        G.Dispose()
        B.Dispose()
    End Sub

    Protected Overrides Sub OnPaintBackground(ByVal pevent As PaintEventArgs)
    End Sub

End Class

'GroupBox
Class CyberGroupBox
    Inherits Theme
    Private C1 As Color
    Private C2, C3 As Color
    Private P1 As Pen
    Private B1 As Brush
    Private B2 As Brush
    Private B5 As Brush
    Private HB1 As Brush
    Sub New()
        ControlMode = True
        Size = New Size(205, 95)
    End Sub

    Private _subtext As String
    Public Property TextSub() As String
        Get
            Return _subtext
        End Get
        Set(ByVal value As String)
            _subtext = value
            Invalidate()
        End Set
    End Property
    Protected Overrides Sub ColorHook()
        C1 = Color.FromArgb(25, 25, 25)
        C2 = Color.FromArgb(25, 25, 25)
        C3 = Color.FromArgb(0, 0, 0)
        P1 = Pens.Black
        B1 = New SolidBrush(Color.FromArgb(60, Color.White))
        B2 = New SolidBrush(Color.White)
        B5 = New SolidBrush(Color.White)

    End Sub

    Protected Overrides Sub PaintHook()
        Dim hb1 As New Drawing2D.HatchBrush(Drawing2D.HatchStyle.Trellis, Color.FromArgb(15, 15, 15))
        Dim hb2 As New Drawing2D.HatchBrush(Drawing2D.HatchStyle.Trellis, Color.FromArgb(35, 35, 35))
        Dim hb3 As New Drawing2D.HatchBrush(Drawing2D.HatchStyle.Trellis, Color.FromArgb(0, 0, 0))
        G.Clear(C1)
        G.FillRectangle(New SolidBrush(Color.Transparent), 0, 0, Width, Height)
        G.FillRectangle(New SolidBrush(Color.Transparent), 0, 0, Width, 15)
        G.DrawRectangle(P1, 0, 0, Width - 1, CInt(Height - 1))
        G.FillRectangle(New SolidBrush(Color.FromArgb(80, 35, 35, 35)), 0, 0, Width, 20)
        G.FillRectangle(New SolidBrush(Color.FromArgb(20, 20, 20)), 0, 0, Width - 1, 20)
        G.DrawRectangle(P1, 0, 0, Width - 1, 20)
        G.DrawString(Text, Font, Brushes.LightBlue, New Point(5, 3))
        Dim SubFont As Font = New Font(DefaultFont.FontFamily, Font.Size - 1)
        G.DrawString(_subtext, SubFont, New SolidBrush(Color.FromArgb(48, 48, 48)), New Point(6, 26))
    End Sub
End Class