<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class FrmSobre
    Inherits System.Windows.Forms.Form

    'Descartar substituições de formulário para limpar a lista de componentes.
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

    'Exigido pelo Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'OBSERVAÇÃO: O procedimento a seguir é exigido pelo Windows Form Designer
    'Ele pode ser modificado usando o Windows Form Designer.  
    'Não o modifique usando o editor de códigos.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(FrmSobre))
        Me.lbTrojans = New System.Windows.Forms.Label()
        Me.LinkLabel1 = New System.Windows.Forms.LinkLabel()
        Me.Label7 = New System.Windows.Forms.Label()
        Me.PictureBox1 = New System.Windows.Forms.PictureBox()
        Me.Label8 = New System.Windows.Forms.Label()
        Me.LinkLabel2 = New System.Windows.Forms.LinkLabel()
        Me.LB_Trojans = New System.Windows.Forms.ListBox()
        Me.LB_Scanners = New System.Windows.Forms.ListBox()
        Me.lbScanners = New System.Windows.Forms.Label()
        Me.PictureBox2 = New System.Windows.Forms.PictureBox()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.PictureBox2, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'lbTrojans
        '
        Me.lbTrojans.AutoSize = True
        Me.lbTrojans.Font = New System.Drawing.Font("Impact", 15.75!, System.Drawing.FontStyle.Underline, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lbTrojans.Location = New System.Drawing.Point(11, 20)
        Me.lbTrojans.Name = "lbTrojans"
        Me.lbTrojans.Size = New System.Drawing.Size(78, 26)
        Me.lbTrojans.TabIndex = 0
        Me.lbTrojans.Text = "Trojans"
        '
        'LinkLabel1
        '
        Me.LinkLabel1.Anchor = CType((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Left), System.Windows.Forms.AnchorStyles)
        Me.LinkLabel1.AutoSize = True
        Me.LinkLabel1.Font = New System.Drawing.Font("Impact", 11.25!, System.Drawing.FontStyle.Underline, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LinkLabel1.LinkBehavior = System.Windows.Forms.LinkBehavior.HoverUnderline
        Me.LinkLabel1.Location = New System.Drawing.Point(39, 167)
        Me.LinkLabel1.Name = "LinkLabel1"
        Me.LinkLabel1.Size = New System.Drawing.Size(105, 19)
        Me.LinkLabel1.TabIndex = 6
        Me.LinkLabel1.TabStop = True
        Me.LinkLabel1.Text = "Connect-Trojan"
        Me.LinkLabel1.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
        '
        'Label7
        '
        Me.Label7.Anchor = CType((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.Label7.AutoSize = True
        Me.Label7.Font = New System.Drawing.Font("Segoe UI", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label7.Location = New System.Drawing.Point(337, 161)
        Me.Label7.Name = "Label7"
        Me.Label7.Size = New System.Drawing.Size(187, 13)
        Me.Label7.TabIndex = 7
        Me.Label7.Text = "Desenvolvido Por : Hacking SooftT"
        '
        'PictureBox1
        '
        Me.PictureBox1.BackColor = System.Drawing.Color.Transparent
        Me.PictureBox1.Image = CType(resources.GetObject("PictureBox1.Image"), System.Drawing.Image)
        Me.PictureBox1.Location = New System.Drawing.Point(316, 30)
        Me.PictureBox1.Name = "PictureBox1"
        Me.PictureBox1.Size = New System.Drawing.Size(204, 124)
        Me.PictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom
        Me.PictureBox1.TabIndex = 8
        Me.PictureBox1.TabStop = False
        '
        'Label8
        '
        Me.Label8.AutoSize = True
        Me.Label8.Font = New System.Drawing.Font("Segoe UI", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label8.Location = New System.Drawing.Point(314, 7)
        Me.Label8.Name = "Label8"
        Me.Label8.Size = New System.Drawing.Size(211, 13)
        Me.Label8.TabIndex = 9
        Me.Label8.Text = "Não Responsabilizamos Pelo Seus Atos"
        '
        'LinkLabel2
        '
        Me.LinkLabel2.Anchor = CType((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.LinkLabel2.AutoSize = True
        Me.LinkLabel2.Font = New System.Drawing.Font("Segoe UI", 8.25!, CType((System.Drawing.FontStyle.Bold Or System.Drawing.FontStyle.Underline), System.Drawing.FontStyle), System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LinkLabel2.Location = New System.Drawing.Point(473, 174)
        Me.LinkLabel2.Name = "LinkLabel2"
        Me.LinkLabel2.Size = New System.Drawing.Size(51, 13)
        Me.LinkLabel2.TabIndex = 10
        Me.LinkLabel2.TabStop = True
        Me.LinkLabel2.Text = "Youtube"
        '
        'LB_Trojans
        '
        Me.LB_Trojans.BackColor = System.Drawing.Color.White
        Me.LB_Trojans.BorderStyle = System.Windows.Forms.BorderStyle.None
        Me.LB_Trojans.Font = New System.Drawing.Font("Segoe UI", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LB_Trojans.FormattingEnabled = True
        Me.LB_Trojans.Items.AddRange(New Object() {"- Adwind RAT", "- Alusinus RAT", "- Babylon RAT", "- Back Connect RAT", "- Black-Key RAT", "- Bozok", "- BX RAT", "- Coringa-RAT", "- Crimson RAT", "- CyberGate", "- Dark NET RAT", "- DarkComet-RAT", "- Devils-RAT", "- Diamond RAT", "- ExploitSpot Poison-RAT", "- Frutas RAT", "- Garota-RAT", "- Greame RAT", "- Hakops RAT", "- Harmmy RAT", "- HiB RAT", "- Imperium RAT", "- Indetectables-RAT", "- Infinity RAT", "- Iraq RAT", "- jSpy-RAT", "- Kurd-RAT", "- L6-RAT", "- LeGeNd - Of - SiR - DoOoM - RaT - THE HELL (VERSION)", "- Loki RAT", "- LuxNET-RAT", "- Mega RAT", "- Morocco-RAT", "- mQ5 RAT - Plus", "- NanoCore RAT", "- NjRAT", "- Njw0rm", "- Orion RAT", "- Pandora RAT", "- Paradox RAT", "- Punisher RAT", "- Rabbit-Hole RAT", "- RoyalNET RAT", "- RPG RAT", "- S3curity-RAT", "- Sa3eka RAT", "- Sako RAT", "- Santi RAT", "- Setro RAT", "- Simple RAT", "- Slayer-RAT", "- Splinter RAT", "- Spy-NET", "- Spycronic", "- SpyGate-RAT", "- TorCT PHP RAT", "- UcuL RAT", "- Viral RAT", "- Virus-RAT", "- Xtreme-RAT"})
        Me.LB_Trojans.Location = New System.Drawing.Point(16, 53)
        Me.LB_Trojans.Name = "LB_Trojans"
        Me.LB_Trojans.Size = New System.Drawing.Size(143, 104)
        Me.LB_Trojans.Sorted = True
        Me.LB_Trojans.TabIndex = 12
        '
        'LB_Scanners
        '
        Me.LB_Scanners.BackColor = System.Drawing.Color.White
        Me.LB_Scanners.BorderStyle = System.Windows.Forms.BorderStyle.None
        Me.LB_Scanners.Font = New System.Drawing.Font("Segoe UI", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LB_Scanners.FormattingEnabled = True
        Me.LB_Scanners.Items.AddRange(New Object() {"- AnonScan", "- Jotti", "- MaJyx Scanner", "- Metadefender", "- Nodistribute", "- Total Virus Check", "- VirusCheckMate", "- Virusimune", "- VirusTotal", "- xCrewScanner"})
        Me.LB_Scanners.Location = New System.Drawing.Point(165, 53)
        Me.LB_Scanners.Name = "LB_Scanners"
        Me.LB_Scanners.Size = New System.Drawing.Size(143, 104)
        Me.LB_Scanners.Sorted = True
        Me.LB_Scanners.TabIndex = 13
        '
        'lbScanners
        '
        Me.lbScanners.AutoSize = True
        Me.lbScanners.Font = New System.Drawing.Font("Impact", 15.75!, System.Drawing.FontStyle.Underline, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lbScanners.Location = New System.Drawing.Point(160, 20)
        Me.lbScanners.Name = "lbScanners"
        Me.lbScanners.Size = New System.Drawing.Size(95, 26)
        Me.lbScanners.TabIndex = 0
        Me.lbScanners.Text = "Scanners"
        '
        'PictureBox2
        '
        Me.PictureBox2.BackColor = System.Drawing.Color.Transparent
        Me.PictureBox2.Image = CType(resources.GetObject("PictureBox2.Image"), System.Drawing.Image)
        Me.PictureBox2.Location = New System.Drawing.Point(4, 161)
        Me.PictureBox2.Name = "PictureBox2"
        Me.PictureBox2.Size = New System.Drawing.Size(44, 32)
        Me.PictureBox2.SizeMode = System.Windows.Forms.PictureBoxSizeMode.CenterImage
        Me.PictureBox2.TabIndex = 14
        Me.PictureBox2.TabStop = False
        '
        'FrmSobre
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.Color.White
        Me.ClientSize = New System.Drawing.Size(533, 195)
        Me.Controls.Add(Me.LB_Scanners)
        Me.Controls.Add(Me.LB_Trojans)
        Me.Controls.Add(Me.LinkLabel2)
        Me.Controls.Add(Me.Label8)
        Me.Controls.Add(Me.PictureBox1)
        Me.Controls.Add(Me.Label7)
        Me.Controls.Add(Me.LinkLabel1)
        Me.Controls.Add(Me.lbScanners)
        Me.Controls.Add(Me.lbTrojans)
        Me.Controls.Add(Me.PictureBox2)
        Me.ForeColor = System.Drawing.Color.Black
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow
        Me.MaximizeBox = False
        Me.MinimizeBox = False
        Me.Name = "FrmSobre"
        Me.ShowIcon = False
        Me.ShowInTaskbar = False
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Pagina Inicial - Informações"
        Me.TopMost = True
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.PictureBox2, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents lbTrojans As System.Windows.Forms.Label
    Friend WithEvents LinkLabel1 As System.Windows.Forms.LinkLabel
    Friend WithEvents Label7 As System.Windows.Forms.Label
    Friend WithEvents PictureBox1 As System.Windows.Forms.PictureBox
    Friend WithEvents Label8 As System.Windows.Forms.Label
    Friend WithEvents LinkLabel2 As System.Windows.Forms.LinkLabel
    Friend WithEvents LB_Trojans As System.Windows.Forms.ListBox
    Friend WithEvents LB_Scanners As System.Windows.Forms.ListBox
    Friend WithEvents lbScanners As System.Windows.Forms.Label
    Friend WithEvents PictureBox2 As System.Windows.Forms.PictureBox
End Class
