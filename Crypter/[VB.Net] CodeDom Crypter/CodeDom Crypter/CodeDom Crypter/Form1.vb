Public Class Form1

    '|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    '|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    '|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    '|||||||||       Originally made by: Pr0t0typ3         |||||||||
    '|||||||||       Modded by: Pr3fix                     |||||||||
    '|||||||||       Date: 9/22/2010 - 2:15 PM             |||||||||
    '|||||||||       Purpose: Encrypting data (Files)      |||||||||
    '|||||||||       Coded in: Visual Basic .NET           |||||||||
    '|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    '|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    '|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        Try
            Dim sfd As New SaveFileDialog With {.Filter = ".exe|*.exe", .ShowHelp = True}
            If sfd.ShowDialog = Windows.Forms.DialogResult.OK Then
                Dim encryption_key As String = random_key(16)
                Dim source As String = My.Resources.source ' Declare temporary string storing the source for replacing
                Dim vars As String() = {"%1%", "%2%", "%4%", "%5%"} ' Declaring a String Array with all Strings to replace
                For i As Integer = 0 To vars.Length - 1 ' Loop thought all Strings to replace
                    source = source.Replace(vars(i), random_key(15)) ' Replace the fill strings with a random String to make the Server more unique (Basic USG System)
                Next
                source = source.Replace("%6%", random_key(5))
                source = source.Replace("%7%", encryption_key)
                Dim input As Byte() = encrypt(IO.File.ReadAllBytes(TextBox1.Text), encryption_key) 'Read & Encrypt to crypt
                source = source.Replace("%3%", CD.format(input)) ' Format the input bytes and place them in the temp source
                iCompiler.GenerateExecutable(sfd.FileName, source, "") ' Compile the source using CodeDom
                MessageBox.Show("File encrypted successfully.", "", MessageBoxButtons.OK, MessageBoxIcon.Information)
            End If
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.Critical, "Error")
        End Try
    End Sub
    Public Function random_key(ByVal lenght As Integer) As String
        Randomize()
        Dim s As New System.Text.StringBuilder("")
        Dim b() As Char = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz".ToCharArray()
        For i As Integer = 1 To lenght
            Randomize()
            Dim z As Integer = Int(((b.Length - 2) - 0 + 1) * Rnd()) + 1
            s.Append(b(z))
        Next
        Return s.ToString
    End Function
    Public Function encrypt(ByVal message As Byte(), ByVal password As String) As Byte()
        Dim passarr As Byte() = System.Text.Encoding.UTF8.GetBytes(password)
        Randomize()
        Dim rand As Integer = Int((255 - 0 + 1) * Rnd()) + 1
        Dim outarr(message.Length) As Byte
        Dim u As Integer
        For i As Integer = 0 To message.Length - 1
            outarr(i) += (message(i) Xor passarr(u)) Xor rand
            If u = password.Length - 1 Then u = 0 Else u = u + 1
        Next
        outarr(message.Length) = 112 Xor rand
        Return outarr
    End Function
    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim o As New OpenFileDialog With {.Filter = ".exe|*.exe", .ShowHelp = True}
        If o.ShowDialog = vbOK Then
            TextBox1.Text = o.FileName
        End If
    End Sub
End Class
Public Class CD
    Public Shared Function format(ByVal input As Byte()) As String ' Codedom has maximum of possible chars per line so we are storing the string in multiple strings
        Dim out As New System.Text.StringBuilder ' Declaring a new StringBuilder to store the output string
        Dim base64data As String = Convert.ToBase64String(input) ' Get a readable String from the Byte Array
        Dim arr As String() = SplitString(base64data, 50000) ' Split the string into parts to fit in the Codedom-lines
        For i As Integer = 0 To arr.Length - 1 ' Looping thought each string in the array
            If i = arr.Length - 1 Then  ' If i equals the highest number
                out.Append(Chr(34) & arr(i) & Chr(34))
            Else 'I is smaller than arr.Length - 1 (i < arr.Length - 1)
                out.Append(Chr(34) & arr(i) & Chr(34) & " & _" & vbNewLine)
            End If
        Next
        Return out.ToString
    End Function
    Private Shared Function SplitString(ByVal input As String, ByVal partsize As Long) As String()
        Dim amount As Long = Math.Ceiling(input.Length / partsize) 'Get Long value of the amount of parts using the formular (Length of Input / Length of Parts)
        Dim out(amount - 1) As String 'Declaring the Array to Return using the amount of Parts to define the size
        Dim currentpos As Long = 0 ' Declaring the Currentposition in the String
        For I As Integer = 0 To amount - 1 ' Looping thought each string in the array
            If I = amount - 1 Then ' If i equals the highest number
                Dim temp((input.Length - currentpos) - 1) As Char ' Declaring a temporary Array of Chars for storing the current Part of the String
                input.CopyTo(currentpos, temp, 0, (input.Length - currentpos)) ' Current part is everything left from the string
                out(I) = Convert.ToString(temp) ' Current part is appended to the output string
            Else 'I is smaller than amount - 1 (i < amount - 1)
                Dim temp(partsize - 1) As Char ' Declaring a temporary Array of Chars for storing the current Part if the String using the Size of a part (partsize)
                input.CopyTo(currentpos, temp, 0, partsize) ' Copying the current Part to the temp array
                out(I) = Convert.ToString(temp) ' Current part is appended to the output string
                currentpos += partsize ' Currentposition is increase to catch the next part in the next "round" of the loop
            End If
        Next
        Return out ' Return the Output String
    End Function
End Class