Option Strict On
Option Explicit On


Public Class Rotating_Label
    Inherits System.Windows.Forms.Label

    Protected Overrides Sub OnPaint(ByVal e As System.Windows.Forms.PaintEventArgs)
        'variables to capture the size of the text area
        Dim width As Double = e.Graphics.MeasureString(Text, Me.Font).Width
        Dim height As Double = e.Graphics.MeasureString(Text, Me.Font).Height
        'convert the rotation angle into radians for trig functions
        Dim angleRadian As Double = ((_rotationAngle Mod 360) / 180) * Math.PI
        'capture the forground color as a brush
        Dim myBrush As Brush = New SolidBrush(Me.ForeColor)

        If _quadrantMode = True Then
            'Quad I
            If (_rotationAngle >= 0 AndAlso _rotationAngle < 90) Or (_rotationAngle < -270 AndAlso _rotationAngle >= -360) Then
                e.Graphics.TranslateTransform(CInt(Math.Sin(angleRadian) * height), 0)
                'Quad II
            ElseIf (_rotationAngle >= 90 AndAlso _rotationAngle < 180) Or (_rotationAngle < -180 AndAlso _rotationAngle >= -270) Then
                e.Graphics.TranslateTransform(ClientRectangle.Width, CInt(height - (Math.Sin(angleRadian) * height)))
                'Quad III
            ElseIf (_rotationAngle >= 180 AndAlso _rotationAngle < 270) Or (_rotationAngle < -90 AndAlso _rotationAngle >= -180) Then
                e.Graphics.TranslateTransform(ClientRectangle.Width + CInt(Math.Sin(angleRadian) * height), ClientRectangle.Height)
            Else 'Quad IV
                e.Graphics.TranslateTransform(0, ClientRectangle.Height - CInt(Math.Cos(angleRadian) * height))
            End If
        Else 'Center Mode
            e.Graphics.TranslateTransform(CInt((ClientRectangle.Width + (height * Math.Sin(angleRadian)) - (width * Math.Cos(angleRadian))) / 2), CInt((ClientRectangle.Height - (height * Math.Cos(angleRadian)) - (width * Math.Sin(angleRadian))) / 2))
        End If

        'Make the actual rotation,and draw the string
        e.Graphics.RotateTransform(CInt(_rotationAngle))
        e.Graphics.DrawString(Me.Text, Me.Font, myBrush, 0, 0)
        e.Graphics.ResetTransform()

    End Sub
    'Priviate Variables
    Private _rotationAngle As Integer
    Private _quadrantMode As Boolean

    'Properties
    Public Property rotationAngle() As Integer
        Get
            Return _rotationAngle
        End Get
        Set(ByVal Value As Integer)
            _rotationAngle = Value
            MyBase.Refresh()
        End Set
    End Property

    Public Property quadrantMode() As Boolean
        Get
            Return _quadrantMode
        End Get
        Set(ByVal Value As Boolean)
            _quadrantMode = Value
            MyBase.Refresh()
        End Set
    End Property


End Class

