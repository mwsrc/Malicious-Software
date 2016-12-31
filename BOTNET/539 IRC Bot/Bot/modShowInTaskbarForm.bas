Attribute VB_Name = "modShowInTaskbarForm"
'Dieser Source stammt von http://www.activevb.de
'und kann frei verwendet werden. Für eventuelle Schäden
'wird nicht gehaftet.

'Um Fehler oder Fragen zu klären, nutzen Sie bitte unser Forum.
'Ansonsten viel Spaß und Erfolg mit diesem Source!

Option Explicit

' ----==== Konstanten ====----
Private Const GWL_EXSTYLE As Long = (-20)
Private Const WS_EX_APPWINDOW As Long = &H40000

' ----==== User32 API Deklarationen ====----
Private Declare Function GetWindowLong Lib "user32" Alias _
    "GetWindowLongA" (ByVal hWnd As Long, _
    ByVal nIndex As Long) As Long

Private Declare Function SetWindowLong Lib "user32" Alias _
    "SetWindowLongA" (ByVal hWnd As Long, _
    ByVal nIndex As Long, _
    ByVal dwNewLong As Long) As Long

'------------------------------------------------------
' Funktion     : ShowInTaskbarForm
' Beschreibung : Formular in der Taskleiste ein- oder ausblenden
' Übergabewert : Frm = Formular
'                ShowForm = True/False
'                           True = Form in der Taskleiste einblenden
'                           False = Form in der Taskleiste ausblenden
'------------------------------------------------------
Public Sub ShowInTaskbarForm(ByVal Frm As Form, _
    ByVal ShowForm As Boolean)
    
    Dim VisibleStatus As Boolean
    Dim dwLong As Long
    
    ' aktuelle Visible Eigenschaft
    ' der Form zwischenspeichern
    VisibleStatus = Frm.Visible
    
    'Form ausblenden
    Frm.Visible = False
    
    ' erweiterte Fensterstile ermitteln -> dwLong
    dwLong = GetWindowLong(Frm.hWnd, GWL_EXSTYLE)
    
    If ShowForm Then
        ' Form in der Taskleiste einblenden
        
        ' erweiterten Fensterstil WS_EX_APPWINDOW hinzufügen
        dwLong = dwLong Or WS_EX_APPWINDOW
    Else
        ' Form in der Taskleiste ausblenden
        
        ' erweiterten Fensterstil WS_EX_APPWINDOW entfernen
        dwLong = dwLong And Not WS_EX_APPWINDOW
    End If
    
    ' neuen erweiterten Fensterstil setzen
    Call SetWindowLong(Frm.hWnd, GWL_EXSTYLE, dwLong)
    
    ' zwischengespeicherte Visible
    ' Eigenschaft wiederherstellen
    Frm.Visible = VisibleStatus
End Sub
