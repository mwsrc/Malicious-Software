Attribute VB_Name = "ScreenCap"
Option Explicit

Private Declare Function GetDesktopWindow Lib "user32" () As Long
Private Declare Function GetDC Lib "user32" (ByVal hWND As Long) As Long
Private Declare Function GetWindowDC Lib "user32" (ByVal hWND As Long) As Long
Private Declare Function BitBlt Lib "gdi32" (ByVal hDCDest As Long, ByVal xDest As Long, ByVal YDest As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hDCSrc As Long, ByVal XSrc As Long, ByVal YSrc As Long, ByVal dwRop As Long) As Long
Private Declare Function GetWindowRect Lib "user32" (ByVal hWND As Long, lpRect As RECT) As Long
Private Declare Function StretchBlt Lib "gdi32" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal XSrc As Long, ByVal YSrc As Long, ByVal nSrcWidth As Long, ByVal nSrcHeight As Long, ByVal dwRop As Long) As Long
Private Declare Function ReleaseDC Lib "user32" (ByVal hWND As Long, ByVal hdc As Long) As Long
Private Type RECT
    Left As Long
    Top As Long
    Right As Long
    Bottom As Long
End Type
Private Const SRCCOPY = &HCC0020

Private Type GUID
   Data1 As Long
   Data2 As Integer
   Data3 As Integer
   Data4(0 To 7) As Byte
End Type

Private Type GdiplusStartupInput
   GdiplusVersion As Long
   DebugEventCallback As Long
   SuppressBackgroundThread As Long
   SuppressExternalCodecs As Long
End Type

Private Type EncoderParameter
   GUID As GUID
   NumberOfValues As Long
   Type As Long
   Value As Long
End Type

Private Type EncoderParameters
   Count As Long
   Parameter As EncoderParameter
End Type

Private Declare Function GdiplusStartup Lib "GDIPlus" ( _
   token As Long, _
   inputbuf As GdiplusStartupInput, _
   Optional ByVal outputbuf As Long = 0) As Long

Private Declare Function GdiplusShutdown Lib "GDIPlus" ( _
   ByVal token As Long) As Long

Private Declare Function GdipCreateBitmapFromHBITMAP Lib "GDIPlus" ( _
   ByVal hbm As Long, _
   ByVal hPal As Long, _
   BITMAP As Long) As Long

Private Declare Function GdipDisposeImage Lib "GDIPlus" ( _
   ByVal Image As Long) As Long

Private Declare Function GdipSaveImageToFile Lib "GDIPlus" ( _
   ByVal Image As Long, _
   ByVal FileName As Long, _
   clsidEncoder As GUID, _
   encoderParams As Any) As Long

Private Declare Function CLSIDFromString Lib "ole32" ( _
   ByVal str As Long, _
   ID As GUID) As Long

Public Sub SaveJPG(ByVal pict As StdPicture, ByVal FileName As String, Optional ByVal Quality As Byte = 80)
Dim tSI As GdiplusStartupInput
Dim lRes As Long
Dim lGDIP As Long
Dim lBitmap As Long

' AnticipatingMistakes
On Error Resume Next

   ' Initialize GDI+
   tSI.GdiplusVersion = 1
   lRes = GdiplusStartup(lGDIP, tSI)

   If lRes = 0 Then

      ' Create the GDI+ bitmap
      ' from the image handle
      lRes = GdipCreateBitmapFromHBITMAP(pict.Handle, 0, lBitmap)

      If lRes = 0 Then
         Dim tJpgEncoder As GUID
         Dim tParams As EncoderParameters

         ' Initialize the encoder GUID
         CLSIDFromString StrPtr("{557CF401-1A04-11D3-9A73-0000F81EF32E}"), _
                         tJpgEncoder

         ' Initialize the encoder parameters
         tParams.Count = 1
         With tParams.Parameter ' Quality
            ' Set the Quality GUID
            CLSIDFromString _
