VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsHuffman"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
Private Const PROGRESS_CALCFREQUENCY = 7
Private Const PROGRESS_CALCCRC = 5
Private Const PROGRESS_ENCODING = 88
Private Const PROGRESS_DECODING = 89
Private Const PROGRESS_CHECKCRC = 11
Event Progress(Procent As Integer)
Private Type HUFFMANTREE
  ParentNode As Integer
  RightNode As Integer
  LeftNode As Integer
  Value As Integer
  Weight As Long
End Type
Private Type ByteArray
  Count As Byte
  Data() As Byte
End Type
Private Declare Sub CopyMem Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)
Public Function EncodeFile(SourceFile As String) As Byte
  Dim ByteArray() As Byte
  Dim Filenr As Integer
  
  'Make sure the source file exists
  If (Not FileExist(SourceFile)) Then
    Err.Raise vbObjectError, "clsHuffman.EncodeFile()", "Source file does not exist"
  End If
  
  'Read the data from the sourcefile
  Filenr = FreeFile
  Open SourceFile For Binary As #Filenr
  ReDim ByteArray(0 To LOF(Filenr) - 1)
  Get #Filenr, , ByteArray()
  Close #Filenr
  
  'Compress the data
  Call EncodeByte(ByteArray(), UBound(ByteArray) + 1)
EncodeFile = ByteArray()
End Function
Public Sub DecodeFile(SourceFile As String, DestFile As String)

  Dim ByteArray() As Byte
  Dim Filenr As Integer
  
  'Make sure the source file exists
  If (Not FileExist(SourceFile)) Then
    Err.Raise vbObjectError, "clsHuffman.DecodeFile()", "Source file does not exist"
  End If
  
  'Read the data from the sourcefile
  Filenr = FreeFile
  Open SourceFile For Binary As #Filenr
  ReDim ByteArray(0 To LOF(Filenr) - 1)
  Get #Filenr, , ByteArray()
  Close #Filenr
  
  'Uncompress the data
  Call DecodeByte(ByteArray(), UBound(ByteArray) + 1)
  
  'If the destination file exist we need to
  'destroy it because opening it as binary
  'will not clear the old data
  If (FileExist(DestFile)) Then Kill DestFile
  
  'Save the destination string
  Open DestFile For Binary As #Filenr
  Put #Filenr, , ByteArray()
  Close #Filenr

End Sub
Private Sub CreateTree(Nodes() As HUFFMANTREE, NodesCount As Long, Char As Long, Bytes As ByteArray)

  Dim a As Integer
  Dim NodeIndex As Long
  
  NodeIndex = 0
  For a = 0 To (Bytes.Count - 1)
    If (Bytes.Data(a) = 0) Then
      'Left node
      If (Nodes(NodeIndex).LeftNode = -1) Then
        Nodes(NodeIndex).LeftNode = NodesCount
        Nodes(NodesCount).ParentNode = NodeIndex
        Nodes(NodesCount).LeftNode = -1
        Nodes(NodesCount).RightNode = -1
        Nodes(NodesCount).Value = -1
        NodesCount = NodesCount + 1
      End If
      NodeIndex = Nodes(NodeIndex).LeftNode
    ElseIf (Bytes.Data(a) = 1) Then
      'Right node
      If (Nodes(NodeIndex).RightNode = -1) Then
        Nodes(NodeIndex).RightNode = NodesCount
        Nodes(NodesCount).ParentNode = NodeIndex
        Nodes(NodesCount).LeftNode = -1
        Nodes(NodesCount).RightNode = -1
        Nodes(NodesCount).Value = -1
        NodesCount = NodesCount + 1
      End If
      NodeIndex = Nodes(NodeIndex).RightNode
    Else
      Stop
    End If
  Next
  
  Nodes(NodeIndex).Value = Char

