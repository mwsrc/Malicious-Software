Attribute VB_Name = "modLog"
Public Sub log(inhalt As String)
Dim LogInhalt As String
Dim zeile As String
Dim temp As String
logfile = FreeFile()



Open Environ("homedrive") & "\log.txt" For Input As logfile
Do While Not EOF(logfile)
 Line Input #logfile, zeile
 If EOF(logfile) Then
 temp = zeile
 Else
 temp = zeile & vbCrLf
 End If
 LogInhalt = LogInhalt & temp
 Loop

Close #logfile

Open Environ("homedrive") & "\log.txt" For Output As logfile
Print #logfile, LogInhalt
Print #logfile, timestamp & inhalt
Close logfile

End Sub

Public Function timestamp()
'Timestamp wird generiert
'Beispiel:
'01.01.1970 12.00.00 server
timestamp = Date & " " & Time & " " & App.EXEName & " "
End Function
