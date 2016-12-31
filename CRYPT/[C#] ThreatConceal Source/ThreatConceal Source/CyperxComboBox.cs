using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
using System.Runtime.CompilerServices;
using System.Threading;
using System.Windows.Forms;
using Microsoft.VisualBasic.CompilerServices;

namespace CybeR_CryptZ
{

    public class CyperxComboBox : Control
    {

        private enum State
        {
            MouseDown,
            MouseEnter,
            MouseLeft,
            Wait
        }

        public delegate void AddX(Control control);
        public delegate void ShowPopD(bool shown);
        public delegate void UpdateTextD(string text);

        private string[] _Items;
        private int _time;
        private int alpha;
        private Color FC;
        private Color GC1;
        private Color GC2;
        private Color GC3;
        private Color GC4;
        private Color GC5;
        private Color GC6;
        private int last;
        private string[] LastItems;
        private CyperxComboBox.State MouseState;
        private Pen P;
        private Color PC1;
        private Color PC2;
        private Popup pop;
        private bool ShowS;
        private Timer t;

        private static List<WeakReference> __ENCList;

        public int FadeInTime
        {
            get
            {
                return _time;
            }
            set
            {
                _time = value;
                t.Interval = checked((int)Math.Round((double)value / 10.0));
            }
        }

        public string[] Items
        {
            get
            {
                return _Items;
            }
            set
            {
                _Items = value;
                Invalidate();
            }
        }

        public bool ShowSeperator
        {
            get
            {
                return ShowS;
            }
            set
            {
                ShowS = value;
                Invalidate();
            }
        }

        [DebuggerNonUserCode]
        static CyperxComboBox()
        {
            CyperxComboBox.__ENCList = new List<WeakReference>();
        }

        public CyperxComboBox()
        {
            Color color;
            Size size1;

            CyperxComboBox.__ENCAddToList(this);
            _time = 200;
            last = 0;
            alpha = 0;
            MouseState = CyperxComboBox.State.MouseLeft;
            GC1 = Color.FromArgb(75, 75, 75);
            GC2 = Color.FromArgb(65, 65, 65);
            GC3 = Color.FromArgb(63, 63, 63);
            GC4 = Color.FromArgb(100, 100, 100);
            GC5 = Color.FromArgb(130, 130, 130);
            GC6 = Color.FromArgb(120, 120, 120);
            PC1 = Color.FromArgb(50, 50, 50);
            PC2 = Color.FromArgb(83, 83, 83);
            FC = Color.FromArgb(124, 195, 255);
            ShowS = true;
            Font = new Font("Arial", 8.0F);
            ForeColor = Color.White;
            Size size2 = new Size(130, 23);
            MinimumSize = size2;
            t = new Timer();
            t.Interval = checked((int)Math.Round((double)_time / 10.0));
            t.Tick += new EventHandler(_Lambda$__4);
        }

        [CompilerGenerated]
        [DebuggerStepThrough]
        private void _Lambda$__4(object a0, EventArgs a1)
        {
            // trial
        }

        public void AddControl(Control control)
        {
            Parent.Controls.Add(control);
        }

        public int CalculateAlpha(int Opacity)
        {
            // trial
            return 0;
        }

        public void FadeIn()
        {
            bool flag = alpha == 255;
            if (flag)
            {
                t.Stop();
            }
            else
            {
                alpha = CalculateAlpha(last);
                Invalidate();
                last = checked(last + 10);
            }
        }

        public void ShowAndWait()
        {
            Point point1;

            bool flag = pop.Showing;
            if (flag)
            {
            }
            else
            {
                pop = null;
                pop = new Popup(_Items);
                Point point3 = Location;
                Point point2 = Location;
                Point point4 = new Point(point3.X, checked(checked(point2.Y + Height) + 2));
                pop.Location = point4;
                object[] objArr = new object[] { pop };
                base.Invoke(new CyperxComboBox.AddX(AddControl), objArr);
                pop.WaitForInput();
                alpha = 0;
                last = 0;
                MouseState = CyperxComboBox.State.MouseLeft;
                flag = Operators.CompareString(pop.SelectedItem, "", false) != 0;
                if (flag)
                {
                    objArr = new object[] { pop.SelectedItem };
                    base.Invoke(new CyperxComboBox.UpdateTextD(UpdateText), objArr);
                }
                else
                {
                    objArr = new object[] { Text };
                    base.Invoke(new CyperxComboBox.UpdateTextD(UpdateText), objArr);
                }
            }
        }

        public void ShowPop(bool show)
        {
            // trial
        }

        public void UpdateText(string text)
        {
            // trial
        }

        protected override void OnHandleCreated(EventArgs e)
        {
            // decompiler error
        }

        protected override void OnMouseDown(MouseEventArgs e)
        {
            MouseState = CyperxComboBox.State.Wait;
            t.Stop();
            alpha = 255;
            Thread thread = new Thread(new ThreadStart(ShowAndWait));
            thread.Start();
            Invalidate();
            base.OnMouseDown(e);
        }

        protected override void OnMouseEnter(EventArgs e)
        {
            bool flag = MouseState != CyperxComboBox.State.Wait;
            if (flag)
            {
                MouseState = CyperxComboBox.State.MouseEnter;
                t.Start();
            }
        }

        protected override void OnMouseLeave(EventArgs e)
        {
            // trial
        }

        protected override void OnMouseUp(MouseEventArgs e)
        {
            // trial
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
            // trial
        }

    } // class CyperxComboBox

}

