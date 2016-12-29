Imports System.Text.RegularExpressions
Imports System.Text
Imports System.Security.Cryptography
Imports System.IO
Imports System.Environment

Public Class Form1

#Region " To Do "
    'Trash nur zwischen subs (Fixxen) atm kA wie amn des amchen könnte (in V2)
    'JunkSub Durchmischt (Fixxen) atm kA wie amn des amchen könnte (in V2)
    'Auto Compile           (in V2)
    'Module Form name changen (IN V2)
#End Region



#Region " Variablen "
    Dim filepath, folderpath, iFile As String
    Dim orginal As String = ""
    Dim lastline As String = ""
    Dim rndStr As String
    Dim rndComment As String
    Dim x0rRnd As String
    Dim hash As String
    Dim RANDOM As String
    Dim RANDOMNUMBER As Integer
    Dim RANDOMTYPE As String
    Dim vbproj As String
    Dim EncryptionStr As String
    Dim ObfuscatedFolder As String
    Dim FileName As String
#End Region

#Region " Random "


    Private Sub ZufallBuchstaben()
        Dim x As Integer
        For x = 1 To 20
            Dim Länge As Integer = 23
            Dim ret As String = String.Empty
            Dim SB As New System.Text.StringBuilder()
            Dim Content As String = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvw"
            Dim rnd As New Random()
            For i As Integer = 0 To Länge - 1
                SB.Append(Content(rnd.[Next](Content.Length)))
            Next
            RANDOM = SB.ToString
        Next x
    End Sub

    Private Function ZufallVar()
        System.Threading.Thread.Sleep(200)
        Dim x As Integer
        For x = 1 To 20
            Dim Länge As Integer = 17
            Dim ret As String = String.Empty
            Dim SB As New System.Text.StringBuilder()
            Dim Content As String = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvw"
            Dim rnd As New Random()
            For i As Integer = 0 To Länge - 1
                SB.Append(Content(rnd.[Next](Content.Length)))
            Next
            Return (SB.ToString)
        Next x
    End Function

    Private Sub ZufallZahl()
        Dim x As Integer
        For x = 1 To 20
            Dim Länge As Integer = 7
            Dim ret As String = String.Empty
            Dim SB As New System.Text.StringBuilder()
            Dim Content As String = "1234567890"
            Dim rnd As New Random()
            For i As Integer = 0 To Länge - 1
                SB.Append(Content(rnd.[Next](Content.Length)))
            Next
            RANDOMNUMBER = SB.ToString
        Next x
    End Sub
    Private Sub ZufallType()
        Dim x As Integer
        For x = 1 To 20
            Dim Länge As Integer = 1
            Dim ret As String = String.Empty
            Dim SB As New System.Text.StringBuilder()
            Dim Content As String = "12345"
            Dim rnd As New Random()
            For i As Integer = 0 To Länge - 1
                SB.Append(Content(rnd.[Next](Content.Length)))
            Next
            Select Case SB.ToString
                Case 1
                    RANDOMTYPE = "String"
                Case 2
                    RANDOMTYPE = "Integer"
                Case 3
                    RANDOMTYPE = "Single"
                Case 4
                    RANDOMTYPE = "Double"
                Case 5
                    RANDOMTYPE = "Long"
            End Select
        Next x
    End Sub


    Private Sub ZufallComment()
        Dim x As Integer
        For x = 1 To 20
            Dim Länge As Integer = 112
            Dim ret As String = String.Empty
            Dim SB As New System.Text.StringBuilder()
            Dim Content As String = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvw"
            Dim rnd As New Random()
            For i As Integer = 0 To Länge - 1
                SB.Append(Content(rnd.[Next](Content.Length)))
            Next
            rndComment = SB.ToString
        Next x
    End Sub

    Private Sub ZufallEncryption()
        Dim x As Integer
        For x = 1 To 20
            Dim Länge As Integer = 23
            Dim ret As String = String.Empty
            Dim SB As New System.Text.StringBuilder()
            Dim Content As String = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvw"
            Dim rnd As New Random()
            For i As Integer = 0 To Länge - 1
                SB.Append(Content(rnd.[Next](Content.Length)))
            Next
            EncryptionStr = SB.ToString
        Next x
    End Sub

    Private Function ZufallAssemblyVersion()
        System.Threading.Thread.Sleep(200)
        Dim x As Integer
        For x = 1 To 20
            Dim Länge As Integer = 1
            Dim ret As String = String.Empty
            Dim SB As New System.Text.StringBuilder()
            Dim Content As String = "1234567890"
            Dim rnd As New Random()
            For i As Integer = 0 To Länge - 1
                SB.Append(Content(rnd.[Next](Content.Length)))
            Next
            Return SB.ToString
        Next x
    End Function

    Private Sub Zufall()
        Dim x As Integer
        For x = 1 To 20
            Dim Länge As Integer = 23
            Dim ret As String = String.Empty
            Dim SB As New System.Text.StringBuilder()
            Dim Content As String = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvw"
            Dim rnd As New Random()
            For i As Integer = 0 To Länge - 1
                SB.Append(Content(rnd.[Next](Content.Length)))
            Next
            rndStr = SB.ToString
        Next x
    End Sub

    Private Sub XorZufall()
        Dim x As Integer
        For x = 1 To 20
            Dim Länge As Integer = 23
            Dim ret As String = String.Empty
            Dim SB As New System.Text.StringBuilder()
            Dim Content As String = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvw"
            Dim rnd As New Random()
            For i As Integer = 0 To Länge - 1
                SB.Append(Content(rnd.[Next](Content.Length)))
            Next
            x0rRnd = SB.ToString
        Next x
    End Sub
#End Region

