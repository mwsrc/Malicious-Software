<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class MainForm
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(MainForm))
        Me.FormSkin1 = New Dev_Point_Downloader_By_Adel_Rehan.FormSkin()
        Me.prgbDownload = New Dev_Point_Downloader_By_Adel_Rehan.FlatProgressBar()
        Me.btnDownload = New Dev_Point_Downloader_By_Adel_Rehan.FlatButton()
        Me.txtUrl = New Dev_Point_Downloader_By_Adel_Rehan.FlatTextBox()
        Me.FlatLabel1 = New Dev_Point_Downloader_By_Adel_Rehan.FlatLabel()
        Me.FlatClose1 = New Dev_Point_Downloader_By_Adel_Rehan.FlatClose()
        Me.FlatMini1 = New Dev_Point_Downloader_By_Adel_Rehan.FlatMini()
        Me.FormSkin1.SuspendLayout()
        Me.SuspendLayout()
        '
        'FormSkin1
        '
        Me.FormSkin1.BackColor = System.Drawing.Color.White
        Me.FormSkin1.BaseColor = System.Drawing.Color.FromArgb(CType(CType(50, Byte), Integer), CType(CType(50, Byte), Integer), CType(CType(50, Byte), Integer))
        Me.FormSkin1.BorderColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(170, Byte), Integer), CType(CType(220, Byte), Integer))
        Me.FormSkin1.Controls.Add(Me.prgbDownload)
        Me.FormSkin1.Controls.Add(Me.btnDownload)
        Me.FormSkin1.Controls.Add(Me.txtUrl)
        Me.FormSkin1.Controls.Add(Me.FlatLabel1)
        Me.FormSkin1.Controls.Add(Me.FlatClose1)
        Me.FormSkin1.Controls.Add(Me.FlatMini1)
        Me.FormSkin1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.FormSkin1.FlatColor = System.Drawing.Color.FromArgb(CType(CType(0, Byte), Integer), CType(CType(170, Byte), Integer), CType(CType(220, Byte), Integer))
        Me.FormSkin1.Font = New System.Drawing.Font("Segoe UI", 12.0!)
        Me.FormSkin1.HeaderColor = System.Drawing.Color.FromArgb(CType(CType(50, Byte), Integer), CType(CType(50, Byte), Integer), CType(CType(50, Byte), Integer))
        Me.FormSkin1.HeaderMaximize = False
        Me.FormSkin1.Location = New System.Drawing.Point(0, 0)
        Me.FormSkin1.Name = "FormSkin1"
        Me.FormSkin1.Size = New System.Drawing.Size(566, 154)
        Me.FormSkin1.TabIndex = 0
        Me.FormSkin1.Text = "Dev-Point Downloader By Adel Rehan"
        '
        'prgbDownload
        '
        Me.prgbDownload.BackColor = System.Drawing.Color.FromArgb(CType(CType(50, Byte), Integer), CType(CType(50, Byte), Integer), CType(CType(50, Byte), Integer))
        Me.prgbDownload.DarkerProgress = System.Drawing.Color.Green
        Me.prgbDownload.Location = New System.Drawing.Point(12, 97)
        Me.prgbDownload.Maximum = 100
        Me.prgbDownload.Name = "prgbDownload"
        Me.prgbDownload.ProgressColor = System.Drawing.Color.Green
        Me.prgbDownload.Size = New System.Drawing.Size(542, 42)
        Me.prgbDownload.TabIndex = 14
        Me.prgbDownload.Value = 0
        '
        'btnDownload
        '
        Me.btnDownload.BackColor = System.Drawing.Color.Transparent
        Me.btnDownload.BaseColor = System.Drawing.Color.Green
        Me.btnDownload.Cursor = System.Windows.Forms.Cursors.Hand
        Me.btnDownload.Font = New System.Drawing.Font("Segoe UI", 12.0!)
        Me.btnDownload.Location = New System.Drawing.Point(448, 59)
        Me.btnDownload.Name = "btnDownload"
        Me.btnDownload.Rounded = False
        Me.btnDownload.Size = New System.Drawing.Size(106, 32)
        Me.btnDownload.TabIndex = 13
        Me.btnDownload.Text = "Download"
        Me.btnDownload.TextColor = System.Drawing.Color.FromArgb(CType(CType(243, Byte), Integer), CType(CType(243, Byte), Integer), CType(CType(243, Byte), Integer))
        '
        'txtUrl
        '
        Me.txtUrl.BackColor = System.Drawing.Color.Transparent
        Me.txtUrl.Location = New System.Drawing.Point(105, 60)
        Me.txtUrl.MaxLength = 32767
        Me.txtUrl.Multiline = False
        Me.txtUrl.Name = "txtUrl"
        Me.txtUrl.ReadOnly = False
        Me.txtUrl.Size = New System.Drawing.Size(337, 29)
        Me.txtUrl.TabIndex = 12
        Me.txtUrl.TextAlign = System.Windows.Forms.HorizontalAlignment.Left
        Me.txtUrl.TextColor = System.Drawing.Color.FromArgb(CType(CType(192, Byte), Integer), CType(CType(192, Byte), Integer), CType(CType(192, Byte), Integer))
        Me.txtUrl.UseSystemPasswordChar = False
        '
        'FlatLabel1
        '
        Me.FlatLabel1.AutoSize = True
        Me.FlatLabel1.BackColor = System.Drawing.Color.Transparent
        Me.FlatLabel1.Font = New System.Drawing.Font("Segoe UI", 8.0!)
        Me.FlatLabel1.ForeColor = System.Drawing.Color.White
        Me.FlatLabel1.Location = New System.Drawing.Point(12, 67)
        Me.FlatLabel1.Name = "FlatLabel1"
        Me.FlatLabel1.Size = New System.Drawing.Size(87, 13)
        Me.FlatLabel1.TabIndex = 11
        Me.FlatLabel1.Text = "Dev-Point Link :"
        '
        'FlatClose1
        '
        Me.FlatClose1.Anchor = CType((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.FlatClose1.BackColor = System.Drawing.Color.White
        Me.FlatClose1.BaseColor = System.Drawing.Color.FromArgb(CType(CType(50, Byte), Integer), CType(CType(50, Byte), Integer), CType(CType(50, Byte), Integer))
        Me.FlatClose1.Font = New System.Drawing.Font("Marlett", 12.0!)
        Me.FlatClose1.Location = New System.Drawing.Point(536, 12)
        Me.FlatClose1.Name = "FlatClose1"
        Me.FlatClose1.Size = New System.Drawing.Size(18, 18)
        Me.FlatClose1.TabIndex = 8
        Me.FlatClose1.Text = "FlatClose1"
        Me.FlatClose1.TextColor = System.Drawing.Color.FromArgb(CType(CType(243, Byte), Integer), CType(CType(243, Byte), Integer), CType(CType(243, Byte), Integer))
        '
        'FlatMini1
        '
        Me.FlatMini1.Anchor = CType((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.FlatMini1.BackColor = System.Drawing.Color.White
        Me.FlatMini1.BaseColor = System.Drawing.Color.FromArgb(CType(CType(50, Byte), Integer), CType(CType(50, Byte), Integer), CType(CType(50, Byte), Integer))
        Me.FlatMini1.Font = New System.Drawing.Font("Marlett", 12.0!)
        Me.FlatMini1.Location = New System.Drawing.Point(512, 12)
        Me.FlatMini1.Name = "FlatMini1"
        Me.FlatMini1.Size = New System.Drawing.Size(18, 18)
        Me.FlatMini1.TabIndex = 7
        Me.FlatMini1.Text = "FlatMini1"
        Me.FlatMini1.TextColor = System.Drawing.Color.FromArgb(CType(CType(243, Byte), Integer), CType(CType(243, Byte), Integer), CType(CType(243, Byte), Integer))
        '
        'MainForm
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(566, 154)
        Me.Controls.Add(Me.FormSkin1)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.Name = "MainForm"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Dev-Point Downloader By Adel Rehan"
        Me.TransparencyKey = System.Drawing.Color.Fuchsia
        Me.FormSkin1.ResumeLayout(False)
        Me.FormSkin1.PerformLayout()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents FormSkin1 As Dev_Point_Downloader_By_Adel_Rehan.FormSkin
    Friend WithEvents FlatClose1 As Dev_Point_Downloader_By_Adel_Rehan.FlatClose
    Friend WithEvents FlatMini1 As Dev_Point_Downloader_By_Adel_Rehan.FlatMini
    Friend WithEvents prgbDownload As Dev_Point_Downloader_By_Adel_Rehan.FlatProgressBar
    Friend WithEvents btnDownload As Dev_Point_Downloader_By_Adel_Rehan.FlatButton
    Friend WithEvents txtUrl As Dev_Point_Downloader_By_Adel_Rehan.FlatTextBox
    Friend WithEvents FlatLabel1 As Dev_Point_Downloader_By_Adel_Rehan.FlatLabel

End Class
