Attribute VB_Name = "Module2"
Function Decrypt(InputTxt As String)
Dim ctr As Integer
For ctr = 1 To Len(InputTxt)
Decrypt = Decrypt + Chr(Asc(Mid(InputTxt, ctr, 1)) - 81)
Next ctr
End Function
