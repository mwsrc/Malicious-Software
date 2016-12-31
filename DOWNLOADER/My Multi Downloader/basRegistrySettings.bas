Attribute VB_Name = "basRegistrySettings"
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

Private Const ApplicationName As String = "My Multi Downloader"
Sub GetInitialRegistrySettings()
    Call GetRegFormSizeSettings
    Call GetRegSavePath
End Sub
Sub GetRegFormSizeSettings()
    Dim s As String
    With frmMain
        s = GetSetting(ApplicationName, "Position", "Left", "NULL")
        If s = "NULL" Then
          .Left = (Screen.Width - .Width) / 2
        Else
          .Left = CInt(s)
        End If
        
        s = GetSetting(ApplicationName, "Position", "Top", "NULL")
        If s = "NULL" Then
          .Top = (Screen.Height - .Height) / 2
        Else
          .Top = CInt(s)
        End If
          
        s = GetSetting(ApplicationName, "Position", "Width", "NULL")
        If s = "NULL" Then
            .Width = 9135
        Else
            .Width = CInt(s)
        End If
    
        s = GetSetting(ApplicationName, "Position", "Height", "NULL")
        If s = "NULL" Then
            .Height = 4995
        Else
            .Height = CInt(s)
        End If
    End With
End Sub

Sub SaveRegFormSizeSettings()
    With frmMain
        SaveSetting ApplicationName, "Position", "Left", .Left
        SaveSetting ApplicationName, "Position", "Top", .Top
        SaveSetting ApplicationName, "Position", "Width", .Width
        SaveSetting ApplicationName, "Position", "Height", .Height
    End With
End Sub
Sub GetRegPutMeOnTop()
    Dim s As String
    s = GetSetting(ApplicationName, "Position", "PutMeOnTop", "True")
    If s = "True" Then
       frmMain.chkOnTop.Value = vbChecked
       Call putMeOnTop(frmMain)
    Else
       frmMain.chkOnTop.Value = vbUnchecked
       Call takeMeDown(frmMain)
    End If
End Sub
Sub SaveRegPutMeOnTop()
    If frmMain.chkOnTop.Value = vbChecked Then
        SaveSetting ApplicationName, "Position", "PutMeOnTop", "True"
    Else
        SaveSetting ApplicationName, "Position", "PutMeOnTop", "False"
    End If
End Sub

Sub GetRegSavePath()
    Dim s As String
    s = GetSetting(ApplicationName, "Folder", "Save Path", "NULL")
    If s = "NULL" Then
       frmMain.txtSavePath = App.Path
    Else
        frmMain.txtSavePath = s
    End If
End Sub
Sub SaveRegSavePath(strValue As String)
    SaveSetting ApplicationName, "Folder", "Save Path", strValue
End Sub