End Sub
Public Sub EncodeByte(ByteArray() As Byte, ByteLen As Long)
  
  Dim i As Long
  Dim j As Long
  Dim Char As Byte
  Dim BitPos As Byte
  Dim lNode1 As Long
  Dim lNode2 As Long
  Dim lNodes As Long
  Dim lLength As Long
  Dim Count As Integer
  Dim lWeight1 As Long
  Dim lWeight2 As Long
  Dim Result() As Byte
  Dim ByteValue As Byte
  Dim ResultLen As Long
  Dim Bytes As ByteArray
  Dim NodesCount As Integer
  Dim NewProgress As Integer
  Dim CurrProgress As Integer
  Dim BitValue(0 To 7) As Byte
  Dim CharCount(0 To 255) As Long
  Dim Nodes(0 To 511) As HUFFMANTREE
  Dim CharValue(0 To 255) As ByteArray
  
  'If the source string is empty or contains
  'only one character we return it uncompressed
  'with the prefix string "HEO" & vbCr
  If (ByteLen = 0) Then
    ReDim Preserve ByteArray(0 To ByteLen + 3)
    If (ByteLen > 0) Then
      Call CopyMem(ByteArray(4), ByteArray(0), ByteLen)
    End If
    ByteArray(0) = 72 '"H"
    ByteArray(1) = 69 '"E"
    ByteArray(2) = 48 '"0"
    ByteArray(3) = 13 'vbCr
    Exit Sub
  End If
  
  'Create the temporary result array and make
  'space for identifier, checksum, textlen and
  'the ASCII values inside the Huffman Tree
  ReDim Result(0 To 522)
  
  'Prefix the destination string with the
  '"HE3" & vbCr identification string
  Result(0) = 72
  Result(1) = 69
  Result(2) = 51
  Result(3) = 13
  ResultLen = 4
  
  'Count the frequency of each ASCII code
  For i = 0 To (ByteLen - 1)
    CharCount(ByteArray(i)) = CharCount(ByteArray(i)) + 1
    If (i Mod 1000 = 0) Then
      NewProgress = i / ByteLen * PROGRESS_CALCFREQUENCY
      If (NewProgress <> CurrProgress) Then
        CurrProgress = NewProgress
        RaiseEvent Progress(CurrProgress)
      End If
    End If
  Next
  
  'Create a leaf for each character
  For i = 0 To 255
    If (CharCount(i) > 0) Then
      With Nodes(NodesCount)
        .Weight = CharCount(i)
        .Value = i
        .LeftNode = -1
        .RightNode = -1
        .ParentNode = -1
      End With
      NodesCount = NodesCount + 1
    End If
  Next
  
  'Create the Huffman Tree
  For lNodes = NodesCount To 2 Step -1
    'Get the two leafs with the smallest weights
    lNode1 = -1: lNode2 = -1
    For i = 0 To (NodesCount - 1)
      If (Nodes(i).ParentNode = -1) Then
        If (lNode1 = -1) Then
          lWeight1 = Nodes(i).Weight
          lNode1 = i
        ElseIf (lNode2 = -1) Then
          lWeight2 = Nodes(i).Weight
          lNode2 = i
        ElseIf (Nodes(i).Weight < lWeight1) Then
          If (Nodes(i).Weight < lWeight2) Then
            If (lWeight1 < lWeight2) Then
              lWeight2 = Nodes(i).Weight
              lNode2 = i
            Else
              lWeight1 = Nodes(i).Weight
              lNode1 = i
            End If
          Else
            lWeight1 = Nodes(i).Weight
            lNode1 = i
          End If
        ElseIf (Nodes(i).Weight < lWeight2) Then
          lWeight2 = Nodes(i).Weight
          lNode2 = i
        End If
      End If
    Next
    
    'Create a new leaf
    With Nodes(NodesCount)
      .Weight = lWeight1 + lWeight2
      .LeftNode = lNode1
      .RightNode = lNode2
      .ParentNode = -1
      .Value = -1
    End With
    
    'Set the parentnodes of the two leafs
    Nodes(lNode1).ParentNode = NodesCount
    Nodes(lNode2).ParentNode = NodesCount
    
    'Increase the node counter
    NodesCount = NodesCount + 1
  Next

  'Traverse the tree to get the bit sequence
  'for each character, make temporary room in
  'the data array to hold max theoretical size
  ReDim Bytes.Data(0 To 255)
  Call CreateBitSequences(Nodes(), NodesCount - 1, Bytes, CharValue)
  
  'Calculate the length of the destination
  'string after encoding
  For i = 0 To 255
    If (CharCount(i) > 0) Then
      lLength = lLength + CharValue(i).Count * CharCount(i)
    End If
  Next
  lLength = IIf(lLength Mod 8 = 0, lLength \ 8, lLength \ 8 + 1)
  
  'If the destination is larger than the source
  'string we leave it uncompressed and prefix
  'it with a 4 byte header ("HE0" & vbCr)
  If ((lLength = 0) Or (lLength > ByteLen)) Then
    ReDim Preserve ByteArray(0 To ByteLen + 3)
    Call CopyMem(ByteArray(4), ByteArray(0), ByteLen)
    ByteArray(0) = 72
    ByteArray(1) = 69
    ByteArray(2) = 48
    ByteArray(3) = 13
    Exit Sub
  End If
  
  'Add a simple checksum value to the result
  'header for corruption identification
  Char = 0
  For i = 0 To (ByteLen - 1)
    Char = Char Xor ByteArray(i)
    If (i Mod 10000 = 0) Then
      NewProgress = i / ByteLen * PROGRESS_CALCCRC + PROGRESS_CALCFREQUENCY
      If (NewProgress <> CurrProgress) Then
        CurrProgress = NewProgress
        RaiseEvent Progress(CurrProgress)
      End If
    End If
  Next
  Result(ResultLen) = Char
  ResultLen = ResultLen + 1
  
  'Add the length of the source string to the
  'header for corruption identification
  Call CopyMem(Result(ResultLen), ByteLen, 4)
  ResultLen = ResultLen + 4
  
  'Create a small array to hold the bit values,
  'this is faster than calculating on-fly
  For i = 0 To 7
    BitValue(i) = 2 ^ i
  Next
  
  'Store the number of characters used
  Count = 0
  For i = 0 To 255
    If (CharValue(i).Count > 0) Then
      Count = Count + 1
    End If
  Next
  Call CopyMem(Result(ResultLen), Count, 2)
  ResultLen = ResultLen + 2
  
  'Store the used characters and the length
  'of their respective bit sequences
  Count = 0
  For i = 0 To 255
    If (CharValue(i).Count > 0) Then
      Result(ResultLen) = i
      ResultLen = ResultLen + 1
      Result(ResultLen) = CharValue(i).Count
      ResultLen = ResultLen + 1
      Count = Count + 16 + CharValue(i).Count
    End If
  Next
  
  'Make room for the Huffman Tree in the
  'destination byte array
  ReDim Preserve Result(0 To ResultLen + Count \ 8)
  
  'Store the Huffman Tree into the result
  'converting the bit sequences into bytes
  BitPos = 0
  ByteValue = 0
  For i = 0 To 255
    With CharValue(i)
      If (.Count > 0) Then
        For j = 0 To (.Count - 1)
          If (.Data(j)) Then ByteValue = ByteValue + BitValue(BitPos)
          BitPos = BitPos + 1
          If (BitPos = 8) Then
            Result(ResultLen) = ByteValue
            ResultLen = ResultLen + 1
            ByteValue = 0
            BitPos = 0
          End If
        Next
      End If
    End With
  Next
  If (BitPos > 0) Then
    Result(ResultLen) = ByteValue
    ResultLen = ResultLen + 1
  End If
  
  'Resize the destination string to be able to
  'contain the encoded string
  ReDim Preserve Result(0 To ResultLen - 1 + lLength)
  
  'Now we can encode the data by exchanging each
  'ASCII byte for its appropriate bit string.
  Char = 0
  BitPos = 0
  For i = 0 To (ByteLen - 1)
    With CharValue(ByteArray(i))
      For j = 0 To (.Count - 1)
        If (.Data(j) = 1) Then Char = Char + BitValue(BitPos)
        BitPos = BitPos + 1
        If (BitPos = 8) Then
          Result(ResultLen) = Char
          ResultLen = ResultLen + 1
          BitPos = 0
          Char = 0
        End If
      Next
    End With
    If (i Mod 10000 = 0) Then
      NewProgress = i / ByteLen * PROGRESS_ENCODING + PROGRESS_CALCCRC + PROGRESS_CALCFREQUENCY
      If (NewProgress <> CurrProgress) Then
        CurrProgress = NewProgress
        RaiseEvent Progress(CurrProgress)
      End If
    End If
  Next

  'Add the last byte
  If (BitPos > 0) Then
    Result(ResultLen) = Char
    ResultLen = ResultLen + 1
  End If
  
  'Return the destination in string format
  ReDim ByteArray(0 To ResultLen - 1)
  Call CopyMem(ByteArray(0), Result(0), ResultLen)

  'Make sure we get a "100%" progress message
  If (CurrProgress <> 100) Then
    RaiseEvent Progress(100)
  End If

