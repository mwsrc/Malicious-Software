using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.Drawing;
using System.Net;
using System.Text.RegularExpressions;

namespace CybeR_CryptZ
{

    [DefaultEvent("ChallengeChange")]
    internal class ReCaptcha : ThemeControl
    {

        public delegate void ChallengeChangeEventHandler(object sender);

        private const string RC_Challenge = "http://www.google.com/recaptcha/api/challenge?k=";
        private const string RC_Location = "http://www.google.com/recaptcha/api/image?c=";

        private string _Challenge;
        private bool _DesignModeShow;
        private string _PublicKey;
        private ReCaptcha.ChallengeChangeEventHandler ChallengeChangeEvent;
        private WebClient Client;
        private Pen P1;
        private bool Processing;
        private Image RC_Image;

        private static List<WeakReference> __ENCList;

        public event ReCaptcha.ChallengeChangeEventHandler ChallengeChange;

        public Color BorderColor
        {
            get
            {
                return P1.Color;
            }
            set
            {
                P1 = new Pen(value);
                Invalidate();
            }
        }

        public string Challenge
        {
            get
            {
                return _Challenge;
            }
        }

        public bool DesignModeShow
        {
            get
            {
                return _DesignModeShow;
            }
            set
            {
                _DesignModeShow = value;
                bool flag = value;
                if (flag)
                    Generate();
            }
        }

        public string PublicKey
        {
            get
            {
                return _PublicKey;
            }
            set
            {
                _PublicKey = value;
                Generate();
            }
        }

        [DebuggerNonUserCode]
        static ReCaptcha()
        {
            ReCaptcha.__ENCList = new List<WeakReference>();
        }

        public ReCaptcha()
        {
            Size size1;

            ReCaptcha.__ENCAddToList(this);
            Client = new WebClient();
            P1 = Pens.Black;
            Client.DownloadStringCompleted += new DownloadStringCompletedEventHandler(StringDone);
            Client.DownloadDataCompleted += new DownloadDataCompletedEventHandler(DataDone);
            Size size2 = new Size(302, 59);
            Size = size2;
        }

        private void DataDone(object s, DownloadDataCompletedEventArgs e)
        {
            // trial
        }

        public void Generate()
        {
            bool flag = !String.IsNullOrEmpty(_PublicKey) && !Processing ? true : false;
            if (flag)
            {
            }
            else
            {
                if (_DesignModeShow)
                    goto label_0;
                flag = DesignMode ? true : false;
                if (flag)
                {
                }
                else
                {
                    Processing = true;
                    Client.DownloadStringAsync(new Uri("http://www.google.com/recaptcha/api/challenge?k=" + _PublicKey));
                }
            }
        }

        private void StringDone(object s, DownloadStringCompletedEventArgs e)
        {
            _Challenge = Regex.Match(e.Result, "nge : '(.+)'").Groups[1].Value;
            Client.DownloadDataAsync(new Uri("http://www.google.com/recaptcha/api/image?c=" + _Challenge));
        }

        public override void PaintHook()
        {
            // trial
        }

        [DebuggerNonUserCode]
        private static void __ENCAddToList(object value)
        {
            // trial
        }

    } // class ReCaptcha

}

