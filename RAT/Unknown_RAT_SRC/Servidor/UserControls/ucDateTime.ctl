VERSION 5.00
Begin VB.UserControl ucDateTime 
   ClientHeight    =   435
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   3765
   HasDC           =   0   'False
   ScaleHeight     =   435
   ScaleWidth      =   3765
   ToolboxBitmap   =   "ucDateTime.ctx":0000
End
Attribute VB_Name = "ucDateTime"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

' -------------------------------------------------------------------------
' Autor:    Leandro I. Ascierto
' Web:      www.leandroascierto.com.ar
' Fecha:    Domingo, 08 de Noviembre de 2009
' Primera Versión
' -------------------------------------------------------------------------

Private Declare Function SendMessage Lib "user32.dll" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByRef lParam As Any) As Long
Private Declare Function GetWindowLong Lib "user32.dll" Alias "GetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long) As Long
Private Declare Function SetWindowLong Lib "user32.dll" Alias "SetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Private Declare Function DestroyWindow Lib "user32.dll" (ByVal hwnd As Long) As Long
Private Declare Function CreateWindowEx Lib "user32.dll" Alias "CreateWindowExA" (ByVal dwExStyle As Long, ByVal lpClassName As String, ByVal lpWindowName As String, ByVal dwStyle As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hWndParent As Long, ByVal hMenu As Long, ByVal hInstance As Long, ByRef lpParam As Any) As Long
Private Declare Function SetWindowPos Lib "user32.dll" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
Private Declare Function EnableWindow Lib "user32.dll" (ByVal hwnd As Long, ByVal fEnable As Long) As Long
Private Declare Function OleTranslateColor Lib "olepro32.dll" (ByVal OLE_COLOR As Long, ByVal hPalette As Long, pccolorref As Long) As Long
Private Declare Sub CopyMemory Lib "kernel32.dll" Alias "RtlMoveMemory" (ByRef Destination As Any, ByRef Source As Any, ByVal Length As Long)
Private Declare Sub InitCommonControls Lib "comctl32.dll" ()
Private Declare Function SetFocus Lib "user32.dll" (ByVal hwnd As Long) As Long

Private Type NMHDR
    hwndFrom                    As Long
    idfrom                      As Long
    code                        As Long
End Type

Private Type SYSTEMTIME
    wYear                       As Integer
    wMonth                      As Integer
    wDayOfWeek                  As Integer
    wDay                        As Integer
    wHour                       As Integer
    wMinute                     As Integer
    wSecond                     As Integer
    wMilliseconds               As Integer
End Type

Private Type NMDATETIMECHANGE
    NMHDR                       As NMHDR
    Flags                       As Long
    ST                          As SYSTEMTIME
End Type


Private Const DTM_FIRST                     As Long = &H1000
Private Const DTM_GETMCCOLOR                As Long = (DTM_FIRST + 7)
Private Const DTM_GETMCFONT                 As Long = (DTM_FIRST + 10)
Private Const DTM_GETMONTHCAL               As Long = (DTM_FIRST + 8)
Private Const DTM_GETRANGE                  As Long = (DTM_FIRST + 3)
Private Const DTM_GETSYSTEMTIME             As Long = (DTM_FIRST + 1)
Private Const DTM_SETFORMATA                As Long = (DTM_FIRST + 5)
Private Const DTM_SETFORMATW                As Long = (DTM_FIRST + 50)
Private Const DTM_SETMCCOLOR                As Long = (DTM_FIRST + 6)
Private Const DTM_SETMCFONT                 As Long = (DTM_FIRST + 9)
Private Const DTM_SETRANGE                  As Long = (DTM_FIRST + 4)
Private Const DTM_SETSYSTEMTIME             As Long = (DTM_FIRST + 2)

Private Const DTS_APPCANPARSE               As Long = &H10
Private Const DTS_LONGDATEFORMAT            As Long = &H4
Private Const DTS_RIGHTALIGN                As Long = &H20
Private Const DTS_SHORTDATECENTURYFORMAT    As Long = &HC
Private Const DTS_SHORTDATEFORMAT           As Long = &H0
Private Const DTS_SHOWNONE                  As Long = &H2
Private Const DTS_TIMEFORMAT                As Long = &H9
Private Const DTS_UPDOWN                    As Long = &H1