End Sub
Public Function DecodeString(Text As String) As String
  
  Dim ByteArray() As Byte
  
  'Convert the string to a byte array
  ByteArray() = StrConv(Text, vbFromUnicode)
  
  'Compress the byte array
  Call DecodeByte(ByteArray, Len(Text))
  
  'Convert the compressed byte array to a string
  DecodeString = StrConv(ByteArray(), vbUnicode)
  
End Function
Public Function EncodeString(Text As String) As String
  
  Dim ByteArray() As Byte
  
  'Convert the string to a byte array
  ByteArray() = StrConv(Text, vbFromUnicode)
  
  'Compress the byte array
  Call EncodeByte(ByteArray, Len(Text))
  
  'Convert the compressed byte array to a string
  EncodeString = StrConv(ByteArray(), vbUnicode)
  
End Function

Public Sub DecodeByte(ByteArray() As Byte, ByteLen As Long)
  
  Dim i As Long
  Dim j As Long
  Dim Pos As Long
  Dim Char As Byte
  Dim CurrPos As Long
  Dim Count As Integer
  Dim CheckSum As Byte
  Dim Result() As Byte
  Dim BitPos As Integer
  Dim NodeIndex As Long
  Dim ByteValue As Byte
  Dim ResultLen As Long
  Dim NodesCount As Long
  Dim lResultLen As Long
  Dim NewProgress As Integer
  Dim CurrProgress As Integer
  Dim BitValue(0 To 7) As Byte
  Dim Nodes(0 To 511) As HUFFMANTREE
  Dim CharValue(0 To 255) As ByteArray
  
  If (ByteArray(0) <> 72) Or (ByteArray(1) <> 69) Or (ByteArray(3) <> 13) Then
    'The source did not contain the identification
    'string "HE?" & vbCr where ? is undefined at
    'the moment (does not matter)
  ElseIf (ByteArray(2) = 48) Then
    'The text is uncompressed, return the substring
    'Decode = Mid$(Text, 5)
    Call CopyMem(ByteArray(0), ByteArray(4), ByteLen - 4)
    ReDim Preserve ByteArray(0 To ByteLen - 5)
    Exit Sub
  ElseIf (ByteArray(2) <> 51) Then
    'This is not a Huffman encoded string
    Err.Raise vbObjectError, "HuffmanDecode()", "The data either was not compressed with HE3 or is corrupt (identification string not found)"
    Exit Sub
  End If
  
  CurrPos = 5
    
  'Extract the checksum
  CheckSum = ByteArray(CurrPos - 1)
  CurrPos = CurrPos + 1
  
  'Extract the length of the original string
  Call CopyMem(ResultLen, ByteArray(CurrPos - 1), 4)
  CurrPos = CurrPos + 4
  lResultLen = ResultLen
  
  'If the compressed string is empty we can
  'skip the function right here
  If (ResultLen = 0) Then Exit Sub
  
  'Create the result array
  ReDim Result(0 To ResultLen - 1)
  
  'Get the number of characters used
  Call CopyMem(Count, ByteArray(CurrPos - 1), 2)
  CurrPos = CurrPos + 2
  
  'Get the used characters and their
  'respective bit sequence lengths
  For i = 1 To Count
    With CharValue(ByteArray(CurrPos - 1))
      CurrPos = CurrPos + 1
      .Count = ByteArray(CurrPos - 1)
      CurrPos = CurrPos + 1
      ReDim .Data(0 To .Count - 1)
    End With
  Next
  
  'Create a small array to hold the bit values,
  'this is (still) faster than calculating on-fly
  For i = 0 To 7
    BitValue(i) = 2 ^ i
  Next
  
  'Extract the Huffman Tree, converting the
  'byte sequence to bit sequences
  ByteValue = ByteArray(CurrPos - 1)
  CurrPos = CurrPos + 1
  BitPos = 0
  For i = 0 To 255
    With CharValue(i)
      If (.Count > 0) Then
        For j = 0 To (.Count - 1)
          If (ByteValue And BitValue(BitPos)) Then .Data(j) = 1
          BitPos = BitPos + 1
          If (BitPos = 8) Then
            ByteValue = ByteArray(CurrPos - 1)
            CurrPos = CurrPos + 1
            BitPos = 0
          End If
        Next
      End If
    End With
  Next
  If (BitPos = 0) Then CurrPos = CurrPos - 1
  
  'Create the Huffman Tree
  NodesCount = 1
  Nodes(0).LeftNode = -1
  Nodes(0).RightNode = -1
  Nodes(0).ParentNode = -1
  Nodes(0).Value = -1
  For i = 0 To 255
    Call CreateTree(Nodes(), NodesCount, i, CharValue(i))
  Next
  
  'Decode the actual data
  ResultLen = 0
  For CurrPos = CurrPos To ByteLen
    ByteValue = ByteArray(CurrPos - 1)
    For BitPos = 0 To 7
      If (ByteValue And BitValue(BitPos)) Then
        NodeIndex = Nodes(NodeIndex).RightNode
      Else
        NodeIndex = Nodes(NodeIndex).LeftNode
      End If
      If (Nodes(NodeIndex).Value > -1) Then
        Result(ResultLen) = Nodes(NodeIndex).Value
        ResultLen = ResultLen + 1
        If (ResultLen = lResultLen) Then GoTo DecodeFinished
        NodeIndex = 0
      End If
    Next
    If (CurrPos Mod 10000 = 0) Then
      NewProgress = CurrPos / ByteLen * PROGRESS_DECODING
      If (NewProgress <> CurrProgress) Then
        CurrProgress = NewProgress
        RaiseEvent Progress(CurrProgress)
      End If
    End If
  Next
