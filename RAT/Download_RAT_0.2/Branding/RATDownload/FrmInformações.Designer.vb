<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class FrmInformações
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
        Me.PBicon = New System.Windows.Forms.PictureBox()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.lbPrograma = New System.Windows.Forms.Label()
        Me.lbTamanho = New System.Windows.Forms.Label()
        Me.Label4 = New System.Windows.Forms.Label()
        Me.lbURL = New System.Windows.Forms.LinkLabel()
        CType(Me.PBicon, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'PBicon
        '
        Me.PBicon.BackColor = System.Drawing.Color.Transparent
        Me.PBicon.Location = New System.Drawing.Point(10, 12)
        Me.PBicon.Name = "PBicon"
        Me.PBicon.Size = New System.Drawing.Size(80, 67)
        Me.PBicon.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom
        Me.PBicon.TabIndex = 0
        Me.PBicon.TabStop = False
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.BackColor = System.Drawing.Color.Transparent
        Me.Label1.Font = New System.Drawing.Font("Segoe UI", 8.25!, CType((System.Drawing.FontStyle.Bold Or System.Drawing.FontStyle.Underline), System.Drawing.FontStyle), System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.ForeColor = System.Drawing.Color.Blue
        Me.Label1.Location = New System.Drawing.Point(94, 12)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(77, 13)
        Me.Label1.TabIndex = 1
        Me.Label1.Text = "Informações:."
        '
        'lbPrograma
        '
        Me.lbPrograma.AutoSize = True
        Me.lbPrograma.BackColor = System.Drawing.Color.Transparent
        Me.lbPrograma.Font = New System.Drawing.Font("Segoe UI", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lbPrograma.ForeColor = System.Drawing.Color.Black
        Me.lbPrograma.Location = New System.Drawing.Point(94, 32)
        Me.lbPrograma.Name = "lbPrograma"
        Me.lbPrograma.Size = New System.Drawing.Size(71, 13)
        Me.lbPrograma.TabIndex = 2
        Me.lbPrograma.Text = "- Programa :"
        '
        'lbTamanho
        '
        Me.lbTamanho.AutoSize = True
        Me.lbTamanho.BackColor = System.Drawing.Color.Transparent
        Me.lbTamanho.Font = New System.Drawing.Font("Segoe UI", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lbTamanho.ForeColor = System.Drawing.Color.Black
        Me.lbTamanho.Location = New System.Drawing.Point(94, 49)
        Me.lbTamanho.Name = "lbTamanho"
        Me.lbTamanho.Size = New System.Drawing.Size(68, 13)
        Me.lbTamanho.TabIndex = 3
        Me.lbTamanho.Text = "- Tamanho :"
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.BackColor = System.Drawing.Color.Transparent
        Me.Label4.Font = New System.Drawing.Font("Segoe UI", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label4.ForeColor = System.Drawing.Color.Black
        Me.Label4.Location = New System.Drawing.Point(94, 68)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(44, 13)
        Me.Label4.TabIndex = 4
        Me.Label4.Text = "- URL : "
        '
        'lbURL
        '
        Me.lbURL.AutoSize = True
        Me.lbURL.BackColor = System.Drawing.Color.Transparent
        Me.lbURL.Font = New System.Drawing.Font("Segoe UI", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lbURL.LinkBehavior = System.Windows.Forms.LinkBehavior.HoverUnderline
        Me.lbURL.Location = New System.Drawing.Point(133, 68)
        Me.lbURL.Name = "lbURL"
        Me.lbURL.Size = New System.Drawing.Size(16, 13)
        Me.lbURL.TabIndex = 5
        Me.lbURL.TabStop = True
        Me.lbURL.Text = "   "
        '
        'FrmInformações
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.Color.White
        Me.ClientSize = New System.Drawing.Size(441, 97)
        Me.Controls.Add(Me.lbURL)
        Me.Controls.Add(Me.Label4)
        Me.Controls.Add(Me.lbTamanho)
        Me.Controls.Add(Me.lbPrograma)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.PBicon)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow
        Me.MaximizeBox = False
        Me.MinimizeBox = False
        Me.Name = "FrmInformações"
        Me.ShowIcon = False
        Me.ShowInTaskbar = False
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Informações"
        CType(Me.PBicon, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents PBicon As System.Windows.Forms.PictureBox
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents lbPrograma As System.Windows.Forms.Label
    Friend WithEvents lbTamanho As System.Windows.Forms.Label
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents lbURL As System.Windows.Forms.LinkLabel
End Class
