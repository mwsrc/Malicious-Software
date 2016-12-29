VERSION 5.00
Begin VB.Form frmFileInfo 
   BorderStyle     =   4  'Festes Werkzeugfenster
   Caption         =   "File Info Changer"
   ClientHeight    =   2880
   ClientLeft      =   45
   ClientTop       =   315
   ClientWidth     =   6420
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2880
   ScaleWidth      =   6420
   StartUpPosition =   3  'Windows-Standard
End
Attribute VB_Name = "frmFileInfo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
Cancel = True
Me.Hide
End Sub
