Imports System.Drawing.Drawing2D
Imports System.Text

Module ThemeModule

    Friend G As Graphics

    Sub New()
        TextBitmap = New Bitmap(1, 1)
        TextGraphics = Graphics.FromImage(TextBitmap)
    End Sub

    Private TextBitmap As Bitmap
    Private TextGraphics As Graphics

    Friend Function MeasureString(text As String, font As Font) As SizeF
        Return TextGraphics.MeasureString(text, font)
    End Function

    Friend Function MeasureString(text As String, font As Font, width As Integer) As SizeF
        Return TextGraphics.MeasureString(text, font, width, StringFormat.GenericTypographic)
    End Function

    Private CreateRoundPath As GraphicsPath
    Private CreateRoundRectangle As Rectangle

    Friend Function CreateRound(ByVal x As Integer, ByVal y As Integer, ByVal width As Integer, ByVal height As Integer, ByVal slope As Integer) As GraphicsPath
        CreateRoundRectangle = New Rectangle(x, y, width, height)
        Return CreateRound(CreateRoundRectangle, slope)
    End Function

    Friend Function CreateRound(ByVal r As Rectangle, ByVal slope As Integer) As GraphicsPath
        CreateRoundPath = New GraphicsPath(FillMode.Winding)
        CreateRoundPath.AddArc(r.X, r.Y, slope, slope, 180.0F, 90.0F)
        CreateRoundPath.AddArc(r.Right - slope, r.Y, slope, slope, 270.0F, 90.0F)
        CreateRoundPath.AddArc(r.Right - slope, r.Bottom - slope, slope, slope, 0.0F, 90.0F)
        CreateRoundPath.AddArc(r.X, r.Bottom - slope, slope, slope, 90.0F, 90.0F)
        CreateRoundPath.CloseFigure()
        Return CreateRoundPath
    End Function

End Module


Class RandomST
    Inherits Control

    Event ValueChanged(ByVal sender As Object)

    Private _Value As New StringBuilder
    ReadOnly Property Value() As String
        Get
            Return _Value.ToString()
        End Get
    End Property

    Private _FullValue As String
    ReadOnly Property FullValue() As String
        Get
            Return BitConverter.ToString(Table).Replace("-", "")
        End Get
    End Property

    Private RNG As New Random()

    Private ItemSize As Integer = 9
    Private DrawSize As Integer = 8

    Private WA As Rectangle

    Private RowSize As Integer
    Private ColumnSize As Integer

    Sub New()
        SetStyle(DirectCast(139286, ControlStyles), True)
        SetStyle(ControlStyles.Selectable, False)

        P1 = New Pen(Color.FromArgb(0, 0, 0))
        P2 = New Pen(Color.FromArgb(0, 0, 0))

        B1 = New SolidBrush(Color.FromArgb(0, 0, 0))
    End Sub

    Protected Overrides Sub OnHandleCreated(e As EventArgs)
        UpdateTable()
        MyBase.OnHandleCreated(e)
    End Sub

    Private Table As Byte()
    Private Sub UpdateTable()
        WA = New Rectangle(5, 5, Width - 10, Height - 10)

        RowSize = WA.Width \ ItemSize
        ColumnSize = WA.Height \ ItemSize

        WA.Width = RowSize * ItemSize
        WA.Height = ColumnSize * ItemSize

        WA.X = (Width \ 2) - (WA.Width \ 2)
        WA.Y = (Height \ 2) - (WA.Height \ 2)

        Table = New Byte((RowSize * ColumnSize) - 1) {}

        For I As Integer = 0 To Table.Length - 1
            Table(I) = CByte(RNG.Next(100))
        Next

        Invalidate()
    End Sub

    Protected Overrides Sub OnSizeChanged(e As EventArgs)
        UpdateTable()
    End Sub

    Private Index1 As Integer = -1
    Private Index2 As Integer

    Private InvertColors As Boolean

    Protected Overrides Sub OnMouseMove(ByVal e As MouseEventArgs)
        HandleDraw(e)
    End Sub

    Protected Overrides Sub OnMouseDown(e As MouseEventArgs)
        HandleDraw(e)
        MyBase.OnMouseDown(e)
    End Sub

    Private Sub HandleDraw(e As MouseEventArgs)
        If e.Button = Windows.Forms.MouseButtons.Left OrElse e.Button = Windows.Forms.MouseButtons.Right Then
            If Not WA.Contains(e.Location) Then Return

            InvertColors = (e.Button = Windows.Forms.MouseButtons.Right)

            Index1 = GetIndex(e.X, e.Y)
            If Index1 = Index2 Then Return

            Dim L As Boolean = Not (Index1 Mod RowSize = 0)
            Dim R As Boolean = Not (Index1 Mod RowSize = (RowSize - 1))

            Randomize(Index1 - RowSize)
            If L Then Randomize(Index1 - 1)
            Randomize(Index1)
            If R Then Randomize(Index1 + 1)
            Randomize(Index1 + RowSize)

            _Value.Append(Table(Index1).ToString("X"))
            If _Value.Length > 32 Then _Value.Remove(0, 2)

            RaiseEvent ValueChanged(Me)

            Index2 = Index1
            Invalidate()
        End If
    End Sub

    Private GP1, GP2 As GraphicsPath

    Private P1, P2 As Pen
    Private B1, B2 As SolidBrush

    Private PB1 As PathGradientBrush

    Protected Overrides Sub OnPaint(ByVal e As PaintEventArgs)
        G = e.Graphics

        G.Clear(BackColor)
        G.SmoothingMode = SmoothingMode.AntiAlias

        GP1 = CreateRound(0, 0, Width - 1, Height - 1, 7)
        GP2 = CreateRound(1, 1, Width - 3, Height - 3, 7)

        PB1 = New PathGradientBrush(GP1)
        PB1.CenterColor = Color.FromArgb(0, 0, 0)
        PB1.SurroundColors = {Color.FromArgb(0, 0, 0)}
        PB1.FocusScales = New PointF(0.9F, 0.5F)

        G.FillPath(PB1, GP1)

        G.DrawPath(P1, GP1)
        G.DrawPath(P2, GP2)

        G.SmoothingMode = SmoothingMode.None

        For I As Integer = 0 To Table.Length - 1
            Dim C As Integer = Math.Max(Table(I), 75)

            Dim X As Integer = ((I Mod RowSize) * ItemSize) + WA.X
            Dim Y As Integer = ((I \ RowSize) * ItemSize) + WA.Y

            B2 = New SolidBrush(Color.FromArgb(C, C, C))

            G.FillRectangle(B1, X + 1, Y + 1, DrawSize, DrawSize)
            G.FillRectangle(B2, X, Y, DrawSize, DrawSize)

            B2.Dispose()
        Next

    End Sub

    Private Function GetIndex(ByVal x As Integer, ByVal y As Integer) As Integer
        Return (((y - WA.Y) \ ItemSize) * RowSize) + ((x - WA.X) \ ItemSize)
    End Function

    Private Sub Randomize(ByVal index As Integer)
        If index > -1 AndAlso index < Table.Length Then
            If InvertColors Then
                Table(index) = CByte(RNG.Next(100))
            Else
                Table(index) = CByte(RNG.Next(100, 256))
            End If
        End If
    End Sub

End Class
