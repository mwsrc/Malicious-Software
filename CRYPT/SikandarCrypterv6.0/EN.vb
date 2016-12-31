Imports System.Security.Cryptography
Imports System.Text
Imports System.IO


Public Class Encryption_Algorithms
    Public Class PolyMorphicStairs
        Overloads Shared Function PolyCrypt(ByVal Data As String, ByVal Key As String, Optional ByVal ExtraRounds As UInteger = 0) As String
            Dim buff() As Byte = PolyCrypt(Encoding.Default.GetBytes(Data), Encoding.Default.GetBytes(Key), ExtraRounds)
            PolyCrypt = Encoding.Default.GetString(buff)
            Erase buff
        End Function
        Overloads Shared Function PolyDeCrypt(ByVal Data As String, ByVal Key As String, Optional ByVal ExtraRounds As UInteger = 0) As String
            Dim buff() As Byte = PolyDeCrypt(Encoding.Default.GetBytes(Data), Encoding.Default.GetBytes(Key), ExtraRounds)
            PolyDeCrypt = Encoding.Default.GetString(buff)
            Erase buff
        End Function
        Overloads Shared Function PolyCrypt(ByRef Data() As Byte, ByVal Key() As Byte, Optional ByVal ExtraRounds As UInteger = 0) As Byte()
            Array.Resize(Data, Data.Length + 1)
            Data(Data.Length - 1) = Convert.ToByte(New Random().Next(1, 255))
            For i = (Data.Length - 1) * (ExtraRounds + 1) To 0 Step -1
                Data(i Mod Data.Length) = CByte(CInt((Data(i Mod Data.Length)) + CInt(Data((i + 1) Mod Data.Length))) Mod 256) Xor Key(i Mod Key.Length)
            Next
            Return Data
        End Function
        Overloads Shared Function PolyDeCrypt(ByRef Data() As Byte, ByVal Key() As Byte, Optional ByVal ExtraRounds As UInteger = 0) As Byte()
            For i = 0 To (Data.Length - 1) * (ExtraRounds + 1)
                Data(i Mod Data.Length) = CByte((CInt(Data(i Mod Data.Length) Xor Key(i Mod Key.Length)) - CInt(Data((i + 1) Mod Data.Length)) + 256) Mod 256)
            Next
            Array.Resize(Data, Data.Length - 1)
            Return Data
        End Function
    End Class
    Public Shared Function Rc4(ByVal bytes() As Byte, ByVal key() As Byte) As Byte()
        Dim s(255) As Byte
        Dim i As Integer
        For i = 0 To s.Length - 1
            s(i) = CByte(i)
        Next
        Dim j As Integer
        For i = 0 To s.Length - 1
            j = (j + key(i Mod key.Length) + s(i)) And 255
            Dim temp As Byte = s(i)
            s(i) = s(j)
            s(j) = temp
        Next
        i = 0
        j = 0
        Dim output(bytes.Length - 1) As Byte
        Dim k As Integer
        For k = 0 To bytes.Length - 1
            i = (i + 1) And 255
            j = (j + s(i)) And 255
            Dim temp As Byte = s(i)
            s(i) = s(j)
            s(j) = temp
            output(k) = s((CType(s(i), Integer) + s(j)) And 255) Xor bytes(k)
        Next
        Return output
    End Function
    Public Shared Function PolyDec(ByVal Input As String) As String
        Dim Output As String = Nothing
        Dim SA() As String
        SA = Input.Split("|")
        For Each C As String In SA
            Try
                Output = Output & Chr(C - SA(0))
            Catch
            End Try
        Next
        Return Output.Remove(0, 1)
    End Function
    Public Shared Function PolyCrypt(ByVal Input As String) As String
        Dim Output As String = Nothing
        Dim R As New Random
        Dim O As Integer = R.Next(10, 99)
        Dim CA As Char()
        CA = Input.ToCharArray
        For Each C As Char In CA
            Try
                Output = Output & Asc(C) + O & "|"
            Catch
            End Try
        Next
        Return O & "|" & Output
    End Function
    Public Shared Function xEncryptionD(ByVal CodeKey As String, ByVal DataIn As String) As String

        Dim lonDataPtr As Long

        Dim strDataOut As String = ""

        Dim intXOrValue1 As Integer

        Dim intXOrValue2 As Integer

        Dim H As String = "&H"

        For lonDataPtr = 1 To (Len(DataIn) / 2)

            intXOrValue1 = Val(H & (Mid$(DataIn, (2 * lonDataPtr) - 1, 2)))

            intXOrValue2 = Asc(Mid$(CodeKey, ((lonDataPtr Mod Len(CodeKey)) + 1), 1))

            strDataOut = strDataOut + Chr(intXOrValue1 Xor intXOrValue2)

        Next lonDataPtr

        xEncryptionD = strDataOut

    End Function
    Public Shared Function xEncryption(ByVal CodeKey As String, ByVal DataIn As String) As String
        Dim lonDataPtr As Long
        Dim strDataOut As String
        Dim temp As Integer
        Dim tempstring As String
        Dim intXOrValue1 As Integer
        Dim intXOrValue2 As Integer
        For lonDataPtr = 1 To Len(DataIn)
            intXOrValue1 = Asc(Mid$(DataIn, lonDataPtr, 1))
            intXOrValue2 = Asc(Mid$(CodeKey, ((lonDataPtr Mod Len(CodeKey)) + 1), 1))

            temp = (intXOrValue1 Xor intXOrValue2)
            tempstring = Hex(temp)
            If Len(tempstring) = 1 Then tempstring = "0" & tempstring
            strDataOut = strDataOut + tempstring
        Next lonDataPtr
        xEncryption = strDataOut
    End Function
    Public Shared Function TripleDESdecrypt(ByVal b As String, ByVal c As String, ByVal d As Boolean) As String
        Dim keyArray As Byte()
        Dim toEncryptArray As Byte() = Convert.FromBase64String(b)
        If d Then
            Dim hashmd5 = New MD5CryptoServiceProvider()
            keyArray = hashmd5.ComputeHash(UTF8Encoding.UTF8.GetBytes(c))
        Else
            keyArray = UTF8Encoding.UTF8.GetBytes(c)
        End If
        Dim tdes = New TripleDESCryptoServiceProvider()
        tdes.Key = keyArray
        tdes.Mode = CipherMode.ECB
        tdes.Padding = PaddingMode.PKCS7
        Dim cTransform As ICryptoTransform = tdes.CreateDecryptor()
        Dim resultArray As Byte() = cTransform.TransformFinalBlock(toEncryptArray, 0, toEncryptArray.Length)
        Return UTF8Encoding.UTF8.GetString(resultArray)
    End Function
    Public Shared Function TripleDES(ByVal toEncrypt As String, ByVal key As String, ByVal useHashing As Boolean) As String
        Dim KeyArray As Byte()
        Dim toEncryptArray As Byte() = UTF8Encoding.UTF8.GetBytes(toEncrypt)
        If useHashing Then
            Dim hashmd5 As New MD5CryptoServiceProvider()
            KeyArray = hashmd5.ComputeHash(UTF8Encoding.UTF8.GetBytes(key))
        Else
            KeyArray = UTF8Encoding.UTF8.GetBytes(key)
        End If
        Dim TDES As New TripleDESCryptoServiceProvider()
        TDES.Key = KeyArray
        TDES.Mode = CipherMode.ECB
        TDES.Padding = PaddingMode.PKCS7
        Dim cTransform As ICryptoTransform = TDES.CreateEncryptor()
        Dim resultArray As Byte() = cTransform.TransformFinalBlock(toEncryptArray, 0, toEncryptArray.Length)
        Return Convert.ToBase64String(resultArray, 0, resultArray.Length)
    End Function
    Public Shared Function Rijndael(ByVal File As String, ByVal Key As String)
        Dim oAesProvider As New RijndaelManaged
        Dim btClear() As Byte
        Dim btSalt() As Byte = New Byte() {1, 2, 3, 4, 5, 6, 7, 8}
        Dim oKeyGenerator As New Rfc2898DeriveBytes(Key, btSalt)
        oAesProvider.Key = oKeyGenerator.GetBytes(oAesProvider.Key.Length)
        oAesProvider.IV = oKeyGenerator.GetBytes(oAesProvider.IV.Length)
        Dim ms As New IO.MemoryStream
        Dim cs As New CryptoStream(ms, _
            oAesProvider.CreateEncryptor(), _
            CryptoStreamMode.Write)
        btClear = System.Text.Encoding.UTF8.GetBytes(File)
        cs.Write(btClear, 0, btClear.Length)
        cs.Close()
        File = Convert.ToBase64String(ms.ToArray)
        Return File
    End Function
    Public Class PolyMorphic
        'Variable for the Key.
        Private sKey As String = ""
        'Property, will Give us acces to the key.
        Public Property Key() As String
            Get
                Return sKey
            End Get
            Set(ByVal value As String)
                sKey = value
            End Set
        End Property
        'Inisalization. (New Constructor)
        Public Sub New(ByVal Key As String)
            Me.Key = Key
        End Sub
        Public Sub New()
            Me.Key = ""
        End Sub
        'This Will convert String to bytes,then call the other function.
        Public Function PolyCrypt(ByVal Data As String) As String
            Return Encoding.Default.GetString(PolyCrypt(Encoding.Default.GetBytes(Data)))
        End Function
        'This one also Will convert String to bytes,then call the other function.
        Public Function PolyDeCrypt(ByVal Data As String) As String
            Return Encoding.Default.GetString(PolyDeCrypt(Encoding.Default.GetBytes(Data)))
        End Function
        'Main PolyMorphic Encryption.
        Public Function PolyCrypt(ByVal Data() As Byte) As Byte()
            'We declare a byte array, just one byte bigger then the data.
            Dim ReturnBuffer(Data.Length) As Byte
            'we assain The first one with a random byte.
            ReturnBuffer(0) = Convert.ToByte(New Random().Next(1, Convert.ToInt32(11111111, 2)))
            'now for each byte in data
            For i = Convert.ToInt32(0, 2) To Data.Length - Convert.ToInt32(1, 2)
                'we add the previous byte to the next byte Mod 256. the first byte is random,
                'so will will get random bytes all the way.
                ReturnBuffer(i + Convert.ToInt32(1, 2)) = ModuloByte(ReturnBuffer(i), Data(i))
            Next
            'We Call the Selected Encryption to crypt the randomized Data.
            Return XorCrypt(ReturnBuffer, Encoding.Default.GetBytes(Key))
        End Function
        'Main PolyMorphic Decryption.
        Public Function PolyDeCrypt(ByVal Data() As Byte) As Byte()
            'This Function is the exact reverse of the crypt function.
            'we should Decrypt to get our last randomized data.
            Data = XorCrypt(Data, Encoding.Default.GetBytes(Key))
            'Now in the other function the return value is a one byte bigger array. lets remove that one
            Dim ReturnBuffer(Data.Length - Convert.ToInt32(10, 2)) As Byte
            'we started from Byte n# 0 to the last one. we'll play it reversed now. 
            For i = Data.Length - Convert.ToInt32(1, 2) To Convert.ToInt32(1, 2) Step -Convert.ToInt32(1, 2)
                'We just remove The previous byte value from the current one Mod 256. simple
                ReturnBuffer(i - Convert.ToInt32(1, 2)) = ModuloByte(Data(i), -Data(i - Convert.ToInt32(1, 2)))
            Next
            'That's it. The Buffer is one byte less then the data. Perfect. Return it.
            Return ReturnBuffer
        End Function
        'A Positive Mod 256. This will prevent a non byte value. the result is always >= 0 and <= 255
        Private Function ModuloByte(ByVal MyByte As Byte, ByVal Addition As Int16) As Byte
            While Addition < Convert.ToInt32(0, 2)
                '
                Addition += Convert.ToInt32(100000000, 2)
            End While
            Return Convert.ToByte((MyByte + Addition) Mod Convert.ToInt32(100000000, 2))
        End Function
        'Xor Encryption.
        Private Function XorCrypt(ByVal Data() As Byte, ByVal Key() As Byte) As Byte()
            If Key.Length <> 0 Then
                For i = Convert.ToInt32(0, 2) To Data.Length - Convert.ToInt32(1, 2)
                    Data(i) = Data(i) Xor ModuloByte(Key(i Mod Key.Length), [Key](Key(i Mod Key.Length) Mod Key.Length)) Xor [Key](((i + (i Mod Convert.ToInt32(111, 2))) Mod Key.Length) Mod Key.Length)
                Next
            End If
            Return Data
        End Function
        Public Function XorCrypt(ByVal Data As String, ByVal Key As String) As String
            Return Encoding.Default.GetString(XorCrypt(Encoding.Default.GetBytes(Data), Encoding.Default.GetBytes(Key)))
        End Function
    End Class
    Public Class StairsEncryption
        'Simple encryption for use
        'coded by Miharbi-Dono from HF.
        'Give Credits. don't just delete this comment, it won't hurt.
        Public Shared Function Crypt(ByVal Data As String, ByVal key As String) As String
            Return Encoding.Default.GetString(Crypt(Encoding.Default.GetBytes(Data), Encoding.Default.GetBytes(key)))
        End Function
        Public Shared Function Crypt(ByVal Data() As Byte, ByVal key() As Byte) As Byte()
            For i = 0 To Data.Length - 1
                Data(i) = CByte(CInt((Data(i)) + CInt(Data((i + 1) Mod Data.Length))) Mod 256) Xor key(i Mod key.Length)
            Next
            Return Data
        End Function
        Public Shared Function DeCrypt(ByVal Data As String, ByVal key As String) As String
            Return Encoding.Default.GetString(DeCrypt(Encoding.Default.GetBytes(Data), Encoding.Default.GetBytes(key)))
        End Function
        Public Shared Function DeCrypt(ByVal Data() As Byte, ByVal key() As Byte) As Byte()
            For i = Data.Length - 1 To 0 Step -1
                Data(i) = CByte((CInt(Data(i) Xor key(i Mod key.Length)) - CInt(Data((i + 1) Mod Data.Length)) + 256) Mod 256)
            Next
            Return Data
        End Function
    End Class
    Shared Function AESEncrypt(ByVal InputEncrypt As Byte())
        Using A As New System.Security.Cryptography.RC2CryptoServiceProvider
            A.IV = New Byte() {8, 7, 6, 5, 4, 3, 2, 1}
            A.Key = New Byte() {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 1, 2, 3, 4, 5}
            Return A.CreateEncryptor.TransformFinalBlock(InputEncrypt, 0, InputEncrypt.Length)
        End Using
    End Function
    Public Shared Function RijndaelDecrypt(ByVal Decrypt As String, ByVal Key As String)

        Dim oAesProvider As New RijndaelManaged

        Dim btCipher() As Byte

        Dim btSalt() As Byte = New Byte() {1, 2, 3, 4, 5, 6, 7, 8}

        Dim oKeyGenerator As New Rfc2898DeriveBytes(Key, btSalt)

        oAesProvider.Key = oKeyGenerator.GetBytes(oAesProvider.Key.Length)

        oAesProvider.IV = oKeyGenerator.GetBytes(oAesProvider.IV.Length)

        Dim ms As New IO.MemoryStream

        Dim cs As New CryptoStream(ms, oAesProvider.CreateDecryptor(), CryptoStreamMode.Write)

        Try

            btCipher = Convert.FromBase64String(Decrypt)

            cs.Write(btCipher, 0, btCipher.Length)

            cs.Close()

            Decrypt = System.Text.Encoding.UTF8.GetString(ms.ToArray)

        Catch

        End Try

        Return Decrypt

    End Function

    Public Class PolyRC4

        Private Key As String = "sad87x6zucigedsjfguycxtiu4e75689374-w24098sdfhj-324iuysdjfbhsdjf"

        Sub New(ByVal EncryptionKey As String)

            Key = EncryptionKey

        End Sub

        Public Function Encrypt(ByVal message As String) As String

            message = XX(message, Key)

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

            Return XX(temp, Key)

        End Function

        Public Shared Function XX(ByVal message As String, ByVal password As String) As String

            Dim i As Integer = 0

            Dim j As Integer = 0

            Dim cipher As New StringBuilder

            Dim returnCipher As String = String.Empty

            Dim sbox As Integer() = New Integer(256) {}

            Dim key As Integer() = New Integer(256) {}

            Dim intLength As Integer = password.Length

            Dim a As Integer = 0

            While a <= 255

                Dim ctmp As Char = (password.Substring((a Mod intLength), 1).ToCharArray()(0))

                key(a) = Microsoft.VisualBasic.Strings.Asc(ctmp)

                sbox(a) = a

                System.Math.Max(System.Threading.Interlocked.Increment(a), a - 1)

            End While

            Dim x As Integer = 0

            Dim b As Integer = 0

            While b <= 255

                x = (x + sbox(b) + key(b)) Mod 256

                Dim tempSwap As Integer = sbox(b)

                sbox(b) = sbox(x)

                sbox(x) = tempSwap

                System.Math.Max(System.Threading.Interlocked.Increment(b), b - 1)

            End While

            a = 1

            While a <= message.Length

                Dim itmp As Integer = 0

                i = (i + 1) Mod 256

                j = (j + sbox(i)) Mod 256

                itmp = sbox(i)

                sbox(i) = sbox(j)

                sbox(j) = itmp

                Dim k As Integer = sbox((sbox(i) + sbox(j)) Mod 256)

                Dim ctmp As Char = message.Substring(a - 1, 1).ToCharArray()(0)

                itmp = Asc(ctmp)

                Dim cipherby As Integer = itmp Xor k

                cipher.Append(Chr(cipherby))

                System.Math.Max(System.Threading.Interlocked.Increment(a), a - 1)

            End While

            returnCipher = cipher.ToString

            cipher.Length = 0

            Return returnCipher

        End Function

    End Class

    Public Class RC2_With_Salt
        'This is a simple way to use salt in a encryption. I modified the RC2 encryption and made it work with salting. 
        Private Shared key As Byte() 'To hold out secret encryption key!
        Private Shared RC2 As New RC2CryptoServiceProvider

        Public Shared Function Encrypt(ByVal input As String, ByVal password As String, ByVal salt As String, ByVal length As Integer) As Byte() 'Encrypting function.
            Dim input_b As Byte() = System.Text.Encoding.Default.GetBytes(input) 'Get input bytes...
            Dim pass_b As Byte() = System.Text.Encoding.Default.GetBytes(password) 'Passsword bytes...
            Dim salt_b As Byte() = System.Text.Encoding.Default.GetBytes(salt) 'Geting our input salt bytes...
            key = Generate_key(pass_b, salt_b, length) 'Get our secret value out of password and salt, which we will use as your encryption key!
            Dim salt_to_add As Byte() = Generate_Salt(5) 'We will append our input bytes here....
            Dim input_salt As Byte() = Add_Salt(input_b, salt_to_add) 'Salt bytes + input bytes...
            Dim encrypted As Byte() = En(input_salt) 'Encrypt our bytes...
            Return encrypted 'Call our encrypt function... (this gives us encrypted "salt bytes + input bytes")
        End Function

        Public Shared Function Decrypt(ByVal input As String) As Byte() 'Decrypting function.
            Dim input_salt As Byte() = System.Text.Encoding.Default.GetBytes(input) 'This is encrypted "Salt bytes + input bytes"...
            Dim decrypted As Byte() = De(input_salt) 'Decypts and now we are left with "Salt bytes + input bytes"...
            Dim input_b As Byte() = New Byte(decrypted.Length - 5 - 1) {} 'A new byte whose lenght is equal to "input_b" byte array(byte array of the original plain text)....
            Array.Copy(decrypted, 5, input_b, 0, decrypted.Length - 5) 'As I know my salt's length is 5 so I can get only the "input_b" from the "salt bytes + input bytes" ..
            Return input_b
        End Function

        Public Shared Function Decrypt_with_salt(ByVal input As String) As Byte() 'Just to show you what is happening..xD
            Dim input_salt As Byte() = System.Text.Encoding.Default.GetBytes(input) 'This is encrypted "Salt bytes + input bytes"...
            Dim decrypted As Byte() = De(input_salt) 'Decypts and now we are left with "Salt bytes + input bytes"...
            Return decrypted
        End Function

