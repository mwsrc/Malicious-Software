Attribute VB_Name = "AES_mod"

'##############################################################
'#Automated encryption code                     #
'#by Karcrack Project Crypter v2.1 [KPC]                  #
'#Program consisting of Karcrack                        #
'#Details of the encryption:                            #
'#	+ Encriptacion  :RC4                                      
'#	+ Contraseña    :qkercipgp
'#	+ L. Encriptacion:0                                        
'#	+ Fecha/Hora    :14:31:03--01/06/2009                     
'##############################################################
Option Explicit

'An instance of the Class
Private m_Rijndael As New cRijndael

'Dateien entschlüsseln
Public Function AES_DecryptFile(ByRef bFile() As Byte, ByRef bCrypted_File() As Byte, ByRef sKey As String) As Boolean
On Error GoTo Err:

Dim bPass()    As Byte

'Passwort setzen
bPass = GetPassword(sKey)

Call m_Rijndael.SetCipherKey(bPass)
Call m_Rijndael.ArrayDecrypt(bFile, bCrypted_File)

DoEvents

AES_DecryptFile = True

Exit Function
Err:
AES_DecryptFile = False

End Function

'Passwort umwandeln
Private Function GetPassword(ByVal sPasskey As String) As Byte()
Dim data() As Byte
If HexDisplayRev(sPasskey, data) <> (256 \ 8) Then
 data = StrConv(sPasskey, vbFromUnicode)
 ReDim Preserve data(31)
End If
GetPassword = data
End Function

Private Function HexDisplayRev(TheString As String, data() As Byte) As Long
    Dim i As Long
    Dim j As Long
    Dim c As Long
    Dim d As Long
    Dim n As Long
    Dim data2() As Byte

    n = 2 * Len(TheString)
    data2 = TheString

    ReDim data(n \ 4 - 1)

    d = 0
    i = 0
    j = 0
    Do While j < n
        c = data2(j)
        Select Case c
        Case 48 To 57    '"0" ... "9"
            If d = 0 Then   'high
                d = c
            Else            'low
                data(i) = (c - 48) Or ((d - 48) * 16&)
                i = i + 1
                d = 0
            End If
        Case 65 To 70   '"A" ... "F"
            If d = 0 Then   'high
                d = c - 7
            Else            'low
                data(i) = (c - 55) Or ((d - 48) * 16&)
                i = i + 1
                d = 0
            End If
        Case 97 To 102  '"a" ... "f"
            If d = 0 Then   'high
                d = c - 39
            Else            'low
                data(i) = (c - 87) Or ((d - 48) * 16&)
                i = i + 1
                d = 0
            End If
        End Select
        j = j + 2
    Loop
    n = i
    If n = 0 Then
        Erase data
    Else
        ReDim Preserve data(n - 1)
    End If
    HexDisplayRev = n
End Function



