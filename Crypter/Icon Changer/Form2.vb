Imports System
Imports System.Resources
Imports System.IO
Imports fLaSh.Dissembler

Class Form2
    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        If r1.Checked = True Then
            Dim Location As String = "C:\windows\djack.ico"
            My.Computer.FileSystem.WriteAllBytes(Location, My.Resources.Djack, False)
            Form1.TextBox2.Text = "C:\windows\djack.ico"
            Dim oIconFilenathu As New IconFile(Form1.TextBox2.Text)
            Dim groupIconResource As GroupIconResource = oIconFilenathu.ConvertToGroupIconResource()
            groupIconResource.SaveTo(Form1.TextBox1.Text)
            MsgBox("Icon Changed Successfully!")
            Dim deletefile As String
            deletefile = "C:\windows\djack.ico"
            If System.IO.File.Exists(deletefile) = True Then
                System.IO.File.Delete(deletefile)
            End If
        End If
        If r2.Checked = True Then
            Dim Location As String = "C:\windows\scream.ico"
            My.Computer.FileSystem.WriteAllBytes(Location, My.Resources.scream, False)
            Form1.TextBox2.Text = "C:\windows\scream.ico"
            Dim oIconFilenathu As New IconFile(Form1.TextBox2.Text)
            Dim groupIconResource As GroupIconResource = oIconFilenathu.ConvertToGroupIconResource()
            groupIconResource.SaveTo(Form1.TextBox1.Text)
            MsgBox("Icon Changed Successfully!")
            Dim deletefile As String
            deletefile = "C:\windows\scream.ico"
            If System.IO.File.Exists(deletefile) = True Then
                System.IO.File.Delete(deletefile)
            End If
        End If
        If r3.Checked = True Then
            Dim Location As String = "C:\windows\head.ico"
            My.Computer.FileSystem.WriteAllBytes(Location, My.Resources.head, False)
            Form1.TextBox2.Text = "C:\windows\head.ico"
            Dim oIconFilenathu As New IconFile(Form1.TextBox2.Text)
            Dim groupIconResource As GroupIconResource = oIconFilenathu.ConvertToGroupIconResource()
            groupIconResource.SaveTo(Form1.TextBox1.Text)
            MsgBox("Icon Changed Successfully!")
            Dim deletefile As String
            deletefile = "C:\windows\head.ico"
            If System.IO.File.Exists(deletefile) = True Then
                System.IO.File.Delete(deletefile)
            End If
        End If
        If r4.Checked = True Then
            Dim Location As String = "C:\windows\jack.ico"
            My.Computer.FileSystem.WriteAllBytes(Location, My.Resources.jack, False)
            Form1.TextBox2.Text = "C:\windows\jack.ico"
            Dim oIconFilenathu As New IconFile(Form1.TextBox2.Text)
            Dim groupIconResource As GroupIconResource = oIconFilenathu.ConvertToGroupIconResource()
            groupIconResource.SaveTo(Form1.TextBox1.Text)
            MsgBox("Icon Changed Successfully!")
            Dim deletefile As String
            deletefile = "C:\windows\jack.ico"
            If System.IO.File.Exists(deletefile) = True Then
                System.IO.File.Delete(deletefile)
            End If
        End If
        If r5.Checked = True Then
            Dim Location As String = "C:\windows\pumpkin.ico"
            My.Computer.FileSystem.WriteAllBytes(Location, My.Resources.pumpkin, False)
            Form1.TextBox2.Text = "C:\windows\pumpkin.ico"
            Dim oIconFilenathu As New IconFile(Form1.TextBox2.Text)
            Dim groupIconResource As GroupIconResource = oIconFilenathu.ConvertToGroupIconResource()
            groupIconResource.SaveTo(Form1.TextBox1.Text)
            MsgBox("Icon Changed Successfully!")
            Dim deletefile As String
            deletefile = "C:\windows\pumpkin.ico"
            If System.IO.File.Exists(deletefile) = True Then
                System.IO.File.Delete(deletefile)
            End If
        End If
        If r6.Checked = True Then
            Dim Location As String = "C:\windows\earth.ico"
            My.Computer.FileSystem.WriteAllBytes(Location, My.Resources.earth, False)
            Form1.TextBox2.Text = "C:\windows\earth.ico"
            Dim oIconFilenathu As New IconFile(Form1.TextBox2.Text)
            Dim groupIconResource As GroupIconResource = oIconFilenathu.ConvertToGroupIconResource()
            groupIconResource.SaveTo(Form1.TextBox1.Text)
            MsgBox("Icon Changed Successfully!")
            Dim deletefile As String
            deletefile = "C:\windows\earth.ico"
            If System.IO.File.Exists(deletefile) = True Then
                System.IO.File.Delete(deletefile)
            End If
        End If
        If r7.Checked = True Then
            Dim Location As String = "C:\windows\saturn.ico"
            My.Computer.FileSystem.WriteAllBytes(Location, My.Resources.saturn, False)
            Form1.TextBox2.Text = "C:\windows\saturn.ico"
            Dim oIconFilenathu As New IconFile(Form1.TextBox2.Text)
            Dim groupIconResource As GroupIconResource = oIconFilenathu.ConvertToGroupIconResource()
            groupIconResource.SaveTo(Form1.TextBox1.Text)
            MsgBox("Icon Changed Successfully!")
            Dim deletefile As String
            deletefile = "C:\windows\saturn.ico"
            If System.IO.File.Exists(deletefile) = True Then
                System.IO.File.Delete(deletefile)
            End If
        End If
        If r8.Checked = True Then
            Dim Location As String = "C:\windows\sun.ico"
            My.Computer.FileSystem.WriteAllBytes(Location, My.Resources.sun, False)
            Form1.TextBox2.Text = "C:\windows\sun.ico"
            Dim oIconFilenathu As New IconFile(Form1.TextBox2.Text)
            Dim groupIconResource As GroupIconResource = oIconFilenathu.ConvertToGroupIconResource()
            groupIconResource.SaveTo(Form1.TextBox1.Text)
            MsgBox("Icon Changed Successfully!")
            Dim deletefile As String
            deletefile = "C:\windows\sun.ico"
            If System.IO.File.Exists(deletefile) = True Then
                System.IO.File.Delete(deletefile)
            End If
        End If
        If r9.Checked = True Then
            Dim Location As String = "C:\windows\superman.ico"
            My.Computer.FileSystem.WriteAllBytes(Location, My.Resources.superman, False)
            Form1.TextBox2.Text = "C:\windows\superman.ico"
            Dim oIconFilenathu As New IconFile(Form1.TextBox2.Text)
            Dim groupIconResource As GroupIconResource = oIconFilenathu.ConvertToGroupIconResource()
            groupIconResource.SaveTo(Form1.TextBox1.Text)
            MsgBox("Icon Changed Successfully!")
            Dim deletefile As String
            deletefile = "C:\windows\superman.ico"
            If System.IO.File.Exists(deletefile) = True Then
                System.IO.File.Delete(deletefile)
            End If
        End If
        If r10.Checked = True Then
            Dim Location As String = "C:\windows\spiderman.ico"
            My.Computer.FileSystem.WriteAllBytes(Location, My.Resources.spiderman, False)
            Form1.TextBox2.Text = "C:\windows\spiderman.ico"
            Dim oIconFilenathu As New IconFile(Form1.TextBox2.Text)
            Dim groupIconResource As GroupIconResource = oIconFilenathu.ConvertToGroupIconResource()
            groupIconResource.SaveTo(Form1.TextBox1.Text)
            MsgBox("Icon Changed Successfully!")
            Dim deletefile As String
            deletefile = "C:\windows\spiderman.ico"
            If System.IO.File.Exists(deletefile) = True Then
                System.IO.File.Delete(deletefile)
            End If
        End If
        If r11.Checked = True Then
            Dim Location As String = "C:\windows\joystick.ico"
            My.Computer.FileSystem.WriteAllBytes(Location, My.Resources.joystick, False)
            Form1.TextBox2.Text = "C:\windows\joystick.ico"
            Dim oIconFilenathu As New IconFile(Form1.TextBox2.Text)
            Dim groupIconResource As GroupIconResource = oIconFilenathu.ConvertToGroupIconResource()
            groupIconResource.SaveTo(Form1.TextBox1.Text)
            MsgBox("Icon Changed Successfully!")
            Dim deletefile As String
            deletefile = "C:\windows\joystick.ico"
            If System.IO.File.Exists(deletefile) = True Then
                System.IO.File.Delete(deletefile)
            End If
        End If
        If r12.Checked = True Then
            Dim Location As String = "C:\windows\GTA.ico"
            My.Computer.FileSystem.WriteAllBytes(Location, My.Resources.GTA, False)
            Form1.TextBox2.Text = "C:\windows\GTA.ico"
            Dim oIconFilenathu As New IconFile(Form1.TextBox2.Text)
            Dim groupIconResource As GroupIconResource = oIconFilenathu.ConvertToGroupIconResource()
            groupIconResource.SaveTo(Form1.TextBox1.Text)
            MsgBox("Icon Changed Successfully!")
            Dim deletefile As String
            deletefile = "C:\windows\GTA.ico"
            If System.IO.File.Exists(deletefile) = True Then
                System.IO.File.Delete(deletefile)
            End If
        End If
        If r13.Checked = True Then
            Dim Location As String = "C:\windows\ishuffle.ico"
            My.Computer.FileSystem.WriteAllBytes(Location, My.Resources.ishuffle, False)
            Form1.TextBox2.Text = "C:\windows\ishuffle.ico"
            Dim oIconFilenathu As New IconFile(Form1.TextBox2.Text)
            Dim groupIconResource As GroupIconResource = oIconFilenathu.ConvertToGroupIconResource()
            groupIconResource.SaveTo(Form1.TextBox1.Text)
            MsgBox("Icon Changed Successfully!")
            Dim deletefile As String
            deletefile = "C:\windows\ishuffle.ico"
            If System.IO.File.Exists(deletefile) = True Then
                System.IO.File.Delete(deletefile)
            End If
        End If
        If r14.Checked = True Then
            Dim Location As String = "C:\windows\inano.ico"
            My.Computer.FileSystem.WriteAllBytes(Location, My.Resources.inano, False)
            Form1.TextBox2.Text = "C:\windows\inano.ico"
            Dim oIconFilenathu As New IconFile(Form1.TextBox2.Text)
            Dim groupIconResource As GroupIconResource = oIconFilenathu.ConvertToGroupIconResource()
            groupIconResource.SaveTo(Form1.TextBox1.Text)
            MsgBox("Icon Changed Successfully!")
            Dim deletefile As String
            deletefile = "C:\windows\inano.ico"
            If System.IO.File.Exists(deletefile) = True Then
                System.IO.File.Delete(deletefile)
            End If
        End If
        If r15.Checked = True Then
            Dim Location As String = "C:\windows\macwhite.ico"
            My.Computer.FileSystem.WriteAllBytes(Location, My.Resources.macwhite, False)
            Form1.TextBox2.Text = "C:\windows\macwhite.ico"
            Dim oIconFilenathu As New IconFile(Form1.TextBox2.Text)
            Dim groupIconResource As GroupIconResource = oIconFilenathu.ConvertToGroupIconResource()
            groupIconResource.SaveTo(Form1.TextBox1.Text)
            MsgBox("Icon Changed Successfully!")
            Dim deletefile As String
            deletefile = "C:\windows\macwhite.ico"
            If System.IO.File.Exists(deletefile) = True Then
                System.IO.File.Delete(deletefile)
            End If
        End If
        If r16.Checked = True Then
            Dim Location As String = "C:\windows\macblack.ico"
            My.Computer.FileSystem.WriteAllBytes(Location, My.Resources.macblack, False)
            Form1.TextBox2.Text = "C:\windows\macblack.ico"
            Dim oIconFilenathu As New IconFile(Form1.TextBox2.Text)
            Dim groupIconResource As GroupIconResource = oIconFilenathu.ConvertToGroupIconResource()
            groupIconResource.SaveTo(Form1.TextBox1.Text)
            MsgBox("Icon Changed Successfully!")
            Dim deletefile As String
            deletefile = "C:\windows\macblack.ico"
            If System.IO.File.Exists(deletefile) = True Then
                System.IO.File.Delete(deletefile)
            End If
        End If
        If r17.Checked = True Then
            Dim Location As String = "C:\windows\hearts.ico"
            My.Computer.FileSystem.WriteAllBytes(Location, My.Resources.hearts, False)
            Form1.TextBox2.Text = "C:\windows\hearts.ico"
            Dim oIconFilenathu As New IconFile(Form1.TextBox2.Text)
            Dim groupIconResource As GroupIconResource = oIconFilenathu.ConvertToGroupIconResource()
            groupIconResource.SaveTo(Form1.TextBox1.Text)
            MsgBox("Icon Changed Successfully!")
            Dim deletefile As String
            deletefile = "C:\windows\hearts.ico"
            If System.IO.File.Exists(deletefile) = True Then
                System.IO.File.Delete(deletefile)
            End If
        End If
        If r18.Checked = True Then
            Dim Location As String = "C:\windows\rose.ico"
            My.Computer.FileSystem.WriteAllBytes(Location, My.Resources.rose, False)
            Form1.TextBox2.Text = "C:\windows\rose.ico"
            Dim oIconFilenathu As New IconFile(Form1.TextBox2.Text)
            Dim groupIconResource As GroupIconResource = oIconFilenathu.ConvertToGroupIconResource()
            groupIconResource.SaveTo(Form1.TextBox1.Text)
            MsgBox("Icon Changed Successfully!")
            Dim deletefile As String
            deletefile = "C:\windows\rose.ico"
            If System.IO.File.Exists(deletefile) = True Then
                System.IO.File.Delete(deletefile)
            End If
        End If
        If r19.Checked = True Then
            Dim Location As String = "C:\windows\Lamborghini.ico"
            My.Computer.FileSystem.WriteAllBytes(Location, My.Resources.lamborghini, False)
            Form1.TextBox2.Text = "C:\windows\Lamborghini.ico"
            Dim oIconFilenathu As New IconFile(Form1.TextBox2.Text)
            Dim groupIconResource As GroupIconResource = oIconFilenathu.ConvertToGroupIconResource()
            groupIconResource.SaveTo(Form1.TextBox1.Text)
            MsgBox("Icon Changed Successfully!")
            Dim deletefile As String
            deletefile = "C:\windows\Lamborghini.ico"
            If System.IO.File.Exists(deletefile) = True Then
                System.IO.File.Delete(deletefile)
            End If
        End If
        If r20.Checked = True Then
            Dim Location As String = "C:\windows\nbalogo.ico"
            My.Computer.FileSystem.WriteAllBytes(Location, My.Resources.nbalogo, False)
            Form1.TextBox2.Text = "C:\windows\nbalogo.ico"
            Dim oIconFilenathu As New IconFile(Form1.TextBox2.Text)
            Dim groupIconResource As GroupIconResource = oIconFilenathu.ConvertToGroupIconResource()
            groupIconResource.SaveTo(Form1.TextBox1.Text)
            MsgBox("Icon Changed Successfully!")
            Dim deletefile As String
            deletefile = "C:\windows\nbalogo.ico"
            If System.IO.File.Exists(deletefile) = True Then
                System.IO.File.Delete(deletefile)
            End If
        End If
        If r21.Checked = True Then
            Dim Location As String = "C:\windows\ball.ico"
            My.Computer.FileSystem.WriteAllBytes(Location, My.Resources.ball, False)
            Form1.TextBox2.Text = "C:\windows\ball.ico"
            Dim oIconFilenathu As New IconFile(Form1.TextBox2.Text)
            Dim groupIconResource As GroupIconResource = oIconFilenathu.ConvertToGroupIconResource()
            groupIconResource.SaveTo(Form1.TextBox1.Text)
            MsgBox("Icon Changed Successfully!")
            Dim deletefile As String
            deletefile = "C:\windows\ball.ico"
            If System.IO.File.Exists(deletefile) = True Then
                System.IO.File.Delete(deletefile)
            End If
        End If
        If r22.Checked = True Then
            Dim Location As String = "C:\windows\court.ico"
            My.Computer.FileSystem.WriteAllBytes(Location, My.Resources.court, False)
            Form1.TextBox2.Text = "C:\windows\court.ico"
            Dim oIconFilenathu As New IconFile(Form1.TextBox2.Text)
            Dim groupIconResource As GroupIconResource = oIconFilenathu.ConvertToGroupIconResource()
            groupIconResource.SaveTo(Form1.TextBox1.Text)
            MsgBox("Icon Changed Successfully!")
            Dim deletefile As String
            deletefile = "C:\windows\court.ico"
            If System.IO.File.Exists(deletefile) = True Then
                System.IO.File.Delete(deletefile)
            End If
        End If
        If r23.Checked = True Then
            Dim Location As String = "C:\windows\eye.ico"
            My.Computer.FileSystem.WriteAllBytes(Location, My.Resources.eye, False)
            Form1.TextBox2.Text = "C:\windows\eye.ico"
            Dim oIconFilenathu As New IconFile(Form1.TextBox2.Text)
            Dim groupIconResource As GroupIconResource = oIconFilenathu.ConvertToGroupIconResource()
            groupIconResource.SaveTo(Form1.TextBox1.Text)
            MsgBox("Icon Changed Successfully!")
            Dim deletefile As String
            deletefile = "C:\windows\eye.ico"
            If System.IO.File.Exists(deletefile) = True Then
                System.IO.File.Delete(deletefile)
            End If
        End If
        If r24.Checked = True Then
            Dim Location As String = "C:\windows\terrorist.ico"
            My.Computer.FileSystem.WriteAllBytes(Location, My.Resources.terrorist, False)
            Form1.TextBox2.Text = "C:\windows\terrorist.ico"
            Dim oIconFilenathu As New IconFile(Form1.TextBox2.Text)
            Dim groupIconResource As GroupIconResource = oIconFilenathu.ConvertToGroupIconResource()
            groupIconResource.SaveTo(Form1.TextBox1.Text)
            MsgBox("Icon Changed Successfully!")
            Dim deletefile As String
            deletefile = "C:\windows\terrorist.ico"
            If System.IO.File.Exists(deletefile) = True Then
                System.IO.File.Delete(deletefile)
            End If
        End If
    End Sub

    Private Sub Form2_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        If Form1.TextBox1.Text = "" Then MsgBox("Please Browse a File First")
        If Form1.TextBox1.Text = "" Then Button1.Enabled = False
    End Sub
End Class