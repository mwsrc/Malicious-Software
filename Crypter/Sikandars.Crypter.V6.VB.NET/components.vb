

Imports System.Drawing.Drawing2D
Imports System.ComponentModel
Imports System.Runtime.InteropServices

Imports System.Net
Imports System.Text.RegularExpressions
Imports System.IO

MustInherit Class Theme
    Inherits ContainerControl

#Region " Initialization "

    Protected G As Graphics
    Sub New()
        SetStyle(DirectCast(139270, ControlStyles), True)
    End Sub

    Private ParentIsForm As Boolean
    Protected Overrides Sub OnHandleCreated(ByVal e As EventArgs)
        Dock = DockStyle.Fill
        ParentIsForm = TypeOf Parent Is Form
        If ParentIsForm Then
            If Not _TransparencyKey = Color.Empty Then ParentForm.TransparencyKey = _TransparencyKey
            ParentForm.FormBorderStyle = FormBorderStyle.None
        End If
        MyBase.OnHandleCreated(e)
    End Sub

    Overrides Property Text As String
        Get
            Return MyBase.Text
        End Get
        Set(ByVal v As String)
            MyBase.Text = v
            Invalidate()
        End Set
    End Property
#End Region

#Region " Sizing and Movement "

    Private _Resizable As Boolean = True
    Property Resizable() As Boolean
        Get
            Return _Resizable
        End Get
        Set(ByVal value As Boolean)
            _Resizable = value
        End Set
    End Property

    Private _MoveHeight As Integer = 24
    Property MoveHeight() As Integer
        Get
            Return _MoveHeight
        End Get
        Set(ByVal v As Integer)
            _MoveHeight = v
            Header = New Rectangle(7, 7, Width - 14, _MoveHeight - 7)
        End Set
    End Property

    Private Flag As IntPtr
    Protected Overrides Sub OnMouseDown(ByVal e As MouseEventArgs)
        If Not e.Button = MouseButtons.Left Then Return
        If ParentIsForm Then If ParentForm.WindowState = FormWindowState.Maximized Then Return

        If Header.Contains(e.Location) Then
            Flag = New IntPtr(2)
        ElseIf Current.Position = 0 Or Not _Resizable Then
            Return
        Else
            Flag = New IntPtr(Current.Position)
        End If

        Capture = False
        DefWndProc(Message.Create(Parent.Handle, 161, Flag, Nothing))

        MyBase.OnMouseDown(e)
    End Sub

    Private Structure Pointer
        ReadOnly Cursor As Cursor, Position As Byte
        Sub New(ByVal c As Cursor, ByVal p As Byte)
            Cursor = c
            Position = p
        End Sub
    End Structure

    Private F1, F2, F3, F4 As Boolean, PTC As Point
    Private Function GetPointer() As Pointer
        PTC = PointToClient(MousePosition)
        F1 = PTC.X < 7
        F2 = PTC.X > Width - 7
        F3 = PTC.Y < 7
        F4 = PTC.Y > Height - 7

        If F1 And F3 Then Return New Pointer(Cursors.SizeNWSE, 13)
        If F1 And F4 Then Return New Pointer(Cursors.SizeNESW, 16)
        If F2 And F3 Then Return New Pointer(Cursors.SizeNESW, 14)
        If F2 And F4 Then Return New Pointer(Cursors.SizeNWSE, 17)
        If F1 Then Return New Pointer(Cursors.SizeWE, 10)
        If F2 Then Return New Pointer(Cursors.SizeWE, 11)
        If F3 Then Return New Pointer(Cursors.SizeNS, 12)
        If F4 Then Return New Pointer(Cursors.SizeNS, 15)
        Return New Pointer(Cursors.Default, 0)
    End Function

    Private Current, Pending As Pointer
    Private Sub SetCurrent()
        Pending = GetPointer()
        If Current.Position = Pending.Position Then Return
        Current = GetPointer()
        Cursor = Current.Cursor
    End Sub

    Protected Overrides Sub OnMouseMove(ByVal e As MouseEventArgs)
        If _Resizable Then SetCurrent()
        MyBase.OnMouseMove(e)
    End Sub

    Protected Header As Rectangle
    Protected Overrides Sub OnSizeChanged(ByVal e As EventArgs)
        If Width = 0 OrElse Height = 0 Then Return
        Header = New Rectangle(7, 7, Width - 14, _MoveHeight - 7)
        Invalidate()
        MyBase.OnSizeChanged(e)
    End Sub

#End Region

