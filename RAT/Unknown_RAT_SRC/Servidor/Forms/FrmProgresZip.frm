VERSION 5.00
Begin VB.Form FrmProgresZip 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Form1"
   ClientHeight    =   2115
   ClientLeft      =   45
   ClientTop       =   525
   ClientWidth     =   5385
   Icon            =   "FrmProgresZip.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2115
   ScaleWidth      =   5385
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton Command1 
      Cancel          =   -1  'True
      Caption         =   "Cancelar"
      Height          =   375
      Left            =   3720
      TabIndex        =   1
      Top             =   1440
      Width           =   1335
   End
   Begin Servidor.ucProgressBar ucProgressBar1 
      Height          =   375
      Left            =   360
      TabIndex        =   0
      Top             =   840
      Width           =   4695
      _ExtentX        =   8281
      _ExtentY        =   661
   End
   Begin VB.Label Label1 
      Caption         =   "Label1"
      Height          =   255
      Left            =   360
      TabIndex        =   2
      Top             =   360
      Width           =   4455
   End
End
Attribute VB_Name = "FrmProgresZip"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Public SocketID As Long

Private Sub Command1_Click()
    WinSock32.SendData SocketID, "17" & Delimiter & END_DATA
End Sub

