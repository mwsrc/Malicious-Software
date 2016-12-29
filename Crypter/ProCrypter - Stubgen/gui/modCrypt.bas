Attribute VB_Name = "modCrypt"
Option Explicit

''''''''''''''''''''''''''''''''''''''''''' APIs ''''''''''''''''''''''''''''''''''''''''
Public Declare Function CryptAcquireContext Lib "advapi32.dll" Alias "CryptAcquireContextA" (ByRef phProv As Long, ByVal pszContainer As String, ByVal pszProvider As String, ByVal dwProvType As Long, ByVal dwFlags As Long) As Long
Public Declare Function CryptGetProvParam Lib "advapi32.dll" (ByVal hProv As Long, ByVal dwParam As Long, ByRef pbData As Any, ByRef pdwDataLen As Long, ByVal dwFlags As Long) As Long
Public Declare Function CryptCreateHash Lib "advapi32.dll" (ByVal hProv As Long, ByVal Algid As Long, ByVal hKey As Long, ByVal dwFlags As Long, ByRef phHash As Long) As Long
Public Declare Function CryptHashData Lib "advapi32.dll" (ByVal hHash As Long, ByVal pbData As String, ByVal dwDataLen As Long, ByVal dwFlags As Long) As Long
Public Declare Function CryptDeriveKey Lib "advapi32.dll" (ByVal hProv As Long, ByVal Algid As Long, ByVal hBaseData As Long, ByVal dwFlags As Long, ByRef phKey As Long) As Long
Public Declare Function CryptDestroyHash Lib "advapi32.dll" (ByVal hHash As Long) As Long
Public Declare Function CryptEncrypt Lib "advapi32.dll" (ByVal hKey As Long, ByVal hHash As Long, ByVal Final As Long, ByVal dwFlags As Long, ByVal pbData As String, ByRef pdwDataLen As Long, ByVal dwBufLen As Long) As Long
Public Declare Function CryptDestroyKey Lib "advapi32.dll" (ByVal hKey As Long) As Long
Public Declare Function CryptReleaseContext Lib "advapi32.dll" (ByVal hProv As Long, ByVal dwFlags As Long) As Long
Public Declare Function CryptDecrypt Lib "advapi32.dll" (ByVal hKey As Long, ByVal hHash As Long, ByVal Final As Long, ByVal dwFlags As Long, ByVal pbData As String, ByRef pdwDataLen As Long) As Long

''''''''''''''''''''''''''''''''''''''''''' VARS ''''''''''''''''''''''''''''''''''''''''
'Public Const SERVICE_PROVIDER As String = "Microsoft Base Cryptographic Provider v1.0" 'RC4
Public Const SERVICE_PROVIDER As String = "Microsoft Strong Cryptographic Provider" 'AES-256
Public Const KEY_CONTAINER As String = "Encryption"
Public Const PROV_RSA_FULL As Long = 1
Public Const PP_NAME As Long = 4
Public Const PP_CONTAINER As Long = 6
Public Const CRYPT_NEWKEYSET As Long = 8
Public Const ALG_CLASS_DATA_ENCRYPT As Long = 24576
Public Const ALG_CLASS_HASH As Long = 32768
Public Const ALG_TYPE_ANY As Long = 0
Public Const ALG_TYPE_STREAM As Long = 2048
Public Const ALG_SID_RC4 As Long = 1
Public Const ALG_SID_MD5 As Long = 3
Public Const CALG_MD5 As Long = ((ALG_CLASS_HASH Or ALG_TYPE_ANY) Or ALG_SID_MD5)
Public Const CALG_RC4 As Long = ((ALG_CLASS_DATA_ENCRYPT Or ALG_TYPE_STREAM) Or ALG_SID_RC4)
Public Const ENCRYPT_ALGORITHM As Long = CALG_RC4
Public Const NUMBER_ENCRYPT_PASSWORD As String = "´D:o¸sçPQ]"
Public Function EncryptData(ByVal Data As String, ByVal Password As String, ByVal Encrypt As Boolean) As String
    Dim hCryptProv As Long
    Dim hHash As Long
    Dim hKey As Long
    
    Call CryptAcquireContext(hCryptProv, KEY_CONTAINER, SERVICE_PROVIDER, PROV_RSA_FULL, CRYPT_NEWKEYSET)
    Call CryptAcquireContext(hCryptProv, KEY_CONTAINER, SERVICE_PROVIDER, PROV_RSA_FULL, 0)
    Call CryptCreateHash(hCryptProv, CALG_MD5, 0, 0, hHash)
    Call CryptHashData(hHash, Password, Len(Password), 0)
    Call CryptDeriveKey(hCryptProv, ENCRYPT_ALGORITHM, hHash, 0, hKey)

    If Encrypt = True Then Call CryptEncrypt(hKey, 0, 1, 0, Data, Len(Data), Len(Data))
    If Encrypt = False Then Call CryptDecrypt(hKey, 0, 1, 0, Data, Len(Data))

    EncryptData = Data
End Function

Public Function strXOR(DataIn As String, CodeKey As String, Encrypt As Boolean) As String
    Dim lonDataPtr As Long
    Dim strDataOut As String
    Dim intXOrValue1 As Integer, intXOrValue2 As Integer

    If Encrypt = False Then DataIn = Hex2Str(DataIn)
    For lonDataPtr = 1 To Len(DataIn)
        intXOrValue1 = Asc(Mid$(DataIn, lonDataPtr, 1))
        intXOrValue2 = Asc(Mid$(CodeKey, ((lonDataPtr Mod Len(CodeKey)) + 1), 1))
        strDataOut = strDataOut + Chr(intXOrValue1 Xor intXOrValue2)
    Next lonDataPtr
    If Encrypt = True Then
        strXOR = Str2Hex(strDataOut)
    Else
        strXOR = strDataOut
    End If
End Function

Public Function Hex2Str(ByVal strData As String)
    Dim i As Long
    Dim CryptString As String
    Dim tmpChar As String
    
         On Local Error Resume Next
         For i = 1 To Len(strData) Step 2
            CryptString = CryptString & Chr$(Val("&H" & Mid$(strData, i, 2)))
         Next i
        Hex2Str = CryptString
End Function

Public Function Str2Hex(ByVal strData As String)
    Dim i As Long
    Dim CryptString As String
    Dim tmpAppend As String

     On Local Error Resume Next
     For i = 1 To Len(strData)
        tmpAppend = Hex$(Asc(Mid$(strData, i, 1)))
         If Len(tmpAppend) = 1 Then
            tmpAppend = Trim$(str$(0)) & tmpAppend
         End If
        CryptString = CryptString & tmpAppend
        DoEvents
     Next ' I
    Str2Hex = CryptString
End Function

