Attribute VB_Name = "mod_Download"
Public Declare Function GetTickCount Lib "kernel32" () As Long

Public Function GetFilename(strUrl As String) As String
    Dim I As Integer
    I = InStrRev(strUrl, "/")
    GetFilename = Mid(strUrl, I + 1)
End Function

Public Function ParseUrl(ByVal strUrl As String, _
                          ByRef strHost As String, _
                          ByRef strPort As String, _
                          ByRef strRequest As String)
    Dim I As Integer
    Dim X As Integer
    Dim strSub As String
    
    If LCase(Left(strUrl, Len("http://"))) = "http://" Then
        'http:// exists?
        strUrl = Mid(strUrl, Len("http://") + 1)
    End If
    
    If LCase(Left(strUrl, Len("www."))) = "www." Then
        'www. exists?
        strUrl = Mid(strUrl, Len("www.") + 1)
    End If
    
    I = InStr(strUrl, "/")
    If Not I = 0 Then
        strRequest = Mid(strUrl, I)
        strSub = Left(strUrl, I - 1)
        I = InStr(strSub, ":")
        If Not I = 0 Then
            strPort = Mid(strSub, I + 1)
            strHost = Left(strSub, I - 1)
        Else
            strPort = 80
            strHost = strSub
        End If
    Else
        strRequest = "/"
        I = InStr(strUrl, ":")
        If Not I = 0 Then
            strPort = Mid(strUrl, I + 1)
            strHost = Left(strUrl, I - 1)
        Else
            strPort = 80
            strHost = strUrl
        End If
    End If
End Function

Public Function SizeCalc(Size As Long) As String
    Dim SizeArray(3) As String
    Dim Prefix As Integer
    Dim strSize As String
    
    Prefix = Int(Log(Size) / Log(1024))
    SizeArray(0) = "B"
    SizeArray(1) = "KB"
    SizeArray(2) = "MB"
    SizeArray(3) = "GB"
    strSize = Str(Round(Size / (1024 ^ Prefix), 2)) & " " & SizeArray(Prefix)
    strPrefix = SizeArray(Prefix)
    SizeCalc = LTrim(RTrim(strSize))
End Function

Function FileExists(File As String) As Boolean
   On Error Resume Next
   FileExists = False
   FileExists = Dir(File) <> ""
End Function
