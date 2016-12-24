Imports System.Drawing.Drawing2D
'Original Controls created by Aeonhack
'adapted by PixelFrag
'http://www.youtube.com/aeonhack
Public Class Draw

    Shared Sub Gradient(ByVal g As Graphics, ByVal c1 As Color, ByVal c2 As Color, ByVal x As Integer, ByVal y As Integer, ByVal width As Integer, ByVal height As Integer)
        Dim R As New Rectangle(x, y, width, height)
        Using T As New LinearGradientBrush(R, c1, c2, LinearGradientMode.Vertical)
            g.FillRectangle(T, R)
        End Using
    End Sub
    Shared Sub Blend(ByVal g As Graphics, ByVal c1 As Color, ByVal c2 As Color, ByVal c3 As Color, ByVal c As Single, ByVal d As Integer, ByVal x As Integer, ByVal y As Integer, ByVal width As Integer, ByVal height As Integer)
        Dim V As New ColorBlend(3)
        V.Colors = New Color() {c1, c2, c3}
        V.Positions = New Single() {0, c, 1}
        Dim R As New Rectangle(x, y, width, height)
        Using T As New LinearGradientBrush(R, c1, c1, CType(d, LinearGradientMode))
            T.InterpolationColors = V : g.FillRectangle(T, R)
        End Using
    End Sub
End Class
'Pearl Theme
Public Class PTheme : Inherits Control
    Private _TitleHeight As Integer = 25
    Public Property TitleHeight() As Integer
        Get
            Return _TitleHeight
        End Get
        Set(ByVal v As Integer)
            If v > Height Then v = Height
            If v < 2 Then Height = 1
            _TitleHeight = v : Invalidate()
        End Set
    End Property
    Private _TitleAlign As HorizontalAlignment
    Public Property TitleAlign() As HorizontalAlignment
        Get
            Return _TitleAlign
        End Get
        Set(ByVal v As HorizontalAlignment)
            _TitleAlign = v : Invalidate()
        End Set
    End Property
    Protected Overrides Sub OnHandleCreated(ByVal e As System.EventArgs)
        Dock = 5
        If TypeOf Parent Is Form Then CType(Parent, Form).FormBorderStyle = 0
        MyBase.OnHandleCreated(e)
    End Sub
    Protected Overrides Sub OnMouseDown(ByVal e As System.Windows.Forms.MouseEventArgs)
        If New Rectangle(Parent.Location.X, Parent.Location.Y, Width - 1, _TitleHeight - 1).IntersectsWith(New Rectangle(MousePosition.X, MousePosition.Y, 1, 1)) Then
            Capture = False : Dim M = Message.Create(Parent.Handle, 161, 2, 0) : DefWndProc(M)
        End If : MyBase.OnMouseDown(e)
    End Sub
    Dim C1 As Color = Color.FromArgb(240, 240, 240), C2 As Color = Color.FromArgb(230, 230, 230), C3 As Color = Color.FromArgb(190, 190, 190)
    Protected Overrides Sub OnPaintBackground(ByVal pevent As System.Windows.Forms.PaintEventArgs)
    End Sub
    Protected Overrides Sub OnPaint(ByVal e As System.Windows.Forms.PaintEventArgs)
        Using B As New Bitmap(Width, Height)
            Using G = Graphics.FromImage(B)
                G.Clear(Color.FromArgb(245, 245, 245))

                Draw.Blend(G, Color.White, C2, C1, 0.7, 1, 0, 0, Width, _TitleHeight)

                G.FillRectangle(New SolidBrush(Color.FromArgb(80, 255, 255, 255)), 0, 0, Width, CInt(_TitleHeight / 2))
                G.DrawRectangle(New Pen(Color.FromArgb(100, 255, 255, 255)), 1, 1, Width - 3, _TitleHeight - 2)

                Dim S = G.MeasureString(Text, Font), O = 6
                If _TitleAlign = 2 Then O = Width / 2 - S.Width / 2
                If _TitleAlign = 1 Then O = Width - S.Width - 6
                G.DrawString(Text, Font, New SolidBrush(C3), O, CInt(_TitleHeight / 2 - S.Height / 2))

                G.DrawLine(New Pen(C3), 0, _TitleHeight, Width, _TitleHeight)
                G.DrawLine(Pens.White, 0, _TitleHeight + 1, Width, _TitleHeight + 1)
                G.DrawRectangle(New Pen(C3), 0, 0, Width - 1, Height - 1)

                e.Graphics.DrawImage(B.Clone, 0, 0)
            End Using
        End Using
    End Sub
