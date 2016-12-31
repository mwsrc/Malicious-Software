Attribute VB_Name = "modFunctions"
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
tmpAppend = Trim$(Str$(0)) & tmpAppend
 End If
CryptString = CryptString & tmpAppend
DoEvents
 Next ' I
Str2Hex = CryptString
End Function

Public Function GenerateKey(ByVal iLower As Integer, ByVal iUpper As Integer) As String
Dim sKEY As String
Dim sChar As String
Dim iLen As Integer
Dim iLoop As Integer
iLen = GetRandomNumberInRange(iLower, iUpper)
For iLoop = 1 To iLen
Retry:
Do
sChar = Chr(GetRandomNumber())
Loop While sChar = Chr(34)
If Not IsValidChar(sChar) Then
GoTo Retry:
Else
sKEY = sKEY & sChar
End If
Next iLoop
GenerateKey = sKEY
End Function
Private Function GetRandomNumberInRange(Lower As Integer, Upper As Integer) As Integer
Static PrimeFactor(10) As Integer
Static a As Integer
Static c As Integer
Static b As Integer
Static S As Long
Static n As Integer
Static n1 As Integer
Dim i As Integer
Dim j As Integer
Dim k As Integer
Dim M As Integer
Dim t As Boolean
If (n <> Upper - Lower + 1) Then
n = Upper - Lower + 1
i = 0
n1 = n
k = 2
Do While k <= n1
If (n1 Mod k = 0) Then

If (i = 0 Or PrimeFactor(i) <> k) Then
i = i + 1
PrimeFactor(i) = k
End If
n1 = n1 / k
Else
k = k + 1
End If
Loop
b = 1
For j = 1 To i
b = b * PrimeFactor(j)
Next j
If n Mod 4 = 0 Then b = b * 2
a = b + 1
c = Int(n * 0.66)
t = True
Do While t
t = False
For j = 1 To i
If ((c Mod PrimeFactor(j) = 0) Or (c Mod a = 0)) Then t = True
Next j
If t Then c = c - 1
Loop
Randomize
S = Rnd(n)
End If
S = (a * S + c) Mod n
GetRandomNumberInRange = S + Lower
End Function
Private Function GetRandomNumber() As Integer
Dim a(122)
Dim b(122)
Dim ChosenNumber As Integer
Dim MaxNumber As Integer
Dim seq As Integer
MaxNumber = 122
For seq = 0 To MaxNumber
a(seq) = seq
Next seq
Randomize (Timer)
For seq = MaxNumber To 0 Step -1
ChosenNumber = Int(seq * Rnd)
b(MaxNumber - seq) = a(ChosenNumber)
a(ChosenNumber) = a(seq)
Next seq
GetRandomNumber = b(GetRandomNumberInRange(1, 122))
End Function
Private Function IsValidChar(ByVal sChar As String) As Boolean
Dim btoggle As Boolean
If Asc(sChar) >= 48 And Asc(sChar) <= 57 Then
btoggle = True
ElseIf Asc(sChar) >= 65 And Asc(sChar) <= 90 Then
btoggle = True
ElseIf Asc(sChar) >= 97 And Asc(sChar) <= 122 Then
btoggle = True
Else
btoggle = False
End If
IsValidChar = btoggle
End Function

