Attribute VB_Name = "modVMs"

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
Public Function InVM() As String
'By Five-Three-Nine
'http://ratforge.net/forums/index.php?showtopic=135
  Dim oAdapters As Object
  Dim oCard As Object
  Dim SQL As String
                        

  ' Abfrage erstellen
  SQL = "SELECT * FROM Win32_VideoController"
  Set oAdapters = GetObject("winmgmts:").ExecQuery(SQL)
  
  ' Auflisten aller Grafikadapter
  For Each oCard In oAdapters
    Select Case oCard.Description
        Case "VM Additions S3 Trio32/64"
            InVM = "MS VPC with Additions found!"
        Case "S3 Trio32/64"
            InVM = "MS VPC without Additions found!"
        
        Case "VirtualBox Graphics Adapter"
            InVM = "VirtualBox with Additions found!"
        
        Case "VMware SVGA II"
            InVM = "VMWare with Additions found!"
        Case ""
            InVM = "VM found!"
        Case Else
            InVM = "none"
    End Select
    
  Next
End Function

