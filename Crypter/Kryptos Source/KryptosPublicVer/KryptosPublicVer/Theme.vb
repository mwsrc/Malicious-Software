Imports System, System.IO, System.Collections.Generic
Imports System.Drawing, System.Drawing.Drawing2D
Imports System.ComponentModel, System.Windows.Forms

Enum MouseState As Byte
    None = 0
    Over = 1
    Down = 2
    Block = 3
End Enum

Class Bloom

    Private _Name As String
    Property Name() As String
        Get
            Return _Name
        End Get
        Set(ByVal value As String)
            _Name = value
        End Set
    End Property

    Private _Value As Color
    Property Value() As Color
        Get
            Return _Value
        End Get
        Set(ByVal value As Color)
            _Value = value
        End Set
    End Property

    Sub New()
    End Sub

    Sub New(ByVal name As String, ByVal value As Color)
        _Name = name
        _Value = value
    End Sub
End Class

MustInherit Class Theme
    Inherits ContainerControl

    Protected G As Graphics

    Sub New()
        SetStyle(DirectCast(139270, ControlStyles), True)
        _ImageSize = Size.Empty

        MeasureBitmap = New Bitmap(1, 1)
        MeasureGraphics = Graphics.FromImage(MeasureBitmap)

        Font = New Font("Verdana", 8S)

        InvalidateCustimization()
    End Sub

    Protected Overrides Sub SetBoundsCore(ByVal x As Integer, ByVal y As Integer, ByVal width As Integer, ByVal height As Integer, ByVal specified As BoundsSpecified)
        If Not _LockWidth = 0 Then width = _LockWidth
        If Not _LockHeight = 0 Then height = _LockHeight
        MyBase.SetBoundsCore(x, y, width, height, specified)
    End Sub

    Private Header As Rectangle
    Protected NotOverridable Overrides Sub OnSizeChanged(ByVal e As EventArgs)
        MyBase.OnSizeChanged(e)
        If _Movable AndAlso Not _ControlMode Then Header = New Rectangle(7, 7, Width - 14, _MoveHeight - 7)
        Invalidate()
    End Sub

    Protected NotOverridable Overrides Sub OnPaint(ByVal e As PaintEventArgs)
        If Width = 0 OrElse Height = 0 Then Return
        G = e.Graphics
        PaintHook()
    End Sub

    Protected NotOverridable Overrides Sub OnHandleCreated(ByVal e As EventArgs)
        InitializeMessages()
        InvalidateCustimization()
        ColorHook()

        _IsParentForm = TypeOf Parent Is Form
        If Not _ControlMode Then Dock = DockStyle.Fill

        If Not _LockWidth = 0 Then Width = _LockWidth
        If Not _LockHeight = 0 Then Height = _LockHeight
        If Not BackColorWait = Nothing Then BackColor = BackColorWait

        If _IsParentForm AndAlso Not _ControlMode Then
            ParentForm.FormBorderStyle = _BorderStyle
            ParentForm.TransparencyKey = _TransparencyKey
        End If

        OnCreation()
        MyBase.OnHandleCreated(e)
    End Sub

    Protected Overridable Sub OnCreation()
    End Sub

#Region " Sizing and Movement "

    Protected State As MouseState
    Private Sub SetState(ByVal current As MouseState)
        State = current
        Invalidate()
    End Sub

    Protected Overrides Sub OnMouseMove(ByVal e As MouseEventArgs)
        If _Sizable AndAlso Not _ControlMode Then InvalidateMouse()
        MyBase.OnMouseMove(e)
    End Sub

    Protected Overrides Sub OnEnabledChanged(ByVal e As EventArgs)
        If Enabled Then SetState(MouseState.None) Else SetState(MouseState.Block)
        MyBase.OnEnabledChanged(e)
    End Sub

    Protected Overrides Sub OnMouseEnter(ByVal e As EventArgs)
        SetState(MouseState.Over)
        MyBase.OnMouseEnter(e)
    End Sub

    Protected Overrides Sub OnMouseUp(ByVal e As MouseEventArgs)
        SetState(MouseState.Over)
        MyBase.OnMouseUp(e)
    End Sub

    Protected Overrides Sub OnMouseLeave(ByVal e As EventArgs)
        SetState(MouseState.None)

        If _Sizable AndAlso Not _ControlMode AndAlso GetChildAtPoint(PointToClient(MousePosition)) IsNot Nothing Then
            Cursor = Cursors.Default
            Previous = 0
        End If

        MyBase.OnMouseLeave(e)
    End Sub

    Protected Overrides Sub OnMouseDown(ByVal e As MouseEventArgs)
        MyBase.OnMouseDown(e)

        If Not e.Button = Windows.Forms.MouseButtons.Left Then Return
        SetState(MouseState.Down)

        If _IsParentForm AndAlso ParentForm.WindowState = FormWindowState.Maximized OrElse _ControlMode Then Return

        If _Movable AndAlso Header.Contains(e.Location) Then
            Capture = False
            DefWndProc(Messages(0))
        ElseIf _Sizable AndAlso Not Previous = 0 Then
            Capture = False
            DefWndProc(Messages(Previous))
        End If
    End Sub

    Private GetIndexPoint As Point
    Private B1, B2, B3, B4 As Boolean
    Private Function GetIndex() As Integer
        GetIndexPoint = PointToClient(MousePosition)
        B1 = GetIndexPoint.X < 7
        B2 = GetIndexPoint.X > Width - 7
        B3 = GetIndexPoint.Y < 7
        B4 = GetIndexPoint.Y > Height - 7

        If B1 AndAlso B3 Then Return 4
        If B1 AndAlso B4 Then Return 7
        If B2 AndAlso B3 Then Return 5
        If B2 AndAlso B4 Then Return 8
        If B1 Then Return 1
        If B2 Then Return 2
        If B3 Then Return 3
        If B4 Then Return 6
        Return 0
    End Function

    Private Current, Previous As Integer
    Private Sub InvalidateMouse()
        Current = GetIndex()
        If Current = Previous Then Return

        Previous = Current
        Select Case Previous
            Case 0
                Cursor = Cursors.Default
            Case 1, 2
                Cursor = Cursors.SizeWE
            Case 3, 6
                Cursor = Cursors.SizeNS
            Case 4, 8
                Cursor = Cursors.SizeNWSE
            Case 5, 7
                Cursor = Cursors.SizeNESW
        End Select
    End Sub

    Private Messages(8) As Message
    Private Sub InitializeMessages()
        Messages(0) = Message.Create(Parent.Handle, 161, New IntPtr(2), IntPtr.Zero)
        For I As Integer = 1 To 8
            Messages(I) = Message.Create(Parent.Handle, 161, New IntPtr(I + 9), IntPtr.Zero)
        Next
    End Sub

