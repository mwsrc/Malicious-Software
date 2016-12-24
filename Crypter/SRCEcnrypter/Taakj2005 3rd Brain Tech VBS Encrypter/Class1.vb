Imports System.Drawing.Drawing2D
''' <summary>
''' Credits
''' </summary>
''' <remarks>
''' 
''' Contact:
''' Tedd           - HackForums.net Forum  or  Tedd.Zublansky@blackhax.com
''' 
''' Copyright:
''' Sky Dark .NET Theme by the Webmaster of www.BlackHax.com is licensed under a Creative Commons Attribution-NonCommercial-NoDerivs 3.0 Unported License.
''' </remarks>
''' 
Module ConversionFunctions
    Function ToBrush(ByVal A As Integer, ByVal R As Integer, ByVal G As Integer, ByVal B As Integer) As Brush
        Return New SolidBrush(Color.FromArgb(A, R, G, B))
    End Function
    Function ToBrush(ByVal R As Integer, ByVal G As Integer, ByVal B As Integer) As Brush
        Return New SolidBrush(Color.FromArgb(R, G, B))
    End Function
    Function ToBrush(ByVal A As Integer, ByVal C As Color) As Brush
        Return New SolidBrush(Color.FromArgb(A, C))
    End Function
    Function ToBrush(ByVal Pen As Pen) As Brush
        Return New SolidBrush(Pen.Color)
    End Function
    Function ToBrush(ByVal Color As Color) As Brush
        Return New SolidBrush(Color)
    End Function
    Function ToPen(ByVal A As Integer, ByVal R As Integer, ByVal G As Integer, ByVal B As Integer) As Pen
        Return New Pen(New SolidBrush(Color.FromArgb(A, R, G, B)))
    End Function
    Function ToPen(ByVal R As Integer, ByVal G As Integer, ByVal B As Integer) As Pen
        Return New Pen(New SolidBrush(Color.FromArgb(R, G, B)))
    End Function
    Function ToPen(ByVal A As Integer, ByVal C As Color) As Pen
        Return New Pen(New SolidBrush(Color.FromArgb(A, C)))
    End Function
    Function ToPen(ByVal Brush As SolidBrush) As Pen
        Return New Pen(Brush)
    End Function
    Function ToPen(ByVal Color As Color) As Pen
        Return New Pen(New SolidBrush(Color))
    End Function
End Module

Module RRM
    Public Function RoundRect(ByVal Rectangle As Rectangle, ByVal Curve As Integer) As GraphicsPath
        Dim P As GraphicsPath = New GraphicsPath()
        Dim ArcRectangleWidth As Integer = Curve * 2
        P.AddArc(New Rectangle(Rectangle.X, Rectangle.Y, ArcRectangleWidth, ArcRectangleWidth), -180, 90)
        P.AddArc(New Rectangle(Rectangle.Width - ArcRectangleWidth + Rectangle.X, Rectangle.Y, ArcRectangleWidth, ArcRectangleWidth), -90, 90)
        P.AddArc(New Rectangle(Rectangle.Width - ArcRectangleWidth + Rectangle.X, Rectangle.Height - ArcRectangleWidth + Rectangle.Y, ArcRectangleWidth, ArcRectangleWidth), 0, 90)
        P.AddArc(New Rectangle(Rectangle.X, Rectangle.Height - ArcRectangleWidth + Rectangle.Y, ArcRectangleWidth, ArcRectangleWidth), 90, 90)
        P.AddLine(New Point(Rectangle.X, Rectangle.Height - ArcRectangleWidth + Rectangle.Y), New Point(Rectangle.X, Curve + Rectangle.Y))
        Return P
    End Function
    Public Function RoundRect(ByVal X As Integer, ByVal Y As Integer, ByVal Width As Integer, ByVal Height As Integer, ByVal Curve As Integer) As GraphicsPath
        Dim Rectangle As Rectangle = New Rectangle(X, Y, Width, Height)
        Dim P As GraphicsPath = New GraphicsPath()
        Dim ArcRectangleWidth As Integer = Curve * 2
        P.AddArc(New Rectangle(Rectangle.X, Rectangle.Y, ArcRectangleWidth, ArcRectangleWidth), -180, 90)
        P.AddArc(New Rectangle(Rectangle.Width - ArcRectangleWidth + Rectangle.X, Rectangle.Y, ArcRectangleWidth, ArcRectangleWidth), -90, 90)
        P.AddArc(New Rectangle(Rectangle.Width - ArcRectangleWidth + Rectangle.X, Rectangle.Height - ArcRectangleWidth + Rectangle.Y, ArcRectangleWidth, ArcRectangleWidth), 0, 90)
        P.AddArc(New Rectangle(Rectangle.X, Rectangle.Height - ArcRectangleWidth + Rectangle.Y, ArcRectangleWidth, ArcRectangleWidth), 90, 90)
        P.AddLine(New Point(Rectangle.X, Rectangle.Height - ArcRectangleWidth + Rectangle.Y), New Point(Rectangle.X, Curve + Rectangle.Y))
        Return P
    End Function
