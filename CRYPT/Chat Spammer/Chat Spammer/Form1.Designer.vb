<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Form1
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(Form1))
        Me.CheckBox1 = New System.Windows.Forms.CheckBox
        Me.Label2 = New System.Windows.Forms.Label
        Me.Timer1 = New System.Windows.Forms.Timer(Me.components)
        Me.TextBox1 = New DevComponents.DotNetBar.Controls.TextBoxX
        Me.TextBox2 = New DevComponents.DotNetBar.Controls.TextBoxX
        Me.Button1 = New DevComponents.DotNetBar.ButtonX
        Me.Button2 = New DevComponents.DotNetBar.ButtonX
        Me.Button3 = New DevComponents.DotNetBar.ButtonX
        Me.speed = New DevComponents.Editors.IntegerInput
        Me.ReflectionLabel1 = New DevComponents.DotNetBar.Controls.ReflectionLabel
        Me.ExpandablePanel1 = New DevComponents.DotNetBar.ExpandablePanel
        Me.NetListView1 = New Softgroup.NetListView.NetListView(Me.components)
        Me.ListViewEx1 = New DevComponents.DotNetBar.Controls.ListViewEx
        CType(Me.speed, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.ExpandablePanel1.SuspendLayout()
        Me.SuspendLayout()
        '
        'CheckBox1
        '
        Me.CheckBox1.AutoSize = True
        Me.CheckBox1.BackColor = System.Drawing.Color.Transparent
        Me.CheckBox1.ForeColor = System.Drawing.SystemColors.ControlText
        Me.CheckBox1.Location = New System.Drawing.Point(15, 62)
        Me.CheckBox1.Name = "CheckBox1"
        Me.CheckBox1.Size = New System.Drawing.Size(222, 17)
        Me.CheckBox1.TabIndex = 1
        Me.CheckBox1.Text = "Add To The End Of Ever Other Message:"
        Me.CheckBox1.UseVisualStyleBackColor = False
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.BackColor = System.Drawing.Color.Transparent
        Me.Label2.ForeColor = System.Drawing.SystemColors.ControlText
        Me.Label2.Location = New System.Drawing.Point(127, 88)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(74, 13)
        Me.Label2.TabIndex = 8
        Me.Label2.Text = "Interval In Ms:"
        '
        'Timer1
        '
        '
        'TextBox1
        '
        Me.TextBox1.BackColor = System.Drawing.SystemColors.InfoText
        '
        '
        '
        Me.TextBox1.Border.Class = "TextBoxBorder"
        Me.TextBox1.ForeColor = System.Drawing.Color.Lime
        Me.TextBox1.Location = New System.Drawing.Point(12, 36)
        Me.TextBox1.Name = "TextBox1"
        Me.TextBox1.Size = New System.Drawing.Size(251, 20)
        Me.TextBox1.TabIndex = 0
        Me.TextBox1.Text = "Enter your message here!"
        Me.TextBox1.TextAlign = System.Windows.Forms.HorizontalAlignment.Center
        Me.TextBox1.WatermarkColor = System.Drawing.Color.Red
        '
        'TextBox2
        '
        Me.TextBox2.BackColor = System.Drawing.SystemColors.InfoText
        '
        '
        '
        Me.TextBox2.Border.Class = "TextBoxBorder"
        Me.TextBox2.Enabled = False
        Me.TextBox2.ForeColor = System.Drawing.Color.Lime
        Me.TextBox2.Location = New System.Drawing.Point(12, 85)
        Me.TextBox2.Name = "TextBox2"
        Me.TextBox2.Size = New System.Drawing.Size(102, 20)
        Me.TextBox2.TabIndex = 2
        Me.TextBox2.WatermarkColor = System.Drawing.Color.Red
        '
        'Button1
        '
        Me.Button1.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton
        Me.Button1.ColorTable = DevComponents.DotNetBar.eButtonColor.Office2007WithBackground
        Me.Button1.Location = New System.Drawing.Point(12, 111)
        Me.Button1.Name = "Button1"
        Me.Button1.PulseSpeed = 125
        Me.Button1.Size = New System.Drawing.Size(75, 23)
        Me.Button1.StopPulseOnMouseOver = False
        Me.Button1.TabIndex = 5
        Me.Button1.Text = "Start"
        Me.Button1.Tooltip = "After Clicking ""Start"" You Have 3 Seconds " & Global.Microsoft.VisualBasic.ChrW(13) & Global.Microsoft.VisualBasic.ChrW(10) & "To Get To The Window You Want To Spam" & _
            "."
        '
        'Button2
        '
        Me.Button2.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton
        Me.Button2.ColorTable = DevComponents.DotNetBar.eButtonColor.Office2007WithBackground
        Me.Button2.Enabled = False
        Me.Button2.Location = New System.Drawing.Point(100, 111)
        Me.Button2.Name = "Button2"
        Me.Button2.PulseSpeed = 125
        Me.Button2.Size = New System.Drawing.Size(75, 23)
        Me.Button2.TabIndex = 6
        Me.Button2.Text = "Stop"
        '
        'Button3
        '
        Me.Button3.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton
        Me.Button3.ColorTable = DevComponents.DotNetBar.eButtonColor.Office2007WithBackground
        Me.Button3.Location = New System.Drawing.Point(188, 111)
        Me.Button3.Name = "Button3"
        Me.Button3.PulseSpeed = 125
        Me.Button3.Size = New System.Drawing.Size(75, 23)
        Me.Button3.TabIndex = 7
        Me.Button3.Text = "Exit"
        '
        'speed
        '
        '
        '
        '
        Me.speed.BackgroundStyle.BackColor = System.Drawing.Color.Black
        Me.speed.BackgroundStyle.Class = "DateTimeInputBackground"
        Me.speed.ForeColor = System.Drawing.Color.Lime
        Me.speed.Location = New System.Drawing.Point(198, 85)
        Me.speed.MinValue = 250
        Me.speed.Name = "speed"
        Me.speed.ShowUpDown = True
        Me.speed.Size = New System.Drawing.Size(65, 20)
        Me.speed.TabIndex = 3
        Me.speed.Value = 250
        '
        'ReflectionLabel1
        '
        Me.ReflectionLabel1.Location = New System.Drawing.Point(57, 116)
        Me.ReflectionLabel1.Name = "ReflectionLabel1"
        Me.ReflectionLabel1.Size = New System.Drawing.Size(168, 70)
        Me.ReflectionLabel1.TabIndex = 14
        Me.ReflectionLabel1.Text = "<b><font size=""+6""><i>By: </i><font color=""#B02B2C"">Nathan72389</font></font></b>" & _
            ""
        '
        'ExpandablePanel1
        '
        Me.ExpandablePanel1.AnimationTime = 50
        Me.ExpandablePanel1.CanvasColor = System.Drawing.SystemColors.Control
        Me.ExpandablePanel1.ColorSchemeStyle = DevComponents.DotNetBar.eDotNetBarStyle.Office2007
        Me.ExpandablePanel1.Controls.Add(Me.speed)
        Me.ExpandablePanel1.Controls.Add(Me.TextBox1)
        Me.ExpandablePanel1.Controls.Add(Me.TextBox2)
        Me.ExpandablePanel1.Controls.Add(Me.Button3)
        Me.ExpandablePanel1.Controls.Add(Me.Label2)
        Me.ExpandablePanel1.Controls.Add(Me.Button1)
        Me.ExpandablePanel1.Controls.Add(Me.Button2)
        Me.ExpandablePanel1.Controls.Add(Me.CheckBox1)
        Me.ExpandablePanel1.Controls.Add(Me.ReflectionLabel1)
        Me.ExpandablePanel1.Expanded = False
        Me.ExpandablePanel1.ExpandedBounds = New System.Drawing.Rectangle(12, 74, 275, 173)
        Me.ExpandablePanel1.ExpandOnTitleClick = True
        Me.ExpandablePanel1.Location = New System.Drawing.Point(12, 12)
        Me.ExpandablePanel1.Name = "ExpandablePanel1"
        Me.ExpandablePanel1.Size = New System.Drawing.Size(275, 26)
        Me.ExpandablePanel1.Style.Alignment = System.Drawing.StringAlignment.Center
        Me.ExpandablePanel1.Style.BackColor1.ColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBackground
        Me.ExpandablePanel1.Style.BackColor2.ColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBackground2
        Me.ExpandablePanel1.Style.Border = DevComponents.DotNetBar.eBorderType.SingleLine
        Me.ExpandablePanel1.Style.BorderColor.ColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.BarDockedBorder
        Me.ExpandablePanel1.Style.ForeColor.ColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.ItemText
        Me.ExpandablePanel1.Style.GradientAngle = 90
        Me.ExpandablePanel1.TabIndex = 15
        Me.ExpandablePanel1.TextDockConstrained = False
        Me.ExpandablePanel1.TitleStyle.Alignment = System.Drawing.StringAlignment.Center
        Me.ExpandablePanel1.TitleStyle.BackColor1.ColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBackground
        Me.ExpandablePanel1.TitleStyle.BackColor2.ColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBackground2
        Me.ExpandablePanel1.TitleStyle.Border = DevComponents.DotNetBar.eBorderType.RaisedInner
        Me.ExpandablePanel1.TitleStyle.BorderColor.ColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBorder
        Me.ExpandablePanel1.TitleStyle.ForeColor.ColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelText
        Me.ExpandablePanel1.TitleStyle.GradientAngle = 90
        Me.ExpandablePanel1.TitleText = "Chat Spammer By: Nathan72389"
        '
        'NetListView1
        '
        Me.NetListView1.Location = New System.Drawing.Point(12, 173)
        Me.NetListView1.Name = "NetListView1"
        Me.NetListView1.Size = New System.Drawing.Size(229, 200)
        Me.NetListView1.TabIndex = 16
        Me.NetListView1.UseCompatibleStateImageBehavior = False
        '
        'ListViewEx1
        '
        '
        '
        '
        Me.ListViewEx1.Border.Class = "ListViewBorder"
        Me.ListViewEx1.GridLines = True
        Me.ListViewEx1.Location = New System.Drawing.Point(68, 70)
        Me.ListViewEx1.Name = "ListViewEx1"
        Me.ListViewEx1.Size = New System.Drawing.Size(121, 97)
        Me.ListViewEx1.TabIndex = 17
        Me.ListViewEx1.UseCompatibleStateImageBehavior = False
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink
        Me.BackColor = System.Drawing.Color.DimGray
        Me.ClientSize = New System.Drawing.Size(299, 403)
        Me.ControlBox = False
        Me.Controls.Add(Me.ListViewEx1)
        Me.Controls.Add(Me.NetListView1)
        Me.Controls.Add(Me.ExpandablePanel1)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.Name = "Form1"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Chat Spammer By: Nathan72389"
        Me.TopMost = True
        Me.TransparencyKey = System.Drawing.Color.DimGray
        CType(Me.speed, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ExpandablePanel1.ResumeLayout(False)
        Me.ExpandablePanel1.PerformLayout()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents CheckBox1 As System.Windows.Forms.CheckBox
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents Timer1 As System.Windows.Forms.Timer
    Friend WithEvents TextBox1 As DevComponents.DotNetBar.Controls.TextBoxX
    Friend WithEvents TextBox2 As DevComponents.DotNetBar.Controls.TextBoxX
    Friend WithEvents Button1 As DevComponents.DotNetBar.ButtonX
    Friend WithEvents Button2 As DevComponents.DotNetBar.ButtonX
    Friend WithEvents Button3 As DevComponents.DotNetBar.ButtonX
    Friend WithEvents ReflectionLabel1 As DevComponents.DotNetBar.Controls.ReflectionLabel
    Friend WithEvents speed As DevComponents.Editors.IntegerInput
    Friend WithEvents ExpandablePanel1 As DevComponents.DotNetBar.ExpandablePanel
    Friend WithEvents NetListView1 As Softgroup.NetListView.NetListView
    Friend WithEvents ListViewEx1 As DevComponents.DotNetBar.Controls.ListViewEx

End Class