#End Region


#Region " Property Overrides "

    Private BackColorWait As Color
    Overrides Property BackColor() As Color
        Get
            Return MyBase.BackColor
        End Get
        Set(ByVal value As Color)
            If IsHandleCreated Then
                If Not _ControlMode Then Parent.BackColor = value
                MyBase.BackColor = value
            Else
                BackColorWait = value
            End If
        End Set
    End Property

    <Browsable(False), EditorBrowsable(EditorBrowsableState.Never), DesignerSerializationVisibility(DesignerSerializationVisibility.Hidden)> _
    Overrides Property ForeColor() As Color
        Get
            Return Color.Empty
        End Get
        Set(ByVal value As Color)
        End Set
    End Property
    <Browsable(False), EditorBrowsable(EditorBrowsableState.Never), DesignerSerializationVisibility(DesignerSerializationVisibility.Hidden)> _
    Overrides Property BackgroundImage() As Image
        Get
            Return Nothing
        End Get
        Set(ByVal value As Image)
        End Set
    End Property
    <Browsable(False), EditorBrowsable(EditorBrowsableState.Never), DesignerSerializationVisibility(DesignerSerializationVisibility.Hidden)> _
    Overrides Property BackgroundImageLayout() As ImageLayout
        Get
            Return ImageLayout.None
        End Get
        Set(ByVal value As ImageLayout)
        End Set
    End Property

    Overrides Property Text() As String
        Get
            Return MyBase.Text
        End Get
        Set(ByVal value As String)
            MyBase.Text = value
            Invalidate()
        End Set
    End Property

    Overrides Property Font() As Font
        Get
            Return MyBase.Font
        End Get
        Set(ByVal value As Font)
            MyBase.Font = value
            Invalidate()
        End Set
    End Property

#End Region

#Region " Properties "

    Private _Movable As Boolean = True
    Property Movable() As Boolean
        Get
            Return _Movable
        End Get
        Set(ByVal value As Boolean)
            _Movable = value
        End Set
    End Property

    Private _Sizable As Boolean = True
    Property Sizable() As Boolean
        Get
            Return _Sizable
        End Get
        Set(ByVal value As Boolean)
            _Sizable = value
        End Set
    End Property

    Private _MoveHeight As Integer = 24
    Protected Property MoveHeight() As Integer
        Get
            Return _MoveHeight
        End Get
        Set(ByVal v As Integer)
            If v < 8 Then Return
            Header = New Rectangle(7, 7, Width - 14, v - 7)
            _MoveHeight = v
            Invalidate()
        End Set
    End Property

    Private _ControlMode As Boolean
    Protected Property ControlMode() As Boolean
        Get
            Return _ControlMode
        End Get
        Set(ByVal v As Boolean)
            _ControlMode = v
        End Set
    End Property

    Private _TransparencyKey As Color
    Property TransparencyKey() As Color
        Get
            If _IsParentForm AndAlso Not _ControlMode Then Return ParentForm.TransparencyKey Else Return _TransparencyKey
        End Get
        Set(ByVal value As Color)
            If _IsParentForm AndAlso Not _ControlMode Then ParentForm.TransparencyKey = value
            _TransparencyKey = value
        End Set
    End Property

    Private _BorderStyle As FormBorderStyle
    Property BorderStyle() As FormBorderStyle
        Get
            If _IsParentForm AndAlso Not _ControlMode Then Return ParentForm.FormBorderStyle Else Return _BorderStyle
        End Get
        Set(ByVal value As FormBorderStyle)
            If _IsParentForm AndAlso Not _ControlMode Then ParentForm.FormBorderStyle = value
            _BorderStyle = value
        End Set
    End Property

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
            If value Is Nothing Then
                _ImageSize = Size.Empty
            Else
                _ImageSize = value.Size
            End If

            _Image = value
            Invalidate()
        End Set
    End Property

    Private _ImageSize As Size
    Protected ReadOnly Property ImageSize() As Size
        Get
            Return _ImageSize
        End Get
    End Property

    Private _IsParentForm As Boolean
    Protected ReadOnly Property IsParentForm As Boolean
        Get
            Return _IsParentForm
        End Get
    End Property

    Private _LockWidth As Integer
    Protected Property LockWidth() As Integer
        Get
            Return _LockWidth
        End Get
        Set(ByVal value As Integer)
            _LockWidth = value
            If Not LockWidth = 0 AndAlso IsHandleCreated Then Width = LockWidth
        End Set
    End Property

    Private _LockHeight As Integer
    Protected Property LockHeight() As Integer
        Get
            Return _LockHeight
        End Get
        Set(ByVal value As Integer)
            _LockHeight = value
            If Not LockHeight = 0 AndAlso IsHandleCreated Then Height = LockHeight
        End Set
    End Property

    Private Items As New Dictionary(Of String, Color)
    <DesignerSerializationVisibility(DesignerSerializationVisibility.Content)> _
    Property Colors() As Bloom()
        Get
            Dim T As New List(Of Bloom)
            Dim E As Dictionary(Of String, Color).Enumerator = Items.GetEnumerator

            While E.MoveNext
                T.Add(New Bloom(E.Current.Key, E.Current.Value))
            End While

            Return T.ToArray
        End Get
        Set(ByVal value As Bloom())
            For Each B As Bloom In value
                If Items.ContainsKey(B.Name) Then Items(B.Name) = B.Value
            Next

            InvalidateCustimization()
            ColorHook()
            Invalidate()
        End Set
    End Property

    Private _Customization As String
    Property Customization() As String
        Get
            Return _Customization
        End Get
        Set(ByVal value As String)
            If value = _Customization Then Return

            Dim Data As Byte()
            Dim Items As Bloom() = Colors

            Try
                Data = Convert.FromBase64String(value)
                For I As Integer = 0 To Items.Length - 1
                    Items(I).Value = Color.FromArgb(BitConverter.ToInt32(Data, I * 4))
                Next
            Catch
                Return
            End Try

            _Customization = value

            Colors = Items
            ColorHook()
            Invalidate()
        End Set
    End Property

