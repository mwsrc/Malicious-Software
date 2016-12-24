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
        Me.components = New System.ComponentModel.Container()
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(Form1))
        Me.Timer1 = New System.Windows.Forms.Timer(Me.components)
        Me.BitdefenderForm1 = New s7cry.BitdefenderForm()
        Me.Label4 = New System.Windows.Forms.Label()
        Me.BitdefenderButton4 = New s7cry.BitdefenderButton()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.BitdefenderButton3 = New s7cry.BitdefenderButton()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.BitdefenderButton2 = New s7cry.BitdefenderButton()
        Me.TextBox1 = New System.Windows.Forms.TextBox()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.BitdefenderButton1 = New s7cry.BitdefenderButton()
        Me.BitdefenderSeparator1 = New s7cry.BitdefenderSeparator()
        Me.BitdefenderForm1.SuspendLayout()
        Me.SuspendLayout()
        '
        'Timer1
        '
        Me.Timer1.Interval = 1000
        '
        'BitdefenderForm1
        '
        Me.BitdefenderForm1.BackColor = System.Drawing.Color.Fuchsia
        Me.BitdefenderForm1.Controls.Add(Me.Label4)
        Me.BitdefenderForm1.Controls.Add(Me.BitdefenderButton4)
        Me.BitdefenderForm1.Controls.Add(Me.Label3)
        Me.BitdefenderForm1.Controls.Add(Me.BitdefenderButton3)
        Me.BitdefenderForm1.Controls.Add(Me.Label2)
        Me.BitdefenderForm1.Controls.Add(Me.BitdefenderButton2)
        Me.BitdefenderForm1.Controls.Add(Me.TextBox1)
        Me.BitdefenderForm1.Controls.Add(Me.Label1)
        Me.BitdefenderForm1.Controls.Add(Me.BitdefenderButton1)
        Me.BitdefenderForm1.Controls.Add(Me.BitdefenderSeparator1)
        Me.BitdefenderForm1.DisableControlboxClose = False
        Me.BitdefenderForm1.DisableControlboxMax = True
        Me.BitdefenderForm1.DisableControlboxMin = False
        Me.BitdefenderForm1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.BitdefenderForm1.Font = New System.Drawing.Font("Tahoma", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.BitdefenderForm1.Location = New System.Drawing.Point(0, 0)
        Me.BitdefenderForm1.Name = "BitdefenderForm1"
        Me.BitdefenderForm1.Size = New System.Drawing.Size(654, 206)
        Me.BitdefenderForm1.TabIndex = 0
        Me.BitdefenderForm1.Text = "Delta Crypter V2 - Sub-7.net"
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.BackColor = System.Drawing.Color.Transparent
        Me.Label4.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label4.ForeColor = System.Drawing.Color.White
        Me.Label4.Location = New System.Drawing.Point(91, 95)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(225, 16)
        Me.Label4.TabIndex = 9
        Me.Label4.Text = "No icon selected. Default will be used."
        '
        'BitdefenderButton4
        '
        Me.BitdefenderButton4.BackColor = System.Drawing.Color.Transparent
        Me.BitdefenderButton4.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.BitdefenderButton4.Location = New System.Drawing.Point(585, 85)
        Me.BitdefenderButton4.Name = "BitdefenderButton4"
        Me.BitdefenderButton4.Size = New System.Drawing.Size(49, 36)
        Me.BitdefenderButton4.TabIndex = 8
        Me.BitdefenderButton4.Text = "..."
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.BackColor = System.Drawing.Color.Transparent
        Me.Label3.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label3.ForeColor = System.Drawing.Color.White
        Me.Label3.Location = New System.Drawing.Point(40, 95)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(37, 16)
        Me.Label3.TabIndex = 7
        Me.Label3.Text = "Icon:"
        '
        'BitdefenderButton3
        '
        Me.BitdefenderButton3.BackColor = System.Drawing.Color.Transparent
        Me.BitdefenderButton3.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.BitdefenderButton3.Location = New System.Drawing.Point(22, 137)
        Me.BitdefenderButton3.Name = "BitdefenderButton3"
        Me.BitdefenderButton3.Size = New System.Drawing.Size(89, 36)
        Me.BitdefenderButton3.TabIndex = 6
        Me.BitdefenderButton3.Text = "About"
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.BackColor = System.Drawing.Color.Transparent
        Me.Label2.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label2.ForeColor = System.Drawing.Color.White
        Me.Label2.Location = New System.Drawing.Point(120, 147)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(236, 16)
        Me.Label2.TabIndex = 5
        Me.Label2.Text = "Status: Waiting for you to select a file..."
        '
        'BitdefenderButton2
        '
        Me.BitdefenderButton2.BackColor = System.Drawing.Color.Transparent
        Me.BitdefenderButton2.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.BitdefenderButton2.Location = New System.Drawing.Point(585, 52)
        Me.BitdefenderButton2.Name = "BitdefenderButton2"
        Me.BitdefenderButton2.Size = New System.Drawing.Size(49, 36)
        Me.BitdefenderButton2.TabIndex = 4
        Me.BitdefenderButton2.Text = "..."
        '
        'TextBox1
        '
        Me.TextBox1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.TextBox1.Cursor = System.Windows.Forms.Cursors.IBeam
        Me.TextBox1.Location = New System.Drawing.Point(94, 60)
        Me.TextBox1.Name = "TextBox1"
        Me.TextBox1.ReadOnly = True
        Me.TextBox1.Size = New System.Drawing.Size(485, 21)
        Me.TextBox1.TabIndex = 3
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.BackColor = System.Drawing.Color.Transparent
        Me.Label1.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.ForeColor = System.Drawing.Color.White
        Me.Label1.Location = New System.Drawing.Point(40, 62)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(33, 16)
        Me.Label1.TabIndex = 2
        Me.Label1.Text = "File:"
        '
        'BitdefenderButton1
        '
        Me.BitdefenderButton1.BackColor = System.Drawing.Color.Transparent
        Me.BitdefenderButton1.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.BitdefenderButton1.Location = New System.Drawing.Point(545, 137)
        Me.BitdefenderButton1.Name = "BitdefenderButton1"
        Me.BitdefenderButton1.Size = New System.Drawing.Size(89, 36)
        Me.BitdefenderButton1.TabIndex = 1
        Me.BitdefenderButton1.Text = "Crpyt"
        '
        'BitdefenderSeparator1
        '
        Me.BitdefenderSeparator1.BackColor = System.Drawing.Color.Transparent
        Me.BitdefenderSeparator1.Location = New System.Drawing.Point(45, 131)
        Me.BitdefenderSeparator1.Name = "BitdefenderSeparator1"
        Me.BitdefenderSeparator1.Size = New System.Drawing.Size(568, 10)
        Me.BitdefenderSeparator1.TabIndex = 0
        Me.BitdefenderSeparator1.Text = "BitdefenderSeparator1"
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(654, 206)
        Me.Controls.Add(Me.BitdefenderForm1)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.MaximizeBox = False
        Me.Name = "Form1"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Delta Cryptor V2 - Sub-7.net"
        Me.TransparencyKey = System.Drawing.Color.Fuchsia
        Me.BitdefenderForm1.ResumeLayout(false)
        Me.BitdefenderForm1.PerformLayout
        Me.ResumeLayout(false)

End Sub
    Friend WithEvents BitdefenderForm1 As s7cry.BitdefenderForm
    Friend WithEvents BitdefenderSeparator1 As s7cry.BitdefenderSeparator
    Friend WithEvents BitdefenderButton1 As s7cry.BitdefenderButton
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents TextBox1 As System.Windows.Forms.TextBox
    Friend WithEvents BitdefenderButton2 As s7cry.BitdefenderButton
    Friend WithEvents BitdefenderButton3 As s7cry.BitdefenderButton
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents BitdefenderButton4 As s7cry.BitdefenderButton
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents Timer1 As System.Windows.Forms.Timer

End Class
