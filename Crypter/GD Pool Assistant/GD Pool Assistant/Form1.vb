Public Class Form1
    Private m_Drawing As Boolean
    Private m_BufferBitmap As Bitmap
    Private m_BufferGraphics As Graphics
    Private m_X1, m_Y1, m_X2, m_Y2 As Integer
    Dim PEN_Color As Color = Color.Black
    Dim pen_size As Integer = 1

    Private Sub Form1_MouseDown(ByVal sender As Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles MyBase.MouseDown
        If e.Button <> MouseButtons.Left Then Exit Sub
        Try
            m_BufferGraphics.Clear(Me.BackColor)
        Catch ex As Exception
        End Try
        m_Drawing = True
        ' Save a snapshot of the form.
        SaveSnapshot()
        ' Save the current mouse position.
        m_X1 = e.X
        m_X2 = e.X
        m_Y1 = e.Y
        m_Y2 = e.Y
    End Sub

    Private Sub SaveSnapshot()
        Dim new_bitmap As Bitmap

        ' Make a new bitmap that fits the form.
        new_bitmap = New Bitmap(Me.Size.Width, Me.Size.Height, Me.CreateGraphics())
        m_BufferGraphics = Graphics.FromImage(new_bitmap)

        ' Clear the new bitmap.
        m_BufferGraphics.Clear(Me.BackColor)

        ' Copy the existing bitmap's contents into
        ' the new bitmap.
        If Not (m_BufferBitmap Is Nothing) Then
            m_BufferGraphics.DrawImage(m_BufferBitmap, 0, 0)
        End If

        ' Save the new bitmap and graphics objects.
        m_BufferBitmap = new_bitmap
    End Sub

    ' Continue drawing the rubberband line.
    Private Sub Form1_MouseMove(ByVal sender As Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles MyBase.MouseMove
        ' Do nothing if we're not drawing.
        If Not m_Drawing Then Exit Sub

        ' Save the new point.
        m_X2 = e.X
        m_Y2 = e.Y

        ' Erase the previous line.
        DrawForm(Me.CreateGraphics())
        pen_size = textbox1.Text
        Dim PenColor As New Pen(PEN_Color, pen_size)
        ' Draw the new line directly on the form.
        Me.CreateGraphics.DrawLine(PenColor, m_X1, m_Y1, m_X2, m_Y2)
    End Sub

    ' Redraw the saved buffer.
    Private Sub DrawForm(ByVal gr As Graphics)
        If Not (m_BufferBitmap Is Nothing) Then gr.DrawImage(m_BufferBitmap, 0, 0)
    End Sub

    ' Finish drawing the new line.
    Private Sub Form1_MouseUp(ByVal sender As Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles MyBase.MouseUp
        ' Do nothing if we're not drawing.
        If Not m_Drawing Then Exit Sub
        m_Drawing = False

        ' Save the new point.
        m_X2 = e.X
        m_Y2 = e.Y
        Dim p As Point
        p.X = e.X
        p.Y = e.Y
        ' Draw the new line permanently on the buffer.
        pen_size = textbox1.Text
        Dim PenColor As New Pen(PEN_Color, pen_size)

        m_BufferGraphics.DrawLine(PenColor, m_X1, m_Y1, m_X2, m_Y2)

        Dim a As Integer = m_X2 * Math.PI / 180
        Dim b As Integer = m_Y2 * Math.PI / 180
        '  a = a + 100

        m_BufferGraphics.DrawLine(PenColor, a, m_Y2, m_X2, m_Y2)


        ' Redraw to show the new line.
        DrawForm(Me.CreateGraphics())

    End Sub

    ' Redraw the form.
    Private Sub Form1_Paint(ByVal sender As Object, ByVal e As System.Windows.Forms.PaintEventArgs) Handles MyBase.Paint
        DrawForm(e.Graphics)
    End Sub
#Region "misc"
    Private Sub ClearToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ClearToolStripMenuItem.Click
        PEN_Color = Color.Red
    End Sub

    Private Sub BlackToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BlackToolStripMenuItem.Click
        PEN_Color = Color.Black
    End Sub

    Private Sub BlueToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BlueToolStripMenuItem.Click
        PEN_Color = Color.Blue
    End Sub

    Private Sub OtherColorToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles OtherColorToolStripMenuItem.Click
        Dim CP As New ColorDialog
        If CP.ShowDialog = Windows.Forms.DialogResult.OK Then
            PEN_Color = CP.Color
        End If
    End Sub

    Private Sub ExitToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ExitToolStripMenuItem.Click
        Me.Close()
    End Sub

    Private Sub textbox1_KeyPress(ByVal sender As System.Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles textbox1.KeyPress
        Const Numbers$ = "0123456789."      'Permitted values in Textbox
        Dim keyascii As Keys
        If keyascii <> Keys.Back = False Then                       'Ascii for BackSpace 8
            If InStr(Numbers, Chr(keyascii)) = 0 Then    'If false, keypressed is suppressed
                MsgBox("error")
                keyascii = 0
                textbox1.Text = "1"
                Exit Sub
            End If
        End If
    End Sub

    Private Sub textbox1_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles textbox1.TextChanged
        If IsNumeric(textbox1.Text) = False Then textbox1.Text = "1"
    End Sub

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        PEN_Color = My.Settings.SColor
        textbox1.Text = My.Settings.SSize
        'Form2.Visible = True
        'While Form2.Visible = True

        '    Me.Visible = False
        'End While
        'Me.Visible = True
       
        Dim splash As Form2
        Dim main As Form1

        splash = New Form2
        splash.show()
        'splash.refresh()

        main = New Form1
        main.show()
        splash.close()

        application.run(main)

    End Sub

    Private Sub Form1_FormClosing(ByVal sender As System.Object, ByVal e As System.Windows.Forms.FormClosingEventArgs) Handles MyBase.FormClosing
        My.Settings.SColor = PEN_Color
        My.Settings.SSize = textbox1.Text
        My.Settings.Save()
    End Sub


#End Region
End Class