Private Const DTN_FIRST                     As Long = (-760)
Private Const DTN_LAST                      As Long = (-799)
Private Const DTN_CLOSEUP                   As Long = (DTN_FIRST + 7)
Private Const DTN_DATETIMECHANGE            As Long = (DTN_FIRST + 1)
Private Const DTN_DROPDOWN                  As Long = (DTN_FIRST + 6)
Private Const DTN_FORMATA                   As Long = (DTN_FIRST + 4)
Private Const DTN_FORMATQUERYA              As Long = (DTN_FIRST + 5)
Private Const DTN_FORMATQUERYW              As Long = (DTN_FIRST + 18)
Private Const DTN_FORMATW                   As Long = (DTN_FIRST + 17)
Private Const DTN_USERSTRINGA               As Long = (DTN_FIRST + 2)
Private Const DTN_USERSTRINGW               As Long = (DTN_FIRST + 15)
Private Const DTN_WMKEYDOWNA                As Long = (DTN_FIRST + 3)
Private Const DTN_WMKEYDOWNW                As Long = (DTN_FIRST + 16)

Private Const GDT_ERROR                     As Long = -1
Private Const GDT_NONE                      As Long = 1
Private Const GDT_VALID                     As Long = 0

Private Const GDTR_MAX                      As Long = &H2
Private Const GDTR_MIN                      As Long = &H1

Private Enum MCSC
    MCSC_TEXT = 1
    MCSC_TITLEBK = 2
    MCSC_TITLETEXT = 3
    MCSC_MONTHBK = 4
    MCSC_TRAILINGTEXT = 5
End Enum

Public Enum eFormat
    dtpLongDate = 0
    dtpShortDate = 1
    dtpTime = 2
    dtpCustom = 3
End Enum

Private Const WS_CHILD                      As Long = &H40000000
Private Const WS_OVERLAPPED                 As Long = &H0&
Private Const WS_VISIBLE                    As Long = &H10000000
Private Const WS_EX_CLIENTEDGE              As Long = &H200&
Private Const WS_EX_LEFT                    As Long = &H0&
Private Const WS_EX_LTRREADING              As Long = &H0&
Private Const WS_EX_RIGHTSCROLLBAR          As Long = &H0&
Private Const WS_DISABLED                   As Long = &H8000000

Private Const WM_SETTEXT                    As Long = &HC
Private Const WM_GETTEXT                    As Long = &HD
Private Const WM_GETTEXTLENGTH              As Long = &HE
Private Const WM_GETFONT                    As Long = &H31
Private Const WM_SETFONT                    As Long = &H30
Private Const WM_NOTIFY                     As Long = &H4E

Private Const GWL_STYLE                     As Long = -16
Private Const GWL_EXSTYLE                   As Long = -20

Private Const dtpMINDATE                    As Date = "01/01/1601"
Private Const dtpMAXDATE                    As Date = "31/12/9999"

Public Event Change()


Dim mhwnd                       As Long
Dim tSYSTIME                    As SYSTEMTIME

Dim mMinDate                    As Date
Dim mMaxDate                    As Date
Dim mDate                       As Variant
Dim mCheckValue                 As Boolean
Dim mDateTime                   As Variant
Dim mUpDown                     As Boolean
Dim mCheckBox                   As Boolean

Dim mBackColor                  As OLE_COLOR
Dim mForeColor                  As OLE_COLOR
Dim mTitleBackColor             As OLE_COLOR
Dim mTitleForeColor             As OLE_COLOR
Dim mTrailingForeColor          As OLE_COLOR
Dim mCustomFormat               As String
Dim mFormat                     As eFormat

Private WithEvents cSubClass As clsSubClass
Attribute cSubClass.VB_VarHelpID = -1

'----------------------------------------------------------------------------------------------------------------
'UserControl Envents
'----------------------------------------------------------------------------------------------------------------

Private Sub UserControl_Initialize()
    InitCommonControls
End Sub

Private Sub UserControl_Terminate()
    Set cSubClass = Nothing
    DestroyWindow mhwnd
End Sub

