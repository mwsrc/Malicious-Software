<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Frm_Notificação
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
        Me.components = New System.ComponentModel.Container()
        Me.Panel3 = New System.Windows.Forms.Panel()
        Me.Label4 = New System.Windows.Forms.Label()
        Me.T1 = New System.Windows.Forms.Timer(Me.components)
        Me.T2 = New System.Windows.Forms.Timer(Me.components)
        Me.T3 = New System.Windows.Forms.Timer(Me.components)
        Me.Panel2 = New System.Windows.Forms.Panel()
        Me.lbVitimaSistema = New System.Windows.Forms.Label()
        Me.lbVitimaUser = New System.Windows.Forms.Label()
        Me.lbVitimaPais = New System.Windows.Forms.Label()
        Me.lbVitimaIP = New System.Windows.Forms.Label()
        Me.LbVitimaNome = New System.Windows.Forms.Label()
        Me.Panel3.SuspendLayout()
        Me.Panel2.SuspendLayout()
        Me.SuspendLayout()
        '
        'Panel3
        '
        Me.Panel3.BackColor = System.Drawing.Color.Black
        Me.Panel3.Controls.Add(Me.Label4)
        Me.Panel3.Location = New System.Drawing.Point(1, 120)
        Me.Panel3.Name = "Panel3"
        Me.Panel3.Size = New System.Drawing.Size(247, 22)
        Me.Panel3.TabIndex = 0
        '
        'Label4
        '
        Me.Label4.BackColor = System.Drawing.Color.Black
        Me.Label4.Font = New System.Drawing.Font("Calibri", 11.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label4.ForeColor = System.Drawing.Color.Yellow
        Me.Label4.Location = New System.Drawing.Point(1, 2)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(244, 18)
        Me.Label4.TabIndex = 0
        Me.Label4.Text = "VITIMA ONLINE"
        Me.Label4.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'T1
        '
        Me.T1.Enabled = True
        Me.T1.Interval = 15
        '
        'T2
        '
        Me.T2.Interval = 15
        '
        'T3
        '
        Me.T3.Interval = 5000
        '
        'Panel2
        '
        Me.Panel2.BackColor = System.Drawing.Color.Black
        Me.Panel2.Controls.Add(Me.lbVitimaSistema)
        Me.Panel2.Controls.Add(Me.lbVitimaUser)
        Me.Panel2.Controls.Add(Me.lbVitimaPais)
        Me.Panel2.Controls.Add(Me.lbVitimaIP)
        Me.Panel2.Controls.Add(Me.LbVitimaNome)
        Me.Panel2.Font = New System.Drawing.Font("Segoe UI", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Panel2.ForeColor = System.Drawing.Color.Yellow
        Me.Panel2.Location = New System.Drawing.Point(1, 145)
        Me.Panel2.Name = "Panel2"
        Me.Panel2.Size = New System.Drawing.Size(247, 109)
        Me.Panel2.TabIndex = 1
        '
        'lbVitimaSistema
        '
        Me.lbVitimaSistema.AutoSize = True
        Me.lbVitimaSistema.BackColor = System.Drawing.Color.Transparent
        Me.lbVitimaSistema.Font = New System.Drawing.Font("Calibri", 9.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lbVitimaSistema.ForeColor = System.Drawing.Color.White
        Me.lbVitimaSistema.Location = New System.Drawing.Point(3, 74)
        Me.lbVitimaSistema.Name = "lbVitimaSistema"
        Me.lbVitimaSistema.Size = New System.Drawing.Size(56, 14)
        Me.lbVitimaSistema.TabIndex = 4
        Me.lbVitimaSistema.Text = "Systema :"
        '
        'lbVitimaUser
        '
        Me.lbVitimaUser.AutoSize = True
        Me.lbVitimaUser.BackColor = System.Drawing.Color.Transparent
        Me.lbVitimaUser.Font = New System.Drawing.Font("Calibri", 9.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lbVitimaUser.ForeColor = System.Drawing.Color.White
        Me.lbVitimaUser.Location = New System.Drawing.Point(3, 42)
        Me.lbVitimaUser.Name = "lbVitimaUser"
        Me.lbVitimaUser.Size = New System.Drawing.Size(51, 14)
        Me.lbVitimaUser.TabIndex = 3
        Me.lbVitimaUser.Text = "Usuário :"
        '
        'lbVitimaPais
        '
        Me.lbVitimaPais.AutoSize = True
        Me.lbVitimaPais.BackColor = System.Drawing.Color.Transparent
        Me.lbVitimaPais.Font = New System.Drawing.Font("Calibri", 9.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lbVitimaPais.ForeColor = System.Drawing.Color.White
        Me.lbVitimaPais.Location = New System.Drawing.Point(3, 58)
        Me.lbVitimaPais.Name = "lbVitimaPais"
        Me.lbVitimaPais.Size = New System.Drawing.Size(33, 14)
        Me.lbVitimaPais.TabIndex = 2
        Me.lbVitimaPais.Text = "País :"
        '
        'lbVitimaIP
        '
        Me.lbVitimaIP.AutoSize = True
        Me.lbVitimaIP.BackColor = System.Drawing.Color.Transparent
        Me.lbVitimaIP.Font = New System.Drawing.Font("Calibri", 9.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lbVitimaIP.ForeColor = System.Drawing.Color.White
        Me.lbVitimaIP.Location = New System.Drawing.Point(3, 26)
        Me.lbVitimaIP.Name = "lbVitimaIP"
        Me.lbVitimaIP.Size = New System.Drawing.Size(22, 14)
        Me.lbVitimaIP.TabIndex = 1
        Me.lbVitimaIP.Text = "IP :"
        '
        'LbVitimaNome
        '
        Me.LbVitimaNome.AutoSize = True
        Me.LbVitimaNome.BackColor = System.Drawing.Color.Transparent
        Me.LbVitimaNome.Font = New System.Drawing.Font("Calibri", 9.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LbVitimaNome.ForeColor = System.Drawing.Color.White
        Me.LbVitimaNome.Location = New System.Drawing.Point(3, 10)
        Me.LbVitimaNome.Name = "LbVitimaNome"
        Me.LbVitimaNome.Size = New System.Drawing.Size(24, 14)
        Me.LbVitimaNome.TabIndex = 0
        Me.LbVitimaNome.Text = "ID :"
        '
        'Frm_Notificação
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.Color.Red
        Me.ClientSize = New System.Drawing.Size(249, 120)
        Me.Controls.Add(Me.Panel2)
        Me.Controls.Add(Me.Panel3)
        Me.Cursor = System.Windows.Forms.Cursors.Hand
        Me.ForeColor = System.Drawing.Color.Black
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None
        Me.MaximizeBox = False
        Me.MinimizeBox = False
        Me.Name = "Frm_Notificação"
        Me.Opacity = 0.85R
        Me.ShowIcon = False
        Me.ShowInTaskbar = False
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.TransparencyKey = System.Drawing.Color.Red
        Me.Panel3.ResumeLayout(False)
        Me.Panel2.ResumeLayout(False)
        Me.Panel2.PerformLayout()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents Panel3 As System.Windows.Forms.Panel
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents T1 As System.Windows.Forms.Timer
    Friend WithEvents T2 As System.Windows.Forms.Timer
    Friend WithEvents T3 As System.Windows.Forms.Timer
    Friend WithEvents Panel2 As System.Windows.Forms.Panel
    Friend WithEvents LbVitimaNome As System.Windows.Forms.Label
    Friend WithEvents lbVitimaUser As System.Windows.Forms.Label
    Friend WithEvents lbVitimaPais As System.Windows.Forms.Label
    Friend WithEvents lbVitimaIP As System.Windows.Forms.Label
    Friend WithEvents lbVitimaSistema As System.Windows.Forms.Label
End Class
