VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ClsAudio"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
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
Private Type WaveFormat
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

Public ID_Connection            As Long

Dim bRecord As Boolean, hWaveIn As Long
Dim Wave() As Byte, waveout() As Byte, dwWaveLength As Long
Dim InFormat As WAVEFORMATEX

Private Function GetDevCaps() As String
    Dim WaveFormat As WAVEOUTCAPS
            
    If waveOutGetDevCaps(0, WaveFormat, Len(WaveFormat)) = 0 Then
        GetDevCaps = Left$(WaveFormat.szPname, InStr(WaveFormat.szPname, Chr$(0)) - 1)
    End If
End Function


Private Sub Class_Initialize()
    With InFormat
        .wFormatTag = WAVE_FORMAT_PCM
        .nSamplesPerSec = 8000
        .wBitsPerSample = 16
        .nChannels = 1
        .nBlockAlign = InFormat.wBitsPerSample * InFormat.nChannels / 8
        .nAvgBytesPerSec = InFormat.nBlockAlign * InFormat.nSamplesPerSec
    End With
    
    dwWaveLength = 8194
    ReDim Wave(0 To (dwWaveLength - 1)) As Byte
    
End Sub

Private Sub StartRecord()

    Dim wvhdr As WAVEHDR, i As Integer
    Dim bData() As Byte
    
    WinSock32.SendData ID_Connection, "1" & Delimiter & GetDevCaps & END_DATA
    
    waveInOpen hWaveIn, WAVE_MAPPER, InFormat, 0, 0, 0
    wvhdr.lpData = VarPtr(Wave(0))
    wvhdr.dwBufferLength = dwWaveLength
    
    bRecord = True
    
    Do While bRecord = True
        waveInPrepareHeader hWaveIn, wvhdr, Len(wvhdr)
        waveInAddBuffer hWaveIn, wvhdr, Len(wvhdr)
        waveInStart hWaveIn
        
        Do While wvhdr.dwFlags <> 3
            DoEvents
             If ID_Connection = 0 Then Exit Do
        Loop
        
        If (wvhdr.dwBytesRecorded > 0) Then
            If Compress(Wave, bData) Then
                WinSock32.SendData ID_Connection, "0" & Delimiter
                WinSock32.SendData ID_Connection, bData
                WinSock32.SendData ID_Connection, END_DATA
            End If
        End If
        DoEvents
        waveInStop hWaveIn
        waveInUnprepareHeader hWaveIn, wvhdr, Len(wvhdr)
        If ID_Connection = 0 Then Exit Do
    Loop
    waveInReset hWaveIn
    waveInClose hWaveIn

End Sub

Private Sub StopRecord()
    bRecord = False
End Sub

Public Sub Socket_DataArrival(ID As Long, IP As String, Puerto As String, Data As String)
    On Error GoTo ErrHaddle
    
    Debug.Print Data
    If Data = 0 Then
        StartRecord
    Else
        Debug.Print "Stop"
        StopRecord
    End If
    
ErrHaddle:
End Sub

Public Sub Socket_Close(ID As Long, IP As String, Puerto As String)
    ID_Connection = 0
    StopRecord
End Sub

Public Sub Socket_Conect(ID As Long, IP As String, Puerto As String)
    
End Sub

Private Sub Class_Terminate()
    StopRecord
    ID_Connection = 0
End Sub
