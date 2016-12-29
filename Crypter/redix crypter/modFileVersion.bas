Attribute VB_Name = "modFileVersion"
'Open File2Read.Text For Binary As #1
'Rich_String = Space(LOF(1))
'Get #1, 1, Rich_String
'Close #1
'
'
'For Z = 0 To 10
'IText(Z).MaxLength = 0
'Next Z
'
'IText(0).Text = SearchString("FileVersion", 1, 0)
'MXL(0).Caption = Len(IText(0).Text)
'
'IText(1).Text = SearchString("FileDescription", 1, 1)
'MXL(1).Caption = Len(IText(1).Text)
'
'IText(2).Text = SearchString("LegalCopyright", 2, 2)
'MXL(2).Caption = Len(IText(2).Text)
'
'IText(3).Text = SearchString("Comments", 2, 3)
'MXL(3).Caption = Len(IText(3).Text)
'
'IText(4).Text = SearchString("CompanyName", 1, 4)
'MXL(4).Caption = Len(IText(4).Text)
'
'IText(5).Text = SearchString("InternalName", 2, 5)
'MXL(5).Caption = Len(IText(5).Text)
'
'IText(6).Text = SearchString("LegalTrademarks", 1, 6)
'MXL(6).Caption = Len(IText(6).Text)
'
'IText(7).Text = SearchString("OriginalFilename", 2, 7)
'MXL(7).Caption = Len(IText(7).Text)
'
'IText(8).Text = SearchString("ProductName", 1, 8)
'MXL(8).Caption = Len(IText(8).Text)
'
'IText(9).Text = SearchString("ProductVersion", 2, 9)
'MXL(9).Caption = Len(IText(9).Text)
'
'IText(10).Text = SearchString("Contact", 1, 10)
'MXL(10).Caption = Len(IText(10).Text)
'
'For Z = 0 To 10
'
'If IText(Z) = "" Then
'IText(Z).Enabled = False
'IText(Z).Text = "No Value"
'Else
'IText(Z).Enabled = True
'End If
'
'IText(Z).MaxLength = Len(IText(Z).Text)
'
'IText(Z).ToolTipText = "Writeable length is " & MXL(Z).Caption
'
'Next Z
