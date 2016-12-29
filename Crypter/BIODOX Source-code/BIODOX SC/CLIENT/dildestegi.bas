Attribute VB_Name = "dildestegi"
Dim okunan As String

Public Function diliayarla()
frmana.dil.Clear
    Open App.Path & "\Language\" & frmana.languagem & ".lng" For Input As #1
        Do While Not EOF(1)
            Line Input #1, okunan
            frmana.dil.AddItem Mid(okunan, InStr(1, okunan, " = ", vbTextCompare) + 3, Len(okunan))
        Loop
    Close #1
End Function
