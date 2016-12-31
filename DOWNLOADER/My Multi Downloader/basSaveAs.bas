Attribute VB_Name = "basSaveAs"
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

Sub frmMainFileSaveAs()
    On Error GoTo Exit_Sub
    
    With frmMain
        With .CommonDialog1
            .CancelError = True
            .DialogTitle = "File Save"
            .Filter = "Text 颇老(*.txt)|*.txt|葛电 颇老(*.*)|*.*"
            .ShowSave
        End With
        
        
        Dim filenum As Long
        Dim i As Long
        Dim response As Variant
        
        If Len(.CommonDialog1.FileName) > 0 Then
            If fnFileExists(.CommonDialog1.FileName) Then
                response = MsgBox("File exists!" & vbCr & _
                    "If you want to add text, click  [Yes]," & vbCr & _
                    "Or, if you want to overwrite, click [No].", _
                    vbYesNoCancel, "My Multi Downloader - File Save")
                Select Case response
                    Case vbYes: GoTo AppendMode
                    Case vbNo: GoTo Overwrite
                    Case Else: GoTo Exit_Sub
                End Select
            Else
                GoTo AppendMode
            End If
Overwrite:
            Call fnMoveToRecycleBin(.CommonDialog1.FileName, False, True)
AppendMode:
'            filenum = FreeFile
            Open .CommonDialog1.FileName For Append As #1
            Print #1, .txtSavePath
            For i = 0 To .listURL.ListCount - 1
                Print #1, .listURL.List(i)
            Next
Close_File:
            Close #1
        End If
Exit_Sub:
    End With
End Sub


Sub frmMainFileOpenAs(Optional ByVal sFile As String)
    On Error GoTo Exit_Sub
    If Len(sFile) Then GoTo OpenFile
    With frmMain
        With .CommonDialog1
            .CancelError = True
            .DialogTitle = "File Save"
            .Filter = "Text 颇老(*.txt)|*.txt|葛电 颇老(*.*)|*.*"
            .ShowOpen
        End With
      
        If Len(.CommonDialog1.FileName) = 0 Then Exit Sub
        sFile = .CommonDialog1.FileName
    End With
OpenFile:
    With frmMain
        .listURL.Clear
        .bDisableClickEvent = True
        Open sFile For Input As #1
        Dim strLine As String
        Dim i As Long
        Do While Not EOF(1)
            Line Input #1, strLine
            If i = 0 Then
                .txtSavePath = Trim(strLine)
            Else
                .listURL.AddItem Trim(strLine)
            End If
            i = i + 1
        Loop
Close_File:
        Close #1
        .bDisableClickEvent = False
        .ShowSatus
        .ChangeSaveFileName
Exit_Sub:
    End With
End Sub


