Public Class Form1

    Private Sub WebBrowser1_DocumentCompleted(ByVal sender As System.Object, ByVal e As System.Windows.Forms.WebBrowserDocumentCompletedEventArgs)

    End Sub

#Region "Tabs"
    Public Sub AddTab(ByRef URL As String, ByRef TabControl As TabControl)
        Dim NewBrowser As New CustomBrowser
        Dim NewTab As New TabPage
        NewBrowser.Tag = NewTab
        NewTab.Tag = NewBrowser
        TabControl.TabPages.Add(NewTab)
        NewTab.Controls.Add(NewBrowser)
        NewBrowser.Dock = DockStyle.Fill
        NewBrowser.Navigate(URL)
    End Sub
#End Region

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Dim Browse As New WebBrowser
        Browse.Name = "b1"
        Browse.Dock = DockStyle.Fill
        AddHandler Browse.DocumentCompleted, AddressOf browse_done
        TabControl1.TabPages.Add(i, "Page " & i + 1)
        TabControl1.SelectTab(i)
        TabControl1.SelectedTab.Controls.Add(Browse)
        i = i + 1
        CType(TabControl1.SelectedTab.Controls.Item(0), WebBrowser).Navigate(My.Settings.Homepage)
        ToolStripComboBox2.SelectedItem = "Google"
    End Sub
    Dim i As Integer
    Private Sub NewTabToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles NewTabToolStripMenuItem.Click
        AddTab("about:blank", TabControl1)
    End Sub
    Dim Browse As New WebBrowser
    Private Sub browse_done(ByVal sender As Object, ByVal e As Windows.Forms.WebBrowserDocumentCompletedEventArgs)
        TabControl1.SelectedTab.Text = CType(TabControl1.SelectedTab.Controls.Item(0), WebBrowser).DocumentTitle
        Me.Text = ("iHack™ Web Browser - " + CType(TabControl1.SelectedTab.Controls.Item(0), WebBrowser).DocumentTitle)
        With ToolStripProgressBar1
            .Minimum = 1
            .Maximum = 10000
            .Value = 1
            .Step = 1
            ToolStripProgressBar1.Visible = True
            For i As Integer = .Minimum To .Maximum
                .PerformStep()
            Next i
        End With
        If CType(TabControl1.SelectedTab.Controls.Item(0), WebBrowser).ReadyState Then
            ToolStripProgressBar1.Visible = False
        End If
        If ToolStripProgressBar1.Value = 10000 Then ToolStripStatusLabel1.Visible = True
        If ToolStripComboBox1.Items.Contains(CType(TabControl1.SelectedTab.Controls.Item(0), WebBrowser).Url.AbsoluteUri) Then
            ToolStripComboBox1.Text = (CType(TabControl1.SelectedTab.Controls.Item(0), WebBrowser).Url.AbsoluteUri)
        Else
            ToolStripComboBox1.Items.Add(CType(TabControl1.SelectedTab.Controls.Item(0), WebBrowser).Url.AbsoluteUri)
            HistoryToolStripMenuItem.DropDownItems.Add(CType(TabControl1.SelectedTab.Controls.Item(0), WebBrowser).Url.AbsoluteUri)
            ToolStripComboBox1.Text = (CType(TabControl1.SelectedTab.Controls.Item(0), WebBrowser).Url.AbsoluteUri)
        End If
    End Sub

    Private Sub CloseTabToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CloseTabToolStripMenuItem.Click
        TabControl1.TabPages.RemoveAt(TabControl1.SelectedIndex)
        i = i - 1
        ToolStripComboBox1.Items.Add((ToolStripComboBox1.Text = CType(TabControl1.SelectedTab.Controls.Item(0), WebBrowser).Url.AbsoluteUri))

    End Sub

    Private Sub ToolStripButton1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ToolStripButton1.Click
        CType(TabControl1.SelectedTab.Controls.Item(0), WebBrowser).Navigate(ToolStripComboBox1.Text)

    End Sub

    Private Sub ToolStripButton3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ToolStripButton3.Click
        CType(TabControl1.SelectedTab.Controls.Item(0), WebBrowser).GoBack()
    End Sub

    Private Sub ToolStripButton2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ToolStripButton2.Click
        CType(TabControl1.SelectedTab.Controls.Item(0), WebBrowser).GoForward()
    End Sub

    Private Sub ToolStripButton6_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ToolStripButton6.Click
        CType(TabControl1.SelectedTab.Controls.Item(0), WebBrowser).Refresh()
    End Sub

    Private Sub ToolStripButton4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ToolStripButton4.Click
        CType(TabControl1.SelectedTab.Controls.Item(0), WebBrowser).Navigate(My.Settings.Homepage)
    End Sub

    Private Sub ToolStripComboBox1_KeyPress(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyPressEventArgs)

    End Sub
    Private Sub ToolStripComboBox1__KeyPress(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles ToolStripComboBox1.KeyPress
        If Asc(e.KeyChar) = Keys.Enter Then
            CType(TabControl1.SelectedTab.Controls.Item(0), WebBrowser).Navigate(ToolStripComboBox1.Text)
        End If
    End Sub
    Private Sub HistoryToolStripMenuItem_DropDownItemClicked(ByVal sender As Object, ByVal e As System.Windows.Forms.ToolStripItemClickedEventArgs) Handles HistoryToolStripMenuItem.DropDownItemClicked
        CType(TabControl1.SelectedTab.Controls.Item(0), WebBrowser).Navigate(HistoryToolStripMenuItem.DropDownItems.ToString)
    End Sub

    Private Sub PageSourceToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        Form2.Visible = True
    End Sub

    Private Sub ToolStripComboBox1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ToolStripComboBox1.SelectedIndexChanged
        CType(TabControl1.SelectedTab.Controls.Item(0), WebBrowser).Navigate(ToolStripComboBox1.SelectedItem)
    End Sub
    Private Sub SetHomepageToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SetHomepageToolStripMenuItem.Click
        Dim frm As Form2 = New Form2()
        frm.ShowDialog()
    End Sub
    Private Sub ToolStripButton7_Click_1(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ToolStripButton7.Click
        If ToolStripComboBox2.SelectedItem = "Google" Then
            CType(TabControl1.SelectedTab.Controls.Item(0), WebBrowser).Navigate("http://www.google.com/search?hl=en&q=" + ToolStripTextBox2.TextBox.Text)
        ElseIf ToolStripComboBox2.SelectedItem = "Yahoo" Then
            CType(TabControl1.SelectedTab.Controls.Item(0), WebBrowser).Navigate("http://search.yahoo.com/search?p=" + ToolStripTextBox2.TextBox.Text)
        ElseIf ToolStripComboBox2.SelectedItem = "Wikipedia" Then
            CType(TabControl1.SelectedTab.Controls.Item(0), WebBrowser).Navigate("http://en.wikipedia.org/wiki/" + ToolStripTextBox2.TextBox.Text)
        End If
    End Sub

    Private Sub ToolStripComboBox1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ToolStripComboBox1.Click

    End Sub

    Private Sub AboutToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles AboutToolStripMenuItem.Click
        Form4.Show()
    End Sub

    Private Sub ExitToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ExitToolStripMenuItem.Click
        Me.Close()
    End Sub

    Private Sub ToolStripTextBox2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ToolStripTextBox2.Click

    End Sub

    Private Sub IHackWSToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles IHackWSToolStripMenuItem.Click

    End Sub
    Public Class CustomBrowser
        Inherits WebBrowser

        Public Sub New()
            Me.ScriptErrorsSuppressed = True
        End Sub

        Private Sub DocCompleted() Handles Me.DocumentCompleted
            Dim TP As TabPage = Me.Tag
            If Me.DocumentTitle.Length > 15 Then
                TP.Text = Me.DocumentTitle.Substring(0, 14) & "..."
            Else
                TP.Text = Me.DocumentTitle
            End If
        End Sub
    End Class

    Private Sub ToolStripButton8_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ToolStripButton8.Click
        AddTab("about:blank", TabControl1)
    End Sub

    Private Sub ToolStripButton5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ToolStripButton5.Click
        CType(TabControl1.SelectedTab.Controls.Item(0), WebBrowser).Stop()
    End Sub

    Private Sub ToolStripButton9_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ToolStripButton9.Click
        TabControl1.TabPages.RemoveAt(TabControl1.SelectedIndex)
        i = i - 1
        ToolStripComboBox1.Items.Add((ToolStripComboBox1.Text = CType(TabControl1.SelectedTab.Controls.Item(0), WebBrowser).Url.AbsoluteUri))
    End Sub
End Class
