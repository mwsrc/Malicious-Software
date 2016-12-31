VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsThreadings"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'----------------------------------------------------------------------------------------'
'
' Multi Downloader using multithreadings
' Created by Suk Yong Kim, 03/14/2001
'
' This project is my first project to upload to the PSC.
' Many persons contribute to create this project
' I really appreicate their efforts and codes and the great server PSC.
'
' if any question, mail to : techtrans@dreamwiz.com
'----------------------------------------------------------------------------------------'

Option Explicit

'local variable to hold collection
Private mCol As Collection


Public Function CreateNewThread(ByVal iDownloader As Long, ByVal cFunction As Long, _
    Optional ByVal cPriority As Long = tpNormal, _
    Optional ByVal cEnabled As Boolean = True, Optional sKey As String) As clsThreading
    
    'create a new object
    Dim objNewMember As clsThreading
    Set objNewMember = New clsThreading
    
    'create new thread
    Call objNewMember.CreateNewThread(iDownloader, cFunction, cPriority, cEnabled)
    
    If Len(sKey) = 0 Then
      mCol.Add objNewMember
    Else
      mCol.Add objNewMember, sKey
    End If
    
    'return the object created
    Set CreateNewThread = objNewMember
    Set objNewMember = Nothing
Exit_Function:
End Function
Public Property Get Item(vntIndexKey As Variant) As clsThreading
    Set Item = mCol(vntIndexKey)
End Property

Public Property Get Count() As Long
    Count = mCol.Count
End Property

Public Sub TerminateThread(vntIndexKey As Variant)
    On Error Resume Next
    mCol.Remove vntIndexKey
End Sub

Public Property Get NewEnum() As IUnknown
    Set NewEnum = mCol.[_NewEnum]
End Property

Private Sub Class_Initialize()
    Set mCol = New Collection
End Sub

Private Sub Class_Terminate()
    On Error Resume Next
    Set mCol = Nothing
End Sub