StrPtr("{1D5BE4B5-FA4A-452D-9CDD-5DB35105E7EB}"), .GUID
            .NumberOfValues = 1
            .Type = 4
            .Value = VarPtr(Quality)
         End With

         ' Save the image
         lRes = GdipSaveImageToFile( _
                  lBitmap, _
                  StrPtr(FileName), _
                  tJpgEncoder, _
                  tParams)

         ' Destroy the bitmap
         GdipDisposeImage lBitmap

      End If

      ' Shutdown GDI+
      GdiplusShutdown lGDIP

   End If

   If lRes Then
      Err.Raise 5, , "Cannot save the image. GDI+ Error:" & lRes
   End If

End Sub

Public Function Screenshot_DesktopWindow( _
RetPictureBox As PictureBox, _
SaveFilePath As String, _
Optional JPGImageQuality As Byte = 80)

' Anticipating mistakes
On Error Resume Next

Dim desktop_rect As RECT
Dim desktop_win As Long
Dim desktop_dc As Long
Dim desktop_wid As Long
Dim desktop_hgt As Long
Dim x As Long
Dim y As Long
Dim wid As Long
Dim hgt As Long

    ' Get the desktop size in pixels.
    desktop_win = GetDesktopWindow()
    desktop_dc = GetDC(desktop_win)
    GetWindowRect desktop_win, desktop_rect
    desktop_wid = desktop_rect.Right
    desktop_hgt = desktop_rect.Bottom

    ' Get the printable area.
    x = 0
    wid = desktop_wid
    y = 0
    hgt = desktop_hgt
    RetPictureBox.Width = RetPictureBox.ScaleX(wid, vbPixels, vbTwips)
    RetPictureBox.Height = RetPictureBox.ScaleY(hgt, vbPixels, vbTwips)

    ' Copy the desktop's image.
    StretchBlt _
        RetPictureBox.hdc, x, y, wid, hgt, _
        desktop_dc, 0, 0, desktop_wid, desktop_hgt, _
        SRCCOPY
    RetPictureBox.Picture = RetPictureBox.Image

    ' Release the desktop's device context.
    ReleaseDC desktop_win, desktop_dc

    ' Save the result into the file(and handle JPG save errors).
    SaveJPG RetPictureBox, SaveFilePath, JPGImageQuality
    'SavePicture RetPictureBox, SaveFilePath
    'End If
End Function
Public Function Screenshot_SpecialWindow( _
hWND As Long, _
RetPictureBox As PictureBox, _
SaveFilePath As String, _
Optional JPGImageQuality As Byte = 80)

' Anticipating mistakes
On Error Resume Next

Dim ret As Long
Dim WindowRect As RECT
Dim target_dc As Long
Dim nHeight As Long, nWidth As Long

    RetPictureBox.Cls 'Clear the picturebox
    ret = GetWindowRect(hWND, WindowRect) 'Get the windows co-ordinates
    nWidth = WindowRect.Right - WindowRect.Left 'Get the windows Width
    nHeight = WindowRect.Bottom - WindowRect.Top ' Get the windows height
    RetPictureBox.Width = RetPictureBox.ScaleX(nWidth, vbPixels, vbTwips)
    RetPictureBox.Height = RetPictureBox.ScaleY(nHeight, vbPixels, vbTwips)
    target_dc = GetWindowDC(hWND)
    ret = BitBlt(RetPictureBox.hdc, 0, 0, nWidth, nHeight, target_dc, 0, 0, vbSrcCopy) 'Get the windows image and copy it To the Picturebox
        ' Copy the desktop's image.
    StretchBlt _
        RetPictureBox.hdc, 0, 0, nWidth, nHeight, _
        target_dc, 0, 0, nWidth, nHeight, _
        SRCCOPY
    RetPictureBox.Picture = RetPictureBox.Image
    
    ' Save the result into the file(and handle JPG save errors).
    SaveJPG RetPictureBox, SaveFilePath, JPGImageQuality
    'SavePicture RetPictureBox, SaveFilePath
    'End If
    
End Function





