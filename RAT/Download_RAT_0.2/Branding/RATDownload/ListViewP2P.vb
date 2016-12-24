Public Class ListViewP2P

    Inherits Windows.Forms.ListView

    Private Pbar As New Dictionary(Of PbarData, ProgressBar)

    Private Structure PbarData
        Dim Tag As String
        Dim Column As Integer
    End Structure

    Protected Overrides Sub OnColumnWidthChanged(ByVal e As System.Windows.Forms.ColumnWidthChangedEventArgs)
        PbarSize_changed()
    End Sub

    Protected Overrides Sub OnColumnWidthChanging(ByVal e As System.Windows.Forms.ColumnWidthChangingEventArgs)
        PbarSize_changed()
    End Sub

    Protected Overrides Sub OnColumnReordered(ByVal e As System.Windows.Forms.ColumnReorderedEventArgs)
        PbarSize_changed()
    End Sub

    Public Sub New()
        Me.DoubleBuffered = True
    End Sub

    Public Sub AddProgressBar(ByVal ProgressBarName As String, ByVal Row As Integer, ByVal Column As Integer)
        Try
            For Each P As PbarData In Pbar.Keys
                If P.Tag = ProgressBarName Then Throw New DuplicateNameException
            Next
            Dim pb As New ProgressBar
            pb.Top = Me.Items(Row).Bounds.Top
            pb.Left = Me.Items(Row).SubItems(Column).Bounds.Left
            pb.Width = Me.Columns(Column).Width
            pb.Height = Me.Items(Row).SubItems(Column).Bounds.Height
            Dim Pdata As New PbarData
            Pdata.Tag = ProgressBarName
            Pdata.Column = Column
            Me.Controls.Add(pb)
            Pbar.Add(Pdata, pb)
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

    End Sub

    Public Sub RemoveProgressBar(ByVal ProgressBarName As String)
        For Each ctrl As Control In Me.Controls
            If ctrl.Tag = ProgressBarName Then
                Me.Controls.Remove(ctrl)
                For Each F As PbarData In Pbar.Keys
                    If F.Tag = ProgressBarName Then Pbar.Remove(F)
                Next
            End If
        Next
    End Sub

    Public Sub UpdateProgressBar(ByVal ProgressBarName As String, ByVal Value As Integer)
        For Each P As PbarData In Pbar.Keys
            If ProgressBarName = P.Tag Then
                Pbar(P).Value = Value
            End If
        Next
    End Sub

    Private Sub PbarSize_changed()
        For Each P As PbarData In Pbar.Keys
            Dim X As Integer
            For i As Integer = 0 To Me.Columns.Count - 1
                If Not i = P.Column Then
                    X += Me.Columns(i).Width
                Else
                    Pbar(P).Left = X
                    Pbar(P).Width = Me.Columns(i).Width
                    Exit For
                End If
            Next
            X = 0
        Next
    End Sub

End Class