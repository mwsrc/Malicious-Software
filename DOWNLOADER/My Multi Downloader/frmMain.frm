VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmMain 
   Caption         =   "My Multi Downloader"
   ClientHeight    =   4500
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   8535
   LinkTopic       =   "Form1"
   OLEDropMode     =   1  '수동
   ScaleHeight     =   4500
   ScaleWidth      =   8535
   StartUpPosition =   3  'Windows 기본값
   Begin VB.TextBox txtMaxActive 
      Height          =   270
      Left            =   1320
      TabIndex        =   17
      Text            =   "20"
      Top             =   3000
      Width           =   375
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   3840
      Top             =   3720
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Timer Timer1 
      Left            =   3240
      Top             =   3720
   End
   Begin VB.CommandButton cmdClear 
      Caption         =   "Clear"
      Height          =   375
      Left            =   7680
      TabIndex        =   15
      Top             =   240
      Width           =   735
   End
   Begin VB.CommandButton cmdRemove 
      Caption         =   "Remove"
      Height          =   375
      Left            =   6600
      TabIndex        =   14
      Top             =   240
      Width           =   975
   End
   Begin VB.CheckBox chkOnTop 
      Caption         =   "Always on top "
      Height          =   255
      Left            =   6840
      TabIndex        =   13
      Top             =   3000
      Value           =   1  '확인
      Width           =   1575
   End
   Begin VB.CommandButton cmdChangePath 
      Caption         =   "Change"
      Height          =   375
      Left            =   120
      TabIndex        =   12
      Top             =   3720
      Width           =   855
   End
   Begin VB.TextBox txtSavePath 
      Height          =   270
      Left            =   1320
      TabIndex        =   11
      Top             =   3360
      Width           =   7095
   End
   Begin VB.TextBox txtExtension 
      Height          =   270
      Left            =   5640
      TabIndex        =   9
      Text            =   "au"
      Top             =   3000
      Width           =   615
   End
   Begin VB.CheckBox chkRenameExtension 
      Caption         =   "Rename extension:"
      Height          =   375
      Left            =   4320
      TabIndex        =   8
      Top             =   2925
      Width           =   1215
   End
   Begin VB.ListBox listSave 
      Height          =   240
      Left            =   3120
      OLEDropMode     =   1  '수동
      TabIndex        =   7
      Top             =   3000
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.CommandButton cmdAdd 
      Caption         =   "Add"
      Height          =   375
      Left            =   5760
      TabIndex        =   6
      Top             =   240
      Width           =   735
   End
   Begin VB.ComboBox cboURL 
      Height          =   300
      Left            =   120
      OLEDropMode     =   1  '수동
      TabIndex        =   5
      Top             =   240
      Width           =   5535
   End
   Begin VB.ListBox listURL 
      Height          =   2040
      Left            =   120
      OLEDropMode     =   1  '수동
      TabIndex        =   4
      Top             =   720
      Width           =   8295
   End
   Begin VB.CommandButton cmdStop 
      Caption         =   "Stop"
      Height          =   375
      Left            =   7560
      TabIndex        =   3
      Top             =   3720
      Width           =   855
   End
   Begin VB.CommandButton cmdStart 
      Caption         =   "Start"
      Height          =   375
      Left            =   6600
      TabIndex        =   2
      Top             =   3720
      Width           =   855
   End
   Begin MSComctlLib.ProgressBar ProgressBar1 
      Height          =   255
      Left            =   240
      TabIndex        =   1
      Top             =   7200
      Width           =   3495
      _ExtentX        =   6165
      _ExtentY        =   450
      _Version        =   393216
      Appearance      =   1
   End
   Begin MSComctlLib.StatusBar StatusBar 
      Align           =   2  '아래 맞춤
      Height          =   330
      Left            =   0
      TabIndex        =   0
      Top             =   4170
      Width           =   8535
      _ExtentX        =   15055
      _ExtentY        =   582
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   2
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   5292
            MinWidth        =   5292
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   8819
            MinWidth        =   8819
         EndProperty
      EndProperty
   End
   Begin VB.Label lblMaxActive 
      Caption         =   "Max active:"
      Height          =   255
      Left            =   120
      TabIndex        =   16
      Top             =   3000
      Width           =   1095
   End
   Begin VB.Label lblSavePath 
      Caption         =   "Save path:"
      Height          =   255
      Left            =   120
      TabIndex        =   10
      Top             =   3375
      Width           =   1095
   End
   Begin VB.Menu mnuPopup 
      Caption         =   "Popup"
      Begin VB.Menu mnuPopupFileOpen 
         Caption         =   "Open File"
      End
      Begin VB.Menu mnuPopupFileSave 
         Caption         =   "Save As"
      End
      Begin VB.Menu bar1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuPopupOpenURL 
         Caption         =   "Open URL"
      End
      Begin VB.Menu mnuPopupOpenDownload 
         Caption         =   "Open Downlaoded File"
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'----------------------------------------------------------------------------------------'
'
' Multi Downloader using multithreadings
' Created by Suk Yong Kim, 03/14/2001
'
' This project is my first project to upload to the PSC.
' Many persons contribute to create this project
' I really appreicate their efforts and codes and the great server PSC.
'
' if any question, mail to : techtrans@dreamwiz.com
'----------------------------------------------------------------------------------------'



