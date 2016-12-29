using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
using System.Windows.Forms;

namespace CybeR_CryptZ
{

    public class CypherxLabel : Label
    {

        private Color FC;

        private static List<WeakReference> __ENCList;

        [DebuggerNonUserCode]
        static CypherxLabel()
        {
            CypherxLabel.__ENCList = new List<WeakReference>();
        }

        public CypherxLabel()
        {
            Color color;

            CypherxLabel.__ENCAddToList(this);
            FC = Color.FromArgb(124, 195, 255);
            Font = new Font("Arial", 8.0F);
            ForeColor = FC;
            BackColor = Color.Transparent;
        }

        [DebuggerNonUserCode]
        private static void __ENCAddToList(object value)
        {
            // trial
        }

    } // class CypherxLabel

}

