Attribute VB_Name = "Module1"
Public Function ReadIniValue(INIpath As String, Key As String, Variable As String) As String
Dim NF As Integer
Dim Temp As String
Dim LcaseTemp As String
Dim ReadyToRead As Boolean
    
AssignVariables:
NF = FreeFile
ReadIniValue = ""
Key = "[" & LCase$(Key) & "]"
Variable = LCase$(Variable)
EnsureFileExists:
Open INIpath For Binary As NF
Close NF
SetAttr INIpath, vbArchive
LoadFile:
Open INIpath For Input As NF
While Not EOF(NF)
Line Input #NF, Temp
LcaseTemp = LCase$(Temp)
If InStr(LcaseTemp, "[") <> 0 Then ReadyToRead = False
If LcaseTemp = Key Then ReadyToRead = True
If InStr(LcaseTemp, "[") = 0 And ReadyToRead = True Then
If InStr(LcaseTemp, Variable & "=") = 1 Then
ReadIniValue = Mid$(Temp, 1 + Len(Variable & "="))
Close NF: Exit Function
End If
End If
Wend
Close NF
End Function
