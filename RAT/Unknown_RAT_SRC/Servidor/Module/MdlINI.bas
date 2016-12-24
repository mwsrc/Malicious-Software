Attribute VB_Name = "MdlINI"
Option Explicit
Private Declare Function GetPrivateProfileString Lib "kernel32" Alias "GetPrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As String, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long
Private Declare Function WritePrivateProfileString Lib "kernel32" Alias "WritePrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As String, ByVal lpString As String, ByVal lpFileName As String) As Long

Private mFilename As String

Public Property Let FileName(ByVal sFilename As String)
    mFilename = sFilename
End Property

Public Property Get FileName() As String
    FileName = mFilename
End Property

Public Function ReadData(ByVal sSection As String, ByVal sKeyName As String, Optional sDefault As String = vbNullString) As String
    Dim sBufer As String * 256, lRet As Long
    lRet = GetPrivateProfileString(sSection, sKeyName, sDefault, sBufer, Len(sBufer), mFilename)
    ReadData = Left$(sBufer, lRet)
End Function

Public Function WriteData(ByVal sSection As String, ByVal sKeyName As String, ByVal sValue As String) As Boolean
      WriteData = WritePrivateProfileString(sSection, sKeyName, sValue, mFilename)
End Function

Public Function SaveFormPosAndSize(Frm As Form)
    With Frm
        If .WindowState <> vbMinimized Then
            WriteData .Name, "Left", .Left
            WriteData .Name, "Top", .Top
            WriteData .Name, "Width", .Width
            WriteData .Name, "Height", .Height
            WriteData .Name, "WindowState", .WindowState
        End If
    End With
End Function

Public Function ReadFormPosAndSize(Frm As Form)

    With Frm
    
        If ReadData(.Name, "WindowState", vbNormal) Then
            .WindowState = vbMaximized
        Else
            .Left = ReadData(.Name, "Left", .Left)
            .Top = ReadData(.Name, "Top", .Top)
            .Width = ReadData(.Name, "Width", .Width)
            .Height = ReadData(.Name, "Height", .Height)
        End If
        
    End With

End Function