#Region " Convienence "

    MustOverride Sub PaintHook()
    Protected NotOverridable Overrides Sub OnPaint(ByVal e As PaintEventArgs)
        If Width = 0 OrElse Height = 0 Then Return
        G = e.Graphics
        PaintHook()
    End Sub

    Private _TransparencyKey As Color
    Property TransparencyKey() As Color
        Get
            Return _TransparencyKey
        End Get
        Set(ByVal v As Color)
            _TransparencyKey = v
            Invalidate()
        End Set
    End Property

    Private _Image As Image
    Property Image() As Image
        Get
            Return _Image
        End Get
        Set(ByVal value As Image)
            _Image = value
            Invalidate()
        End Set
    End Property
    ReadOnly Property ImageWidth() As Integer
        Get
            If _Image Is Nothing Then Return 0
            Return _Image.Width
        End Get
    End Property

    Private _Size As Size
    Private _Rectangle As Rectangle
    Private _Gradient As LinearGradientBrush
    Private _Brush As SolidBrush

    Protected Sub DrawCorners(ByVal c As Color, ByVal rect As Rectangle)
        _Brush = New SolidBrush(c)
        G.FillRectangle(_Brush, rect.X, rect.Y, 1, 1)
        G.FillRectangle(_Brush, rect.X + (rect.Width - 1), rect.Y, 1, 1)
        G.FillRectangle(_Brush, rect.X, rect.Y + (rect.Height - 1), 1, 1)
        G.FillRectangle(_Brush, rect.X + (rect.Width - 1), rect.Y + (rect.Height - 1), 1, 1)
    End Sub

    Protected Sub DrawBorders(ByVal p1 As Pen, ByVal p2 As Pen, ByVal rect As Rectangle)
        G.DrawRectangle(p1, rect.X, rect.Y, rect.Width - 1, rect.Height - 1)
        G.DrawRectangle(p2, rect.X + 1, rect.Y + 1, rect.Width - 3, rect.Height - 3)
    End Sub

    Protected Sub DrawText(ByVal a As HorizontalAlignment, ByVal c As Color, ByVal x As Integer)
        DrawText(a, c, x, 0)
    End Sub
    Protected Sub DrawText(ByVal a As HorizontalAlignment, ByVal c As Color, ByVal x As Integer, ByVal y As Integer)
        If String.IsNullOrEmpty(Text) Then Return
        _Size = G.MeasureString(Text, Font).ToSize
        _Brush = New SolidBrush(c)

        Select Case a
            Case HorizontalAlignment.Left
                G.DrawString(Text, Font, _Brush, x, _MoveHeight \ 2 - _Size.Height \ 2 + y)
            Case HorizontalAlignment.Right
                G.DrawString(Text, Font, _Brush, Width - _Size.Width - x, _MoveHeight \ 2 - _Size.Height \ 2 + y)
            Case HorizontalAlignment.Center
                G.DrawString(Text, Font, _Brush, Width \ 2 - _Size.Width \ 2 + x, _MoveHeight \ 2 - _Size.Height \ 2 + y)
        End Select
    End Sub

    Protected Sub DrawIcon(ByVal a As HorizontalAlignment, ByVal x As Integer)
        DrawIcon(a, x, 0)
    End Sub
    Protected Sub DrawIcon(ByVal a As HorizontalAlignment, ByVal x As Integer, ByVal y As Integer)
        If _Image Is Nothing Then Return
        Select Case a
            Case HorizontalAlignment.Left
                G.DrawImage(_Image, x, _MoveHeight \ 2 - _Image.Height \ 2 + y)
            Case HorizontalAlignment.Right
                G.DrawImage(_Image, Width - _Image.Width - x, _MoveHeight \ 2 - _Image.Height \ 2 + y)
            Case HorizontalAlignment.Center
                G.DrawImage(_Image, Width \ 2 - _Image.Width \ 2, _MoveHeight \ 2 - _Image.Height \ 2)
        End Select
    End Sub

    Protected Sub DrawGradient(ByVal c1 As Color, ByVal c2 As Color, ByVal x As Integer, ByVal y As Integer, ByVal width As Integer, ByVal height As Integer, ByVal angle As Single)
        _Rectangle = New Rectangle(x, y, width, height)
        _Gradient = New LinearGradientBrush(_Rectangle, c1, c2, angle)
        G.FillRectangle(_Gradient, _Rectangle)
    End Sub

#End Region

End Class
MustInherit Class ThemeControl
    Inherits Control

#Region " Initialization "

    Protected G As Graphics, B As Bitmap
    Sub New()
        SetStyle(DirectCast(139270, ControlStyles), True)
        B = New Bitmap(1, 1)
        G = Graphics.FromImage(B)
    End Sub

    Sub AllowTransparent()
        SetStyle(ControlStyles.Opaque, False)
        SetStyle(ControlStyles.SupportsTransparentBackColor, True)
    End Sub

    Overrides Property Text As String
        Get
            Return MyBase.Text
        End Get
        Set(ByVal v As String)
            MyBase.Text = v
            Invalidate()
        End Set
    End Property
#End Region

#Region " Mouse Handling "

    Protected Enum State As Byte
        MouseNone = 0
        MouseOver = 1
        MouseDown = 2
    End Enum

    Protected MouseState As State
    Protected Overrides Sub OnMouseLeave(ByVal e As EventArgs)
        ChangeMouseState(State.MouseNone)
        MyBase.OnMouseLeave(e)
    End Sub
    Protected Overrides Sub OnMouseEnter(ByVal e As EventArgs)
        ChangeMouseState(State.MouseOver)
        MyBase.OnMouseEnter(e)
    End Sub
    Protected Overrides Sub OnMouseUp(ByVal e As MouseEventArgs)
        ChangeMouseState(State.MouseOver)
        MyBase.OnMouseUp(e)
    End Sub
    Protected Overrides Sub OnMouseDown(ByVal e As MouseEventArgs)
        If e.Button = MouseButtons.Left Then ChangeMouseState(State.MouseDown)
        MyBase.OnMouseDown(e)
    End Sub

    Private Sub ChangeMouseState(ByVal e As State)
        MouseState = e
        Invalidate()
    End Sub

#End Region

