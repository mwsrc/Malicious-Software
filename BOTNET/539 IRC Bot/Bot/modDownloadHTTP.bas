Attribute VB_Name = "modDownloadHTTP"
Private Declare Function URLDownloadToFile Lib "urlmon" Alias _
    "URLDownloadToFileA" (ByVal pCaller As Long, ByVal szURL As String, _
    ByVal szFileName As String, ByVal dwReserved As Long, _
    ByVal lpfnCB As Long) As Long

Public Function DownIT(url As String, locAlfilename As String)


Dim errcode As Long



errcode = URLDownloadToFile(0, url, locAlfilename, 0, 0)


End Function