End Module

Module Shapes
    Public Function Triangle(ByVal Location As Point, ByVal Size As Size) As Point()
        Dim ReturnPoints(0 To 3) As Point
        ReturnPoints(0) = Location
        ReturnPoints(1) = New Point(Location.X + Size.Width, Location.Y)
        ReturnPoints(2) = New Point(Location.X + Size.Width \ 2, Location.Y + Size.Height)
        ReturnPoints(3) = Location

        Return ReturnPoints
    End Function
End Module

Public Class SkyDarkForm
    Inherits ContainerControl
    Dim WithEvents Maxim As SkyDarkTop
    Dim WithEvents Exim As SkyDarkTop
    Private Locked As Boolean = False
    Private Locked1 As Point = Nothing

    Sub New()
        Dock = DockStyle.Fill
        SendToBack()
        BackColor = Color.FromArgb(62, 60, 58)
    End Sub

    Protected Overrides Sub OnHandleCreated(ByVal e As System.EventArgs)
        Parent.FindForm.FormBorderStyle = FormBorderStyle.None
        Maxim = New SkyDarkTop With {.Location = New Point(Width - 41, 3), .Size = New Size(14, 14), .Parent = Me}
        Exim = New SkyDarkTop With {.Location = New Point(Width - 22, 3), .Size = New Size(14, 14), .Parent = Me}
        Me.Controls.Add(Maxim)
        Me.Controls.Add(Exim)
        Maxim.Show()
        Exim.Show()
    End Sub
    Dim T1 As New Rectangle(1, 1, Width - 3, 18)
    Dim C1 As Color = Color.FromArgb(62, 60, 58)
    Dim C2 As Color = Color.FromArgb(81, 79, 77)
    Dim C3 As Color = Color.FromArgb(71, 70, 69)
    Dim C4 As Color = Color.FromArgb(58, 56, 54)

    Protected Overrides Sub OnPaint(ByVal e As System.Windows.Forms.PaintEventArgs)
        Dim B As New Bitmap(Width, Height)
        Dim G As Graphics = Graphics.FromImage(B)

        'Drawing
        G.Clear(C1)
        Dim G1 As New LinearGradientBrush(New Point(T1.X, T1.Y), New Point(T1.X, T1.Y + T1.Height), C3, C4)
        G.FillRectangle(G1, T1)
        G.DrawRectangle(ToPen(C2), T1)
        G.DrawRectangle(ToPen(C2), New Rectangle(T1.X, T1.Y + T1.Height + 2, T1.Width, Height - T1.Y - T1.Height - 4))

        G1.Dispose()

        G.DrawString(Text, Font, ToBrush(113, 170, 186), _
                     New Rectangle(New Point(T1.X + 4, T1.Y), New Size(T1.Width - 40, T1.Height)), _
                     New StringFormat With {.LineAlignment = StringAlignment.Center})


        'Finish Up
        e.Graphics.DrawImage(B.Clone, 0, 0)
        G.Dispose() : B.Dispose()
    End Sub

    Private Sub Exim_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Exim.Click
        Parent.FindForm.Close()
    End Sub

    Private Sub Maxim_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Maxim.Click
        Parent.FindForm.WindowState = FormWindowState.Minimized
    End Sub

    Protected Overrides Sub OnMouseUp(ByVal e As System.Windows.Forms.MouseEventArgs)
        MyBase.OnMouseUp(e) : Locked = False : Locked1 = Nothing
    End Sub

    Protected Overrides Sub OnMouseDown(ByVal e As System.Windows.Forms.MouseEventArgs)
        MyBase.OnMouseDown(e) : If T1.Contains(e.Location) Then : Locked = True : Locked1 = e.Location : End If
    End Sub

    Protected Overrides Sub OnMouseMove(ByVal e As System.Windows.Forms.MouseEventArgs)
        MyBase.OnMouseMove(e) : If Locked Then Parent.Location = Cursor.Position - Locked1
    End Sub

    Protected Overrides Sub OnResize(ByVal e As System.EventArgs)
        MyBase.OnResize(e) : T1 = New Rectangle(1, 1, Width - 3, 18)
    End Sub
