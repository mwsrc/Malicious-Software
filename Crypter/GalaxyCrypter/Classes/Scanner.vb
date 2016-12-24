Imports System.Text
Imports System.Net
Imports System.Threading
Imports System.IO
Class Scan4You
    Private zID As String, zToken As String

    Public Sub New(pID As String, pToken As String)
        Me.zID = pID
        Me.zToken = pToken
    End Sub

    Public Function Scan(pFilename As String) As String
        Try
            Dim client As New WebClient()
            Dim postdata As Dictionary(Of [String], [Object]) = New Dictionary(Of String, Object)()
            postdata.Add("id", Me.zID)
            postdata.Add("token", Me.zToken)
            postdata.Add("action", "file")
            Dim name As String = pFilename.Substring(pFilename.LastIndexOf("\"c) + 1)
            postdata.Add("uppload", New FormUpload.FileParameter(File.ReadAllBytes(pFilename), name))
            postdata.Add("frmt", "json")
            postdata.Add("link", "1")
            Dim response As HttpWebResponse = Nothing
            response = FormUpload.MultipartFormDataPost("http://scan4you.net/remote.php", "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0", postdata, New String() {})
            While response Is Nothing
                Application.DoEvents()
                Thread.Sleep(50)
            End While
            Dim result As String = New StreamReader(response.GetResponseStream()).ReadToEnd()
            Return result
        Catch
            Return Nothing
        End Try
    End Function

    Protected Overrides Sub Finalize()
        Try
            Me.Dispose()
        Finally
            MyBase.Finalize()
        End Try
    End Sub

    Public Sub Dispose()
        Me.zToken = Nothing
        Me.zID = Nothing
    End Sub

    Private NotInheritable Class FormUpload
        Private Sub New()
        End Sub
        Private Shared ReadOnly encoding As Encoding = Encoding.UTF8
        Public Shared Function MultipartFormDataPost(postUrl As String, userAgent As String, postParameters As Dictionary(Of String, Object), headers As String()) As HttpWebResponse
            Dim formDataBoundary As String = [String].Format("----------{0:N}", Guid.NewGuid())
            Dim contentType As String = Convert.ToString("multipart/form-data; boundary=") & formDataBoundary

            Dim formData As Byte() = GetMultipartFormData(postParameters, formDataBoundary)

            Return PostForm(postUrl, contentType, formData, headers)
        End Function
        Private Shared Function PostForm(postUrl As String, contentType As String, formData As Byte(), headers As String()) As HttpWebResponse
            Dim request As HttpWebRequest = TryCast(WebRequest.Create(postUrl), HttpWebRequest)

            If request Is Nothing Then
                Throw New NullReferenceException("request is not a http request")
            End If

            ' Set up the request properties.
            request.Method = "POST"
            request.ContentType = contentType
            'request.UserAgent = userAgent;
            'request.CookieContainer = new CookieContainer();
            request.ContentLength = formData.Length
            For i As Integer = 0 To headers.Length - 1
                request.Headers.Add(headers(i))
            Next
            ' You could add authentication here as well if needed:
            ' request.PreAuthenticate = true;
            ' request.AuthenticationLevel = System.Net.Security.AuthenticationLevel.MutualAuthRequested;
            ' request.Headers.Add("Authorization", "Basic " + Convert.ToBase64String(System.Text.Encoding.Default.GetBytes("username" + ":" + "password")));

            ' Send the form data to the request.
            Using requestStream As Stream = request.GetRequestStream()
                requestStream.Write(formData, 0, formData.Length)
                requestStream.Close()
            End Using

            Return TryCast(request.GetResponse(), HttpWebResponse)
        End Function
        Private Shared Function GetMultipartFormData(postParameters As Dictionary(Of String, Object), boundary As String) As Byte()
            Dim formDataStream As Stream = New System.IO.MemoryStream()
            Dim needsCLRF As Boolean = False

            For Each param In postParameters
                ' Thanks to feedback from commenters, add a CRLF to allow multiple parameters to be added.
                ' Skip it on the first parameter, add it to subsequent parameters.
                If needsCLRF Then
                    formDataStream.Write(encoding.GetBytes(vbCr & vbLf), 0, encoding.GetByteCount(vbCr & vbLf))
                End If

                needsCLRF = True

                If TypeOf param.Value Is FileParameter Then
                    Dim fileToUpload As FileParameter = DirectCast(param.Value, FileParameter)

                    ' Add just the first part of this param, since we will write the file data directly to the Stream
                    Dim header As String = String.Format("--{0}" & vbCr & vbLf & "Content-Disposition: form-data; name=""{1}""; filename=""{2}""" & vbCr & vbLf & "Content-Type: {3}" & vbCr & vbLf & vbCr & vbLf, boundary, param.Key, If(fileToUpload.FileName, param.Key), If(fileToUpload.ContentType, "application/octet-stream"))

                    formDataStream.Write(encoding.GetBytes(header), 0, encoding.GetByteCount(header))

                    ' Write the file data directly to the Stream, rather than serializing it to a string.
                    formDataStream.Write(fileToUpload.File, 0, fileToUpload.File.Length)
                Else
                    Dim postData As String = String.Format("--{0}" & vbCr & vbLf & "Content-Disposition: form-data; name=""{1}""" & vbCr & vbLf & vbCr & vbLf & "{2}", boundary, param.Key, param.Value)
                    formDataStream.Write(encoding.GetBytes(postData), 0, encoding.GetByteCount(postData))
                End If
            Next

            ' Add the end of the request.  Start with a newline
            Dim footer As String = (Convert.ToString(vbCr & vbLf & "--") & boundary) + "--" & vbCr & vbLf
            formDataStream.Write(encoding.GetBytes(footer), 0, encoding.GetByteCount(footer))

            ' Dump the Stream into a byte[]
            formDataStream.Position = 0
            Dim formData As Byte() = New Byte(formDataStream.Length - 1) {}
            formDataStream.Read(formData, 0, formData.Length)
            formDataStream.Close()

            Return formData
        End Function
        Public Class FileParameter
            Public Property File() As Byte()
                Get
                    Return m_File
                End Get
                Set(value As Byte())
                    m_File = Value
                End Set
            End Property
            Private m_File As Byte()
            Public Property FileName() As String
                Get
                    Return m_FileName
                End Get
                Set(value As String)
                    m_FileName = Value
                End Set
            End Property
            Private m_FileName As String
            Public Property ContentType() As String
                Get
                    Return m_ContentType
                End Get
                Set(value As String)
                    m_ContentType = Value
                End Set
            End Property
            Private m_ContentType As String
            Public Sub New(file As Byte())
                Me.New(file, Nothing)
            End Sub
            Public Sub New(file As Byte(), filename As String)
                Me.New(file, filename, Nothing)
            End Sub
            Public Sub New(file__1 As Byte(), filename__2 As String, contenttype__3 As String)
                File = file__1
                FileName = filename__2
                ContentType = contenttype__3
            End Sub
        End Class
    End Class
End Class