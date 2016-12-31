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
        Dim ListViewItem1 As System.Windows.Forms.ListViewItem = New System.Windows.Forms.ListViewItem("md5crack")
        Dim ListViewItem2 As System.Windows.Forms.ListViewItem = New System.Windows.Forms.ListViewItem("gdataonline")
        Dim ListViewItem3 As System.Windows.Forms.ListViewItem = New System.Windows.Forms.ListViewItem("passcracking")
        Me.txtHash = New System.Windows.Forms.TextBox
        Me.look = New System.Windows.Forms.Button
        Me.Panel1 = New System.Windows.Forms.Panel
        Me.md5c = New System.Windows.Forms.Timer(Me.components)
        Me.checkHost = New System.Windows.Forms.Timer(Me.components)
        Me.GroupBox1 = New System.Windows.Forms.GroupBox
        Me.listView = New System.Windows.Forms.ListView
        Me.webSite = New System.Windows.Forms.ColumnHeader
        Me.hashRes = New System.Windows.Forms.ColumnHeader
        Me.gdata = New System.Windows.Forms.Timer(Me.components)
        Me.passcrack = New System.Windows.Forms.Timer(Me.components)
        Me.Label1 = New System.Windows.Forms.Label
        Me.Panel1.SuspendLayout()
        Me.GroupBox1.SuspendLayout()
        Me.SuspendLayout()
        '
        'txtHash
        '
        Me.txtHash.Font = New System.Drawing.Font("Tahoma", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtHash.Location = New System.Drawing.Point(8, 8)
        Me.txtHash.MaxLength = 32
        Me.txtHash.Name = "txtHash"
        Me.txtHash.Size = New System.Drawing.Size(172, 21)
        Me.txtHash.TabIndex = 1
        '
        'look
        '
        Me.look.Location = New System.Drawing.Point(187, 6)
        Me.look.Name = "look"
        Me.look.Size = New System.Drawing.Size(87, 23)
        Me.look.TabIndex = 0
        Me.look.Text = "Lookup!"
        Me.look.UseVisualStyleBackColor = True
        '
        'Panel1
        '
        Me.Panel1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.Panel1.Controls.Add(Me.txtHash)
        Me.Panel1.Controls.Add(Me.look)
        Me.Panel1.Location = New System.Drawing.Point(4, 56)
        Me.Panel1.Name = "Panel1"
        Me.Panel1.Size = New System.Drawing.Size(283, 40)
        Me.Panel1.TabIndex = 2
        '
        'md5c
        '
        Me.md5c.Interval = 250
        '
        'checkHost
        '
        Me.checkHost.Interval = 1
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.listView)
        Me.GroupBox1.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.GroupBox1.Font = New System.Drawing.Font("Tahoma", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.GroupBox1.ForeColor = System.Drawing.Color.FromArgb(CType(CType(224, Byte), Integer), CType(CType(224, Byte), Integer), CType(CType(224, Byte), Integer))
        Me.GroupBox1.Location = New System.Drawing.Point(8, 103)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(275, 114)
        Me.GroupBox1.TabIndex = 5
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "Search Result"
        '
        'listView
        '
        Me.listView.Columns.AddRange(New System.Windows.Forms.ColumnHeader() {Me.webSite, Me.hashRes})
        Me.listView.Font = New System.Drawing.Font("Verdana", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.listView.GridLines = True
        Me.listView.Items.AddRange(New System.Windows.Forms.ListViewItem() {ListViewItem1, ListViewItem2, ListViewItem3})
        Me.listView.Location = New System.Drawing.Point(6, 21)
        Me.listView.Name = "listView"
        Me.listView.Size = New System.Drawing.Size(261, 85)
        Me.listView.TabIndex = 0
        Me.listView.UseCompatibleStateImageBehavior = False
        Me.listView.View = System.Windows.Forms.View.Details
        '
        'webSite
        '
        Me.webSite.Text = "Website"
        Me.webSite.Width = 97
        '
        'hashRes
        '
        Me.hashRes.Text = "Result"
        Me.hashRes.Width = 156
        '
        'gdata
        '
        Me.gdata.Interval = 250
        '
        'passcrack
        '
        Me.passcrack.Interval = 250
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Font = New System.Drawing.Font("Verdana", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.ForeColor = System.Drawing.Color.Red
        Me.Label1.Location = New System.Drawing.Point(85, 15)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(121, 18)
        Me.Label1.TabIndex = 6
        Me.Label1.Text = "Hash Lookup"
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.Color.FromArgb(CType(CType(40, Byte), Integer), CType(CType(40, Byte), Integer), CType(CType(40, Byte), Integer))
        Me.ClientSize = New System.Drawing.Size(291, 228)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.GroupBox1)
        Me.Controls.Add(Me.Panel1)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle
        Me.MaximizeBox = False
        Me.MinimizeBox = False
        Me.Name = "Form1"
        Me.Text = "MD5 Lookup"
        Me.Panel1.ResumeLayout(False)
        Me.Panel1.PerformLayout()
        Me.GroupBox1.ResumeLayout(False)
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents txtHash As System.Windows.Forms.TextBox
    Friend WithEvents look As System.Windows.Forms.Button
    Friend WithEvents Panel1 As System.Windows.Forms.Panel
    Friend WithEvents md5c As System.Windows.Forms.Timer
    Friend WithEvents checkHost As System.Windows.Forms.Timer
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents listView As System.Windows.Forms.ListView
    Friend WithEvents webSite As System.Windows.Forms.ColumnHeader
    Friend WithEvents hashRes As System.Windows.Forms.ColumnHeader
    Friend WithEvents gdata As System.Windows.Forms.Timer
    Friend WithEvents passcrack As System.Windows.Forms.Timer
    Friend WithEvents Label1 As System.Windows.Forms.Label

End Class
