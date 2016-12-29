using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;

namespace The_RATs_Crew_Crypter
{
    static class Program
    {
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new frmTRC_Crypter());
        }
    }
}
