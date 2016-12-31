using System;
using System.CodeDom.Compiler;
using System.ComponentModel;
using System.Configuration;
using System.Diagnostics;
using System.Runtime.CompilerServices;
using Microsoft.VisualBasic.ApplicationServices;
using Microsoft.VisualBasic.CompilerServices;

namespace CybeR_CryptZ.My
{

    [CompilerGenerated]
    [GeneratedCode("Microsoft.VisualStudio.Editors.SettingsDesigner.SettingsSingleFileGenerator", "10.0.0.0")]
    [EditorBrowsable(EditorBrowsableState.Advanced)]
    internal sealed class MySettings : ApplicationSettingsBase
    {

        private static bool addedHandler;
        private static object addedHandlerLockObject;
        private static MySettings defaultInstance;

        public static MySettings Default
        {
            get
            {
                bool flag = !MySettings.addedHandler;
                if (!flag)
                    goto label_0;
                object obj = MySettings.addedHandlerLockObject;
                ObjectFlowControl.CheckForSyncLockOnValueType(obj);
                lock (obj)
                {
                    flag = !MySettings.addedHandler;
                    if (flag)
                    {
                        MyProject.Application.Shutdown += new ShutdownEventHandler(MySettings.AutoSaveSettings);
                        MySettings.addedHandler = true;
                    }
                }
                return MySettings.defaultInstance;
            }
        }

        static MySettings()
        {
            MySettings.defaultInstance = (MySettings)SettingsBase.Synchronized(new MySettings());
            MySettings.addedHandlerLockObject = RuntimeHelpers.GetObjectValue(new Object());
        }

        [DebuggerNonUserCode]
        public MySettings()
        {
        }

        [DebuggerNonUserCode]
        [EditorBrowsable(EditorBrowsableState.Advanced)]
        private static void AutoSaveSettings(object sender, EventArgs e)
        {
            // trial
        }

    } // class MySettings

}

