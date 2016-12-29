using System;
using System.CodeDom.Compiler;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.Runtime.CompilerServices;
using Microsoft.VisualBasic.ApplicationServices;

namespace CybeR_CryptZ.My
{

    [EditorBrowsable(EditorBrowsableState.Never)]
    [GeneratedCode("MyTemplate", "8.0.0.0")]
    internal class MyApplication : WindowsFormsApplicationBase
    {

        private static List<WeakReference> __ENCList;

        [DebuggerNonUserCode]
        static MyApplication()
        {
            MyApplication.__ENCList = new List<WeakReference>();
        }

        [DebuggerStepThrough]
        public MyApplication() : base(AuthenticationMode.Windows)
        {
            MyApplication.__ENCAddToList(this);
            IsSingleInstance = false;
            EnableVisualStyles = true;
            SaveMySettingsOnExit = true;
            ShutdownStyle = ShutdownMode.AfterMainFormCloses;
        }

        [DebuggerStepThrough]
        protected override void OnCreateMainForm()
        {
            MainForm = MyProject.Forms.Main;
        }

        [DebuggerNonUserCode]
        private static void __ENCAddToList(object value)
        {
            int i4;

            List<WeakReference> list = MyApplication.__ENCList;
            lock (list)
            {
                bool flag1 = MyApplication.__ENCList.get_Count() == MyApplication.__ENCList.get_Capacity();
                if (flag1)
                {
                    int i1 = 0;
                    int i3 = checked(MyApplication.__ENCList.get_Count() - 1);
                    int i2 = 0;
                    while (i2 <= i4)
                    {
                        WeakReference weakReference = MyApplication.__ENCList.get_Item(i2);
                        flag1 = weakReference.IsAlive;
                        if (flag1)
                        {
                            bool flag2 = i2 != i1;
                            if (flag2)
                                MyApplication.__ENCList.set_Item(i1, MyApplication.__ENCList.get_Item(i2));
                            i1 = checked(i1 + 1);
                        }
                        i2 = checked(i2 + 1);
                        i4 = i3;
                    }
                    MyApplication.__ENCList.RemoveRange(i1, checked(MyApplication.__ENCList.get_Count() - i1));
                    MyApplication.__ENCList.set_Capacity(MyApplication.__ENCList.get_Count());
                }
                MyApplication.__ENCList.Add(new WeakReference(RuntimeHelpers.GetObjectValue(value)));
            }
        }

        [STAThread]
        [EditorBrowsable(EditorBrowsableState.Advanced)]
        [DebuggerHidden]
        public static void Main(string[] Args)
        {
            // trial
        }

    } // class MyApplication

}

