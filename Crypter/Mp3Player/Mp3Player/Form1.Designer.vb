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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(Form1))
        Me.AxWindowsMediaPlayer1 = New AxWMPLib.AxWindowsMediaPlayer
        Me.playlist = New System.Windows.Forms.ListBox
        Me.import = New System.Windows.Forms.Button
        Me.importdiag = New System.Windows.Forms.OpenFileDialog
        Me.play = New System.Windows.Forms.Button
        Me.stopbutton = New System.Windows.Forms.Button
        Me.pause = New System.Windows.Forms.Button
        CType(Me.AxWindowsMediaPlayer1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'AxWindowsMediaPlayer1
        '
        Me.AxWindowsMediaPlayer1.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
                    Or System.Windows.Forms.AnchorStyles.Left) _
                    Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.AxWindowsMediaPlayer1.Enabled = True
        Me.AxWindowsMediaPlayer1.Location = New System.Drawing.Point(-4, 213)
        Me.AxWindowsMediaPlayer1.Name = "AxWindowsMediaPlayer1"
        Me.AxWindowsMediaPlayer1.OcxState = CType(resources.GetObject("AxWindowsMediaPlayer1.OcxState"), System.Windows.Forms.AxHost.State)
        Me.AxWindowsMediaPlayer1.Size = New System.Drawing.Size(637, 44)
        Me.AxWindowsMediaPlayer1.TabIndex = 0
        '
        'playlist
        '
        Me.playlist.Anchor = CType(((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Left) _
                    Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.playlist.FormattingEnabled = True
        Me.playlist.Location = New System.Drawing.Point(-4, 34)
        Me.playlist.Name = "playlist"
        Me.playlist.Size = New System.Drawing.Size(637, 186)
        Me.playlist.TabIndex = 1
        '
        'import
        '
        Me.import.Location = New System.Drawing.Point(114, -1)
        Me.import.Name = "import"
        Me.import.Size = New System.Drawing.Size(47, 38)
        Me.import.TabIndex = 2
        Me.import.Text = "Import"
        Me.import.UseVisualStyleBackColor = True
        '
        'importdiag
        '
        Me.importdiag.FileName = "OpenFileDialog1"
        Me.importdiag.Filter = "Mp3 Music|*.mp3"
        Me.importdiag.Multiselect = True
        '
        'play
        '
        Me.play.Location = New System.Drawing.Point(-4, -1)
        Me.play.Name = "play"
        Me.play.Size = New System.Drawing.Size(43, 38)
        Me.play.TabIndex = 3
        Me.play.Text = "Play"
        Me.play.UseVisualStyleBackColor = True
        '
        'stopbutton
        '
        Me.stopbutton.Location = New System.Drawing.Point(34, -1)
        Me.stopbutton.Name = "stopbutton"
        Me.stopbutton.Size = New System.Drawing.Size(44, 38)
        Me.stopbutton.TabIndex = 4
        Me.stopbutton.Text = "Stop"
        Me.stopbutton.UseVisualStyleBackColor = True
        '
        'pause
        '
        Me.pause.Location = New System.Drawing.Point(69, -1)
        Me.pause.Name = "pause"
        Me.pause.Size = New System.Drawing.Size(52, 38)
        Me.pause.TabIndex = 5
        Me.pause.Text = "Pause"
        Me.pause.UseVisualStyleBackColor = True
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(631, 255)
        Me.Controls.Add(Me.AxWindowsMediaPlayer1)
        Me.Controls.Add(Me.pause)
        Me.Controls.Add(Me.stopbutton)
        Me.Controls.Add(Me.play)
        Me.Controls.Add(Me.import)
        Me.Controls.Add(Me.playlist)
        Me.Name = "Form1"
        Me.Text = "Form1"
        CType(Me.AxWindowsMediaPlayer1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents AxWindowsMediaPlayer1 As AxWMPLib.AxWindowsMediaPlayer
    Friend WithEvents playlist As System.Windows.Forms.ListBox
    Friend WithEvents import As System.Windows.Forms.Button
    Friend WithEvents importdiag As System.Windows.Forms.OpenFileDialog
    Friend WithEvents play As System.Windows.Forms.Button
    Friend WithEvents stopbutton As System.Windows.Forms.Button
    Friend WithEvents pause As System.Windows.Forms.Button

End Class
