
Public Class Protect
    Public Shared Function Obfuscate(stub As String)
        Dim stuff As String() = New String() {"_RET", "_Rev", "PolyDeCrypt", "grbo", "_Reverse", "_Decompress", "_CopyTo", "InlineAssignHelper", "begin", "SU", "_filebytes", "_rv", "_x", "_Data", "_Key", "_ExtraRounds", "enci", "_offset", "_ByteList", "xxx", "yyy", "_Pixel", "xdata", "zippedData", "decompressedData", "outputStream", "inputStream", "_zip", "lsource", "ldestination", "tbuffer", "tbytesRead", "_target", "nvalue"}
        For i = 0 To stuff.Length - 1
            stub = stub.Replace(stuff(i), Misc.GeneratePassword(r.Next(4, 12)))
        Next
        Return stub
    End Function
    Private Shared r As Random = New Random()
End Class