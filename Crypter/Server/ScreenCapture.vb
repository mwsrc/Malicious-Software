Imports System.IO

Module ScreenCapture

    Private Declare Function CreateDC Lib "gdi32" Alias "CreateDCA" (ByVal lpDriverName As String, ByVal lpDeviceName As String, ByVal lpOutput As String, ByVal lpInitData As String) As Integer

    Private Declare Function CreateCompatibleDC Lib "GDI32" (ByVal hDC As Integer) As Integer

    Private Declare Function CreateCompatibleBitmap Lib "GDI32" (ByVal hDC As Integer, ByVal nWidth As Integer, ByVal nHeight As Integer) As Integer

    Private Declare Function GetDeviceCaps Lib "gdi32" Alias "GetDeviceCaps" (ByVal hdc As Integer, ByVal nIndex As Integer) As Integer

    Private Declare Function SelectObject Lib "GDI32" (ByVal hDC As Integer, ByVal hObject As Integer) As Integer

    Private Declare Function BitBlt Lib "GDI32" (ByVal srchDC As Integer, ByVal srcX As Integer, ByVal srcY As Integer, ByVal srcW As Integer, ByVal srcH As Integer, ByVal desthDC As Integer, ByVal destX As Integer, ByVal destY As Integer, ByVal op As Integer) As Integer

    Private Declare Function DeleteDC Lib "GDI32" (ByVal hDC As Integer) As Integer

    Private Declare Function DeleteObject Lib "GDI32" (ByVal hObj As Integer) As Integer

    Public oBitMap As Bitmap = Nothing
    Public ImgArray As Byte()

    Const SRCCOPY As Integer = &HCC0020

    Private FW, FH As Integer

    Public Sub CurrentScreen()
        'Captures the Current Screen and Stores in a Bitmap


        Dim hSDC, hMDC As Integer
        Dim hBMP, hBMPOld As Integer
        Dim r As Integer

        hSDC = CreateDC("DISPLAY", "", "", "")
        hMDC = CreateCompatibleDC(hSDC)

        FW = GetDeviceCaps(hSDC, 8)
        FH = GetDeviceCaps(hSDC, 10)
        hBMP = CreateCompatibleBitmap(hSDC, FW, FH)

        hBMPOld = SelectObject(hMDC, hBMP)
        r = BitBlt(hMDC, 0, 0, FW, FH, hSDC, 0, 0, 13369376)
        hBMP = SelectObject(hMDC, hBMPOld)

        r = DeleteDC(hSDC)
        r = DeleteDC(hMDC)

        oBitMap = Image.FromHbitmap(New IntPtr(hBMP))
        DeleteObject(hBMP)



    End Sub

End Module
