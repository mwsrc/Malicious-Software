VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CCrypto"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'*******************************************************************************
' MODULE:       CCrypto
' FILENAME:     C:\My Code\vb\CryptoAPI\CCrypto.cls
' AUTHOR:       Phil Fresle
' CREATED:      18-Feb-2000
' COPYRIGHT:    Copyright 2000 Frez Systems Limited. All Rights Reserved.
'
' DESCRIPTION:
' This class wraps the Crypto API so that the user can encrypt and decrypt
' strings using the Microsoft Crypto Provider.
'
' For better security you may want to put this code in a standard module or
' internal class so it is compiled in with your program rather than as a
' separate DLL.
'
' MODIFICATION HISTORY:
' 1.0       20-Feb-2000
'           Phil Fresle
'           Initial Version
' 1.1       21-Feb-2000
'           Phil Fresle
'           Added CRYPT_VERIFYCONTEXT to the CryptAquireContext call in the
'           class initialize procedure so it will work with NT4 (worked anyway
'           with Win98 and Win2000).
' 1.2       22-Feb-2000
'           Phil Fresle
'           Corrected error source in Decrypt routine in err.raise
'*******************************************************************************
Option Explicit

' Type of encryption to use
Public Enum frezCryptoEncryptionType
    frezBlockEncryption = 1
    frezStreamEncryption = 2
End Enum
    
' Error numbers (public enum so user's of the DLL can see/use them)
Public Enum frezCryptoErrors
    frezErrorAquiringContext = vbObjectError + 1056
    frezErrorCreatingHash = vbObjectError + 1057
    frezErrorCreatingHashData = vbObjectError + 1058
    frezErrorDerivingKey = vbObjectError + 1059
    frezErrorEncryptingData = vbObjectError + 1060
    frezErrorDecryptingData = vbObjectError + 1061
    frezErrorInvalidHexString = vbObjectError + 1062
    frezErrorMissingParameter = vbObjectError + 1063
    frezErrorBadEncryptionType = vbObjectError + 1064
End Enum

' Error messages
Private Const ERROR_AQUIRING_CONTEXT    As String = "Could not acquire context"
Private Const ERROR_CREATING_HASH       As String = "Could not create hash"
Private Const ERROR_CREATING_HASH_DATA  As String = "Could not create hash data"
Private Const ERROR_DERIVING_KEY        As String = "Could not derive key"
Private Const ERROR_ENCRYPTING_DATA     As String = "Could not encrypt data"
Private Const ERROR_DECRYPTING_DATA     As String = "Could not decrypt data"
Private Const ERROR_INVALID_HEX_STRING  As String = "Not a valid hex string"
Private Const ERROR_MISSING_PARAMETER   As String = "Both a string and a key are required"
Private Const ERROR_BAD_ENCRYPTION_TYPE As String = "Invalid encryption type specified"

' The provider
Private Const CRYPTO_PROVIDER As String = "Microsoft Base Cryptographic Provider v1.0"

' For the context
Private Const CRYPT_VERIFYCONTEXT   As Long = &HF0000000
Private Const PROV_RSA_FULL         As Long = 1

' Hashing algorithms for the session key
Private Const ALG_CLASS_HASH    As Long = 32768             ' (4 << 13)
Private Const ALG_TYPE_ANY      As Long = 0
Private Const ALG_SID_MD5       As Long = 3
Private Const CALG_MD5          As Long = ALG_CLASS_HASH _
                                            Or ALG_TYPE_ANY Or ALG_SID_MD5

' For the session key
Private Const CRYPT_NO_SALT As Long = &H10

' Encryption algorithms
Private Const ALG_CLASS_DATA_ENCRYPT    As Long = 24576     ' (3 << 13)
Private Const ALG_TYPE_BLOCK            As Long = 1536      ' (3 << 9)
Private Const ALG_TYPE_STREAM           As Long = 2048      ' (4 << 9)
Private Const ALG_SID_RC2               As Long = 2
Private Const ALG_SID_RC4               As Long = 1
Private Const CALG_RC2                  As Long = ALG_CLASS_DATA_ENCRYPT _
                                                    Or ALG_TYPE_BLOCK Or ALG_SID_RC2
Private Const CALG_RC4                  As Long = ALG_CLASS_DATA_ENCRYPT _
                                                    Or ALG_TYPE_STREAM Or ALG_SID_RC4

' Module level variables
Private m_lProvider As Long

' We will be using this to slow down decryption to discourage hacking
Private Declare Sub Sleep Lib "kernel32" _
    (ByVal dwMilliseconds As Long)

