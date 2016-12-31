Attribute VB_Name = "basStringFunction"
'----------------------------------------------------------------------------------------'
'
' Multi Downloader using multithreadings
' Created by Suk Yong Kim, 03/14/2001
'
' This project is my first project to upload to the PSC.
' Many persons contribute to create this project
' I really appreicate their efforts and codes and the great server PSC.
'
' if any question, mail to : techtrans@dreamwiz.com
'----------------------------------------------------------------------------------------'

Option Explicit
Global Const CASE_SENSITIVE = 0
Global Const CASE_INSENSITIVE = 1
Global Const RETURN_FROM_FIRST = True
Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
Function InExists(ByVal Source As Variant, ByVal Target As String, _
            Optional ByVal Compare As Integer = CASE_INSENSITIVE, _
            Optional Return_pos As Long) As Boolean
    Return_pos = InStr(1, Source, Target, Compare)
    InExists = (Return_pos > 0)
End Function
Function InExistsRev(ByVal Source As Variant, ByVal Target As String, _
                Optional ByVal Compare As Integer = CASE_INSENSITIVE, _
                Optional Return_pos As Long) As Boolean
    Return_pos = InStrRev(Source, Target, -1, Compare)
    InExistsRev = (Return_pos > 0)
End Function
Function BeforeRev(ByVal Source As Variant, ByVal Target As String, _
            Optional ByVal Compare As Integer = CASE_INSENSITIVE, Optional Return_pos As Long) As Variant
    Source = CStr(Source)
    Return_pos = InStrRev(Source, Target, -1, Compare)
    If Return_pos = 0 Then
       BeforeRev = ""
    Else
       BeforeRev = Left(Source, Return_pos - 1)
    End If
End Function

Function InCount(ByVal Source As Variant, ByVal Target As String, _
                Optional ByVal Compare As Integer) As Long
    Dim Count As Long
    Do While InExists(Source, Target, Compare)
        Count = Count + 1
        Source = After(Source, Target, Compare)
    Loop
    InCount = Count
End Function

Function After(ByVal Source As Variant, ByVal Target As String, _
            Optional ByVal Compare As Integer = CASE_INSENSITIVE, _
            Optional Return_pos As Long, _
            Optional bReturnWholeSourceIfNotFound As Boolean) As Variant
    Source = CStr(Source)
    Return_pos = InStr(1, Source, Target, Compare)
    If Return_pos = 0 Then
        If bReturnWholeSourceIfNotFound Then
            After = Source
        Else
            After = ""
       End If
    Else
       After = mID(Source, Return_pos + Len(Target))
    End If
End Function