#Region " Convienence "

    MustOverride Sub PaintHook()
    Protected NotOverridable Overrides Sub OnPaint(ByVal e As PaintEventArgs)
        If Width = 0 OrElse Height = 0 Then Return
        PaintHook()
        e.Graphics.DrawImage(B, 0, 0)
    End Sub

    Protected Overrides Sub OnSizeChanged(ByVal e As EventArgs)
        If Not Width = 0 AndAlso Not Height = 0 Then
            B = New Bitmap(Width, Height)
            G = Graphics.FromImage(B)
            Invalidate()
        End If
        MyBase.OnSizeChanged(e)
    End Sub

    Private _NoRounding As Boolean
    Property NoRounding() As Boolean
        Get
            Return _NoRounding
        End Get
        Set(ByVal v As Boolean)
            _NoRounding = v
            Invalidate()
        End Set
    End Property

    Private _Image As Image
    Property Image() As Image
        Get
            Return _Image
        End Get
        Set(ByVal value As Image)
            _Image = value
            Invalidate()
        End Set
    End Property
    ReadOnly Property ImageWidth() As Integer
        Get
            If _Image Is Nothing Then Return 0
            Return _Image.Width
        End Get
    End Property
    ReadOnly Property ImageTop() As Integer
        Get
            If _Image Is Nothing Then Return 0
            Return Height \ 2 - _Image.Height \ 2
        End Get
    End Property

    Private _Size As Size
    Private _Rectangle As Rectangle
    Private _Gradient As LinearGradientBrush
    Private _Brush As SolidBrush

    Protected Sub DrawCorners(ByVal c As Color, ByVal rect As Rectangle)
        If _NoRounding Then Return

        B.SetPixel(rect.X, rect.Y, c)
        B.SetPixel(rect.X + (rect.Width - 1), rect.Y, c)
        B.SetPixel(rect.X, rect.Y + (rect.Height - 1), c)
        B.SetPixel(rect.X + (rect.Width - 1), rect.Y + (rect.Height - 1), c)
    End Sub

    Protected Sub DrawBorders(ByVal p1 As Pen, ByVal p2 As Pen, ByVal rect As Rectangle)
        G.DrawRectangle(p1, rect.X, rect.Y, rect.Width - 1, rect.Height - 1)
        G.DrawRectangle(p2, rect.X + 1, rect.Y + 1, rect.Width - 3, rect.Height - 3)
    End Sub

    Protected Sub DrawText(ByVal a As HorizontalAlignment, ByVal c As Color, ByVal x As Integer)
        DrawText(a, c, x, 0)
    End Sub
    Protected Sub DrawText(ByVal a As HorizontalAlignment, ByVal c As Color, ByVal x As Integer, ByVal y As Integer)
        If String.IsNullOrEmpty(Text) Then Return
        _Size = G.MeasureString(Text, Font).ToSize
        _Brush = New SolidBrush(c)

        Select Case a
            Case HorizontalAlignment.Left
                G.DrawString(Text, Font, _Brush, x, Height \ 2 - _Size.Height \ 2 + y)
            Case HorizontalAlignment.Right
                G.DrawString(Text, Font, _Brush, Width - _Size.Width - x, Height \ 2 - _Size.Height \ 2 + y)
            Case HorizontalAlignment.Center
                G.DrawString(Text, Font, _Brush, Width \ 2 - _Size.Width \ 2 + x, Height \ 2 - _Size.Height \ 2 + y)
        End Select
    End Sub

    Protected Sub DrawIcon(ByVal a As HorizontalAlignment, ByVal x As Integer)
        DrawIcon(a, x, 0)
    End Sub
    Protected Sub DrawIcon(ByVal a As HorizontalAlignment, ByVal x As Integer, ByVal y As Integer)
        If _Image Is Nothing Then Return
        Select Case a
            Case HorizontalAlignment.Left
                G.DrawImage(_Image, x, Height \ 2 - _Image.Height \ 2 + y)
            Case HorizontalAlignment.Right
                G.DrawImage(_Image, Width - _Image.Width - x, Height \ 2 - _Image.Height \ 2 + y)
            Case HorizontalAlignment.Center
                G.DrawImage(_Image, Width \ 2 - _Image.Width \ 2, Height \ 2 - _Image.Height \ 2)
        End Select
    End Sub

    Protected Sub DrawGradient(ByVal c1 As Color, ByVal c2 As Color, ByVal x As Integer, ByVal y As Integer, ByVal width As Integer, ByVal height As Integer, ByVal angle As Single)
        _Rectangle = New Rectangle(x, y, width, height)
        _Gradient = New LinearGradientBrush(_Rectangle, c1, c2, angle)
        G.FillRectangle(_Gradient, _Rectangle)
    End Sub
#End Region

End Class
MustInherit Class ThemeContainerControl
    Inherits ContainerControl

#Region " Initialization "

    Protected G As Graphics, B As Bitmap
    Sub New()
        SetStyle(DirectCast(139270, ControlStyles), True)
        B = New Bitmap(1, 1)
        G = Graphics.FromImage(B)
    End Sub

    Sub AllowTransparent()
        SetStyle(ControlStyles.Opaque, False)
        SetStyle(ControlStyles.SupportsTransparentBackColor, True)
    End Sub

#End Region

