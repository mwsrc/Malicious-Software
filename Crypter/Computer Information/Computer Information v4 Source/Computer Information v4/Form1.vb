Imports System.IO
Imports System.Net
Imports DevComponents.DotNetBar
Public Class Form1
    Dim NewPoint As New System.Drawing.Point()
    Dim X, Y As Integer
    Dim formcolor As New My.MySettings

    Private Sub Form1_FormClosing(ByVal sender As Object, ByVal e As System.Windows.Forms.FormClosingEventArgs) Handles Me.FormClosing
        ' ===================================================================
        ' ===================================================================
        ' All Version's Of "Computer Information" Have Been Coded
        ' By: JoSh iZ Fr3sH From HackForums.Net
        ' Anyone Who is Wishing To Re-Release This On Any WebSite
        ' Must Give Credit To The Original Source Owner (Me, JoSh iZ Fr3sH)
        ' ===================================================================
        ' ===================================================================
        For FadeOut = 90 To 10 Step -10
            Me.Opacity = FadeOut / 100
            Me.Refresh()
            Threading.Thread.Sleep(50)
        Next
        End
    End Sub
    ' ===================================================================
    ' ===================================================================
    ' All Version's Of "Computer Information" Have Been Coded
    ' By: JoSh iZ Fr3sH From HackForums.Net
    ' Anyone Who is Wishing To Re-Release This On Any WebSite
    ' Must Give Credit To The Original Source Owner (Me, JoSh iZ Fr3sH)
    ' ===================================================================
    ' ===================================================================
    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Try

        Catch ex As Exception

        End Try
        For FadeIn = 0.0 To 1.1 Step 0.1
            Me.Opacity = FadeIn
            Me.Refresh()
            Threading.Thread.Sleep(100)
        Next
    End Sub

    Private Sub ColorPickerButton1_SelectedColorChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ColorPickerButton1.SelectedColorChanged
        RibbonPredefinedColorSchemes.ChangeOffice2007ColorTable(Rendering.eOffice2007ColorScheme.VistaGlass, ColorPickerButton1.SelectedColor)
    End Sub

    Private Sub ButtonItem4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ButtonItem4.Click
        Dim SaveFile As New SaveFileDialog
        SaveFile.FileName = "Computer Information"
        SaveFile.Filter = "Text Files (*.txt)|*.txt"
        SaveFile.Title = "Save"
        SaveFile.ShowDialog()
        Try
            Dim Write As New System.IO.StreamWriter(SaveFile.FileName)
            Write.Write(TextBox1.Text + ControlChars.NewLine + ControlChars.NewLine + ControlChars.NewLine + LabelX1.Text + ": " + TextBoxX1.Text + ControlChars.NewLine + ControlChars.NewLine + LabelX2.Text + ": " + TextBoxX2.Text + ControlChars.NewLine + ControlChars.NewLine + LabelX3.Text + ": " + TextBoxX3.Text + ControlChars.NewLine + ControlChars.NewLine + LabelX4.Text + ": " + TextBoxX4.Text + ControlChars.NewLine + ControlChars.NewLine + LabelX5.Text + ": " + TextBoxX5.Text + ControlChars.NewLine + ControlChars.NewLine + LabelX6.Text + ": " + TextBoxX6.Text + ControlChars.NewLine + ControlChars.NewLine + LabelX7.Text + ": " + TextBoxX7.Text + ControlChars.NewLine + ControlChars.NewLine + LabelX8.Text + ": " + TextBoxX8.Text + ControlChars.NewLine + ControlChars.NewLine + LabelX9.Text + ": " + TextBoxX9.Text + ControlChars.NewLine + ControlChars.NewLine + LabelX10.Text + ": " + TextBoxX10.Text + ControlChars.NewLine + ControlChars.NewLine + LabelX11.Text + ": " + TextBoxX11.Text + ControlChars.NewLine + ControlChars.NewLine + LabelX12.Text + ": " + TextBoxX12.Text + ControlChars.NewLine + ControlChars.NewLine + LabelX13.Text + ": " + TextBoxX13.Text + ControlChars.NewLine + ControlChars.NewLine + LabelX14.Text + ": " + TextBoxX14.Text + ControlChars.NewLine + ControlChars.NewLine + LabelX15.Text + ": " + TextBoxX15.Text + ControlChars.NewLine + ControlChars.NewLine + LabelX16.Text + ": " + TextBoxX16.Text + ControlChars.NewLine + ControlChars.NewLine + LabelX17.Text + ": " + ComboBoxEx1.Text + ControlChars.NewLine + ControlChars.NewLine + LabelX18.Text + ": " + TextBoxX18.Text + ControlChars.NewLine + ControlChars.NewLine + LabelX19.Text + ": " + TextBoxX19.Text + ControlChars.NewLine + ControlChars.NewLine + LabelX20.Text + ": " + TextBoxX20.Text + ControlChars.NewLine + ControlChars.NewLine + LabelX21.Text + ": " + TextBoxX21.Text)
            Write.Close()
        Catch ex As Exception
        End Try
        If DialogResult.OK Then
            MsgBox("Successfully Saved " & SaveFile.FileName, MsgBoxStyle.Information)
        End If
    End Sub

    Private Sub ButtonItem13_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ButtonItem13.Click
        Application.Exit()
    End Sub

    Private Sub ButtonX1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ButtonX1.Click
        TextBoxX1.Text = My.User.Name
        TextBoxX2.Text = My.Computer.Name
        TextBoxX3.Text = My.Computer.Info.AvailablePhysicalMemory
        TextBoxX4.Text = My.Computer.Info.AvailableVirtualMemory
        TextBoxX5.Text = My.Computer.Info.OSFullName
        TextBoxX6.Text = My.Computer.Info.OSPlatform
        TextBoxX7.Text = My.Computer.Info.OSVersion
        TextBoxX8.Text = My.Computer.Info.TotalPhysicalMemory
        TextBoxX9.Text = My.Computer.Info.TotalVirtualMemory
        TextBoxX10.Text = My.Computer.Clipboard.GetText
        TextBoxX11.Text = My.Computer.Clock.LocalTime
        TextBoxX12.Text = My.Computer.FileSystem.CurrentDirectory
        TextBoxX13.Text = My.Computer.Keyboard.CapsLock
        TextBoxX14.Text = My.Computer.Keyboard.NumLock
        TextBoxX15.Text = My.Computer.Keyboard.ScrollLock
        TextBoxX16.Text = My.Computer.Mouse.WheelExists
        ComboBoxEx1.Items.AddRange(System.IO.Directory.GetLogicalDrives)
        ComboBoxEx1.Text = ComboBoxEx1.Items(0)
        TextBoxX18.Text = My.Computer.Info.InstalledUICulture.ToString()
        Dim iphe As IPHostEntry = Dns.GetHostEntry("")
        TextBoxX19.Text = iphe.AddressList(0).ToString()
        Dim Husam As New System.Net.WebClient
        Dim ip As String
        ip = System.Text.Encoding.ASCII.GetString(( _
        Husam.DownloadData("Http://whatismyip.com/automation/n09230945.asp")))
        TextBoxX20.Text = ip
        '=============================================
        'Do NOT Edit This Part Please!
        TextBoxX21.Text = "JoSh iZ Fr3sH"
        'Do NOT Edit This Part Please!
        '=============================================
    End Sub

    Private Sub ButtonX3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ButtonX3.Click
        TextBoxX1.Text = My.User.Name
        TextBoxX2.Text = My.Computer.Name
        TextBoxX3.Text = My.Computer.Info.AvailablePhysicalMemory
        TextBoxX4.Text = My.Computer.Info.AvailableVirtualMemory
        TextBoxX5.Text = My.Computer.Info.OSFullName
        TextBoxX6.Text = My.Computer.Info.OSPlatform
        TextBoxX7.Text = My.Computer.Info.OSVersion
        TextBoxX8.Text = My.Computer.Info.TotalPhysicalMemory
        TextBoxX9.Text = My.Computer.Info.TotalVirtualMemory
        TextBoxX10.Text = My.Computer.Clipboard.GetText
        TextBoxX11.Text = My.Computer.Clock.LocalTime
        TextBoxX12.Text = My.Computer.FileSystem.CurrentDirectory
        TextBoxX13.Text = My.Computer.Keyboard.CapsLock
        TextBoxX14.Text = My.Computer.Keyboard.NumLock
        TextBoxX15.Text = My.Computer.Keyboard.ScrollLock
        TextBoxX16.Text = My.Computer.Mouse.WheelExists
        ComboBoxEx1.Items.AddRange(System.IO.Directory.GetLogicalDrives)
        ComboBoxEx1.Text = ComboBoxEx1.Items(0)
        TextBoxX18.Text = My.Computer.Info.InstalledUICulture.ToString()
        Dim iphe As IPHostEntry = Dns.GetHostEntry("")
        TextBoxX19.Text = iphe.AddressList(0).ToString()
        Dim Husam As New System.Net.WebClient
        Dim ip As String
        ip = System.Text.Encoding.ASCII.GetString(( _
        Husam.DownloadData("Http://whatismyip.com/automation/n09230945.asp")))
        TextBoxX20.Text = ip
        '=============================================
        'Do NOT Edit This Part Please!
        TextBoxX21.Text = "JoSh iZ Fr3sH"
        'Do NOT Edit This Part Please!
        '=============================================
    End Sub

    Private Sub ButtonX5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ButtonX5.Click
        TextBoxX1.Text = My.User.Name
        TextBoxX2.Text = My.Computer.Name
        TextBoxX3.Text = My.Computer.Info.AvailablePhysicalMemory
        TextBoxX4.Text = My.Computer.Info.AvailableVirtualMemory
        TextBoxX5.Text = My.Computer.Info.OSFullName
        TextBoxX6.Text = My.Computer.Info.OSPlatform
        TextBoxX7.Text = My.Computer.Info.OSVersion
        TextBoxX8.Text = My.Computer.Info.TotalPhysicalMemory
        TextBoxX9.Text = My.Computer.Info.TotalVirtualMemory
        TextBoxX10.Text = My.Computer.Clipboard.GetText
        TextBoxX11.Text = My.Computer.Clock.LocalTime
        TextBoxX12.Text = My.Computer.FileSystem.CurrentDirectory
        TextBoxX13.Text = My.Computer.Keyboard.CapsLock
        TextBoxX14.Text = My.Computer.Keyboard.NumLock
        TextBoxX15.Text = My.Computer.Keyboard.ScrollLock
        TextBoxX16.Text = My.Computer.Mouse.WheelExists
        ComboBoxEx1.Items.AddRange(System.IO.Directory.GetLogicalDrives)
        ComboBoxEx1.Text = ComboBoxEx1.Items(0)
        TextBoxX18.Text = My.Computer.Info.InstalledUICulture.ToString()
        Dim iphe As IPHostEntry = Dns.GetHostEntry("")
        TextBoxX19.Text = iphe.AddressList(0).ToString()
        Dim Husam As New System.Net.WebClient
        Dim ip As String
        ip = System.Text.Encoding.ASCII.GetString(( _
        Husam.DownloadData("Http://whatismyip.com/automation/n09230945.asp")))
        TextBoxX20.Text = ip
        '=============================================
        'Do NOT Edit This Part Please!
        TextBoxX21.Text = "JoSh iZ Fr3sH"
        'Do NOT Edit This Part Please!
        '=============================================
    End Sub

    Private Sub ButtonX2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ButtonX2.Click
        TextBoxX1.Clear()
        TextBoxX2.Clear()
        TextBoxX3.Clear()
        TextBoxX4.Clear()
        TextBoxX5.Clear()
        TextBoxX6.Clear()
        TextBoxX7.Clear()
        TextBoxX8.Clear()
        TextBoxX9.Clear()
        TextBoxX10.Clear()
        TextBoxX11.Clear()
        TextBoxX12.Clear()
        TextBoxX13.Clear()
        TextBoxX14.Clear()
        TextBoxX15.Clear()
        TextBoxX16.Clear()
        ComboBoxEx1.Text = ""
        ComboBoxEx1.Items.Clear()
        TextBoxX18.Clear()
        TextBoxX19.Clear()
        TextBoxX20.Clear()
        ComboBoxEx1.Text = ""
        ComboBoxEx1.Items.Clear()
        TextBoxX21.Clear()
    End Sub

    Private Sub ButtonX4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ButtonX4.Click
        TextBoxX1.Clear()
        TextBoxX2.Clear()
        TextBoxX3.Clear()
        TextBoxX4.Clear()
        TextBoxX5.Clear()
        TextBoxX6.Clear()
        TextBoxX7.Clear()
        TextBoxX8.Clear()
        TextBoxX9.Clear()
        TextBoxX10.Clear()
        TextBoxX11.Clear()
        TextBoxX12.Clear()
        TextBoxX13.Clear()
        TextBoxX14.Clear()
        TextBoxX15.Clear()
        TextBoxX16.Clear()
        ComboBoxEx1.Text = ""
        ComboBoxEx1.Items.Clear()
        TextBoxX18.Clear()
        TextBoxX19.Clear()
        TextBoxX20.Clear()
        ComboBoxEx1.Text = ""
        ComboBoxEx1.Items.Clear()
        TextBoxX21.Clear()
    End Sub

    Private Sub ButtonX6_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ButtonX6.Click
        TextBoxX1.Clear()
        TextBoxX2.Clear()
        TextBoxX3.Clear()
        TextBoxX4.Clear()
        TextBoxX5.Clear()
        TextBoxX6.Clear()
        TextBoxX7.Clear()
        TextBoxX8.Clear()
        TextBoxX9.Clear()
        TextBoxX10.Clear()
        TextBoxX11.Clear()
        TextBoxX12.Clear()
        TextBoxX13.Clear()
        TextBoxX14.Clear()
        TextBoxX15.Clear()
        TextBoxX16.Clear()
        ComboBoxEx1.Text = ""
        ComboBoxEx1.Items.Clear()
        TextBoxX18.Clear()
        TextBoxX19.Clear()
        TextBoxX20.Clear()
        ComboBoxEx1.Text = ""
        ComboBoxEx1.Items.Clear()
        TextBoxX21.Clear()
    End Sub
End Class
' ===================================================================
' ===================================================================
' All Version's Of "Computer Information" Have Been Coded
' By: JoSh iZ Fr3sH From HackForums.Net
' Anyone Who is Wishing To Re-Release This On Any WebSite
' Must Give Credit To The Original Source Owner (Me, JoSh iZ Fr3sH)
' ===================================================================
' ===================================================================