End Class
Public Class PProgress : Inherits Control
    Private _Value As Integer
    Public Property Value() As Integer
        Get
            Return _Value
        End Get
        Set(ByVal value As Integer)
            _Value = value : Invalidate()
        End Set
    End Property
    Private _Maximum As Integer = 100
    Public Property Maximum() As Integer
        Get
            Return _Maximum
        End Get
        Set(ByVal value As Integer)
            If value = 0 Then value = 1
            _Maximum = value : Invalidate()
        End Set
    End Property
    Dim C1 As Color = Color.FromArgb(240, 240, 240), C2 As Color = Color.FromArgb(230, 230, 230), C3 As Color = Color.FromArgb(190, 190, 190)
    Protected Overrides Sub OnPaintBackground(ByVal pevent As System.Windows.Forms.PaintEventArgs)
    End Sub
    Protected Overrides Sub OnPaint(ByVal e As System.Windows.Forms.PaintEventArgs)
        Dim V As Integer = Width * _Value / _Maximum
        Using B As New Bitmap(Width, Height)
            Using G = Graphics.FromImage(B)
                Draw.Gradient(G, C2, C1, 1, 1, Width - 2, Height - 2)
                G.DrawRectangle(New Pen(C2), 1, 1, V - 3, Height - 3)
                Draw.Gradient(G, C1, C2, 2, 2, V - 4, Height - 4)

                G.FillRectangle(New SolidBrush(Color.FromArgb(50, 255, 255, 255)), 2, 2, V - 4, CInt(Height / 2) - 2)
                G.DrawRectangle(New Pen(C3), 0, 0, Width - 1, Height - 1)

                e.Graphics.DrawImage(B.Clone, 0, 0)
            End Using
        End Using
    End Sub
End Class
'Modern Theme
Public Class mback : Inherits Control



    Protected Overrides Sub OnHandleCreated(ByVal e As System.EventArgs)
        'Dock = 5
        If TypeOf Parent Is Form Then CType(Parent, Form).FormBorderStyle = 0
        MyBase.OnHandleCreated(e)
    End Sub

    Dim C1 As Color = Color.FromArgb(74, 74, 74), C2 As Color = Color.FromArgb(63, 63, 63), C3 As Color = Color.FromArgb(41, 41, 41), _
    C4 As Color = Color.FromArgb(27, 27, 27), C5 As Color = Color.FromArgb(0, 0, 0, 0), C6 As Color = Color.FromArgb(25, 255, 255, 255)
    Protected Overrides Sub OnPaintBackground(ByVal pevent As System.Windows.Forms.PaintEventArgs)
    End Sub
    Protected Overrides Sub OnPaint(ByVal e As System.Windows.Forms.PaintEventArgs)
        Using B As New Bitmap(Width, Height)
            Using G = Graphics.FromImage(B)
                G.Clear(C3)



                Dim S = G.MeasureString(Text, Font), O = 6


                Dim R As New Rectangle(O, 20 / 2 - S.Height / 2, S.Width, S.Height)
                Using T As New LinearGradientBrush(R, C1, C3, LinearGradientMode.Vertical)
                    G.DrawString(Text, Font, T, R)
                End Using

                G.DrawLine(New Pen(C3), 0, 1, Width, 1)




                G.DrawRectangle(New Pen(C4), 0, 0, Width - 1, Height - 1)

                e.Graphics.DrawImage(B.Clone, 0, 0)
            End Using
        End Using
    End Sub