' Declarations for the CryptoAPI functions
Private Declare Function CryptAcquireContext Lib "advapi32.dll" Alias "CryptAcquireContextA" _
    (ByRef phProv As Long, _
    ByVal pszContainer As String, _
    ByVal pszProvider As String, _
    ByVal dwProvType As Long, _
    ByVal dwFlags As Long) As Long
    
Private Declare Function CryptCreateHash Lib "advapi32.dll" _
    (ByVal hProv As Long, _
    ByVal algID As Long, _
    ByVal hKey As Long, _
    ByVal dwFlags As Long, _
    ByRef phHash As Long) As Long
    
Private Declare Function CryptDeriveKey Lib "advapi32.dll" _
    (ByVal hProv As Long, _
    ByVal algID As Long, _
    ByVal hBaseData As Long, _
    ByVal dwFlags As Long, _
    ByRef phKey As Long) As Long
    
Private Declare Function CryptDestroyHash Lib "advapi32.dll" _
    (ByVal hHash As Long) As Long
    
Private Declare Function CryptDestroyKey Lib "advapi32.dll" _
    (ByVal hKey As Long) As Long
    
Private Declare Function CryptEncrypt Lib "advapi32.dll" _
    (ByVal hKey As Long, _
    ByVal hHash As Long, _
    ByVal Final As Long, _
    ByVal dwFlags As Long, _
    ByVal pbData As String, _
    ByRef pdwDataLen As Long, _
    ByVal dwBufLen As Long) As Long
    
Private Declare Function CryptDecrypt Lib "advapi32.dll" _
    (ByVal hKey As Long, _
    ByVal hHash As Long, _
    ByVal Final As Long, _
    ByVal dwFlags As Long, _
    ByVal pbData As String, _
    ByRef pdwDataLen As Long) As Long
    
Private Declare Function CryptHashData Lib "advapi32.dll" _
    (ByVal hHash As Long, _
    ByVal pbData As String, _
    ByVal dwDataLen As Long, _
    ByVal dwFlags As Long) As Long
    
Private Declare Function CryptReleaseContext Lib "advapi32.dll" _
    (ByVal hProv As Long, _
    ByVal dwFlags As Long) As Long


'*******************************************************************************
' EncryptDecrypt (FUNCTION)
'
' PARAMETERS:
' (In) - sText            - String                   - Text to encrypt or decrypt
' (In) - sKeyRoot         - String                   - Text to use in generating key
' (In) - bEncrypt         - Boolean                  - True to encrypt, false to
'                                                      decrypt
' (In) - enEncryptionType - frezCryptoEncryptionType - Block or stream encryption
'
' RETURN VALUE:
' String - The encrypted or decrypted string
'
' DESCRIPTION:
' Takes the input string and encrypts or decrypts it.
'*******************************************************************************
Private Function EncryptDecrypt(ByVal sText As String, _
                                ByVal sKeyRoot As String, _
                                ByVal bEncrypt As Boolean, _
                                ByVal enEncryptionType As frezCryptoEncryptionType) As String
    
    Dim lResult             As Long
    Dim lHash               As Long
    Dim lKey                As Long
    Dim lHashPassword       As Long
    Dim lFlags              As Long
    Dim lData               As Long
    Dim lClear              As Long
    Dim sErr                As String
    Dim lErr                As Long
    Dim lEncryptionType     As Long
    
    On Error GoTo ERROR_HANDLER
    
    ' Create a handle to a hash object  using the MD5 algorithm
    lResult = CryptCreateHash(m_lProvider, CALG_MD5, 0, 0, lHash)
    If lResult = 0 Then
        Err.Raise frezErrorCreatingHash, , ERROR_CREATING_HASH
    End If
    
    ' Add some data to the hash object for use in generating our key
    ' sKeyRoot is, in effect, our key and should be fairly complex and
    ' not easily guessed
    lHashPassword = Len(sKeyRoot)
    lResult = CryptHashData(lHash, sKeyRoot, lHashPassword, 0)
    If lResult = 0 Then
        Err.Raise frezErrorCreatingHashData, , ERROR_CREATING_HASH_DATA
    End If
    
    ' Select appropriate encryption method
    If enEncryptionType = frezBlockEncryption Then
        lEncryptionType = CALG_RC2
    Else
        lEncryptionType = CALG_RC4
    End If
    
    ' Generate a session key for use with the cypher
    lFlags = CRYPT_NO_SALT
    lResult = CryptDeriveKey(m_lProvider, lEncryptionType, lHash, lFlags, lKey)
    If lResult = 0 Then
        Err.Raise frezErrorDerivingKey, , ERROR_DERIVING_KEY
    End If
    
    ' Encrypt or decrypt data as required
    lData = Len(sText)
    If bEncrypt Then
        lClear = lData
        ' Call with a null first to see how long the string needs to be
        lResult = CryptEncrypt(lKey, 0, 1, 0, vbNullString, lData, lClear)
        sText = sText & String(lData - lClear, " ")
        ' Encrypt some text
        lResult = CryptEncrypt(lKey, 0, 1, 0, sText, lClear, lData)
        If lResult = 0 Then
            Err.Raise frezErrorEncryptingData, , ERROR_ENCRYPTING_DATA
        End If
    Else
        ' You may want to slow down a hacker trying multiple passwords to decrypt
        ' by brut force with a sleep command like this...
        'Sleep 1000
        
        ' Decrypt the text
        lResult = CryptDecrypt(lKey, 0, 1, 0, sText, lData)
        sText = Left(sText, lData)
        If lResult = 0 Then
            Err.Raise frezErrorDecryptingData, , ERROR_DECRYPTING_DATA
        End If
    End If
    
    EncryptDecrypt = sText
