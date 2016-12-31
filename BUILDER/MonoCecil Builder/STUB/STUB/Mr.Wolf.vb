Module Mr
    ' coded By ʍᴙ.ώoŁƒ
    Public Host As String = "[IP/DNS]"
    Public Port As String = "[Port]"
    Public Name As String = "[Name]"
    Public SpreadExe As String = "[SpreadExe]"
    Public Spreadlnk As String = "[Spreadlnk]"
    Public SpreadP2P As String = "[SpreadP2P]"
    Public SpreadSkype As String = "[SpreadSkype]"
    Public ShortcutsInfection As String = "[SI]"

    Public Sub main()
        MsgBox(
               Host & vbNewLine _
               & Port & vbNewLine _
               & Name & vbNewLine _
               & SpreadExe & vbNewLine _
               & Spreadlnk & vbNewLine _
               & SpreadP2P & vbNewLine _
               & SpreadSkype & vbNewLine _
               & ShortcutsInfection
               )
    End Sub

End Module
