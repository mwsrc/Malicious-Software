Imports Microsoft.VisualBasic
Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.Collections.Generic
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Drawing
Imports System.Runtime.CompilerServices
Imports System.Windows.Forms
Imports System.Threading

Public Class Frm_Notificação
    Private inn As Integer
    Public Sub New()
        Me.inn = ((Screen.PrimaryScreen.Bounds.Height - Screen.PrimaryScreen.WorkingArea.Height) + 2)
        Me.InitializeComponent()
    End Sub

    Private Sub Panel2_Click(sender As Object, e As EventArgs) Handles Panel2.Click
        Me.Close()
    End Sub

    Private Sub T1_Tick(sender As Object, e As EventArgs) Handles T1.Tick
        Application.DoEvents()
        If (Me.Panel3.Location.Y > 0) Then
            Dim location As Point = Me.Panel3.Location
            Dim point4 As New Point(1, (location.Y - 2))
            Me.Panel3.Location = point4
            location = New Point(1, (Me.Panel2.Location.Y - 2))
            Me.Panel2.Location = location
        Else
            Me.T1.Stop()
            Me.T3.Start()
        End If
    End Sub

    Private Sub T2_Tick(sender As Object, e As EventArgs) Handles T2.Tick
        Application.DoEvents()
        If (Me.Panel3.Location.Y < &H73) Then
            Dim location As Point = Me.Panel3.Location
            Dim point4 As New Point(1, (location.Y + 2))
            Me.Panel3.Location = point4
            location = New Point(1, (Me.Panel2.Location.Y + 2))
            Me.Panel2.Location = location
        Else
            Me.T2.Stop()
            Me.Close()
        End If
    End Sub

    Private Sub T3_Tick(sender As Object, e As EventArgs) Handles T3.Tick
        Me.T2.Start()
        Me.T3.Stop()
    End Sub

    Private Sub Frm_Notificação_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Application.DoEvents()

        If Label4.Text = "LIMPEZA FINALIZADA" Then
            '     My.Computer.Audio.Play(My.Resources._0001, AudioPlayMode.Background)
        Else
            '      My.Computer.Audio.Play(My.Resources.SoN, AudioPlayMode.Background)
        End If
        Dim point2 As New Point(((Screen.PrimaryScreen.Bounds.Width - Me.Width) - 3), (((Screen.PrimaryScreen.Bounds.Height - Me.Height) - Me.inn) - 2))
        Me.Location = point2
        point2 = New Point(CInt(Math.Round(CDbl(((CDbl(Me.Width) / 2) - (CDbl(Me.Label4.Width) / 2))))), 1)
        Me.Label4.Location = point2
    End Sub
End Class