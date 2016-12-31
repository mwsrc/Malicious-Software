using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
using System.Windows.Forms;

namespace CybeR_CryptZ
{

    public class Popup : Control
    {

        private string _item;
        private string[] _items;
        private Color BC1;
        private Color BC2;
        private Color FC;
        private bool Input;
        private List<Rectangle> ListOfRec;
        private bool MyMousedown;
        private Pen p;
        private Color PC1;
        private Color PC2;
        private SolidBrush SB;
        private Rectangle SelectedReg;
        private bool Shown;
        private string Temp_item;

        private static List<WeakReference> __ENCList;

        public string SelectedItem
        {
            get
            {
                return _item;
            }
            set
            {
                _item = value;
            }
        }

        public bool Showing
        {
            get
            {
                return Shown;
            }
        }

        [DebuggerNonUserCode]
        static Popup()
        {
            Popup.__ENCList = new List<WeakReference>();
        }

        public Popup()
        {
            Popup.__ENCAddToList(this);
            ListOfRec = new List<Rectangle>();
            MyMousedown = false;
            Shown = false;
            SelectedReg = new Rectangle(0, 0, 0, 0);
            Input = false;
            _item = "";
            BC1 = Color.FromArgb(90, 90, 90);
            BC2 = Color.FromArgb(71, 71, 71);
            PC1 = Color.FromArgb(50, 50, 50);
            PC2 = Color.FromArgb(83, 83, 83);
            FC = Color.FromArgb(124, 195, 255);
            Temp_item = "";
            throw new Exception("You can't add this direct to the Designer!");
        }

        public Popup(string[] items)
        {
            Popup.__ENCAddToList(this);
            ListOfRec = new List<Rectangle>();
            MyMousedown = false;
            Shown = false;
            SelectedReg = new Rectangle(0, 0, 0, 0);
            Input = false;
            _item = "";
            BC1 = Color.FromArgb(90, 90, 90);
            BC2 = Color.FromArgb(71, 71, 71);
            PC1 = Color.FromArgb(50, 50, 50);
            PC2 = Color.FromArgb(83, 83, 83);
            FC = Color.FromArgb(124, 195, 255);
            Temp_item = "";
            DoubleBuffered = true;
            _items = items;
            FixWidth();
            FixList();
        }

        public void FixList()
        {
            // trial
        }

        public void FixWidth()
        {
            bool flag;

            Graphics graphics = Graphics.FromImage(new Bitmap(1, 1));
            int i1 = 0;
            string[] sArr = _items;
            int i2 = 0;
            while (flag)
            {
                string s = sArr[i2];
                SizeF sizeF1 = graphics.MeasureString(s, Font);
                flag = sizeF1.Width > (float)i1;
                if (flag)
                {
                    SizeF sizeF2 = graphics.MeasureString(s, Font);
                    i1 = checked((int)Math.Round((double)sizeF2.Width));
                }
                i2 = checked(i2 + 1);
                flag = i2 < checked((int)sArr.Length);
            }
            flag = i1 < 85;
            if (flag)
                Width = 95;
            else
                Width = checked(i1 + 9);
        }

        public void WaitForInput()
        {
            // trial
        }

        protected override void OnHandleCreated(EventArgs e)
        {
            Console.WriteLine(TopLevelControl.TopLevelControl);
            BringToFront();
            Shown = true;
            base.OnHandleCreated(e);
        }

        protected override void OnMouseDown(MouseEventArgs e)
        {
            // trial
        }

        protected override void OnMouseLeave(EventArgs e)
        {
            SelectedReg = new Rectangle(0, 0, 0, 0);
            Visible = false;
            Input = true;
            Shown = false;
            base.OnMouseLeave(e);
        }

        protected override void OnMouseMove(MouseEventArgs e)
        {
            bool flag;
            List<Rectangle>.Enumerator enumerator;

            Rectangle rectangle1 = SelectedReg;
            try
            {
                enumerator = ListOfRec.GetEnumerator();
                while (flag)
                {
                    Rectangle rectangle2 = enumerator.get_Current();
                    flag = rectangle2.Contains(e.Location);
                    if (flag)
                        SelectedReg = rectangle2;
                    flag = enumerator.MoveNext();
                }
            }
            finally
            {
                enumerator.Dispose();
            }
            flag = rectangle1 != SelectedReg;
            if (flag)
                Invalidate();
            base.OnMouseMove(e);
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

    } // class Popup

}