End Class

Public Class SkyDarkButton
    Inherits Control

#Region "Properties"
    Public Overrides Property Text As String
        Get
            Return MyBase.Text
        End Get
        Set(ByVal value As String)
            MyBase.Text = value
            Invalidate()
        End Set
    End Property
#End Region

    Sub New()
        DoubleBuffered = True
    End Sub

    Dim C1 As Color = Color.FromArgb(51, 49, 47)
    Dim C2 As Color = Color.FromArgb(90, 91, 90)
    Dim C3 As Color = Color.FromArgb(70, 71, 70)
    Dim C4 As Color = Color.FromArgb(62, 61, 58)


    Protected Overrides Sub OnPaint(ByVal e As System.Windows.Forms.PaintEventArgs)
        Dim B As New Bitmap(Width, Height)
        Dim G As Graphics = Graphics.FromImage(B)

        Dim G1 As New LinearGradientBrush(New Point(0, 0), New Point(0, Height), C3, C4)
        G.FillRectangle(G1, 0, 0, Width, Height)
        G1.Dispose()

        If Enabled Then
            Select Case State
                Case MouseState.Over
                    G.FillRectangle(New SolidBrush(Color.FromArgb(20, Color.White)), New Rectangle(0, 0, Width, Height))
                Case MouseState.Down
                    G.FillRectangle(New SolidBrush(Color.FromArgb(10, Color.Black)), New Rectangle(0, 0, Width, Height))
            End Select
        End If

        Dim S1 As New StringFormat
        S1.LineAlignment = StringAlignment.Center
        S1.Alignment = StringAlignment.Center

        Select Case Enabled
            Case True
                G.DrawString(Text, Font, ToBrush(113, 170, 186), New Rectangle(0, 0, Width - 1, Height - 1), S1)
            Case False
                G.DrawString(Text, Font, Brushes.Gray, New Rectangle(0, 0, Width - 1, Height - 1), S1)
        End Select

        S1.Dispose()

        G.DrawRectangle(ToPen(C1), 0, 0, Width - 1, Height - 1)
        G.DrawRectangle(ToPen(C2), 1, 1, Width - 3, Height - 3)

        e.Graphics.DrawImage(B.Clone, 0, 0)
        G.Dispose() : B.Dispose()
    End Sub

#Region "Mouse States"
    Enum MouseState
        None
        Over
        Down
    End Enum
    Private ms As MouseState
    Private Property State() As MouseState
        Get
            Return ms
        End Get
        Set(ByVal value As MouseState)
            ms = value
            Invalidate()
        End Set
    End Property
    Protected Overrides Sub OnMouseEnter(ByVal e As System.EventArgs)
        MyBase.OnMouseEnter(e) : State = MouseState.Over
    End Sub
    Protected Overrides Sub OnMouseLeave(ByVal e As System.EventArgs)
        MyBase.OnMouseLeave(e) : State = MouseState.None
    End Sub
    Protected Overrides Sub OnMouseDown(ByVal e As System.Windows.Forms.MouseEventArgs)
        MyBase.OnMouseDown(e) : State = MouseState.Down
    End Sub
    Protected Overrides Sub OnMouseUp(ByVal e As System.Windows.Forms.MouseEventArgs)
        MyBase.OnMouseUp(e) : State = MouseState.Over
    End Sub
#End Region
End Class

Public Class SkyDarkProgress
    Inherits Control

#Region "Properties"
    Private val As Integer
    Public Property Value() As Integer
        Get
            Return val
        End Get
        Set(ByVal _value As Integer)
            If _value > max Then
                val = max
            ElseIf _value < 0 Then
                val = 0
            Else
                val = _value
            End If
            Invalidate()
        End Set
    End Property
    Private max As Integer
    Public Property Maximum() As Integer
        Get
            Return max
        End Get
        Set(ByVal _value As Integer)
            If _value < 1 Then
                max = 1
            Else
                max = _value
            End If

            If _value < val Then
                val = max
            End If

            Invalidate()
        End Set
    End Property