End Class
Public Class MTheme : Inherits Control

    Private _TitleHeight As Integer = 25
    Public Property TitleHeight() As Integer
        Get
            Return _TitleHeight
        End Get
        Set(ByVal v As Integer)
            If v > Height Then v = Height
            If v < 2 Then Height = 1
            _TitleHeight = v : Invalidate()
        End Set
    End Property
    Private _TitleAlign As HorizontalAlignment = 2
    Public Property TitleAlign() As HorizontalAlignment
        Get
            Return _TitleAlign
        End Get
        Set(ByVal v As HorizontalAlignment)
            _TitleAlign = v : Invalidate()
        End Set
    End Property
    Protected Overrides Sub OnHandleCreated(ByVal e As System.EventArgs)
        Dock = 5
        If TypeOf Parent Is Form Then CType(Parent, Form).FormBorderStyle = 0
        MyBase.OnHandleCreated(e)
    End Sub
    Protected Overrides Sub OnMouseDown(ByVal e As System.Windows.Forms.MouseEventArgs)
        If New Rectangle(Parent.Location.X, Parent.Location.Y, Width - 1, _TitleHeight - 1).IntersectsWith(New Rectangle(MousePosition.X, MousePosition.Y, 1, 1)) Then
            Capture = False : Dim M = Message.Create(Parent.Handle, 161, 2, 0) : DefWndProc(M)
        End If : MyBase.OnMouseDown(e)
    End Sub
    Dim C1 As Color = Color.FromArgb(74, 74, 74), C2 As Color = Color.FromArgb(63, 63, 63), C3 As Color = Color.FromArgb(41, 41, 41), _
    C4 As Color = Color.FromArgb(27, 27, 27), C5 As Color = Color.FromArgb(0, 0, 0, 0), C6 As Color = Color.FromArgb(25, 255, 255, 255)
    Protected Overrides Sub OnPaintBackground(ByVal pevent As System.Windows.Forms.PaintEventArgs)
    End Sub
    Protected Overrides Sub OnPaint(ByVal e As System.Windows.Forms.PaintEventArgs)
        Using B As New Bitmap(Width, Height)
            Using G = Graphics.FromImage(B)
                G.Clear(C3)

                Draw.Gradient(G, C4, C3, 0, 0, Width, _TitleHeight)

                Dim S = G.MeasureString(Text, Font), O = 6
                If _TitleAlign = 2 Then O = Width / 2 - S.Width / 2
                If _TitleAlign = 1 Then O = Width - S.Width - 6
                Dim R As New Rectangle(O, (_TitleHeight + 2) / 2 - S.Height / 2, S.Width, S.Height)
                Using T As New SolidBrush(Color.DarkGray)

                    G.DrawString(Text, Font, T, R)
                End Using

                G.DrawLine(New Pen(C3), 0, 1, Width, 1)

                Draw.Blend(G, C5, C6, C5, 0.5, 0, 0, _TitleHeight + 1, Width, 1)

                G.DrawLine(New Pen(C4), 0, _TitleHeight, Width, _TitleHeight)
                G.DrawRectangle(New Pen(C4), 0, 0, Width - 1, Height - 1)

                e.Graphics.DrawImage(B.Clone, 0, 0)

            End Using
        End Using
    End Sub