Private Sub UserControl_InitProperties()
    mMinDate = dtpMINDATE
    mMaxDate = dtpMAXDATE
    mCheckValue = True
    mBackColor = vbWindowBackground
    mForeColor = vbButtonText
    mTitleBackColor = vbActiveTitleBar
    mTitleForeColor = vbActiveTitleBarText
    mTrailingForeColor = vbGrayText
    mFormat = dtpShortDate
    Set UserControl.Font = Ambient.Font
    pvCreate
End Sub

Private Sub UserControl_Resize()
    SetWindowPos mhwnd, 0, 0, 0, UserControl.ScaleWidth / Screen.TwipsPerPixelX, UserControl.ScaleHeight / Screen.TwipsPerPixelY, 0&
End Sub

Private Sub UserControl_EnterFocus()
    SetFocus mhwnd
End Sub

Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
    With PropBag
        mMinDate = .ReadProperty("MinDate", dtpMINDATE)
        mMaxDate = .ReadProperty("MaxDate", dtpMAXDATE)
        mUpDown = .ReadProperty("UpDown", False)
        mCheckBox = .ReadProperty("CheckBox", False)
        mCheckValue = .ReadProperty("CheckValue", True)
        UserControl.Enabled = .ReadProperty("Enabled", True)
        mBackColor = .ReadProperty("BackColor", vbWindowBackground)
        mForeColor = .ReadProperty("ForeColor", vbButtonText)
        mTitleBackColor = .ReadProperty("TitleBackColor", vbActiveTitleBar)
        mTitleForeColor = .ReadProperty("TitleForeColor", vbActiveTitleBarText)
        mTrailingForeColor = .ReadProperty("TrailingForeColor", vbGrayText)
        mDateTime = .ReadProperty("DateTime", vbNullString)
        mCustomFormat = .ReadProperty("CustomFormat", vbNullString)
        mFormat = .ReadProperty("Format", dtpShortDate)
        Set UserControl.Font = .ReadProperty("Font", Ambient.Font)
    End With

    Call pvCreate
    
    If Ambient.UserMode Then
        Set cSubClass = New clsSubClass
        If cSubClass.ssc_Subclass(UserControl.hwnd) Then
            cSubClass.ssc_AddMsg UserControl.hwnd, WM_NOTIFY, MSG_AFTER
        End If
        
    End If
End Sub

Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
    With PropBag
        .WriteProperty "MinDate", mMinDate, dtpMINDATE
        .WriteProperty "MaxDate", mMaxDate, dtpMAXDATE
        .WriteProperty "UpDown", mUpDown, False
        .WriteProperty "CheckBox", mCheckBox, False
        .WriteProperty "CheckValue", mCheckValue, True
        .WriteProperty "Enabled", UserControl.Enabled, True
        .WriteProperty "BackColor", mBackColor, vbWindowBackground
        .WriteProperty "ForeColor", mForeColor, vbButtonText
        .WriteProperty "TitleBackColor", mTitleBackColor, vbActiveTitleBar
        .WriteProperty "TitleForeColor", mTitleForeColor, vbActiveTitleBarText
        .WriteProperty "TrailingForeColor", mTrailingForeColor, vbGrayText
        .WriteProperty "DateTime", mDateTime, vbNullString
        .WriteProperty "CustomFormat", mCustomFormat, vbNullString
        .WriteProperty "Format", mFormat, dtpShortDate
        .WriteProperty "Font", UserControl.Font, Ambient.Font
    End With
End Sub

'----------------------------------------------------------------------------------------------------------------
'Private Functions and Sub
'----------------------------------------------------------------------------------------------------------------