#End Region

#Region " Property Helpers "

    Protected Function GetColor(ByVal name As String) As Color
        Return Items(name)
    End Function

    Protected Sub SetColor(ByVal name As String, ByVal color As Color)
        If Items.ContainsKey(name) Then Items(name) = color Else Items.Add(name, color)
    End Sub
    Protected Sub SetColor(ByVal name As String, ByVal r As Byte, ByVal g As Byte, ByVal b As Byte)
        SetColor(name, Color.FromArgb(r, g, b))
    End Sub
    Protected Sub SetColor(ByVal name As String, ByVal a As Byte, ByVal r As Byte, ByVal g As Byte, ByVal b As Byte)
        SetColor(name, Color.FromArgb(a, r, g, b))
    End Sub
    Protected Sub SetColor(ByVal name As String, ByVal a As Byte, ByVal color As Color)
        SetColor(name, color.FromArgb(a, color))
    End Sub

    Private Sub InvalidateCustimization()
        Dim M As New MemoryStream(Items.Count * 4)

        For Each B As Bloom In Colors
            M.Write(BitConverter.GetBytes(B.Value.ToArgb), 0, 4)
        Next

        M.Close()
        _Customization = Convert.ToBase64String(M.ToArray)
    End Sub

#End Region


#Region " User Hooks "

    Protected MustOverride Sub ColorHook()
    Protected MustOverride Sub PaintHook()

#End Region


#Region " Center Overloads "

    Private CenterReturn As Point

    Protected Function Center(ByVal r1 As Rectangle, ByVal s1 As Size) As Point
        CenterReturn = New Point((r1.Width \ 2 - s1.Width \ 2) + r1.X, (r1.Height \ 2 - s1.Height \ 2) + r1.Y)
        Return CenterReturn
    End Function
    Protected Function Center(ByVal r1 As Rectangle, ByVal r2 As Rectangle) As Point
        Return Center(r1, r2.Size)
    End Function

    Protected Function Center(ByVal w1 As Integer, ByVal h1 As Integer, ByVal w2 As Integer, ByVal h2 As Integer) As Point
        CenterReturn = New Point(w1 \ 2 - w2 \ 2, h1 \ 2 - h2 \ 2)
        Return CenterReturn
    End Function

    Protected Function Center(ByVal s1 As Size, ByVal s2 As Size) As Point
        Return Center(s1.Width, s1.Height, s2.Width, s2.Height)
    End Function

    Protected Function Center(ByVal r1 As Rectangle) As Point
        Return Center(ClientRectangle.Width, ClientRectangle.Height, r1.Width, r1.Height)
    End Function
    Protected Function Center(ByVal s1 As Size) As Point
        Return Center(Width, Height, s1.Width, s1.Height)
    End Function
    Protected Function Center(ByVal w1 As Integer, ByVal h1 As Integer) As Point
        Return Center(Width, Height, w1, h1)
    End Function

#End Region

#Region " Measure Overloads "

    Private MeasureBitmap As Bitmap
    Private MeasureGraphics As Graphics

    Protected Function Measure(ByVal text As String) As Size
        Return MeasureGraphics.MeasureString(text, Font, Width).ToSize
    End Function
    Protected Function Measure() As Size
        Return MeasureGraphics.MeasureString(Text, Font).ToSize
    End Function

#End Region