'API Declarations
Private Declare Function TerminateProcess Lib "kernel32" (ByVal hProcess As Long, ByVal uExitCode As Long) As Long
Private Declare Function GetCurrentProcess Lib "kernel32" () As Long

'API  and constant for listbox tool tip
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" _
    (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Private Const LB_ITEMFROMPOINT = &H1A9
Private Const EM_GETLINECOUNT = &HBA

'Flag to diable the list box click event when open a file
Public bDisableClickEvent As Boolean

'Class Module Collection for control of multi threads
Private cThreadControls As New clsThreadings

'Winddow minimum size value
Private sglFixedWidth As Single
Private sglFixedHeight As Single

'put the form on top or take down
Private Sub chkOnTop_Click()
    If chkOnTop.Value = vbChecked Then
        Call putMeOnTop(Me)
    Else
        Call takeMeDown(Me)
    End If
End Sub

'Rename the extension when save to the local folder
Private Sub chkRenameExtension_Click()
    txtExtension.Enabled = IIf(chkRenameExtension.Value = vbChecked, True, False)
End Sub

'Add the text in the combo box  to the list box
Private Sub cmdAdd_Click()
    Call AddURL(cboURL.Text)
End Sub


'To show the current total of list box items
Sub ShowSatus()
    StatusBar.Panels(1).Text = "Total: " & listURL.ListCount
    If listURL.ListIndex < 0 Then
        StatusBar.Panels(2).Text = ""
    Else
        StatusBar.Panels(2).Text = fnGetShortName(listSave.List(listURL.ListIndex))
    End If
End Sub

'Add the URL obtained through drag and drop or combo box to lis box
Function AddURL(ByVal Item As String)

    Dim ItemSave As String
    Item = Trim(Replace(Item, vbCrLf, Space(1))) 'convert vbcrlf to space
    If Len(Item) = 0 Then Exit Function
    If Not IsInList(listURL, Item) Then ' if not in list box, add it
        Dim IsWebURL As Boolean
        If fnIsURL(Item, , , IsWebURL) And IsWebURL Then 'check it is web url, not local url
            cboURL.AddItem Item
            listURL.AddItem Item
        End If
    End If
    Call ShowSatus
    Call ChangeSaveFileName
End Function

Function ChangeSaveFileName()
    'when filenames are same, change it
    'this function is also used to show the list box tool tips and statusbar text
    'which shows thelocal save files names of the selected lisbox item
    'to do this, it use the a hidden list box, listSave
    Dim ItemSaveName As String
    Dim ItemSavePathName As String
    Dim ItemSavePath As String
    
    listSave.Clear 'Clear the listSave
    ItemSavePath = fnGetPathRemoveEndDelimeter(txtSavePath)
    Dim i As Long
    For i = 0 To listURL.ListCount - 1 'Get local save filenames
        
        ItemSaveName = fnGetFileName(listURL.List(i), True)
        ItemSavePathName = ItemSavePath & "\" & ItemSaveName
        
        If IsInList(listSave, ItemSavePathName) Then
            Dim strTempName As String
            Dim strTempExt As String, strTemp As String
            Dim iNum As Integer
            strTempName = fnGetNetFileName(ItemSaveName)
            strTempExt = fnGetExtension(ItemSaveName)
            strTemp = strTempName & "." & strTempExt
            
            iNum = 1
            Do
               strTemp = ItemSavePath & "\" & strTempName & "(" & iNum & ")" & "." & strTempExt
               iNum = iNum + 1
            Loop Until Not IsInList(listSave, strTemp)
            
            ItemSavePathName = strTemp
        End If

        'rename the extension if check box is checked
        If chkRenameExtension.Value = vbChecked And Len(txtExtension) > 0 Then
                ItemSavePathName = ItemSavePathName & "." & txtExtension
        End If
        
        listSave.AddItem ItemSavePathName 'Add the local save filenames
    Next
End Function
Function IsInList(list_box As ListBox, Item As String) 'used to check an item is already in the list box
    Dim i  As Long
    For i = 0 To list_box.ListCount - 1
        If list_box.List(i) = Item Then IsInList = True: Exit For
    Next
End Function

Private Sub cmdChangePath_Click()
    
    Dim Folder As String
    
    Call takeMeDown(Me) 'take down the form that the browser for foder window is on the top
    Folder = BrowseForFolder(txtSavePath, "Select the folder to save downloads.")
    
    If Len(Folder) Then ' if not the cancel button is clicked
        txtSavePath = Folder
        Call ChangeSaveFileName 'change the listSave items to reflect the change of save  path
        If listURL.ListIndex < 0 Then
            StatusBar.Panels(2).Text = ""
        Else
            StatusBar.Panels(2).Text = fnGetShortName(listSave.List(listURL.ListIndex))
        End If
    End If
     'put the form on top if chck box is chekced
    If Me.chkOnTop.Value = vbChecked Then Call putMeOnTop(Me)
End Sub

Private Sub cmdClear_Click()
    listURL.Clear
    Call ShowSatus
End Sub

Private Sub cmdRemove_Click()
    Dim i As Long
    For i = listURL.ListCount - 1 To 0 Step -1
        If listURL.Selected(i) Then
            listURL.RemoveItem i
            Exit For
        End If
    Next
    If i = 0 And listURL.ListCount > 0 Then
        listURL.ListIndex = 0 'select first item
    ElseIf i <= listURL.ListCount - 1 Then
        listURL.ListIndex = i 'select next item
    ElseIf listURL.ListCount > 0 Then 'select last item
        listURL.ListIndex = listURL.ListCount - 1
    End If
    
    Call ChangeSaveFileName 'refelct the change of list items
    Call ShowSatus
End Sub

Private Sub cmdStart_Click()
    On Error Resume Next
    
    If listURL.ListCount < 1 Then Exit Sub 'if there is no item to download, exit sub
    
    
    
     'if the save path does not exists
     'ask whether to create it
    If Not fnFolderExists(Me.txtSavePath) Then
        If MsgBox("Do you wnat to create new folder?" & vbCr & txtSavePath, vbQuestion + vbYesNo, "My Multi Downloader") = vbYes Then
            If Not fnCreateFolder(txtSavePath) Then
                MsgBox "Cannot create folder!" & vbCr & txtSavePath, vbCritical
                Exit Sub
            End If
        Else
            Exit Sub
        End If
    End If
    
    'Diable the start button and enabled the stop button
    cmdStart.Enabled = False
    cmdStop.Enabled = True
    
    'Get the local save filenames
    Call ChangeSaveFileName
   
    
    'Turn off the timer while the threadings are prcessing
    'Timer will be used to check whether threaded downlaod files are saved in the save folder
    Timer1.Interval = 0
    
     'Reset the thread control collection
    Set cThreadControls = Nothing
    
     'Get the maximum number of active threads
     iMaxActiveDownloader = Val(Me.txtMaxActive)
    If iMaxActiveDownloader <= 0 Then iMaxActiveDownloader = 7
    If iMaxActiveDownloader > 20 Then iMaxActiveDownloader = 20
    
    'Get  the array of  local save filenames as many as the maximum number of active threads
    Call ReDimURLDestination(iMaxActiveDownloader - 1)
    
    Dim i As Long
    'Reset the flags used to denote whether the download functions are already used to download a file
    For i = 0 To 19
        IsDownloaderBusy(i) = False
    Next

    Dim iDownloader As Long 'this variable is used to indicate the current available function
    
    dtDownloadStart = Now 'Set the reference time to show the time elapsed
    frmMain.StatusBar.Panels(2).Text = "Downloading ... " & listSave.ListCount & " files" 'show the starting status text
    
    'Now, process the download items
    For i = 0 To listURL.ListCount - 1
        
        'if a download file already exists, skip it
        If fnFileExists(listSave.List(i)) Then GoTo ProcessNextItem
        
        'Show the progress, this is not real download status, just threadings, that is, startings of downloads
        'But it's a good idea to use it in showing download prgresss
        
        'Show the time elapsed
         frmMain.StatusBar.Panels(1).Text = Format(Now - dtDownloadStart, "hh:mm:ss")
         frmMain.StatusBar.Panels(2).Text = "Downloading " & i + 1 & " of " & listSave.ListCount
'         DoEvents: Call Sleep(2000)
        
       
        'NOTE: threadings can be applied to only PUBLIC functions with NO parameters
        'So we have to use variables to denote the available functions
        iDownloader = GetNextAvailableDownloader  'Get the ID of the public function available to download a file
        If iDownloader = -1 Then 'if all  downloader f functions are busy, wait until an available downloader function is got.
             Do
                    DoEvents
'                    Call Sleep(1500)
                    iDownloader = GetNextAvailableDownloader
                    If iDownloader >= 0 Then Exit Do
             Loop
        End If
        
      'At this step,
      'we have to terminate not only the available thread
      'but also all other previous threads which has done its job
      'because we have to manually terminate the threads.
      'IF we do NOT terminate the threads, the application or system will crash.
       If Not cThreadControls Is Nothing Then
            Dim j As Long
            For j = cThreadControls.Count To 1 Step -1
                If iDownloader = cThreadControls.Item(j).iDownloader _
                        And IsDownloaderBusy(j) = False And i <> listURL.ListCount - 1 Then
                       Call cThreadControls.TerminateThread(j) 'Terminate the threads
                End If
            Next
       End If
       
        
ProcessDownloading:
        IsDownloaderBusy(iDownloader) = True 'Set the available downloader function flag to BUSY
        URLToDownload(iDownloader) = listURL.List(i) 'Set the url  to the downloder url buffer
        URLSaveDestination(iDownloader) = listSave.List(i) 'Set the save file names to the downloader save file buffer
        
        Select Case iDownloader 'Max 20 functions cab be used to multiple downlaods
                                                'but active threads are set in the txtMaxActive box
            Case 0
                Call cThreadControls.CreateNewThread(0, AddressOf Download0, tpNormal, True)
            Case 1
                Call cThreadControls.CreateNewThread(1, AddressOf Download1, tpNormal, True)
            Case 2
                 Call cThreadControls.CreateNewThread(2, AddressOf Download2, tpNormal, True)
            Case 3
                Call cThreadControls.CreateNewThread(3, AddressOf Download3, tpNormal, True)
            Case 4
                Call cThreadControls.CreateNewThread(4, AddressOf Download4, tpNormal, True)
            Case 5
                Call cThreadControls.CreateNewThread(5, AddressOf Download5, tpNormal, True)
            Case 6
                Call cThreadControls.CreateNewThread(6, AddressOf Download6, tpNormal, True)
            Case 7
                Call cThreadControls.CreateNewThread(7, AddressOf Download7, tpNormal, True)
            Case 8
                Call cThreadControls.CreateNewThread(8, AddressOf Download8, tpNormal, True)
            Case 9
                Call cThreadControls.CreateNewThread(9, AddressOf Download9, tpNormal, True)
            Case 10
                Call cThreadControls.CreateNewThread(10, AddressOf Download10, tpNormal, True)
            Case 11
                Call cThreadControls.CreateNewThread(11, AddressOf Download11, tpNormal, True)
            Case 12
                 Call cThreadControls.CreateNewThread(12, AddressOf Download12, tpNormal, True)
            Case 13
                Call cThreadControls.CreateNewThread(13, AddressOf Download13, tpNormal, True)
            Case 14
                Call cThreadControls.CreateNewThread(14, AddressOf Download14, tpNormal, True)
            Case 15
                Call cThreadControls.CreateNewThread(15, AddressOf Download15, tpNormal, True)
            Case 16
                Call cThreadControls.CreateNewThread(16, AddressOf Download16, tpNormal, True)
            Case 17
                Call cThreadControls.CreateNewThread(17, AddressOf Download17, tpNormal, True)
            Case 18
                Call cThreadControls.CreateNewThread(18, AddressOf Download18, tpNormal, True)
            Case 19
                Call cThreadControls.CreateNewThread(19, AddressOf Download19, tpNormal, True)
        End Select
ProcessNextItem:
    Next
    'finally the threadings are finished
    
    'then we have to show the real download status using the Timer
    'we use Timer, because the threadings cannot show the download status
    Timer1.Interval = 1000
End Sub

Private Sub cmdStop_Click()
    Timer1.Interval = 0 'reset the Timer used to show the real download status
    Set cThreadControls = Nothing 'set the threads collection
    cmdStart.Enabled = True 'enabled the start button for new task
    Beep
End Sub

Private Sub Form_Load()
    cmdStop.Enabled = False
    txtExtension.Enabled = False
    'Get widow size settings and size limits
    sglFixedWidth = Me.cmdChangePath.Width + Me.cmdStart.Width + Me.cmdStop.Width + 500
    sglFixedHeight = 3000
    Call GetInitialRegistrySettings
    Call GetRegPutMeOnTop 'put the form on top or take down using the settings saved in the registry
    mnuPopup.Visible = False 'hide the popup button
End Sub
Private Sub Form_Unload(Cancel As Integer)
    'Save the last save path
    If Len(txtSavePath) Then Call SaveRegSavePath(txtSavePath)
    'Save window size
    Call SaveRegFormSizeSettings
    'save on top option
    Call SaveRegPutMeOnTop
'    Terminate the Threads
    Set cThreadControls = Nothing
'    Fully terminate the current process
    Call TerminateProcess(GetCurrentProcess, ByVal 0&)
End Sub
Private Sub Form_Resize()
    On Error Resume Next
    If Me.WindowState = vbMinimized Then Exit Sub
    If Me.Width < sglFixedWidth Then
        Me.Width = sglFixedWidth
    End If
    If Me.Width < sglFixedWidth + 500 Then
        cboURL.Visible = False
        chkRenameExtension.Visible = False
        txtExtension.Visible = False
        lblMaxActive.Visible = False
        txtMaxActive.Visible = True
    Else
        cboURL.Visible = True
        chkRenameExtension.Visible = True
        txtExtension.Visible = True
        lblMaxActive.Visible = True
        txtMaxActive.Visible = True
    End If
    
    If Me.Height < sglFixedHeight Then Me.Height = sglFixedHeight
    StatusBar.Panels(1).Width = Me.Width / 4
    StatusBar.Panels(2).Width = Me.Width - StatusBar.Panels(1).Width
    
    cmdClear.Move Me.ScaleWidth - cmdClear.Width - 100
    cmdRemove.Move cmdClear.Left - cmdRemove.Width - 100
    cmdAdd.Move cmdRemove.Left - cmdAdd.Width - 100
    cboURL.Move cboURL.Left, cboURL.Top, cmdAdd.Left - 100 - cboURL.Left
'    listURL
    cmdStop.Move Me.ScaleWidth - cmdStop.Width - 100, Me.ScaleHeight - cmdStop.Height - StatusBar.Height - 50
    cmdStart.Move cmdStop.Left - cmdStart.Width - 100, cmdStop.Top
    cmdChangePath.Move cmdChangePath.Left, cmdStop.Top
    lblSavePath.Move lblSavePath.Left, cmdChangePath.Top - lblSavePath.Height - 100
    
    txtSavePath.Move txtSavePath.Left, cmdChangePath.Top - txtSavePath.Height - 100, Me.ScaleWidth - txtSavePath.Left - 100
    
    chkOnTop.Move Me.ScaleWidth - chkOnTop.Width - 100, txtSavePath.Top - chkOnTop.Height - 100
    txtExtension.Move chkOnTop.Left - txtExtension.Width - 100, txtSavePath.Top - txtExtension.Height - 100
    chkRenameExtension.Move txtExtension.Left - chkRenameExtension.Width - 100, txtSavePath.Top - chkRenameExtension.Height - 50
    
    lblMaxActive.Move lblMaxActive.Left, txtExtension.Top + 30
    If Me.Width < sglFixedWidth + 1000 Then
        lblMaxActive.Visible = False
        chkRenameExtension.Visible = False
       txtMaxActive.Move lblMaxActive.Left, txtExtension.Top
    Else
        lblMaxActive = "Max Active"
        txtMaxActive.Move lblMaxActive.Left + lblMaxActive.Width + 100, txtExtension.Top
    End If
    
    listURL.Move listURL.Left, listURL.Top, Me.ScaleWidth - listURL.Left - 100, chkOnTop.Top - listURL.Top - 100
End Sub


Private Sub Form_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, x As Single, y As Single)
    'if an url is drag and dropped from browser, add it to the URL list box
    If Data.GetFormat(vbCFText) Then Call AddURL(Data.GetData(vbCFText))