TIDY_UP:
    On Error Resume Next
        
    If lHash <> 0 Then
        lResult = CryptDestroyHash(lHash)
    End If
    If lKey <> 0 Then
        lResult = CryptDestroyKey(lKey)
    End If
    Err.Clear
    
    If lErr <> 0 Then
        Err.Raise lErr, "FrezCrypo.CCrypto.EncryptDecrypt", sErr
    End If
Exit Function
ERROR_HANDLER:
    lErr = Err.Number
    sErr = Err.Description
    GoTo TIDY_UP
End Function

'*******************************************************************************
' Encrypt (FUNCTION)
'
' PARAMETERS:
' (In) - sTextToEncrypt   - String                   - Text to encrypt
' (In) - sPrivateKey      - String                   - String to use for key
' (In) - bReturnTextInHex - Boolean                  - Whether to return the
'                                                      encypted text as hex
' (In) - enEncryptionType - frezCryptoEncryptionType - Block or stream encryption
'
' RETURN VALUE:
' String - The encrypted text
'
' DESCRIPTION:
' User calls this method to encrypt the string specified by sTextToEncrypt. The
' user passes a string to generate the private key with that will be used to
' encrypt the string. The user can also specify whether the string is to be
' returned in hex, it will be twice the size, but human readable. Finally, the
' user can specify which encryption method to use Block (more secure) or
' stream.
'*******************************************************************************
Public Function Encrypt(ByVal sTextToEncrypt As String, _
                        ByVal sPrivateKey As String, _
                        Optional ByVal bReturnTextInHex As Boolean _
                                                        = False, _
                        Optional ByVal enEncryptionType As frezCryptoEncryptionType _
                                                        = frezBlockEncryption) As String
    Dim sEncryptedText As String
    
    If enEncryptionType <> frezBlockEncryption And enEncryptionType <> frezStreamEncryption Then
        Err.Raise frezErrorBadEncryptionType, "FrezCrypo.CCrypto.Encrypt", ERROR_BAD_ENCRYPTION_TYPE
    End If
    
    If sTextToEncrypt = "" Or sPrivateKey = "" Then
        Err.Raise frezErrorMissingParameter, "FrezCrypo.CCrypto.Encrypt", ERROR_MISSING_PARAMETER
    End If
        
    sEncryptedText = EncryptDecrypt(sTextToEncrypt, sPrivateKey, True, enEncryptionType)
    
    If bReturnTextInHex Then
        Encrypt = ConvertStringToHex(sEncryptedText)
    Else
        Encrypt = sEncryptedText
    End If
End Function

