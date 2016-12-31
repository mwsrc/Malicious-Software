Public Class FRM_Notepad

    Private Sub BTN_Cut_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BTN_Cut.Click
        RTXT_NotepadText.Cut()
    End Sub

    Private Sub BTN_Copy_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BTN_Copy.Click
        RTXT_NotepadText.Copy()
    End Sub

    Private Sub BTN_Paste_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BTN_Paste.Click
        RTXT_NotepadText.Paste()
    End Sub

    Private Sub BTN_Open_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BTN_Open.Click
        Dim OpenFileDialog1 As New OpenFileDialog
        With OpenFileDialog1
            If .ShowDialog = DialogResult.OK Then
                Dim path As String = .FileName
                Dim ReadIt As String = System.IO.File.ReadAllText(path)
                RTXT_NotepadText.Text = ReadIt
            End If
        End With
    End Sub

    Private Sub BTN_Save_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BTN_Save.Click
        Dim SaveFileDialog1 As New SaveFileDialog
        With SaveFileDialog1
            SaveFileDialog1.Filter = "Text FIles(*.txt)|*.txt | AllFiles (*.*) |*.*"
            If .ShowDialog = DialogResult.OK Then
                Dim path As String = .FileName
                System.IO.File.WriteAllText(path, RTXT_FormattedNotepadText.Text)
                MsgBox("SAVED TO " & path, MsgBoxStyle.Information)
            End If
        End With
    End Sub

    Private Sub BTN_Exit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BTN_Exit.Click
        End
    End Sub

    Private Sub BTN_Undo_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BTN_Undo.Click
        RTXT_NotepadText.Undo()
    End Sub

    Private Sub BTN_Redo_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BTN_Redo.Click
        RTXT_NotepadText.Redo()
    End Sub

    Private Sub BTN_ChangeFont_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BTN_ChangeFont.Click
        Dim fontdialog1 As New FontDialog
        fontdialog1.ShowDialog()
        RTXT_FormattedNotepadText.Text = RTXT_NotepadText.Text
        RTXT_FormattedNotepadText.Font = fontdialog1.Font
    End Sub

    Private Sub BTN_ChangeColour_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BTN_ChangeColour.Click
        Dim colorDialog1 As New ColorDialog
        colorDialog1.ShowDialog()
        RTXT_FormattedNotepadText.Text = RTXT_NotepadText.Text
        RTXT_FormattedNotepadText.ForeColor = colorDialog1.Color
    End Sub

    Private Sub BTN_About_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BTN_About.Click
        MsgBox("CREATED BY SAAD QURESHI (00923428042326)", MsgBoxStyle.Information)
    End Sub

    Private Sub BTN_ClearAll_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BTN_ClearAll.Click
        RTXT_NotepadText.Clear()
    End Sub

    Private Sub BTN_ClearScreen2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        RTXT_FormattedNotepadText.Clear()
    End Sub

    Private Sub TIMER_Notepad_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TIMER_Notepad.Tick
        RTXT_FormattedNotepadText.Text = RTXT_NotepadText.Text
    End Sub

End Class
