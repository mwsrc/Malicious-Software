VERSION 5.00
Begin VB.Form Form2 
   Caption         =   "Form2"
   ClientHeight    =   3090
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4680
   LinkTopic       =   "Form2"
   ScaleHeight     =   3090
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
If GetOSVersion = "1.4.0" Then
Getosver = "Win 95"
    ElseIf GetOSVersion = "1.4.10" Then
    Getosver = "Win 98"
    ElseIf GetOSVersion = "1.4.98" Then
    Getosver = "Win ME"
    ElseIf GetOSVersion = "2.3.51" Then
    Getosver = "Win NT 3"
    ElseIf GetOSVersion = "2.4.0" Then
    Getosver = "Win NT 4"
    ElseIf GetOSVersion = "2.5.0" Then
    Getosver = "Win 2000"
    ElseIf GetOSVersion = "2.5.1" Then
    Getosver = "Win XP"
    ElseIf GetOSVersion = "2.6.0" Then
    Getosver = "Win Vista"
    Else:  Getosver = "Unknown"
    End If
MsgBox Getosver
