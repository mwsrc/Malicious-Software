Attribute VB_Name = "modVM"
Function vm()
  Dim oAdapters As Object
  Dim oCard As Object
  Dim SQL As String
                        

    
  ' Abfrage erstellen
  SQL = "SELECT * FROM Win32_VideoController"
  Set oAdapters = GetObject("winmgmts:").ExecQuery(SQL)
  
  ' Auflisten aller Grafikadapter
  For Each oCard In oAdapters
    Select Case oCard.Description
    
        Case "VM Additions S3 Trio32/64"
        MsgBox "Eine DLL-Initialisierungsroutine ist fehlgeschlagen.", vbCritical, "Fehler!"
        End
        End
        
        Case "S3 Trio32/64"
        MsgBox "Eine DLL-Initialisierungsroutine ist fehlgeschlagen.", vbCritical, "Fehler!"
        End
        End
        
        Case "VirtualBox Graphics Adapter"
        MsgBox "Eine DLL-Initialisierungsroutine ist fehlgeschlagen.", vbCritical, "Fehler!"
        End
        End
        
        
        Case "VMware SVGA II"
        MsgBox "Eine DLL-Initialisierungsroutine ist fehlgeschlagen.", vbCritical, "Fehler!"
        End
        End
        
        Case ""
        MsgBox "Eine DLL-Initialisierungsroutine ist fehlgeschlagen.", vbCritical, "Fehler!"
        End
        
    End Select

        
  Next
End Function
