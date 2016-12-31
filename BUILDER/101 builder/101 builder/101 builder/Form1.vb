Public Class Form1

    Private Sub Button1_Click() Handles Button1.Click
        'here are a few declarations.
        'you will understand more about the "FileSplit" in the stub code.
        'just make sure you make it something very unique.
        Dim FileSplit As String = "(-!Nathan72389!-)"
        Dim Cb1, Cb2 As String

        'this will just check to make sure something was entered into the text fields
        If TextBox1.Text = "" Then MessageBox.Show("Enter some text") : Exit Sub
        If TextBox2.Text = "" Then MessageBox.Show("Enter some text") : Exit Sub

        'here we simply give our strings some value
        If CheckBox1.Checked = True Then Cb1 = "Yes" Else Cb1 = "No"
        If CheckBox2.Checked = True Then Cb2 = "Yes" Else Cb2 = "No"

        'here we make and show a new "Save File Dialog"
        Dim Sfd As New SaveFileDialog
        'here we declare a new string to hold the filename for the output file
        Dim SaveFileName As String
        'add a filter so it can only be saved as an ".EXE"
        Sfd.Filter = "*.Exe | *.Exe"
        'here we check to see if the user clicked "Ok", or "Cancel". if it was "Ok", then use
        'that filename as our "SaveFileName" for the output file, anything else, just exit the 
        'sub and dont do anything.
        If Sfd.ShowDialog = Windows.Forms.DialogResult.OK Then SaveFileName = Sfd.FileName _
                 Else Exit Sub

        'put it all inside a try statement incase there is a problem, we will know about it
        Try
            'ok, here is where some work actually starts to happen.
            'First we open up out "Stub" file for reading
            FileOpen(1, Application.StartupPath & "\Stub.exe", OpenMode.Binary, _
                     OpenAccess.Read, OpenShare.Default)
            'now we declare a new string for the total "Stub" file
            Dim Stub As String = Space(LOF(1))
            'here we get the string from the "Stub" file
            FileGet(1, Stub)
            'then we close it, because we are done with it
            FileClose(1)
            'ok, now we open up our final file and begin to do some stuff to it

            FileOpen(2, SaveFileName, OpenMode.Binary, OpenAccess.Write, OpenShare.Default)
            'ok, here what we are doing is first writing our "Stub" to the "output file"
            'then a "filesplit" that we declared above, then the info that we want to put into the file.
            '!!!REMEMBER the order in which you write your stuff!!!
            '!!!This will be VERY VERY IMPORTANT when you write the "stub"!!!
            FilePut(2, Stub & FileSplit & TextBox1.Text & FileSplit & TextBox2.Text & FileSplit & _
                    NumericUpDown1.Value & FileSplit & NumericUpDown2.Value _
                    & FileSplit & Cb1 & FileSplit & Cb2)
            'after we are done writing to the file, we have to close it
            FileClose(2)

            'just a simple message box saying that we are done
            MessageBox.Show("File was built!")

            'if any of the code above(below the "Try" statement) Errors it will stop and goto the "Catch"
            'statement. "Catch ex As Exception" will catch all errors
        Catch ex As Exception
            'display a message box to let the user know that there was an error
            ' vbnewline will simply put the next string in a new line below the first
            ' "ex.ToString" will display the exception that cause the code to fail
            MessageBox.Show("There was an error!" & vbNewLine & ex.ToString)
            'close our "Try - Catch" block
        End Try

    End Sub
End Class