#Region " DrawCorners Overloads "

    'TODO: Optimize by checking brush color

    Private DrawCornersBrush As SolidBrush

    Protected Sub DrawCorners(ByVal c1 As Color)
        DrawCorners(c1, 0, 0, Width, Height)
    End Sub
    Protected Sub DrawCorners(ByVal c1 As Color, ByVal r1 As Rectangle)
        DrawCorners(c1, r1.X, r1.Y, r1.Width, r1.Height)
    End Sub
    Protected Sub DrawCorners(ByVal c1 As Color, ByVal x As Integer, ByVal y As Integer, ByVal width As Integer, ByVal height As Integer)
        If _NoRounding Then Return

        DrawCornersBrush = New SolidBrush(c1)
        G.FillRectangle(DrawCornersBrush, x, y, 1, 1)
        G.FillRectangle(DrawCornersBrush, x + (width - 1), y, 1, 1)
        G.FillRectangle(DrawCornersBrush, x, y + (height - 1), 1, 1)
        G.FillRectangle(DrawCornersBrush, x + (width - 1), y + (height - 1), 1, 1)
    End Sub

#End Region

#Region " DrawBorders Overloads "

    'TODO: Remove triple overload?

    Protected Sub DrawBorders(ByVal p1 As Pen, ByVal x As Integer, ByVal y As Integer, ByVal width As Integer, ByVal height As Integer, ByVal offset As Integer)
        DrawBorders(p1, x + offset, y + offset, width - (offset * 2), height - (offset * 2))
    End Sub
    Protected Sub DrawBorders(ByVal p1 As Pen, ByVal offset As Integer)
        DrawBorders(p1, 0, 0, Width, Height, offset)
    End Sub
    Protected Sub DrawBorders(ByVal p1 As Pen, ByVal r As Rectangle, ByVal offset As Integer)
        DrawBorders(p1, r.X, r.Y, r.Width, r.Height, offset)
    End Sub

    Protected Sub DrawBorders(ByVal p1 As Pen, ByVal x As Integer, ByVal y As Integer, ByVal width As Integer, ByVal height As Integer)
        G.DrawRectangle(p1, x, y, width - 1, height - 1)
    End Sub
    Protected Sub DrawBorders(ByVal p1 As Pen)
        DrawBorders(p1, 0, 0, Width, Height)
    End Sub
    Protected Sub DrawBorders(ByVal p1 As Pen, ByVal r As Rectangle)
        DrawBorders(p1, r.X, r.Y, r.Width, r.Height)
    End Sub

#End Region

#Region " DrawText Overloads "

    'TODO: Remove triple overloads?

    Private DrawTextPoint As Point
    Private DrawTextSize As Size

    Protected Sub DrawText(ByVal b1 As Brush, ByVal a As HorizontalAlignment, ByVal x As Integer, ByVal y As Integer)
        DrawText(b1, Text, a, x, y)
    End Sub
    Protected Sub DrawText(ByVal b1 As Brush, ByVal p1 As Point)
        DrawText(b1, Text, p1.X, p1.Y)
    End Sub
    Protected Sub DrawText(ByVal b1 As Brush, ByVal x As Integer, ByVal y As Integer)
        DrawText(b1, Text, x, y)
    End Sub

    Protected Sub DrawText(ByVal b1 As Brush, ByVal text As String, ByVal a As HorizontalAlignment, ByVal x As Integer, ByVal y As Integer)
        If text.Length = 0 Then Return
        DrawTextSize = Measure(text)
        DrawTextPoint = New Point(Width \ 2 - DrawTextSize.Width \ 2, MoveHeight \ 2 - DrawTextSize.Height \ 2)

        Select Case a
            Case HorizontalAlignment.Left
                DrawText(b1, text, x, DrawTextPoint.Y + y)
            Case HorizontalAlignment.Center
                DrawText(b1, text, DrawTextPoint.X + x, DrawTextPoint.Y + y)
            Case HorizontalAlignment.Right
                DrawText(b1, text, Width - DrawTextSize.Width - x, DrawTextPoint.Y + y)
        End Select
    End Sub
    Protected Sub DrawText(ByVal b1 As Brush, ByVal text As String, ByVal p1 As Point)
        DrawText(b1, text, p1.X, p1.Y)
    End Sub
    Protected Sub DrawText(ByVal b1 As Brush, ByVal text As String, ByVal x As Integer, ByVal y As Integer)
        If text.Length = 0 Then Return
        G.DrawString(text, Font, b1, x, y)
    End Sub

#End Region

#Region " DrawImage Overloads "

    'TODO: Remove triple overloads?

    Private DrawImagePoint As Point

    Protected Sub DrawImage(ByVal a As HorizontalAlignment, ByVal x As Integer, ByVal y As Integer)
        DrawImage(_Image, a, x, y)
    End Sub
    Protected Sub DrawImage(ByVal p1 As Point)
        DrawImage(_Image, p1.X, p1.Y)
    End Sub
    Protected Sub DrawImage(ByVal x As Integer, ByVal y As Integer)
        DrawImage(_Image, x, y)
    End Sub

    Protected Sub DrawImage(ByVal image As Image, ByVal a As HorizontalAlignment, ByVal x As Integer, ByVal y As Integer)
        If image Is Nothing Then Return
        DrawImagePoint = New Point(Width \ 2 - image.Width \ 2, MoveHeight \ 2 - image.Height \ 2)

        Select Case a
            Case HorizontalAlignment.Left
                DrawImage(image, x, DrawImagePoint.Y + y)
            Case HorizontalAlignment.Center
                DrawImage(image, DrawImagePoint.X + x, DrawImagePoint.Y + y)
            Case HorizontalAlignment.Right
                DrawImage(image, Width - image.Width - x, DrawImagePoint.Y + y)
        End Select
    End Sub
    Protected Sub DrawImage(ByVal image As Image, ByVal p1 As Point)
        DrawImage(image, p1.X, p1.Y)
    End Sub
    Protected Sub DrawImage(ByVal image As Image, ByVal x As Integer, ByVal y As Integer)
        If image Is Nothing Then Return
        G.DrawImage(image, x, y, image.Width, image.Height)
    End Sub

