Attribute VB_Name = "bmodul"
Dim deneme As String

Public Function customerinfo() As String
Dim adi As String
Dim soyadi As String
Dim aldigifiyat As String
Dim odemesekli As String
Dim odemetarihi As String

adi = "Abdullah"
soyadi = "sakir"
aldigifiyat = "50dolar"
odemesekli = "paypal"
odemetarihi = "01.10.2008"

customerinfo = adi & "_" & soyadi & "_" & aldigifiyat & "_" & odemesekli & "_" & odemetarihi

End Function


Public Function ikisayitopla(sayi1 As Integer, sayi2 As Integer) As Integer
    ikisayitopla = sayi1 + sayi2
End Function