#End Region
    Dim C1 As Color = Color.FromArgb(51, 49, 47)
    Dim C2 As Color = Color.FromArgb(81, 77, 77)
    Dim C3 As Color = Color.FromArgb(64, 60, 59)
    Dim C4 As Color = Color.FromArgb(70, 71, 70)
    Dim C5 As Color = Color.FromArgb(62, 59, 58)

    Sub New()
        max = 100
    End Sub

    Protected Overrides Sub OnPaint(ByVal e As System.Windows.Forms.PaintEventArgs)
        Dim B As New Bitmap(Width, Height)
        Dim G As Graphics = Graphics.FromImage(B)
        Dim Fill As Rectangle = New Rectangle(3, 3, CInt((Width - 7) * (val / max)), Height - 7)

        G.Clear(C5)

        Dim G1 As New LinearGradientBrush(New Point(0, 0), New Point(0, Height), C3, C4)
        G.FillRectangle(G1, Fill)
        G1.Dispose()
        G.DrawRectangle(ToPen(C2), Fill)

        G.DrawRectangle(ToPen(C1), 0, 0, Width - 1, Height - 1)
        G.DrawRectangle(ToPen(C2), 1, 1, Width - 3, Height - 3)

        e.Graphics.DrawImage(B.Clone, 0, 0)
        G.Dispose() : B.Dispose()
    End Sub
End Class

Public Class SkyDarkTabControl
    Inherits TabControl

    Sub New()
        SetStyle(ControlStyles.AllPaintingInWmPaint Or _
        ControlStyles.ResizeRedraw Or _
        ControlStyles.UserPaint Or _
        ControlStyles.DoubleBuffer, True)
        DoubleBuffered = True
    End Sub
    Protected Overrides Sub CreateHandle()
        MyBase.CreateHandle()
        Alignment = TabAlignment.Top
    End Sub
    Dim C1 As Color = Color.FromArgb(62, 60, 58)
    Dim C2 As Color = Color.FromArgb(80, 78, 76)
    Dim C3 As Color = Color.FromArgb(51, 49, 47)
    Protected Overrides Sub OnPaint(ByVal e As PaintEventArgs)
        Dim B As New Bitmap(Width, Height)
        Dim G As Graphics = Graphics.FromImage(B)
        Try : SelectedTab.BackColor = C1 : Catch : End Try
        G.Clear(Parent.BackColor)
        For i = 0 To TabCount - 1
            If Not i = SelectedIndex Then
                Dim x2 As Rectangle = New Rectangle(GetTabRect(i).X, GetTabRect(i).Y + 3, GetTabRect(i).Width + 2, GetTabRect(i).Height)
                Dim G1 As New LinearGradientBrush(New Point(x2.X, x2.Y), New Point(x2.X, x2.Y + x2.Height), Color.FromArgb(60, 59, 58), Color.FromArgb(69, 69, 70))
                G.FillRectangle(G1, x2) : G1.Dispose()
                G.DrawRectangle(ToPen(C3), x2)
                G.DrawRectangle(ToPen(C2), New Rectangle(x2.X + 1, x2.Y + 1, x2.Width - 2, x2.Height))
                G.DrawString(TabPages(i).Text, Font, ToBrush(130, 176, 190), x2, New StringFormat With {.LineAlignment = StringAlignment.Center, .Alignment = StringAlignment.Center})
            End If
        Next

        G.FillRectangle(ToBrush(C1), 0, ItemSize.Height, Width, Height)
        G.DrawRectangle(ToPen(C2), 0, ItemSize.Height, Width - 1, Height - ItemSize.Height - 1)
        G.DrawRectangle(ToPen(C3), 1, ItemSize.Height + 1, Width - 3, Height - ItemSize.Height - 3)
        If Not SelectedIndex = -1 Then
            Dim x1 As Rectangle = New Rectangle(GetTabRect(SelectedIndex).X - 2, GetTabRect(SelectedIndex).Y, GetTabRect(SelectedIndex).Width + 3, GetTabRect(SelectedIndex).Height)
            G.FillRectangle(ToBrush(C1), New Rectangle(x1.X + 2, x1.Y + 2, x1.Width - 2, x1.Height))
            G.DrawLine(ToPen(C2), New Point(x1.X, x1.Y + x1.Height - 2), New Point(x1.X, x1.Y))
            G.DrawLine(ToPen(C2), New Point(x1.X, x1.Y), New Point(x1.X + x1.Width, x1.Y))
            G.DrawLine(ToPen(C2), New Point(x1.X + x1.Width, x1.Y), New Point(x1.X + x1.Width, x1.Y + x1.Height - 2))

            G.DrawLine(ToPen(C3), New Point(x1.X + 1, x1.Y + x1.Height - 1), New Point(x1.X + 1, x1.Y + 1))
            G.DrawLine(ToPen(C3), New Point(x1.X + 1, x1.Y + 1), New Point(x1.X + x1.Width - 1, x1.Y + 1))
            G.DrawLine(ToPen(C3), New Point(x1.X + x1.Width - 1, x1.Y + 1), New Point(x1.X + x1.Width - 1, x1.Y + x1.Height - 1))

            G.DrawString(TabPages(SelectedIndex).Text, Font, ToBrush(130, 176, 190), x1, New StringFormat With {.LineAlignment = StringAlignment.Center, .Alignment = StringAlignment.Center})
        End If

        e.Graphics.DrawImage(B.Clone, 0, 0)
        G.Dispose() : B.Dispose()
    End Sub
