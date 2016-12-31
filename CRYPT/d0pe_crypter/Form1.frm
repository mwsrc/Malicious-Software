VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   2655
   ClientLeft      =   5115
   ClientTop       =   3900
   ClientWidth     =   3780
   LinkTopic       =   "Form1"
   ScaleHeight     =   2655
   ScaleWidth      =   3780
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function GetModuleHandle Lib "kernel32" Alias "GetModuleHandleA" (ByVal lpModuleName As String) As Long

Public Function AntiSandbox() As String ' such a simple code :E works tho :P

        If Environ("username") = "currentuser" Then
        MsgBox "Norman Sandbox Detected"
        End
        End If

        If App.Path = "C:\" & App.EXEName = "file" Then
        MsgBox "Sunbelt Sandbox Detected"
        End
        End If

        If App.EXEName = "Sample" Or Environ("username") = "andy" Or "Andy" Then
        MsgBox "Anubis Sandbox Detected"
        End
        End If

        If GetModuleHandle("SbieDll.dll") Then
        MsgBox "Sandboxie Detected"
        End
        End If

        If App.Path = "C:\" Or "D:\" Or "F:\" Or "X:\" & Environ("username") = "Schmidti" Then
        MsgBox "CW Sandbox Detected"
        End
        End If
End Function
