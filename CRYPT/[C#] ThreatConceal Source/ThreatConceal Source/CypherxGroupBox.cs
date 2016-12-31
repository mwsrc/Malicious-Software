using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
using System.Runtime.CompilerServices;
using System.Windows.Forms;

namespace CybeR_CryptZ
{

    public class CypherxGroupBox : Panel
    {

        private string _t;
        private Color Bg;
        private Color FC;
        private Pen p;
        private Color PC2;
        private SolidBrush sb;

        private static List<WeakReference> __ENCList;

        public string Header
        {
            get
            {
                return _t;
            }
            set
            {
                _t = value;
                Invalidate();
            }
        }

        [DebuggerNonUserCode]
        static CypherxGroupBox()
        {
            CypherxGroupBox.__ENCList = new List<WeakReference>();
        }

        public CypherxGroupBox()
        {
            Color color;

            CypherxGroupBox.__ENCAddToList(this);
            Bg = Color.FromArgb(28, 28, 28);
            PC2 = Color.FromArgb(83, 83, 83);
            FC = Color.FromArgb(124, 195, 255);
            _t = "";
            BackColor = Bg;
        }

        protected override void OnPaint(PaintEventArgs e)
        {
            // trial
        }

        [DebuggerNonUserCode]
        private static void __ENCAddToList(object value)
        {
            int i4;

            List<WeakReference> list = CypherxGroupBox.__ENCList;
            lock (list)
            {
                bool flag1 = CypherxGroupBox.__ENCList.get_Count() == CypherxGroupBox.__ENCList.get_Capacity();
                if (flag1)
                {
                    int i1 = 0;
                    int i3 = checked(CypherxGroupBox.__ENCList.get_Count() - 1);
                    int i2 = 0;
                    while (i2 <= i4)
                    {
                        WeakReference weakReference = CypherxGroupBox.__ENCList.get_Item(i2);
                        flag1 = weakReference.IsAlive;
                        if (flag1)
                        {
                            bool flag2 = i2 != i1;
                            if (flag2)
                                CypherxGroupBox.__ENCList.set_Item(i1, CypherxGroupBox.__ENCList.get_Item(i2));
                            i1 = checked(i1 + 1);
                        }
                        i2 = checked(i2 + 1);
                        i4 = i3;
                    }
                    CypherxGroupBox.__ENCList.RemoveRange(i1, checked(CypherxGroupBox.__ENCList.get_Count() - i1));
                    CypherxGroupBox.__ENCList.set_Capacity(CypherxGroupBox.__ENCList.get_Count());
                }
                CypherxGroupBox.__ENCList.Add(new WeakReference(RuntimeHelpers.GetObjectValue(value)));
            }
        }

    } // class CypherxGroupBox

}

