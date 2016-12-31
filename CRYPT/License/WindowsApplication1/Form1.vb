'
'VAQXINE
'         Credits to Miharbi for writing the original code  <3
'
Imports Microsoft.Win32

Public Class Form1

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        '
        'Replace the Key string with your own license
        'When the program runs, the user is told to enter a license key
        'If the license key matches the key you specified, the program runs
        'and the key is added to the registry so it is remembered for each time
        '
        Dim key As String = "x9xxVAQXINExx6x" 'Specify License Key 
        Dim licence As RegistryKey = Registry.CurrentUser.CreateSubKey("software\vaqxine", RegistryKeyPermissionCheck.Default)
        If licence.GetValue("licence") Is Nothing Then
            Dim input As String = InputBox("Enter Your License Key", "Please Register Your Program!")
            If input <> key Then
                MsgBox("Please Enter A Valid License Key!", MsgBoxStyle.Exclamation, "Invalid Key")
                End
            Else
                licence.SetValue("licence", key)
                MsgBox("Click Ok to continue", MsgBoxStyle.Information, "License Key accepted")
            End If
        ElseIf licence.GetValue("licence") <> key Then
            Dim input As String = InputBox("Enter your registration key", "Your current licence is not valid")
            If input <> key Then
                MsgBox("Please Enter A Valid License Key!", MsgBoxStyle.Exclamation, "Invalid Key")
                End
            Else
                licence.SetValue("licence", key)
                MsgBox("Click Ok to continue", MsgBoxStyle.Information, "Registration key accepted")
            End If
        End If
        licence.Close()
    End Sub
End Class