#Region " Replace "


    Private Sub AssemblyName()
        vbproj = My.Computer.FileSystem.ReadAllText(ObfuscatedFolder & "\" & FileName)
        Dim rgx As New Regex("(?<=<AssemblyName>).+(?=</AssemblyName>)")
        Dim mc As MatchCollection = rgx.Matches(vbproj)
        For Each m As Match In mc
            Zufall()
            System.Threading.Thread.Sleep(200)
            vbproj = vbproj.Replace("<AssemblyName>" & m.Value & "</AssemblyName>", "<AssemblyName>" & rndStr & "</AssemblyName>")
        Next
        My.Computer.FileSystem.WriteAllText(ObfuscatedFolder & "\" & FileName, vbproj, False)
    End Sub


    Private Sub Comment(ByVal FilterObject As String)
        '\Dim .*?\s
        Dim Results As New List(Of String)  'Res als List
        Dim Curr As String = ""
        Dim MC As MatchCollection   'Deklariere MC als MatchCollection
        'Je nachdem ob CheckBox1 gecheckt ist, wird Groß- und Kleinschreibung ignoriert oder auch nicht:
        MC = Regex.Matches(txtCode.Text, FilterObject, RegexOptions.IgnoreCase) 'Wenn gecheckt, wird sie ignoriert

        For i As Integer = 0 To MC.Count - 1     'Schleife durchlaufen
            If Results.Contains(MC(i).Value) = False Then
                Curr = MC(i).Value.ToString
                Curr = Curr.Replace("'", Nothing)
                Dim item As New ListViewItem
                If Not Curr.StartsWith(Chr(34)) = True Then

                    item.Text = (Curr)
                    item.SubItems.Add("")
                    lstComment.Items.Add(item)
                    'ListBox1.Items.Add(Curr)'Übereinstimmungen in der ListBox eintragen
                End If
            End If
        Next
    End Sub

    Private Sub ConstChange(ByVal FilterObject As String)
        Dim Results As New List(Of String)  'Res als List
        Dim Curr As String = ""
        Dim MC As MatchCollection   'Deklariere MC als MatchCollection
        'Je nachdem ob CheckBox1 gecheckt ist, wird Groß- und Kleinschreibung ignoriert oder auch nicht:
        MC = Regex.Matches(txtCode.Text, FilterObject, RegexOptions.IgnoreCase) 'Wenn gecheckt, wird sie ignoriert


        For i As Integer = 0 To MC.Count - 1     'Schleife durchlaufen
            If Results.Contains(MC(i).Value) = False Then
                Curr = MC(i).Value.ToString
                ' Curr = Regex.Replace(Curr, "\s(dim|private|friend|static|public)", "", RegexOptions.IgnoreCase)
                'Curr = Regex.Replace(Curr, "As (new [a-z]+.*|[a-z]+)", "", RegexOptions.IgnoreCase).Replace(" ", Nothing).Replace(vbCrLf, Nothing).Replace(vbNewLine, Nothing)
                Dim item As New ListViewItem
                Curr = Curr.Replace("Const ", Nothing)
                item.Text = (Curr)
                item.SubItems.Add("")
                lstConst.Items.Add(item)
                'ListBox1.Items.Add(Curr)'Übereinstimmungen in der ListBox eintragen
            End If
        Next
    End Sub

    Private Sub vararr(ByVal FilterObject As String)
        '\Dim .*?\s

        Dim Results As New List(Of String)  'Res als List
        Dim Curr As String = ""
        Dim MC As MatchCollection   'Deklariere MC als MatchCollection
        'Je nachdem ob CheckBox1 gecheckt ist, wird Groß- und Kleinschreibung ignoriert oder auch nicht:
        MC = Regex.Matches(txtCode.Text, FilterObject, RegexOptions.IgnoreCase) 'Wenn gecheckt, wird sie ignoriert


        For i As Integer = 0 To MC.Count - 1     'Schleife durchlaufen
            If Results.Contains(MC(i).Value) = False Then
                Curr = MC(i).Value.ToString
                Curr = Regex.Replace(Curr, "\s(dim|private|friend|static|public)", "", RegexOptions.IgnoreCase)
                Curr = Regex.Replace(Curr, "As (new [a-z]+.*|[a-z]+)", "", RegexOptions.IgnoreCase).Replace(" ", Nothing).Replace(vbCrLf, Nothing).Replace(vbNewLine, Nothing)
                Dim item As New ListViewItem
                item.Text = (Curr)
                item.SubItems.Add("")
                lstVar.Items.Add(item)
                'ListBox1.Items.Add(Curr)'Übereinstimmungen in der ListBox eintragen
            End If
        Next
    End Sub

    Private Sub varunq(ByVal FilterObject As String)
        '\Dim .*?\s

        Dim Results As New List(Of String)  'Res als List
        Dim Curr As String = ""
        Dim MC As MatchCollection   'Deklariere MC als MatchCollection
        'Je nachdem ob CheckBox1 gecheckt ist, wird Groß- und Kleinschreibung ignoriert oder auch nicht:
        MC = Regex.Matches(txtCode.Text, FilterObject, RegexOptions.IgnoreCase) 'Wenn gecheckt, wird sie ignoriert


        For i As Integer = 0 To MC.Count - 1     'Schleife durchlaufen
            If Results.Contains(MC(i).Value) = False Then
                Curr = MC(i).Value.ToString
                Curr = Regex.Replace(Curr, "\s(dim|private|friend|static|public)", "", RegexOptions.IgnoreCase)
                Curr = Regex.Replace(Curr, "As (new [a-z]+.*|[a-z]+)", "", RegexOptions.IgnoreCase).Replace(" ", Nothing).Replace(vbCrLf, Nothing).Replace(vbNewLine, Nothing)
                Dim str() As String = Curr.Split(",")
                For Each el As String In str
                    Dim item As New ListViewItem
                    item.Text = (el)
                    item.SubItems.Add("")
                    lstVar.Items.Add(item)
                Next
                'ListBox1.Items.Add(Curr)'Übereinstimmungen in der ListBox eintragen
            End If
        Next
    End Sub

    Private Sub str(ByVal FilterObject As String)
        '\Dim .*?\s
        Dim Results As New List(Of String)  'Res als List
        Dim Curr As String = ""
        Dim MC As MatchCollection   'Deklariere MC als MatchCollection
        MC = Regex.Matches(txtCode.Text, FilterObject, RegexOptions.IgnoreCase) 'Wenn gecheckt, wird sie ignoriert
        For i As Integer = 0 To MC.Count - 1     'Schleife durchlaufen
            If Results.Contains(MC(i).Value) = False Then
                Curr = MC(i).Value.ToString
                If Curr = "kernel32" Then
                ElseIf Curr = "kernel32.dll" Then
                ElseIf Curr = "sqlite3" Then
                Else
                    Dim item As New ListViewItem
                    item.Text = (Curr.Replace(Chr(34), ""))
                    item.SubItems.Add("")
                    lstStr.Items.Add(item)
                End If
            End If
        Next
    End Sub

    Private Sub var(ByVal FilterObject As String)
        '\Dim .*?\s

        Dim Results As New List(Of String)  'Res als List
        Dim Curr As String = ""
        Dim MC As MatchCollection   'Deklariere MC als MatchCollection
        'Je nachdem ob CheckBox1 gecheckt ist, wird Groß- und Kleinschreibung ignoriert oder auch nicht:
        MC = Regex.Matches(txtCode.Text, FilterObject, RegexOptions.IgnoreCase) 'Wenn gecheckt, wird sie ignoriert


        For i As Integer = 0 To MC.Count - 1     'Schleife durchlaufen
            If Results.Contains(MC(i).Value) = False Then
                Curr = MC(i).Value.ToString
                Curr = Regex.Replace(Curr, "\s(dim|private|friend|static|public)", "", RegexOptions.IgnoreCase)
                Curr = Regex.Replace(Curr, "As (new [a-z]+.*|[a-z]+)", "", RegexOptions.IgnoreCase).Replace(" ", Nothing).Replace(vbCrLf, Nothing).Replace(vbNewLine, Nothing)
                Dim item As New ListViewItem
                item.Text = (Curr)
                item.SubItems.Add("")
                lstVar.Items.Add(item)
                'ListBox1.Items.Add(Curr)'Übereinstimmungen in der ListBox eintragen
            End If
        Next
    End Sub

    Private Sub FunctionChange(ByVal FilterObject As String)

        Dim Results As New List(Of String)  'Res als List
        Dim Curr As String = ""
        Dim MC As MatchCollection   'Deklariere MC als MatchCollection
        'Je nachdem ob CheckBox1 gecheckt ist, wird Groß- und Kleinschreibung ignoriert oder auch nicht:
        MC = Regex.Matches(txtCode.Text, FilterObject, RegexOptions.IgnoreCase) 'Wenn gecheckt, wird sie ignoriert


        For i As Integer = 0 To MC.Count - 1     'Schleife durchlaufen
            If Results.Contains(MC(i).Value) = False Then
                Curr = MC(i).Value.ToString

                '\s[a-z]+\ssub\s.*?\n


                Curr = Regex.Replace(Curr, "handles [a-z0-9]+\.[a-z]+", "", RegexOptions.IgnoreCase)
                Curr = Regex.Replace(Curr, "\s[a-z]+\sfunction\s", "", RegexOptions.IgnoreCase)
                If InStr(Curr, "End Sub") Then
                ElseIf Curr = Nothing Then
                ElseIf Curr = " " Then
                ElseIf Curr = vbNewLine Then
                Else
                    If InStr(Curr, "(") Then
                        Curr = Curr.Split("(")(0)
                        Dim item As New ListViewItem
                        item.Text = (Curr)
                        item.SubItems.Add("")
                        lstFunction.Items.Add(item)
                    End If
                End If

            End If
        Next
    End Sub

    Private Sub subs(ByVal FilterObject As String)

        Dim Results As New List(Of String)  'Res als List
        Dim Curr As String = ""
        Dim MC As MatchCollection   'Deklariere MC als MatchCollection
        'Je nachdem ob CheckBox1 gecheckt ist, wird Groß- und Kleinschreibung ignoriert oder auch nicht:
        MC = Regex.Matches(txtCode.Text, FilterObject, RegexOptions.IgnoreCase) 'Wenn gecheckt, wird sie ignoriert


        For i As Integer = 0 To MC.Count - 1     'Schleife durchlaufen
            If Results.Contains(MC(i).Value) = False Then
                Curr = MC(i).Value.ToString

                '\s[a-z]+\ssub\s.*?\n


                Curr = Regex.Replace(Curr, "handles [a-z0-9]+\.[a-z]+", "", RegexOptions.IgnoreCase)
                Curr = Regex.Replace(Curr, "\s[a-z]+\ssub\s", "", RegexOptions.IgnoreCase)
                If InStr(Curr, "End Sub") Then
                ElseIf Curr = Nothing Then
                ElseIf Curr = " " Then
                ElseIf Curr = vbNewLine Then
                Else
                    If InStr(Curr, "(") Then
                        Curr = Curr.Split("(")(0)
                        Dim item As New ListViewItem
                        item.Text = (Curr)
                        item.SubItems.Add("")
                        lstSub.Items.Add(item)
                    End If
                End If

            End If
        Next
    End Sub

    Private Sub Replace()

        '\s(dim|private|friend|static|public) [a-z0-9]+, [a-z0-9]+ As (new [a-z]+.*|[a-z]+)
        Dim code As String
        For Each el As String In txtCode.Lines
            code &= " " & el & " " & vbNewLine
        Next
        txtCode.Text = code
        If cbVar.Checked = True Then
            var("\s(dim|private|friend|static|public) [a-z0-9]+ As (new [a-z]+.*|[a-z]+)")
            varunq("\s(dim|private|friend|static|public) [a-z0-9\,\s]+\(\) As (new [a-z]+.*|[a-z]+)")
            vararr("\s(dim|private|friend|static|public) [a-z0-9]+\(\) As (new [a-z]+.*|[a-z]+)")
        End If
        If cbSub.Checked = True Then
            subs("\s[a-z]+\ssub\s.*?\n")
        End If
        If cbFunction.Checked = True Then
            FunctionChange("\s[a-z]+\sfunction\s.*?\n")
        End If
        If cbStr.Checked = True Then
            '"(\sPrivate Const [a-z0-9]+ As (new [a-z]+.*|[a-z]+\s\=\s|.*))" &
            str(Chr(34) & "[a-z0-9\s\.\-\+:\\/|\&\*\;_]+" & Chr(34))
        End If

        If cbConst.Checked = True Then
            ConstChange("Const\s[a-z0-9]+")
        End If

        If cbComment.Checked = True Then
            Comment("\'[a-z0-9\s\.\-\+\/|\&\*\;_\(\)\']+")
        End If
        ProgressBar1.Value = 0
        ProgressBar1.Maximum = lstVar.Items.Count + lstStr.Items.Count + lstSub.Items.Count + lstComment.Items.Count + lstConst.Items.Count + lstFunction.Items.Count
        If cbVar.Checked = True Then
            For Each item As ListViewItem In lstVar.Items
                Zufall()
                Dim el As String = item.Text
                If InStr(el, "()") Then
                    el = el.Replace("()", Nothing)
                    item.SubItems(1).Text = rndStr & "()"
                Else
                    item.SubItems(1).Text = rndStr
                End If

                System.Threading.Thread.Sleep(500)
                txtCode.Text = txtCode.Text.Replace(" " & el & " ", " " & rndStr & " ").Replace("(" & el & ")", "(" & rndStr & ")").Replace(el & ".", rndStr & ".").Replace("(" & el & ",", "(" & rndStr & ",").Replace(" " & el & ",", " " & rndStr & ",").Replace(" " & el & ")", " " & rndStr & ")").Replace("(" & el & " +", "(" & rndStr & " +").Replace("." & el & ")", "." & rndStr & ")").Replace("(" & el & " &", "(" & rndStr & " &").Replace("Return " & el, "Return " & rndStr).Replace("If " & el & ".", "If " & rndStr & ".").Replace("." & el & " " & "=", "." & rndStr & " " & "=").Replace("." & el & " " & "<>", "." & rndStr & " " & "<>").Replace("." & el & " -", "." & rndStr & " -").Replace("(" & el & " -", "(" & rndStr & " -").Replace(" " & el & "(", " " & rndStr & "(").Replace("(" & el & "(", "(" & rndStr & "(").Replace("(" & el, "(" & rndStr)
                ProgressBar1.Value = ProgressBar1.Value + 1
            Next
        End If

        If cbComment.Checked = True Then
            For Each item As ListViewItem In lstComment.Items
                ZufallComment()
                Dim el As String = item.Text
                item.SubItems(1).Text = rndComment
                System.Threading.Thread.Sleep(500)
                txtCode.Text = txtCode.Text.Replace(el, rndComment)
                ProgressBar1.Value = ProgressBar1.Value + 1
            Next
        End If

        If cbConst.Checked = True Then
            For Each item As ListViewItem In lstConst.Items
                Zufall()
                Dim el As String = item.Text
                item.SubItems(1).Text = rndStr
                System.Threading.Thread.Sleep(500)
                txtCode.Text = txtCode.Text.Replace("Const " & el, "Const " & rndStr)
                ProgressBar1.Value = ProgressBar1.Value + 1
            Next
        End If
        If cbFunction.Checked = True Then
            For Each item As ListViewItem In lstFunction.Items
                Zufall()
                Dim el As String = item.Text
                item.SubItems(1).Text = rndStr
                System.Threading.Thread.Sleep(500)
                txtCode.Text = txtCode.Text.Replace(el, rndStr)
                ProgressBar1.Value = ProgressBar1.Value + 1
            Next
        End If
        If cbSub.Checked = True Then
            For Each item As ListViewItem In lstSub.Items
                Zufall()
                Dim el As String = item.Text
                item.SubItems(1).Text = rndStr
                System.Threading.Thread.Sleep(500)
                txtCode.Text = txtCode.Text.Replace(el, rndStr)
                ProgressBar1.Value = ProgressBar1.Value + 1
            Next
        End If
        If cbStr.Checked = True Then
            Zufall()
            ZufallEncryption()
            System.Threading.Thread.Sleep(200)
            For Each item As ListViewItem In lstStr.Items
                Dim el As String = item.Text

                For Each line As String In txtCode.Lines
                    If InStr(line, el) Then
                        If InStr(line, "Const ") Then
                            Dim sString As String = el
                            Dim nLen As Integer = sString.Length
                            Dim msg As String = ""
                            For a As Integer = 1 To nLen
                                msg &= " Chr" & "(" & Asc(sString.Chars(a - 1)) & ") &"
                            Next a
                            msg = msg.Substring(0, msg.Length - 1)

                            txtCode.Text = txtCode.Text.Replace(Chr(34) & el & Chr(34), msg)
                        Else
                            If rbXOR.Checked = True Then
                                XorZufall()
                                hash = x0r(el, x0rRnd)
                                item.SubItems(1).Text = ascii()
                                txtCode.Text = txtCode.Text.Replace(Chr(34) & el & Chr(34), (EncryptionStr & "(" & ascii() & ", " & Chr(34) & x0rRnd & Chr(34) & ")"))
                            ElseIf rbRC4.Checked = True Then
                                hash = rc4(el, rndStr)
                                item.SubItems(1).Text = ascii()
                                txtCode.Text = txtCode.Text.Replace(Chr(34) & el & Chr(34), (EncryptionStr & "(" & ascii() & ")"))
                            ElseIf rbAES.Checked = True Then
                                hash = AES(el, rndStr)
                                item.SubItems(1).Text = hash
                                txtCode.Text = txtCode.Text.Replace(Chr(34) & el & Chr(34), (EncryptionStr & "(" & Chr(34) & hash & Chr(34)) & ")")
                            ElseIf rbBase64.Checked = True Then
                                Dim byt As Byte() = System.Text.Encoding.UTF8.GetBytes(el)
                                hash = Convert.ToBase64String(byt)
                                item.SubItems(1).Text = hash
                                txtCode.Text = txtCode.Text.Replace(Chr(34) & el & Chr(34), (EncryptionStr & "(" & Chr(34) & hash & Chr(34)) & ")")
                            End If

                        End If
                    End If
                Next
                ProgressBar1.Value = ProgressBar1.Value + 1
            Next
        End If

        If cbTrash.Checked = True Then
            If ComboBoxTrash.Text = "Trash every Line".Trim Then
                Dim sourceCode As String
                For Each el As String In txtCode.Lines
                    For Each item As ListViewItem In lstTrash.Items
                        ZufallBuchstaben()
                        ZufallZahl()
                        ZufallType()
                        System.Threading.Thread.Sleep(200)
                        sourceCode &= el & vbNewLine & item.Text.Replace("%RANDOM%", RANDOM).Replace("%RANDOMNUMBER%", RANDOMNUMBER).Replace("%RANDOMTYPE%", RANDOMTYPE) & vbNewLine
                        txtCode.Text = sourceCode
                    Next
                Next
            ElseIf ComboBoxTrash.Text = "Trashlevel".Trim Then
                If ComboBoxTrashLevel.Text = "Level 1".Trim Then
                    Dim sourceCode As String
                    Dim i As Integer = 0
                    For Each el As String In txtCode.Lines
                        sourceCode &= el & vbNewLine
                        If i = 25 Then
                            For Each item As ListViewItem In lstTrash.Items
                                ZufallBuchstaben()
                                ZufallZahl()
                                ZufallType()
                                System.Threading.Thread.Sleep(200)

                                sourceCode &= vbNewLine & item.Text.Replace("%RANDOM%", RANDOM).Replace("%RANDOMNUMBER%", RANDOMNUMBER).Replace("%RANDOMTYPE%", RANDOMTYPE) & vbNewLine
                                txtCode.Text = sourceCode
                                i = 0
                            Next
                        Else
                            i += 1
                            txtCode.Text = sourceCode
                        End If
                    Next
                ElseIf ComboBoxTrashLevel.Text = "Level 2".Trim Then
                    Dim sourceCode As String
                    Dim i As Integer = 0
                    For Each el As String In txtCode.Lines
                        sourceCode &= el & vbNewLine
                        If i = 20 Then
                            For Each item As ListViewItem In lstTrash.Items
                                ZufallBuchstaben()
                                ZufallZahl()
                                ZufallType()
                                System.Threading.Thread.Sleep(200)

                                sourceCode &= vbNewLine & item.Text.Replace("%RANDOM%", RANDOM).Replace("%RANDOMNUMBER%", RANDOMNUMBER).Replace("%RANDOMTYPE%", RANDOMTYPE) & vbNewLine
                                txtCode.Text = sourceCode
                                i = 0
                            Next
                        Else
                            i += 1
                            txtCode.Text = sourceCode
                        End If
                    Next
                ElseIf ComboBoxTrashLevel.Text = "Level 3".Trim Then
                    Dim sourceCode As String
                    Dim i As Integer = 0
                    For Each el As String In txtCode.Lines
                        sourceCode &= el & vbNewLine
                        If i = 15 Then
                            For Each item As ListViewItem In lstTrash.Items
                                ZufallBuchstaben()
                                ZufallZahl()
                                ZufallType()
                                System.Threading.Thread.Sleep(200)

                                sourceCode &= vbNewLine & item.Text.Replace("%RANDOM%", RANDOM).Replace("%RANDOMNUMBER%", RANDOMNUMBER).Replace("%RANDOMTYPE%", RANDOMTYPE) & vbNewLine
                                txtCode.Text = sourceCode
                                i = 0
                            Next
                        Else
                            i += 1
                            txtCode.Text = sourceCode
                        End If
                    Next
                ElseIf ComboBoxTrashLevel.Text = "Level 4".Trim Then
                    Dim sourceCode As String
                    Dim i As Integer = 0
                    For Each el As String In txtCode.Lines
                        sourceCode &= el & vbNewLine
                        If i = 10 Then
                            For Each item As ListViewItem In lstTrash.Items
                                ZufallBuchstaben()
                                ZufallZahl()
                                ZufallType()
                                System.Threading.Thread.Sleep(200)

                                sourceCode &= vbNewLine & item.Text.Replace("%RANDOM%", RANDOM).Replace("%RANDOMNUMBER%", RANDOMNUMBER).Replace("%RANDOMTYPE%", RANDOMTYPE) & vbNewLine
                                txtCode.Text = sourceCode
                                i = 0
                            Next
                        Else
                            i += 1
                            txtCode.Text = sourceCode
                        End If
                    Next
                ElseIf ComboBoxTrashLevel.Text = "Level 5".Trim Then
                    Dim sourceCode As String
                    Dim i As Integer = 0
                    For Each el As String In txtCode.Lines
                        sourceCode &= el & vbNewLine
                        If i = 5 Then
                            For Each item As ListViewItem In lstTrash.Items
                                ZufallBuchstaben()
                                ZufallZahl()
                                ZufallType()
                                System.Threading.Thread.Sleep(200)

                                sourceCode &= vbNewLine & item.Text.Replace("%RANDOM%", RANDOM).Replace("%RANDOMNUMBER%", RANDOMNUMBER).Replace("%RANDOMTYPE%", RANDOMTYPE) & vbNewLine
                                txtCode.Text = sourceCode
                                i = 0
                            Next
                        Else
                            i += 1
                            txtCode.Text = sourceCode
                        End If
                    Next
                End If
            End If
        End If

        If cbJunkSub.Checked = True Then
            For i As Integer = 1 To txtJunkSubTo.Text
                Zufall()
                System.Threading.Thread.Sleep(200)
                If lstJunkSubTrash.Items.Count = 0 Then
                    txtCode.Text &= "Private Sub " & rndStr & "()" & vbNewLine & "End Sub" & vbNewLine
                Else
                    Dim el As String = ""
                    For Each item As ListViewItem In lstJunkSubTrash.Items
                        ZufallBuchstaben()
                        ZufallZahl()
                        ZufallType()
                        System.Threading.Thread.Sleep(200)
                        el &= item.Text.Replace("%RANDOM%", RANDOM).Replace("%RANDOMNUMBER%", RANDOMNUMBER).Replace("%RANDOMTYPE%", RANDOMTYPE) & vbNewLine
                    Next
                    txtCode.Text &= "Private Sub " & rndStr & "()" & vbNewLine & el & vbNewLine & "End Sub" & vbNewLine
                End If
            Next
            If InStr(txtCode.Text, "End Class") Then
                txtCode.Text = txtCode.Text.Replace("End Class", Nothing)
                txtCode.Text &= "End Class"
            End If
        End If

        If cbStr.Checked = True Then
            If rbXOR.Checked = True Then
                x0r()
            ElseIf rbRC4.Checked = True Then
                rc4()
            ElseIf rbAES.Checked = True Then
                AES()
            ElseIf rbBase64.Checked = True Then
                base64()
            End If
        End If

    End Sub

    Private Sub FileInformation()
        Dim AssemblyInfo, AssemblyVersion, AssemblyFileVersion, AssemblyTitle, AssemblyDescription, AssemblyCompany, AssemblyProduct, AssemblyTrademark As String

        AssemblyInfo = My.Computer.FileSystem.ReadAllText(ObfuscatedFolder & "\My Project\AssemblyInfo.vb")

        Dim rgx As New Regex("(?<=<Assembly:\sAssemblyVersion).+(?=>)")
        Dim mc As MatchCollection = rgx.Matches(AssemblyInfo)
        For Each m As Match In mc
            AssemblyVersion = m.Value.Split("(")(1).Split(")")(0)
            AssemblyInfo = AssemblyInfo.Replace("<Assembly: AssemblyVersion(" & AssemblyVersion & ")>", "<Assembly: AssemblyVersion(" & Chr(34) & ZufallAssemblyVersion() & "." & ZufallAssemblyVersion() & "." & ZufallAssemblyVersion() & "." & ZufallAssemblyVersion() & Chr(34) & ")>")
        Next
        Dim rgx2 As New Regex("(?<=<Assembly:\sAssemblyFileVersion).+(?=>)")
        Dim mc2 As MatchCollection = rgx2.Matches(AssemblyInfo)
        For Each m As Match In mc2
            AssemblyFileVersion = m.Value.Split("(")(1).Split(")")(0)
            AssemblyInfo = AssemblyInfo.Replace("<Assembly: AssemblyFileVersion(" & AssemblyFileVersion & ")>", "<Assembly: AssemblyFileVersion(" & Chr(34) & ZufallAssemblyVersion() & "." & ZufallAssemblyVersion() & "." & ZufallAssemblyVersion() & "." & ZufallAssemblyVersion() & Chr(34) & ")>")
        Next
        Dim rgx3 As New Regex("(?<=<Assembly:\sAssemblyTitle).+(?=>)")
        Dim mc3 As MatchCollection = rgx3.Matches(AssemblyInfo)
        For Each m As Match In mc3
            AssemblyTitle = m.Value.Split("(")(1).Split(")")(0)
            Zufall()
            System.Threading.Thread.Sleep(200)
            AssemblyInfo = AssemblyInfo.Replace("<Assembly: AssemblyTitle(" & AssemblyTitle & ")>", "<Assembly: AssemblyTitle(" & Chr(34) & rndStr & Chr(34) & ")>")
        Next
        Dim rgx4 As New Regex("(?<=<Assembly:\sAssemblyDescription).+(?=>)")
        Dim mc4 As MatchCollection = rgx4.Matches(AssemblyInfo)
        For Each m As Match In mc4
            AssemblyDescription = m.Value.Split("(")(1).Split(")")(0)
            Zufall()
            System.Threading.Thread.Sleep(200)
            AssemblyInfo = AssemblyInfo.Replace("<Assembly: AssemblyDescription(" & AssemblyDescription & ")>", "<Assembly: AssemblyDescription(" & Chr(34) & rndStr & Chr(34) & ")>")
        Next
        Dim rgx5 As New Regex("(?<=<Assembly:\sAssemblyCompany).+(?=>)")
        Dim mc5 As MatchCollection = rgx5.Matches(AssemblyInfo)
        For Each m As Match In mc5
            AssemblyCompany = m.Value.Split("(")(1).Split(")")(0)
            Zufall()
            System.Threading.Thread.Sleep(200)
            AssemblyInfo = AssemblyInfo.Replace("<Assembly: AssemblyCompany(" & AssemblyCompany & ")>", "<Assembly: AssemblyCompany(" & Chr(34) & rndStr & Chr(34) & ")>")
        Next
        Dim rgx6 As New Regex("(?<=<Assembly:\sAssemblyProduct).+(?=>)")
        Dim mc6 As MatchCollection = rgx6.Matches(AssemblyInfo)
        For Each m As Match In mc6
            AssemblyProduct = m.Value.Split("(")(1).Split(")")(0)
            Zufall()
            System.Threading.Thread.Sleep(200)
            AssemblyInfo = AssemblyInfo.Replace("<Assembly: AssemblyProduct(" & AssemblyProduct & ")>", "<Assembly: AssemblyProduct(" & Chr(34) & rndStr & Chr(34) & ")>")
        Next
        Dim rgx7 As New Regex("(?<=<Assembly:\sAssemblyTrademark).+(?=>)")
        Dim mc7 As MatchCollection = rgx7.Matches(AssemblyInfo)
        For Each m As Match In mc7
            AssemblyTrademark = m.Value.Split("(")(1).Split(")")(0)
            Zufall()
            System.Threading.Thread.Sleep(200)
            AssemblyInfo = AssemblyInfo.Replace("<Assembly: AssemblyTrademark(" & AssemblyTrademark & ")>", "<Assembly: AssemblyTrademark(" & Chr(34) & rndStr & Chr(34) & ")>")
        Next

        My.Computer.FileSystem.WriteAllText(ObfuscatedFolder & "\My Project\AssemblyInfo.vb", AssemblyInfo, False)
    End Sub

    Private Sub IconChange()
        Dim IconName As String = My.Computer.FileSystem.GetFileInfo(txtIconPath.Text).Name
        vbproj = My.Computer.FileSystem.ReadAllText(ObfuscatedFolder & "\" & FileName)
        Dim rgx As New Regex("(?<=<ApplicationIcon>).+(?=</ApplicationIcon>)")
        Dim mc As MatchCollection = rgx.Matches(vbproj)
        If mc.Count = Nothing Then
            vbproj = vbproj.Replace("</Project>", "<PropertyGroup>" & vbNewLine & "<ApplicationIcon>" & IconName & "</ApplicationIcon>" & vbNewLine & "</PropertyGroup>" & vbNewLine & "</Project>")
        Else
            For Each m As Match In mc
                Zufall()
                System.Threading.Thread.Sleep(200)
                vbproj = vbproj.Replace("<ApplicationIcon>" & m.Value & "</ApplicationIcon>", "<ApplicationIcon>" & IconName & "</ApplicationIcon>")
            Next
        End If

        Dim rgx1 As New Regex("(?<=<Content Include=).+(?=\s/>)")
        Dim mc1 As MatchCollection = rgx1.Matches(vbproj)
        If mc1.Count = Nothing Then
            vbproj = vbproj.Replace("</Project>", "<ItemGroup>" & vbNewLine & "<Content Include=" & Chr(34) & IconName & Chr(34) & " />" & vbNewLine & "</ItemGroup>" & vbNewLine & "</Project>")
        Else
            For Each m As Match In mc1
                Zufall()
                System.Threading.Thread.Sleep(200)
                vbproj = vbproj.Replace("<Content Include=" & m.Value & " />", "<Content Include=" & Chr(34) & IconName & Chr(34) & " />")
            Next
        End If
        My.Computer.FileSystem.CopyFile(txtIconPath.Text, ObfuscatedFolder & "\" & IconName)
        My.Computer.FileSystem.WriteAllText(ObfuscatedFolder & "\" & FileName, vbproj, False)
    End Sub

#End Region

#Region " Buttons "


    Private Sub ReplaceThread()
        For i As Integer = 1 To AnzahlProjekte.Value
            orginal = txtCode.Text
            Zufall()
            Dim desktop As String = My.Computer.FileSystem.SpecialDirectories.Desktop
            ObfuscatedFolder = desktop & "\" & rndStr

            If Not ListBox1.Items.Count = 0 Then
                My.Computer.FileSystem.CopyDirectory(folderpath, desktop & "\" & rndStr)
                If cbAssemblyName.Checked = True Then
                    AssemblyName()
                End If
                If cbFileInformation.Checked = True Then
                    FileInformation()
                End If
                If cbIconChange.Checked = True Then
                    IconChange()
                End If
                For Each el As String In ListBox1.Items
                    Delete()
                    txtCode.Text = My.Computer.FileSystem.ReadAllText(ObfuscatedFolder & "\" & el)
                    Replace()
                    My.Computer.FileSystem.WriteAllText(ObfuscatedFolder & "\" & el, txtCode.Text, False)
                Next
            Else
                Delete()
                Replace()
            End If
        Next
        MsgBox("Finish")
    End Sub

    Private Sub btnIcon_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnIcon.Click
        Dim opn As New OpenFileDialog
        With opn
            .CheckPathExists = True
            .FileName = ""
            .Filter = ("Icon Dateien(*.ico)| *.ico")
            If .ShowDialog = Windows.Forms.DialogResult.OK Then
                txtIconPath.Text = .FileName
                Dim aIcon As Icon = New Icon(.FileName)
                Dim aIcon2 As Icon = New Icon(aIcon, 32, 32)
                imgIcon.Image = aIcon2.ToBitmap
            End If
        End With
    End Sub

    Private Sub btnReplace_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnReplace.Click
        Dim thread1 As New Threading.Thread(AddressOf ReplaceThread)
        thread1.IsBackground = True
        CheckForIllegalCrossThreadCalls = False
        thread1.Start()
    End Sub

    Private Sub btnOpen_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnOpen.Click
        ListBox1.Items.Clear()
        Dim opn As New OpenFileDialog
        With opn
            .FileName = ""
            .Filter = "VB.NET-Projektdatei |*.vbproj"
            If .ShowDialog = Windows.Forms.DialogResult.OK Then
                filepath = .FileName
                FileName = .SafeFileName
                folderpath = .FileName.Replace(.SafeFileName, Nothing)
                iFile = My.Computer.FileSystem.ReadAllText(filepath)
                Dim rgx As New Regex("(?<=<Compile Include=" & Chr(34) & ").+(?=" & Chr(34) & "(>|\s/>))")
                Dim mc As MatchCollection = rgx.Matches(iFile)
                Dim strb As New StringBuilder

                For Each m As Match In mc
                    Dim spl() As String = m.ToString.Split(".")
                    Try
                        If spl(2) = "Designer" Then
                        End If
                    Catch
                        strb.Append(m.Value & ",")
                    End Try
                Next

                Dim str() As String
                str = strb.ToString.Split(",")

                For Each el As String In str
                    If Not el = Nothing Then
                        If Not el = "My Project\AssemblyInfo.vb".Trim Then
                            ListBox1.Items.Add(el)
                        End If
                    End If
                Next
            End If
        End With
    End Sub

    Private Sub cbStr_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cbStr.CheckedChanged
        If cbStr.Checked = True Then
            rbXOR.Enabled = True
            rbRC4.Enabled = True
            rbAES.Enabled = True
            rbBase64.Enabled = True
        Else
            rbXOR.Enabled = False
            rbRC4.Enabled = False
            rbAES.Enabled = False
            rbBase64.Enabled = False
        End If
    End Sub

    Private Sub btnCopy_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnCopy.Click
        My.Computer.Clipboard.SetText(txtCode.Text)
        MsgBox("Der Code wurde kopiert", MsgBoxStyle.Information)
    End Sub

    Private Sub btnOrginal_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnOrginal.Click
        txtCode.Text = orginal
    End Sub

#End Region

#Region " ListView & ToolStrip "



    Private Sub KopiereAlteVariableToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles KopiereAlteVariableToolStripMenuItem.Click
        For Each item As ListViewItem In lstVar.SelectedItems
            My.Computer.Clipboard.SetText(item.Text)
        Next
    End Sub

    Private Sub KopiereNeueVariableToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles KopiereNeueVariableToolStripMenuItem.Click
        For Each item As ListViewItem In lstVar.SelectedItems
            My.Computer.Clipboard.SetText(item.SubItems(1).Text)
        Next
    End Sub

    Private Sub ToolStripMenuItem1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ToolStripMenuItem1.Click
        For Each item As ListViewItem In lstStr.SelectedItems
            My.Computer.Clipboard.SetText(item.Text)
        Next
    End Sub

    Private Sub ToolStripMenuItem2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ToolStripMenuItem2.Click
        For Each item As ListViewItem In lstStr.SelectedItems
            My.Computer.Clipboard.SetText(item.SubItems(1).Text)
        Next
    End Sub

    Private Sub ToolStripMenuItem3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ToolStripMenuItem3.Click
        Form3.Show()
    End Sub

    Private Sub ToolStripMenuItem4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ToolStripMenuItem4.Click
        For Each item As ListViewItem In lstJunkSubTrash.SelectedItems
            item.Remove()
        Next
    End Sub

    Private Sub ToolStripMenuItem5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ToolStripMenuItem5.Click
        For Each item As ListViewItem In lstJunkSubTrash.Items
            item.Remove()
        Next
    End Sub

    Private Sub ToolStripMenuItem6_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ToolStripMenuItem6.Click
        For Each item As ListViewItem In lstSub.SelectedItems
            My.Computer.Clipboard.SetText(item.Text)
        Next
    End Sub

    Private Sub ToolStripMenuItem10_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ToolStripMenuItem10.Click
        For Each item As ListViewItem In lstConst.SelectedItems
            My.Computer.Clipboard.SetText(item.Text)
        Next
    End Sub

    Private Sub ToolStripMenuItem12_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ToolStripMenuItem12.Click
        For Each item As ListViewItem In lstFunction.SelectedItems
            My.Computer.Clipboard.SetText(item.Text)
        Next
    End Sub

    Private Sub ToolStripMenuItem8_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ToolStripMenuItem8.Click
        For Each item As ListViewItem In lstComment.SelectedItems
            My.Computer.Clipboard.SetText(item.Text)
        Next
    End Sub

    Private Sub ToolStripMenuItem11_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ToolStripMenuItem11.Click
        For Each item As ListViewItem In lstConst.SelectedItems
            My.Computer.Clipboard.SetText(item.SubItems(1).Text)
        Next
    End Sub

    Private Sub ToolStripMenuItem13_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ToolStripMenuItem13.Click
        For Each item As ListViewItem In lstFunction.SelectedItems
            My.Computer.Clipboard.SetText(item.SubItems(1).Text)
        Next
    End Sub

    Private Sub ToolStripMenuItem7_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ToolStripMenuItem7.Click
        For Each item As ListViewItem In lstSub.SelectedItems
            My.Computer.Clipboard.SetText(item.SubItems(1).Text)
        Next
    End Sub

    Private Sub cmsComment_Opening(ByVal sender As System.Object, ByVal e As System.ComponentModel.CancelEventArgs) Handles cmsComment.Opening
        For Each item As ListViewItem In lstComment.SelectedItems
            My.Computer.Clipboard.SetText(item.SubItems(1).Text)
        Next
    End Sub

    Private Sub Delete()
        For Each item As ListViewItem In lstVar.Items
            item.Remove()
        Next
        For Each item As ListViewItem In lstStr.Items
            item.Remove()
        Next
        For Each item As ListViewItem In lstSub.Items
            item.Remove()
        Next
        For Each item As ListViewItem In lstComment.Items
            item.Remove()
        Next
        For Each item As ListViewItem In lstConst.Items
            item.Remove()
        Next
        For Each item As ListViewItem In lstFunction.Items
            item.Remove()
        Next
    End Sub


    Private Sub AddTrashToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles AddTrashToolStripMenuItem.Click
        Form2.Show()
    End Sub

    Private Sub RemoveAllToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles RemoveAllToolStripMenuItem.Click
        For Each item As ListViewItem In lstTrash.Items
            item.Remove()
        Next
    End Sub


    Private Sub RemoveTrashToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles RemoveTrashToolStripMenuItem.Click
        For Each item As ListViewItem In lstTrash.SelectedItems
            item.Remove()
        Next
    End Sub


#End Region

#Region " Decryptions "

    Private Function ascii()
        Dim sString As String = hash
        Dim nLen As Integer = sString.Length
        Dim msg As String = ""
        For a As Integer = 1 To nLen
            msg &= " Chr" & "(" & Asc(sString.Chars(a - 1)) & ") &"
        Next a
        msg = msg.Substring(0, msg.Length - 1)
        Return msg
    End Function

    Private Sub lineEnd()
        If InStr(txtCode.Text, "End Module") Then
            txtCode.Text = txtCode.Text.Replace("End Module", "")
            lastline = "End Module"
        ElseIf InStr(txtCode.Text, "End Class") Then
            txtCode.Text = txtCode.Text.Replace("End Class", "")
            lastline = "End Class"
        End If
    End Sub

    Private Sub base64()
        lineEnd()
        Dim strBase64 As String = ZufallVar()
        Dim bBase64 As String = ZufallVar()
        Dim zurückBase64 As String = ZufallVar()
        txtCode.Text &= "Public Function " & EncryptionStr & "(ByVal " & strBase64 & " As String)" & vbNewLine _
           & " Dim " & bBase64 & " As Byte() = Convert.FromBase64String(" & strBase64 & ")" & vbNewLine _
            & "Dim " & zurückBase64 & " As String = System.Text.Encoding.UTF8.GetString(" & bBase64 & ")" & vbNewLine _
           & "Return " & zurückBase64 & vbNewLine _
            & "End Function" & vbNewLine & lastline
    End Sub

    Private Function b64(ByVal str As String)
        Dim b As Byte() = Convert.FromBase64String(str)
        Dim zurück As String = System.Text.Encoding.UTF8.GetString(b)
        Return zurück
    End Function

    Private Sub rc4()
        lineEnd()
        Dim messagerc4 As String = ZufallVar()
        Dim passwordrc4 As String = ZufallVar()
        Dim irc4 As String = ZufallVar()
        Dim jrc4 As String = ZufallVar()
        Dim cipherrc4 As String = ZufallVar()
        Dim returncipherrc4 As String = ZufallVar()
        Dim sboxrc4 As String = ZufallVar()
        Dim keyrc4 As String = ZufallVar()
        Dim intLengthrc4 As String = ZufallVar()
        Dim arc4 As String = ZufallVar()
        Dim ctmp1rc4 As String = ZufallVar()
        Dim xrc4 As String = ZufallVar()
        Dim brc4 As String = ZufallVar()
        Dim tempSwaprc4 As String = ZufallVar()
        Dim itmprc4 As String = ZufallVar()
        Dim krc4 As String = ZufallVar()
        Dim ctmp2rc4 As String = ZufallVar()
        Dim cipherbyrc4 As String = ZufallVar()

        txtCode.Text = "Imports System.Text" & vbNewLine & txtCode.Text & vbNewLine & "Public Function " & EncryptionStr & "(ByVal " & messagerc4 & " As String) As String" & vbNewLine _
         & "Dim " & passwordrc4 & " As String = " & Chr(34) & rndStr & Chr(34) & vbNewLine _
         & "Dim " & irc4 & " As Integer = 0" & vbNewLine _
         & "Dim " & jrc4 & " As Integer = 0" & vbNewLine _
         & "Dim " & cipherrc4 & " As New StringBuilder" & vbNewLine _
          & "Dim " & returncipherrc4 & " As String = String.Empty" & vbNewLine _
         & "Dim " & sboxrc4 & " As Integer() = New Integer(256) {}" & vbNewLine _
       & "Dim " & keyrc4 & " As Integer() = New Integer(256) {}" & vbNewLine _
       & "Dim " & intLengthrc4 & " As Integer = " & passwordrc4 & ".Length" & vbNewLine _
        & "Dim " & arc4 & " As Integer = 0" & vbNewLine _
     & "While " & arc4 & " <= 255" & vbNewLine _
      & "Dim " & ctmp1rc4 & " As Char = (" & passwordrc4 & ".Substring((" & arc4 & " Mod " & intLengthrc4 & "), 1).ToCharArray()(0))" & vbNewLine _
      & keyrc4 & "(" & arc4 & ") = Microsoft.VisualBasic.Strings.Asc(" & ctmp1rc4 & ")" & vbNewLine _
        & sboxrc4 & "(" & arc4 & ") = " & arc4 & vbNewLine _
        & "System.Math.Max(System.Threading.Interlocked.Increment(" & arc4 & "), " & arc4 & " - 1)" & vbNewLine _
        & "End While" & vbNewLine _
        & "Dim " & xrc4 & " As Integer = 0" & vbNewLine _
        & "Dim " & brc4 & " As Integer = 0" & vbNewLine _
        & "While " & brc4 & " <= 255" & vbNewLine _
            & xrc4 & " = (" & xrc4 & " + " & sboxrc4 & "(" & brc4 & ") + " & keyrc4 & "(" & brc4 & ")) Mod 256" & vbNewLine _
            & "Dim " & tempSwaprc4 & " As Integer = " & sboxrc4 & "(" & brc4 & ")" & vbNewLine _
            & sboxrc4 & "(" & brc4 & ") = " & sboxrc4 & "(" & xrc4 & ")" & vbNewLine _
            & sboxrc4 & "(" & xrc4 & ") = " & tempSwaprc4 & vbNewLine _
            & "System.Math.Max(System.Threading.Interlocked.Increment(" & brc4 & "), " & brc4 & " - 1)" & vbNewLine _
        & "End While" & vbNewLine _
        & arc4 & " = 1" & vbNewLine _
        & "While " & arc4 & " <= " & messagerc4 & ".Length" & vbNewLine _
        & "Dim " & itmprc4 & " As Integer = 0" & vbNewLine _
        & irc4 & " = (" & irc4 & " + 1) Mod 256" & vbNewLine _
        & jrc4 & " = (" & jrc4 & " + " & sboxrc4 & "(" & irc4 & ")) Mod 256" & vbNewLine _
        & itmprc4 & " = " & sboxrc4 & "(" & irc4 & ")" & vbNewLine _
        & sboxrc4 & "(" & irc4 & ") = " & sboxrc4 & "(" & jrc4 & ")" & vbNewLine _
        & sboxrc4 & "(" & jrc4 & ") = " & itmprc4 & vbNewLine _
        & "Dim " & krc4 & " As Integer = " & sboxrc4 & "((" & sboxrc4 & "(" & irc4 & ") + " & sboxrc4 & "(" & jrc4 & ")) Mod 256)" & vbNewLine _
        & "Dim " & ctmp2rc4 & " As Char = " & messagerc4 & ".Substring(" & arc4 & " - 1, 1).ToCharArray()(0)" & vbNewLine _
        & itmprc4 & " = Asc(" & ctmp2rc4 & ")" & vbNewLine _
        & "Dim " & cipherbyrc4 & " As Integer = " & itmprc4 & " Xor " & krc4 & vbNewLine _
        & cipherrc4 & ".Append(Chr(" & cipherbyrc4 & "))" & vbNewLine _
        & "System.Math.Max(System.Threading.Interlocked.Increment(" & arc4 & "), " & arc4 & " - 1)" & vbNewLine _
        & "End While" & vbNewLine _
        & returncipherrc4 & " = " & cipherrc4 & ".ToString" & vbNewLine _
        & cipherrc4 & ".Length = 0" & vbNewLine _
        & "Return " & returncipherrc4 & vbNewLine _
         & "End Function" & vbNewLine & lastline
    End Sub

    Private Shared Function rc4(ByVal message As String, ByVal password As String) As String
        Dim i As Integer = 0
        Dim j As Integer = 0
        Dim cipher As New StringBuilder
        Dim returnCipher As String = String.Empty
        Dim sbox As Integer() = New Integer(256) {}
        Dim key As Integer() = New Integer(256) {}
        Dim intLength As Integer = password.Length
        Dim a As Integer = 0
        While a <= 255
            Dim ctmp As Char = (password.Substring((a Mod intLength), 1).ToCharArray()(0))
            key(a) = Microsoft.VisualBasic.Strings.Asc(ctmp)
            sbox(a) = a
            System.Math.Max(System.Threading.Interlocked.Increment(a), a - 1)
        End While
        Dim x As Integer = 0
        Dim b As Integer = 0
        While b <= 255
            x = (x + sbox(b) + key(b)) Mod 256
            Dim tempSwap As Integer = sbox(b)
            sbox(b) = sbox(x)
            sbox(x) = tempSwap
            System.Math.Max(System.Threading.Interlocked.Increment(b), b - 1)
        End While
        a = 1
        While a <= message.Length
            Dim itmp As Integer = 0
            i = (i + 1) Mod 256
            j = (j + sbox(i)) Mod 256
            itmp = sbox(i)
            sbox(i) = sbox(j)
            sbox(j) = itmp
            Dim k As Integer = sbox((sbox(i) + sbox(j)) Mod 256)
            Dim ctmp As Char = message.Substring(a - 1, 1).ToCharArray()(0)
            itmp = Asc(ctmp)
            Dim cipherby As Integer = itmp Xor k
            cipher.Append(Chr(cipherby))
            System.Math.Max(System.Threading.Interlocked.Increment(a), a - 1)
        End While
        returnCipher = cipher.ToString
        cipher.Length = 0
        Return returnCipher
    End Function

    Private Sub x0r()
        lineEnd()
        Dim strX0r As String = ZufallVar()
        Dim pwX0r As String = ZufallVar()
        Dim txtX0r As String = ZufallVar()
        Dim iX0r As String = ZufallVar()
        Dim KeyCharX0r As String = ZufallVar()
        txtCode.Text &= vbNewLine & "Private Function " & EncryptionStr & "(ByVal " & strX0r & " As String, ByVal " & pwX0r & " As String)" & vbNewLine _
      & "Dim " & txtX0r & " As String =" & Chr(34) & Chr(34) & vbNewLine _
      & "Dim " & iX0r & " As Short" & vbNewLine _
        & "Dim " & KeyCharX0r & " As Integer" & vbNewLine _
        & KeyCharX0r & " = Asc(" & pwX0r & ")" & vbNewLine _
        & "For " & iX0r & " = 1 To Len(" & strX0r & ")" & vbNewLine _
            & txtX0r & " &= Chr(" & KeyCharX0r & " Xor Asc(Mid(" & strX0r & ", " & iX0r & ", 1)))" & vbNewLine _
        & "Next " & vbNewLine _
        & "Return " & txtX0r & vbNewLine _
   & "End Function" & vbNewLine & lastline
    End Sub

    Private Function x0r(ByVal str As String, ByVal pw As String)
        Dim txt As String = ""
        Dim i As Short
        Dim KeyChar As Integer
        KeyChar = Asc(pw)
        For i = 1 To Len(str)
            txt &= Chr(KeyChar Xor Asc(Mid(str, i, 1)))
        Next
        Return txt
    End Function

    Private Sub AES()
        lineEnd()
        Dim oAesProvider As String = ZufallVar()
        Dim hashAes As String = ZufallVar()
        Dim btCipher As String = ZufallVar()
        Dim btSalt As String = ZufallVar()
        Dim ms As String = ZufallVar()
        Dim cs As String = ZufallVar()
        txtCode.Text = "Imports System.Security.Cryptography" & vbNewLine & txtCode.Text & vbNewLine & "Private Function " & EncryptionStr & "(ByVal " & hashAes & " As String)" & vbNewLine _
                & "Dim " & oAesProvider & " As New RijndaelManaged" & vbNewLine _
         & "Dim " & btCipher & "() As Byte" & vbNewLine _
         & "Dim " & btSalt & "() As Byte = New Byte() {1, 2, 3, 4, 5, 6, 7, 8}" & vbNewLine _
         & "Dim oKeyGenerator As New Rfc2898DeriveBytes(" & Chr(34) & rndStr & Chr(34) & ", " & btSalt & ")" & vbNewLine _
         & oAesProvider & ".Key = oKeyGenerator.GetBytes(" & oAesProvider & ".Key.Length)" & vbNewLine _
         & oAesProvider & ".IV = oKeyGenerator.GetBytes(" & oAesProvider & ".IV.Length)" & vbNewLine _
         & "Dim " & ms & " As New IO.MemoryStream" & vbNewLine _
         & "Dim " & cs & " As New CryptoStream(" & ms & ", " & oAesProvider & ".CreateDecryptor(), CryptoStreamMode.Write)" & vbNewLine _
         & "Try" & vbNewLine _
             & btCipher & " = Convert.FromBase64String(" & hashAes & ")" & vbNewLine _
             & cs & ".Write(" & btCipher & ", 0, " & btCipher & ".Length)" & vbNewLine _
             & cs & ".Close()" & vbNewLine _
             & "Return System.Text.Encoding.UTF8.GetString(" & ms & ".ToArray)" & vbNewLine _
         & "Catch" & vbNewLine _
        & "End Try" & vbNewLine _
    & "End Function" & vbNewLine & lastline
    End Sub

    Private Function AES(ByVal str As String, ByVal pw As String)
        Dim oAesProvider As New RijndaelManaged
        Dim btClear() As Byte

        Dim btSalt() As Byte = New Byte() {1, 2, 3, 4, 5, 6, 7, 8}

        Dim oKeyGenerator As New Rfc2898DeriveBytes(pw, btSalt)

        oAesProvider.Key = oKeyGenerator.GetBytes(oAesProvider.Key.Length)
        oAesProvider.IV = oKeyGenerator.GetBytes(oAesProvider.IV.Length)

        Dim ms As New IO.MemoryStream
        Dim cs As New CryptoStream(ms, _
            oAesProvider.CreateEncryptor(), _
            CryptoStreamMode.Write)
        btClear = System.Text.Encoding.UTF8.GetBytes(str)
        cs.Write(btClear, 0, btClear.Length)
        cs.Close()
        Return Convert.ToBase64String(ms.ToArray)
    End Function

#End Region

#Region " Listbox & ComboBox & CheckBox "

    Private Sub ListBox1_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ListBox1.SelectedIndexChanged
        Try
            txtCode.Text = My.Computer.FileSystem.ReadAllText(folderpath & "\" & ListBox1.SelectedItem)
        Catch
        End Try
    End Sub

    Private Sub ComboBoxTrash_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ComboBoxTrash.SelectedIndexChanged
        If ComboBoxTrash.Text = "Trashlevel" Then
            ComboBoxTrashLevel.Visible = True
        Else
            ComboBoxTrashLevel.Visible = False
        End If
    End Sub


    Private Sub cbJunkSub_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cbJunkSub.CheckedChanged
        If cbJunkSub.Checked = True Then
            txtJunkSubTo.Enabled = True
            lstJunkSubTrash.Enabled = True
        Else
            txtJunkSubTo.Enabled = False
            lstJunkSubTrash.Enabled = False
        End If
    End Sub


    Private Sub cbIconChange_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cbIconChange.CheckedChanged
        If cbIconChange.Checked = True Then
            GroupBox7.Enabled = True
            btnIcon.Enabled = True
            txtIconPath.Enabled = True
        Else
            GroupBox7.Enabled = False
            btnIcon.Enabled = False
            txtIconPath.Enabled = False
        End If
    End Sub

    Private Sub cbTrash_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cbTrash.CheckedChanged
        If cbTrash.Checked = True Then
            lstTrash.Enabled = True
            ComboBoxTrashLevel.Enabled = True
            ComboBoxTrash.Enabled = True
        Else
            lstTrash.Enabled = False
            ComboBoxTrashLevel.Enabled = False
            ComboBoxTrash.Enabled = False
        End If
    End Sub

#End Region


    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        ComboBoxTrash.Text = "Trashlevel"
        ComboBoxTrashLevel.Text = "Level 1"
       
    End Sub

    Private Sub Label1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Label1.Click

    End Sub

    Private Sub ProgressBar1_Click(sender As System.Object, e As System.EventArgs) Handles ProgressBar1.Click

    End Sub
End Class