End Class
Public Class MButton : Inherits Control

    Dim B As Bitmap, G As Graphics, R1 As Rectangle
    Dim C1, C2, C3, C4 As Color, P1, P2, P3, P4 As Pen, B1, B2, B5 As Brush, B3, B4 As LinearGradientBrush

    Sub New()
        SetStyle(ControlStyles.AllPaintingInWmPaint Or ControlStyles.UserPaint, True)

        C1 = Color.FromArgb(34, 34, 34) 'Background
        C2 = Color.FromArgb(49, 49, 49) 'Highlight
        C3 = Color.FromArgb(39, 39, 39) 'Lesser Highlight
        C4 = Color.FromArgb(60, Color.Black)
        P1 = New Pen(Color.FromArgb(22, 22, 22)) 'Shadow
        P2 = New Pen(Color.FromArgb(20, Color.White))
        P3 = New Pen(Color.FromArgb(10, Color.White))
        P4 = New Pen(Color.FromArgb(30, Color.Black))
        B1 = New SolidBrush(C1)
        B2 = New SolidBrush(C3)
        B5 = New SolidBrush(Color.FromArgb(150, 150, 150)) 'Text Color
        Font = New Font("Verdana", 8.0F)
    End Sub

    Private State As Integer
    Protected Overrides Sub OnMouseLeave(ByVal e As EventArgs)
        State = 0
        Invalidate()
    End Sub
    Protected Overrides Sub OnMouseUp(ByVal e As MouseEventArgs)
        State = 1
        Invalidate()
    End Sub
    Protected Overrides Sub OnMouseEnter(ByVal e As EventArgs)
        State = 1
        Invalidate()
    End Sub
    Protected Overrides Sub OnMouseDown(ByVal e As MouseEventArgs)
        State = 2
        Invalidate()
    End Sub

    Protected Overrides Sub OnResize(ByVal e As EventArgs)
        R1 = New Rectangle(2, 2, Width - 4, 4)
        B3 = New LinearGradientBrush(ClientRectangle, C3, C2, 90.0F)
        B4 = New LinearGradientBrush(R1, C4, Color.Transparent, 90.0F)
        Invalidate()
    End Sub

    Protected Overrides Sub OnPaint(ByVal e As PaintEventArgs)
        B = New Bitmap(Width, Height)
        G = Graphics.FromImage(B)

        G.FillRectangle(B3, ClientRectangle)

        Select Case State
            Case 0 'Up
                G.FillRectangle(B1, 1, 1, Width - 2, Height - 2)
                G.DrawLine(P2, 2, 2, Width - 3, 2)
                G.DrawLine(P3, 2, Height - 3, Width - 3, Height - 3)
            Case 1 'Over
                G.FillRectangle(B2, 1, 1, Width - 2, Height - 2)
                G.DrawLine(P2, 2, 2, Width - 3, 2)
                G.DrawLine(P3, 2, Height - 3, Width - 3, Height - 3)
            Case 2 'Down
                G.FillRectangle(B2, 1, 1, Width - 2, Height - 2)
                G.FillRectangle(B4, R1)
                G.DrawLine(P4, 2, 2, 2, Height - 3)
        End Select

        Dim S As SizeF = G.MeasureString(Text, Font)
        G.DrawString(Text, Font, B5, Convert.ToInt32(Width / 2 - S.Width / 2), Convert.ToInt32(Height / 2 - S.Height / 2))

        G.DrawRectangle(P1, 1, 1, Width - 3, Height - 3)

        e.Graphics.DrawImage(B, 0, 0)
        G.Dispose()
        B.Dispose()
    End Sub

    Protected Overrides Sub OnPaintBackground(ByVal e As PaintEventArgs)
    End Sub
End Class
Public Class listhead : Inherits Control
    Dim isclick As Integer
    Sub New()
        ForeColor = Color.DarkGray
    End Sub
    Private State As Integer
    Protected Overrides Sub OnMouseEnter(ByVal e As System.EventArgs)
        State = 1 : Invalidate() : MyBase.OnMouseEnter(e)
    End Sub
    Protected Overrides Sub OnMouseDown(ByVal e As System.Windows.Forms.MouseEventArgs)

        State = 2 : Invalidate() : MyBase.OnMouseDown(e)


    End Sub
    ' Protected Overrides Sub onmouseclick(ByVal e As System.Windows.Forms.MouseEventArgs)
    '  State = 2 : Invalidate() : MyBase.OnMouseClick(e)
    'End Sub
    Protected Overrides Sub OnMouseLeave(ByVal e As System.EventArgs)

        State = 0 : Invalidate() : MyBase.OnMouseLeave(e)


    End Sub
    Protected Overrides Sub OnMouseUp(ByVal e As System.Windows.Forms.MouseEventArgs)
        State = 1 : Invalidate() : MyBase.OnMouseUp(e)
    End Sub
    Dim C1 As Color = Color.FromArgb(70, 70, 70), C2 As Color = Color.FromArgb(81, 81, 81), C3 As Color = Color.FromArgb(91, 91, 91), _
    C4 As Color = Color.FromArgb(50, 50, 50, 50), C5 As Color = Color.FromArgb(25, 255, 255, 255)
    Protected Overrides Sub OnPaintBackground(ByVal pevent As System.Windows.Forms.PaintEventArgs)
    End Sub
    Protected Overrides Sub OnPaint(ByVal e As System.Windows.Forms.PaintEventArgs)
        Using B As New Bitmap(Width, Height)
            Using G = Graphics.FromImage(B)
                G.DrawRectangle(New Pen(C1), 0, 0, Width - 1, Height - 1)

                If State = 2 Then
                    Draw.Gradient(G, C2, C3, 1, 1, Width - 2, Height - 2)
                Else
                    Draw.Gradient(G, C3, C2, 1, 1, Width - 2, Height - 2)
                End If

                Dim O = G.MeasureString(Text, Font)
                G.DrawString(Text, Font, New SolidBrush(ForeColor), Width / 2 - O.Width / 2, Height / 2 - O.Height / 2)

                Draw.Blend(G, C4, C5, C4, 0.5, 0, 1, 1, Width - 2, 1)

                e.Graphics.DrawImage(B.Clone, 0, 0)
            End Using
        End Using
    End Sub