Private Function pvCreate()

    Dim lStyle As Long
    Dim lExStyle As Long
    
    lStyle = WS_CHILD Or WS_OVERLAPPED Or WS_VISIBLE
    If mCheckBox Then lStyle = lStyle Or DTS_SHOWNONE
    If mUpDown Then lStyle = lStyle Or DTS_UPDOWN
    If UserControl.Enabled = False Then lStyle = lStyle Or WS_DISABLED
    
    Select Case mFormat
        Case dtpLongDate
            lStyle = lStyle Or DTS_LONGDATEFORMAT
        Case dtpShortDate, dtpCustom
            lStyle = lStyle Or DTS_SHORTDATEFORMAT
        Case dtpTime
            lStyle = lStyle Or DTS_TIMEFORMAT
    
    End Select

    lExStyle = WS_EX_CLIENTEDGE Or WS_EX_LEFT Or WS_EX_LTRREADING Or WS_EX_RIGHTSCROLLBAR
    
    If mhwnd <> 0 Then DestroyWindow mhwnd
    
    mhwnd = CreateWindowEx(lExStyle, "SysDateTimePick32", "", lStyle, 0, 0, UserControl.ScaleWidth / Screen.TwipsPerPixelX, UserControl.ScaleHeight / Screen.TwipsPerPixelY, UserControl.hwnd, 0&, App.hInstance, ByVal 0&)
    
    If mBackColor <> vbWindowBackground Then pvChangeColor MCSC_MONTHBK, mBackColor
    If mForeColor <> vbButtonText Then pvChangeColor MCSC_TEXT, mForeColor
    If mTitleBackColor <> vbActiveTitleBar Then pvChangeColor MCSC_TITLEBK, mTitleBackColor
    If mTitleForeColor <> vbActiveTitleBarText Then pvChangeColor MCSC_TITLETEXT, mTitleForeColor
    If mTrailingForeColor <> vbGrayText Then pvChangeColor MCSC_TRAILINGTEXT, mTrailingForeColor

    If mCustomFormat <> vbNullString And mFormat = dtpCustom Or mFormat = dtpTime Then
        SendMessage mhwnd, DTM_SETFORMATA, 0&, ByVal mCustomFormat
    End If
    
    Call pvSetRange
    
    If IsValidDate(mDateTime) Then Me.DateTime = mDateTime
    
    If mCheckValue = False Then Me.CheckValue = False

End Function

Private Function IsValidDate(vDate As Variant) As Boolean
    On Local Error GoTo ErrFalse
    If DateValue(vDate) >= mMinDate And DateValue(vDate) <= mMaxDate Then
        IsValidDate = True
    End If
    Exit Function
ErrFalse:
'Debug.Print Err.Description
End Function

Private Function pvGetSysTime() As Long
    pvGetSysTime = SendMessage(mhwnd, DTM_GETSYSTEMTIME, 0&, tSYSTIME)
End Function

Private Sub pvSetDateTime(vDate As Variant)
    With tSYSTIME
        .wDay = VBA.DateTime.Day(vDate)
        .wMonth = VBA.DateTime.Month(vDate)
        .wYear = VBA.DateTime.Year(vDate)
        .wHour = VBA.DateTime.Hour(vDate)
        .wMinute = VBA.DateTime.Minute(vDate)
        .wSecond = VBA.DateTime.Second(vDate)
    End With
End Sub

Private Sub pvChangeColor(wParam As MCSC, oColor As Long)
    Dim lColor As Long
    OleTranslateColor oColor, 0, lColor
    Call SendMessage(mhwnd, DTM_SETMCCOLOR, wParam, ByVal lColor)
End Sub

Private Sub pvSetRange()
    Dim tST(1) As SYSTEMTIME

    tST(0).wDay = VBA.Day(mMinDate)
    tST(0).wMonth = VBA.DateTime.Month(mMinDate)
    tST(0).wYear = VBA.DateTime.Year(mMinDate)
    tST(0).wHour = VBA.DateTime.Hour(mMinDate)
    tST(0).wMinute = VBA.DateTime.Minute(mMinDate)
    tST(0).wSecond = VBA.DateTime.Second(mMinDate)

    tST(1).wDay = VBA.DateTime.Day(mMaxDate)
    tST(1).wMonth = VBA.DateTime.Month(mMaxDate)
    tST(1).wYear = VBA.DateTime.Year(mMaxDate)
    tST(1).wHour = VBA.DateTime.Hour(mMaxDate)
    tST(1).wMinute = VBA.DateTime.Minute(mMaxDate)
    tST(1).wSecond = VBA.DateTime.Second(mMaxDate)

    Call SendMessage(mhwnd, DTM_SETRANGE, GDTR_MIN + GDTR_MAX, tST(0))
End Sub

'----------------------------------------------------------------------------------------------------------------
'Public Function
'----------------------------------------------------------------------------------------------------------------

Public Function GetCaption() As String
    Dim lLength As Long
    Dim sText As String

    sText = Space(255)
    lLength = SendMessage(mhwnd, WM_GETTEXT, 255, ByVal sText)
    If lLength Then GetCaption = Left(sText, lLength)

End Function