'*******************************************************************************
' Decrypt (FUNCTION)
'
' PARAMETERS:
' (In) - sTextToDecrypt     - String                   - Text to decrypt
' (In) - sPrivateKey        - String                   - String to use for key
' (In) - bTextSuppliedInHex - Boolean                  - Whether the text provided
'                                                        is in hex or not
' (In) - enEncryptionType   - frezCryptoEncryptionType - Block or stream encryption
'
' RETURN VALUE:
' String - The decrypted text
'
' DESCRIPTION:
' User calls this method to decrypt the string specified by sTextToDecrypt. The
' user passes a string to generate the private key with that will be used to
' decrypt the string. The user can also specify whether the string was supplied
' in hex, human readable. Finally, the user can specify which encryption method
' was used Block (more secure) or stream.
'*******************************************************************************
Public Function Decrypt(ByVal sTextToDecrypt As String, _
                        ByVal sPrivateKey As String, _
                        Optional ByVal bTextSuppliedInHex As Boolean _
                                                        = False, _
                        Optional ByVal enEncryptionType As frezCryptoEncryptionType _
                                                        = frezBlockEncryption) As String
                        
    If enEncryptionType <> frezBlockEncryption And enEncryptionType <> frezStreamEncryption Then
        ' Phil Fresle - 22-Feb-2000 21:51
        ' Changed source to show decrypt instead of encrypt
        Err.Raise frezErrorBadEncryptionType, "FrezCrypo.CCrypto.Decrypt", ERROR_BAD_ENCRYPTION_TYPE
    End If
    
    If sTextToDecrypt = "" Or sPrivateKey = "" Then
        Err.Raise frezErrorMissingParameter, "FrezCrypo.CCrypto.Decrypt", ERROR_MISSING_PARAMETER
    End If
    
    If bTextSuppliedInHex Then
        sTextToDecrypt = ConvertStringFromHex(sTextToDecrypt)
    End If
    
    Decrypt = EncryptDecrypt(sTextToDecrypt, sPrivateKey, False, enEncryptionType)
End Function

'*******************************************************************************
' ConvertStringToHex (FUNCTION)
'
' PARAMETERS:
' (In) - sText - String - Text to be converted to hex
'
' RETURN VALUE:
' String - String now in hex
'
' DESCRIPTION:
' Takes a string, steps through it character by character converting it to
' the hex value of the ascii value of the character
'*******************************************************************************
Private Function ConvertStringToHex(ByVal sText As String) As String
    Dim lCount  As Long
    Dim sHex    As String
    Dim sResult As String
    
    For lCount = 1 To Len(sText)
        sHex = Hex(Asc(Mid(sText, lCount, 1)))
        If Len(sHex) = 1 Then
            sHex = "0" & sHex
        End If
        sResult = sResult & sHex
    Next
    
    ConvertStringToHex = sResult
End Function

'*******************************************************************************
' ConvertStringFromHex (FUNCTION)
'
' PARAMETERS:
' (In) - sText - String - Text to be converted back from hex
'
' RETURN VALUE:
' String - String now in clear
'
' DESCRIPTION:
' Takes a string, goes through it every two characters, takes the ascii hex value
' contained in the two characters and converts it to the actual character
'*******************************************************************************
Private Function ConvertStringFromHex(ByVal sText As String) As String
    Dim lCount  As Long
    Dim sChar   As String
    Dim sResult As String
    Dim lLength As Long
    
    lLength = Len(sText)
    If lLength Mod 2 <> 0 Then
        Err.Raise frezErrorInvalidHexString, _
                    "FrezCrypo.CCrypto.ConvertStringFromHex", _
                    ERROR_INVALID_HEX_STRING
    End If
        
    For lCount = 1 To lLength
        sChar = Mid(sText, lCount, 1)
        If sChar < "0" Or sChar > "9" Then
            If sChar < "A" Or sChar > "F" Then
                Err.Raise frezErrorInvalidHexString, _
                            "FrezCrypo.CCrypto.ConvertStringFromHex", _
                            ERROR_INVALID_HEX_STRING
            End If
        End If
    Next
    
    For lCount = 1 To lLength Step 2
        sResult = sResult & Chr("&H" & Mid(sText, lCount, 2))
    Next
    
    ConvertStringFromHex = sResult
End Function

'*******************************************************************************
' Class_Initialize (SUB)
'
' PARAMETERS:
' None
'
' DESCRIPTION:
' When class is initialized get a handle to the context
'*******************************************************************************
Private Sub Class_Initialize()
    Dim lResult As Long
    
    ' Phil Fresle - 21-Feb-2000 17:47
    ' To fix NT4 it now passes CRYPT_VERIFYCONTEXT
    ' Aquire context to the microsoft default CSP
    lResult = CryptAcquireContext(m_lProvider, vbNullString, _
        CRYPTO_PROVIDER, PROV_RSA_FULL, CRYPT_VERIFYCONTEXT)
    
    If lResult = 0 Then
        Err.Raise frezErrorAquiringContext, _
                    "FrezCrypo.CCrypto.Class_Initialize", _
                    ERROR_AQUIRING_CONTEXT
    End If
End Sub

'*******************************************************************************
' Class_Terminate (SUB)
'
' PARAMETERS:
' None
'
' DESCRIPTION:
' When class terminates, tidy up the context
'*******************************************************************************
Private Sub Class_Terminate()
    Dim lResult As Long
    
    If m_lProvider <> 0 Then
        lResult = CryptReleaseContext(m_lProvider, 0)
    End If
End Sub