End Class
Public Class MButtonnone : Inherits Control

    Dim B As Bitmap, G As Graphics, R1 As Rectangle
    Dim C1, C2, C3, C4 As Color, P1, P2, P3, P4 As Pen, B1, B2, B5 As Brush, B3, B4 As LinearGradientBrush

    Sub New()
        SetStyle(ControlStyles.AllPaintingInWmPaint Or ControlStyles.UserPaint, True)

        C1 = Color.FromArgb(34, 34, 34) 'Background
        C2 = Color.FromArgb(49, 49, 49) 'Highlight
        C3 = Color.FromArgb(39, 39, 39) 'Lesser Highlight
        C4 = Color.FromArgb(60, Color.Black)
        P1 = New Pen(Color.FromArgb(22, 22, 22)) 'Shadow
        P2 = New Pen(Color.FromArgb(20, Color.White))
        P3 = New Pen(Color.FromArgb(10, Color.White))
        P4 = New Pen(Color.FromArgb(30, Color.Black))
        B1 = New SolidBrush(C1)
        B2 = New SolidBrush(C3)
        B5 = New SolidBrush(Color.FromArgb(150, 150, 150)) 'Text Color
        Font = New Font("Verdana", 8.0F)
    End Sub

    Private State As Integer
    Protected Overrides Sub OnMouseLeave(ByVal e As EventArgs)
        State = 0
        Invalidate()
    End Sub
    Protected Overrides Sub OnMouseUp(ByVal e As MouseEventArgs)
        State = 1
        Invalidate()
    End Sub
    Protected Overrides Sub OnMouseEnter(ByVal e As EventArgs)
        State = 1
        Invalidate()
    End Sub
    Protected Overrides Sub OnMouseDown(ByVal e As MouseEventArgs)
        State = 2
        Invalidate()
    End Sub

    Protected Overrides Sub OnResize(ByVal e As EventArgs)
        R1 = New Rectangle(2, 2, Width - 4, 4)
        B3 = New LinearGradientBrush(ClientRectangle, C3, C2, 90.0F)
        B4 = New LinearGradientBrush(R1, C4, Color.Transparent, 90.0F)
        Invalidate()
    End Sub

    Protected Overrides Sub OnPaint(ByVal e As PaintEventArgs)
        B = New Bitmap(Width, Height)
        G = Graphics.FromImage(B)

        G.FillRectangle(B3, ClientRectangle)

        Select Case State
            Case 0 'Up
                G.FillRectangle(B1, 1, 1, Width - 2, Height - 2)
                G.DrawLine(P2, 2, 2, Width - 3, 2)
                G.DrawLine(P3, 2, Height - 3, Width - 3, Height - 3)
            Case 1 'Over
                G.FillRectangle(B2, 1, 1, Width - 2, Height - 2)
                G.DrawLine(P2, 2, 2, Width - 3, 2)
                G.DrawLine(P3, 2, Height - 3, Width - 3, Height - 3)
            Case 2 'Down
                G.FillRectangle(B2, 1, 1, Width - 2, Height - 2)
                G.FillRectangle(B4, R1)
                G.DrawLine(P4, 2, 2, 2, Height - 3)
        End Select

        Dim S As SizeF = G.MeasureString(Text, Font)
        G.DrawString(Text, Font, B5, Convert.ToInt32(Width / 2 - S.Width / 2), Convert.ToInt32(Height / 2 - S.Height / 2))

        G.DrawRectangle(P1, 1, 1, Width - 3, Height - 3)

        e.Graphics.DrawImage(B, 0, 0)
        G.Dispose()
        B.Dispose()
    End Sub

    Protected Overrides Sub OnPaintBackground(ByVal e As PaintEventArgs)
    End Sub
