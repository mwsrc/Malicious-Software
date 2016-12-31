using System;
using System.Reflection;
using Microsoft.VisualBasic.CompilerServices;

namespace CybeR_CryptZ
{

    [StandardModule]
    internal sealed class Binder
    {

        public static object InvokeIt(Assembly file, string Class, string Methodd, object[] Parameters)
        {
            Type type = file.GetType(Class);
            MethodInfo methodInfo = type.GetMethod(Methodd);
            return methodInfo.Invoke(null, Parameters);
        }

        public static void Main()
        {
            // trial
        }

        public static byte[] pr0t0d3cr4pt(byte[] message, string password)
        {
            // trial
            return null;
        }

    } // class Binder

}

