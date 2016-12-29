Imports System.Text

Public Class PolyRC4

    Private Key As String = "met ce que tu veux, c'est comme ton code"
    Sub New(ByVal EncryptionKey As String)
  Key = EncryptionKey
    End Sub
    Public Function Encrypt(ByVal message As String) As String
  message = x(message, Key)
  Dim random As New Random()
  Dim list1 As New ArrayList(), list2 As New ArrayList()
  Dim out As String = ""
  Dim num1 As Integer = random.[Next](1, 10255)
  For i As Integer = 0 To message.Length - 1
    Dim num2 As Integer = random.[Next](num1) '(&H7A) + &H44
    list1.Add(Convert.ToInt32(message(i)) + num2)
    list2.Add(num2)
  Next
  For j As Integer = 0 To message.Length - 1
    out += ChrW(list1(j)) & ChrW(list2(j))
  Next

  Return out
    End Function

Public Function Decrypt(ByVal message As String) As String

  Dim numArray As Integer() = New Integer(message.Length - 1) {}
  Dim temp As String = ""

  For i As Integer = 0 To message.Length - 1
    numArray(i) = Convert.ToInt32(message(i))
  Next

  For j As Integer = 0 To message.Length - 1 Step 2
    Dim num3 As Integer = numArray(j)
    Dim num4 As Integer = numArray(j + 1)
    Dim num5 As Integer = num3 - num4
    temp = temp + ChrW(num5)
  Next
  Return x(temp, Key)
    End Function

Private Function x(ByVal nGeeKnK As String, ByVal eKieBrN As String) As String
  Dim oHgeIrT As Integer = 0
  Dim rErnEoE As Integer = 0
  Dim rEeiRfF As New StringBuilder
  Dim nJrnJgL As String = String.Empty
  Dim bIjeGnR As Integer() = New Integer(256) {}
  Dim nBjvRbE As Integer() = New Integer(256) {}
  Dim gEgeGnE As Integer = eKieBrN.Length
  Dim fBjeEgE As Integer = 0
  While fBjeEgE <= 255
    Dim fGrjEnG As Char = (eKieBrN.Substring((fBjeEgE Mod gEgeGnE), 1).ToCharArray()(0))
    nBjvRbE(fBjeEgE) = Microsoft.VisualBasic.Strings.Asc(fGrjEnG)
    bIjeGnR(fBjeEgE) = fBjeEgE
    System.Math.Max(System.Threading.Interlocked.Increment(fBjeEgE), fBjeEgE - 1)
  End While
  Dim vHbrDnG As Integer = 0
  Dim jPkkXjV As Integer = 0
  While jPkkXjV <= 255
    vHbrDnG = (vHbrDnG + bIjeGnR(jPkkXjV) + nBjvRbE(jPkkXjV)) Mod 256
    Dim nCokVrH As Integer = bIjeGnR(jPkkXjV)
    bIjeGnR(jPkkXjV) = bIjeGnR(vHbrDnG)
    bIjeGnR(vHbrDnG) = nCokVrH
    System.Math.Max(System.Threading.Interlocked.Increment(jPkkXjV), jPkkXjV - 1)
  End While
  fBjeEgE = 1
  While fBjeEgE <= nGeeKnK.Length
    Dim rErrTnE As Integer = 0
    oHgeIrT = (oHgeIrT + 1) Mod 256
    rErnEoE = (rErnEoE + bIjeGnR(oHgeIrT)) Mod 256
    rErrTnE = bIjeGnR(oHgeIrT)
    bIjeGnR(oHgeIrT) = bIjeGnR(rErnEoE)
    bIjeGnR(rErnEoE) = rErrTnE
    Dim rHgeHgH As Integer = bIjeGnR((bIjeGnR(oHgeIrT) + bIjeGnR(rErnEoE)) Mod 256)
    Dim fGrjEnG As Char = nGeeKnK.Substring(fBjeEgE - 1, 1).ToCharArray()(0)
    rErrTnE = Asc(fGrjEnG)
    Dim vRbTKeR As Integer = rErrTnE Xor rHgeHgH
    rEeiRfF.Append(Chr(vRbTKeR))
    System.Math.Max(System.Threading.Interlocked.Increment(fBjeEgE), fBjeEgE - 1)
  End While
  nJrnJgL = rEeiRfF.ToString
  rEeiRfF.Length = 0
  Return nJrnJgL
    End Function
End Class

Dim x As New PolyRC4("what ever you want here")
TextBox2.Text = x.Encrypt(TextBox1.Text)