End Class

Class FutureSeperator
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
        C1 = Color.FromArgb(34, 34, 34) 'Background
        P1 = New Pen(Color.FromArgb(22, 22, 22)) 'Shadow
        P2 = New Pen(Color.FromArgb(49, 49, 49)) 'Highlight
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
Public Class MProgress : Inherits Control

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

    Dim C2 As Color = Color.FromArgb(6, 96, 149) 'Dark Color
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
    Dim C3 As Color = Color.FromArgb(70, 167, 220) 'Light color
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
        X.Colors = New Color() {C2, C3, C3, C2}
        X.Positions = New Single() {0.0F, 0.1F, 0.9F, 1.0F}
        R2 = New Rectangle(2, 2, 2, 2)
        B2 = New LinearGradientBrush(R2, Nothing, Nothing, 180.0F)
        B2.InterpolationColors = X

    End Sub

    Sub UpdateColors()
        P2.Color = C2
        X.Colors = New Color() {C2, C3, C3, C2}
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
'Electron Theme

Class FutureTheme
    Inherits Control

    Protected Overrides Sub OnHandleCreated(ByVal e As EventArgs)
        Dock = DockStyle.Fill
        If TypeOf Parent Is Form Then
            With DirectCast(Parent, Form)
                .FormBorderStyle = 0
                .BackColor = C1
                .ForeColor = Color.FromArgb(150, 150, 150)
            End With
        End If
        MyBase.OnHandleCreated(e)
    End Sub
    Protected Overrides Sub OnMouseDown(ByVal e As System.Windows.Forms.MouseEventArgs)
        If New Rectangle(Parent.Location.X, Parent.Location.Y, Width, 22).IntersectsWith(New Rectangle(MousePosition.X, MousePosition.Y, 1, 1)) Then
            Capture = False
            Dim M As Message = Message.Create(Parent.Handle, 161, New IntPtr(2), IntPtr.Zero)
            DefWndProc(M)
        End If
        MyBase.OnMouseDown(e)
    End Sub

    Dim G As Graphics, B As Bitmap, R1, R2 As Rectangle
    Dim P1, P2, P3 As Pen, B1 As SolidBrush, B2, B3 As LinearGradientBrush
    Dim C1 As Color = Color.FromArgb(34, 34, 34) 'Dark Color

    Dim C2 As Color = Color.FromArgb(49, 49, 49) 'Highlight
    Dim C3 As Color = Color.FromArgb(22, 22, 22) 'Shadow
    Dim C4 As Color = Color.Black 'Shadow
    Public Property Color1() As Color
        Get
            Return C1
        End Get
        Set(ByVal v As Color)
            C1 = v
            P2 = New Pen(C1)
            If Height > 0 Then
                R1 = New Rectangle(0, 2, Width, 18)
                R2 = New Rectangle(0, 21, Width, 10)
                B2 = New LinearGradientBrush(R1, C1, C3, 90.0F)
                B3 = New LinearGradientBrush(R2, Color.FromArgb(70, 0, 0, 0), Color.Transparent, 90.0F)
                Invalidate()
            End If
            Invalidate()
        End Set
    End Property
    Public Property Color2() As Color
        Get
            Return C2
        End Get
        Set(ByVal v As Color)
            C2 = v
            P3 = New Pen(C2)
            B1 = New SolidBrush(C2)
            Invalidate()
        End Set
    End Property
    Public Property Color3() As Color
        Get
            Return C3
        End Get
        Set(ByVal v As Color)
            C3 = v
            If Height > 0 Then
                R1 = New Rectangle(0, 2, Width, 18)
                R2 = New Rectangle(0, 21, Width, 10)
                B2 = New LinearGradientBrush(R1, C1, C3, 90.0F)
                B3 = New LinearGradientBrush(R2, Color.FromArgb(70, 0, 0, 0), Color.Transparent, 90.0F)
                Invalidate()
            End If
            Invalidate()
        End Set
    End Property
    Public Property Color4() As Color
        Get
            Return C4
        End Get
        Set(ByVal v As Color)
            C4 = v
            P1 = New Pen(C4) 'Border
            Invalidate()
        End Set
    End Property
    Sub New()

        SetStyle(ControlStyles.AllPaintingInWmPaint Or ControlStyles.UserPaint, True)
        ' C1 = Color.FromArgb(34, 34, 34) 'Background
        ' C2 = Color.FromArgb(49, 49, 49) 'Highlight
        ' C3 = Color.FromArgb(22, 22, 22) 'Shadow
        P1 = New Pen(C4) 'Border
        P2 = New Pen(C1)
        P3 = New Pen(C2)
        B1 = New SolidBrush(C2)
        Font = New Font("Verdana", 7.0F, FontStyle.Bold)

    End Sub

    Protected Overrides Sub OnSizeChanged(ByVal e As EventArgs)
        If Height > 0 Then
            R1 = New Rectangle(0, 2, Width, 18)
            R2 = New Rectangle(0, 21, Width, 10)
            B2 = New LinearGradientBrush(R1, C1, C3, 90.0F)
            B3 = New LinearGradientBrush(R2, Color.FromArgb(70, 0, 0, 0), Color.Transparent, 90.0F)
            Invalidate()
        End If
        MyBase.OnSizeChanged(e)
    End Sub

    Protected Overrides Sub OnPaintBackground(ByVal pevent As PaintEventArgs)
    End Sub

    Protected Overrides Sub OnPaint(ByVal e As PaintEventArgs)
        B = New Bitmap(Width, Height)
        G = Graphics.FromImage(B)

        G.Clear(C1)

        For I As Integer = 0 To Width + 17 Step 4
            G.DrawLine(P1, I, 21, I - 17, 37)
            G.DrawLine(P1, I - 1, 21, I - 16, 37)
        Next
        G.FillRectangle(B3, R2)

        G.FillRectangle(B2, R1)
        G.DrawString(Text, Font, B1, 5, 5)

        G.DrawRectangle(P2, 1, 1, Width - 3, 19)
        G.DrawRectangle(P3, 1, 39, Width - 3, Height - 41)

        G.DrawRectangle(P1, 0, 0, Width - 1, Height - 1)
        G.DrawLine(P1, 0, 21, Width, 21)
        G.DrawLine(P1, 0, 38, Width, 38)

        e.Graphics.DrawImage(B, 0, 0)
        G.Dispose()
        B.Dispose()
    End Sub