#Region " Convienence "

    MustOverride Sub PaintHook()
    Protected NotOverridable Overrides Sub OnPaint(ByVal e As PaintEventArgs)
        If Width = 0 OrElse Height = 0 Then Return
        PaintHook()
        e.Graphics.DrawImage(B, 0, 0)
    End Sub

    Protected Overrides Sub OnSizeChanged(ByVal e As EventArgs)
        If Not Width = 0 AndAlso Not Height = 0 Then
            B = New Bitmap(Width, Height)
            G = Graphics.FromImage(B)
            Invalidate()
        End If
        MyBase.OnSizeChanged(e)
    End Sub

    Private _NoRounding As Boolean
    Property NoRounding() As Boolean
        Get
            Return _NoRounding
        End Get
        Set(ByVal v As Boolean)
            _NoRounding = v
            Invalidate()
        End Set
    End Property

    Private _Rectangle As Rectangle
    Private _Gradient As LinearGradientBrush

    Protected Sub DrawCorners(ByVal c As Color, ByVal rect As Rectangle)
        If _NoRounding Then Return
        B.SetPixel(rect.X, rect.Y, c)
        B.SetPixel(rect.X + (rect.Width - 1), rect.Y, c)
        B.SetPixel(rect.X, rect.Y + (rect.Height - 1), c)
        B.SetPixel(rect.X + (rect.Width - 1), rect.Y + (rect.Height - 1), c)
    End Sub

    Protected Sub DrawBorders(ByVal p1 As Pen, ByVal p2 As Pen, ByVal rect As Rectangle)
        G.DrawRectangle(p1, rect.X, rect.Y, rect.Width - 1, rect.Height - 1)
        G.DrawRectangle(p2, rect.X + 1, rect.Y + 1, rect.Width - 3, rect.Height - 3)
    End Sub

    Protected Sub DrawGradient(ByVal c1 As Color, ByVal c2 As Color, ByVal x As Integer, ByVal y As Integer, ByVal width As Integer, ByVal height As Integer, ByVal angle As Single)
        _Rectangle = New Rectangle(x, y, width, height)
        _Gradient = New LinearGradientBrush(_Rectangle, c1, c2, angle)
        G.FillRectangle(_Gradient, _Rectangle)
    End Sub
#End Region

End Class

Class NTheme
    Inherits Theme

    Sub New()
        MoveHeight = 34

        C1 = Color.FromArgb(235, 235, 235)
        P1 = New Pen(Color.FromArgb(150, 150, 150))

        BackColor = Color.White
        ForeColor = Color.FromArgb(110, 110, 110)
        TransparencyKey = Color.Fuchsia
    End Sub

    Private C1 As Color
    Private P1 As Pen

    Overrides Sub PaintHook()
        G.Clear(C1)

        DrawGradient(Color.White, C1, 0, 0, Width, 26, 90S)

        DrawBorders(P1, Pens.White, ClientRectangle)
        DrawCorners(Color.Fuchsia, ClientRectangle)

        G.FillRectangle(Brushes.White, New Rectangle(6, 32, Width - 12, Height - 38))

        DrawText(HorizontalAlignment.Left, ForeColor, ImageWidth + 7)
        DrawIcon(HorizontalAlignment.Left, 7)

        DrawBorders(Pens.White, P1, New Rectangle(6, 32, Width - 12, Height - 38))

        DrawCorners(C1, New Rectangle(6, 32, Width - 12, Height - 38))
        DrawCorners(Color.White, New Rectangle(7, 33, Width - 14, Height - 40))
    End Sub

End Class
Class NButton
    Inherits ThemeControl

    Sub New()
        AllowTransparent()
        C1 = Color.FromArgb(220, 220, 220)
        C2 = Color.FromArgb(250, 250, 250)
        P1 = New Pen(Color.FromArgb(180, 180, 180))
    End Sub

    Private C1, C2 As Color
    Private P1 As Pen

    Overrides Sub PaintHook()
        If MouseState = State.MouseDown Then
            DrawGradient(C1, C2, 0, 0, Width, Height, 90S)
        Else
            DrawGradient(C2, C1, 0, 0, Width, Height, 90S)
        End If

        G.DrawLine(Pens.White, 0, 1, Width, 1)
        DrawGradient(Color.White, Color.Transparent, 1, 0, 1, Height, 90S)

        DrawText(HorizontalAlignment.Center, ForeColor, ImageWidth)
        DrawIcon(HorizontalAlignment.Left, 0)

        G.DrawRectangle(P1, 0, 0, Width - 1, Height - 1)

        DrawCorners(BackColor, ClientRectangle)
    End Sub

End Class

Class GTheme
    Inherits Theme

    Sub New()
        MoveHeight = 29

        C1 = Color.FromArgb(41, 41, 41)
        C2 = Color.FromArgb(25, 25, 25)

        P1 = New Pen(Color.FromArgb(58, 58, 58))
        P2 = New Pen(C2)

        BackColor = C1
        ForeColor = Color.FromArgb(100, 100, 100)
        TransparencyKey = Color.Fuchsia
    End Sub

    Private C1, C2 As Color
    Private P1, P2 As Pen

    Overrides Sub PaintHook()
        G.Clear(C1)

        DrawGradient(C2, C1, 0, 0, Width, 28, 90S)

        G.DrawLine(P2, 0, 28, Width, 28)
        G.DrawLine(P1, 0, 29, Width, 29)

        DrawText(HorizontalAlignment.Left, ForeColor, 5 + ImageWidth)
        DrawIcon(HorizontalAlignment.Left, 5)

        DrawBorders(Pens.Black, P1, ClientRectangle)
        DrawCorners(Color.Fuchsia, ClientRectangle)
    End Sub

End Class
Class GButton
    Inherits ThemeControl

    Private P1, P2 As Pen
    Private C1, C2 As Color

    Sub New()
        P1 = New Pen(Color.FromArgb(25, 25, 25))
        P2 = New Pen(Color.FromArgb(11, Color.White))

        C1 = Color.FromArgb(41, 41, 41)
        C2 = Color.FromArgb(51, 51, 51)
    End Sub

    Overrides Sub PaintHook()

        If MouseState = State.MouseDown Then
            DrawGradient(C1, C2, 0, 0, Width, Height, 90S)
        Else
            DrawGradient(C2, C1, 0, 0, Width, Height, 90S)
        End If

        DrawText(HorizontalAlignment.Center, ForeColor, 0)
        DrawIcon(HorizontalAlignment.Left, 0)

        DrawBorders(P1, P2, ClientRectangle)
        DrawCorners(BackColor, ClientRectangle)
    End Sub