#End Region

#Region " DrawGradient Overloads "

    'TODO: Remove triple overload?

    Private DrawGradientBrush As LinearGradientBrush
    Private DrawGradientRectangle As Rectangle

    Protected Sub DrawGradient(ByVal blend As ColorBlend, ByVal x As Integer, ByVal y As Integer, ByVal width As Integer, ByVal height As Integer)
        DrawGradient(blend, x, y, width, height, 90S)
    End Sub
    Protected Sub DrawGradient(ByVal c1 As Color, ByVal c2 As Color, ByVal x As Integer, ByVal y As Integer, ByVal width As Integer, ByVal height As Integer)
        DrawGradient(c1, c2, x, y, width, height, 90S)
    End Sub

    Protected Sub DrawGradient(ByVal blend As ColorBlend, ByVal x As Integer, ByVal y As Integer, ByVal width As Integer, ByVal height As Integer, ByVal angle As Single)
        DrawGradientRectangle = New Rectangle(x, y, width, height)
        DrawGradient(blend, DrawGradientRectangle, angle)
    End Sub
    Protected Sub DrawGradient(ByVal c1 As Color, ByVal c2 As Color, ByVal x As Integer, ByVal y As Integer, ByVal width As Integer, ByVal height As Integer, ByVal angle As Single)
        DrawGradientRectangle = New Rectangle(x, y, width, height)
        DrawGradient(c1, c2, DrawGradientRectangle, angle)
    End Sub

    Protected Sub DrawGradient(ByVal blend As ColorBlend, ByVal r As Rectangle, ByVal angle As Single)
        DrawGradientBrush = New LinearGradientBrush(r, Color.Empty, Color.Empty, angle)
        DrawGradientBrush.InterpolationColors = blend
        G.FillRectangle(DrawGradientBrush, r)
    End Sub
    Protected Sub DrawGradient(ByVal c1 As Color, ByVal c2 As Color, ByVal r As Rectangle, ByVal angle As Single)
        DrawGradientBrush = New LinearGradientBrush(r, c1, c2, angle)
        G.FillRectangle(DrawGradientBrush, r)
    End Sub

#End Region

End Class

MustInherit Class ThemeControl
    Inherits Control

    Protected G As Graphics, B As Bitmap

    Sub New()
        SetStyle(DirectCast(139270, ControlStyles), True)

        _ImageSize = Size.Empty

        MeasureBitmap = New Bitmap(1, 1)
        MeasureGraphics = Graphics.FromImage(MeasureBitmap)

        Font = New Font("Verdana", 8S)

        InvalidateCustimization()
    End Sub

    Protected Overrides Sub SetBoundsCore(ByVal x As Integer, ByVal y As Integer, ByVal width As Integer, ByVal height As Integer, ByVal specified As BoundsSpecified)
        If Not _LockWidth = 0 Then width = _LockWidth
        If Not _LockHeight = 0 Then height = _LockHeight
        MyBase.SetBoundsCore(x, y, width, height, specified)
    End Sub

    Protected NotOverridable Overrides Sub OnSizeChanged(ByVal e As EventArgs)
        If _Transparent AndAlso Not (Width = 0 OrElse Height = 0) Then
            B = New Bitmap(Width, Height)
            G = Graphics.FromImage(B)
        End If

        Invalidate()
        MyBase.OnSizeChanged(e)
    End Sub

    Protected NotOverridable Overrides Sub OnPaint(ByVal e As PaintEventArgs)
        If Width = 0 OrElse Height = 0 Then Return

        If _Transparent Then
            PaintHook()
            e.Graphics.DrawImage(B, 0, 0)
        Else
            G = e.Graphics
            PaintHook()
        End If
    End Sub

    Protected Overrides Sub OnHandleCreated(ByVal e As EventArgs)
        InvalidateCustimization()
        ColorHook()

        If Not _LockWidth = 0 Then Width = _LockWidth
        If Not _LockHeight = 0 Then Height = _LockHeight
        If Not BackColorWait = Nothing Then BackColor = BackColorWait

        OnCreation()
        MyBase.OnHandleCreated(e)
    End Sub

    Protected Overridable Sub OnCreation()
    End Sub

#Region " State Handling "

    Protected Overrides Sub OnMouseEnter(ByVal e As EventArgs)
        SetState(MouseState.Over)
        MyBase.OnMouseEnter(e)
    End Sub

    Protected Overrides Sub OnMouseUp(ByVal e As MouseEventArgs)
        SetState(MouseState.Over)
        MyBase.OnMouseUp(e)
    End Sub

    Protected Overrides Sub OnMouseDown(ByVal e As MouseEventArgs)
        If e.Button = Windows.Forms.MouseButtons.Left Then SetState(MouseState.Down)
        MyBase.OnMouseDown(e)
    End Sub

    Protected Overrides Sub OnMouseLeave(ByVal e As EventArgs)
        SetState(MouseState.None)
        MyBase.OnMouseLeave(e)
    End Sub

    Protected Overrides Sub OnEnabledChanged(ByVal e As EventArgs)
        If Enabled Then SetState(MouseState.None) Else SetState(MouseState.Block)
        MyBase.OnEnabledChanged(e)
    End Sub

    Protected State As MouseState
    Private Sub SetState(ByVal current As MouseState)
        State = current
        Invalidate()
    End Sub

