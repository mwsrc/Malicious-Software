Attribute VB_Name = "mGlobal"
Option Explicit
Public ib As String, sInfo As String, RC4 As New clsRC4, X0R As New clsXOR, AES As New clsAES

Public Function GetMyPath(xPath As String)
 Dim mPath As String, x As Integer
  x = Len(xPath)
  If x = 0 Then Exit Function
   mPath = Right(xPath, x - InStrRev(xPath, "\"))
 GetMyPath = mPath
End Function
