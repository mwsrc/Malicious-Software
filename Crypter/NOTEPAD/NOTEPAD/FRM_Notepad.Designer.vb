<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class FRM_Notepad
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(FRM_Notepad))
        Me.RTXT_NotepadText = New System.Windows.Forms.RichTextBox
        Me.GBOX_NotepadControls = New System.Windows.Forms.GroupBox
        Me.BTN_ClearAll = New System.Windows.Forms.Button
        Me.BTN_Open = New System.Windows.Forms.Button
        Me.BTN_Exit = New System.Windows.Forms.Button
        Me.BTN_About = New System.Windows.Forms.Button
        Me.BTN_Save = New System.Windows.Forms.Button
        Me.BTN_ChangeColour = New System.Windows.Forms.Button
        Me.BTN_Cut = New System.Windows.Forms.Button
        Me.BTN_ChangeFont = New System.Windows.Forms.Button
        Me.BTN_Copy = New System.Windows.Forms.Button
        Me.BTN_Paste = New System.Windows.Forms.Button
        Me.BTN_Redo = New System.Windows.Forms.Button
        Me.BTN_Undo = New System.Windows.Forms.Button
        Me.RTXT_FormattedNotepadText = New System.Windows.Forms.RichTextBox
        Me.TIMER_Notepad = New System.Windows.Forms.Timer(Me.components)
        Me.LBL_InputWindow = New System.Windows.Forms.Label
        Me.LBL_OutputWindow = New System.Windows.Forms.Label
        Me.Label2 = New System.Windows.Forms.Label
        Me.GBOX_NotepadControls.SuspendLayout()
        Me.SuspendLayout()
        '
        'RTXT_NotepadText
        '
        Me.RTXT_NotepadText.AutoWordSelection = True
        Me.RTXT_NotepadText.BackColor = System.Drawing.SystemColors.InactiveBorder
        Me.RTXT_NotepadText.Font = New System.Drawing.Font("Segoe UI", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.RTXT_NotepadText.Location = New System.Drawing.Point(0, 66)
        Me.RTXT_NotepadText.Name = "RTXT_NotepadText"
        Me.RTXT_NotepadText.Size = New System.Drawing.Size(838, 282)
        Me.RTXT_NotepadText.TabIndex = 1
        Me.RTXT_NotepadText.Text = ""
        '
        'GBOX_NotepadControls
        '
        Me.GBOX_NotepadControls.BackColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(192, Byte), Integer), CType(CType(192, Byte), Integer))
        Me.GBOX_NotepadControls.Controls.Add(Me.BTN_ClearAll)
        Me.GBOX_NotepadControls.Controls.Add(Me.BTN_Open)
        Me.GBOX_NotepadControls.Controls.Add(Me.BTN_Exit)
        Me.GBOX_NotepadControls.Controls.Add(Me.BTN_About)
        Me.GBOX_NotepadControls.Controls.Add(Me.BTN_Save)
        Me.GBOX_NotepadControls.Controls.Add(Me.BTN_ChangeColour)
        Me.GBOX_NotepadControls.Controls.Add(Me.BTN_Cut)
        Me.GBOX_NotepadControls.Controls.Add(Me.BTN_ChangeFont)
        Me.GBOX_NotepadControls.Controls.Add(Me.BTN_Copy)
        Me.GBOX_NotepadControls.Controls.Add(Me.BTN_Paste)
        Me.GBOX_NotepadControls.Controls.Add(Me.BTN_Redo)
        Me.GBOX_NotepadControls.Controls.Add(Me.BTN_Undo)
        Me.GBOX_NotepadControls.Location = New System.Drawing.Point(844, -3)
        Me.GBOX_NotepadControls.Name = "GBOX_NotepadControls"
        Me.GBOX_NotepadControls.Size = New System.Drawing.Size(170, 740)
        Me.GBOX_NotepadControls.TabIndex = 14
        Me.GBOX_NotepadControls.TabStop = False
        '
        'BTN_ClearAll
        '
        Me.BTN_ClearAll.BackgroundImage = CType(resources.GetObject("BTN_ClearAll.BackgroundImage"), System.Drawing.Image)
        Me.BTN_ClearAll.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None
        Me.BTN_ClearAll.Font = New System.Drawing.Font("Segoe Condensed", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.BTN_ClearAll.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.BTN_ClearAll.Location = New System.Drawing.Point(15, 564)
        Me.BTN_ClearAll.Name = "BTN_ClearAll"
        Me.BTN_ClearAll.Size = New System.Drawing.Size(149, 41)
        Me.BTN_ClearAll.TabIndex = 13
        Me.BTN_ClearAll.Text = "CLEAR ALL"
        Me.BTN_ClearAll.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        Me.BTN_ClearAll.UseVisualStyleBackColor = True
        '
        'BTN_Open
        '
        Me.BTN_Open.BackgroundImage = Global.NOTEPAD.My.Resources.Resources.icontexto_webdev_arrow_down_032x032
        Me.BTN_Open.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None
        Me.BTN_Open.Font = New System.Drawing.Font("Segoe Condensed", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.BTN_Open.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.BTN_Open.Location = New System.Drawing.Point(15, 94)
        Me.BTN_Open.Name = "BTN_Open"
        Me.BTN_Open.Size = New System.Drawing.Size(149, 41)
        Me.BTN_Open.TabIndex = 2
        Me.BTN_Open.Text = "OPEN"
        Me.BTN_Open.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        Me.BTN_Open.UseVisualStyleBackColor = True
        '
        'BTN_Exit
        '
        Me.BTN_Exit.BackgroundImage = Global.NOTEPAD.My.Resources.Resources.icontexto_webdev_remove_032x032
        Me.BTN_Exit.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None
        Me.BTN_Exit.Font = New System.Drawing.Font("Segoe Condensed", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.BTN_Exit.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.BTN_Exit.Location = New System.Drawing.Point(15, 611)
        Me.BTN_Exit.Name = "BTN_Exit"
        Me.BTN_Exit.Size = New System.Drawing.Size(149, 41)
        Me.BTN_Exit.TabIndex = 15
        Me.BTN_Exit.Text = "EXIT"
        Me.BTN_Exit.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        Me.BTN_Exit.UseVisualStyleBackColor = True
        '
        'BTN_About
        '
        Me.BTN_About.BackgroundImage = Global.NOTEPAD.My.Resources.Resources.icontexto_webdev_about_032x032
        Me.BTN_About.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None
        Me.BTN_About.Font = New System.Drawing.Font("Segoe Condensed", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.BTN_About.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.BTN_About.Location = New System.Drawing.Point(15, 517)
        Me.BTN_About.Name = "BTN_About"
        Me.BTN_About.Size = New System.Drawing.Size(149, 41)
        Me.BTN_About.TabIndex = 12
        Me.BTN_About.Text = "ABOUT"
        Me.BTN_About.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        Me.BTN_About.UseVisualStyleBackColor = True
        '
        'BTN_Save
        '
        Me.BTN_Save.BackgroundImage = Global.NOTEPAD.My.Resources.Resources.icontexto_webdev_print_032x032
        Me.BTN_Save.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None
        Me.BTN_Save.Font = New System.Drawing.Font("Segoe Condensed", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.BTN_Save.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.BTN_Save.Location = New System.Drawing.Point(15, 141)
        Me.BTN_Save.Name = "BTN_Save"
        Me.BTN_Save.Size = New System.Drawing.Size(149, 41)
        Me.BTN_Save.TabIndex = 3
        Me.BTN_Save.Text = "SAVE"
        Me.BTN_Save.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        Me.BTN_Save.UseVisualStyleBackColor = True
        '
        'BTN_ChangeColour
        '
        Me.BTN_ChangeColour.BackgroundImage = Global.NOTEPAD.My.Resources.Resources.icontexto_webdev_rss_feed_032x032
        Me.BTN_ChangeColour.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None
        Me.BTN_ChangeColour.Font = New System.Drawing.Font("Segoe Condensed", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.BTN_ChangeColour.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.BTN_ChangeColour.Location = New System.Drawing.Point(15, 470)
        Me.BTN_ChangeColour.Name = "BTN_ChangeColour"
        Me.BTN_ChangeColour.Size = New System.Drawing.Size(149, 41)
        Me.BTN_ChangeColour.TabIndex = 11
        Me.BTN_ChangeColour.Text = "COLOUR"
        Me.BTN_ChangeColour.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        Me.BTN_ChangeColour.UseVisualStyleBackColor = True
        '
        'BTN_Cut
        '
        Me.BTN_Cut.BackgroundImage = CType(resources.GetObject("BTN_Cut.BackgroundImage"), System.Drawing.Image)
        Me.BTN_Cut.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None
        Me.BTN_Cut.Font = New System.Drawing.Font("Segoe Condensed", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.BTN_Cut.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.BTN_Cut.Location = New System.Drawing.Point(15, 188)
        Me.BTN_Cut.Name = "BTN_Cut"
        Me.BTN_Cut.Size = New System.Drawing.Size(149, 41)
        Me.BTN_Cut.TabIndex = 4
        Me.BTN_Cut.Text = "CUT"
        Me.BTN_Cut.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        Me.BTN_Cut.UseVisualStyleBackColor = True
        '
        'BTN_ChangeFont
        '
        Me.BTN_ChangeFont.BackgroundImage = Global.NOTEPAD.My.Resources.Resources.icontexto_webdev_favorites_032x032
        Me.BTN_ChangeFont.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None
        Me.BTN_ChangeFont.Font = New System.Drawing.Font("Segoe Condensed", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.BTN_ChangeFont.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.BTN_ChangeFont.Location = New System.Drawing.Point(15, 423)
        Me.BTN_ChangeFont.Name = "BTN_ChangeFont"
        Me.BTN_ChangeFont.Size = New System.Drawing.Size(149, 41)
        Me.BTN_ChangeFont.TabIndex = 10
        Me.BTN_ChangeFont.Text = "FONT"
        Me.BTN_ChangeFont.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        Me.BTN_ChangeFont.UseVisualStyleBackColor = True
        '
        'BTN_Copy
        '
        Me.BTN_Copy.BackgroundImage = Global.NOTEPAD.My.Resources.Resources.icontexto_webdev_arrow_right_032x032
        Me.BTN_Copy.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None
        Me.BTN_Copy.Font = New System.Drawing.Font("Segoe Condensed", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.BTN_Copy.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.BTN_Copy.Location = New System.Drawing.Point(15, 235)
        Me.BTN_Copy.Name = "BTN_Copy"
        Me.BTN_Copy.Size = New System.Drawing.Size(149, 41)
        Me.BTN_Copy.TabIndex = 5
        Me.BTN_Copy.Text = "COPY"
        Me.BTN_Copy.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        Me.BTN_Copy.UseVisualStyleBackColor = True
        '
        'BTN_Paste
        '
        Me.BTN_Paste.BackgroundImage = Global.NOTEPAD.My.Resources.Resources.icontexto_webdev_file_032x0321
        Me.BTN_Paste.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None
        Me.BTN_Paste.Font = New System.Drawing.Font("Segoe Condensed", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.BTN_Paste.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.BTN_Paste.Location = New System.Drawing.Point(15, 282)
        Me.BTN_Paste.Name = "BTN_Paste"
        Me.BTN_Paste.Size = New System.Drawing.Size(149, 41)
        Me.BTN_Paste.TabIndex = 6
        Me.BTN_Paste.Text = "PASTE"
        Me.BTN_Paste.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        Me.BTN_Paste.UseVisualStyleBackColor = True
        '
        'BTN_Redo
        '
        Me.BTN_Redo.BackgroundImage = Global.NOTEPAD.My.Resources.Resources.icontexto_webdev_bullet_032x0321
        Me.BTN_Redo.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None
        Me.BTN_Redo.Font = New System.Drawing.Font("Segoe Condensed", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.BTN_Redo.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.BTN_Redo.Location = New System.Drawing.Point(15, 376)
        Me.BTN_Redo.Name = "BTN_Redo"
        Me.BTN_Redo.Size = New System.Drawing.Size(149, 41)
        Me.BTN_Redo.TabIndex = 8
        Me.BTN_Redo.Text = "REDO"
        Me.BTN_Redo.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        Me.BTN_Redo.UseVisualStyleBackColor = True
        '
        'BTN_Undo
        '
        Me.BTN_Undo.BackgroundImage = Global.NOTEPAD.My.Resources.Resources.icontexto_webdev_reload_032x032
        Me.BTN_Undo.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None
        Me.BTN_Undo.Font = New System.Drawing.Font("Segoe Condensed", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.BTN_Undo.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.BTN_Undo.Location = New System.Drawing.Point(15, 329)
        Me.BTN_Undo.Name = "BTN_Undo"
        Me.BTN_Undo.Size = New System.Drawing.Size(149, 41)
        Me.BTN_Undo.TabIndex = 7
        Me.BTN_Undo.Text = "UNDO"
        Me.BTN_Undo.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        Me.BTN_Undo.UseVisualStyleBackColor = True
        '
        'RTXT_FormattedNotepadText
        '
        Me.RTXT_FormattedNotepadText.Enabled = False
        Me.RTXT_FormattedNotepadText.Font = New System.Drawing.Font("Segoe UI", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.RTXT_FormattedNotepadText.Location = New System.Drawing.Point(0, 455)
        Me.RTXT_FormattedNotepadText.Name = "RTXT_FormattedNotepadText"
        Me.RTXT_FormattedNotepadText.ReadOnly = True
        Me.RTXT_FormattedNotepadText.Size = New System.Drawing.Size(838, 282)
        Me.RTXT_FormattedNotepadText.TabIndex = 15
        Me.RTXT_FormattedNotepadText.Text = ""
        '
        'TIMER_Notepad
        '
        Me.TIMER_Notepad.Enabled = True
        Me.TIMER_Notepad.Interval = 250
        '
        'LBL_InputWindow
        '
        Me.LBL_InputWindow.BackColor = System.Drawing.Color.FromArgb(CType(CType(128, Byte), Integer), CType(CType(128, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.LBL_InputWindow.Font = New System.Drawing.Font("Consolas", 15.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LBL_InputWindow.Location = New System.Drawing.Point(3, 9)
        Me.LBL_InputWindow.Name = "LBL_InputWindow"
        Me.LBL_InputWindow.Size = New System.Drawing.Size(172, 41)
        Me.LBL_InputWindow.TabIndex = 16
        Me.LBL_InputWindow.Text = "INPUT WINDOW"
        Me.LBL_InputWindow.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'LBL_OutputWindow
        '
        Me.LBL_OutputWindow.BackColor = System.Drawing.Color.FromArgb(CType(CType(128, Byte), Integer), CType(CType(128, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.LBL_OutputWindow.Font = New System.Drawing.Font("Consolas", 15.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LBL_OutputWindow.Location = New System.Drawing.Point(3, 395)
        Me.LBL_OutputWindow.Name = "LBL_OutputWindow"
        Me.LBL_OutputWindow.Size = New System.Drawing.Size(172, 44)
        Me.LBL_OutputWindow.TabIndex = 17
        Me.LBL_OutputWindow.Text = "OUTPUT WINDOW"
        Me.LBL_OutputWindow.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'Label2
        '
        Me.Label2.BackColor = System.Drawing.Color.Black
        Me.Label2.Font = New System.Drawing.Font("Consolas", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label2.ForeColor = System.Drawing.Color.Green
        Me.Label2.Location = New System.Drawing.Point(580, 3)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(258, 60)
        Me.Label2.TabIndex = 18
        Me.Label2.Text = "CREATED BY: SAAD QURESHI" & Global.Microsoft.VisualBasic.ChrW(13) & Global.Microsoft.VisualBasic.ChrW(10) & "veracious2007@gmail.com" & Global.Microsoft.VisualBasic.ChrW(13) & Global.Microsoft.VisualBasic.ChrW(10) & "00923428042326"
        '
        'FRM_Notepad
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.Color.FromArgb(CType(CType(192, Byte), Integer), CType(CType(192, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.ClientSize = New System.Drawing.Size(1016, 740)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.LBL_OutputWindow)
        Me.Controls.Add(Me.LBL_InputWindow)
        Me.Controls.Add(Me.RTXT_FormattedNotepadText)
        Me.Controls.Add(Me.GBOX_NotepadControls)
        Me.Controls.Add(Me.RTXT_NotepadText)
        Me.Name = "FRM_Notepad"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "NOTEPAD"
        Me.WindowState = System.Windows.Forms.FormWindowState.Maximized
        Me.GBOX_NotepadControls.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents RTXT_NotepadText As System.Windows.Forms.RichTextBox
    Friend WithEvents BTN_Open As System.Windows.Forms.Button
    Friend WithEvents BTN_Save As System.Windows.Forms.Button
    Friend WithEvents BTN_Exit As System.Windows.Forms.Button
    Friend WithEvents BTN_Paste As System.Windows.Forms.Button
    Friend WithEvents BTN_Copy As System.Windows.Forms.Button
    Friend WithEvents BTN_Cut As System.Windows.Forms.Button
    Friend WithEvents BTN_Redo As System.Windows.Forms.Button
    Friend WithEvents BTN_Undo As System.Windows.Forms.Button
    Friend WithEvents BTN_ChangeFont As System.Windows.Forms.Button
    Friend WithEvents BTN_ChangeColour As System.Windows.Forms.Button
    Friend WithEvents BTN_About As System.Windows.Forms.Button
    Friend WithEvents GBOX_NotepadControls As System.Windows.Forms.GroupBox
    Friend WithEvents RTXT_FormattedNotepadText As System.Windows.Forms.RichTextBox
    Friend WithEvents BTN_ClearAll As System.Windows.Forms.Button
    Friend WithEvents TIMER_Notepad As System.Windows.Forms.Timer
    Friend WithEvents LBL_InputWindow As System.Windows.Forms.Label
    Friend WithEvents LBL_OutputWindow As System.Windows.Forms.Label
    Private WithEvents Label2 As System.Windows.Forms.Label

End Class