#Region "Encrypting functions"
        Private Shared Function Generate_key(ByVal password As Byte(), ByVal salt As Byte(), ByVal length As Integer) As Byte()
            Dim key As New PasswordDeriveBytes(password, salt, "SHA1", 1)
            Dim out As Byte() = key.GetBytes(length)
            Return out
        End Function

        Private Shared Function Generate_Salt(ByVal length As Integer) As Byte() 'Generates our random salt using my RNG function...
            Dim R As New RNGCryptoServiceProvider
            Dim out(length - 1) As Byte
            R.GetBytes(out)
            Return out
        End Function

        Private Shared Function Add_Salt(ByVal input As Byte(), ByVal salt As Byte()) As Byte() 'Function to add our salt bytes to input bytes....
            Dim input_salt As Byte() = New Byte(input.Length + salt.Length - 1) {} 'To hold both input bytes and salt bytes...
            Array.Copy(salt, input_salt, salt.Length) 'Copying our salt bytes in "input_salt" array....
            Array.Copy(input, 0, input_salt, salt.Length, input.Length) 'Copying our input bytes too. So now we have "input_salt" as "salt bytes + input bytes"...
            Return input_salt 'This is salt bytes + input bytes....
        End Function
#End Region

#Region "Main Encryption\Decryption functions"
        Public Shared Function En(ByVal input As Byte()) As Byte() 'Original function to encrypt with RC2.
            Dim Crypt As ICryptoTransform = RC2.CreateEncryptor(key, RC2.IV)
            Dim mem As New MemoryStream
            Dim crypto As New CryptoStream(mem, Crypt, CryptoStreamMode.Write)
            Dim out As Byte()
            crypto.Write(input, 0, input.Length)
            crypto.FlushFinalBlock()
            out = mem.ToArray
            Return out
        End Function

        Public Shared Function De(ByVal input As Byte()) As Byte() 'Function to decrypt.
            Dim Crypt As ICryptoTransform = RC2.CreateDecryptor(key, RC2.IV)
            Dim mem As New MemoryStream(input)
            Dim crypto As New CryptoStream(mem, Crypt, CryptoStreamMode.Read)
            Dim out(input.Length - 1) As Byte
            crypto.Read(out, 0, input.Length)
            Return out
        End Function