End Class
Class FutureButton
    Inherits Control

    Dim B As Bitmap, G As Graphics, R1 As Rectangle
    Dim C1, C2, C3, C4 As Color, P1, P2, P3, P4 As Pen, B1, B2, B5 As Brush, B3, B4 As LinearGradientBrush

    Sub New()
        SetStyle(ControlStyles.AllPaintingInWmPaint Or ControlStyles.UserPaint, True)

        C1 = Color.FromArgb(34, 34, 34) 'Background
        C2 = Color.FromArgb(49, 49, 49) 'Highlight
        C3 = Color.FromArgb(39, 39, 39) 'Lesser Highlight
        C4 = Color.FromArgb(60, Color.Black)
        P1 = New Pen(Color.FromArgb(22, 22, 22)) 'Shadow
        P2 = New Pen(Color.FromArgb(20, Color.White))
        P3 = New Pen(Color.FromArgb(10, Color.White))
        P4 = New Pen(Color.FromArgb(30, Color.Black))
        B1 = New SolidBrush(C1)
        B2 = New SolidBrush(C3)
        B5 = New SolidBrush(Color.FromArgb(12, 12, 12)) 'Text Color
        Font = New Font("Verdana", 8.0F)
    End Sub

    Private State As Integer
    Protected Overrides Sub OnMouseLeave(ByVal e As EventArgs)
        State = 0
        Invalidate()
    End Sub
    Protected Overrides Sub OnMouseUp(ByVal e As MouseEventArgs)
        State = 1
        Invalidate()
    End Sub
    Protected Overrides Sub OnMouseEnter(ByVal e As EventArgs)
        State = 1
        Invalidate()
    End Sub
    Protected Overrides Sub OnMouseDown(ByVal e As MouseEventArgs)
        State = 2
        Invalidate()
    End Sub

    Protected Overrides Sub OnResize(ByVal e As EventArgs)
        R1 = New Rectangle(2, 2, Width - 4, 4)
        B3 = New LinearGradientBrush(ClientRectangle, C3, C2, 90.0F)
        B4 = New LinearGradientBrush(R1, C4, Color.Transparent, 90.0F)
        Invalidate()
    End Sub

    Protected Overrides Sub OnPaint(ByVal e As PaintEventArgs)
        B = New Bitmap(Width, Height)
        G = Graphics.FromImage(B)

        G.FillRectangle(B3, ClientRectangle)

        Select Case State
            Case 0 'Up
                G.FillRectangle(B1, 1, 1, Width - 2, Height - 2)
                G.DrawLine(P2, 2, 2, Width - 3, 2)
                G.DrawLine(P3, 2, Height - 3, Width - 3, Height - 3)
            Case 1 'Over
                G.FillRectangle(B2, 1, 1, Width - 2, Height - 2)
                G.DrawLine(P2, 2, 2, Width - 3, 2)
                G.DrawLine(P3, 2, Height - 3, Width - 3, Height - 3)
            Case 2 'Down
                G.FillRectangle(B2, 1, 1, Width - 2, Height - 2)
                G.FillRectangle(B4, R1)
                G.DrawLine(P4, 2, 2, 2, Height - 3)
        End Select

        Dim S As SizeF = G.MeasureString(Text, Font)
        G.DrawString(Text, Font, B5, Convert.ToInt32(Width / 2 - S.Width / 2), Convert.ToInt32(Height / 2 - S.Height / 2))

        G.DrawRectangle(P1, 1, 1, Width - 3, Height - 3)

        e.Graphics.DrawImage(B, 0, 0)
        G.Dispose()
        B.Dispose()
    End Sub

    Protected Overrides Sub OnPaintBackground(ByVal e As PaintEventArgs)
    End Sub

