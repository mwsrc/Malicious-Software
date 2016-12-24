Attribute VB_Name = "mListViewEx"
'========================================================================================
' Module:        mListViewEx.bas (.Sort() routines)
' Last revision: 2004.09.26
'========================================================================================

Option Explicit

Private Type POINTAPI
    X As Long
    Y As Long
End Type

Private Type LVITEM_lp
    mask       As Long
    iItem      As Long
    iSubItem   As Long
    State      As Long
    stateMask  As Long
    pszText    As Long
    cchTextMax As Long
    iImage     As Long
    lParam     As Long
    iIndent    As Long
End Type

Private Type LVFINDINFO
    Flags       As Long
    psz         As Long
    lParam      As Long
    PT          As POINTAPI
    vkDirection As Long
End Type
 
Private Const LVFI_PARAM      As Long = &H1
Private Const LVIF_TEXT       As Long = &H1
Private Const LVIF_PARAM      As Long = &H4

Private Const LVM_FIRST       As Long = &H1000
Private Const LVM_FINDITEM    As Long = (LVM_FIRST + 13)
Private Const LVM_GETITEM     As Long = (LVM_FIRST + 5)
Private Const LVM_GETITEMTEXT As Long = (LVM_FIRST + 45)
Private Const LVM_SORTITEMSEX As Long = (LVM_FIRST + 81)

     
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Private Declare Function SendMessageLong Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long

'//

Private Type ListViewItemData
    IdList As Long
    PathAttr As Long
    PathCanRead As Boolean
    PathCanWrite As Boolean
    PathSize As String
End Type

Private m_uLVFI       As LVFINDINFO
Private m_uLVI        As LVITEM_lp
Private m_lColumn     As Long
Private m_PRECEDE     As Long
Private m_FOLLOW      As Long
Public CustomData() As ListViewItemData

'//

Private Function pvCompareIndex( _
                 ByVal lParam1 As Long, _
                 ByVal lParam2 As Long, _
                 ByVal hwnd As Long) As Long

    If (lParam1 > lParam2) Then
        pvCompareIndex = m_PRECEDE
    ElseIf (lParam1 < lParam2) Then
        pvCompareIndex = m_FOLLOW
    End If
    
End Function


Private Function pvCompareCustom( _
                 ByVal lParam1 As Long, _
                 ByVal lParam2 As Long, _
                 ByVal hwnd As Long) As Long
On Error Resume Next
  Dim val1 As Currency
  Dim val2 As Currency
     
    val1 = CCur(CustomData(pvGetItemData(hwnd, lParam1)).PathSize & 1)
    val2 = CCur(CustomData(pvGetItemData(hwnd, lParam2)).PathSize & 1)
     
    If (val1 > val2) Then
        pvCompareCustom = m_PRECEDE
    ElseIf (val1 < val2) Then
        pvCompareCustom = m_FOLLOW
    End If

End Function


Private Function pvCompareText( _
                 ByVal lParam1 As Long, _
                 ByVal lParam2 As Long, _
                 ByVal hwnd As Long) As Long

  Dim val1 As String
  Dim val2 As String
     
    val1 = LCase$(pvGetItemText(hwnd, lParam1))
    val2 = LCase$(pvGetItemText(hwnd, lParam2))

    If (val1 > val2) Then
        pvCompareText = m_PRECEDE
    ElseIf (val1 < val2) Then
        pvCompareText = m_FOLLOW
    End If
End Function

Private Function pvCompareTextSensitive( _
                 ByVal lParam1 As Long, _
                 ByVal lParam2 As Long, _
                 ByVal hwnd As Long) As Long

  Dim val1 As String
  Dim val2 As String
     
    val1 = pvGetItemText(hwnd, lParam1)
    val2 = pvGetItemText(hwnd, lParam2)
     
    If (val1 > val2) Then
        pvCompareTextSensitive = m_PRECEDE
    ElseIf (val1 < val2) Then
        pvCompareTextSensitive = m_FOLLOW
    End If
End Function

Private Function pvCompareValue( _
                 ByVal lParam1 As Long, _
                 ByVal lParam2 As Long, _
                 ByVal hwnd As Long) As Long

  Dim val1 As Double
  Dim val2 As Double
     
    val1 = pvGetItemValue(hwnd, lParam1)
    val2 = pvGetItemValue(hwnd, lParam2)
     
    If (val1 > val2) Then
        pvCompareValue = m_PRECEDE
    ElseIf (val1 < val2) Then
        pvCompareValue = m_FOLLOW
    End If
End Function

