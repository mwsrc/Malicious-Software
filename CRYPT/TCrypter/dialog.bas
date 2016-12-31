Attribute VB_Name = "Dialog"
Option Explicit

Private Declare Function GetSaveFileName Lib "COMDLG32.DLL" Alias "GetSaveFileNameA" (pOpenfilename As OPENFILENAME) As Long
Private Declare Function GetOpenFileName Lib "COMDLG32.DLL" Alias "GetOpenFileNameA" (pOpenfilename As OPENFILENAME) As Long
Private strFileName As OPENFILENAME

Private Type OPENFILENAME
    lStructSize As Long
    hWndOwner As Long
    hInstance As Long
    lpstrFilter As String
    lpstrCustomFilter As String
    nMaxCustFilter As Long
    nFilterIndex As Long
    lpstrFile As String
    nMaxFile As Long
    lpstrFileTitle As String
    nMaxFileTitle As Long
    lpstrInitialDir As String
    lpstrTitle As String
    flags As Long
    nFileOffset As Integer
    nFileExtension As Integer
    lpstrDefExt As String
    lCustData As Long
    lpfnHook As Long
    lpTemplateName As String
End Type

Private Sub DialogFilter(WantedFilter As String)
    On Error GoTo DialogFilter_Err
    Dim intLoopCount As Integer
    strFileName.lpstrFilter = ""

    For intLoopCount = 1 To Len(WantedFilter)
        If Mid$(WantedFilter, intLoopCount, 1) = "|" Then strFileName.lpstrFilter = _
        strFileName.lpstrFilter + Chr$(0) Else strFileName.lpstrFilter = _
        strFileName.lpstrFilter + Mid$(WantedFilter, intLoopCount, 1)
    Next intLoopCount
    strFileName.lpstrFilter = strFileName.lpstrFilter + Chr$(0)
    Exit Sub

DialogFilter_Err:
    MsgBox Err.Description & vbCrLf & _
           " " & "at line " & Erl
    Resume Next
End Sub

Public Function OpenCommonDialog(Optional strDialogTitle As String = "Open", Optional strFilter As String = "All Files|*.*", Optional strDefaultExtention As String = "*.*") As String
    On Error GoTo OpenCommonDialog_Err
    Dim lngReturnValue As Long
    Dim intRest As Integer
    Dim i As Long
    strFileName.lpstrTitle = strDialogTitle
    strFileName.lpstrDefExt = strDefaultExtention
    DialogFilter (strFilter)
    strFileName.hInstance = App.hInstance
    strFileName.lpstrFile = Chr$(0) & Space$(259)
    strFileName.nMaxFile = 260
    strFileName.flags = &H4
    strFileName.lStructSize = Len(strFileName)
    lngReturnValue = GetOpenFileName(strFileName)
    strFileName.lpstrFile = Trim$(strFileName.lpstrFile)
    i = Len(strFileName.lpstrFile)
    If i <> 1 Then
        OpenCommonDialog = Trim$(strFileName.lpstrFile)
    Else
        OpenCommonDialog = ""
    End If
    Exit Function

OpenCommonDialog_Err:
    MsgBox Err.Description
    Resume Next
End Function

Public Function GetFileNametoSave(strFilter As String, strDefaultExtention As String, Optional strDialogTitle As String = "Save") As String
    On Error GoTo GetFileNametoSave_Err
    Dim lngReturnValue As Long
    Dim intRest As Integer
    strFileName.lpstrTitle = strDialogTitle
    strFileName.lpstrDefExt = strDefaultExtention
    DialogFilter (strFilter)
    strFileName.hInstance = App.hInstance
    strFileName.lpstrFile = Chr$(0) & Space$(259)
    strFileName.nMaxFile = 260
    strFileName.flags = &H80000 Or &H4
    strFileName.lStructSize = Len(strFileName)
    lngReturnValue = GetSaveFileName(strFileName)
    GetFileNametoSave = strFileName.lpstrFile
    Exit Function

GetFileNametoSave_Err:
   MsgBox Err.Description

End Function

        