End Class



Public Class CodeBox
    Inherits TextBox

  
    Dim C2 As Color = Color.FromArgb(6, 96, 149) 'Dark Color
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
    Dim C3 As Color = Color.FromArgb(70, 167, 220) 'Light color
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
        X.Colors = New Color() {C2, C3, C3, C2}
        X.Positions = New Single() {0.0F, 0.1F, 0.9F, 1.0F}
        R2 = New Rectangle(2, 2, 2, 2)
        B2 = New LinearGradientBrush(R2, Nothing, Nothing, 180.0F)
        B2.InterpolationColors = X

    End Sub

    Sub UpdateColors()
        P2.Color = C2
        X.Colors = New Color() {C2, C3, C3, C2}
        B2.InterpolationColors = X
    End Sub

    Protected Overrides Sub OnSizeChanged(ByVal e As System.EventArgs)
        R1 = New Rectangle(0, 1, Width, 4)
        B1 = New LinearGradientBrush(R1, Color.FromArgb(60, Color.Black), Color.Transparent, 90.0F)

        Invalidate()
        MyBase.OnSizeChanged(e)
    End Sub
    Protected Overrides Sub OnPaint(ByVal e As PaintEventArgs)
        B = New Bitmap(Width, Height)
        G = Graphics.FromImage(B)

        G.Clear(C1)

        G.FillRectangle(B1, R1)

       
        G.DrawRectangle(P3, 0, 0, Width - 1, Height - 1)

        e.Graphics.DrawImage(B, 0, 0)
        G.Dispose()
        B.Dispose()
    End Sub

End Class
