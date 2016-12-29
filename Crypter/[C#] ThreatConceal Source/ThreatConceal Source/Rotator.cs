using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.Runtime.CompilerServices;
using System.Windows.Forms;
using Microsoft.VisualBasic.CompilerServices;

namespace CybeR_CryptZ
{

    [ProvideProperty("Frame", typeof(System.Windows.Forms.Control))]
    internal class Rotator : Component, IExtenderProvider
    {

        private byte _CurrentFrame;
        private Hashtable children;

        private static List<WeakReference> __ENCList;

        public byte CurrentFrame
        {
            get
            {
                return _CurrentFrame;
            }
            set
            {
                bool flag;
                IEnumerator ienumerator;

                _CurrentFrame = value;
                try
                {
                    ienumerator = children.Keys.GetEnumerator();
                    while (flag)
                    {
                        Control control = (Control)ienumerator.Current;
                        byte b = Conversions.ToByte(children[control]);
                        control.Visible = (b != _CurrentFrame) && (b != 255) ? true : false;
                        flag = ienumerator.MoveNext();
                    }
                }
                finally
                {
                    flag = (ienumerator as IDisposable) != null;
                    if (flag)
                        (ienumerator as IDisposable).Dispose();
                }
            }
        }

        [DebuggerNonUserCode]
        static Rotator()
        {
            Rotator.__ENCList = new List<WeakReference>();
        }

        public Rotator()
        {
            Rotator.__ENCAddToList(this);
            children = new Hashtable();
        }

        bool IExtenderProvider.CanExtend(object c)
        {
            bool flag1;

            bool flag2 = (c is Control) && c is Form ? true : false;
            if (flag2)
            {
                flag1 = false;
            }
            else
            {
                flag2 = !children.Contains(RuntimeHelpers.GetObjectValue(c));
                if (flag2)
                {
                    children.Add(RuntimeHelpers.GetObjectValue(c), 0);
                    ((Control)c).HandleCreated += new EventHandler(HandleCreated);
                }
                flag1 = true;
            }
            return flag1;
        }

        public byte GetFrame(Control c)
        {
            return Conversions.ToByte(children[c]);
        }

        private void HandleCreated(object s, EventArgs e)
        {
            // trial
        }

        public void SetFrame(Control c, byte v)
        {
            // trial
        }

        [DebuggerNonUserCode]
        private static void __ENCAddToList(object value)
        {
            // trial
        }

    } // class Rotator

}