Private Function pvCompareDate( _
                 ByVal lParam1 As Long, _
                 ByVal lParam2 As Long, _
                 ByVal hwnd As Long) As Long

  Dim val1 As Date
  Dim val2 As Date
     
    val1 = pvGetItemDate(hwnd, lParam1)
    val2 = pvGetItemDate(hwnd, lParam2)
     
    If (val1 > val2) Then
        pvCompareDate = m_PRECEDE
    ElseIf (val1 < val2) Then
        pvCompareDate = m_FOLLOW
    End If
End Function

'//

Public Property Get pvGetItemData( _
                 ByVal hwnd As Long, _
                 ByVal lParam As Long) As Long
  


    With m_uLVI
        .iItem = lParam
        .mask = LVIF_PARAM
    End With
    
    Call SendMessage(hwnd, LVM_GETITEM, 0, m_uLVI)
    
    pvGetItemData = m_uLVI.lParam

End Property

Private Function pvGetItemText( _
                 ByVal hwnd As Long, _
                 ByVal lParam As Long) As String
  
  Dim lIdx   As Long
  Dim a(261) As Byte
  Dim lLen   As Long

    With m_uLVI
        .mask = LVIF_TEXT
        .pszText = VarPtr(a(0))
        .cchTextMax = UBound(a)
        .iSubItem = m_lColumn
    End With
    lLen = SendMessage(hwnd, LVM_GETITEMTEXT, lParam, m_uLVI)
    
    pvGetItemText = Left$(StrConv(a(), vbUnicode), lLen)
End Function

Private Function pvGetItemValue( _
                 ByVal hwnd As Long, _
                 ByVal lParam As Long) As Double
  
  Dim lIdx   As Long
  Dim a(261) As Byte
  Dim lLen   As Long
  
    With m_uLVI
        .mask = LVIF_TEXT
        .pszText = VarPtr(a(0))
        .cchTextMax = UBound(a)
        .iSubItem = m_lColumn
    End With
    lLen = SendMessage(hwnd, LVM_GETITEMTEXT, lParam, m_uLVI)
    
    If (lLen) Then
        pvGetItemValue = CDbl(Left$(StrConv(a(), vbUnicode), lLen))
      Else
        pvGetItemValue = 0
    End If
End Function

Private Function pvGetItemDate( _
                 ByVal hwnd As Long, _
                 ByVal lParam As Long) As Date
  
  Dim lIdx   As Long
  Dim a(261) As Byte
  Dim sText  As String
  Dim lLen   As Long
     
    With m_uLVI
        .mask = LVIF_TEXT
        .pszText = VarPtr(a(0))
        .cchTextMax = UBound(a)
        .iSubItem = m_lColumn
    End With
    lLen = SendMessage(hwnd, LVM_GETITEMTEXT, lParam, m_uLVI)
    
    sText = Left$(StrConv(a(), vbUnicode), lLen)
    If (IsDate(sText)) Then
        pvGetItemDate = sText
    End If
End Function

Private Function AddressOfFunction(lpfn As Long) As Long
    AddressOfFunction = lpfn
End Function

'//

Public Function Sort( _
                ByVal hListView As Long, _
                ByVal Column As Integer, _
                ByVal SortOrder As eSortOrderConstants, _
                ByVal SortType As eSortTypeConstants _
                ) As Boolean

  Dim lRet As Long
  
    m_lColumn = CLng(Column)
        
    Select Case SortOrder
        
        Case [soDefault]
            
            m_PRECEDE = 1
            m_FOLLOW = -1
            lRet = SendMessageLong(hListView, LVM_SORTITEMSEX, hListView, AddressOfFunction(AddressOf pvCompareIndex))
            
        Case [soAscending], [soDescending]
        
            m_PRECEDE = SortOrder
            m_FOLLOW = -SortOrder
            
            Select Case SortType
                Case [stString]
                    lRet = SendMessageLong(hListView, LVM_SORTITEMSEX, hListView, AddressOfFunction(AddressOf pvCompareText))
                Case [stStringSensitive]
                    lRet = SendMessageLong(hListView, LVM_SORTITEMSEX, hListView, AddressOfFunction(AddressOf pvCompareTextSensitive))
                Case [stNumeric]
                    lRet = SendMessageLong(hListView, LVM_SORTITEMSEX, hListView, AddressOfFunction(AddressOf pvCompareValue))
                Case [stDate]
                    lRet = SendMessageLong(hListView, LVM_SORTITEMSEX, hListView, AddressOfFunction(AddressOf pvCompareDate))
                Case [stCustom]
                    lRet = SendMessageLong(hListView, LVM_SORTITEMSEX, hListView, AddressOfFunction(AddressOf pvCompareCustom))
            End Select
    End Select
    
    Sort = CBool(lRet)
End Function
