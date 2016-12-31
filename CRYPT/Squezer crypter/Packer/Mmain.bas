Attribute VB_Name = "Mmain"
'This program is Coded by SqUeEzEr,
'If you use this code in your program, include my name!
'Also I'd like a little thank you;) scott_van_dinter@hotmail.com
Private Sub Main()
Dim filename As String
filename = InputBox("File to pack/crypt", "Please specify a file", "")
If FileExist(filename) = False Then
MsgBox "File does not exist!!!!", vbCritical, "ERROR"
End
End If
PackFile filename
End Sub
Private Function FileExist(filename As String) As Boolean
  On Error GoTo FileDoesNotExist
  Call FileLen(filename)
  FileExist = True
  Exit Function
FileDoesNotExist:
  FileExist = False
End Function
Public Function PackFile(file As String)
Dim Filenr As Integer
Dim FileData() As Byte
Dim buffer() As Byte
Dim EOFdata As String
Set coder = New clsHuffman
  Filenr = FreeFile
  Open file For Binary As #Filenr
  ReDim FileData(0 To LOF(Filenr) - 1)
  Get #Filenr, , FileData()
  Close #Filenr
EOFdata = Mid(StrConv(FileData, vbUnicode), GetEOF(file), FileLen(file))
Call coder.EncodeByte(FileData, UBound(FileData))
buffer = LoadResData(101, "CUSTOM")
Open App.Path & "\Crypted.exe" For Binary Access Write As #1
Put #1, , buffer
Put #1, , "<Hilde>"
Put #1, , FileData
Put #1, , "</Hilde>"
Put #1, , EOFdata
Close #1
MsgBox "Saved file as " & Chr(34) & App.Path & "\crypted.exe" & Chr(34) & vbCrLf & vbCrLf & "From: " & FileLen(file) \ 1024 & "KB" & " To: " & (UBound(buffer) + UBound(FileData) + 15) \ 1024 & "KB" & vbCrLf & vbCrLf & vbCrLf & vbCrLf & "Coded by SqUeEzEr", vbInformation, "Succes!"
End Function