Public Function Day() As Integer
    Day = IIf(pvGetSysTime = GDT_VALID, tSYSTIME.wDay, -1)
End Function

Public Function Month() As Integer
    Month = IIf(pvGetSysTime = GDT_VALID, tSYSTIME.wMonth, -1)
End Function

Public Function Year() As Integer
    Year = IIf(pvGetSysTime = GDT_VALID, tSYSTIME.wYear, -1)
End Function

Public Function Hour() As Integer
    Hour = IIf(pvGetSysTime = GDT_VALID, tSYSTIME.wHour, -1)
End Function

Public Function Minute() As Integer
    Minute = IIf(pvGetSysTime = GDT_VALID, tSYSTIME.wMinute, -1)
End Function

Public Function Second() As Integer
    Second = IIf(pvGetSysTime = GDT_VALID, tSYSTIME.wSecond, -1)
End Function

Public Function Milliseconds() As Integer
    Milliseconds = IIf(pvGetSysTime = GDT_VALID, tSYSTIME.wMilliseconds, -1)
End Function

Public Function DayOfWeek() As Integer
    DayOfWeek = IIf(pvGetSysTime = GDT_VALID, tSYSTIME.wDayOfWeek, -1)
End Function

'----------------------------------------------------------------------------------------------------------------
'Public Property Get and Let
'----------------------------------------------------------------------------------------------------------------

Public Property Get hwnd() As Long
    hwnd = mhwnd
End Property

Property Get UpDown() As Boolean
    UpDown = mUpDown
End Property

Property Let UpDown(ByVal Value As Boolean)
   mUpDown = Value
   PropertyChanged "UpDown"
   Call pvCreate
End Property

Property Get CheckBox() As Boolean
    CheckBox = mCheckBox
End Property

Property Let CheckBox(ByVal Value As Boolean)
   mCheckBox = Value
   PropertyChanged "CheckBox"
   Call pvCreate
End Property

Property Get Enabled() As Boolean
    Enabled = UserControl.Enabled
End Property

Property Let Enabled(ByVal Value As Boolean)
   UserControl.Enabled = Value
   EnableWindow mhwnd, Value
   PropertyChanged "Enabled"
End Property

Public Property Get Font() As Font
    Set Font = UserControl.Font
End Property

Public Property Set Font(ByVal objFont As Font)
    Dim lFont As Long
    Set UserControl.Font = objFont
    lFont = SendMessage(UserControl.hwnd, WM_GETFONT, 0&, 0&)
    Call SendMessage(mhwnd, WM_SETFONT, lFont, 1)
    PropertyChanged "Font"
End Property

Property Get Format() As eFormat
    Format = mFormat
End Property

Property Let Format(ByVal NewFormat As eFormat)
   mFormat = NewFormat
   PropertyChanged "Format"
   pvCreate
End Property

Property Get CustomFormat() As String
    CustomFormat = mCustomFormat
End Property

Property Let CustomFormat(ByVal NewCustomFormat As String)
   mCustomFormat = NewCustomFormat
   PropertyChanged "CustomFormat"
   SendMessage mhwnd, DTM_SETFORMATA, 0&, ByVal mCustomFormat
End Property

Public Property Get MinDate() As Date
    MinDate = mMinDate
End Property

Public Property Let MinDate(ByVal NewMinDate As Date)
    If NewMinDate >= dtpMINDATE Then
        mMinDate = NewMinDate
        Call pvSetRange
        PropertyChanged "MinDate"
    Else
        'si el proyecto no esta compilado ira a esta linea
        Err.Raise 380, , "La fecha minima deve ser mayor o igual a " & dtpMINDATE
    End If
End Property

Public Property Get MaxDate() As Date
    MaxDate = mMaxDate
End Property

Public Property Let MaxDate(ByVal NewMaxDate As Date)
    If NewMaxDate <= dtpMAXDATE Then
        mMaxDate = NewMaxDate
        Call pvSetRange
        PropertyChanged "MaxDate"
    Else
        'si el proyecto no esta compilado ira a esta linea
        Err.Raise 380, , "La fecha maxima deve ser menor o igual a " & dtpMAXDATE
    End If
End Property


Property Get CalendarBackColor() As OLE_COLOR
    CalendarBackColor = mBackColor
End Property

