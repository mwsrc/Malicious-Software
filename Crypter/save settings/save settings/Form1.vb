Imports System.IO
Imports System.IO.File
Public Class Form1

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim fs As New FileStream("settings.bmr", FileMode.Create, FileAccess.Write)
        'declaring a FileStream and creating a word document file named file with
        'access mode of writing
        Dim s As New StreamWriter(fs)
        'creating a new StreamWriter and passing the filestream object fs as argument
        s.BaseStream.Seek(0, SeekOrigin.End)
        'the seek method is used to move the cursor to next position to avoid text to be
        'overwritten
        s.WriteLine(TextBox1.Text)
        s.WriteLine(TextBox2.Text)
        s.WriteLine(TextBox3.Text)
        s.WriteLine(TextBox4.Text)
        s.Close()

    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        If File.Exists("settings.bmr") = False Then
            Exit Sub
        End If
        Dim fs = New FileStream("settings.bmr", FileMode.Open, FileAccess.Read)
        'declaring a FileStream to open the file named file.doc with access mode of reading
        Dim d As New StreamReader(fs)
        'creating a new StreamReader and passing the filestream object fs as argument
        d.BaseStream.Seek(0, SeekOrigin.Begin)
        'Seek method is used to move the cursor to different positions in a file, in this code, to
        'the beginning
        While d.Peek() > -1
            'peek method of StreamReader object tells how much more data is left in the file
            TextBox1.Text &= d.ReadLine()
            TextBox2.Text = d.ReadLine
            TextBox3.Text = d.ReadLine
            TextBox4.Text = d.ReadLine
            'displaying text from doc file in the RichTextBox
        End While
        d.Close()
    End Sub

End Class
