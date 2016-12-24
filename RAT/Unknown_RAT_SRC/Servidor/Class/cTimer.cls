VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "cTimer"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' ***************************************************************************
'  NAME: cTimer
'  DESC: Multiinstanz Timer Klasse in VB6 ohne zusätzliches Modul
'  DESC: Multi inctance Timer Class in VB6 without a modul

'  DESC: VB crashes if you press the stop Button during a Timer is running
'  DESC: VB stuertzt ab, wenn Stop gedrueckt wird, solange ein Timer aktiv ist

'  DESC: Der AssemblerCode selbst macht nichts weiter, als den CallBackAufruf
'  DESC: der Windows TimerProcedure entgegenzunehmen, und mit den
'  DESC: nötigen zusätzlichen Parametern versehen, an TimerProc in cTimer
'  DESC: weiterzuleiten.

'  DESC: Unterschied der Assembler-Lösung zu einer VB-only Lösung

'  DESC: ASM : es wird für jede Instanz eine eigene TimerProc (im ASM() Array)
'  DESC:       mit einer anderen Adresse aufgerufen. Eine zusätzliche Instanzverwaltung entfällt.

'  DESC: VB-only: es wird für jede Instanz die gleiche WndProc mit der gleichen Adresse aufgerufen
'                 Dies macht eine zusätzliche Verwaltung der Timer Instanzen nötig.

' ***************************************************************************
'
'     Author : Stefan Maag
'     Create : 08.09.2004
'     Change :
'     Change :
'
'     Version: 1.0

' ===========================================================================
'  rem: Quellenangaben:
' ===========================================================================
'  rem: VB und Assembler - www.activevb.de
'  rem: MSDN Library 10/2001 - Microsoft

' ===========================================================================
'  rem: Weitere benötigte Dateien:
' ===========================================================================
'  rem:   keine

' ===========================================================================
'  Assembler-Code
' ===========================================================================
'   .486                 ;Create 32 bit code
'   .model flat, stdcall ;32 bit memory model
'   option casemap :all  ;Non Case sensitive
'
'   .code
'
'   start:
'
'   Container proc Param1 : DWORD, Param2 : DWORD, Param3 : DWORD, Param4 : DWORD
'
'   push eax             ;Pass the Pointer as last Param to the Function
'   push Param4          ;Pass all 4 specificated Params
'   push Param3          ;  "   "  "      "         "
'   push Param2          ;  "   "  "      "         "
'   push Param1          ;  "   "  "      "         "
'   push 55555555h       ;Pass the Pointer of the Class (ObjPtr) witch contains the Function being called (Patched at runtime)
'
'   mov eax,66666666h    ;Put the Pointer to the Function here
'   Call eax             ;Call the Function
'
'   ret                  ;Exit Function
'   Container endp
'
'   end start


Option Explicit