End Sub

Private Sub listURL_Click()
    If bDisableClickEvent Then Exit Sub
    If listURL.ListIndex < 0 Then Exit Sub
    StatusBar.Panels(2).Text = fnGetShortName(listSave.List(listURL.ListIndex))
End Sub

Private Sub listURL_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
'    If listURL.ListIndex < 0 Then Exit Sub
    If Button = 2 Then
        Me.bar1.Visible = (listURL.ListIndex >= 0)
        If listURL.ListIndex >= 0 Then
            mnuPopupOpenDownload.Visible = fnFileExists(listSave.List(listURL.ListIndex)) 'Show the menu if save file exists
            mnuPopupOpenURL.Visible = True
            mnuPopupOpenURL.Tag = listURL.List(listURL.ListIndex) 'Use the tag to save the listURL
            mnuPopupOpenDownload.Tag = listSave.List(listURL.ListIndex) 'Use the tag to save the local save file name
        Else
            mnuPopupOpenURL.Visible = False
            mnuPopupOpenDownload.Visible = False
        End If
        
        Call PopupMenu(mnuPopup) 'Popup the menu
    End If
End Sub

Private Sub listURL_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    Dim lXPoint As Long
    Dim lYPoint As Long
    Dim lIndex As Long
    If Button = 0 Then 'if no button was pressed
        lXPoint = CLng(x / Screen.TwipsPerPixelX)
        lYPoint = CLng(y / Screen.TwipsPerPixelY)
        With listURL
            'get selected item from list
            lIndex = SendMessage(.hwnd, LB_ITEMFROMPOINT, 0, ByVal ((lYPoint * 65536) + lXPoint))
            'show tip or clear last one
            If (lIndex >= 0) And (lIndex <= .ListCount) Then
                .ToolTipText = listSave.List(lIndex) 'show the save file name in the tooltip
            Else
                .ToolTipText = ""
            End If
        End With
    End If