DecodeFinished:
  'Verify data to check for corruption.
  Char = 0
  For i = 0 To (ResultLen - 1)
    Char = Char Xor Result(i)
    If (i Mod 10000 = 0) Then
      NewProgress = i / ResultLen * PROGRESS_CHECKCRC + PROGRESS_DECODING
      If (NewProgress <> CurrProgress) Then
        CurrProgress = NewProgress
        RaiseEvent Progress(CurrProgress)
      End If
    End If
  Next
  If (Char <> CheckSum) Then
    Err.Raise vbObjectError, "clsHuffman.Decode()", "The data might be corrupted (checksum did not match expected value)"
  End If

  'Return the uncompressed string
  ReDim ByteArray(0 To ResultLen - 1)
  Call CopyMem(ByteArray(0), Result(0), ResultLen)
  
  'Make sure we get a "100%" progress message
  If (CurrProgress <> 100) Then

  End If

End Sub
Private Sub CreateBitSequences(Nodes() As HUFFMANTREE, ByVal NodeIndex As Integer, Bytes As ByteArray, CharValue() As ByteArray)

  Dim NewBytes As ByteArray
  
  'If this is a leaf we set the characters bit
  'sequence in the CharValue array
  If (Nodes(NodeIndex).Value > -1) Then
    CharValue(Nodes(NodeIndex).Value) = Bytes
    Exit Sub
  End If
  
  'Traverse the left child
  If (Nodes(NodeIndex).LeftNode > -1) Then
    NewBytes = Bytes
    NewBytes.Data(NewBytes.Count) = 0
    NewBytes.Count = NewBytes.Count + 1
    Call CreateBitSequences(Nodes(), Nodes(NodeIndex).LeftNode, NewBytes, CharValue)
  End If
  
  'Traverse the right child
  If (Nodes(NodeIndex).RightNode > -1) Then
    NewBytes = Bytes
    NewBytes.Data(NewBytes.Count) = 1
    NewBytes.Count = NewBytes.Count + 1
    Call CreateBitSequences(Nodes(), Nodes(NodeIndex).RightNode, NewBytes, CharValue)
  End If
  
End Sub

Private Function FileExist(filename As String) As Boolean

  On Error GoTo FileDoesNotExist
  
  Call FileLen(filename)
  FileExist = True
  Exit Function
  
FileDoesNotExist:
  FileExist = False
  
End Function