Property Let CalendarBackColor(ByVal NewColor As OLE_COLOR)
   mBackColor = NewColor
   PropertyChanged "BackColor"
   pvChangeColor MCSC_MONTHBK, mBackColor
End Property

Property Get CalendarForeColor() As OLE_COLOR
    CalendarForeColor = mForeColor
End Property

Property Let CalendarForeColor(ByVal NewColor As OLE_COLOR)
   mForeColor = NewColor
   PropertyChanged "ForeColor"
   pvChangeColor MCSC_TEXT, mForeColor
End Property

Property Get CalendarTitleBackColor() As OLE_COLOR
    CalendarTitleBackColor = mTitleBackColor
End Property

Property Let CalendarTitleBackColor(ByVal NewColor As OLE_COLOR)
   mTitleBackColor = NewColor
   PropertyChanged "TitleBackColor"
   pvChangeColor MCSC_TITLEBK, mTitleBackColor
End Property

Property Get CalendarTitleForeColor() As OLE_COLOR
    CalendarTitleForeColor = mTitleForeColor
End Property

Property Let CalendarTitleForeColor(ByVal NewColor As OLE_COLOR)
   mTitleForeColor = NewColor
   PropertyChanged "TitleForeColor"
   pvChangeColor MCSC_TITLETEXT, mTitleForeColor
End Property

Property Get CalendarTrailingForeColor() As OLE_COLOR
    CalendarTrailingForeColor = mTrailingForeColor
End Property

Property Let CalendarTrailingForeColor(ByVal NewColor As OLE_COLOR)
   mTrailingForeColor = NewColor
   PropertyChanged "TrailingForeColor"
   pvChangeColor MCSC_TRAILINGTEXT, mTrailingForeColor
End Property

Public Property Get CheckValue() As Boolean
    CheckValue = mCheckValue
End Property

Public Property Let CheckValue(ByVal NewValue As Boolean)
    mCheckValue = NewValue
    pvSetDateTime mDate
    If NewValue Then
        Call SendMessage(mhwnd, DTM_SETSYSTEMTIME, GDT_VALID, tSYSTIME)
    Else
        Call SendMessage(mhwnd, DTM_SETSYSTEMTIME, GDT_NONE, tSYSTIME)
    End If
End Property

Public Property Get DateTime() As Variant
Attribute DateTime.VB_Description = "Devuelve o establece la fecha o tiempo actual."
Attribute DateTime.VB_MemberFlags = "200"
    Dim tST As SYSTEMTIME
    If SendMessage(mhwnd, DTM_GETSYSTEMTIME, GDT_NONE, tST) = GDT_VALID Then
        If mFormat = dtpTime Then
            DateTime = VBA.DateTime.TimeSerial(tST.wHour, tST.wMinute, tST.wSecond)
        Else
            DateTime = VBA.DateTime.DateSerial(tST.wYear, tST.wMonth, tST.wDay)
        End If
    Else
        DateTime = ""
    End If
End Property

Public Property Let DateTime(ByVal NewDateTime As Variant)
    If IsValidDate(NewDateTime) Then
        mDateTime = NewDateTime
        pvSetDateTime mDateTime
        Call SendMessage(mhwnd, DTM_SETSYSTEMTIME, GDT_VALID, tSYSTIME)
    Else
        If NewDateTime = "" Then
            mDateTime = vbNullString
            pvSetDateTime Now
            Call SendMessage(mhwnd, DTM_SETSYSTEMTIME, GDT_VALID, tSYSTIME)
        Else
            Err.Raise 380 'si el proyecto no esta compilado ira a esta linea
        End If
    End If
    PropertyChanged "DateTime"
End Property

'----------------------------------------------------------------------------------------------------------------
'SubClass Event
'----------------------------------------------------------------------------------------------------------------

Private Sub cSubClass_WindowProc(bBefore As Boolean, bHandled As Boolean, lReturn As Long, hwnd As Long, uMsg As Long, wParam As Long, lParam As Long)

    If uMsg = WM_NOTIFY Then
        Dim NM As NMDATETIMECHANGE
        
        CopyMemory NM, ByVal lParam, Len(NM)
        
        If NM.NMHDR.code = DTN_DATETIMECHANGE Then
            If lParam <> 1308108 And lParam <> 1307924 Then
                RaiseEvent Change
            End If
        End If
        
    End If
End Sub
