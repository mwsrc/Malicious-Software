<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class FrmMsgBox
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(FrmMsgBox))
        Me.GroupBox20 = New System.Windows.Forms.GroupBox()
        Me.RBRepetirCancelar = New System.Windows.Forms.RadioButton()
        Me.RBOkCancelar = New System.Windows.Forms.RadioButton()
        Me.RBOk = New System.Windows.Forms.RadioButton()
        Me.RBSimNãoCancelar = New System.Windows.Forms.RadioButton()
        Me.RBSimNão = New System.Windows.Forms.RadioButton()
        Me.RBAbortarRepetirCancelar = New System.Windows.Forms.RadioButton()
        Me.GroupBox21 = New System.Windows.Forms.GroupBox()
        Me.txtMensagem = New System.Windows.Forms.TextBox()
        Me.txtTitulo = New System.Windows.Forms.TextBox()
        Me.GroupBox22 = New System.Windows.Forms.GroupBox()
        Me.RBError = New System.Windows.Forms.RadioButton()
        Me.PictureBox4 = New System.Windows.Forms.PictureBox()
        Me.RBAviso = New System.Windows.Forms.RadioButton()
        Me.PictureBox3 = New System.Windows.Forms.PictureBox()
        Me.RBQuestão = New System.Windows.Forms.RadioButton()
        Me.PictureBox2 = New System.Windows.Forms.PictureBox()
        Me.RBInformações = New System.Windows.Forms.RadioButton()
        Me.PictureBox1 = New System.Windows.Forms.PictureBox()
        Me.btnTestar = New System.Windows.Forms.Button()
        Me.btnEnviar = New System.Windows.Forms.Button()
        Me.GroupBox20.SuspendLayout()
        Me.GroupBox21.SuspendLayout()
        Me.GroupBox22.SuspendLayout()
        CType(Me.PictureBox4, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.PictureBox3, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.PictureBox2, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'GroupBox20
        '
        Me.GroupBox20.Controls.Add(Me.RBRepetirCancelar)
        Me.GroupBox20.Controls.Add(Me.RBOkCancelar)
        Me.GroupBox20.Controls.Add(Me.RBOk)
        Me.GroupBox20.Controls.Add(Me.RBSimNãoCancelar)
        Me.GroupBox20.Controls.Add(Me.RBSimNão)
        Me.GroupBox20.Controls.Add(Me.RBAbortarRepetirCancelar)
        Me.GroupBox20.Font = New System.Drawing.Font("Segoe UI", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.GroupBox20.ForeColor = System.Drawing.Color.White
        Me.GroupBox20.Location = New System.Drawing.Point(389, 4)
        Me.GroupBox20.Name = "GroupBox20"
        Me.GroupBox20.Size = New System.Drawing.Size(174, 160)
        Me.GroupBox20.TabIndex = 15
        Me.GroupBox20.TabStop = False
        Me.GroupBox20.Text = "Botões"
        '
        'RBRepetirCancelar
        '
        Me.RBRepetirCancelar.AutoSize = True
        Me.RBRepetirCancelar.Cursor = System.Windows.Forms.Cursors.Hand
        Me.RBRepetirCancelar.Location = New System.Drawing.Point(6, 110)
        Me.RBRepetirCancelar.Name = "RBRepetirCancelar"
        Me.RBRepetirCancelar.Size = New System.Drawing.Size(116, 17)
        Me.RBRepetirCancelar.TabIndex = 4
        Me.RBRepetirCancelar.Text = "Repetir | Cancelar"
        Me.RBRepetirCancelar.UseVisualStyleBackColor = True
        '
        'RBOkCancelar
        '
        Me.RBOkCancelar.AutoSize = True
        Me.RBOkCancelar.Cursor = System.Windows.Forms.Cursors.Hand
        Me.RBOkCancelar.Location = New System.Drawing.Point(6, 87)
        Me.RBOkCancelar.Name = "RBOkCancelar"
        Me.RBOkCancelar.Size = New System.Drawing.Size(94, 17)
        Me.RBOkCancelar.TabIndex = 3
        Me.RBOkCancelar.Text = "OK | Cancelar"
        Me.RBOkCancelar.UseVisualStyleBackColor = True
        '
        'RBOk
        '
        Me.RBOk.AutoSize = True
        Me.RBOk.Cursor = System.Windows.Forms.Cursors.Hand
        Me.RBOk.Location = New System.Drawing.Point(6, 64)
        Me.RBOk.Name = "RBOk"
        Me.RBOk.Size = New System.Drawing.Size(40, 17)
        Me.RBOk.TabIndex = 2
        Me.RBOk.Text = "OK"
        Me.RBOk.UseVisualStyleBackColor = True
        '
        'RBSimNãoCancelar
        '
        Me.RBSimNãoCancelar.AutoSize = True
        Me.RBSimNãoCancelar.Cursor = System.Windows.Forms.Cursors.Hand
        Me.RBSimNãoCancelar.Location = New System.Drawing.Point(6, 41)
        Me.RBSimNãoCancelar.Name = "RBSimNãoCancelar"
        Me.RBSimNãoCancelar.Size = New System.Drawing.Size(130, 17)
        Me.RBSimNãoCancelar.TabIndex = 1
        Me.RBSimNãoCancelar.Text = "Sim | Não | Cancelar"
        Me.RBSimNãoCancelar.UseVisualStyleBackColor = True
        '
        'RBSimNão
        '
        Me.RBSimNão.AutoSize = True
        Me.RBSimNão.Checked = True
        Me.RBSimNão.Cursor = System.Windows.Forms.Cursors.Hand
        Me.RBSimNão.Location = New System.Drawing.Point(6, 18)
        Me.RBSimNão.Name = "RBSimNão"
        Me.RBSimNão.Size = New System.Drawing.Size(76, 17)
        Me.RBSimNão.TabIndex = 0
        Me.RBSimNão.TabStop = True
        Me.RBSimNão.Text = "Sim | Não"
        Me.RBSimNão.UseVisualStyleBackColor = True
        '
        'RBAbortarRepetirCancelar
        '
        Me.RBAbortarRepetirCancelar.AutoSize = True
        Me.RBAbortarRepetirCancelar.Cursor = System.Windows.Forms.Cursors.Hand
        Me.RBAbortarRepetirCancelar.Location = New System.Drawing.Point(6, 133)
        Me.RBAbortarRepetirCancelar.Name = "RBAbortarRepetirCancelar"
        Me.RBAbortarRepetirCancelar.Size = New System.Drawing.Size(161, 17)
        Me.RBAbortarRepetirCancelar.TabIndex = 5
        Me.RBAbortarRepetirCancelar.Text = "Anular | Repetir | Cancelar"
        Me.RBAbortarRepetirCancelar.UseVisualStyleBackColor = True
        '
        'GroupBox21
        '
        Me.GroupBox21.Controls.Add(Me.txtMensagem)
        Me.GroupBox21.Controls.Add(Me.txtTitulo)
        Me.GroupBox21.Font = New System.Drawing.Font("Segoe UI", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.GroupBox21.ForeColor = System.Drawing.Color.White
        Me.GroupBox21.Location = New System.Drawing.Point(7, 104)
        Me.GroupBox21.Name = "GroupBox21"
        Me.GroupBox21.Size = New System.Drawing.Size(376, 170)
        Me.GroupBox21.TabIndex = 14
        Me.GroupBox21.TabStop = False
        Me.GroupBox21.Text = "Mensagem"
        '
        'txtMensagem
        '
        Me.txtMensagem.BackColor = System.Drawing.Color.Black
        Me.txtMensagem.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.txtMensagem.ForeColor = System.Drawing.Color.White
        Me.txtMensagem.Location = New System.Drawing.Point(6, 49)
        Me.txtMensagem.Multiline = True
        Me.txtMensagem.Name = "txtMensagem"
        Me.txtMensagem.Size = New System.Drawing.Size(364, 115)
        Me.txtMensagem.TabIndex = 1
        Me.txtMensagem.Text = "O sorriso do palhaço é ver o circo pegar fogo"
        '
        'txtTitulo
        '
        Me.txtTitulo.BackColor = System.Drawing.Color.Black
        Me.txtTitulo.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.txtTitulo.ForeColor = System.Drawing.Color.White
        Me.txtTitulo.Location = New System.Drawing.Point(6, 21)
        Me.txtTitulo.Name = "txtTitulo"
        Me.txtTitulo.Size = New System.Drawing.Size(364, 22)
        Me.txtTitulo.TabIndex = 0
        Me.txtTitulo.Text = "Coringa-Rat"
        '
        'GroupBox22
        '
        Me.GroupBox22.Controls.Add(Me.RBError)
        Me.GroupBox22.Controls.Add(Me.PictureBox4)
        Me.GroupBox22.Controls.Add(Me.RBAviso)
        Me.GroupBox22.Controls.Add(Me.PictureBox3)
        Me.GroupBox22.Controls.Add(Me.RBQuestão)
        Me.GroupBox22.Controls.Add(Me.PictureBox2)
        Me.GroupBox22.Controls.Add(Me.RBInformações)
        Me.GroupBox22.Controls.Add(Me.PictureBox1)
        Me.GroupBox22.Font = New System.Drawing.Font("Segoe UI", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.GroupBox22.ForeColor = System.Drawing.Color.White
        Me.GroupBox22.Location = New System.Drawing.Point(7, 4)
        Me.GroupBox22.Name = "GroupBox22"
        Me.GroupBox22.Size = New System.Drawing.Size(376, 98)
        Me.GroupBox22.TabIndex = 13
        Me.GroupBox22.TabStop = False
        Me.GroupBox22.Text = "Icones"
        '
        'RBError
        '
        Me.RBError.AutoSize = True
        Me.RBError.Cursor = System.Windows.Forms.Cursors.Hand
        Me.RBError.Location = New System.Drawing.Point(317, 72)
        Me.RBError.Name = "RBError"
        Me.RBError.Size = New System.Drawing.Size(50, 17)
        Me.RBError.TabIndex = 7
        Me.RBError.TabStop = True
        Me.RBError.Text = "Error"
        Me.RBError.UseVisualStyleBackColor = True
        '
        'PictureBox4
        '
        Me.PictureBox4.Cursor = System.Windows.Forms.Cursors.Hand
        Me.PictureBox4.Image = CType(resources.GetObject("PictureBox4.Image"), System.Drawing.Image)
        Me.PictureBox4.Location = New System.Drawing.Point(317, 21)
        Me.PictureBox4.Name = "PictureBox4"
        Me.PictureBox4.Size = New System.Drawing.Size(45, 45)
        Me.PictureBox4.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom
        Me.PictureBox4.TabIndex = 6
        Me.PictureBox4.TabStop = False
        '
        'RBAviso
        '
        Me.RBAviso.AutoSize = True
        Me.RBAviso.Cursor = System.Windows.Forms.Cursors.Hand
        Me.RBAviso.Location = New System.Drawing.Point(220, 72)
        Me.RBAviso.Name = "RBAviso"
        Me.RBAviso.Size = New System.Drawing.Size(54, 17)
        Me.RBAviso.TabIndex = 5
        Me.RBAviso.TabStop = True
        Me.RBAviso.Text = "Aviso"
        Me.RBAviso.UseVisualStyleBackColor = True
        '
        'PictureBox3
        '
        Me.PictureBox3.Cursor = System.Windows.Forms.Cursors.Hand
        Me.PictureBox3.Image = CType(resources.GetObject("PictureBox3.Image"), System.Drawing.Image)
        Me.PictureBox3.Location = New System.Drawing.Point(224, 21)
        Me.PictureBox3.Name = "PictureBox3"
        Me.PictureBox3.Size = New System.Drawing.Size(45, 45)
        Me.PictureBox3.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom
        Me.PictureBox3.TabIndex = 4
        Me.PictureBox3.TabStop = False
        '
        'RBQuestão
        '
        Me.RBQuestão.AutoSize = True
        Me.RBQuestão.Cursor = System.Windows.Forms.Cursors.Hand
        Me.RBQuestão.Location = New System.Drawing.Point(117, 72)
        Me.RBQuestão.Name = "RBQuestão"
        Me.RBQuestão.Size = New System.Drawing.Size(68, 17)
        Me.RBQuestão.TabIndex = 3
        Me.RBQuestão.TabStop = True
        Me.RBQuestão.Text = "Questão"
        Me.RBQuestão.UseVisualStyleBackColor = True
        '
        'PictureBox2
        '
        Me.PictureBox2.Cursor = System.Windows.Forms.Cursors.Hand
        Me.PictureBox2.Image = CType(resources.GetObject("PictureBox2.Image"), System.Drawing.Image)
        Me.PictureBox2.Location = New System.Drawing.Point(128, 21)
        Me.PictureBox2.Name = "PictureBox2"
        Me.PictureBox2.Size = New System.Drawing.Size(45, 45)
        Me.PictureBox2.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom
        Me.PictureBox2.TabIndex = 2
        Me.PictureBox2.TabStop = False
        '
        'RBInformações
        '
        Me.RBInformações.AutoSize = True
        Me.RBInformações.Checked = True
        Me.RBInformações.Cursor = System.Windows.Forms.Cursors.Hand
        Me.RBInformações.Location = New System.Drawing.Point(14, 72)
        Me.RBInformações.Name = "RBInformações"
        Me.RBInformações.Size = New System.Drawing.Size(89, 17)
        Me.RBInformações.TabIndex = 1
        Me.RBInformações.TabStop = True
        Me.RBInformações.Text = "Informações"
        Me.RBInformações.UseVisualStyleBackColor = True
        '
        'PictureBox1
        '
        Me.PictureBox1.Cursor = System.Windows.Forms.Cursors.Hand
        Me.PictureBox1.Image = CType(resources.GetObject("PictureBox1.Image"), System.Drawing.Image)
        Me.PictureBox1.Location = New System.Drawing.Point(34, 21)
        Me.PictureBox1.Name = "PictureBox1"
        Me.PictureBox1.Size = New System.Drawing.Size(45, 45)
        Me.PictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom
        Me.PictureBox1.TabIndex = 0
        Me.PictureBox1.TabStop = False
        '
        'btnTestar
        '
        Me.btnTestar.Cursor = System.Windows.Forms.Cursors.Hand
        Me.btnTestar.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnTestar.Font = New System.Drawing.Font("Segoe UI", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnTestar.ForeColor = System.Drawing.Color.White
        Me.btnTestar.Image = CType(resources.GetObject("btnTestar.Image"), System.Drawing.Image)
        Me.btnTestar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.btnTestar.Location = New System.Drawing.Point(389, 222)
        Me.btnTestar.Name = "btnTestar"
        Me.btnTestar.Size = New System.Drawing.Size(174, 36)
        Me.btnTestar.TabIndex = 11
        Me.btnTestar.Text = "Testar"
        Me.btnTestar.UseVisualStyleBackColor = True
        '
        'btnEnviar
        '
        Me.btnEnviar.Cursor = System.Windows.Forms.Cursors.Hand
        Me.btnEnviar.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnEnviar.Font = New System.Drawing.Font("Segoe UI", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnEnviar.ForeColor = System.Drawing.Color.White
        Me.btnEnviar.Image = CType(resources.GetObject("btnEnviar.Image"), System.Drawing.Image)
        Me.btnEnviar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.btnEnviar.Location = New System.Drawing.Point(389, 180)
        Me.btnEnviar.Name = "btnEnviar"
        Me.btnEnviar.Size = New System.Drawing.Size(174, 36)
        Me.btnEnviar.TabIndex = 12
        Me.btnEnviar.Text = "Enviar"
        Me.btnEnviar.UseVisualStyleBackColor = True
        '
        'FrmMsgBox
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.Color.Black
        Me.ClientSize = New System.Drawing.Size(570, 280)
        Me.Controls.Add(Me.GroupBox20)
        Me.Controls.Add(Me.GroupBox22)
        Me.Controls.Add(Me.btnTestar)
        Me.Controls.Add(Me.btnEnviar)
        Me.Controls.Add(Me.GroupBox21)
        Me.ForeColor = System.Drawing.Color.White
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle
        Me.MaximizeBox = False
        Me.Name = "FrmMsgBox"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Mensagem"
        Me.GroupBox20.ResumeLayout(False)
        Me.GroupBox20.PerformLayout()
        Me.GroupBox21.ResumeLayout(False)
        Me.GroupBox21.PerformLayout()
        Me.GroupBox22.ResumeLayout(False)
        Me.GroupBox22.PerformLayout()
        CType(Me.PictureBox4, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.PictureBox3, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.PictureBox2, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents GroupBox20 As System.Windows.Forms.GroupBox
    Friend WithEvents RBAbortarRepetirCancelar As System.Windows.Forms.RadioButton
    Friend WithEvents RBRepetirCancelar As System.Windows.Forms.RadioButton
    Friend WithEvents RBOkCancelar As System.Windows.Forms.RadioButton
    Friend WithEvents RBOk As System.Windows.Forms.RadioButton
    Friend WithEvents RBSimNãoCancelar As System.Windows.Forms.RadioButton
    Friend WithEvents RBSimNão As System.Windows.Forms.RadioButton
    Friend WithEvents GroupBox21 As System.Windows.Forms.GroupBox
    Friend WithEvents txtMensagem As System.Windows.Forms.TextBox
    Friend WithEvents txtTitulo As System.Windows.Forms.TextBox
    Friend WithEvents GroupBox22 As System.Windows.Forms.GroupBox
    Friend WithEvents RBError As System.Windows.Forms.RadioButton
    Friend WithEvents PictureBox4 As System.Windows.Forms.PictureBox
    Friend WithEvents RBAviso As System.Windows.Forms.RadioButton
    Friend WithEvents PictureBox3 As System.Windows.Forms.PictureBox
    Friend WithEvents RBQuestão As System.Windows.Forms.RadioButton
    Friend WithEvents PictureBox2 As System.Windows.Forms.PictureBox
    Friend WithEvents RBInformações As System.Windows.Forms.RadioButton
    Friend WithEvents PictureBox1 As System.Windows.Forms.PictureBox
    Friend WithEvents btnTestar As System.Windows.Forms.Button
    Friend WithEvents btnEnviar As System.Windows.Forms.Button
End Class