End Class

Public Class SkyDarkCombo
    Inherits ComboBox
    Sub New()
        MyBase.New()
        SetStyle(ControlStyles.AllPaintingInWmPaint Or _
        ControlStyles.ResizeRedraw Or _
        ControlStyles.UserPaint Or _
        ControlStyles.DoubleBuffer, True)
        DrawMode = Windows.Forms.DrawMode.OwnerDrawFixed
        BackColor = Color.FromArgb(235, 235, 235)
        ForeColor = Color.FromArgb(31, 31, 31)
        DropDownStyle = ComboBoxStyle.DropDownList
    End Sub
    Private _StartIndex As Integer = 0
    Public Property StartIndex As Integer
        Get
            Return _StartIndex
        End Get
        Set(ByVal value As Integer)
            _StartIndex = value
            Try
                MyBase.SelectedIndex = value
            Catch
            End Try
            Invalidate()
        End Set
    End Property

    Dim C1 As Color = Color.FromArgb(48, 48, 48)
    Dim C2 As Color = Color.FromArgb(81, 79, 77)
    Dim C3 As Color = Color.FromArgb(62, 60, 58)

    Protected Overrides Sub OnPaint(ByVal e As PaintEventArgs)
        If Not DropDownStyle = ComboBoxStyle.DropDownList Then DropDownStyle = ComboBoxStyle.DropDownList
        Dim B As New Bitmap(Width, Height)
        Dim G As Graphics = Graphics.FromImage(B)

        G.Clear(C3)


        Dim S1 As Integer = G.MeasureString("...", Font).Height
        If SelectedIndex <> -1 Then

            G.DrawString(Items(SelectedIndex), Font, ToBrush(152, 182, 192), 4, Height \ 2 - S1 \ 2)
        Else
            If Not Items Is Nothing And Items.Count > 0 Then
                G.DrawString(Items(0), Font, ToBrush(152, 182, 192), 4, Height \ 2 - S1 \ 2)
            Else
                G.DrawString("...", Font, ToBrush(152, 182, 192), 4, Height \ 2 - S1 \ 2)
            End If
        End If

        Dim G1 As New LinearGradientBrush(New Point(Width - 30, Height \ 2), New Point(Width - 22, Height \ 2), Color.Transparent, C3)
        G.FillRectangle(G1, Width - 30, 0, 8, Height)

        G.DrawRectangle(ToPen(C1), New Rectangle(0, 0, Width - 1, Height - 1))
        G.DrawLine(ToPen(C1), New Point(Width - 21, 0), New Point(Width - 21, Height))

        G.DrawRectangle(ToPen(C2), 1, 1, Width - 23, Height - 3)

        G.FillRectangle(ToBrush(C3), Width - 20, 1, 18, Height - 3)
        G.FillRectangle(ToBrush(10, Color.White), Width - 20, 1, 18, Height - 3)
        G.DrawRectangle(ToPen(C2), Width - 20, 1, 18, Height - 3)

        G.FillPolygon(Brushes.Black, Shapes.Triangle(New Point(Width - 12, Height \ 2), New Size(5, 3)))
        G.FillPolygon(Brushes.LightBlue, Shapes.Triangle(New Point(Width - 13, Height \ 2 - 1), New Size(5, 3)))

        e.Graphics.DrawImage(B.Clone, 0, 0)
        G.Dispose() : B.Dispose()
    End Sub
    Sub ReplaceItem(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DrawItemEventArgs) Handles Me.DrawItem
        Dim G As Graphics = e.Graphics
        Dim C4 As Color = Color.Empty
        e.DrawBackground()
        Try
            If e.State And DrawItemState.Selected = DrawItemState.Selected Then
                G.FillRectangle(ToBrush(50, 80, 120), New Rectangle(e.Bounds.X - 1, e.Bounds.Y, e.Bounds.Width, e.Bounds.Height + 2))
                G.DrawRectangle(New Pen(ToBrush(180, Color.Black), 1), New Rectangle(e.Bounds.X - 1, e.Bounds.Y, e.Bounds.Width, e.Bounds.Height + 2))
                C4 = Color.FromArgb(100, 165, 185)
            Else
                G.FillRectangle(ToBrush(62, 60, 58), New Rectangle(e.Bounds.X - 1, e.Bounds.Y, e.Bounds.Width, e.Bounds.Height + 2))
                C4 = Color.FromArgb(200, 200, 200)
            End If

            G.DrawString(MyBase.GetItemText(MyBase.Items(e.Index)), e.Font, ToBrush(C4), e.Bounds, New StringFormat With {.LineAlignment = StringAlignment.Center, .Alignment = StringAlignment.Center})
        Catch : End Try
    End Sub

    Private Sub SkyDarkCombo_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.TextChanged
        Invalidate()
    End Sub
