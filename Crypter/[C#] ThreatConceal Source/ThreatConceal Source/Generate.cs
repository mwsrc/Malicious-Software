using System;
using System.Diagnostics;
using Microsoft.VisualBasic;
using Microsoft.VisualBasic.CompilerServices;

namespace CybeR_CryptZ
{

    [StandardModule]
    internal sealed class Generate
    {

        public class keyc
        {

            [DebuggerNonUserCode]
            public keyc()
            {
            }

            public static object Key()
            {
                short sh3;
                object obj;

                string s = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
                short sh2 = checked((short)Conversions.ToInteger("22"));
                short sh1 = 1;
                while (sh1 <= sh3)
                {
                    obj = Operators.ConcatenateObject(obj, Strings.Mid(s, checked((int)Math.Round((double)Conversion.Int((VBMath.Rnd() * (float)Strings.Len(s)) + 1.0F))), 1));
                    sh1 = checked((short)(sh1 + 1));
                    sh3 = sh2;
                }
                return obj;
            }

        } // class keyc

    } // class Generate

}

