Imports System.IO
Imports System.Drawing
Imports System.IO.Compression
Imports System.Collections.Generic
Class Pixelate
#Region "Forward Functions"
    Public Shared Function Forward(data As Byte()) As Bitmap
        Dim TotalPixels As Double = (CDbl(data.Length) / CDbl(3)) + CDbl(20)
        Dim SquareRoot As Double = Math.Sqrt(TotalPixels)
        Dim WidthAndHeight As Integer = CInt(Math.Truncate(Math.Ceiling(SquareRoot))) + 20
        Dim Stub As New Bitmap(WidthAndHeight, WidthAndHeight)
        Dim BytesWritten As Integer = 0
        For x As Integer = 0 To Stub.Width - 1
            For y As Integer = 1 To Stub.Height - 1
                If BytesWritten <= data.Length Then
                    Dim R As Integer = 0, G As Integer = 0, B As Integer = 0
                    Try
                        R = data(BytesWritten)
                    Catch
                    End Try
                    Try
                        G = data(BytesWritten + 1)
                    Catch
                    End Try
                    Try
                        B = data(BytesWritten + 2)
                    Catch
                    End Try
                    Stub.SetPixel(x, y, Color.FromArgb(R, G, B))
                    BytesWritten += 3
                Else
                    Stub.SetPixel(0, 0, Color.FromArgb(0, 0, 0, 0))
                End If
            Next
        Next
        Return Stub
    End Function
#End Region

#Region "Reverse Functions"
    Public Shared Function Reverse(data As Bitmap) As Byte()
        Dim ByteList As List(Of Byte) = New List(Of [Byte])()
        For x As Integer = 0 To data.Width - 1
            For y As Integer = 0 To data.Height - 1
                Dim Pixel As Color = data.GetPixel(x, y)
                If Pixel <> Color.FromArgb(0, 0, 0, 0) Then
                    ByteList.Add(Pixel.R)
                    ByteList.Add(Pixel.G)
                    ByteList.Add(Pixel.B)
                End If
            Next
        Next
        Return Decompress(ByteList.ToArray())
    End Function
    Private Shared Function Decompress(zippedData As Byte()) As Byte()
        Dim decompressedData As Byte() = Nothing
        Using outputStream As New MemoryStream()
            Using inputStream As New MemoryStream(zippedData)
                Using zip As New GZipStream(inputStream, CompressionMode.Decompress)
                    CopyTo(zip, outputStream)
                End Using
            End Using
            decompressedData = outputStream.ToArray()
        End Using
        Return decompressedData
    End Function
    Private Shared Sub CopyTo(source As Stream, destination As Stream)
        Dim buffer As Byte() = New Byte(2047) {}
        Dim bytesRead As Integer
        While (InlineAssignHelper(bytesRead, source.Read(buffer, 0, buffer.Length))) > 0
            destination.Write(buffer, 0, bytesRead)
        End While
    End Sub
    Private Shared Function InlineAssignHelper(Of T)(ByRef target As T, value As T) As T
        target = value
        Return value
    End Function
#End Region
End Class
