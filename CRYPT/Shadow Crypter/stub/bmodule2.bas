Attribute VB_Name = "bmodule2"
Public Function sayiciftmitekmi() As String
Dim a As Integer
Dim b As Integer
Dim toplam As Long

a = 5
b = 15

toplam = a + b

If toplam Mod 2 = 0 Then
sayiciftmitekmi = "cift"
Else
sayiciftmitekmi = "tek"
End If
End Function
