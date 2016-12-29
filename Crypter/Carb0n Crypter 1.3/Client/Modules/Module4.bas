Attribute VB_Name = "dd"

Private Type tagInitCommonControlsEx
lngSize As Long
lngICC As Long
End Type
Private Declare Function InitCommonControlsEx Lib "comctl32.dll" (iccex As tagInitCommonControlsEx) As Boolean
Private Const ICC_USEREX_CLASSES = &H200

Public Function InitCommonControlsXP() As Boolean
On Error Resume Next
Dim iccex As tagInitCommonControlsEx
With iccex
.lngSize = Len(iccex)
.lngICC = ICC_USEREX_CLASSES
End With
InitCommonControlsEx iccex
InitCommonControlsXP = CBool(Err = 0)
End Function