#End Region
    End Class
    Public Class Rc5
        Public Function Encrypt(ByVal input As String) As String
            Dim r1, r2 As UInteger
            Dim m1 As New IO.MemoryStream()
            Dim m2 As New IO.MemoryStream()

            Dim input_b As Byte() = System.Text.Encoding.Default.GetBytes(input)
            m1.Write(input_b, 0, input_b.Length)
            m1.Seek(0, IO.SeekOrigin.Begin)

            Dim br As New System.IO.BinaryReader(m1)
            Dim bw As New System.IO.BinaryWriter(m2)

            Dim in_l As Long = input.Length
            While in_l > 0
                Try
                    r1 = br.ReadUInt32()
                    Try
                        r2 = br.ReadUInt32()
                    Catch
                        r2 = 0
                    End Try
                Catch
                    r1 = 0 : r2 = 0
                End Try

                Encode(r1, r2, rounds)
                bw.Write(r1)
                bw.Write(r2)

                in_l -= 8
            End While

            m2.Seek(0, IO.SeekOrigin.Begin)

            Return System.Text.Encoding.Default.GetString(m2.ToArray())
        End Function

        Public Function Decrypt(ByVal input As String) As String
            Dim r1, r2 As UInteger
            Dim m1, m2 As New IO.MemoryStream()

            Dim input_b As Byte() = System.Text.Encoding.Default.GetBytes(input)
            m1.Write(input_b, 0, input_b.Length)
            m1.Seek(0, IO.SeekOrigin.Begin)

            Dim br As New System.IO.BinaryReader(m1)
            Dim bw As New System.IO.BinaryWriter(m2)

            Dim in_l As Long = input.Length

            While in_l > 0
                Try
                    r1 = br.ReadUInt32()
                    r2 = br.ReadUInt32()
                    Decode(r1, r2, rounds)

                    If Not (r1 = 0 AndAlso r2 = 0 AndAlso (in_l - 8 <= 0)) Then
                        bw.Write(r1)
                        bw.Write(r2)
                    End If
                    If r2 = 0 AndAlso (in_l - 8 <= 0) Then
                        bw.Write(r1)
                    End If
                    in_l -= 8

                Catch

                End Try
            End While

            m2.Seek(0, IO.SeekOrigin.Begin)
            Return System.Text.Encoding.Default.GetString(m2.ToArray())
        End Function

        Private s As UInteger()
        Private l As UInteger()
        Private b As UInteger, u As UInteger, t As UInteger, c As UInteger
        Private key As Byte()
        Private rounds As Integer

        Public Sub New(ByVal password As String, ByVal round As Integer)
            key = System.Text.Encoding.Default.GetBytes(password)
            rounds = round
            b = CUInt(key.Length)
            u = 4
            t = CUInt(2 * rounds + 2)
            c = Math.Max(b, 1) \ u
            s = New UInteger(2 * rounds + 1) {}
            l = New UInteger(key.Length - 1) {}

            GenerateKey(key, rounds)
        End Sub

        Private Function leftRotate(ByVal x As UInteger, ByVal offset As Integer) As UInteger
            Dim t1 As UInteger, t2 As UInteger
            t1 = x >> (32 - offset)
            t2 = x << offset
            Return t1 Or t2
        End Function

        Private Function RightRotate(ByVal x As UInteger, ByVal offset As Integer) As UInteger
            Dim t1 As UInteger, t2 As UInteger
            t1 = x << (32 - offset)
            t2 = x >> offset
            Return t1 Or t2
        End Function

        Private Sub Encode(ByRef r1 As UInteger, ByRef r2 As UInteger, ByVal rounds As Integer)
            r1 = r1 + s(0)
            r2 = r2 + s(1)
            For i As Integer = 1 To rounds
                r1 = leftRotate(r1 Xor r2, CInt(r2)) + s(2 * i)
                r2 = leftRotate(r2 Xor r1, CInt(r1)) + s(2 * i + 1)
            Next
        End Sub

        Private Sub Decode(ByRef r1 As UInteger, ByRef r2 As UInteger, ByVal rounds As Integer)
            For i As Integer = rounds To 1 Step -1
                r2 = (RightRotate(r2 - s(2 * i + 1), CInt(r1))) Xor r1
                r1 = (RightRotate(r1 - s(2 * i), CInt(r2))) Xor r2
            Next
            r2 = r2 - s(1)
            r1 = r1 - s(0)
        End Sub

        Private Sub GenerateKey(ByVal key As Byte(), ByVal rounds As Integer)
            Dim P32 As UInteger = UInteger.Parse("b7e15163", System.Globalization.NumberStyles.HexNumber)
            Dim Q32 As UInteger = UInteger.Parse("9e3779b9", System.Globalization.NumberStyles.HexNumber)

            For i As Integer = key.Length - 1 To 0 Step -1
                l(i) = leftRotate(CUInt(i), 8) + key(i)
            Next

            s(0) = P32
            For i As Integer = 1 To t - 1
                s(i) = s(i - 1) + Q32
            Next

            Dim ii As UInteger, jj As UInteger
            ii = 0 : jj = 0
            Dim x As UInteger, y As UInteger
            x = 0 : y = 0
            Dim v As UInteger = 3 * Math.Max(t, c)

            For counter As Integer = 0 To v
                x = s(ii) = leftRotate((s(ii) + x + y), 3)
                y = l(jj) = leftRotate((l(jj) + x + y), CInt(x + y))
                ii = (ii + 1) Mod t
                jj = (jj + 1) Mod c
            Next
        End Sub
    End Class
    Public Class XTea
        Private Shared f_key As UInteger()

        Public Shared Function Encrypt(ByVal input As String, ByVal Pass As String) As String

            f_key = FormatKey(Pass)

            If input.Length = 0 Then
                Throw New ArgumentException("Invalid input length!")
            End If

            If input.Length Mod 2 <> 0 Then
                input += ControlChars.NullChar
            End If

            Dim dataBytes As Byte() = System.Text.ASCIIEncoding.ASCII.GetBytes(input)

            Dim cipher As String = String.Empty
            Dim tempData As UInteger() = New UInteger(1) {}
            For i As Integer = 0 To dataBytes.Length - 1 Step 2
                tempData(0) = dataBytes(i)
                tempData(1) = dataBytes(i + 1)
                code(tempData, f_key)
                cipher += ConvertUIntToString(tempData(0)) + ConvertUIntToString(tempData(1))
            Next

            Return cipher
        End Function

        Public Shared Function Decrypt(ByVal Data As String, ByVal Pass As String) As String
            f_key = FormatKey(Pass)
            Dim x As Integer = 0
            Dim tempData As UInteger() = New UInteger(1) {}
            Dim dataBytes As Byte() = New Byte((Data.Length \ 8) * 2 - 1) {}
            For i As Integer = 0 To Data.Length - 1 Step 8
                tempData(0) = ConvertStringToUInt(Data.Substring(i, 4))
                tempData(1) = ConvertStringToUInt(Data.Substring(i + 4, 4))
                decode(tempData, f_key)
                dataBytes(x) = CByte(tempData(0))
                x += 1
                dataBytes(x) = CByte(tempData(1))
                x += 1
            Next
            Dim decipheredString As String = System.Text.ASCIIEncoding.ASCII.GetString(dataBytes, 0, dataBytes.Length)
            If decipheredString(decipheredString.Length - 1) = ControlChars.NullChar Then
                decipheredString = decipheredString.Substring(0, decipheredString.Length - 1)
            End If
            Return decipheredString
        End Function

        Private Shared Function FormatKey(ByVal Key As String) As UInteger()
            If Key.Length <= 5 Then
                Throw New ArgumentException("Key must be between 6 and 16 characters in length")
            End If

            Key = Key.PadRight(16, " "c).Substring(0, 16)

            Dim formattedKey As UInteger() = New UInteger(4) {}

            Dim j As Integer = 0
            For i As Integer = 0 To Key.Length - 1 Step 4
                formattedKey(j) = ConvertStringToUInt(Key.Substring(i, 4))
                j += 1
            Next
            Return formattedKey
        End Function

        Private Shared Sub code(ByVal v As UInteger(), ByVal k As UInteger())
            Dim y As UInteger = v(0)
            Dim z As UInteger = v(1)
            Dim sum As UInteger = 0
            Dim delta As UInteger = &H9E3779B9UI

            For i = 0 To 31
                y += (z << 4 Xor z >> 5) + z Xor sum + k(sum And 3)
                sum += delta
                z += (y << 4 Xor y >> 5) + y Xor sum + k(sum >> 11 And 3)
            Next

            v(0) = y
            v(1) = z
        End Sub

        Private Shared Sub decode(ByVal v As UInteger(), ByVal k As UInteger())
            Dim y As UInteger = v(0)
            Dim z As UInteger = v(1)
            Dim sum As UInteger = &HC6EF3720UI
            Dim delta As UInteger = &H9E3779B9UI

            For i = 0 To 31
                z -= (y << 4 Xor y >> 5) + y Xor sum + k(sum >> 11 And 3)
                sum -= delta
                y -= (z << 4 Xor z >> 5) + z Xor sum + k(sum And 3)
            Next

            v(0) = y
            v(1) = z
        End Sub

        Private Shared Function ConvertStringToUInt(ByVal Input As String) As System.UInt32
            Dim output As UInt32
            output = Convert.ToUInt32(Input(0))
            output += (Convert.ToUInt32(Input(1)) << 8)
            output += (Convert.ToUInt32(Input(2)) << 16)
            output += (Convert.ToUInt32(Input(3)) << 24)
            Return output
        End Function
        Private Shared Function ConvertUIntToString(ByVal Input As System.UInt32) As String
            Dim output As New System.Text.StringBuilder()
            output.Append(Convert.ToChar(Input And &HFF))
            output.Append(Convert.ToChar((Input >> 8) And &HFF))
            output.Append(Convert.ToChar((Input >> 16) And &HFF))
            output.Append(Convert.ToChar((Input >> 24) And &HFF))
            Return output.ToString()
        End Function

    End Class
End Class
