using System;
using System.Diagnostics;
using System.Runtime.InteropServices;
using System.Security;

namespace CybeR_CryptZ
{

    public class IconChanger
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

            private IconChanger.ICONDIR iconDir;
            private IconChanger.ICONDIRENTRY[] iconEntry;
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
                iconDir = new IconChanger.ICONDIR();
            }

            public byte[] CreateIconGroupData(uint iconBaseID)
            {
                int i5;
                IconChanger.BITMAPINFOHEADER bitmapinfoheader;
                IconChanger.GRPICONDIRENTRY grpicondirentry;

                int i2 = checked(Marshal.SizeOf(typeof(IconChanger.ICONDIR)) + checked(Marshal.SizeOf(typeof(IconChanger.GRPICONDIRENTRY)) * ImageCount));
                byte[] bArr2 = new byte[checked(checked(i2 - 1) + 1)];
                GCHandle gchandle1 = GCHandle.Alloc(bArr2, GCHandleType.Pinned);
                Marshal.StructureToPtr(iconDir, gchandle1.AddrOfPinnedObject(), false);
                int i1 = Marshal.SizeOf(iconDir);
                int i4 = checked(ImageCount - 1);
                int i3 = 0;
                while (i3 <= i5)
                {
                    grpicondirentry = new IconChanger.GRPICONDIRENTRY();
                    bitmapinfoheader = new IconChanger.BITMAPINFOHEADER();
                    GCHandle gchandle2 = GCHandle.Alloc(bitmapinfoheader, GCHandleType.Pinned);
                    Marshal.Copy(get_ImageData(i3), 0, gchandle2.AddrOfPinnedObject(), Marshal.SizeOf(typeof(IconChanger.BITMAPINFOHEADER)));
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
                    i1 = checked(i1 + Marshal.SizeOf(typeof(IconChanger.GRPICONDIRENTRY)));
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

            public static IconChanger.IconFile FromFile(string filename)
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
        public IconChanger()
        {
        }

        public static void InjectIcon(string exeFileName, string iconFileName, uint iconGroupID, uint iconBaseID)
        {
            int i3;

            IconChanger.IconFile iconFile = IconChanger.IconFile.FromFile(iconFileName);
            IntPtr intPtr1 = IconChanger.NativeMethods.BeginUpdateResource(exeFileName, false);
            byte[] bArr1 = iconFile.CreateIconGroupData(iconBaseID);
            IntPtr intPtr2 = new IntPtr((long)14);
            IntPtr intPtr3 = new IntPtr(iconGroupID);
            IconChanger.NativeMethods.UpdateResource(intPtr1, intPtr2, intPtr3, 0, bArr1, checked((int)bArr1.Length));
            int i2 = checked(iconFile.ImageCount - 1);
            int i1 = 0;
            while (i1 <= i3)
            {
                byte[] bArr2 = iconFile.get_ImageData(i1);
                intPtr3 = new IntPtr((long)3);
                intPtr2 = new IntPtr(checked((ulong)iconBaseID + (long)i1));
                IconChanger.NativeMethods.UpdateResource(intPtr1, intPtr3, intPtr2, 0, bArr2, checked((int)bArr2.Length));
                i1 = checked(i1 + 1);
                i3 = i2;
            }
            IconChanger.NativeMethods.EndUpdateResource(intPtr1, false);
        }

        public static void InjectIcon(string exeFileName, string iconFileName)
        {
            // trial
        }

    } // class IconChanger

}

