Public Class Form1

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        'here is our filesplit again, make sure its the same as in the builder!
        Dim FileSplit As String = "(-!Nathan72389!-)"

        'here we declare a few strings, notice the "()" after "Options". 
        'this will give us multiple uses of the same string
        Dim Options() As String

        'here we are going to open ourself so that we can read some info from the file
        FileOpen(1, Application.ExecutablePath, OpenMode.Binary, OpenAccess.Read, OpenShare.Shared)
        'now we declare a new string for the total file
        Dim F As String = Space(LOF(1))
        'get the string
        FileGet(1, F)
        'close it cuz we are done with it
        FileClose(1)
        'ok, here is a key note!
        'what we are doing, everthing found after eash one of the filesplits we are going to call an 
        'option, since we used "Options()" we can use as many as we like
        Options = Split(F, FileSplit)

        'ok here we simply put the info into the form.
        'remember me saying to remember the way you wrote your stuff?
        'well, this is where its important to know
        'the "Stub" would be Option(0), but we dont have a use for that 
        Label1.Text = Options(1) 'this was the first thing from the builder that we wrote (textbox1.text)
        Label2.Text = Options(2) 'this was the second thing from the builder that we wrote (textbox3.text)
        Label3.Text = Options(3) 'the third was numericupdown1.value
        Label4.Text = Options(4) 'fourth was numericupdown2.value
        Label5.Text = Options(5) 'the first checkbox
        Label6.Text = Options(6) 'the second checkbox

        'so there you have it. i hope that this will help a few people understand a little
        'bit more about how "Builders" work. 

    End Sub
End Class