#End Region


#Region " Property Overrides "

    Private BackColorWait As Color
    Overrides Property BackColor() As Color
        Get
            Return MyBase.BackColor
        End Get
        Set(ByVal value As Color)
            If IsHandleCreated Then
                MyBase.BackColor = value
            Else
                BackColorWait = value
            End If
        End Set
    End Property

    <Browsable(False), EditorBrowsable(EditorBrowsableState.Never), DesignerSerializationVisibility(DesignerSerializationVisibility.Hidden)> _
    Overrides Property ForeColor() As Color
        Get
            Return Color.Empty
        End Get
        Set(ByVal value As Color)
        End Set
    End Property
    <Browsable(False), EditorBrowsable(EditorBrowsableState.Never), DesignerSerializationVisibility(DesignerSerializationVisibility.Hidden)> _
    Overrides Property BackgroundImage() As Image
        Get
            Return Nothing
        End Get
        Set(ByVal value As Image)
        End Set
    End Property
    <Browsable(False), EditorBrowsable(EditorBrowsableState.Never), DesignerSerializationVisibility(DesignerSerializationVisibility.Hidden)> _
    Overrides Property BackgroundImageLayout() As ImageLayout
        Get
            Return ImageLayout.None
        End Get
        Set(ByVal value As ImageLayout)
        End Set
    End Property

    Overrides Property Text() As String
        Get
            Return MyBase.Text
        End Get
        Set(ByVal value As String)
            MyBase.Text = value
            Invalidate()
        End Set
    End Property

    Overrides Property Font() As Font
        Get
            Return MyBase.Font
        End Get
        Set(ByVal value As Font)
            MyBase.Font = value
            Invalidate()
        End Set
    End Property

#End Region

#Region " Properties "

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
            If value Is Nothing Then
                _ImageSize = Size.Empty
            Else
                _ImageSize = value.Size
            End If

            _Image = value
            Invalidate()
        End Set
    End Property

    Private _ImageSize As Size
    Protected ReadOnly Property ImageSize() As Size
        Get
            Return _ImageSize
        End Get
    End Property

    Private _LockWidth As Integer
    Protected Property LockWidth() As Integer
        Get
            Return _LockWidth
        End Get
        Set(ByVal value As Integer)
            _LockWidth = value
            If Not LockWidth = 0 AndAlso IsHandleCreated Then Width = LockWidth
        End Set
    End Property

    Private _LockHeight As Integer
    Protected Property LockHeight() As Integer
        Get
            Return _LockHeight
        End Get
        Set(ByVal value As Integer)
            _LockHeight = value
            If Not LockHeight = 0 AndAlso IsHandleCreated Then Height = LockHeight
        End Set
    End Property

    Private _Transparent As Boolean
    Property Transparent() As Boolean
        Get
            Return _Transparent
        End Get
        Set(ByVal value As Boolean)
            If Not value AndAlso Not BackColor.A = 255 Then
                Throw New Exception("Unable to change value to false while a transparent BackColor is in use.")
            End If

            SetStyle(ControlStyles.Opaque, Not value)
            SetStyle(ControlStyles.SupportsTransparentBackColor, value)

            If value Then InvalidateBitmap() Else B = Nothing

            _Transparent = value
            Invalidate()
        End Set
    End Property

    Private Items As New Dictionary(Of String, Color)
    <DesignerSerializationVisibility(DesignerSerializationVisibility.Content)> _
    Property Colors() As Bloom()
        Get
            Dim T As New List(Of Bloom)
            Dim E As Dictionary(Of String, Color).Enumerator = Items.GetEnumerator

            While E.MoveNext
                T.Add(New Bloom(E.Current.Key, E.Current.Value))
            End While

            Return T.ToArray
        End Get
        Set(ByVal value As Bloom())
            For Each B As Bloom In value
                If Items.ContainsKey(B.Name) Then Items(B.Name) = B.Value
            Next

            InvalidateCustimization()
            ColorHook()
            Invalidate()
        End Set
    End Property

    Private _Customization As String
    Property Customization() As String
        Get
            Return _Customization
        End Get
        Set(ByVal value As String)
            If value = _Customization Then Return

            Dim Data As Byte()
            Dim Items As Bloom() = Colors

            Try
                Data = Convert.FromBase64String(value)
                For I As Integer = 0 To Items.Length - 1
                    Items(I).Value = Color.FromArgb(BitConverter.ToInt32(Data, I * 4))
                Next
            Catch
                Return
            End Try

            _Customization = value

            Colors = Items
            ColorHook()
            Invalidate()
        End Set
    End Property

#End Region

#Region " Property Helpers "

    Private Sub InvalidateBitmap()
        If Width = 0 OrElse Height = 0 Then Return
        B = New Bitmap(Width, Height)
        G = Graphics.FromImage(B)
    End Sub

    Protected Function GetColor(ByVal name As String) As Color
        Return Items(name)
    End Function

    Protected Sub SetColor(ByVal name As String, ByVal color As Color)
        If Items.ContainsKey(name) Then Items(name) = color Else Items.Add(name, color)
    End Sub
    Protected Sub SetColor(ByVal name As String, ByVal r As Byte, ByVal g As Byte, ByVal b As Byte)
        SetColor(name, Color.FromArgb(r, g, b))
    End Sub
    Protected Sub SetColor(ByVal name As String, ByVal a As Byte, ByVal r As Byte, ByVal g As Byte, ByVal b As Byte)
        SetColor(name, Color.FromArgb(a, r, g, b))
    End Sub
    Protected Sub SetColor(ByVal name As String, ByVal a As Byte, ByVal color As Color)
        SetColor(name, color.FromArgb(a, color))
    End Sub

    Private Sub InvalidateCustimization()
        Dim M As New MemoryStream(Items.Count * 4)

        For Each B As Bloom In Colors
            M.Write(BitConverter.GetBytes(B.Value.ToArgb), 0, 4)
        Next

        M.Close()
        _Customization = Convert.ToBase64String(M.ToArray)
    End Sub

