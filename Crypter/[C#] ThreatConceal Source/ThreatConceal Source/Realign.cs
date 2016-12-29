using System.Diagnostics;

namespace CybeR_CryptZ
{

    internal class Realign
    {

        private struct IMAGE_DATA_DIRECTORY
        {

            public uint Size;
            public uint VirtualAddress;

        }

        private struct IMAGE_DOS_HEADER
        {

            public ushort e_cblp;
            public ushort e_cp;
            public ushort e_cparhdr;
            public ushort e_crlc;
            public ushort e_cs;
            public ushort e_csum;
            public ushort e_ip;
            public int e_lfanew;
            public ushort e_lfarlc;
            public ushort e_magic;
            public ushort e_maxalloc;
            public ushort e_minalloc;
            public ushort e_oemid;
            public ushort e_oeminfo;
            public ushort e_ovno;
            [MarshalAs(UnmanagedType.ByValArray, SizeConst = 4)]
            public ushort[] e_res1;
            [MarshalAs(UnmanagedType.ByValArray, SizeConst = 10)]
            public ushort[] e_res2;
            public ushort e_sp;
            public ushort e_ss;

        }

        private struct IMAGE_FILE_HEADER
        {

            public ushort Characteristics;
            public ushort Machine;
            public ushort NumberOfSections;
            public uint NumberOfSymbols;
            public uint PointerToSymbolTable;
            public ushort SizeOfOptionalHeader;
            public uint TimeDateStamp;

        }

        private struct IMAGE_NT_HEADERS
        {

            public Realign.IMAGE_FILE_HEADER FileHeader;
            public Realign.IMAGE_OPTIONAL_HEADER32 OptionalHeader;
            public uint Signature;

        }

        private struct IMAGE_OPTIONAL_HEADER32
        {

            public uint AddressOfEntryPoint;
            public uint BaseOfCode;
            public uint BaseOfData;
            public uint CheckSum;
            [MarshalAs(UnmanagedType.ByValArray, SizeConst = 16)]
            public Realign.IMAGE_DATA_DIRECTORY[] DataDirectory;
            public ushort DllCharacteristics;
            public uint FileAlignment;
            public uint ImageBase;
            public uint LoaderFlags;
            public ushort Magic;
            public ushort MajorImageVersion;
            public byte MajorLinkerVersion;
            public ushort MajorOperatingSystemVersion;
            public ushort MajorSubsystemVersion;
            public ushort MinorImageVersion;
            public byte MinorLinkerVersion;
            public ushort MinorOperatingSystemVersion;
            public ushort MinorSubsystemVersion;
            public uint NumberOfRvaAndSizes;
            public uint SectionAlignment;
            public uint SizeOfCode;
            public uint SizeOfHeaders;
            public uint SizeOfHeapCommit;
            public uint SizeOfHeapReserve;
            public uint SizeOfImage;
            public uint SizeOfInitializedData;
            public uint SizeOfStackCommit;
            public uint SizeOfStackReserve;
            public uint SizeOfUninitializedData;
            public ushort Subsystem;
            public uint Win32VersionValue;

        }

        private struct IMAGE_SECTION_HEADER
        {

            public uint Characteristics;
            [MarshalAs(UnmanagedType.ByValArray, SizeConst = 8)]
            public byte[] Name;
            public short NumberOfLinenumbers;
            public short NumberOfRelocations;
            public uint PointerToLinenumbers;
            public uint PointerToRawData;
            public uint PointerToRelocations;
            public uint SizeOfRawData;
            public uint VirtualAddress;
            public UIntPtr VirtualSize;

        }

        [DebuggerNonUserCode]
        public Realign()
        {
        }

        private long Align(long dwValue, long dwAlign)
        {
            long l;

            bool flag1 = (int)dwAlign != 0;
            if (flag1)
            {
                bool flag2 = ((int)dwValue % (int)dwAlign) != 0;
                if (flag2)
                {
                    return checked(checked(dwValue + dwAlign) - (dwValue % dwAlign));
                }
                else
                {
                    return dwValue;
                }
            }
            else
            {
                return dwValue;
            }
            return l;
        }

        private byte[] getBytes_(object oObject)
        {
            // trial
            return null;
        }

        public bool RealignPE(string sFilePath)
        {
            // decompiler error
        }

    } // class Realign

}