End Class

Class RTheme
    Inherits Theme

    Sub New()
        MoveHeight = 26

        C1 = Color.FromArgb(40, 40, 40)
        C2 = Color.FromArgb(30, 30, 30)

        B1 = New SolidBrush(Color.FromArgb(12, Color.White))
        B2 = New SolidBrush(Color.FromArgb(28, 28, 28))

        P1 = New Pen(Color.FromArgb(90, 90, 90))
        P2 = New Pen(Color.FromArgb(70, 70, 70))

        CreateTile()

        BackColor = B2.Color
        ForeColor = Color.White
        TransparencyKey = Color.Fuchsia
    End Sub

    Private Tile As TextureBrush
    Private Sub CreateTile()
        Dim T As New Bitmap(4, 4)
        For I As Byte = 0 To 3
            T.SetPixel(3 - I, I, C1)
        Next
        Tile = New TextureBrush(T)
    End Sub

    Private C1, C2 As Color
    Private B1, B2 As SolidBrush
    Private P1, P2 As Pen

    Overrides Sub PaintHook()
        G.Clear(C1)

        DrawGradient(C2, C1, 0, 0, Width, 24, 90S)
        G.FillRectangle(Tile, 0, 0, Width, 28)

        G.FillRectangle(B1, 0, 0, Width, 12)
        G.FillRectangle(B2, 6, 26, Width - 12, Height - 32)

        DrawText(HorizontalAlignment.Left, Color.White, ImageWidth + 5)
        DrawIcon(HorizontalAlignment.Left, 5)

        DrawBorders(Pens.Black, P1, ClientRectangle)
        DrawBorders(P2, Pens.Black, New Rectangle(6, 26, Width - 12, Height - 32))

        DrawCorners(Color.Fuchsia, ClientRectangle)
    End Sub

End Class
Class RButton
    Inherits ThemeControl

    Sub New()
        C1 = Color.FromArgb(40, 40, 40)
        C2 = Color.FromArgb(30, 30, 30)
        C3 = Color.FromArgb(20, Color.White)
        C4 = Color.FromArgb(35, 255, 255, 255)

        B1 = New SolidBrush(Color.FromArgb(10, Color.White))
        P1 = New Pen(Color.FromArgb(65, 65, 65))

        CreateTile()
    End Sub

    Private Tile As TextureBrush
    Private Sub CreateTile()
        Dim T As New Bitmap(4, 4)
        For I As Byte = 0 To 3
            T.SetPixel(3 - I, I, C1)
        Next
        Tile = New TextureBrush(T)
    End Sub

    Private I1 As Integer
    Private C1, C2, C3, C4 As Color
    Private B1 As SolidBrush
    Private P1 As Pen

    Overrides Sub PaintHook()
        G.Clear(C1)

        DrawGradient(C2, C1, 0, 0, Width, CInt(Height * 0.85), 90S)
        G.FillRectangle(Tile, ClientRectangle)

        I1 = CInt(Height * 0.45)

        Select Case MouseState
            Case State.MouseNone
                DrawGradient(C3, Color.Transparent, 0, 0, Width, I1, 90S)
            Case State.MouseOver
                DrawGradient(C3, Color.Transparent, 0, 0, Width, I1, 90S)
                G.FillRectangle(B1, ClientRectangle)
        End Select

        DrawText(HorizontalAlignment.Center, Color.White, ImageWidth)
        DrawIcon(HorizontalAlignment.Left, 0)

        DrawBorders(Pens.Black, P1, ClientRectangle)

        DrawGradient(Color.Transparent, C4, 1, 0, 1, Height \ 2, 90S)
        DrawGradient(Color.Transparent, C4, Width - 2, 0, 1, Height \ 2, 90S)
    End Sub
End Class

Class STheme
    Inherits Theme

    Sub New()
        BackColor = Color.White
        ForeColor = Color.FromArgb(0, 130, 15)
        TransparencyKey = Color.Fuchsia
        MoveHeight = 32
    End Sub

    Overrides Sub PaintHook()
        G.Clear(Color.FromArgb(235, 235, 235))

        Dim _Rectangle As New Rectangle(0, 0, Width, 30)
        Dim _Gradient As New LinearGradientBrush(_Rectangle, Color.FromArgb(220, Color.White), Color.Transparent, 90)
        G.FillRectangle(_Gradient, New Rectangle(0, 0, Width, 15))

        G.FillRectangle(Brushes.White, New Rectangle(10, 30, Width - 20, Height - 40))
        DrawBorders(Pens.White, Pens.Silver, New Rectangle(10, 30, Width - 20, Height - 40))

        DrawIcon(HorizontalAlignment.Left, 4)
        DrawText(HorizontalAlignment.Left, Color.White, 9 + ImageWidth, 1)
        DrawText(HorizontalAlignment.Left, Color.FromArgb(0, 130, 15), 8 + ImageWidth)

        DrawBorders(New Pen(Color.FromArgb(0, 130, 15)), Pens.White, ClientRectangle)
        DrawCorners(Color.Fuchsia, ClientRectangle)
    End Sub

