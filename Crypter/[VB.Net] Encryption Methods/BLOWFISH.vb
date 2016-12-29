Imports System
Imports System.Text
Imports System.IO
Namespace Simias.Encryption
    Public Class Blowfish
        Const N As Integer = 16
        Const KEYBYTES As Integer = 8

        Shared _P As Integer() = {&H243F6A88, &H85A308D3, &H13198A2E, &H3707344, &HA4093822, &H299F31D0, _
         &H82EFA98, &HEC4E6C89, &H452821E6, &H38D01377, &HBE5466CF, &H34E90C6C, _
         &HC0AC29B7, &HC97C50DD, &H3F84D5B5, &HB5470917, &H9216D5D9, &H8979FB1B}
        Shared _S As Integer(,) = {{&HD1310BA6, &H98DFB5AC, &H2FFD72DB, &HD01ADFB7, &HB8E1AFED, &H6A267E96, _
         &HBA7C9045, &HF12C7F99, &H24A19947, &HB3916CF7, &H801F2E2, &H858EFC16, _
         &H636920D8, &H71574E69, &HA458FEA3, &HF4933D7E, &HD95748F, &H728EB658, _
         &H718BCD58, &H82154AEE, &H7B54A41D, &HC25A59B5, &H9C30D539, &H2AF26013, _
         &HC5D1B023, &H286085F0, &HCA417918, &HB8DB38EF, &H8E79DCB0, &H603A180E, _
         &H6C9E0E8B, &HB01E8A3E, &HD71577C1, &HBD314B27, &H78AF2FDA, &H55605C60, _
         &HE65525F3, &HAA55AB94, &H57489862, &H63E81440, &H55CA396A, &H2AAB10B6, _
         &HB4CC5C34, &H1141E8CE, &HA15486AF, &H7C72E993, &HB3EE1411, &H636FBC2A, _
         &H2BA9C55D, &H741831F6, &HCE5C3E16, &H9B87931E, &HAFD6BA33, &H6C24CF5C, _
         &H7A325381, &H28958677, &H3B8F4898, &H6B4BB9AF, &HC4BFE81B, &H66282193, _
         &H61D809CC, &HFB21A991, &H487CAC60, &H5DEC8032, &HEF845D5D, &HE98575B1, _
         &HDC262302, &HEB651B88, &H23893E81, &HD396ACC5, &HF6D6FF3, &H83F44239, _
         &H2E0B4482, &HA4842004, &H69C8F04A, &H9E1F9B5E, &H21C66842, &HF6E96C9A, _
         &H670C9C61, &HABD388F0, &H6A51A0D2, &HD8542F68, &H960FA728, &HAB5133A3, _
         &H6EEF0B6C, &H137A3BE4, &HBA3BF050, &H7EFB2A98, &HA1F1651D, &H39AF0176, _
         &H66CA593E, &H82430E88, &H8CEE8619, &H456F9FB4, &H7D84A5C3, &H3B8B5EBE, _
         &HE06F75D8, &H85C12073, &H401A449F, &H56C16AA6, &H4ED3AA62, &H363F7706, _
         &H1BFEDF72, &H429B023D, &H37D0D724, &HD00A1248, &HDB0FEAD3, &H49F1C09B, _
         &H75372C9, &H80991B7B, &H25D479D8, &HF6E8DEF7, &HE3FE501A, &HB6794C3B, _
         &H976CE0BD, &H4C006BA, &HC1A94FB6, &H409F60C4, &H5E5C9EC2, &H196A2463, _
         &H68FB6FAF, &H3E6C53B5, &H1339B2EB, &H3B52EC6F, &H6DFC511F, &H9B30952C, _
         &HCC814544, &HAF5EBD09, &HBEE3D004, &HDE334AFD, &H660F2807, &H192E4BB3, _
         &HC0CBA857, &H45C8740F, &HD20B5F39, &HB9D3FBDB, &H5579C0BD, &H1A60320A, _
         &HD6A100C6, &H402C7279, &H679F25FE, &HFB1FA3CC, &H8EA5E9F8, &HDB3222F8, _
         &H3C7516DF, &HFD616B15, &H2F501EC8, &HAD0552AB, &H323DB5FA, &HFD238760, _
         &H53317B48, &H3E00DF82, &H9E5C57BB, &HCA6F8CA0, &H1A87562E, &HDF1769DB, _
         &HD542A8F6, &H287EFFC3, &HAC6732C6, &H8C4F5573, &H695B27B0, &HBBCA58C8, _
         &HE1FFA35D, &HB8F011A0, &H10FA3D98, &HFD2183B8, &H4AFCB56C, &H2DD1D35B, _
         &H9A53E479, &HB6F84565, &HD28E49BC, &H4BFB9790, &HE1DDF2DA, &HA4CB7E33, _
         &H62FB1341, &HCEE4C6E8, &HEF20CADA, &H36774C01, &HD07E9EFE, &H2BF11FB4, _
         &H95DBDA4D, &HAE909198, &HEAAD8E71, &H6B93D5A0, &HD08ED1D0, &HAFC725E0, _
         &H8E3C5B2F, &H8E7594B7, &H8FF6E2FB, &HF2122B64, &H8888B812, &H900DF01C, _
         &H4FAD5EA0, &H688FC31C, &HD1CFF191, &HB3A8C1AD, &H2F2F2218, &HBE0E1777, _
         &HEA752DFE, &H8B021FA1, &HE5A0CC0F, &HB56F74E8, &H18ACF3D6, &HCE89E299, _
         &HB4A84FE0, &HFD13E0B7, &H7CC43B81, &HD2ADA8D9, &H165FA266, &H80957705, _
         &H93CC7314, &H211A1477, &HE6AD2065, &H77B5FA86, &HC75442F5, &HFB9D35CF, _
         &HEBCDAF0C, &H7B3E89A0, &HD6411BD3, &HAE1E7E49, &H250E2D, &H2071B35E, _
         &H226800BB, &H57B8E0AF, &H2464369B, &HF009B91E, &H5563911D, &H59DFA6AA, _
         &H78C14389, &HD95A537F, &H207D5BA2, &H2E5B9C5, &H83260376, &H6295CFA9, _
         &H11C81968, &H4E734A41, &HB3472DCA, &H7B14A94A, &H1B510052, &H9A532915, _
         &HD60F573F, &HBC9BC6E4, &H2B60A476, &H81E67400, &H8BA6FB5, &H571BE91F, _
         &HF296EC6B, &H2A0DD915, &HB6636521, &HE7B9F9B6, &HFF34052E, &HC5855664, _
         &H53B02D5D, &HA99F8FA1, &H8BA4799, &H6E85076A}, {&H4B7A70E9, &HB5B32944, &HDB75092E, &HC4192623, &HAD6EA6B0, &H49A7DF7D, _
         &H9CEE60B8, &H8FEDB266, &HECAA8C71, &H699A17FF, &H5664526C, &HC2B19EE1, _
         &H193602A5, &H75094C29, &HA0591340, &HE4183A3E, &H3F54989A, &H5B429D65, _
         &H6B8FE4D6, &H99F73FD6, &HA1D29C07, &HEFE830F5, &H4D2D38E6, &HF0255DC1, _
         &H4CDD2086, &H8470EB26, &H6382E9C6, &H21ECC5E, &H9686B3F, &H3EBAEFC9, _
         &H3C971814, &H6B6A70A1, &H687F3584, &H52A0E286, &HB79C5305, &HAA500737, _
         &H3E07841C, &H7FDEAE5C, &H8E7D44EC, &H5716F2B8, &HB03ADA37, &HF0500C0D, _
         &HF01C1F04, &H200B3FF, &HAE0CF51A, &H3CB574B2, &H25837A58, &HDC0921BD, _
         &HD19113F9, &H7CA92FF6, &H94324773, &H22F54701, &H3AE5E581, &H37C2DADC, _
         &HC8B57634, &H9AF3DDA7, &HA9446146, &HFD0030E, &HECC8C73E, &HA4751E41, _
         &HE238CD99, &H3BEA0E2F, &H3280BBA1, &H183EB331, &H4E548B38, &H4F6DB908, _
         &H6F420D03, &HF60A04BF, &H2CB81290, &H24977C79, &H5679B072, &HBCAF89AF, _
         &HDE9A771F, &HD9930810, &HB38BAE12, &HDCCF3F2E, &H5512721F, &H2E6B7124, _
         &H501ADDE6, &H9F84CD87, &H7A584718, &H7408DA17, &HBC9F9ABC, &HE94B7D8C, _
         &HEC7AEC3A, &HDB851DFA, &H63094366, &HC464C3D2, &HEF1C1847, &H3215D908, _
         &HDD433B37, &H24C2BA16, &H12A14D43, &H2A65C451, &H50940002, &H133AE4DD, _
         &H71DFF89E, &H10314E55, &H81AC77D6, &H5F11199B, &H43556F1, &HD7A3C76B, _
         &H3C11183B, &H5924A509, &HF28FE6ED, &H97F1FBFA, &H9EBABF2C, &H1E153C6E, _
         &H86E34570, &HEAE96FB1, &H860E5E0A, &H5A3E2AB3, &H771FE71C, &H4E3D06FA, _
         &H2965DCB9, &H99E71D0F, &H803E89D6, &H5266C825, &H2E4CC978, &H9C10B36A, _
         &HC6150EBA, &H94E2EA78, &HA5FC3C53, &H1E0A2DF4, &HF2F74EA7, &H361D2B3D, _
         &H1939260F, &H19C27960, &H5223A708, &HF71312B6, &HEBADFE6E, &HEAC31F66, _
         &HE3BC4595, &HA67BC883, &HB17F37D1, &H18CFF28, &HC332DDEF, &HBE6C5AA5, _
         &H65582185, &H68AB9802, &HEECEA50F, &HDB2F953B, &H2AEF7DAD, &H5B6E2F84, _
         &H1521B628, &H29076170, &HECDD4775, &H619F1510, &H13CCA830, &HEB61BD96, _
         &H334FE1E, &HAA0363CF, &HB5735C90, &H4C70A239, &HD59E9E0B, &HCBAADE14, _
         &HEECC86BC, &H60622CA7, &H9CAB5CAB, &HB2F3846E, &H648B1EAF, &H19BDF0CA, _
         &HA02369B9, &H655ABB50, &H40685A32, &H3C2AB4B3, &H319EE9D5, &HC021B8F7, _
         &H9B540B19, &H875FA099, &H95F7997E, &H623D7DA8, &HF837889A, &H97E32D77, _
         &H11ED935F, &H16681281, &HE358829, &HC7E61FD6, &H96DEDFA1, &H7858BA99, _
         &H57F584A5, &H1B227263, &H9B83C3FF, &H1AC24696, &HCDB30AEB, &H532E3054, _
         &H8FD948E4, &H6DBC3128, &H58EBF2EF, &H34C6FFEA, &HFE28ED61, &HEE7C3C73, _
         &H5D4A14D9, &HE864B7E3, &H42105D14, &H203E13E0, &H45EEE2B6, &HA3AAABEA, _
         &HDB6C4F15, &HFACB4FD0, &HC742F442, &HEF6ABBB5, &H654F3B1D, &H41CD2105, _
         &HD81E799E, &H86854DC7, &HE44B476A, &H3D816250, &HCF62A1F2, &H5B8D2646, _
         &HFC8883A0, &HC1C7B6A3, &H7F1524C3, &H69CB7492, &H47848A0B, &H5692B285, _
         &H95BBF00, &HAD19489D, &H1462B174, &H23820E00, &H58428D2A, &HC55F5EA, _
         &H1DADF43E, &H233F7061, &H3372F092, &H8D937E41, &HD65FECF1, &H6C223BDB, _
         &H7CDE3759, &HCBEE7460, &H4085F2A7, &HCE77326E, &HA6078084, &H19F8509E, _
         &HE8EFD855, &H61D99735, &HA969A7AA, &HC50C06C2, &H5A04ABFC, &H800BCADC, _
         &H9E447A2E, &HC3453484, &HFDD56705, &HE1E9EC9, &HDB73DBD3, &H105588CD, _
         &H675FDA79, &HE3674340, &HC5C43465, &H713E38D8, &H3D28F89E, &HF16DFF20, _
         &H153E21E7, &H8FB03D4A, &HE6E39F2B, &HDB83ADF7}, {&HE93D5A68, &H948140F7, &HF64C261C, &H94692934, &H411520F7, &H7602D4F7, _
         &HBCF46B2E, &HD4A20068, &HD4082471, &H3320F46A, &H43B7D4B7, &H500061AF, _
         &H1E39F62E, &H97244546, &H14214F74, &HBF8B8840, &H4D95FC1D, &H96B591AF, _
         &H70F4DDD3, &H66A02F45, &HBFBC09EC, &H3BD9785, &H7FAC6DD0, &H31CB8504, _
         &H96EB27B3, &H55FD3941, &HDA2547E6, &HABCA0A9A, &H28507825, &H530429F4, _
         &HA2C86DA, &HE9B66DFB, &H68DC1462, &HD7486900, &H680EC0A4, &H27A18DEE, _
         &H4F3FFEA2, &HE887AD8C, &HB58CE006, &H7AF4D6B6, &HAACE1E7C, &HD3375FEC, _
         &HCE78A399, &H406B2A42, &H20FE9E35, &HD9F385B9, &HEE39D7AB, &H3B124E8B, _
         &H1DC9FAF7, &H4B6D1856, &H26A36631, &HEAE397B2, &H3A6EFA74, &HDD5B4332, _
         &H6841E7F7, &HCA7820FB, &HFB0AF54E, &HD8FEB397, &H454056AC, &HBA489527, _
         &H55533A3A, &H20838D87, &HFE6BA9B7, &HD096954B, &H55A867BC, &HA1159A58, _
         &HCCA92963, &H99E1DB33, &HA62A4A56, &H3F3125F9, &H5EF47E1C, &H9029317C, _
         &HFDF8E802, &H4272F70, &H80BB155C, &H5282CE3, &H95C11548, &HE4C66D22, _
         &H48C1133F, &HC70F86DC, &H7F9C9EE, &H41041F0F, &H404779A4, &H5D886E17, _
         &H325F51EB, &HD59BC0D1, &HF2BCC18F, &H41113564, &H257B7834, &H602A9C60, _
         &HDFF8E8A3, &H1F636C1B, &HE12B4C2, &H2E1329E, &HAF664FD1, &HCAD18115, _
         &H6B2395E0, &H333E92E1, &H3B240B62, &HEEBEB922, &H85B2A20E, &HE6BA0D99, _
         &HDE720C8C, &H2DA2F728, &HD0127845, &H95B794FD, &H647D0862, &HE7CCF5F0, _
         &H5449A36F, &H877D48FA, &HC39DFD27, &HF33E8D1E, &HA476341, &H992EFF74, _
         &H3A6F6EAB, &HF4F8FD37, &HA812DC60, &HA1EBDDF8, &H991BE14C, &HDB6E6B0D, _
         &HC67B5510, &H6D672C37, &H2765D43B, &HDCD0E804, &HF1290DC7, &HCC00FFA3, _
         &HB5390F92, &H690FED0B, &H667B9FFB, &HCEDB7D9C, &HA091CF0B, &HD9155EA3, _
         &HBB132F88, &H515BAD24, &H7B9479BF, &H763BD6EB, &H37392EB3, &HCC115979, _
         &H8026E297, &HF42E312D, &H6842ADA7, &HC66A2B3B, &H12754CCC, &H782EF11C, _
         &H6A124237, &HB79251E7, &H6A1BBE6, &H4BFB6350, &H1A6B1018, &H11CAEDFA, _
         &H3D25BDD8, &HE2E1C3C9, &H44421659, &HA121386, &HD90CEC6E, &HD5ABEA2A, _
         &H64AF674E, &HDA86A85F, &HBEBFE988, &H64E4C3FE, &H9DBC8057, &HF0F7C086, _
         &H60787BF8, &H6003604D, &HD1FD8346, &HF6381FB0, &H7745AE04, &HD736FCCC, _
         &H83426B33, &HF01EAB71, &HB0804187, &H3C005E5F, &H77A057BE, &HBDE8AE24, _
         &H55464299, &HBF582E61, &H4E58F48F, &HF2DDFDA2, &HF474EF38, &H8789BDC2, _
         &H5366F9C3, &HC8B38E74, &HB475F255, &H46FCD9B9, &H7AEB2661, &H8B1DDF84, _
         &H846A0E79, &H915F95E2, &H466E598E, &H20B45770, &H8CD55591, &HC902DE4C, _
         &HB90BACE1, &HBB8205D0, &H11A86248, &H7574A99E, &HB77F19B6, &HE0A9DC09, _
         &H662D09A1, &HC4324633, &HE85A1F02, &H9F0BE8C, &H4A99A025, &H1D6EFE10, _
         &H1AB93D1D, &HBA5A4DF, &HA186F20F, &H2868F169, &HDCB7DA83, &H573906FE, _
         &HA1E2CE9B, &H4FCD7F52, &H50115E01, &HA70683FA, &HA002B5C4, &HDE6D027, _
         &H9AF88C27, &H773F8641, &HC3604C06, &H61A806B5, &HF0177A28, &HC0F586E0, _
         &H6058AA, &H30DC7D62, &H11E69ED7, &H2338EA63, &H53C2DD94, &HC2C21634, _
         &HBBCBEE56, &H90BCB6DE, &HEBFC7DA1, &HCE591D76, &H6F05E409, &H4B7C0188, _
         &H39720A3D, &H7C927C24, &H86E3725F, &H724D9DB9, &H1AC15BB4, &HD39EB8FC, _
         &HED545578, &H8FCA5B5, &HD83D7CD3, &H4DAD0FC4, &H1E50EF5E, &HB161E6F8, _
         &HA28514D9, &H6C51133C, &H6FD5C7E7, &H56E14EC4, &H362ABFCE, &HDDC6C837, _
         &HD79A3234, &H92638212, &H670EFA8E, &H406000E0}, {&H3A39CE37, &HD3FAF5CF, &HABC27737, &H5AC52D1B, &H5CB0679E, &H4FA33742, _
         &HD3822740, &H99BC9BBE, &HD5118E9D, &HBF0F7315, &HD62D1C7E, &HC700C47B, _
         &HB78C1B6B, &H21A19045, &HB26EB1BE, &H6A366EB4, &H5748AB2F, &HBC946E79, _
         &HC6A376D2, &H6549C2C8, &H530FF8EE, &H468DDE7D, &HD5730A1D, &H4CD04DC6, _
         &H2939BBDB, &HA9BA4650, &HAC9526E8, &HBE5EE304, &HA1FAD5F0, &H6A2D519A, _
         &H63EF8CE2, &H9A86EE22, &HC089C2B8, &H43242EF6, &HA51E03AA, &H9CF2D0A4, _
         &H83C061BA, &H9BE96A4D, &H8FE51550, &HBA645BD6, &H2826A2F9, &HA73A3AE1, _
         &H4BA99586, &HEF5562E9, &HC72FEFD3, &HF752F7DA, &H3F046F69, &H77FA0A59, _
         &H80E4A915, &H87B08601, &H9B09E6AD, &H3B3EE593, &HE990FD5A, &H9E34D797, _
         &H2CF0B7D9, &H22B8B51, &H96D5AC3A, &H17DA67D, &HD1CF3ED6, &H7C7D2D28, _
         &H1F9F25CF, &HADF2B89B, &H5AD6B472, &H5A88F54C, &HE029AC71, &HE019A5E6, _
         &H47B0ACFD, &HED93FA9B, &HE8D3C48D, &H283B57CC, &HF8D56629, &H79132E28, _
         &H785F0191, &HED756055, &HF7960E44, &HE3D35E8C, &H15056DD4, &H88F46DBA, _
         &H3A16125, &H564F0BD, &HC3EB9E15, &H3C9057A2, &H97271AEC, &HA93A072A, _
         &H1B3F6D9B, &H1E6321F5, &HF59C66FB, &H26DCF319, &H7533D928, &HB155FDF5, _
         &H3563482, &H8ABA3CBB, &H28517711, &HC20AD9F8, &HABCC5167, &HCCAD925F, _
         &H4DE81751, &H3830DC8E, &H379D5862, &H9320F991, &HEA7A90C2, &HFB3E7BCE, _
         &H5121CE64, &H774FBE32, &HA8B6E37E, &HC3293D46, &H48DE5369, &H6413E680, _
         &HA2AE0810, &HDD6DB224, &H69852DFD, &H9072166, &HB39A460A, &H6445C0DD, _
         &H586CDECF, &H1C20C8AE, &H5BBEF7DD, &H1B588D40, &HCCD2017F, &H6BB4E3BB, _
         &HDDA26A7E, &H3A59FF45, &H3E350A44, &HBCB4CDD5, &H72EACEA8, &HFA6484BB, _
         &H8D6612AE, &HBF3C6F47, &HD29BE463, &H542F5D9E, &HAEC2771B, &HF64E6370, _
         &H740E0D8D, &HE75B1357, &HF8721671, &HAF537D5D, &H4040CB08, &H4EB4E2CC, _
         &H34D2466A, &H115AF84, &HE1B00428, &H95983A1D, &H6B89FB4, &HCE6EA048, _
         &H6F3F3B82, &H3520AB82, &H11A1D4B, &H277227F8, &H611560B1, &HE7933FDC, _
         &HBB3A792B, &H344525BD, &HA08839E1, &H51CE794B, &H2F32C9B7, &HA01FBAC9, _
         &HE01CC87E, &HBCC7D1F6, &HCF0111C3, &HA1E8AAC7, &H1A908749, &HD44FBD9A, _
         &HD0DADECB, &HD50ADA38, &H339C32A, &HC6913667, &H8DF9317C, &HE0B12B4F, _
         &HF79E59B7, &H43F5BB3A, &HF2D519FF, &H27D9459C, &HBF97222C, &H15E6FC2A, _
         &HF91FC71, &H9B941525, &HFAE59361, &HCEB69CEB, &HC2A86459, &H12BAA8D1, _
         &HB6C1075E, &HE3056A0C, &H10D25065, &HCB03A442, &HE0EC6E0E, &H1698DB3B, _
         &H4C98A0BE, &H3278E964, &H9F1F9532, &HE0D392DF, &HD3A0342B, &H8971F21E, _
         &H1B0A7441, &H4BA3348C, &HC5BE7120, &HC37632D8, &HDF359F8D, &H9B992F2E, _
         &HE60B6F47, &HFE3F11D, &HE54CDA54, &H1EDAD891, &HCE6279CF, &HCD3E7E6F, _
         &H1618B166, &HFD2C1D05, &H848FD2C5, &HF6FB2299, &HF523F357, &HA6327623, _
         &H93A83531, &H56CCCD02, &HACF08162, &H5A75EBB5, &H6E163697, &H88D273CC, _
         &HDE966292, &H81B949D0, &H4C50901B, &H71C65614, &HE6C6C7BD, &H327A140A, _
         &H45E1D006, &HC3F27B9A, &HC9AA53FD, &H62A80F00, &HBB25BFE2, &H35BDD2F6, _
         &H71126905, &HB2040222, &HB6CBCF7C, &HCD769C2B, &H53113EC0, &H1640E3D3, _
         &H38ABBD60, &H2547ADF0, &HBA38209C, &HF746CE76, &H77AFA1C5, &H20756060, _
         &H85CBFE4E, &H8AE88DD8, &H7AAAF9B0, &H4CF9AA7E, &H1948C25C, &H2FB8A8C, _
         &H1C36AE4, &HD6EBE1F9, &H90D4F869, &HA65CDEA0, &H3F09252D, &HC208E69F, _
         &HB74E6132, &HCE77E25B, &H578FDFE3, &H3AC372E6}}

        Private P As Integer()
        Private S As Integer(,)
        Public Sub New(ByVal key As Byte())
            Dim i As Short
            Dim j As Short
            Dim k As Short
            Dim data As UInteger
            Dim datal As UInteger
            Dim datar As UInteger

            P = TryCast(_P.Clone(), Integer())
            S = TryCast(_S.Clone(), Integer(,))

            j = 0
            For i = 0 To N + 1
                data = &H0
                For k = 0 To 3
                    data = (data << 8) Or key(j)
                    j += 1
                    If j >= key.Length Then
                        j = 0
                    End If
                Next
                P(i) = P(i) Xor data
            Next

            datal = &H0
            datar = &H0

            For i = 0 To N + 1 Step 2
                Encipher(datal, datar)
                P(i) = datal
                P(i + 1) = datar
            Next

            For i = 0 To 3
                For j = 0 To 255 Step 2
                    Encipher(datal, datar)

                    S(i, j) = datal
                    S(i, j + 1) = datar
                Next
            Next
        End Sub
        Private Function F(ByVal x As UInteger) As UInteger
            Dim a As UShort
            Dim b As UShort
            Dim c As UShort
            Dim d As UShort
            Dim y As UInteger

            d = CUShort((x And &HFF))
            x >>= 8
            c = CUShort((x And &HFF))
            x >>= 8
            b = CUShort((x And &HFF))
            x >>= 8
            a = CUShort((x And &HFF))
            y = S(0, a) + S(1, b)
            y = y Xor S(2, c)
            y = y + S(3, d)

            Return y
        End Function
        Public Sub Encipher(ByVal data As Byte(), ByVal length As Integer)
            Dim xl As UInteger, xr As UInteger
            If (length Mod 8) <> 0 Then
                Throw New Exception("Invalid Length")
            End If
            For i As Integer = 0 To length - 1 Step 8
                xl = CUInt(((data(i) << 24) Or (data(i + 1) << 16) Or (data(i + 2) << 8) Or data(i + 3)))
                xr = CUInt(((data(i + 4) << 24) Or (data(i + 5) << 16) Or (data(i + 6) << 8) Or data(i + 7)))
                Encipher(xl, xr)
                data(i) = CByte((xl >> 24))
                data(i + 1) = CByte((xl >> 16))
                data(i + 2) = CByte((xl >> 8))
                data(i + 3) = CByte((xl))
                data(i + 4) = CByte((xr >> 24))
                data(i + 5) = CByte((xr >> 16))
                data(i + 6) = CByte((xr >> 8))
                data(i + 7) = CByte((xr))
            Next
        End Sub
        Private Sub Encipher(ByRef xl__1 As UInteger, ByRef xr__2 As UInteger)
            Dim Xl__3 As UInteger
            Dim Xr__4 As UInteger
            Dim temp As UInteger
            Dim i As Short

            Xl__3 = xl__1
            Xr__4 = xr__2

            For i = 0 To N - 1
                Xl__3 = Xl__3 Xor P(i)
                Xr__4 = F(Xl__3) Xor Xr__4

                temp = Xl__3
                Xl__3 = Xr__4
                Xr__4 = temp
            Next

            temp = Xl__3
            Xl__3 = Xr__4
            Xr__4 = temp

            Xr__4 = Xr__4 Xor P(N)
            Xl__3 = Xl__3 Xor P(N + 1)

            xl__1 = Xl__3
            xr__2 = Xr__4
        End Sub
        Public Sub Decipher(ByVal data As Byte(), ByVal length As Integer)
            Dim xl As UInteger, xr As UInteger
            If (length Mod 8) <> 0 Then
                Throw New Exception("Invalid Length")
            End If
            For i As Integer = 0 To length - 1 Step 8
                xl = CUInt(((data(i) << 24) Or (data(i + 1) << 16) Or (data(i + 2) << 8) Or data(i + 3)))
                xr = CUInt(((data(i + 4) << 24) Or (data(i + 5) << 16) Or (data(i + 6) << 8) Or data(i + 7)))
                Decipher(xl, xr)
                data(i) = CByte((xl >> 24))
                data(i + 1) = CByte((xl >> 16))
                data(i + 2) = CByte((xl >> 8))
                data(i + 3) = CByte((xl))
                data(i + 4) = CByte((xr >> 24))
                data(i + 5) = CByte((xr >> 16))
                data(i + 6) = CByte((xr >> 8))
                data(i + 7) = CByte((xr))
            Next
        End Sub
        Private Sub Decipher(ByRef xl__1 As UInteger, ByRef xr__2 As UInteger)
            Dim Xl__3 As UInteger
            Dim Xr__4 As UInteger
            Dim temp As UInteger
            Dim i As Short

            Xl__3 = xl__1
            Xr__4 = xr__2

            For i = N + 1 To 2 Step -1
                Xl__3 = Xl__3 Xor P(i)
                Xr__4 = F(Xl__3) Xor Xr__4


                temp = Xl__3
                Xl__3 = Xr__4
                Xr__4 = temp
            Next


            temp = Xl__3
            Xl__3 = Xr__4
            Xr__4 = temp

            Xr__4 = Xr__4 Xor P(1)
            Xl__3 = Xl__3 Xor P(0)

            xl__1 = Xl__3
            xr__2 = Xr__4
        End Sub
    End Class

    Public Class BlowfishStream
        Inherits Stream
        Private Class CBState
            Friend callback As AsyncCallback
            Friend state As Object
            Friend buffer As Byte()
            Friend result As IAsyncResult
            Friend Sub New(ByVal callback As AsyncCallback, ByVal state As Object, ByVal buffer As Byte())
                Me.callback = callback
                Me.state = state
                Me.buffer = buffer
            End Sub