End Sub

Private Sub listURL_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, x As Single, y As Single)
    
    'if an url is drag and dropped from browser, add it to the URL list box
    If Data.GetFormat(vbCFText) Then
        Call AddURL(Data.GetData(vbCFText))
   'if file or directory
    ElseIf Data.GetFormat(vbCFFiles) Then
        Dim sFile As String
        Dim i As Integer
        Dim numFiles As Integer
        numFiles = Data.Files.Count
        For i = 1 To numFiles
            If (GetAttr(Data.Files(i)) And vbDirectory) <> vbDirectory Then
                sFile = Data.Files(i) 'Skip directory and get the first file
                Exit For
            End If
        Next i
        Call frmMainFileOpenAs(sFile) 'Open the file
    End If
End Sub
Private Sub cboURL_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, x As Single, y As Single)
    If Data.GetFormat(vbCFText) Then
        Dim Item As String
        'if an url is drag and dropped from browser, add it to the combo box
        Item = Trim(Replace(Data.GetData(vbCFText), vbCrLf, Space(1)))
        If Len(Item) Then cboURL.Text = Item
    End If
End Sub

Private Sub mnuPopupFileOpen_Click()
    Call frmMainFileOpenAs 'Open a file
End Sub

Private Sub mnuPopupFileSave_Click()
    Call frmMainFileSaveAs 'Save the list box items as a file
