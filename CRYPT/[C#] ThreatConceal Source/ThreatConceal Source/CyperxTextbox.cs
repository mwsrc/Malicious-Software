using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
using System.Runtime.CompilerServices;
using System.Windows.Forms;

namespace CybeR_CryptZ
{

    public class CyperxTextbox : Control
    {

        private Color Bg;
        private bool DrawRounded;
        private Color FC;
        private Pen p;
        private Color PC2;
        private bool Pwbox;
        private SolidBrush sb;
        private TextBox tbox;

        private static List<WeakReference> __ENCList;

        public bool Rounded
        {
            get
            {
                return DrawRounded;
            }
            set
            {
                DrawRounded = value;
            }
        }

        public bool UseSystemPasswordChar
        {
            get
            {
                return Pwbox;
            }
            set
            {
                Color color;
                Point point1;

                Pwbox = value;
                tbox = null;
                tbox = new TextBox();
                tbox.Text = Text;
                tbox.BorderStyle = BorderStyle.None;
                tbox.BackColor = Bg;
                Point point2 = new Point(3, 4);
                tbox.Location = point2;
                tbox.Width = checked(Width - 7);
                tbox.Font = Font;
                tbox.UseSystemPasswordChar = Pwbox;
                tbox.ForeColor = FC;
                Controls.Add(tbox);
                tbox.TextChanged += new EventHandler(_Lambda$__3);
            }
        }

        [DebuggerNonUserCode]
        static CyperxTextbox()
        {
            CyperxTextbox.__ENCList = new List<WeakReference>();
        }

        public CyperxTextbox()
        {
            Color color;
            Point point1;

            CyperxTextbox.__ENCAddToList(this);
            Bg = Color.FromArgb(28, 28, 28);
            PC2 = Color.FromArgb(83, 83, 83);
            FC = Color.FromArgb(124, 195, 255);
            Pwbox = false;
            DrawRounded = true;
            Text = "";
            tbox = null;
            tbox = new TextBox();
            tbox.Text = Text;
            tbox.BorderStyle = BorderStyle.None;
            tbox.BackColor = Bg;
            Point point2 = new Point(3, 4);
            tbox.Location = point2;
            tbox.Width = checked(Width - 7);
            tbox.Font = Font;
            tbox.UseSystemPasswordChar = Pwbox;
            tbox.ForeColor = FC;
            Controls.Add(tbox);
            tbox.TextChanged += new EventHandler(_Lambda$__2);
        }

        [DebuggerStepThrough]
        [CompilerGenerated]
        private void _Lambda$__2(object a0, EventArgs a1)
        {
            TextChange();
        }

        [DebuggerStepThrough]
        [CompilerGenerated]
        private void _Lambda$__3(object a0, EventArgs a1)
        {
            // trial
        }

        private void TextChange()
        {
            Text = tbox.Text;
        }

        protected override void OnPaint(PaintEventArgs e)
        {
            // trial
        }

        [DebuggerNonUserCode]
        private static void __ENCAddToList(object value)
        {
            // trial
        }

    } // class CyperxTextbox

}