End Class
Class SButton
    Inherits ThemeControl

    Overrides Sub PaintHook()

        Select Case MouseState
            Case State.MouseOver
                DrawGradient(Color.FromArgb(0, 235, 22), Color.FromArgb(0, 210, 22), 0, 0, Width, Height, 90)
            Case State.MouseDown
                DrawGradient(Color.FromArgb(0, 195, 22), Color.FromArgb(0, 220, 27), 0, 0, Width, Height, 90)
            Case State.MouseNone
                DrawGradient(Color.FromArgb(0, 220, 27), Color.FromArgb(0, 195, 22), 0, 0, Width, Height, 90)
        End Select

        If Not MouseState = State.MouseDown Then
            Dim _Rectangle As New Rectangle(0, 0, Width, Height \ 2)
            Dim _Gradient As New LinearGradientBrush(_Rectangle, Color.FromArgb(150, Color.Lime), Color.FromArgb(50, Color.Lime), 90)
            G.FillRectangle(_Gradient, _Rectangle)
        End If

        DrawText(HorizontalAlignment.Center, Color.FromArgb(0, 230, 30), 1, 1)
        DrawText(HorizontalAlignment.Center, Color.FromArgb(0, 130, 15), 0)

        DrawBorders(New Pen(Color.FromArgb(0, 190, 20)), New Pen(Color.FromArgb(0, 240, 30)), ClientRectangle)
        DrawCorners(BackColor, ClientRectangle)
    End Sub
End Class

Class BTheme
    Inherits Theme

    Sub New()
        BackColor = Color.FromArgb(10, 10, 10)
        ForeColor = Color.FromArgb(200, 0, 0)
        TransparencyKey = Color.Fuchsia
        MoveHeight = 32
    End Sub

    Overrides Sub PaintHook()
        G.Clear(Color.FromArgb(10, 10, 10))

        Dim _Rectangle As New Rectangle(0, 0, Width, 30)
        Dim _Gradient As New LinearGradientBrush(_Rectangle, Color.FromArgb(15, Color.White), Color.Transparent, 90)
        G.FillRectangle(_Gradient, New Rectangle(0, 0, Width, 15))

        DrawBorders(New Pen(Color.FromArgb(20, 20, 20)), Pens.Black, New Rectangle(10, 30, Width - 20, Height - 40))

        DrawIcon(HorizontalAlignment.Left, 4)
        DrawText(HorizontalAlignment.Left, Color.Black, 9 + ImageWidth, 1)
        DrawText(HorizontalAlignment.Left, Color.FromArgb(200, 0, 0), 8 + ImageWidth)

        DrawBorders(Pens.Black, New Pen(Color.FromArgb(25, 25, 25)), ClientRectangle)
        DrawCorners(Color.Fuchsia, ClientRectangle)
    End Sub

End Class
Class BButton
    Inherits ThemeControl

    Overrides Sub PaintHook()


        If MouseState = State.MouseDown Then
            G.Clear(Color.FromArgb(9, 9, 9))
        Else
            G.Clear(Color.FromArgb(10, 10, 10))
            G.DrawRectangle(New Pen(Color.FromArgb(15, 15, 15)), 2, 2, Width - 4, Height - 4)
        End If

        DrawText(HorizontalAlignment.Center, Color.Black, 1, 1)
        DrawText(HorizontalAlignment.Center, Color.FromArgb(200, 0, 0), 0)

        DrawBorders(New Pen(Color.FromArgb(15, 15, 15)), Pens.Black, ClientRectangle)
        DrawCorners(BackColor, ClientRectangle)
    End Sub
End Class

<ProvideProperty("Frame", GetType(Control))> _
Class Rotator
    Inherits Component
    Implements IExtenderProvider

    Private _CurrentFrame As Byte
    Property CurrentFrame() As Byte
        Get
            Return _CurrentFrame
        End Get
        Set(ByVal v As Byte)
            _CurrentFrame = v

            Dim Current As Byte
            For Each c As Control In children.Keys
                Current = CByte(children(c))
                c.Visible = Current = _CurrentFrame OrElse Current = 255
            Next
        End Set
    End Property

    Private children As New Hashtable
    Private Function CanExtend(ByVal c As Object) As Boolean Implements IExtenderProvider.CanExtend
        If Not TypeOf c Is Control OrElse TypeOf c Is Form Then Return False

        If Not children.Contains(c) Then
            children.Add(c, 0)
            AddHandler DirectCast(c, Control).HandleCreated, AddressOf HandleCreated
        End If

        Return True
    End Function

    Private Sub HandleCreated(ByVal s As Object, ByVal e As EventArgs)
        children(DirectCast(s, Control)) = _CurrentFrame
    End Sub

    Function GetFrame(ByVal c As Control) As Byte
        Return CByte(children(c))
    End Function
    Sub SetFrame(ByVal c As Control, ByVal v As Byte)
        children(c) = v
        c.Visible = v = _CurrentFrame OrElse v = 255
    End Sub
End Class

Class Seperator
    Inherits ThemeControl

    Sub New()
        AllowTransparent()
    End Sub

    Private _Direction As Orientation
    Property Direction() As Orientation
        Get
            Return _Direction
        End Get
        Set(ByVal value As Orientation)
            _Direction = value
            Invalidate()
        End Set
    End Property

    Private _Color1 As Color = Color.FromArgb(90, Color.Black)
    Property Color1() As Color
        Get
            Return _Color1
        End Get
        Set(ByVal value As Color)
            _Color1 = value
            Invalidate()
        End Set
    End Property

    Private _Color2 As Color = Color.FromArgb(14, Color.White)
    Property Color2() As Color
        Get
            Return _Color2
        End Get
        Set(ByVal value As Color)
            _Color2 = value
            Invalidate()
        End Set
    End Property

    Overrides Sub PaintHook()
        If Not BackColor = Color.Transparent Then G.Clear(BackColor)

        If _Direction = Orientation.Horizontal Then
            G.DrawLine(New Pen(_Color1), 0, Height \ 2, Width, Height \ 2)
            G.DrawLine(New Pen(_Color2), 0, Height \ 2 + 1, Width, Height \ 2 + 1)
        Else
            G.DrawLine(New Pen(_Color1), Width \ 2, 0, Width \ 2, Height)
            G.DrawLine(New Pen(_Color2), Width \ 2 + 1, 0, Width \ 2 + 1, Height)
        End If
    End Sub

