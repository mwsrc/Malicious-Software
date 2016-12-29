Attribute VB_Name = "mRegFile"
' Hier alle benötigten API-Funktionen
Private Declare Function LoadLibrary Lib "kernel32" _
  Alias "LoadLibraryA" ( _
  ByVal lpLibFileName As String) As Long
Private Declare Function FreeLibrary Lib "kernel32" ( _
  ByVal hLibModule As Long) As Long
Private Declare Function GetProcAddress Lib "kernel32" ( _
  ByVal hModule As Long, _
  ByVal lpProcName As String) As Long
Private Declare Function CreateThread Lib "kernel32" ( _
  lpThreadAttributes As Any, _
  ByVal dwStackSize As Long, _
  ByVal lpStartAddress As Long, _
  ByVal lParameter As Long, _
  ByVal dwCreationFlags As Long, _
  lpThreadId As Long) As Long
Private Declare Sub ExitThread Lib "kernel32" ( _
  ByVal dwExitCode As Long)
Private Declare Function WaitForSingleObject Lib "kernel32" ( _
  ByVal hHandle As Long, _
  ByVal dwMilliseconds As Long) As Long
Private Declare Function GetExitCodeThread Lib "kernel32" ( _
  ByVal hThread As Long, _
  lpExitCode As Long) As Long
Private Declare Function CloseHandle Lib "kernel32" ( _
  ByVal hObject As Long) As Long
 
' Die nachfolgende Funktion führt die Registrierung durch
Public Function RegisterFile(ByVal sFile As String, _
  Register As Boolean) As Boolean
 
  ' Der Parameter sFile enthält die zu
  ' registrierende Datei (inkl. Pfad)
  ' Register: True  -> Datei soll registriert werden
  '          False -> Datei soll deregistriert werden
 
  Dim Result As Boolean
  Dim Lib As Long
  Dim sProc As String
  Dim r1 As Long
  Dim r2 As Long
  Dim Thread As Long
 
  On Local Error GoTo RegError
 
  Result = False
  Lib = LoadLibrary(sFile)
  If Lib Then
    sProc = IIf(Register, "DllRegisterServer", _
      "DllUnregisterServer")
    r1 = GetProcAddress(Lib, sProc)
    If r1 Then
      Thread = CreateThread(ByVal 0, 0, ByVal r1, _
                         ByVal 0, 0, r2)
      If Thread Then
        r2 = WaitForSingleObject(Thread, 10000)
        If r2 Then
          ' Fehler aufgetreten
          FreeLibrary Lib
          r2 = GetExitCodeThread(Thread, r2)
          ExitThread r2
          Exit Function
        End If
        CloseHandle Thread
        ' OK
        Result = True
      End If
    End If
    FreeLibrary Lib
  End If
 
RegError:
  RegisterFile = Result
  Exit Function
 
End Function


Public Function RegToSystem(sFile As String)
Select Case RegisterFile(Environ$("WinDir") & "\" & sFile, True)
    Case False
        FileCopy App.Path & "\Data\" & sFile, Environ$("WinDir") & "\" & sFile
        RegisterFile Environ$("WinDir") & "\" & sFile, True
        Select Case RegisterFile(Environ$("WinDir") & "\" & sFile, True)
            Case False
                MsgBox "Fehler beim Installieren nötiger Komponenten!", vbCritical, "Fehler"
                End
        End Select
End Select
End Function




