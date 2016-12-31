VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form Form1 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "SkuLLByte Crypt"
   ClientHeight    =   5415
   ClientLeft      =   4545
   ClientTop       =   2835
   ClientWidth     =   6000
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5415
   ScaleWidth      =   6000
   ShowInTaskbar   =   0   'False
   Begin MSComDlg.CommonDialog CD 
      Left            =   5520
      Top             =   0
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Frame Frame1 
      Caption         =   "Main"
      Height          =   3735
      Left            =   120
      TabIndex        =   1
      Top             =   1560
      Width           =   5775
      Begin Proyecto1.Button Button1 
         Height          =   375
         Left            =   2040
         TabIndex        =   6
         Top             =   3120
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   661
         ButtonStyle     =   7
         BackColor       =   14211288
         BackColorPressed=   15715986
         BackColorHover  =   16243621
         BorderColor     =   9408398
         BorderColorPressed=   6045981
         BorderColorHover=   11632444
         Caption         =   "Crypt it!"
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin VB.Frame Frame5 
         Caption         =   "Algorithms"
         Height          =   855
         Left            =   3960
         TabIndex        =   5
         Top             =   2160
         Width           =   1695
         Begin VB.OptionButton Option2 
            Caption         =   "XOR"
            Height          =   255
            Left            =   840
            TabIndex        =   16
            Top             =   360
            Width           =   735
         End
         Begin VB.OptionButton Option1 
            Caption         =   "RC4"
            Height          =   255
            Left            =   120
            TabIndex        =   15
            Top             =   360
            Value           =   -1  'True
            Width           =   615
         End
      End
      Begin VB.Frame Frame4 
         Caption         =   "EOF"
         Height          =   855
         Left            =   2880
         TabIndex        =   4
         Top             =   2160
         Width           =   975
         Begin VB.CheckBox Check1 
            Caption         =   "Data"
            Height          =   255
            Left            =   120
            TabIndex        =   14
            Top             =   360
            Width           =   735
         End
      End
      Begin VB.Frame Frame3 
         Caption         =   "Exe-Pump"
         Height          =   855
         Left            =   120
         TabIndex        =   3
         Top             =   2160
         Width           =   2655
         Begin VB.TextBox Text3 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            Height          =   285
            Left            =   120
            TabIndex        =   11
            Text            =   "0 Bytes"
            Top             =   360
            Width           =   1095
         End
         Begin Proyecto1.Button cmdUp 
            Height          =   255
            Left            =   1320
            TabIndex        =   12
            Top             =   360
            Width           =   615
            _ExtentX        =   1085
            _ExtentY        =   450
            ButtonStyle     =   7
            BackColor       =   14211288
            BackColorPressed=   15715986
            BackColorHover  =   16243621
            BorderColor     =   9408398
            BorderColorPressed=   6045981
            BorderColorHover=   11632444
            Caption         =   "+"
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
         End
         Begin Proyecto1.Button cmdDown 
            Height          =   255
            Left            =   1920
            TabIndex        =   13
            Top             =   360
            Width           =   615
            _ExtentX        =   1085
            _ExtentY        =   450
            ButtonStyle     =   7
            BackColor       =   14211288
            BackColorPressed=   15715986
            BackColorHover  =   16243621
            BorderColor     =   9408398
            BorderColorPressed=   6045981
            BorderColorHover=   11632444
            Caption         =   "-"
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
         End
      End
      Begin VB.Frame Frame2 
         Caption         =   "File Manager"
         Height          =   1815
         Left            =   120
         TabIndex        =   2
         Top             =   240
         Width           =   5535
         Begin VB.TextBox Text4 
            Appearance      =   0  'Flat
            ForeColor       =   &H00808080&
            Height          =   285
            Left            =   120
            TabIndex        =   17
            Text            =   "Key..."
            Top             =   1320
            Width           =   4215
         End
         Begin VB.TextBox Text2 
            Appearance      =   0  'Flat
            ForeColor       =   &H00808080&
            Height          =   285
            Left            =   120
            Locked          =   -1  'True
            TabIndex        =   8
            Text            =   "Stub Path..."
            Top             =   840
            Width           =   4215
         End
         Begin VB.TextBox Text1 
            Appearance      =   0  'Flat
            ForeColor       =   &H00808080&
            Height          =   285
            Left            =   120
            Locked          =   -1  'True
            TabIndex        =   7
            Text            =   "File Path..."
            Top             =   360
            Width           =   4215
         End
         Begin Proyecto1.Button cmdBuscar 
            Height          =   255
            Left            =   4440
            TabIndex        =   9
            Top             =   360
            Width           =   975
            _ExtentX        =   1720
            _ExtentY        =   450
            ButtonStyle     =   7
            BackColor       =   14211288
            BackColorPressed=   15715986
            BackColorHover  =   16243621
            BorderColor     =   9408398
            BorderColorPressed=   6045981
            BorderColorHover=   11632444
            Caption         =   "Search"
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
         End
         Begin Proyecto1.Button cmdStub 
            Height          =   255
            Left            =   4440
            TabIndex        =   10
            Top             =   840
            Width           =   975
            _ExtentX        =   1720
            _ExtentY        =   450
            ButtonStyle     =   7
            BackColor       =   14211288
            BackColorPressed=   15715986
            BackColorHover  =   16243621
            BorderColor     =   9408398
            BorderColorPressed=   6045981
            BorderColorHover=   11632444
            Caption         =   "Search"
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
         End
         Begin Proyecto1.Button cmdGenerar 
            Height          =   255
            Left            =   4440
            TabIndex        =   18
            Top             =   1320
            Width           =   975
            _ExtentX        =   1720
            _ExtentY        =   450
            ButtonStyle     =   7
            BackColor       =   14211288
            BackColorPressed=   15715986
            BackColorHover  =   16243621
            BorderColor     =   9408398
            BorderColorPressed=   6045981
            BorderColorHover=   11632444
            Caption         =   "Rnd"
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
         End
      End
      Begin Proyecto1.Button cmdAbout 
         Height          =   255
         Left            =   4920
         TabIndex        =   19
         Top             =   3360
         Width           =   615
         _ExtentX        =   1085
         _ExtentY        =   450
         ButtonStyle     =   7
         BackColor       =   14211288
         BackColorPressed=   15715986
         BackColorHover  =   16243621
         BorderColor     =   9408398
         BorderColorPressed=   6045981
         BorderColorHover=   11632444
         Caption         =   "About"
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
   End
   Begin VB.PictureBox Picture1 
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      Height          =   1500
      Left            =   0
      Picture         =   "Form1.frx":D626
      ScaleHeight     =   1500
      ScaleWidth      =   6000
      TabIndex        =   0
      Top             =   0
      Width           =   6000
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdAbout_Click()
Form2.Show
End Sub

