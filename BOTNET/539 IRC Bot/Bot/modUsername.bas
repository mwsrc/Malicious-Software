Attribute VB_Name = "modUsername"

Declare Function GetUserName Lib "advapi32.dll" _
  Alias "GetUserNameA" (ByVal lpBuffer As String, _
  nSize As Long) As Long


Public Function GetBenutzer() As String
'Aktuellen Benutzernamen auslesen
  Dim UserName As String
  Dim Result As Long

  UserName = Space$(256)
  Result = GetUserName(UserName, Len(UserName))

  If InStr(UserName, Chr$(0)) > 0 Then _
    UserName = Left$(UserName, InStr(UserName, Chr$(0)) - 1)
  
  GetBenutzer = UserName
End Function

