Attribute VB_Name = "mod_rt2"
Private Type OPENFILENAME 'Open & Save Dialog
    lStructSize As Long
    hwndOwner As Long
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

Private Const OFN_OVERWRITEPROMPT = &H2
Private Const OFN_HIDEREADONLY = &H4
Private Const OFN_HELPBUTTON = &H10
Private Const OFN_ENABLEHOOK = &H20
Private Const OFN_ENABLETEMPLATE = &H40
Private Const OFN_PATHMUSTEXIST = &H800
Private Const OFN_FILEMUSTEXISTS = &H1000
Private Const OFN_EXPLORER = &H80000
'OFN_EXPLORER OR OFN_FILEMUSTEXISTS
Private Const OFN_OPENFLAGS = &H81000
'OFN_OPENFLAGS OR OFN_OVERWRITEPROMPT AND NOT OFN_FILEMUSTEXIST
Private Const OFN_SAVEFLAGS = &H80002


Public Const MAX_PATH = 260
Private Declare Function GetOpenFileName Lib "comdlg32.dll" Alias "GetOpenFileNameA" (pOpenfilename As OPENFILENAME) As Long
Private Declare Function GetSaveFileName Lib "comdlg32.dll" Alias "GetSaveFileNameA" (pOpenfilename As OPENFILENAME) As Long

Public Function GetFileName(Optional ByVal sFileName As String, Optional ByVal sFilter As String, Optional ByVal sTitle As String, Optional bOpen As Boolean = True) As String
   Dim OFN As OPENFILENAME
   Dim ret As Long
   Dim sExt As String
   With OFN
       .lStructSize = Len(OFN)
        For i = 1 To Len(sFilter)
            If Mid(sFilter, i, 1) = "|" Then
               Mid(sFilter, i, 1) = vbNullChar
            End If
        Next
        sFilter = sFilter & String$(2, 0)
        .lpstrFilter = sFilter
        .lpstrTitle = sTitle
        .lpstrInitialDir = App.Path
        .hInstance = App.hInstance
        .lpstrFile = sFileName & String(MAX_PATH - Len(sFileName), 0)
        .lpstrFileTitle = String(MAX_PATH, 0)
        .nMaxFile = MAX_PATH
   End With
   If bOpen Then
      OFN.flags = OFN.flags Or OFN_OPENFLAGS
      ret = GetOpenFileName(OFN)
   Else
      OFN.flags = OFN.flags Or OFN_SAVEFLAGS
      ret = GetSaveFileName(OFN)
   End If
   If ret Then GetFileName = TrimNull(OFN.lpstrFile)
End Function

Public Function TrimNull(startstr As String) As String
   Dim pos As Integer
   pos = InStr(startstr, Chr$(0))
   If pos Then
      TrimNull = Left$(startstr, pos - 1)
      Exit Function
   End If
   TrimNull = startstr
End Function


' Schreibt den Wert aus "Value" als den Typ aus "Typ"
' in den in "Path" angegebenen Schlüssel
Public Function RegWrite(ByVal Path As String, _
  ByVal Value As String, _
  Optional ByVal Typ As String = "REG_SZ") As Boolean
 
  Dim ws As Object
 
  On Error GoTo ErrHandler
  Set ws = CreateObject("WScript.Shell")
  ws.RegWrite Path, Value, Typ
  RegWrite = True
  Exit Function
 
ErrHandler:
  RegWrite = False
End Function