Private Sub cmdBuscar_Click() 'Buscar Archivo/Search File
With CD
    .DialogTitle = "Select the file to Crypt"
    .Filter = "Executables (.exe)|*.exe"
    .ShowOpen
End With

If CD.FileName <> vbNullString Then
        Text1.Text = CD.FileName
    End If
CD.FileName = vbNullString
End Sub

Private Sub cmdGenerar_Click() 'Gnr Key
    Text4.Text = Aleatorio(95)
End Sub

Private Sub cmdDown_Click() 'Subtract bytes/Restar Bytes
If Text3.Text <> "0 Bytes" Then
    Text3.Text = Replace$(Text3.Text, " Bytes", "")
    Text3.Text = Text3.Text - 1
    Text3.Text = Text3.Text & " Bytes"
End If
End Sub

Private Sub cmdStub_Click()
With CD
    .DialogTitle = "Select the Stub"
    .Filter = "Executables EXE|*.exe|Libraries DLL|*.dll"
    .ShowOpen
End With

If CD.FileName <> vbNullString Then
        Text2.Text = CD.FileName
    End If
CD.FileName = vbNullString
End Sub

Private Sub cmdUp_Click() 'Add Bytes/Agregar Bytes
    Text3.Text = Replace$(Text3.Text, " Bytes", "")
    Text3.Text = Text3.Text + 1
    Text3.Text = Text3.Text & " Bytes"
End Sub

Private Sub Button1_Click() 'Crypt/Encriptar

If Text1.Text = vbNullString Then
    MsgBox "File not select", vbExclamation
Exit Sub
End If

    Dim Free    As Long
    Dim Stub    As String
    Dim EOF     As String
    Dim Data    As String
    Dim hRC4    As New clsRC4
    Dim hXOR    As New clsXOR
    Dim i       As Long
    Dim Bytes   As String
    Dim Enc     As Integer
    Dim Final   As String
    
Free = FreeFile


With CD
    .DialogTitle = "Save File..."
    .Filter = "Executables (.exe)|*.exe"
    .ShowSave
End With

If CD.FileName <> vbNullString Then
    
    Open Text1.Text For Binary As Free
        Stub = Space$(LOF(1))
        Get #1, , Stub
    Close Free
    
'ReadEoFData
If Check1.Value = vbChecked Then EOF = ReadEOFData(Text1.Text)

Open Text1.Text For Binary As Free
    Data = Space$(LOF(1))
    Get #1, , Data
Close Free

If Option1.Value = True Then Data = hRC4.EncryptString(Data, Text4.Text): Enc = 1
If Option2.Value = True Then Data = hXOR.EncryptString(Data, Text4.Text): Enc = 1

Final = Data & "[SkuLLByte]" & Text4.Text & "[SkuLLByte] & enc"
    
Open CD.FileName For Binary As Free
    Put #1, , Stub & "[SkuLLByte]"
    Put #1, , Final
Close #1

If Text3.Text <> "0 Bytes" Then
    Bytes = Replace$(Text3.Text, " Bytes", "")
    
    For i = 1 To Bytes
        Open CD.FileName For Append As #1
            Print #1, LOF(1), " "
        Close #1
    Next i
End If

'WriteEoFData
If Check1.Value = vbChecked Then Call WriteEOFData(CD.FileName, EOF)

MsgBox "Successfully encrypted file", vbInformation

End If

End Sub

Function Aleatorio(Tamaño As String) As String ' // By Karcrack (Password Key)
    Dim i
    For i = 1 To Tamaño
        Randomize
        Aleatorio = Aleatorio & Chr$(CLng((5 - 90) * Rnd + 90))
    Next i
End Function
