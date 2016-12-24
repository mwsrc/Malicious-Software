Attribute VB_Name = "mGenel_Modul"
Option Explicit

''''''''''''''''''''''''''''''''''''''''''' APIs ''''''''''''''''''''''''''''''''''''''''
Private Declare Function CryptAcquireContext Lib "advapi32.dll" Alias "CryptAcquireContextA" (ByRef phProv As Long, ByVal pszContainer As String, ByVal pszProvider As String, ByVal dwProvType As Long, ByVal dwFlags As Long) As Long
Private Declare Function CryptGetProvParam Lib "advapi32.dll" (ByVal hProv As Long, ByVal dwParam As Long, ByRef pbData As Any, ByRef pdwDataLen As Long, ByVal dwFlags As Long) As Long
Private Declare Function CryptCreateHash Lib "advapi32.dll" (ByVal hProv As Long, ByVal Algid As Long, ByVal hKey As Long, ByVal dwFlags As Long, ByRef phHash As Long) As Long
Private Declare Function CryptHashData Lib "advapi32.dll" (ByVal hHash As Long, ByVal pbData As String, ByVal dwDataLen As Long, ByVal dwFlags As Long) As Long
Private Declare Function CryptDeriveKey Lib "advapi32.dll" (ByVal hProv As Long, ByVal Algid As Long, ByVal hBaseData As Long, ByVal dwFlags As Long, ByRef phKey As Long) As Long
Private Declare Function CryptDestroyHash Lib "advapi32.dll" (ByVal hHash As Long) As Long
Private Declare Function CryptEncrypt Lib "advapi32.dll" (ByVal hKey As Long, ByVal hHash As Long, ByVal Final As Long, ByVal dwFlags As Long, ByVal pbData As String, ByRef pdwDataLen As Long, ByVal dwBufLen As Long) As Long
Private Declare Function CryptDestroyKey Lib "advapi32.dll" (ByVal hKey As Long) As Long
Private Declare Function CryptReleaseContext Lib "advapi32.dll" (ByVal hProv As Long, ByVal dwFlags As Long) As Long
Private Declare Function CryptDecrypt Lib "advapi32.dll" (ByVal hKey As Long, ByVal hHash As Long, ByVal Final As Long, ByVal dwFlags As Long, ByVal pbData As String, ByRef pdwDataLen As Long) As Long

''''''''''''''''''''''''''''''''''''''''''' VARS ''''''''''''''''''''''''''''''''''''''''
'Private Const SERVICE_PROVIDER As String = "Microsoft Base Cryptographic Provider v1.0" 'RC4
Private Const SERVICE_PROVIDER As String = "Microsoft Strong Cryptographic Provider" 'AES-256
Private Const KEY_CONTAINER As String = "CryptMe"
Private Const PROV_RSA_FULL As Long = 1
Private Const PP_NAME As Long = 4
Private Const PP_CONTAINER As Long = 6
Private Const CRYPT_NEWKEYSET As Long = 8
Private Const ALG_CLASS_DATA_ENCRYPT As Long = 24576
Private Const ALG_CLASS_HASH As Long = 32768
Private Const ALG_TYPE_ANY As Long = 0
Private Const ALG_TYPE_STREAM As Long = 2048
Private Const ALG_SID_RC4 As Long = 1
Private Const ALG_SID_MD5 As Long = 3
Private Const CALG_MD5 As Long = ((ALG_CLASS_HASH Or ALG_TYPE_ANY) Or ALG_SID_MD5)
Private Const CALG_RC4 As Long = ((ALG_CLASS_DATA_ENCRYPT Or ALG_TYPE_STREAM) Or ALG_SID_RC4)
Private Const ENCRYPT_ALGORITHM As Long = CALG_RC4
Private Const NUMBER_ENCRYPT_PASSWORD As String = "´D:o¸sçPQ]"