Private Declare Function SetTimer Lib "user32" (ByVal hwnd As Long, ByVal nIDEvent As Long, ByVal uElapse As Long, ByVal lpTimerFunc As Long) As Long
Private Declare Function KillTimer Lib "user32" (ByVal hwnd As Long, ByVal nIDEvent As Long) As Long
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)
Private Declare Function CallWindowProc Lib "user32.dll" Alias "CallWindowProcA" (ByVal lpPrevWndFunc As Long, ByVal hwnd As Long, ByVal Msg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long

 ' Porcedur-Nummer der WndProc in der Klasse, wird zur Adressermittlung verwendet
Private Const ProcNr_WndProc = 0

Private Const GWL_WNDPROC As Long = -4

' Private Const asmMain As String = "558BEC83C4FC8D45FC50FF7514FF7510FF750CFF75086888888888B888888888FFD08B45FCC9C21000"
Private Const asmMain As String = "558BEC50FF7514FF7510FF750CFF75086855555555B866666666FFD0C9C21000"       '          |<pCls>|  |<Proc>|"
'                                                                    |<pCls>|  |<Proc>|
Private ASM() As Byte         ' Array für AsseblerCode

Private ProcPtr As Long
Private TimerID As Long       ' the TimerID which is returnd from the Windows SetTimer Function

' ===========================================================================
'  NAME: Timer
'  DESC: Timer-Event
'  PARA(ThisTime): Time in milli seconds since Windows start
' ===========================================================================

Event Timer(ByVal ThisTime As Long)

' ProcedureNr = 0
Public Sub TimerProc(ByVal hwnd As Long, _
              ByVal uMsg As Long, _
              ByVal idEvent As Long, _
              ByVal dwTime As Long)
' ===========================================================================
'  NAME: TimerProc
'  DESC: CallBack-Function for the Timer
'  DESC: Do not call this function by yourself, it's called from the
'  DESC: Windows Timer Function
'  DESC: This function must be public because we need the Procedure-Adress
'  DESC: for the Windows Call Back.
' ===========================================================================

   RaiseEvent Timer(dwTime)
End Sub

Public Function CreateTimer(ByVal Milliseconds As Long) As Long
' ===========================================================================
'  NAME: CreateTimer
'  DESC: Creates a Timer and returns a non zero Value which is the
'  DESC: Windows-Timer-ID when succeeding
'  DESC: It is not possible to change the interval, first kill the
'  DESC: Timer and create it new
' ===========================================================================
   Dim ret As Long
   
   If TimerID = 0 Then     ' If the Timer does not exist
      ' create the Timer
      ret = SetTimer(0&, 0&, Milliseconds, ProcPtr)
      If ret <> 0 Then
         TimerID = ret
         CreateTimer = ret
      End If
   Else                    ' if the Timer already exists
      ' pass back the current TimerID
      CreateTimer = TimerID
   End If

End Function

Public Function DestroyTimer() As Long
' ===========================================================================
'  NAME: DestroyTimer
'  DESC: Destroy the current Timer an pass back a non zero value when succeeding
' ===========================================================================
   Dim ret As Long
   
   If TimerID <> 0 Then       ' If the Timer exists
      ret = KillTimer(0&, TimerID)
      If ret <> 0 Then
         TimerID = 0
      End If
   End If
End Function

Private Function GetProcPtr(ClassPtr As Long, ProcNumber As Long) As Long
' ===========================================================================
'  NAME: GetProcPtr
'  DESC: eErmittelt anhand des ObjektPointers der Instanz und der laufenden
'  DESC: Procedure-Nummer der Klasse, die StartAdresse der Procedure/Function
'  PARA(ClassPtr As Long):    ObjektPointer der Instanz der Klasse
'  PARA(ProcNumber As Long):  Laufende Nr. der Procedure/Funktion (0-basierend)
'  RETURN:  StartAdresse der Procedure/Function
' ===========================================================================
   
   Dim ptrTemp As Long
   Dim ptrProc As Long
   
   ' ptrTemp = StartAdresse der Objektdefinitions-Daten = [ClassPtr]
   CopyMemory ptrTemp, ByVal ClassPtr, 4
   
   ' Die StartAdresse der Function in ptrProc kopieren
   ' &H1C ist die OffsetAdresse für die Procedureliste
   CopyMemory ptrProc, ByVal ptrTemp + &H1C + (4 * ProcNumber), 4
   
   GetProcPtr = ptrProc
End Function

Private Function CreateASMContainer(ClassPtr As Long, ProcNumber As Long) As Long
' ===========================================================================
'  NAME: CreateASMContainer
'  DESC: ByteArray mit AssemblerCode erstellen und ClassPtr und ProcPtr
'  DESC: in den AssemblerCode eintragen
'  PARA(ClassPtr):   ObjektPointer der Instanz von clsSubclass
'  PARA(ProcNumber): ProcedureNummer der WndProc in clsSubclass
'  Return: Startadresse der AssemblerRoutine (=Adresse 1 Byte im Array)
' ===========================================================================
   
   Dim ProcPtr As Long
   
   ProcPtr = GetProcPtr(ClassPtr, ProcNumber)

   
   Dim L As Long
   Dim W As Long
   L = Len(asmMain) \ 2 - 1
   
   ReDim ASM(0 To L)
   
   For W = 0 To L
     ASM(W) = "&H" & Mid$(asmMain, W * 2 + 1, 2)
   Next
   
   CopyMemory ASM(17), ClassPtr, 4     ' Objektadresse der Instanz in AssemblerCode eintragen
   CopyMemory ASM(22), ProcPtr, 4      ' Adresse der WndProc in AssemblerCode eintragen
   
   ' StartAdresse der AssemblerRoutine als Funktionswert zurückgeben
   CreateASMContainer = VarPtr(ASM(0)) ' StartAdresse der AssemblerRoutine als Funktionswert
End Function

Private Sub Class_Initialize()
   ProcPtr = CreateASMContainer(ObjPtr(Me), ProcNr_WndProc)
End Sub

Private Sub Class_Terminate()
   DestroyTimer
End Sub
