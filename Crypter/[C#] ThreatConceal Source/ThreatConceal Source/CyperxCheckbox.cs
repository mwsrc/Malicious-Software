using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
using System.Runtime.CompilerServices;
using System.Windows.Forms;

namespace CybeR_CryptZ
{

    public class CyperxCheckbox : Control
    {

        private Color BC1;
        private Color BC2;
        private Color Bg;
        private Color FC;
        private Pen p;
        private Color PC1;
        private Color PC2;
        private SolidBrush sb;

        private static List<WeakReference> __ENCList;

        [DebuggerNonUserCode]
        static CyperxCheckbox()
        {
            CyperxCheckbox.__ENCList = new List<WeakReference>();
        }

        public CyperxCheckbox()
        {
            CyperxCheckbox.__ENCAddToList(this);
            Bg = Color.FromArgb(28, 28, 28);
            PC1 = Color.FromArgb(50, 50, 50);
            PC2 = Color.FromArgb(83, 83, 83);
            FC = Color.FromArgb(124, 195, 255);
            BC1 = Color.FromArgb(86, 86, 86);
            BC2 = Color.FromArgb(71, 71, 71);
        }

        protected override void OnPaint(PaintEventArgs e)
        {
            // trial
        }

        protected override void OnPaintBackground(PaintEventArgs pevent)
        {
        }

        [DebuggerNonUserCode]
        private static void __ENCAddToList(object value)
        {
            int i4;

            List<WeakReference> list = CyperxCheckbox.__ENCList;
            lock (list)
            {
                bool flag1 = CyperxCheckbox.__ENCList.get_Count() == CyperxCheckbox.__ENCList.get_Capacity();
                if (flag1)
                {
                    int i1 = 0;
                    int i3 = checked(CyperxCheckbox.__ENCList.get_Count() - 1);
                    int i2 = 0;
                    while (i2 <= i4)
                    {
                        WeakReference weakReference = CyperxCheckbox.__ENCList.get_Item(i2);
                        flag1 = weakReference.IsAlive;
                        if (flag1)
                        {
                            bool flag2 = i2 != i1;
                            if (flag2)
                                CyperxCheckbox.__ENCList.set_Item(i1, CyperxCheckbox.__ENCList.get_Item(i2));
                            i1 = checked(i1 + 1);
                        }
                        i2 = checked(i2 + 1);
                        i4 = i3;
                    }
                    CyperxCheckbox.__ENCList.RemoveRange(i1, checked(CyperxCheckbox.__ENCList.get_Count() - i1));
                    CyperxCheckbox.__ENCList.set_Capacity(CyperxCheckbox.__ENCList.get_Count());
                }
                CyperxCheckbox.__ENCList.Add(new WeakReference(RuntimeHelpers.GetObjectValue(value)));
            }
        }

    } // class CyperxCheckbox

}

