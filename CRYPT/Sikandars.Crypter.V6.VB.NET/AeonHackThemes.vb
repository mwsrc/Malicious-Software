Imports System.Drawing.Drawing2D
'Controls created by Aeonhack
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
Public Class PButton : Inherits Control
    Sub New()
        ForeColor = C3
    End Sub
    Private State As Integer
    Protected Overrides Sub OnMouseEnter(ByVal e As System.EventArgs)
        State = 1 : Invalidate() : MyBase.OnMouseEnter(e)
    End Sub
    Protected Overrides Sub OnMouseDown(ByVal e As System.Windows.Forms.MouseEventArgs)
        State = 2 : Invalidate() : MyBase.OnMouseDown(e)
    End Sub
    Protected Overrides Sub OnMouseLeave(ByVal e As System.EventArgs)
        State = 0 : Invalidate() : MyBase.OnMouseLeave(e)
    End Sub
    Protected Overrides Sub OnMouseUp(ByVal e As System.Windows.Forms.MouseEventArgs)
        State = 1 : Invalidate() : MyBase.OnMouseUp(e)
    End Sub
    Dim C1 As Color = Color.FromArgb(240, 240, 240), C2 As Color = Color.FromArgb(230, 230, 230), C3 As Color = Color.FromArgb(190, 190, 190)
    Protected Overrides Sub OnPaintBackground(ByVal pevent As System.Windows.Forms.PaintEventArgs)
    End Sub
    Protected Overrides Sub OnPaint(ByVal e As System.Windows.Forms.PaintEventArgs)
        Using B As New Bitmap(Width, Height)
            Using G = Graphics.FromImage(B)
                If State = 2 Then
                    Draw.Gradient(G, C2, Color.WhiteSmoke, 1, 1, Width, Height)
                Else
                    Draw.Gradient(G, Color.WhiteSmoke, C2, 1, 1, Width, Height)
                End If

                If State < 2 Then G.FillRectangle(New SolidBrush(Color.FromArgb(80, 255, 255, 255)), 0, 0, Width, CInt(Height * 0.3))

                Dim S = G.MeasureString(Text, Font)
                G.DrawString(Text, Font, New SolidBrush(ForeColor), Width / 2 - S.Width / 2, Height / 2 - S.Height / 2)
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
                Using T As New LinearGradientBrush(R, C1, C3, LinearGradientMode.Vertical)
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
    Sub New()
        ForeColor = Color.FromArgb(65, 65, 65)
    End Sub
    Private State As Integer
    Protected Overrides Sub OnMouseEnter(ByVal e As System.EventArgs)
        State = 1 : Invalidate() : MyBase.OnMouseEnter(e)
    End Sub
    Protected Overrides Sub OnMouseDown(ByVal e As System.Windows.Forms.MouseEventArgs)
        State = 2 : Invalidate() : MyBase.OnMouseDown(e)
    End Sub
    Protected Overrides Sub OnMouseLeave(ByVal e As System.EventArgs)
        State = 0 : Invalidate() : MyBase.OnMouseLeave(e)
    End Sub
    Protected Overrides Sub OnMouseUp(ByVal e As System.Windows.Forms.MouseEventArgs)
        State = 1 : Invalidate() : MyBase.OnMouseUp(e)
    End Sub
    Dim C1 As Color = Color.FromArgb(31, 31, 31), C2 As Color = Color.FromArgb(41, 41, 41), C3 As Color = Color.FromArgb(51, 51, 51), _
    C4 As Color = Color.FromArgb(0, 0, 0, 0), C5 As Color = Color.FromArgb(25, 255, 255, 255)
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
Public Class MProgress : Inherits Control
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
    Dim C1 As Color = Color.FromArgb(31, 31, 31), C2 As Color = Color.FromArgb(41, 41, 41), C3 As Color = Color.FromArgb(51, 51, 51), _
    C4 As Color = Color.FromArgb(0, 0, 0, 0), C5 As Color = Color.FromArgb(25, 255, 255, 255)
    Protected Overrides Sub OnPaintBackground(ByVal pevent As System.Windows.Forms.PaintEventArgs)
    End Sub
    Protected Overrides Sub OnPaint(ByVal e As System.Windows.Forms.PaintEventArgs)
        Dim V As Integer = Width * _Value / _Maximum
        Using B As New Bitmap(Width, Height)
            Using G = Graphics.FromImage(B)
                Draw.Gradient(G, C2, C3, 1, 1, Width - 2, Height - 2)
                G.DrawRectangle(New Pen(C2), 1, 1, V - 3, Height - 3)
                Draw.Gradient(G, C3, C2, 2, 2, V - 4, Height - 4)

                G.DrawRectangle(New Pen(C1), 0, 0, Width - 1, Height - 1)

                e.Graphics.DrawImage(B.Clone, 0, 0)
            End Using
        End Using
    End Sub
End Class
'Electron Theme
Public Class ETheme : Inherits Control
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
    Dim C1 As Color = Color.FromArgb(0, 70, 114), C2 As Color = Color.FromArgb(0, 47, 78), C3 As Color = Color.FromArgb(0, 34, 57), _
    C4 As Color = Color.FromArgb(0, 30, 50)
    Protected Overrides Sub OnPaintBackground(ByVal pevent As System.Windows.Forms.PaintEventArgs)
    End Sub
    Protected Overrides Sub OnPaint(ByVal e As System.Windows.Forms.PaintEventArgs)
        Using B As New Bitmap(Width, Height)
            Using G = Graphics.FromImage(B)
                G.Clear(C3)

                Draw.Blend(G, C2, C3, C1, 0.5, 1, 0, 0, Width, _TitleHeight)

                G.FillRectangle(New SolidBrush(Color.FromArgb(15, 255, 255, 255)), 1, 1, Width - 2, CInt(_TitleHeight / 2) - 2)
                G.DrawRectangle(New Pen(Color.FromArgb(35, 255, 255, 255)), 1, 1, Width - 3, _TitleHeight - 2)

                Dim S = G.MeasureString(Text, Font), O = 6
                If _TitleAlign = 2 Then O = Width / 2 - S.Width / 2
                If _TitleAlign = 1 Then O = Width - S.Width - 14
                Dim V = CInt(_TitleHeight / 2 - (S.Height + 4) / 2)

                Draw.Gradient(G, C3, C2, O, V, S.Width + 8, S.Height + 4)
                G.DrawRectangle(New Pen(C3), O, V, S.Width + 7, S.Height + 3)

                Dim R As New Rectangle(O + 4, CInt(_TitleHeight / 2 - S.Height / 2), S.Width, S.Height)
                Using T As New LinearGradientBrush(R, C1, C2, LinearGradientMode.Vertical)
                    G.DrawString(Text, Font, T, R)
                End Using

                G.DrawRectangle(New Pen(C1), 1, _TitleHeight + 1, Width - 3, Height - _TitleHeight - 3)

                G.DrawLine(New Pen(C4), 0, _TitleHeight, Width, _TitleHeight)
                G.DrawRectangle(New Pen(C4), 0, 0, Width - 1, Height - 1)
                e.Graphics.DrawImage(B.Clone, 0, 0)
            End Using
        End Using
    End Sub
End Class