Imports Microsoft.VisualBasic
Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Drawing
Imports System.Runtime.CompilerServices
Imports System.Windows.Forms

Public Class FrmScrypt
    Inherits Form
    ' Methods
    Public Sub New()
        AddHandler MyBase.FormClosing, New FormClosingEventHandler(AddressOf Me.FrmScrypt_FormClosing)
        Me.RunAs = "vbs"
        Me.Code = ""
        Me.InitializeComponent()
    End Sub

    Public Code As String
    Public F As FrmMain
    Public RunAs As String

    Private Sub ToolStripStatusLabel2_Click(sender As Object, e As EventArgs) Handles ToolStripStatusLabel2.Click
        Me.Code = Me.TextBox1.Text
        Me.Close()
    End Sub

    Private Sub ToolStripStatusLabel1_Click(sender As Object, e As EventArgs) Handles ToolStripStatusLabel1.Click
        Dim str As String = Interaction.InputBox("ESCOLHA A ESTENÇÃO DO ARQUIVO.", "", "vbs", -1, -1)
        If (str.Length > 0) Then
            Me.RunAs = str
            Me.ToolStripStatusLabel2.Text = ("Executar Como ." & str)
        End If
    End Sub

    Private Sub FrmScrypt_FormClosing(sender As Object, e As FormClosingEventArgs) Handles Me.FormClosing

    End Sub

End Class