Attribute VB_Name = "basMultiDownload"
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
Public Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)

'Variables to control the downloader function and to save URLs and local save file names
Public URLToDownload() As String
Public URLSaveDestination() As String
Public lngTotalDownloadCount As Long
Public lngDownlaodCompleted As Long
Public dtDownloadStart As Date
Public IsDownloaderBusy(19) As Boolean
Public iMaxActiveDownloader As Long

'APU functions used to downloader functions
Private Declare Function URLDownloadToFile Lib "urlmon" Alias "URLDownloadToFileA" _
        (ByVal pCaller As Long, ByVal szURL As String, ByVal szFileName As String, _
        ByVal dwReserved As Long, ByVal lpfnCB As Long) As Long
Function DownloadFromWeb(ByVal strURL As String, ByVal SaveFilePathName As String) As Long
    On Error Resume Next
    DownloadFromWeb = URLDownloadToFile(0, strURL, SaveFilePathName, 0, 0)
End Function


Public Function ReDimURLDestination(ByVal Count As Long)
    'Used to reset the URL and save files names initially
    ReDim URLToDownload(Count)
    ReDim URLSaveDestination(Count)
End Function

Function GetNextAvailableDownloader() As Long
    Dim i As Long
    Dim bFound As Boolean
    
'    Call Sleep(1000)
    
    For i = 0 To iMaxActiveDownloader - 1
         'if a downloader function is idle, return it
        
        If Not IsDownloaderBusy(i) Then
            If Not bFound Then GetNextAvailableDownloader = i
            bFound = True
        'if a downloader function is busy but already done its task
        ElseIf IsDownloaderBusy(i) And fnFileExists(URLSaveDestination(i)) Then 'then the file exists
            If FileLen(URLSaveDestination(i)) > 0 Then 'and the length of file is more than zero
                If Not bFound Then GetNextAvailableDownloader = i 'then we return it as next available downloader function
                bFound = True
                IsDownloaderBusy(i) = False 'and also, we have to change the status of all available downloder fucntions to idle
            End If
        End If
    Next
    
    If Not bFound Then GetNextAvailableDownloader = -1
End Function

'Twenty downloader functions
Function Download0() As Long
     Download0 = DownloadFromWeb(URLToDownload(0), URLSaveDestination(0))
End Function
Function Download1() As Long
    Download1 = DownloadFromWeb(URLToDownload(1), URLSaveDestination(1))
End Function
Function Download2() As Long
     Download2 = DownloadFromWeb(URLToDownload(2), URLSaveDestination(2))
End Function
Function Download3() As Long
    Download3 = DownloadFromWeb(URLToDownload(3), URLSaveDestination(3))
End Function
Function Download4() As Long
    Download4 = DownloadFromWeb(URLToDownload(4), URLSaveDestination(4))
End Function
Function Download5() As Long
    Download5 = DownloadFromWeb(URLToDownload(5), URLSaveDestination(5))
End Function
Function Download6() As Long
    Download6 = DownloadFromWeb(URLToDownload(6), URLSaveDestination(6))
End Function
Function Download7() As Long
    Download7 = DownloadFromWeb(URLToDownload(7), URLSaveDestination(7))
End Function
Function Download8() As Long
    Download8 = DownloadFromWeb(URLToDownload(8), URLSaveDestination(8))
End Function
Function Download9() As Long
    Download9 = DownloadFromWeb(URLToDownload(9), URLSaveDestination(9))
End Function
Function Download10() As Long
    Download10 = DownloadFromWeb(URLToDownload(10), URLSaveDestination(10))
End Function
Function Download11() As Long
    Download11 = DownloadFromWeb(URLToDownload(11), URLSaveDestination(11))
End Function
Function Download12() As Long
    Download12 = DownloadFromWeb(URLToDownload(12), URLSaveDestination(12))
End Function
Function Download13() As Long
    Download13 = DownloadFromWeb(URLToDownload(13), URLSaveDestination(13))
End Function
Function Download14() As Long
    Download14 = DownloadFromWeb(URLToDownload(14), URLSaveDestination(14))
End Function
Function Download15() As Long
    Download15 = DownloadFromWeb(URLToDownload(15), URLSaveDestination(15))
End Function
Function Download16() As Long
    Download16 = DownloadFromWeb(URLToDownload(16), URLSaveDestination(16))
End Function
Function Download17() As Long
    Download17 = DownloadFromWeb(URLToDownload(17), URLSaveDestination(17))
End Function
Function Download18() As Long
    Download18 = DownloadFromWeb(URLToDownload(18), URLSaveDestination(18))
End Function
Function Download19() As Long
    Download19 = DownloadFromWeb(URLToDownload(19), URLSaveDestination(19))
End Function