End Sub

Private Sub mnuPopupOpenDownload_Click()
    Call ftnRunAnyFile(mnuPopupOpenDownload.Tag) 'run the item
End Sub

Private Sub mnuPopupOpenURL_Click()
    Call ftnRunAnyFile(mnuPopupOpenURL.Tag) 'run the item
End Sub

Private Sub Timer1_Timer()
    Call ShowDownloadStatus 'This will show the real download status
End Sub
Public Function ShowDownloadStatus()
    Dim iDownloadCompleted As Long
    Dim i As Long
'    Timer1.Interval = 0
    
    For i = 0 To listSave.ListCount - 1
        If fnFileExists(listSave.List(i)) Then 'if a download file exists
            If FileLen(listSave.List(i)) > 0 Then 'and its length is positive
                iDownloadCompleted = iDownloadCompleted + 1 'then count it
            End If
        End If
    Next
    
    'Call Sleep(1000)
    'Shwo the downloaded status
    frmMain.StatusBar.Panels(1).Text = Format(Now - dtDownloadStart, "hh:mm:ss")
    frmMain.StatusBar.Panels(2).Text = "Downloaded: " & iDownloadCompleted & " of " & listSave.ListCount
    
  
    If iDownloadCompleted >= listSave.ListCount Then  'if all items are downlaoded,
        Timer1.Interval = 0 'Rest the timer
        Set cThreadControls = Nothing 'Terminate all threads
        frmMain.cmdStart.Enabled = True 'Enable the start button for new task
        Beep
    End If
End Function

Private Sub txtMaxActive_Change()
    'limit of max. active threads
    If Val(Me.txtMaxActive) <= 0 Then Me.txtMaxActive = 0
    If Val(Me.txtMaxActive) > 20 Then Me.txtMaxActive = 20
End Sub
