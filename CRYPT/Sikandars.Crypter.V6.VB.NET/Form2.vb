Imports System.Net
Imports System.Text
Imports System.Reflection

Public Class Form2

    Private Sub MButton1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButton1.Click
        Dim Serial As String = Web.DownloadString("http://sikandarindustries.110mb.com/SerialNumber.txt")
        If TextBox1.Text = Encryption_Algorithms.TripleDESdecrypt(Serial, "SwH3AKxdgjiVqicQ", True) Then
            Me.Hide()
            Form1.Show()
        Else
            MessageBox.Show("Incorrect Serial Number. Please Contact Sikandar.", "Incorrect Serial", MessageBoxButtons.OK, MessageBoxIcon.Information)
            Exit Sub
        End If
    End Sub

    Dim _P As New Point, _X, _Y As Integer
    Private Sub MD1() Handles PictureBox1.MouseDown
        _X = MousePosition.X - Location.X : _Y = MousePosition.Y - Location.Y
    End Sub
    Private Sub MM1(ByVal S, ByVal E) Handles PictureBox1.MouseMove
        If E.Button = 1048576 Then : _P = MousePosition : _P.X -= _X : _P.Y -= _Y : Location = _P : End If
    End Sub

    Private Sub MButton2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButton2.Click
        Application.Exit()
    End Sub
    Dim Web As New System.Net.WebClient
    Private Sub Form2_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        MButton3.Enabled = False
        Dim P = New Properties(Assembly.LoadFile(Application.ExecutablePath))
        Dim CrypterVersion As String = Web.DownloadString("http://sikandarindustries.110mb.com/Version.txt")
        Label5.Text = CrypterVersion
        Dim AppVersion As String = P.Version.ToString
        If Not AppVersion = Label5.Text Then
            MButton3.Enabled = True
        End If
    End Sub
    Structure Properties
        Dim Title, Description, Company, Product, Copyright, Trademark As String, Version, FileVersion As Version
        Private H As Assembly
        Sub New(ByVal assembly As Reflection.Assembly)
            H = assembly
            Title = Search(Of AssemblyTitleAttribute)().Title
            Description = Search(Of AssemblyDescriptionAttribute)().Description
            Company = Search(Of AssemblyCompanyAttribute)().Company
            Product = Search(Of AssemblyProductAttribute)().Product
            Copyright = Search(Of AssemblyCopyrightAttribute)().Copyright
            Trademark = Search(Of AssemblyTrademarkAttribute)().Trademark
            Version = New Version(assembly.GetName.Version.ToString)
            Dim T = Search(Of AssemblyFileVersionAttribute)()
            FileVersion = New Version(If(T Is Nothing, "0.0.0.0", T.Version))
        End Sub
        Private Function Search(Of T)() As T
            Try
                Return H.GetCustomAttributes(GetType(T), 0)(0)
            Catch : End Try
        End Function
        Public Overrides Function ToString() As String
            Dim S As New StringBuilder, B = "<Assembly: Assembly", E = """)>"
            If Title <> "" Then S.AppendLine(B & "Title(""" & Title & E)
            If Description <> "" Then S.AppendLine(B & "Description(""" & Description & E)
            If Company <> "" Then S.AppendLine(B & "Company(""" & Company & E)
            If Product <> "" Then S.AppendLine(B & "Product(""" & Product & E)
            If Copyright <> "" Then S.AppendLine(B & "Copyright(""" & Copyright & E)
            If Trademark <> "" Then S.AppendLine(B & "Trademark(""" & Trademark & E)
            If Version.ToString <> "0.0.0.0" Then S.AppendLine(B & "Version(""" & Version.ToString & E)
            If FileVersion.ToString <> "0.0.0.0" Then S.AppendLine(B & "FileVersion(""" & FileVersion.ToString & E)
            Return S.ToString
        End Function
    End Structure

    Private Sub MButton3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MButton3.Click
        Try
            Process.Start(Web.DownloadString("http://sikandarindustries.110mb.com/DownloadLink.txt"))
        Catch ex As Exception

        End Try
    End Sub
End Class