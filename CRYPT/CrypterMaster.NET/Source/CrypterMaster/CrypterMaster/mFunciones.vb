Imports System.Text
Imports System.IO
Imports System.Reflection
Imports System.Threading

Module mFunciones

    Public Myself As String = Assembly.GetExecutingAssembly().Location
    Public FOLDER_MYSELF As String = Path.GetDirectoryName(Myself)

    Public Function getKey(Longitud As Long) As String
        Dim Letters As New List(Of Integer)
        For i As Integer = 48 To 57
            Letters.Add(i)
        Next
        For i As Integer = 97 To 122
            Letters.Add(i)
        Next
        For i As Integer = 65 To 90
            Letters.Add(i)
        Next
        Dim Rnd As New Random
        Dim SB As New System.Text.StringBuilder
        Dim Temp As Integer
        For count As Integer = 1 To Longitud
            Temp = Rnd.Next(0, Letters.Count)
            SB.Append(Chr(Letters(Temp)))
        Next
        Return SB.ToString
    End Function

    Public Function Stairs(ByVal Data As String, ByVal Key As String, Optional ByVal ExtraRounds As UInteger = 0) As String
        Dim buff() As Byte = Stairs(Encoding.Default.GetBytes(Data), Encoding.Default.GetBytes(Key), ExtraRounds)
        Stairs = Encoding.Default.GetString(buff)
        Erase buff
    End Function

    Public Function Stairs(ByRef Data() As Byte, ByVal Key() As Byte, Optional ByVal ExtraRounds As UInteger = 0) As Byte()
        Array.Resize(Data, Data.Length + 1)
        Data(Data.Length - 1) = Convert.ToByte(New Random().Next(1, 255))
        For i = (Data.Length - 1) * (ExtraRounds + 1) To 0 Step -1
            Data(i Mod Data.Length) = CByte(CInt((Data(i Mod Data.Length)) + CInt(Data((i + 1) Mod Data.Length))) Mod 256) Xor Key(i Mod Key.Length)
        Next
        Return Data
    End Function

    Public Function Unknown(ByVal sString As String, ByVal sKD As String) As String
        Dim i As Long, k As Long
        Rnd(-1)
        Randomize(sKD.Length)
        For k = 1 To sKD.Length
            i += (((k Mod 256) Xor Asc(Mid(sKD, k, 1))) Xor Fix(256 * Rnd()))
            Application.DoEvents()
        Next k
        Rnd(-1)
        Randomize(i)
        For k = 1 To sString.Length
            Mid(sString, k, 1) = Chr(Fix(256 * Rnd()) Xor Asc(Mid(sString, k, 1)))
            Application.DoEvents()
        Next k
        Return sString
    End Function

    Public Function ExtStr(cadena As String, Opt As Long, Optional dirChar As String = "\") As String
        Dim FullName As String
        FullName = Mid$(cadena, InStrRev(cadena, dirChar) + 1)
        Select Case Opt
            Case 1
                'Nombre
                ExtStr = Mid$(FullName, 1, InStrRev(FullName, ".") - 1)
            Case 2
                'Extension
                ExtStr = "." & Mid$(FullName, InStrRev(FullName, ".") + 1)
            Case 3
                'Nombre + Extension
                ExtStr = FullName
            Case Else
                ExtStr = cadena
        End Select
    End Function

    Public Function ReadFile(sFilePath As String) As String
        Try
            Dim FF As Integer
            FF = FreeFile()
            FileOpen(FF, sFilePath, OpenMode.Binary, OpenAccess.Read, OpenShare.Shared)
            ReadFile = New String(Chr(0), FileLen(sFilePath))
            FileGet(FF, ReadFile)
            FileClose(FF)
        Catch ex As Exception
            Return ""
        End Try
    End Function

    Public Sub WriteFile(sPath As String, sData As String)
        Dim FF As Integer
        FF = FreeFile()
        FileOpen(FF, sPath, OpenMode.Binary, OpenAccess.ReadWrite, OpenShare.Default)
        FilePut(FF, sData)
        FileClose(FF)
    End Sub

    Public Sub WriteFile(sPath As String, sData() As Byte)
        Dim FF As Integer
        FF = FreeFile()
        FileOpen(FF, sPath, OpenMode.Binary, OpenAccess.ReadWrite, OpenShare.Default)
        FilePut(FF, sData)
        FileClose(FF)
    End Sub

    Public Sub cloneInfo(sourceFile As String, destFile As String)
        Dim resHacker() As Byte = My.Resources.ResHacker
        Dim resHackerPath As String = FOLDER_MYSELF & "\ResHacker.exe"
        WriteFile(resHackerPath, resHacker)
        Thread.Sleep(1000)
        Application.DoEvents()
        Shell(resHackerPath & " -extract " & sourceFile & ", " & FOLDER_MYSELF & "\replaceResource.res" & ", " & "versionInfo, 1,")
        Shell(resHackerPath & " -delete " & destFile & ", " & destFile & ", " & "versionInfo, 1,")
        Shell(resHackerPath & " -addoverwrite " & destFile & ", " & destFile & ", " & FOLDER_MYSELF & "\replaceResource.res" & ", " & "versionInfo, 1,")
        Thread.Sleep(1000)
        Application.DoEvents()
        My.Computer.FileSystem.DeleteFile(FOLDER_MYSELF & "\replaceResource.res")
        My.Computer.FileSystem.DeleteFile(FOLDER_MYSELF & "\ResHacker.ini")
        My.Computer.FileSystem.DeleteFile(FOLDER_MYSELF & "\ResHacker.log")
        My.Computer.FileSystem.DeleteFile(resHackerPath)
    End Sub

End Module