End Class

Public Class SkyDarkTop
    Inherits Control

    Sub New()
        DoubleBuffered = True
        Size = New Size(10, 10)
    End Sub
    Dim C1 As Color = Color.FromArgb(94, 103, 106)
    Dim C2 As Color = Color.FromArgb(152, 182, 192)
    Dim CD As Color = Color.FromArgb(86, 94, 96)
    Dim C3 As Color = Color.FromArgb(71, 70, 69)
    Dim C4 As Color = Color.FromArgb(58, 56, 54)
    Protected Overrides Sub OnPaint(ByVal e As System.Windows.Forms.PaintEventArgs)
        Dim B As New Bitmap(Width, Height)
        Dim G As Graphics = Graphics.FromImage(B)
        Dim G1 As New LinearGradientBrush(New Point(0, 0), New Point(0, Height), C3, C4)
        G.FillRectangle(G1, ClientRectangle)
        G1.Dispose()
        G.SmoothingMode = SmoothingMode.HighQuality
        Select Case State
            Case MouseState.None
                G.DrawEllipse(New Pen(C1, 2), New Rectangle(2, 2, Width - 5, Height - 5))
            Case MouseState.Over
                G.DrawEllipse(New Pen(C2, 2), New Rectangle(2, 2, Width - 5, Height - 5))
            Case MouseState.Down
                G.DrawEllipse(New Pen(CD, 2), New Rectangle(2, 2, Width - 5, Height - 5))
        End Select

        G.FillEllipse(ToBrush(C2), New Rectangle(5, 5, Width - 11, Height - 11))

        e.Graphics.DrawImage(B.Clone, 0, 0)
        G.Dispose() : B.Dispose()
    End Sub

#Region "Mouse States"
    Enum MouseState
        None
        Over
        Down
    End Enum
    Private ms As MouseState
    Private Property State() As MouseState
        Get
            Return ms
        End Get
        Set(ByVal value As MouseState)
            ms = value
            Invalidate()
        End Set
    End Property
    Protected Overrides Sub OnMouseEnter(ByVal e As System.EventArgs)
        MyBase.OnMouseEnter(e) : State = MouseState.Over
    End Sub
    Protected Overrides Sub OnMouseLeave(ByVal e As System.EventArgs)
        MyBase.OnMouseLeave(e) : State = MouseState.None
    End Sub
    Protected Overrides Sub OnMouseDown(ByVal e As System.Windows.Forms.MouseEventArgs)
        MyBase.OnMouseDown(e) : State = MouseState.Down
    End Sub
    Protected Overrides Sub OnMouseUp(ByVal e As System.Windows.Forms.MouseEventArgs)
        MyBase.OnMouseUp(e) : State = MouseState.Over
    End Sub
#End Region
End Class

