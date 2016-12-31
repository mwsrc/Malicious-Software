using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using Microsoft.VisualBasic.CompilerServices;

namespace CybeR_CryptZ
{

    [StandardModule]
    internal sealed class ResourceWriter
    {

        private static IntPtr ToPtr(object data)
        {
            IntPtr intPtr1;

            GCHandle gchandle = GCHandle.Alloc(RuntimeHelpers.GetObjectValue(data), GCHandleType.Pinned);
            try
            {
                intPtr1 = gchandle.AddrOfPinnedObject();
            }
            finally
            {
                gchandle.Free();
            }
            return intPtr1;
        }

        public static bool WriteResource(string filename, byte[] bytes)
        {
            // decompiler error
        }

        [PreserveSig]
        [DllImport("kernel32.dll", CallingConvention = CallingConvention.Winapi, CharSet = CharSet.Ansi, SetLastError = true)]
        private static extern IntPtr BeginUpdateResource(string pFileName, [MarshalAs(UnmanagedType.Bool)] bool bDeleteExistingResources);

        [PreserveSig]
        [DllImport("kernel32.dll", CallingConvention = CallingConvention.Winapi, CharSet = CharSet.Ansi, SetLastError = true)]
        private static extern bool EndUpdateResource(IntPtr hUpdate, bool fDiscard);

        [PreserveSig]
        [DllImport("kernel32.dll", CallingConvention = CallingConvention.Winapi, CharSet = CharSet.Ansi, SetLastError = true)]
        private static extern bool UpdateResource(IntPtr hUpdate, string lpType, string lpName, ushort wLanguage, IntPtr lpData, uint cbData);

    } // class ResourceWriter

}

