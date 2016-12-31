using System.Diagnostics;
using System.IO;

namespace CybeR_CryptZ
{

    public class Obfuscator
    {

        [DebuggerNonUserCode]
        public Obfuscator()
        {
        }

        public static void Dexcator(string path)
        {
            // decompiler error
        }

        public static void Eazfuscator(string path)
        {
            // trial
        }

        public static void NT_Headers(string Path)
        {
            FileStream fileStream = new FileStream(Path, FileMode.Open, FileAccess.Write);
            try
            {
                fileStream.Seek((long)244, SeekOrigin.Begin);
                fileStream.WriteByte(10);
                fileStream.Close();
            }
            finally
            {
                bool flag = fileStream != null;
                if (flag)
                    fileStream.Dispose();
            }
        }

    } // class Obfuscator

}