Public Class SkyDarkSeperator
    Inherits Control

    Public Enum Alignment
        Vertical
        Horizontal
    End Enum

    Private al As Alignment
    Public Property Align() As Alignment
        Get
            Return al
        End Get
        Set(ByVal value As Alignment)
            al = value
            Invalidate()
        End Set
    End Property

    Dim C1 As Color = Color.FromArgb(51, 49, 47)
    Dim C2 As Color = Color.FromArgb(90, 91, 90)
    Protected Overrides Sub OnPaint(ByVal e As System.Windows.Forms.PaintEventArgs)
        Dim B As New Bitmap(Width, Height)
        Dim G As Graphics = Graphics.FromImage(B)

        Select Case Align
            Case Alignment.Horizontal
                G.DrawLine(ToPen(C1), New Point(0, Height \ 2), New Point(Width, Height \ 2))
                G.DrawLine(ToPen(C2), New Point(0, Height \ 2 + 1), New Point(Width, Height \ 2 + 1))
            Case Alignment.Vertical
                G.DrawLine(ToPen(C1), New Point(Width \ 2, 0), New Point(Width \ 2, Height))
                G.DrawLine(ToPen(C2), New Point(Width \ 2 + 1, 0), New Point(Width \ 2 + 1, Height))
        End Select

        e.Graphics.DrawImage(B, 0, 0)
        G.Dispose() : B.Dispose()
    End Sub
End Class

Public Class SkyDarkCheck
    Inherits Control

    Enum MouseState
        None
        Down
    End Enum

#Region "Properties"

    Private chk As Boolean
    Public Property Checked() As Boolean
        Get
            Return chk
        End Get
        Set(ByVal value As Boolean)
            chk = value
            Invalidate()
        End Set
    End Property

    Private ms As MouseState
    Public Property State() As MouseState
        Get
            Return ms
        End Get
        Set(ByVal value As MouseState)
            ms = value
            invalidate()
        End Set
    End Property

#End Region

    Dim C1 As Color = Color.FromArgb(51, 49, 47)
    Dim C2 As Color = Color.FromArgb(80, 77, 77)

    Dim C3 As Color = Color.FromArgb(70, 69, 68)
    Dim C4 As Color = Color.FromArgb(64, 60, 59)
    Dim C5 As Color = Color.Transparent

    Protected Overrides Sub OnPaint(ByVal e As System.Windows.Forms.PaintEventArgs)
        Dim B As New Bitmap(Width, Height)
        Dim G As Graphics = Graphics.FromImage(B)

        G.Clear(Parent.BackColor)
        C3 = Color.FromArgb(70, 69, 68)
        C4 = Color.FromArgb(64, 60, 59)
        Select Case Enabled
            Case True
                Select Case State
                    Case MouseState.Down
                        C5 = Color.FromArgb(121, 151, 160)
                        C3 = Color.FromArgb(64, 60, 59)
                        C4 = Color.FromArgb(70, 69, 68)
                    Case MouseState.None
                        C5 = Color.FromArgb(151, 181, 190)
                End Select
            Case False
                C5 = Color.FromArgb(88, 88, 88)
        End Select

        Dim chkRec As New Rectangle(0, 0, Height - 1, Height - 1)
        Dim G1 As New LinearGradientBrush(New Point(chkRec.X, chkRec.Y), New Point(chkRec.X, chkRec.Y + chkRec.Height), C3, C4)
        G.FillRectangle(G1, chkRec) : G1.Dispose()
        G.DrawRectangle(ToPen(C1), chkRec)
        G.DrawRectangle(ToPen(C2), New Rectangle(chkRec.X + 1, chkRec.Y + 1, chkRec.Width - 2, chkRec.Height - 2))
        Dim chkPoly As Rectangle = New Rectangle(chkRec.X + chkRec.Width / 4, chkRec.Y + chkRec.Height / 4, chkRec.Width \ 2, chkRec.Height \ 2)
        Dim Poly() As Point = {New Point(chkPoly.X, chkPoly.Y + chkPoly.Height \ 2), _
                       New Point(chkPoly.X + chkPoly.Width \ 2, chkPoly.Y + chkPoly.Height), _
                       New Point(chkPoly.X + chkPoly.Width, chkPoly.Y)}

        If Checked Then
            G.SmoothingMode = SmoothingMode.HighQuality
            Dim P1 As New Pen(ToBrush(C5), 2)
            For i = 0 To Poly.Length - 2
                G.DrawLine(P1, Poly(i), Poly(i + 1))
            Next
        End If
        G.DrawString(Text, Font, ToBrush(C5), New Rectangle(chkRec.X + chkRec.Width + 5, 0, Width - chkRec.X - chkRec.Width - 5, Height), New StringFormat With {.LineAlignment = StringAlignment.Center, .Alignment = StringAlignment.Near})

        e.Graphics.DrawImage(B, 0, 0)
        G.Dispose() : B.Dispose()
    End Sub

    Protected Overrides Sub OnMouseUp(ByVal e As System.Windows.Forms.MouseEventArgs)
        If Enabled Then : State = MouseState.None : Checked = Not Checked : End If
    End Sub

    Protected Overrides Sub OnMouseDown(ByVal e As System.Windows.Forms.MouseEventArgs)
        If Enabled Then : State = MouseState.Down : End If
    End Sub