End Class

Class ButtonPane
    Inherits ThemeControl

    Sub New()
        AllowTransparent()

        _InnerBorder = New Pen(Color.FromArgb(50, Color.White))
        _Border1 = New Pen(Color.FromArgb(190, 215, 250))
        _Border2 = New Pen(Color.FromArgb(175, 200, 230))

        _Font1 = Font
        _Font2 = New Font(Font.Name, Font.Size - 1)

        _TextColor1 = New SolidBrush(Color.Blue)
        _TextColor2 = New SolidBrush(Color.Black)
        GO = Graphics.FromHwndInternal(Handle)
        UpdateSize()
    End Sub

    Private GO As Graphics
    Private TextSize1, TextSize2 As Size
    Private Sub UpdateSize()
        TextSize1 = GO.MeasureString(_Text1, _Font1).ToSize
        TextSize2 = GO.MeasureString(_Text2, _Font2).ToSize
        Invalidate()
    End Sub

    Private _Text1 As String = "Name"
    Property Text1() As String
        Get
            Return _Text1
        End Get
        Set(ByVal v As String)
            _Text1 = v
            UpdateSize()
        End Set
    End Property
    Private _Text2 As String = "Description"
    Property Text2() As String
        Get
            Return _Text2
        End Get
        Set(ByVal v As String)
            _Text2 = v
            UpdateSize()
        End Set
    End Property

    Private _Font1 As Font
    Property Font1() As Font
        Get
            Return _Font1
        End Get
        Set(ByVal v As Font)
            _Font1 = v
            UpdateSize()
        End Set
    End Property
    Private _Font2 As Font
    Property Font2() As Font
        Get
            Return _Font2
        End Get
        Set(ByVal v As Font)
            _Font2 = v
            UpdateSize()
        End Set
    End Property

    Private _TextColor1 As SolidBrush
    Property TextColor1() As Color
        Get
            Return _TextColor1.Color
        End Get
        Set(ByVal v As Color)
            _TextColor1 = New SolidBrush(v)
            Invalidate()
        End Set
    End Property
    Private _TextColor2 As SolidBrush
    Property TextColor2() As Color
        Get
            Return _TextColor2.Color
        End Get
        Set(ByVal v As Color)
            _TextColor2 = New SolidBrush(v)
            Invalidate()
        End Set
    End Property

    Private _InnerBorder As Pen
    Property InnerBorder() As Color
        Get
            Return _InnerBorder.Color
        End Get
        Set(ByVal v As Color)
            _InnerBorder = New Pen(v)
            Invalidate()
        End Set
    End Property
    Private _Border1 As Pen
    Property Border1() As Color
        Get
            Return _Border1.Color
        End Get
        Set(ByVal v As Color)
            _Border1 = New Pen(v)
            Invalidate()
        End Set
    End Property
    Private _Border2 As Pen
    Property Border2() As Color
        Get
            Return _Border2.Color
        End Get
        Set(ByVal v As Color)
            _Border2 = New Pen(v)
            Invalidate()
        End Set
    End Property

    Private _NoGradient As Boolean
    Property NoGradient() As Boolean
        Get
            Return _NoGradient
        End Get
        Set(ByVal v As Boolean)
            _NoGradient = v
            Invalidate()
        End Set
    End Property

    Private _Color1A As Color = Color.White
    Property Color1A() As Color
        Get
            Return _Color1A
        End Get
        Set(ByVal v As Color)
            _Color1A = v
            Invalidate()
        End Set
    End Property
    Private _Color1B As Color = Color.FromArgb(245, 245, 245)
    Property Color1B() As Color
        Get
            Return _Color1B
        End Get
        Set(ByVal v As Color)
            _Color1B = v
            Invalidate()
        End Set
    End Property

    Private _Color2A As Color = Color.FromArgb(205, 230, 255)
    Property Color2A() As Color
        Get
            Return _Color2A
        End Get
        Set(ByVal v As Color)
            _Color2A = v
            Invalidate()
        End Set
    End Property
    Private _Color2B As Color = Color.FromArgb(195, 220, 255)
    Property Color2B() As Color
        Get
            Return _Color2B
        End Get
        Set(ByVal v As Color)
            _Color2B = v
            Invalidate()
        End Set
    End Property

    Private _Selection As Boolean
    Property Selection() As Boolean
        Get
            Return _Selection
        End Get
        Set(ByVal v As Boolean)
            _Selection = v
            Invalidate()
        End Set
    End Property

    Private _SelectionToggle As Boolean
    Property SelectionToggle() As Boolean
        Get
            Return _SelectionToggle
        End Get
        Set(ByVal v As Boolean)
            _SelectionToggle = v
        End Set
    End Property
    Protected Overrides Sub OnClick(ByVal e As EventArgs)
        If _SelectionToggle Then Selection = Not _Selection
        Invalidate()
        MyBase.OnClick(e)
    End Sub

    Private Push As Byte
    Private ImageOS, StringTO As Integer
    Overrides Sub PaintHook()
        If Not BackColor = Color.Transparent Then G.Clear(BackColor)

        Push = 0
        Select Case MouseState
            Case State.MouseOver
                If _Selection Then DrawMouseDown() Else DrawMouseOver()
            Case State.MouseDown
                Push = 1
                DrawMouseDown()
            Case State.MouseNone
                If _Selection Then DrawMouseOver()
        End Select

        If ImageWidth = 0 Then ImageOS = 0 Else ImageOS = 10
        StringTO = Height \ 2 - TextSize1.Height \ 2 - TextSize2.Height \ 2

        G.DrawString(_Text1, _Font1, _TextColor1, ImageWidth + ImageOS + 10 + Push, StringTO + Push)
        DrawDescription()

        DrawIcon(HorizontalAlignment.Left, 5 + Push, Push)
    End Sub

    Private Sub DrawDescription()
        If String.IsNullOrEmpty(Text1) Then
            G.DrawString(_Text2, _Font2, _TextColor2, ImageWidth + ImageOS + 10 + Push, StringTO + TextSize1.Height + Push)
        Else
            G.DrawString(_Text2, _Font2, _TextColor2, ImageWidth + ImageOS + 10 + Push, StringTO + TextSize1.Height + Push)
        End If
    End Sub

    Private Sub DrawMouseOver()
        If Not _NoGradient Then DrawGradient(_Color1A, _Color1B, 0, 0, Width, Height, 90S)
        DrawBorders(_Border1, _InnerBorder, ClientRectangle)
        DrawCorners(BackColor, ClientRectangle)
    End Sub
    Private Sub DrawMouseDown()
        If Not _NoGradient Then DrawGradient(_Color2A, _Color2B, 0, 0, Width, Height, 90S)
        DrawBorders(_Border2, _InnerBorder, ClientRectangle)
        DrawCorners(BackColor, ClientRectangle)
    End Sub

