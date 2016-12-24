<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class FrmTerror
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(FrmTerror))
        Me.GroupBox1 = New System.Windows.Forms.GroupBox()
        Me.GroupBox2 = New System.Windows.Forms.GroupBox()
        Me.btnPorcurar = New System.Windows.Forms.Button()
        Me.btnEnviar = New System.Windows.Forms.Button()
        Me.PicPrevia = New System.Windows.Forms.PictureBox()
        Me.txtLocal = New System.Windows.Forms.TextBox()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.RB05 = New System.Windows.Forms.RadioButton()
        Me.RB04 = New System.Windows.Forms.RadioButton()
        Me.RB03 = New System.Windows.Forms.RadioButton()
        Me.RB02 = New System.Windows.Forms.RadioButton()
        Me.RB01 = New System.Windows.Forms.RadioButton()
        Me.PictureBox6 = New System.Windows.Forms.PictureBox()
        Me.PictureBox3 = New System.Windows.Forms.PictureBox()
        Me.PictureBox4 = New System.Windows.Forms.PictureBox()
        Me.PictureBox2 = New System.Windows.Forms.PictureBox()
        Me.PictureBox1 = New System.Windows.Forms.PictureBox()
        Me.GroupBox1.SuspendLayout()
        Me.GroupBox2.SuspendLayout()
        CType(Me.PicPrevia, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.PictureBox6, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.PictureBox3, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.PictureBox4, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.PictureBox2, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.GroupBox2)
        Me.GroupBox1.Controls.Add(Me.RB05)
        Me.GroupBox1.Controls.Add(Me.RB04)
        Me.GroupBox1.Controls.Add(Me.RB03)
        Me.GroupBox1.Controls.Add(Me.RB02)
        Me.GroupBox1.Controls.Add(Me.RB01)
        Me.GroupBox1.Controls.Add(Me.PictureBox6)
        Me.GroupBox1.Controls.Add(Me.PictureBox3)
        Me.GroupBox1.Controls.Add(Me.PictureBox4)
        Me.GroupBox1.Controls.Add(Me.PictureBox2)
        Me.GroupBox1.Controls.Add(Me.PictureBox1)
        Me.GroupBox1.Font = New System.Drawing.Font("Segoe UI", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.GroupBox1.ForeColor = System.Drawing.Color.White
        Me.GroupBox1.Location = New System.Drawing.Point(6, 4)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(617, 252)
        Me.GroupBox1.TabIndex = 0
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "Imagens Padrão"
        '
        'GroupBox2
        '
        Me.GroupBox2.Controls.Add(Me.btnPorcurar)
        Me.GroupBox2.Controls.Add(Me.btnEnviar)
        Me.GroupBox2.Controls.Add(Me.PicPrevia)
        Me.GroupBox2.Controls.Add(Me.txtLocal)
        Me.GroupBox2.Controls.Add(Me.Label1)
        Me.GroupBox2.ForeColor = System.Drawing.Color.White
        Me.GroupBox2.Location = New System.Drawing.Point(6, 137)
        Me.GroupBox2.Name = "GroupBox2"
        Me.GroupBox2.Size = New System.Drawing.Size(604, 108)
        Me.GroupBox2.TabIndex = 10
        Me.GroupBox2.TabStop = False
        Me.GroupBox2.Text = "Foto Pesonalizada"
        '
        'btnPorcurar
        '
        Me.btnPorcurar.Cursor = System.Windows.Forms.Cursors.Hand
        Me.btnPorcurar.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnPorcurar.ForeColor = System.Drawing.Color.White
        Me.btnPorcurar.Location = New System.Drawing.Point(6, 67)
        Me.btnPorcurar.Name = "btnPorcurar"
        Me.btnPorcurar.Size = New System.Drawing.Size(190, 35)
        Me.btnPorcurar.TabIndex = 13
        Me.btnPorcurar.Text = "Procurar"
        Me.btnPorcurar.UseVisualStyleBackColor = True
        '
        'btnEnviar
        '
        Me.btnEnviar.Cursor = System.Windows.Forms.Cursors.Hand
        Me.btnEnviar.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnEnviar.ForeColor = System.Drawing.Color.White
        Me.btnEnviar.Location = New System.Drawing.Point(202, 67)
        Me.btnEnviar.Name = "btnEnviar"
        Me.btnEnviar.Size = New System.Drawing.Size(274, 35)
        Me.btnEnviar.TabIndex = 12
        Me.btnEnviar.Text = "Enviar"
        Me.btnEnviar.UseVisualStyleBackColor = True
        '
        'PicPrevia
        '
        Me.PicPrevia.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.PicPrevia.Cursor = System.Windows.Forms.Cursors.Arrow
        Me.PicPrevia.Location = New System.Drawing.Point(482, 12)
        Me.PicPrevia.Name = "PicPrevia"
        Me.PicPrevia.Size = New System.Drawing.Size(116, 90)
        Me.PicPrevia.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage
        Me.PicPrevia.TabIndex = 11
        Me.PicPrevia.TabStop = False
        '
        'txtLocal
        '
        Me.txtLocal.BackColor = System.Drawing.Color.Black
        Me.txtLocal.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.txtLocal.Cursor = System.Windows.Forms.Cursors.Default
        Me.txtLocal.Font = New System.Drawing.Font("Segoe UI", 9.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtLocal.ForeColor = System.Drawing.Color.White
        Me.txtLocal.Location = New System.Drawing.Point(6, 38)
        Me.txtLocal.Name = "txtLocal"
        Me.txtLocal.ReadOnly = True
        Me.txtLocal.Size = New System.Drawing.Size(470, 23)
        Me.txtLocal.TabIndex = 1
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Font = New System.Drawing.Font("Segoe UI", 9.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.Location = New System.Drawing.Point(3, 22)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(35, 15)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "Local"
        '
        'RB05
        '
        Me.RB05.AutoSize = True
        Me.RB05.Cursor = System.Windows.Forms.Cursors.Hand
        Me.RB05.Location = New System.Drawing.Point(533, 114)
        Me.RB05.Name = "RB05"
        Me.RB05.Size = New System.Drawing.Size(37, 17)
        Me.RB05.TabIndex = 9
        Me.RB05.Text = "05"
        Me.RB05.UseVisualStyleBackColor = True
        '
        'RB04
        '
        Me.RB04.AutoSize = True
        Me.RB04.Cursor = System.Windows.Forms.Cursors.Hand
        Me.RB04.Location = New System.Drawing.Point(412, 114)
        Me.RB04.Name = "RB04"
        Me.RB04.Size = New System.Drawing.Size(37, 17)
        Me.RB04.TabIndex = 8
        Me.RB04.Text = "04"
        Me.RB04.UseVisualStyleBackColor = True
        '
        'RB03
        '
        Me.RB03.AutoSize = True
        Me.RB03.Cursor = System.Windows.Forms.Cursors.Hand
        Me.RB03.Location = New System.Drawing.Point(281, 114)
        Me.RB03.Name = "RB03"
        Me.RB03.Size = New System.Drawing.Size(37, 17)
        Me.RB03.TabIndex = 7
        Me.RB03.Text = "03"
        Me.RB03.UseVisualStyleBackColor = True
        '
        'RB02
        '
        Me.RB02.AutoSize = True
        Me.RB02.Cursor = System.Windows.Forms.Cursors.Hand
        Me.RB02.Location = New System.Drawing.Point(159, 114)
        Me.RB02.Name = "RB02"
        Me.RB02.Size = New System.Drawing.Size(37, 17)
        Me.RB02.TabIndex = 6
        Me.RB02.Text = "02"
        Me.RB02.UseVisualStyleBackColor = True
        '
        'RB01
        '
        Me.RB01.AutoSize = True
        Me.RB01.Checked = True
        Me.RB01.Cursor = System.Windows.Forms.Cursors.Hand
        Me.RB01.Location = New System.Drawing.Point(38, 114)
        Me.RB01.Name = "RB01"
        Me.RB01.Size = New System.Drawing.Size(37, 17)
        Me.RB01.TabIndex = 5
        Me.RB01.TabStop = True
        Me.RB01.Text = "01"
        Me.RB01.UseVisualStyleBackColor = True
        '
        'PictureBox6
        '
        Me.PictureBox6.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.PictureBox6.Cursor = System.Windows.Forms.Cursors.Hand
        Me.PictureBox6.Image = CType(resources.GetObject("PictureBox6.Image"), System.Drawing.Image)
        Me.PictureBox6.Location = New System.Drawing.Point(494, 18)
        Me.PictureBox6.Name = "PictureBox6"
        Me.PictureBox6.Size = New System.Drawing.Size(116, 90)
        Me.PictureBox6.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage
        Me.PictureBox6.TabIndex = 4
        Me.PictureBox6.TabStop = False
        '
        'PictureBox3
        '
        Me.PictureBox3.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.PictureBox3.Cursor = System.Windows.Forms.Cursors.Hand
        Me.PictureBox3.Image = CType(resources.GetObject("PictureBox3.Image"), System.Drawing.Image)
        Me.PictureBox3.Location = New System.Drawing.Point(372, 18)
        Me.PictureBox3.Name = "PictureBox3"
        Me.PictureBox3.Size = New System.Drawing.Size(116, 90)
        Me.PictureBox3.TabIndex = 3
        Me.PictureBox3.TabStop = False
        '
        'PictureBox4
        '
        Me.PictureBox4.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.PictureBox4.Cursor = System.Windows.Forms.Cursors.Hand
        Me.PictureBox4.Image = CType(resources.GetObject("PictureBox4.Image"), System.Drawing.Image)
        Me.PictureBox4.Location = New System.Drawing.Point(250, 18)
        Me.PictureBox4.Name = "PictureBox4"
        Me.PictureBox4.Size = New System.Drawing.Size(116, 90)
        Me.PictureBox4.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage
        Me.PictureBox4.TabIndex = 2
        Me.PictureBox4.TabStop = False
        '
        'PictureBox2
        '
        Me.PictureBox2.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.PictureBox2.Cursor = System.Windows.Forms.Cursors.Hand
        Me.PictureBox2.Image = CType(resources.GetObject("PictureBox2.Image"), System.Drawing.Image)
        Me.PictureBox2.Location = New System.Drawing.Point(128, 18)
        Me.PictureBox2.Name = "PictureBox2"
        Me.PictureBox2.Size = New System.Drawing.Size(116, 90)
        Me.PictureBox2.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage
        Me.PictureBox2.TabIndex = 1
        Me.PictureBox2.TabStop = False
        '
        'PictureBox1
        '
        Me.PictureBox1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.PictureBox1.Cursor = System.Windows.Forms.Cursors.Hand
        Me.PictureBox1.Image = CType(resources.GetObject("PictureBox1.Image"), System.Drawing.Image)
        Me.PictureBox1.Location = New System.Drawing.Point(6, 18)
        Me.PictureBox1.Name = "PictureBox1"
        Me.PictureBox1.Size = New System.Drawing.Size(116, 90)
        Me.PictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage
        Me.PictureBox1.TabIndex = 0
        Me.PictureBox1.TabStop = False
        '
        'FrmTerror
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.Color.Black
        Me.ClientSize = New System.Drawing.Size(627, 261)
        Me.Controls.Add(Me.GroupBox1)
        Me.ForeColor = System.Drawing.Color.White
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle
        Me.MaximizeBox = False
        Me.Name = "FrmTerror"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Terror"
        Me.GroupBox1.ResumeLayout(False)
        Me.GroupBox1.PerformLayout()
        Me.GroupBox2.ResumeLayout(False)
        Me.GroupBox2.PerformLayout()
        CType(Me.PicPrevia, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.PictureBox6, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.PictureBox3, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.PictureBox4, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.PictureBox2, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents PictureBox6 As System.Windows.Forms.PictureBox
    Friend WithEvents PictureBox3 As System.Windows.Forms.PictureBox
    Friend WithEvents PictureBox4 As System.Windows.Forms.PictureBox
    Friend WithEvents PictureBox2 As System.Windows.Forms.PictureBox
    Friend WithEvents PictureBox1 As System.Windows.Forms.PictureBox
    Friend WithEvents RB05 As System.Windows.Forms.RadioButton
    Friend WithEvents RB04 As System.Windows.Forms.RadioButton
    Friend WithEvents RB03 As System.Windows.Forms.RadioButton
    Friend WithEvents RB02 As System.Windows.Forms.RadioButton
    Friend WithEvents RB01 As System.Windows.Forms.RadioButton
    Friend WithEvents GroupBox2 As System.Windows.Forms.GroupBox
    Friend WithEvents btnPorcurar As System.Windows.Forms.Button
    Friend WithEvents btnEnviar As System.Windows.Forms.Button
    Friend WithEvents PicPrevia As System.Windows.Forms.PictureBox
    Friend WithEvents txtLocal As System.Windows.Forms.TextBox
    Friend WithEvents Label1 As System.Windows.Forms.Label
End Class