#End Region


#Region " User Hooks "

    Protected MustOverride Sub ColorHook()
    Protected MustOverride Sub PaintHook()

#End Region


#Region " Center Overloads "

    Private CenterReturn As Point

    Protected Function Center(ByVal r1 As Rectangle, ByVal s1 As Size) As Point
        CenterReturn = New Point((r1.Width \ 2 - s1.Width \ 2) + r1.X, (r1.Height \ 2 - s1.Height \ 2) + r1.Y)
        Return CenterReturn
    End Function
    Protected Function Center(ByVal r1 As Rectangle, ByVal r2 As Rectangle) As Point
        Return Center(r1, r2.Size)
    End Function

    Protected Function Center(ByVal w1 As Integer, ByVal h1 As Integer, ByVal w2 As Integer, ByVal h2 As Integer) As Point
        CenterReturn = New Point(w1 \ 2 - w2 \ 2, h1 \ 2 - h2 \ 2)
        Return CenterReturn
    End Function

    Protected Function Center(ByVal s1 As Size, ByVal s2 As Size) As Point
        Return Center(s1.Width, s1.Height, s2.Width, s2.Height)
    End Function

    Protected Function Center(ByVal r1 As Rectangle) As Point
        Return Center(ClientRectangle.Width, ClientRectangle.Height, r1.Width, r1.Height)
    End Function
    Protected Function Center(ByVal s1 As Size) As Point
        Return Center(Width, Height, s1.Width, s1.Height)
    End Function
    Protected Function Center(ByVal w1 As Integer, ByVal h1 As Integer) As Point
        Return Center(Width, Height, w1, h1)
    End Function

#End Region

#Region " Measure Overloads "

    Private MeasureBitmap As Bitmap
    Private MeasureGraphics As Graphics

    Protected Function Measure(ByVal text As String) As Size
        Return MeasureGraphics.MeasureString(text, Font, Width).ToSize
    End Function
    Protected Function Measure() As Size
        Return MeasureGraphics.MeasureString(Text, Font, Width).ToSize
    End Function

#End Region

#Region " DrawCorners Overloads "

    'TODO: Optimize by checking brush color

    Private DrawCornersBrush As SolidBrush

    Protected Sub DrawCorners(ByVal c1 As Color)
        DrawCorners(c1, 0, 0, Width, Height)
    End Sub
    Protected Sub DrawCorners(ByVal c1 As Color, ByVal r1 As Rectangle)
        DrawCorners(c1, r1.X, r1.Y, r1.Width, r1.Height)
    End Sub
    Protected Sub DrawCorners(ByVal c1 As Color, ByVal x As Integer, ByVal y As Integer, ByVal width As Integer, ByVal height As Integer)
        If _NoRounding Then Return

        If _Transparent Then
            B.SetPixel(x, y, c1)
            B.SetPixel(x + (width - 1), y, c1)
            B.SetPixel(x, y + (height - 1), c1)
            B.SetPixel(x + (width - 1), y + (height - 1), c1)
        Else
            DrawCornersBrush = New SolidBrush(c1)
            G.FillRectangle(DrawCornersBrush, x, y, 1, 1)
            G.FillRectangle(DrawCornersBrush, x + (width - 1), y, 1, 1)
            G.FillRectangle(DrawCornersBrush, x, y + (height - 1), 1, 1)
            G.FillRectangle(DrawCornersBrush, x + (width - 1), y + (height - 1), 1, 1)
        End If
    End Sub

#End Region

#Region " DrawBorders Overloads "

    'TODO: Remove triple overload?

    Protected Sub DrawBorders(ByVal p1 As Pen, ByVal x As Integer, ByVal y As Integer, ByVal width As Integer, ByVal height As Integer, ByVal offset As Integer)
        DrawBorders(p1, x + offset, y + offset, width - (offset * 2), height - (offset * 2))
    End Sub
    Protected Sub DrawBorders(ByVal p1 As Pen, ByVal offset As Integer)
        DrawBorders(p1, 0, 0, Width, Height, offset)
    End Sub
    Protected Sub DrawBorders(ByVal p1 As Pen, ByVal r As Rectangle, ByVal offset As Integer)
        DrawBorders(p1, r.X, r.Y, r.Width, r.Height, offset)
    End Sub

    Protected Sub DrawBorders(ByVal p1 As Pen, ByVal x As Integer, ByVal y As Integer, ByVal width As Integer, ByVal height As Integer)
        G.DrawRectangle(p1, x, y, width - 1, height - 1)
    End Sub
    Protected Sub DrawBorders(ByVal p1 As Pen)
        DrawBorders(p1, 0, 0, Width, Height)
    End Sub
    Protected Sub DrawBorders(ByVal p1 As Pen, ByVal r As Rectangle)
        DrawBorders(p1, r.X, r.Y, r.Width, r.Height)
    End Sub

#End Region