#Region "IAsyncResult Members"

            Public ReadOnly Property AsyncState() As Object
                Get
                    Return state
                End Get
            End Property

            Public ReadOnly Property CompletedSynchronously() As Boolean
                Get
                    Return result.CompletedSynchronously
                End Get
            End Property

            Public ReadOnly Property AsyncWaitHandle() As System.Threading.WaitHandle
                Get
                    Return result.AsyncWaitHandle
                End Get
            End Property

            Public ReadOnly Property IsCompleted() As Boolean
                Get
                    Return result.IsCompleted
                End Get
            End Property

#End Region
        End Class

        Public Enum Terget
            Encrypted
            Normal
        End Enum
        Private stream As Stream
        Private bf As Blowfish
        Private Sub New(ByVal stream As Stream, ByVal bf As Blowfish)
            Me.stream = stream
            Me.bf = bf
        End Sub
        Public Overloads Overrides ReadOnly Property CanRead() As Boolean
            Get
                Return stream.CanRead
            End Get
        End Property
        Public Overloads Overrides ReadOnly Property CanSeek() As Boolean
            Get
                Return stream.CanSeek
            End Get
        End Property
        Public Overloads Overrides ReadOnly Property CanWrite() As Boolean
            Get
                Return stream.CanWrite
            End Get
        End Property
        Public Overloads Overrides ReadOnly Property Length() As Long
            Get
                Return stream.Length
            End Get
        End Property
        Public Overloads Overrides Property Position() As Long
            Get
                Return stream.Position
            End Get
            Set(ByVal value As Long)
                stream.Position = value
            End Set
        End Property
        Public Overloads Overrides Sub Flush()
            stream.Flush()
        End Sub
        Public Overloads Overrides Function Read(ByVal buffer As Byte(), ByVal offset As Integer, ByVal count As Integer) As Integer
            Dim bytesRead As Integer = stream.Read(buffer, offset, count)
            Dim Target As String = ""
            If Target = Terget.Normal Then
                bf.Encipher(buffer, bytesRead)
            Else
                bf.Decipher(buffer, bytesRead)
            End If
            Return bytesRead
        End Function
        Public Overloads Overrides Sub Write(ByVal buffer As Byte(), ByVal offset As Integer, ByVal count As Integer)
            Dim Target As String = ""
            If Target = Terget.Normal Then
                bf.Decipher(buffer, count)
            Else
                bf.Encipher(buffer, count)
            End If
            stream.Write(buffer, offset, count)
        End Sub
        Public Overloads Overrides Function BeginRead(ByVal buffer As Byte(), ByVal offset As Integer, ByVal count As Integer, ByVal callback As AsyncCallback, ByVal state As Object) As IAsyncResult
            Dim cbs As New CBState(callback, state, buffer)
            cbs.result = MyBase.BeginRead(buffer, offset, count, New AsyncCallback(AddressOf ReadComplete), cbs)
            Return cbs
        End Function
        Public Overloads Overrides Function EndRead(ByVal asyncResult As IAsyncResult) As Integer
            Dim cbs As CBState = DirectCast(asyncResult.AsyncState, CBState)
            Dim bytesRead As Integer = MyBase.EndRead(cbs.result)
            Dim Target As String = ""
            If Target = Terget.Normal Then
                bf.Encipher(cbs.buffer, bytesRead)
            Else
                bf.Decipher(cbs.buffer, bytesRead)
            End If
            Return bytesRead
        End Function
        Private Sub ReadComplete(ByVal result As IAsyncResult)
            Dim cbs As CBState = DirectCast(result.AsyncState, CBState)
            cbs.callback(cbs)
        End Sub
        Public Overloads Overrides Function BeginWrite(ByVal buffer As Byte(), ByVal offset As Integer, ByVal count As Integer, ByVal callback As AsyncCallback, ByVal state As Object) As IAsyncResult
            Dim Target As String = ""
            If Target = Terget.Normal Then
                bf.Decipher(buffer, count)
            Else
                bf.Encipher(buffer, count)
            End If
            Return MyBase.BeginWrite(buffer, offset, count, callback, state)
        End Function
        Public Overloads Overrides Function Seek(ByVal offset As Long, ByVal origin As SeekOrigin) As Long
            Return stream.Seek(offset, origin)
        End Function
        Public Overloads Overrides Sub SetLength(ByVal value As Long)
            stream.SetLength(value)
        End Sub
    End Class
End Namespace