End Class


Class ReCaptcha
    Inherits ThemeControl

    Event ChallengeChange(ByVal sender As Object)

    Private RC_Image As Image
    Private Const RC_Challenge As String = "http://www.google.com/recaptcha/api/challenge?k="
    Private Const RC_Location As String = "http://www.google.com/recaptcha/api/image?c="

    Private Sub StringDone(ByVal s As Object, ByVal e As DownloadStringCompletedEventArgs)
        _Challenge = Regex.Match(e.Result, "nge : '(.+)'").Groups(1).Value
        Client.DownloadDataAsync(New Uri(RC_Location & _Challenge))
    End Sub
    Private Sub DataDone(ByVal s As Object, ByVal e As DownloadDataCompletedEventArgs)
        Dim M As New MemoryStream(e.Result)
        RC_Image = Image.FromStream(M)
        M.Close()

        Processing = False
        Invalidate()
        RaiseEvent ChallengeChange(Me)
    End Sub

    Private Client As New WebClient
    Sub New()
        AddHandler Client.DownloadStringCompleted, AddressOf StringDone
        AddHandler Client.DownloadDataCompleted, AddressOf DataDone
        Size = New Size(302, 59)
    End Sub

    Private Processing As Boolean
    Sub Generate()
        If String.IsNullOrEmpty(_PublicKey) OrElse Processing Then Return
        If Not _DesignModeShow AndAlso DesignMode Then Return
        Processing = True
        Client.DownloadStringAsync(New Uri(RC_Challenge & _PublicKey))
    End Sub

    Private _PublicKey As String
    Property PublicKey() As String
        Get
            Return _PublicKey
        End Get
        Set(ByVal value As String)
            _PublicKey = value
            Generate()
        End Set
    End Property

    Private _Challenge As String
    ReadOnly Property Challenge As String
        Get
            Return _Challenge
        End Get
    End Property

    Private _DesignModeShow As Boolean
    Property DesignModeShow() As Boolean
        Get
            Return _DesignModeShow
        End Get
        Set(ByVal value As Boolean)
            _DesignModeShow = value
            If value Then Generate()
        End Set
    End Property

    Private P1 As Pen = Pens.Black
    Property BorderColor() As Color
        Get
            Return P1.Color
        End Get
        Set(ByVal v As Color)
            P1 = New Pen(v)
            Invalidate()
        End Set
    End Property

    Overrides Sub PaintHook()
        G.Clear(BackColor)

        If RC_Image IsNot Nothing Then
            G.DrawImage(RC_Image, Width \ 2 - RC_Image.Width \ 2, Height \ 2 - RC_Image.Height \ 2)
        End If

        G.DrawRectangle(P1, 0, 0, Width - 1, Height - 1)
    End Sub
End Class

Class GroupBox
    Inherits ThemeContainerControl

    Sub New()
        AllowTransparent()
        _Border1 = New Pen(Color.FromArgb(90, Color.Black))
        _Border2 = New Pen(Color.FromArgb(14, Color.White))
    End Sub

    Private _Border1 As Pen
    Property Border1() As Color
        Get
            Return _Border1.Color
        End Get
        Set(ByVal v As Color)
            _Border1 = New Pen(v)
            Invalidate()
        End Set
    End Property

    Private _Border2 As Pen
    Property Border2() As Color
        Get
            Return _Border2.Color
        End Get
        Set(ByVal v As Color)
            _Border2 = New Pen(v)
            Invalidate()
        End Set
    End Property

    Private _FillColor As Color = Color.Transparent
    Property FillColor() As Color
        Get
            Return _FillColor
        End Get
        Set(ByVal v As Color)
            _FillColor = v
            Invalidate()
        End Set
    End Property

    Overrides Sub PaintHook()
        G.Clear(_FillColor)
        DrawBorders(_Border1, _Border2, ClientRectangle)
        DrawCorners(BackColor, ClientRectangle)
    End Sub

End Class