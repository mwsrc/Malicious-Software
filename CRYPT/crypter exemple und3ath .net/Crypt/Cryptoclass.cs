using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Security.Cryptography;
using System.Reflection;
using System.IO;


namespace Crypt
{
    class Cryptoclass
    {


     
        public static byte[] RijndaelEncrypt(byte[] bytes, string Key)
        {
            MemoryStream memoryStream;
            CryptoStream cryptoStream;
            Rijndael rijndael = Rijndael.Create();
            Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(Key,
                new byte[] { 0x26, 0xdc, 0xff, 0x00, 0xad, 0xed, 0x7a, 0xee, 0xc5, 0xfe, 0x07, 0xaf, 0x4d, 0x08, 0x22, 0x3c });
            rijndael.Key = pdb.GetBytes(32);
            rijndael.IV = pdb.GetBytes(16);
            memoryStream = new MemoryStream();
            cryptoStream = new CryptoStream(memoryStream, rijndael.CreateEncryptor(), CryptoStreamMode.Write);
            cryptoStream.Write(bytes, 0, bytes.Length);
            cryptoStream.Close();
            return memoryStream.ToArray();
        }
        public static byte[] PolyStairsCrypt(byte[] Data, string key)
        {
            byte[] Key = System.Text.Encoding.ASCII.GetBytes(key);
            Array.Resize(ref Data, Data.Length + 1);
            Data[Data.Length - 1] = (byte)new Random().Next(1, 255);
            for (int i = Data.Length; i >= 0; i += -1)
            {
                Data[i % Data.Length] = (byte)(byte)(((int)((Data[i % Data.Length]) + (int)(Data[(i + 1) % Data.Length])) % 256) ^ Key[i % Key.Length]);
            }
            return Data;
        }
        public static byte[] PolyRevCrypt(byte[] data, string pass)
        {
            byte rndByte = (byte)new Random().Next(1, 255);
            byte[] passByte = System.Text.Encoding.ASCII.GetBytes(pass);
            byte[] Out = new byte[data.Length + 1];
            int u = 0;
            for (int i = 0; i <= data.Length - 1; i++)
            {
                Out[i] = (byte)((data[i] ^ passByte[u]) ^ rndByte);
                Array.Reverse(passByte);
                if (u == passByte.Length - 1) u = 0;
                else u += 1;
            }
            Array.Resize(ref Out, Out.Length);
            Out[Out.Length - 1] = rndByte;
            Array.Reverse(Out);
            return Out;
        }
        public static byte[] PolyBenc(byte[] byte_0, string string_0)
        {
            byte[] bytes = Encoding.ASCII.GetBytes(string_0);
            byte[] array = new byte[byte_0.Length + 1];
            int num = new Random().Next(1, 255);
            for (int i = 0; i <= byte_0.Length - 1; i++)
            {
                array[i] = (byte)((int)byte_0[i] ^ ((int)bytes[i % bytes.Length] + num & 255));
            }
            array[byte_0.Length] = (byte)num;
            return array;
        }
        public static byte[] DexEncrypt(byte[] byte_0, string string_0)               //Fonction de cryptage  
        {
            byte[] bytes = Encoding.ASCII.GetBytes(string_0);
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
        public static byte[] RC4EncryptDecrypt(byte[] bytes, string Key)
        {
            byte[] key = System.Text.Encoding.ASCII.GetBytes(Key);
            byte[] s = new byte[256];
            byte[] k = new byte[256];
            byte temp;
            int i, j;

            for (i = 0; i < 256; i++)
            {
                s[i] = (byte)i;
                k[i] = key[i % key.GetLength(0)];
            }

            j = 0;
            for (i = 0; i < 256; i++)
            {
                j = (j + s[i] + k[i]) % 256;
                temp = s[i];
                s[i] = s[j];
                s[j] = temp;
            }

            i = j = 0;
            for (int x = 0; x < bytes.GetLength(0); x++)
            {
                i = (i + 1) % 256;
                j = (j + s[i]) % 256;
                temp = s[i];
                s[i] = s[j];
                s[j] = temp;
                int t = (s[i] + s[j]) % 256;
                bytes[x] ^= s[t];
            }
            return bytes;
        }
        public static byte[] SymetricEnc(byte[] byte_0, string string_0)
        {
            SymmetricAlgorithm symmetricAlgorithm = SymmetricAlgorithm.Create();
            MemoryStream memoryStream = new MemoryStream();
            byte[] bytes = Encoding.ASCII.GetBytes(string_0);
            byte[] rgbIV = bytes;
            CryptoStream cryptoStream = new CryptoStream(memoryStream, symmetricAlgorithm.CreateEncryptor(bytes, rgbIV), CryptoStreamMode.Write);
            cryptoStream.Write(byte_0, 0, byte_0.Length);
            cryptoStream.Close();
            return memoryStream.ToArray();
        }
        public static byte[] CloudEnc(byte[] byte_0, string string_0)
        {
            byte[] bytes = Encoding.ASCII.GetBytes(string_0);
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
    }
}
