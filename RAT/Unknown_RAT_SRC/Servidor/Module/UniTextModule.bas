Attribute VB_Name = "UniTextModule"
'*************************************************************************************************
'* UniTextModule.bas - IOLEInPlaceActiveObject handler for UniText
'* ---------------------------------------------------------------
'* By Vesa Piittinen aka Merri, http://vesa.piittinen.name/ <vesa@piittinen.name>
'*
'* REQUIREMENTS
'* ------------
'* Note: TLBs are compiled to your program so you don't need to distribute the files
'* - OleGuids3.tlb      = Ole Guid and interface definitions 3.0
'*
'* VERSION HISTORY
'* ---------------
'* Version 1.0.0 (2008-06-08)
'* - Customized and simplified version for UniText control
'*
'* mIOleInPlaceActivate.bas (1999-01-09)
'* - Author: Mike Gainer, Matt Curland and Bill Storage
'* - WWW: http://vbaccelerator.com
'*
'*************************************************************************************************
Option Explicit

Private Type GUID
    Data1 As Long
    Data2 As Integer
    Data3 As Integer
    Data4(0 To 7) As Byte
End Type

Public Type UniText_IPAOHook
    lpVTable As Long
    IPAOReal As IOleInPlaceActiveObject
    Ctl As UniText
    ThisPointer As Long
End Type

Private Const S_FALSE As Long = 1
Private Const S_OK As Long = 0

Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)
Private Declare Function IsEqualGUID Lib "ole32" (iid1 As GUID, iid2 As GUID) As Long

Private IID_IOleInPlaceActiveObject As GUID
Private m_IPAOVTable(9) As Long

Private Function AddOf(ByVal AddressOfProcedure As Long) As Long
    AddOf = AddressOfProcedure
End Function

Private Function IPAO_AddRef(This As UniText_IPAOHook) As Long
    IPAO_AddRef = This.IPAOReal.AddRef
End Function

Private Function IPAO_ContextSensitiveHelp(This As UniText_IPAOHook, ByVal fEnterMode As Long) As Long
    IPAO_ContextSensitiveHelp = This.IPAOReal.ContextSensitiveHelp(fEnterMode)
End Function

Private Function IPAO_EnableModeless(This As UniText_IPAOHook, ByVal fEnable As Long) As Long
    IPAO_EnableModeless = This.IPAOReal.EnableModeless(fEnable)
End Function

Private Function IPAO_GetWindow(This As UniText_IPAOHook, phwnd As Long) As Long
    IPAO_GetWindow = This.IPAOReal.GetWindow(phwnd)
End Function

Private Function IPAO_OnDocWindowActivate(This As UniText_IPAOHook, ByVal fActivate As Long) As Long
    IPAO_OnDocWindowActivate = This.IPAOReal.OnDocWindowActivate(fActivate)
End Function

Private Function IPAO_OnFrameWindowActivate(This As UniText_IPAOHook, ByVal fActivate As Long) As Long
    IPAO_OnFrameWindowActivate = This.IPAOReal.OnFrameWindowActivate(fActivate)
End Function

Private Function IPAO_QueryInterface(This As UniText_IPAOHook, riid As GUID, pvObj As Long) As Long
    If IsEqualGUID(riid, IID_IOleInPlaceActiveObject) Then
        pvObj = This.ThisPointer
        IPAO_AddRef This
        IPAO_QueryInterface = 0
    Else
        IPAO_QueryInterface = This.IPAOReal.QueryInterface(ByVal VarPtr(riid), pvObj)
    End If
End Function

Private Function IPAO_Release(This As UniText_IPAOHook) As Long
    IPAO_Release = This.IPAOReal.Release
End Function

Private Function IPAO_ResizeBorder(This As UniText_IPAOHook, prcBorder As RECT, ByVal puiWindow As IOleInPlaceUIWindow, ByVal fFrameWindow As Long) As Long
    IPAO_ResizeBorder = This.IPAOReal.ResizeBorder(VarPtr(prcBorder), puiWindow, fFrameWindow)
End Function

Private Function IPAO_TranslateAccelerator(This As UniText_IPAOHook, lpMsg As MSG) As Long
    Dim CtlText As UniText
    If TypeOf This.Ctl Is UniText Then
        Set CtlText = This.Ctl
        If CtlText.TranslateAccel(lpMsg) Then IPAO_TranslateAccelerator = S_OK: Exit Function
    End If
    IPAO_TranslateAccelerator = This.IPAOReal.TranslateAccelerator(ByVal VarPtr(lpMsg))
End Function

Public Sub UniText_Init(UniText_IPAOHook As UniText_IPAOHook, Ctl As UniText)
    Dim IPAO As IOleInPlaceActiveObject
    If m_IPAOVTable(0) = 0 Then
        m_IPAOVTable(0) = AddOf(AddressOf IPAO_QueryInterface)
        m_IPAOVTable(1) = AddOf(AddressOf IPAO_AddRef)
        m_IPAOVTable(2) = AddOf(AddressOf IPAO_Release)
        m_IPAOVTable(3) = AddOf(AddressOf IPAO_GetWindow)
        m_IPAOVTable(4) = AddOf(AddressOf IPAO_ContextSensitiveHelp)
        m_IPAOVTable(5) = AddOf(AddressOf IPAO_TranslateAccelerator)
        m_IPAOVTable(6) = AddOf(AddressOf IPAO_OnFrameWindowActivate)
        m_IPAOVTable(7) = AddOf(AddressOf IPAO_OnDocWindowActivate)
        m_IPAOVTable(8) = AddOf(AddressOf IPAO_ResizeBorder)
        m_IPAOVTable(9) = AddOf(AddressOf IPAO_EnableModeless)
        With IID_IOleInPlaceActiveObject
           .Data1 = &H117&
           .Data4(0) = &HC0
           .Data4(7) = &H46
        End With
    End If
    With UniText_IPAOHook
        Set IPAO = Ctl
        CopyMemory .IPAOReal, IPAO, 4
        CopyMemory .Ctl, Ctl, 4
        .lpVTable = VarPtr(m_IPAOVTable(0))
        .ThisPointer = VarPtr(UniText_IPAOHook)
    End With
End Sub
Public Sub UniText_Terminate(UniText_IPAOHook As UniText_IPAOHook)
    With UniText_IPAOHook
        CopyMemory .IPAOReal, 0&, 4
        CopyMemory .Ctl, 0&, 4
    End With
End Sub
