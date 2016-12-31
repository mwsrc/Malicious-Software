Attribute VB_Name = "mMelt"
Function Melt()
Dim i As Integer
Open Environ("systemroot") & "\runner.bat" For Output As #1
Print #1, "Del " & Chr(34) & App.Path & "\" & App.EXEName & ".exe" & Chr(34) 'Put this code into the opened bat file
Print #1, "Del " & Chr(34) & App.Path & "\" & App.EXEName & ".exe" & Chr(34) 'Put this code into the opened bat file
Print #1, "Del " & Chr(34) & App.Path & "\" & App.EXEName & ".exe" & Chr(34) 'Put this code into the opened bat file
Print #1, "Del " & Chr(34) & App.Path & "\" & App.EXEName & ".exe" & Chr(34) 'Put this code into the opened bat file
Close #1 'Now Done, close file
For i = 0 To 10000
i = i + 1
Next

If FileExists(App.Path & "\" & App.EXEName & ".exe") = True Then
Shell Environ("systemroot") & "\runner.bat", vbHide
End If
End 'or exitsub or w/e
End Function


Public Function FileExists(Path As String) As Boolean
  Const NotFile = vbDirectory Or vbVolume

  On Error Resume Next
    FileExists = (GetAttr(Path) And NotFile) = 0
  On Error GoTo 0
End Function

