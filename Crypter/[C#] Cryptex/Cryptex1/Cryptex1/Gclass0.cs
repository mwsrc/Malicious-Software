
using System;
using System.IO;
using System.Security.Cryptography;
using System.Text;
namespace Cryptex1
{
    public class GClass0
    {
        public static byte[] smethod_0(byte[] byte_0, string string_0)
        {
            byte[] bytes = System.Text.Encoding.ASCII.GetBytes(string_0);
            byte[] rgbIV = bytes;
            System.Array.Resize<byte>(ref byte_0, byte_0.Length + 1);
            byte_0[byte_0.Length - 1] = (byte)new System.Random().Next(0, 255);
            System.IO.MemoryStream memoryStream = new System.IO.MemoryStream();
            System.Security.Cryptography.RC2CryptoServiceProvider rC2CryptoServiceProvider = new System.Security.Cryptography.RC2CryptoServiceProvider();
            System.Security.Cryptography.CryptoStream cryptoStream = new System.Security.Cryptography.CryptoStream(memoryStream, rC2CryptoServiceProvider.CreateEncryptor(bytes, rgbIV), System.Security.Cryptography.CryptoStreamMode.Write);
            cryptoStream.Write(byte_0, 0, byte_0.Length);
            cryptoStream.FlushFinalBlock();
            return memoryStream.ToArray();
        }
        public static byte[] smethod_1(byte[] byte_0, string string_0)
        {
            System.Array.Resize<byte>(ref byte_0, byte_0.Length + 1);
            byte_0[byte_0.Length - 1] = (byte)new System.Random().Next(0, 255);
            System.Security.Cryptography.SymmetricAlgorithm symmetricAlgorithm = System.Security.Cryptography.SymmetricAlgorithm.Create();
            System.IO.MemoryStream memoryStream = new System.IO.MemoryStream();
            byte[] bytes = System.Text.Encoding.ASCII.GetBytes(string_0);
            byte[] rgbIV = bytes;
            System.Security.Cryptography.CryptoStream cryptoStream = new System.Security.Cryptography.CryptoStream(memoryStream, symmetricAlgorithm.CreateEncryptor(bytes, rgbIV), System.Security.Cryptography.CryptoStreamMode.Write);
            cryptoStream.Write(byte_0, 0, byte_0.Length);
            cryptoStream.Close();
            return memoryStream.ToArray();
        }
        public static byte[] smethod_2(byte[] byte_0, string string_0)
        {
            byte[] buffer3;
            byte[] bytes = Encoding.ASCII.GetBytes(string_0);
            int length = byte_0.Length;
            if (bytes.Length >= length)
            {
                buffer3 = bytes;
            }
            else
            {
                byte[] buffer4 = BitConverter.GetBytes(Math.Round((double)3.1415926535897931, 3));
                byte[] dst = new byte[length];
                Buffer.BlockCopy(bytes, 0, dst, 0, bytes.Length);
                for (int j = bytes.Length; j < length; j++)
                {
                    dst[j] = (byte)((bytes[(j - bytes.Length) % bytes.Length] ^ dst[j - 1]) % 0x100);
                }
                for (int k = 0; k < 5; k++)
                {
                    dst[0] = (byte)(dst[0] ^ buffer4[k]);
                    for (int m = 1; m < dst.Length; m++)
                    {
                        dst[m] = (byte)(((dst[m] ^ ((byte)(buffer4[k] << (m % 3)))) ^ dst[m - 1]) % 0x100);
                    }
                }
                buffer3 = dst;
            }
            byte[] array = byte_0;
            byte num6 = (byte)new Random().Next(0xff);
            Array.Resize<byte>(ref array, byte_0.Length + 1);
            array[array.Length - 1] = num6;
            for (int i = 0; i < (array.Length - 1); i++)
            {
                array[i] = (byte)((array[i] ^ buffer3[i]) ^ num6);
            }
            return array;
        }


        public static byte[] smethod_3(byte[] byte_0, string string_0)
        {
            System.Security.Cryptography.Rijndael rijndael = System.Security.Cryptography.Rijndael.Create();
            System.Security.Cryptography.Rfc2898DeriveBytes rfc2898DeriveBytes = new System.Security.Cryptography.Rfc2898DeriveBytes(string_0, new byte[]
           {
               38, 
               220, 
               255, 
               0, 
               173, 
               237, 
               122, 
               238, 
               197, 
               254, 
               7, 
               175, 
               77, 
               8, 
               34, 
               60
           });
            rijndael.Key = rfc2898DeriveBytes.GetBytes(32);
            rijndael.IV = rfc2898DeriveBytes.GetBytes(16);
            System.IO.MemoryStream memoryStream = new System.IO.MemoryStream();
            System.Security.Cryptography.CryptoStream cryptoStream = new System.Security.Cryptography.CryptoStream(memoryStream, rijndael.CreateEncryptor(), System.Security.Cryptography.CryptoStreamMode.Write);
            cryptoStream.Write(byte_0, 0, byte_0.Length);
            cryptoStream.Close();
            return memoryStream.ToArray();
        }
        public static byte[] smethod_4(byte[] byte_0, string string_0)
        {
            System.Security.Cryptography.SymmetricAlgorithm symmetricAlgorithm = new System.Security.Cryptography.RijndaelManaged();
            System.Security.Cryptography.RNGCryptoServiceProvider rNGCryptoServiceProvider = new System.Security.Cryptography.RNGCryptoServiceProvider();
            symmetricAlgorithm.Mode = System.Security.Cryptography.CipherMode.CBC;
            byte[] bytes = System.Text.Encoding.ASCII.GetBytes(string_0);
            symmetricAlgorithm.GenerateIV();
            byte[] array = new byte[32];
            rNGCryptoServiceProvider.GetBytes(array);
            System.Security.Cryptography.Rfc2898DeriveBytes rfc2898DeriveBytes = new System.Security.Cryptography.Rfc2898DeriveBytes(bytes, array, 2000);
            symmetricAlgorithm.Key = rfc2898DeriveBytes.GetBytes(32);
            System.Security.Cryptography.ICryptoTransform cryptoTransform = symmetricAlgorithm.CreateEncryptor();
            byte[] array2 = cryptoTransform.TransformFinalBlock(byte_0, 0, byte_0.Length);
            int dstOffset = array2.Length;
            System.Array.Resize<byte>(ref array2, array2.Length + array.Length);
            System.Buffer.BlockCopy(array, 0, array2, dstOffset, array.Length);
            dstOffset = array2.Length;
            System.Array.Resize<byte>(ref array2, array2.Length + symmetricAlgorithm.IV.Length);
            System.Buffer.BlockCopy(symmetricAlgorithm.IV, 0, array2, dstOffset, symmetricAlgorithm.IV.Length);
            return array2;
        }
        public static byte[] smethod_5(byte[] byte_0, string string_0)
        {
            int num;
            byte num3;
            byte[] bytes = Encoding.ASCII.GetBytes(string_0);
            byte[] buffer2 = new byte[0x100];
            byte[] buffer3 = new byte[0x100];
            for (num = 0; num < 0x100; num++)
            {
                buffer2[num] = (byte)num;
                buffer3[num] = bytes[num % bytes.GetLength(0)];
            }
            int index = 0;
            for (num = 0; num < 0x100; num++)
            {
                index = ((index + buffer2[num]) + buffer3[num]) % 0x100;
                num3 = buffer2[num];
                buffer2[num] = buffer2[index];
                buffer2[index] = num3;
            }
            num = index = 0;
            for (int i = 0; i < byte_0.GetLength(0); i++)
            {
                num = (num + 1) % 0x100;
                index = (index + buffer2[num]) % 0x100;
                num3 = buffer2[num];
                buffer2[num] = buffer2[index];
                buffer2[index] = num3;
                int num5 = (buffer2[num] + buffer2[index]) % 0x100;
                byte_0[i] = (byte)(byte_0[i] ^ buffer2[num5]);
            }
            return byte_0;
        }

 

 



        public static byte[] smethod_6(byte[] byte_0, string string_0, int int_0)
        {
            byte[] bytes = Encoding.ASCII.GetBytes(string_0);
            for (int i = 0; i < byte_0.Length; i++)
            {
                byte_0[i] = (byte)(byte_0[i] ^ ((byte)((bytes[i % ((int)bytes.Length)] >> ((i + int_0) + bytes.Length)) & 0xff)));
            }
            return byte_0;
        }


        public static byte[] smethod_7(byte[] byte_0, string string_0)
        {
            byte[] bytes = System.Text.Encoding.ASCII.GetBytes(string_0);
            System.Random random = new System.Random();
            int num = random.Next(1, 50);
            byte[] array = new byte[byte_0.Length + 1];
            array[byte_0.Length] = (byte)num;
            short num2 = 0;
            for (int i = 0; i < byte_0.Length; i++)
            {
                if ((int)num2 >= bytes.Length)
                {
                    num2 = 0;
                }
                array[i] = (byte)((int)byte_0[i] + byte_0.Length % bytes.Length + (int)bytes[(int)num2] - num);
                num2 += 1;
            }
            return array;
        }
        public static byte[] smethod_8(byte[] byte_0, string string_0)
        {
            byte[] bytes = System.Text.Encoding.ASCII.GetBytes(string_0);
            System.Array.Resize<byte>(ref byte_0, byte_0.Length + 1);
            byte_0[byte_0.Length - 1] = System.Convert.ToByte(new System.Random().Next(1, 255));
            for (int i = byte_0.Length; i >= 0; i += -1)
            {
                byte_0[i % byte_0.Length] = System.Convert.ToByte((int)(System.Convert.ToByte(System.Convert.ToInt32((int)byte_0[i % byte_0.Length] + System.Convert.ToInt32(byte_0[(i + 1) % byte_0.Length])) % 256) ^ bytes[i % bytes.Length]));
            }
            return byte_0;
        }
        public static byte[] smethod_9(byte[] byte_0, string string_0)
        {
            System.Security.Cryptography.SymmetricAlgorithm symmetricAlgorithm = System.Security.Cryptography.SymmetricAlgorithm.Create();
            System.IO.MemoryStream memoryStream = new System.IO.MemoryStream();
            byte[] bytes = System.Text.Encoding.ASCII.GetBytes(string_0);
            byte[] rgbIV = bytes;
            System.Security.Cryptography.CryptoStream cryptoStream = new System.Security.Cryptography.CryptoStream(memoryStream, symmetricAlgorithm.CreateEncryptor(bytes, rgbIV), System.Security.Cryptography.CryptoStreamMode.Write);
            cryptoStream.Write(byte_0, 0, byte_0.Length);
            cryptoStream.Close();
            return memoryStream.ToArray();
        }
        public static byte[] smethod_10(byte[] byte_0, string string_0)
        {
            System.Security.Cryptography.TripleDESCryptoServiceProvider tripleDESCryptoServiceProvider = new System.Security.Cryptography.TripleDESCryptoServiceProvider();
            tripleDESCryptoServiceProvider.Key = System.Text.Encoding.UTF8.GetBytes(string_0);
            tripleDESCryptoServiceProvider.Mode = System.Security.Cryptography.CipherMode.ECB;
            tripleDESCryptoServiceProvider.Padding = System.Security.Cryptography.PaddingMode.PKCS7;
            System.Security.Cryptography.ICryptoTransform cryptoTransform = tripleDESCryptoServiceProvider.CreateEncryptor();
            byte[] result = cryptoTransform.TransformFinalBlock(byte_0, 0, byte_0.Length);
            tripleDESCryptoServiceProvider.Clear();
            return result;
        }
        public static byte[] smethod_11(byte[] byte_0, string string_0)
        {
            byte num = (byte)new Random().Next(1, 0xff);
            byte[] bytes = Encoding.ASCII.GetBytes(string_0);
            byte[] array = new byte[byte_0.Length + 1];
            int index = 0;
            for (int i = 0; i <= (byte_0.Length - 1); i++)
            {
                array[i] = (byte)((byte_0[i] ^ bytes[index]) ^ num);
                Array.Reverse(bytes);
                if (index == (bytes.Length - 1))
                {
                    index = 0;
                }
                else
                {
                    index++;
                }
            }
            Array.Resize<byte>(ref array, array.Length);
            array[array.Length - 1] = num;
            Array.Reverse(array);
            return array;
        }

 

 

        public static byte[] smethod_12(byte[] byte_0, string string_0, string string_1)
        {
            byte[] bytes = System.Text.Encoding.ASCII.GetBytes(string_1);
            byte[] bytes2 = System.Text.Encoding.ASCII.GetBytes(string_0);
            System.IO.MemoryStream memoryStream = new System.IO.MemoryStream();
            System.Security.Cryptography.RC2CryptoServiceProvider rC2CryptoServiceProvider = new System.Security.Cryptography.RC2CryptoServiceProvider();
            System.Security.Cryptography.CryptoStream cryptoStream = new System.Security.Cryptography.CryptoStream(memoryStream, rC2CryptoServiceProvider.CreateEncryptor(bytes, bytes2), System.Security.Cryptography.CryptoStreamMode.Write);
            cryptoStream.Write(byte_0, 0, byte_0.Length);
            cryptoStream.FlushFinalBlock();
            return memoryStream.ToArray();
        }
        public static byte[] smethod_13(byte[] byte_0, string string_0)
        {
            byte[] bytes = System.Text.Encoding.ASCII.GetBytes(string_0);
            for (int i = 0; i < 5; i++)
            {
                for (int j = 0; j < byte_0.Length; j++)
                {
                    byte_0[j] ^= bytes[j % bytes.Length];
                    for (int k = 0; k < bytes.Length; k++)
                    {
                        byte_0[j] = (byte)((int)byte_0[j] ^ ((int)((int)bytes[k] << (i & 31)) ^ k) + j);
                    }
                }
            }
            return byte_0;
        }
        public static byte[] smethod_14(byte[] byte_0, string string_0)
        {
            byte[] bytes = System.Text.Encoding.ASCII.GetBytes(string_0);
            byte[] array = new byte[byte_0.Length + 1];
            int num = new System.Random().Next(1, 255);
            for (int i = 0; i <= byte_0.Length - 1; i++)
            {
                array[i] = (byte)((int)byte_0[i] ^ ((int)bytes[i % bytes.Length] + num & 255));
            }
            array[byte_0.Length] = (byte)num;
            return array;
        }
        public static byte[] smethod_15(byte[] byte_0, string string_0)
        {
            byte[] bytes = System.Text.Encoding.ASCII.GetBytes(string_0);
            byte[] array = new byte[byte_0.Length];
            short num = 0;
            for (int i = 0; i < byte_0.Length; i++)
            {
                if ((int)num >= bytes.Length)
                {
                    num = 0;
                }
                array[i] = (byte)((int)byte_0[i] + byte_0.Length % bytes.Length + (int)bytes[(int)num]);
                num += 1;
            }
            return array;
        }
        public static byte[] smethod_16(byte[] byte_0, string string_0)
        {
            byte[] bytes = Encoding.ASCII.GetBytes(string_0);
            for (int i = 0; i <= ((byte_0.Length * 2) + bytes.Length); i++)
            {
                byte_0[i % byte_0.Length] = (byte)(((byte)((byte_0[i % byte_0.Length] + byte_0[(i + 1) % byte_0.Length]) % 0x100)) ^ bytes[i % bytes.Length]);
            }
            return byte_0;
        }

 

 

        public static byte[] smethod_17(byte[] byte_0, string string_0)
        {
            byte[] bytes = Encoding.ASCII.GetBytes(string_0);
            for (int i = (byte_0.Length * 2) + bytes.Length; i >= 0; i += -1)
            {
                byte_0[i % byte_0.Length] = (byte)((((byte_0[i % byte_0.Length] ^ bytes[i % bytes.Length]) - byte_0[(i + 1) % byte_0.Length]) + 0x100) % 0x100);
            }
            return byte_0;
        }

 

 

        public static byte[] smethod_18(byte[] byte_0, string string_0)
        {
            System.Security.Cryptography.RijndaelManaged rijndaelManaged = new System.Security.Cryptography.RijndaelManaged();
            byte[] array = new byte[32];
            byte[] sourceArray = new System.Security.Cryptography.MD5CryptoServiceProvider().ComputeHash(System.Text.Encoding.ASCII.GetBytes(string_0));
            System.Array.Copy(sourceArray, 0, array, 0, 16);
            System.Array.Copy(sourceArray, 0, array, 15, 16);
            rijndaelManaged.Key = array;
            rijndaelManaged.Mode = System.Security.Cryptography.CipherMode.ECB;
            System.Security.Cryptography.ICryptoTransform cryptoTransform = rijndaelManaged.CreateEncryptor();
            return cryptoTransform.TransformFinalBlock(byte_0, 0, byte_0.Length);
        }
        public static byte[] smethod_19(byte[] byte_0, string string_0)
        {
            byte[] array = byte_0;
            System.Array.Resize<byte>(ref array, array.Length + 1);
            array[array.Length - 1] = (byte)new System.Random().Next(0, 255);
            System.Security.Cryptography.TripleDESCryptoServiceProvider tripleDESCryptoServiceProvider = new System.Security.Cryptography.TripleDESCryptoServiceProvider();
            tripleDESCryptoServiceProvider.Key = System.Text.Encoding.UTF8.GetBytes(string_0);
            tripleDESCryptoServiceProvider.Mode = System.Security.Cryptography.CipherMode.ECB;
            tripleDESCryptoServiceProvider.Padding = System.Security.Cryptography.PaddingMode.PKCS7;
            System.Security.Cryptography.ICryptoTransform cryptoTransform = tripleDESCryptoServiceProvider.CreateEncryptor();
            byte[] result = cryptoTransform.TransformFinalBlock(array, 0, array.Length);
            tripleDESCryptoServiceProvider.Clear();
            return result;
        }
        public static byte[] smethod_20(byte[] byte_0, string string_0)
        {
            System.Security.Cryptography.TripleDESCryptoServiceProvider tripleDESCryptoServiceProvider = new System.Security.Cryptography.TripleDESCryptoServiceProvider();
            tripleDESCryptoServiceProvider.Key = System.Text.Encoding.UTF8.GetBytes(string_0);
            tripleDESCryptoServiceProvider.Mode = System.Security.Cryptography.CipherMode.ECB;
            tripleDESCryptoServiceProvider.Padding = System.Security.Cryptography.PaddingMode.PKCS7;
            System.Security.Cryptography.ICryptoTransform cryptoTransform = tripleDESCryptoServiceProvider.CreateDecryptor();
            byte[] array = cryptoTransform.TransformFinalBlock(byte_0, 0, byte_0.Length);
            tripleDESCryptoServiceProvider.Clear();
            System.Array.Resize<byte>(ref array, array.Length - 1);
            return array;
        }
        public static byte[] smethod_21(byte[] byte_0, string string_0)
        {
            byte[] array = byte_0;
            System.Array.Resize<byte>(ref array, array.Length + 1);
            array[array.Length - 1] = (byte)new System.Random().Next(0, 255);
            System.Security.Cryptography.DESCryptoServiceProvider dESCryptoServiceProvider = new System.Security.Cryptography.DESCryptoServiceProvider();
            dESCryptoServiceProvider.Key = System.Text.Encoding.UTF8.GetBytes(string_0);
            dESCryptoServiceProvider.Mode = System.Security.Cryptography.CipherMode.ECB;
            dESCryptoServiceProvider.Padding = System.Security.Cryptography.PaddingMode.PKCS7;
            System.Security.Cryptography.ICryptoTransform cryptoTransform = dESCryptoServiceProvider.CreateEncryptor();
            byte[] result = cryptoTransform.TransformFinalBlock(array, 0, array.Length);
            dESCryptoServiceProvider.Clear();
            return result;
        }
        public static byte[] smethod_22(byte[] byte_0, string string_0)
        {
            System.Security.Cryptography.DESCryptoServiceProvider dESCryptoServiceProvider = new System.Security.Cryptography.DESCryptoServiceProvider();
            dESCryptoServiceProvider.Key = System.Text.Encoding.UTF8.GetBytes(string_0);
            dESCryptoServiceProvider.Mode = System.Security.Cryptography.CipherMode.ECB;
            dESCryptoServiceProvider.Padding = System.Security.Cryptography.PaddingMode.PKCS7;
            System.Security.Cryptography.ICryptoTransform cryptoTransform = dESCryptoServiceProvider.CreateDecryptor();
            byte[] array = cryptoTransform.TransformFinalBlock(byte_0, 0, byte_0.Length);
            dESCryptoServiceProvider.Clear();
            System.Array.Resize<byte>(ref array, array.Length - 1);
            return array;
        }
        public static byte[] smethod_23(byte[] byte_0, string string_0)
        {
            System.Array.Resize<byte>(ref byte_0, byte_0.Length + 1);
            byte_0[byte_0.Length - 1] = (byte)new System.Random().Next(0, 255);
            System.Security.Cryptography.Rijndael rijndael = System.Security.Cryptography.Rijndael.Create();
            System.Security.Cryptography.Rfc2898DeriveBytes rfc2898DeriveBytes = new System.Security.Cryptography.Rfc2898DeriveBytes(string_0, new byte[]
           {
               38, 
               220, 
               255, 
               0, 
               173, 
               237, 
               122, 
               238, 
               197, 
               254, 
               7, 
               175, 
               77, 
               8, 
               34, 
               60
           });
            rijndael.Key = rfc2898DeriveBytes.GetBytes(32);
            rijndael.IV = rfc2898DeriveBytes.GetBytes(16);
            System.IO.MemoryStream memoryStream = new System.IO.MemoryStream();
            System.Security.Cryptography.CryptoStream cryptoStream = new System.Security.Cryptography.CryptoStream(memoryStream, rijndael.CreateEncryptor(), System.Security.Cryptography.CryptoStreamMode.Write);
            cryptoStream.Write(byte_0, 0, byte_0.Length);
            cryptoStream.Close();
            return memoryStream.ToArray();
        }
    }
}
