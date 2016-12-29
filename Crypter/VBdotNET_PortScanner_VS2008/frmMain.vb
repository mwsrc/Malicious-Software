Imports System.Threading

Public Class frmMain
    Inherits System.Windows.Forms.Form

    Private dtResults As DataTable
    Private WithEvents myScanner As clsScanner

    ''Used to Invoke the IncrementProgressBar sub in the same thread as the Form
    Dim CallIncrementProgressBar As New MethodInvoker(AddressOf Me.IncrementProgressBar)

#Region " Windows Form Designer generated code "

    Public Sub New()
        MyBase.New()

        'This call is required by the Windows Form Designer.
        InitializeComponent()

        'Add any initialization after the InitializeComponent() call
        Application.EnableVisualStyles()
    End Sub

    'Form overrides dispose to clean up the component list.
    Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
        If disposing Then
            If Not (components Is Nothing) Then
                components.Dispose()
            End If
        End If
        MyBase.Dispose(disposing)
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    Friend WithEvents btnScan As System.Windows.Forms.Button
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents txtHost As System.Windows.Forms.TextBox
    Friend WithEvents txtFrom As System.Windows.Forms.TextBox
    Friend WithEvents txtTo As System.Windows.Forms.TextBox
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents checkOpen As System.Windows.Forms.CheckBox
    Friend WithEvents dgResults As System.Windows.Forms.DataGrid
    Friend WithEvents ProgressBar1 As System.Windows.Forms.ProgressBar
    Friend WithEvents MainMenu1 As System.Windows.Forms.MainMenu
    Friend WithEvents MenuItem1 As System.Windows.Forms.MenuItem
    Friend WithEvents mnuScan As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItem3 As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItem5 As System.Windows.Forms.MenuItem
    Friend WithEvents mnuSaveResults As System.Windows.Forms.MenuItem
    Friend WithEvents mnuExit As System.Windows.Forms.MenuItem
    Friend WithEvents SaveResultXML As System.Windows.Forms.SaveFileDialog
    Friend WithEvents MenuItem2 As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItem4 As System.Windows.Forms.MenuItem
    Friend WithEvents cmScanResults As System.Windows.Forms.ContextMenu
    Friend WithEvents mnuSRSaveResultXML As System.Windows.Forms.MenuItem
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.btnScan = New System.Windows.Forms.Button
        Me.Label1 = New System.Windows.Forms.Label
        Me.Label3 = New System.Windows.Forms.Label
        Me.Label4 = New System.Windows.Forms.Label
        Me.txtHost = New System.Windows.Forms.TextBox
        Me.txtFrom = New System.Windows.Forms.TextBox
        Me.txtTo = New System.Windows.Forms.TextBox
        Me.GroupBox1 = New System.Windows.Forms.GroupBox
        Me.checkOpen = New System.Windows.Forms.CheckBox
        Me.dgResults = New System.Windows.Forms.DataGrid
        Me.cmScanResults = New System.Windows.Forms.ContextMenu
        Me.mnuSRSaveResultXML = New System.Windows.Forms.MenuItem
        Me.ProgressBar1 = New System.Windows.Forms.ProgressBar
        Me.MainMenu1 = New System.Windows.Forms.MainMenu
        Me.MenuItem1 = New System.Windows.Forms.MenuItem
        Me.mnuScan = New System.Windows.Forms.MenuItem
        Me.MenuItem3 = New System.Windows.Forms.MenuItem
        Me.mnuSaveResults = New System.Windows.Forms.MenuItem
        Me.MenuItem5 = New System.Windows.Forms.MenuItem
        Me.mnuExit = New System.Windows.Forms.MenuItem
        Me.MenuItem2 = New System.Windows.Forms.MenuItem
        Me.MenuItem4 = New System.Windows.Forms.MenuItem
        Me.SaveResultXML = New System.Windows.Forms.SaveFileDialog
        Me.GroupBox1.SuspendLayout()
        CType(Me.dgResults, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'btnScan
        '
        Me.btnScan.FlatStyle = System.Windows.Forms.FlatStyle.System
        Me.btnScan.Location = New System.Drawing.Point(96, 176)
        Me.btnScan.Name = "btnScan"
        Me.btnScan.TabIndex = 1
        Me.btnScan.Text = "Scan"
        '
        'Label1
        '
        Me.Label1.FlatStyle = System.Windows.Forms.FlatStyle.System
        Me.Label1.Location = New System.Drawing.Point(16, 16)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(40, 16)
        Me.Label1.TabIndex = 2
        Me.Label1.Text = "Host:"
        '
        'Label3
        '
        Me.Label3.FlatStyle = System.Windows.Forms.FlatStyle.System
        Me.Label3.Location = New System.Drawing.Point(16, 24)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(40, 16)
        Me.Label3.TabIndex = 4
        Me.Label3.Text = "From:"
        '
        'Label4
        '
        Me.Label4.FlatStyle = System.Windows.Forms.FlatStyle.System
        Me.Label4.Location = New System.Drawing.Point(16, 56)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(24, 16)
        Me.Label4.TabIndex = 5
        Me.Label4.Text = "To:"
        '
        'txtHost
        '
        Me.txtHost.Location = New System.Drawing.Point(64, 16)
        Me.txtHost.Name = "txtHost"
        Me.txtHost.TabIndex = 6
        Me.txtHost.Text = "127.0.0.1"
        '
        'txtFrom
        '
        Me.txtFrom.Location = New System.Drawing.Point(56, 24)
        Me.txtFrom.Name = "txtFrom"
        Me.txtFrom.TabIndex = 7
        Me.txtFrom.Text = "1"
        '
        'txtTo
        '
        Me.txtTo.Location = New System.Drawing.Point(56, 56)
        Me.txtTo.Name = "txtTo"
        Me.txtTo.TabIndex = 8
        Me.txtTo.Text = "100"
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.txtTo)
        Me.GroupBox1.Controls.Add(Me.txtFrom)
        Me.GroupBox1.Controls.Add(Me.Label4)
        Me.GroupBox1.Controls.Add(Me.Label3)
        Me.GroupBox1.FlatStyle = System.Windows.Forms.FlatStyle.System
        Me.GroupBox1.Location = New System.Drawing.Point(8, 48)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(168, 88)
        Me.GroupBox1.TabIndex = 9
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "Ports"
        '
        'checkOpen
        '
        Me.checkOpen.Checked = True
        Me.checkOpen.CheckState = System.Windows.Forms.CheckState.Checked
        Me.checkOpen.FlatStyle = System.Windows.Forms.FlatStyle.System
        Me.checkOpen.Location = New System.Drawing.Point(16, 144)
        Me.checkOpen.Name = "checkOpen"
        Me.checkOpen.Size = New System.Drawing.Size(144, 24)
        Me.checkOpen.TabIndex = 10
        Me.checkOpen.Text = "Only Show Open Ports"
        '
        'dgResults
        '
        Me.dgResults.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
                    Or System.Windows.Forms.AnchorStyles.Left) _
                    Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.dgResults.CaptionText = "Scan Results"
        Me.dgResults.ContextMenu = Me.cmScanResults
        Me.dgResults.DataMember = ""
        Me.dgResults.HeaderForeColor = System.Drawing.SystemColors.ControlText
        Me.dgResults.Location = New System.Drawing.Point(184, 8)
        Me.dgResults.Name = "dgResults"
        Me.dgResults.ReadOnly = True
        Me.dgResults.Size = New System.Drawing.Size(404, 236)
        Me.dgResults.TabIndex = 11
        '
        'cmScanResults
        '
        Me.cmScanResults.MenuItems.AddRange(New System.Windows.Forms.MenuItem() {Me.mnuSRSaveResultXML})
        '
        'mnuSRSaveResultXML
        '
        Me.mnuSRSaveResultXML.Enabled = False
        Me.mnuSRSaveResultXML.Index = 0
        Me.mnuSRSaveResultXML.Text = "S&ave Result as XML"
        '
        'ProgressBar1
        '
        Me.ProgressBar1.Anchor = CType(((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Left) _
                    Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.ProgressBar1.Location = New System.Drawing.Point(184, 244)
        Me.ProgressBar1.Name = "ProgressBar1"
        Me.ProgressBar1.Size = New System.Drawing.Size(404, 23)
        Me.ProgressBar1.TabIndex = 12
        '
        'MainMenu1
        '
        Me.MainMenu1.MenuItems.AddRange(New System.Windows.Forms.MenuItem() {Me.MenuItem1, Me.MenuItem2})
        '
        'MenuItem1
        '
        Me.MenuItem1.Index = 0
        Me.MenuItem1.MenuItems.AddRange(New System.Windows.Forms.MenuItem() {Me.mnuScan, Me.MenuItem3, Me.mnuSaveResults, Me.MenuItem5, Me.mnuExit})
        Me.MenuItem1.Text = "&File"
        '
        'mnuScan
        '
        Me.mnuScan.Index = 0
        Me.mnuScan.Text = "&Scan"
        '
        'MenuItem3
        '
        Me.MenuItem3.Index = 1
        Me.MenuItem3.Text = "-"
        '
        'mnuSaveResults
        '
        Me.mnuSaveResults.Enabled = False
        Me.mnuSaveResults.Index = 2
        Me.mnuSaveResults.Text = "S&ave Result as XML"
        '
        'MenuItem5
        '
        Me.MenuItem5.Index = 3
        Me.MenuItem5.Text = "-"
        '
        'mnuExit
        '
        Me.mnuExit.Index = 4
        Me.mnuExit.Text = "E&xit"
        '
        'MenuItem2
        '
        Me.MenuItem2.Index = 1
        Me.MenuItem2.MenuItems.AddRange(New System.Windows.Forms.MenuItem() {Me.MenuItem4})
        Me.MenuItem2.Text = "&Help"
        '
        'MenuItem4
        '
        Me.MenuItem4.Index = 0
        Me.MenuItem4.Text = "&About"
        '
        'SaveResultXML
        '
        Me.SaveResultXML.DefaultExt = "xml"
        Me.SaveResultXML.FileName = "PortScan.xml"
        Me.SaveResultXML.Filter = "XML files|*.xml|All files|*.*"
        Me.SaveResultXML.Title = "Save Result as XML"
        '
        'frmMain
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(592, 270)
        Me.Controls.Add(Me.ProgressBar1)
        Me.Controls.Add(Me.dgResults)
        Me.Controls.Add(Me.checkOpen)
        Me.Controls.Add(Me.GroupBox1)
        Me.Controls.Add(Me.txtHost)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.btnScan)
        Me.Menu = Me.MainMenu1
        Me.Name = "frmMain"
        Me.Text = "Port Scanner"
        Me.GroupBox1.ResumeLayout(False)
        CType(Me.dgResults, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub

#End Region

    Private Sub Scan_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnScan.Click, mnuScan.Click
        dtResults.Clear()
        dgResults.DataSource = Nothing

        txtHost.Enabled = False
        txtFrom.Enabled = False
        txtTo.Enabled = False
        checkOpen.Enabled = False
        btnScan.Enabled = False
        mnuScan.Enabled = False
        mnuSaveResults.Enabled = False
        mnuSRSaveResultXML.Enabled = False

        myScanner = New clsScanner(txtHost.Text, Int(txtFrom.Text), Int(txtTo.Text))
        ProgressBar1.Minimum = Int(txtFrom.Text)
        ProgressBar1.Maximum = Int(txtTo.Text)
        ProgressBar1.Value = Int(txtFrom.Text)
        myScanner.Start()
    End Sub

    Private Sub PortOpen_myScanner(ByVal Host As String, ByVal Port As Integer) Handles myScanner.PortOpen
        WritePort(Host, Port, clsScanner.portState.Open)
        Me.BeginInvoke(CallIncrementProgressBar) ''Invoke the IncrementProgressBar sub in the same thread as the Form
    End Sub

    Private Sub PortClosed_myScanner(ByVal Host As String, ByVal Port As Integer) Handles myScanner.PortClosed
        WritePort(Host, Port, clsScanner.portState.Closed)
        Me.BeginInvoke(CallIncrementProgressBar) ''Invoke the IncrementProgressBar sub in the same thread as the Form
    End Sub

    Private Sub IncrementProgressBar()
        If ProgressBar1.Value < ProgressBar1.Maximum Then
            ProgressBar1.Value += 1
            If dgResults.CaptionText <> "Scanning..." Then dgResults.CaptionText = "Scanning..."
            Me.Text = "Port Scanner [" & Int((ProgressBar1.Value - ProgressBar1.Minimum) / (ProgressBar1.Maximum - ProgressBar1.Minimum) * 100) & "%]"
        Else
            dgResults.DataSource = dtResults
            dgResults.CaptionText = "Scan Results"
            Me.Text = "Port Scanner"
            txtHost.Enabled = True
            txtFrom.Enabled = True
            txtTo.Enabled = True
            checkOpen.Enabled = True
            btnScan.Enabled = True
            mnuScan.Enabled = True
            mnuSaveResults.Enabled = True
            mnuSRSaveResultXML.Enabled = True
        End If
    End Sub

    Private Function WritePort(ByVal Host As String, ByVal Port As Integer, ByVal State As clsScanner.portState)
        If (checkOpen.Checked And State = clsScanner.portState.Open) Or (Not (checkOpen.Checked)) Then
            Dim myRow As DataRow = dtResults.NewRow
            myRow("Host") = Host
            myRow("Port") = Port
            myRow("State") = State.ToString
            If State = clsScanner.portState.Open Then myRow("Service") = GetServiceName(Port)
            dtResults.Rows.Add(myRow)
        End If
    End Function

    Public Function GetServiceName(ByVal Port As Integer) As String
        Dim strName As String = System.Configuration.ConfigurationSettings.AppSettings("Port" & Port)
        If Len(strName) = 0 Then
            strName = ""
        End If
        Return strName
    End Function

    Private Sub frmMain_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        dtResults = New DataTable
        dtResults.Columns.Add("Host", GetType(String))
        dtResults.Columns.Add("Port", GetType(Integer))
        dtResults.Columns.Add("State", GetType(String))
        dtResults.Columns.Add("Service", GetType(String))
    End Sub

    Private Sub Exit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles mnuExit.Click
        Application.Exit()
    End Sub

    Private Sub mnuSaveResults_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles mnuSaveResults.Click, mnuSRSaveResultXML.Click
        If SaveResultXML.ShowDialog = DialogResult.OK Then
            Dim dsResult As New DataSet
            dsResult.Tables.Add(dtResults)
            dsResult.Tables(0).TableName = "ScanResults"
            dsResult.DataSetName = "PortScanner"
            dsResult.WriteXml(SaveResultXML.FileName)
        End If
    End Sub

    Private Sub MenuItem4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItem4.Click
        Dim strMessage As String = "Port Scanner " & Application.ProductVersion & vbNewLine & "Written by: Chris Pietschmann" & vbNewLine & "http://pietschsoft.com"
        MessageBox.Show(strMessage, "Port Scanner")
    End Sub

    Private Sub txtFrom_KeyPress(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles txtFrom.KeyPress, txtTo.KeyPress
        If e.KeyChar.IsLetter(e.KeyChar) Or e.KeyChar.IsSymbol(e.KeyChar) Or e.KeyChar.IsPunctuation(e.KeyChar) Then
            e.Handled = True
        End If
    End Sub
End Class