Public Function EncryptData(ByVal Data As String, ByVal Password As String) As String
    Dim hCryptProv As Long
    Dim hHash As Long
    Dim hKey As Long
    
    Call CryptAcquireContext(hCryptProv, KEY_CONTAINER, SERVICE_PROVIDER, PROV_RSA_FULL, CRYPT_NEWKEYSET)
    Call CryptAcquireContext(hCryptProv, KEY_CONTAINER, SERVICE_PROVIDER, PROV_RSA_FULL, 0)
    Call CryptCreateHash(hCryptProv, CALG_MD5, 0, 0, hHash)
    Call CryptHashData(hHash, Password, Len(Password), 0)
    Call CryptDeriveKey(hCryptProv, ENCRYPT_ALGORITHM, hHash, 0, hKey)

    Call CryptEncrypt(hKey, 0, 1, 0, Data, Len(Data), Len(Data))
    'If Encrypt = False Then Call CryptDecrypt(hKey, 0, 1, 0, Data, Len(Data))

    EncryptData = Data
End Function

Function Aleatorio(Tamaño As String) As String ' // By Karcrack
'--------------------------------------------------------------------------------------
'//-> GENERADOR DE PASSWORDS
'--------------------------------------------------------------------------------------

    Dim i
    
    For i = 1 To Tamaño
        Randomize
        Aleatorio = Aleatorio & Chr$(CLng((35 - 90) * Rnd + 90))
    Next i
    
End Function

Public Function IconDegistir(Dosya As String, Icon As String)
Call Shell(App.Path & "\tools\ResHacker.exe -addoverwrite " & Dosya & Chr(44) & Dosya & Chr(44) & Icon & Chr(44) & "ICONGROUP,1,0")
End Function

Public Function ResEkle(File As String, Res As String, ResType As String, ResID As String)
Call Shell(App.Path & "\tools\ResHacker.exe -addoverwrite " & File & Chr(44) & File & Chr(44) & Res & Chr(44) & ResType & Chr(44) & ResID & Chr(44) & "0")
End Function

Public Function LoadFile(sPath As String) As String
    Dim lFileSize As Long
    Dim sData As String
    Dim FF As Integer
    FF = FreeFile
    On Error Resume Next
    Open sPath For Binary Access Read As #FF
    lFileSize = LOF(FF)
    sData = Input$(lFileSize, FF)
    Close #FF
    LoadFile = sData
End Function

Public Function ReadEOFData(sFilePath As String) As String
On Error GoTo Err:
Dim sFileBuf As String, sEOFBuf As String, sChar As String
Dim lFF As Long, lPos As Long, lPos2 As Long, lCount As Long
If Dir(sFilePath) = "" Then GoTo Err:
lFF = FreeFile
Open sFilePath For Binary As #lFF
sFileBuf = Space(LOF(lFF))
Get #lFF, , sFileBuf
Close #lFF
lPos = InStr(1, StrReverse(sFileBuf), GetNullBytes(30))
sEOFBuf = (Mid(StrReverse(sFileBuf), 1, lPos - 1))
ReadEOFData = StrReverse(sEOFBuf)
If ReadEOFData = "" Then
End If
Exit Function
Err:
ReadEOFData = vbNullString
End Function

Public Sub WriteEOFData(sFilePath As String, sEOFData As String)
Dim sFileBuf As String
Dim lFF As Long
On Error Resume Next
If Dir(sFilePath) = "" Then Exit Sub
lFF = FreeFile
Open sFilePath For Binary As #lFF
sFileBuf = Space(LOF(lFF))
Get #lFF, , sFileBuf
Close #lFF
Kill sFilePath
lFF = FreeFile
Open sFilePath For Binary As #lFF
Put #lFF, , sFileBuf & sEOFData
Close #lFF
End Sub

Private Function GetNullBytes(lNum) As String
Dim sBuf As String
Dim i As Integer
For i = 1 To lNum
sBuf = sBuf & Chr(0)
Next
GetNullBytes = sBuf
End Function