End Class

Public Class SkyDarkRadio
    Inherits Control

    Enum MouseState
        None
        Down
    End Enum

#Region "Properties"

    Private ms As MouseState
    Public Property State() As MouseState
        Get
            Return ms
        End Get
        Set(ByVal value As MouseState)
            ms = value
            Invalidate()
        End Set
    End Property

    Private chk As Boolean
    Public Property Checked() As Boolean
        Get
            Return chk
        End Get
        Set(ByVal value As Boolean)
            chk = value
            Invalidate()
            ''Error code: Whenever I add this it overflows like an infinite loop...
            Try
                If value Then
                    For Each ctl In Parent.Controls
                        If TypeOf ctl Is SkyDarkRadio Then
                            If Not ctl Is Me And DirectCast(ctl, SkyDarkRadio).Enabled Then
                                DirectCast(ctl, SkyDarkRadio).Checked = False
                            End If
                        End If
                    Next
                End If
            Catch : End Try
        End Set
    End Property

#End Region

    Sub New()
        Size = New Size(Width, 13)
    End Sub

    Dim C1 As Color = Color.FromArgb(35, 35, 35)
    Dim C2 As Color = Color.Transparent
    Dim C3 As Color = Color.Transparent
    Dim C4 As Color = Color.Transparent
    Protected Overrides Sub OnPaint(ByVal e As System.Windows.Forms.PaintEventArgs)
        Dim B As New Bitmap(Width, Height)
        Dim G As Graphics = Graphics.FromImage(B)

        G.Clear(Parent.BackColor)

        Select Case Enabled
            Case True
                Select Case State
                    Case MouseState.None
                        C2 = Color.FromArgb(70, 70, 70)
                        C3 = Color.FromArgb(54, 54, 51)
                        C4 = Color.FromArgb(152, 182, 192)
                    Case MouseState.Down
                        C2 = Color.FromArgb(54, 54, 51)
                        C3 = Color.FromArgb(70, 70, 70)
                        C4 = Color.FromArgb(112, 142, 152)
                End Select
            Case False
                C2 = Color.FromArgb(70, 70, 70)
                C3 = Color.FromArgb(54, 54, 51)
                C4 = Color.FromArgb(89, 88, 88)
        End Select

        Dim radRec As New Rectangle(0, 0, Height - 1, Height - 1)
        Dim B1 As New LinearGradientBrush(New Point(radRec.X + radRec.Width / 2, radRec.Y), New Point(radRec.X + radRec.Width / 2, radRec.Y + radRec.Height), C2, C3)
        G.SmoothingMode = SmoothingMode.HighQuality
        G.FillEllipse(B1, radRec)
        G.DrawEllipse(New Pen(ToBrush(C1)), radRec)
        If Checked Then G.FillEllipse(ToBrush(C4), New Rectangle(radRec.X + radRec.Width / 4, radRec.Y + radRec.Height / 4, radRec.Width / 2, radRec.Height / 2))
        G.DrawString(Text, Font, ToBrush(C4), New Rectangle(radRec.X + radRec.Width + 5, 0, Width - radRec.X - radRec.Width - 5, Height), New StringFormat With {.LineAlignment = StringAlignment.Center, .Alignment = StringAlignment.Near})


        e.Graphics.DrawImage(B, 0, 0)
        G.Dispose() : B.Dispose()
    End Sub

    Protected Overrides Sub OnMouseUp(ByVal e As System.Windows.Forms.MouseEventArgs)
        If Enabled Then : State = MouseState.None : If Not Checked Then : Checked = True : End If : End If
    End Sub

    Protected Overrides Sub OnMouseDown(ByVal e As System.Windows.Forms.MouseEventArgs)
        If Not Enabled Then State = MouseState.Down
    End Sub
End Class