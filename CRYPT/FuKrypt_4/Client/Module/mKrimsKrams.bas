Attribute VB_Name = "mKrimsKrams"
Option Explicit

Private Type FILETIME
  dwLowDateTime As Long
  dwHighDateTime As Long
End Type

Private Const WAIT_OBJECT_0& = 0

Private Const INFINITE = &HFFFF
Private Const ERROR_ALREADY_EXISTS = 183&

Private Const QS_HOTKEY& = &H80
Private Const QS_KEY& = &H1
Private Const QS_MOUSEBUTTON& = &H4
Private Const QS_MOUSEMOVE& = &H2
Private Const QS_PAINT& = &H20
Private Const QS_POSTMESSAGE& = &H8
Private Const QS_SENDMESSAGE& = &H40
Private Const QS_TIMER& = &H10
Private Const QS_MOUSE& = (QS_MOUSEMOVE Or QS_MOUSEBUTTON)
Private Const QS_INPUT& = (QS_MOUSE Or QS_KEY)
Private Const QS_ALLINPUT& = (QS_SENDMESSAGE Or QS_PAINT _
              Or QS_TIMER Or QS_POSTMESSAGE Or QS_MOUSEBUTTON _
              Or QS_MOUSEMOVE Or QS_HOTKEY Or QS_KEY)

Private Declare Function CreateWaitableTimer Lib "kernel32" _
    Alias "CreateWaitableTimerA" (ByVal lpSemaphoreAttributes _
    As Long, ByVal bManualReset As Long, ByVal lpName As String) _
    As Long

Private Declare Function SetWaitableTimer Lib "kernel32" ( _
    ByVal hTimer As Long, lpDueTime As FILETIME, ByVal lPeriod _
    As Long, ByVal pfnCompletionRoutine As Long, _
    ByVal lpArgToCompletionRoutine As Long, _
    ByVal fResume As Long) As Long

Private Declare Function CloseHandle Lib "kernel32" (ByVal _
    hObject As Long) As Long

Private Declare Function MsgWaitForMultipleObjects Lib _
    "user32" (ByVal nCount As Long, pHandles As Long, ByVal _
    fWaitAll As Long, ByVal dwMilliseconds As Long, ByVal _
    dwWakeMask As Long) As Long

Public Sub Wait(lNumberOfSeconds As Long)
  Dim ft As FILETIME
  Dim lBusy As Long
  Dim lRet As Long
  Dim dblDelay As Double
  Dim dblDelayLow As Double
  Dim dblUnits As Double
  Dim hTimer As Long

  hTimer = CreateWaitableTimer(0, True, vbNullChar)

  If err.LastDllError = ERROR_ALREADY_EXISTS Then
     '
  Else
    ft.dwLowDateTime = -1
    ft.dwHighDateTime = -1
    lRet = SetWaitableTimer(hTimer, ft, 0, 0, 0, 0)
  End If

  dblUnits = CDbl(&H10000) * CDbl(&H10000)
  dblDelay = CDbl(lNumberOfSeconds) * 1000 * 10000

  ft.dwHighDateTime = -CLng(dblDelay / dblUnits) - 1
  dblDelayLow = -dblUnits * _
        (dblDelay / dblUnits - Fix(dblDelay / dblUnits))

  If dblDelayLow < CDbl(&H80000000) Then
    dblDelayLow = dblUnits + dblDelayLow
    ft.dwHighDateTime = ft.dwHighDateTime + 1
  End If

  ft.dwLowDateTime = CLng(dblDelayLow)
  lRet = SetWaitableTimer(hTimer, ft, 0, 0, 0, False)

  Do
    lBusy = MsgWaitForMultipleObjects(1, hTimer, False, _
          INFINITE, QS_ALLINPUT&)
    DoEvents
  Loop Until lBusy = WAIT_OBJECT_0

  CloseHandle hTimer
End Sub

Public Function FileExists(Path As String) As Boolean
  Const NotFile = vbDirectory Or vbVolume

  On Error Resume Next
    FileExists = (GetAttr(Path) And NotFile) = 0
  On Error GoTo 0
End Function

Public Function LoadFile(strFile As String) As String
 Dim FF As Integer
 FF = FreeFile
 
 Open strFile For Binary Access Read As #FF
  LoadFile = Space(LOF(FF))
  Get #FF, , LoadFile
 Close #FF
End Function