#Region " DrawText Overloads "

    'TODO: Remove triple overloads?

    Private DrawTextPoint As Point
    Private DrawTextSize As Size

    Protected Sub DrawText(ByVal b1 As Brush, ByVal a As HorizontalAlignment, ByVal x As Integer, ByVal y As Integer)
        DrawText(b1, Text, a, x, y)
    End Sub
    Protected Sub DrawText(ByVal b1 As Brush, ByVal p1 As Point)
        DrawText(b1, Text, p1.X, p1.Y)
    End Sub
    Protected Sub DrawText(ByVal b1 As Brush, ByVal x As Integer, ByVal y As Integer)
        DrawText(b1, Text, x, y)
    End Sub

    Protected Sub DrawText(ByVal b1 As Brush, ByVal text As String, ByVal a As HorizontalAlignment, ByVal x As Integer, ByVal y As Integer)
        If text.Length = 0 Then Return
        DrawTextSize = Measure(text)
        DrawTextPoint = Center(DrawTextSize)

        Select Case a
            Case HorizontalAlignment.Left
                DrawText(b1, text, x, DrawTextPoint.Y + y)
            Case HorizontalAlignment.Center
                DrawText(b1, text, DrawTextPoint.X + x, DrawTextPoint.Y + y)
            Case HorizontalAlignment.Right
                DrawText(b1, text, Width - DrawTextSize.Width - x, DrawTextPoint.Y + y)
        End Select
    End Sub
    Protected Sub DrawText(ByVal b1 As Brush, ByVal text As String, ByVal p1 As Point)
        DrawText(b1, text, p1.X, p1.Y)
    End Sub
    Protected Sub DrawText(ByVal b1 As Brush, ByVal text As String, ByVal x As Integer, ByVal y As Integer)
        If text.Length = 0 Then Return
        G.DrawString(text, Font, b1, x, y)
    End Sub

#End Region

#Region " DrawImage Overloads "

    'TODO: Remove triple overloads?

    Private DrawImagePoint As Point

    Protected Sub DrawImage(ByVal a As HorizontalAlignment, ByVal x As Integer, ByVal y As Integer)
        DrawImage(_Image, a, x, y)
    End Sub
    Protected Sub DrawImage(ByVal p1 As Point)
        DrawImage(_Image, p1.X, p1.Y)
    End Sub
    Protected Sub DrawImage(ByVal x As Integer, ByVal y As Integer)
        DrawImage(_Image, x, y)
    End Sub

    Protected Sub DrawImage(ByVal image As Image, ByVal a As HorizontalAlignment, ByVal x As Integer, ByVal y As Integer)
        If image Is Nothing Then Return
        DrawImagePoint = Center(image.Size)

        Select Case a
            Case HorizontalAlignment.Left
                DrawImage(image, x, DrawImagePoint.Y + y)
            Case HorizontalAlignment.Center
                DrawImage(image, DrawImagePoint.X + x, DrawImagePoint.Y + y)
            Case HorizontalAlignment.Right
                DrawImage(image, Width - image.Width - x, DrawImagePoint.Y + y)
        End Select
    End Sub
    Protected Sub DrawImage(ByVal image As Image, ByVal p1 As Point)
        DrawImage(image, p1.X, p1.Y)
    End Sub
    Protected Sub DrawImage(ByVal image As Image, ByVal x As Integer, ByVal y As Integer)
        If image Is Nothing Then Return
        G.DrawImage(image, x, y, image.Width, image.Height)
    End Sub

#End Region

#Region " DrawGradient Overloads "

    'TODO: Remove triple overload?

    Private DrawGradientBrush As LinearGradientBrush
    Private DrawGradientRectangle As Rectangle

    Protected Sub DrawGradient(ByVal blend As ColorBlend, ByVal x As Integer, ByVal y As Integer, ByVal width As Integer, ByVal height As Integer)
        DrawGradient(blend, x, y, width, height, 90S)
    End Sub
    Protected Sub DrawGradient(ByVal c1 As Color, ByVal c2 As Color, ByVal x As Integer, ByVal y As Integer, ByVal width As Integer, ByVal height As Integer)
        DrawGradient(c1, c2, x, y, width, height, 90S)
    End Sub

    Protected Sub DrawGradient(ByVal blend As ColorBlend, ByVal x As Integer, ByVal y As Integer, ByVal width As Integer, ByVal height As Integer, ByVal angle As Single)
        DrawGradientRectangle = New Rectangle(x, y, width, height)
        DrawGradient(blend, DrawGradientRectangle, angle)
    End Sub
    Protected Sub DrawGradient(ByVal c1 As Color, ByVal c2 As Color, ByVal x As Integer, ByVal y As Integer, ByVal width As Integer, ByVal height As Integer, ByVal angle As Single)
        DrawGradientRectangle = New Rectangle(x, y, width, height)
        DrawGradient(c1, c2, DrawGradientRectangle, angle)
    End Sub

    Protected Sub DrawGradient(ByVal blend As ColorBlend, ByVal r As Rectangle, ByVal angle As Single)
        DrawGradientBrush = New LinearGradientBrush(r, Color.Empty, Color.Empty, angle)
        DrawGradientBrush.InterpolationColors = blend
        G.FillRectangle(DrawGradientBrush, r)
    End Sub
    Protected Sub DrawGradient(ByVal c1 As Color, ByVal c2 As Color, ByVal r As Rectangle, ByVal angle As Single)
        DrawGradientBrush = New LinearGradientBrush(r, c1, c2, angle)
        G.FillRectangle(DrawGradientBrush, r)
    End Sub

#End Region
End Class
