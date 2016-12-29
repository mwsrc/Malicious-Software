Attribute VB_Name = "mdlCompression"
Option Explicit

Private Type BNode
    DictIdx As Long
    pLeft As Long
    pRight As Long
End Type

Private Dict(4096) As String
Private NextDictIdx As Long
Private Heap(4096) As BNode
Private NextHeapIdx As Long
Private pStr As Long

Private Sub InitDict()
    Dim iCount As Integer
    For iCount = 0 To 255
        Dict(iCount) = Chr(iCount)
    Next iCount
    NextDictIdx = 256
    NextHeapIdx = 0
End Sub

Private Function AddToDict(sStr As String) As Long
    If NextDictIdx > 4095 Then NextDictIdx = 256: NextHeapIdx = 0
    If Len(sStr) = 1 Then
    AddToDict = Asc(sStr)
    Else
    AddToDict = AddToBTree(0, sStr)
    End If
End Function


Private Function AddToBTree(ByRef Node As Long, ByRef sStr As String) As Long
Dim iInt As Integer
    If Node = -1 Or NextHeapIdx = 0 Then
     Dict(NextDictIdx) = sStr
     Heap(NextHeapIdx).DictIdx = NextDictIdx
     NextDictIdx = NextDictIdx + 1
     Heap(NextHeapIdx).pLeft = -1
     Heap(NextHeapIdx).pRight = -1
     Node = NextHeapIdx
     NextHeapIdx = NextHeapIdx + 1
     AddToBTree = -1
    Else
     iInt = StrComp(sStr, Dict(Heap(Node).DictIdx))
     If iInt < 0 Then
     AddToBTree = AddToBTree(Heap(Node).pLeft, sStr)
     ElseIf iInt > 0 Then
     AddToBTree = AddToBTree(Heap(Node).pRight, sStr)
     Else
     AddToBTree = Heap(Node).DictIdx
     End If
    End If
End Function

Private Sub WriteStrBuf(sStr As String, sStr2 As String)
    Do While pStr + Len(sStr2) - 1 > Len(sStr)
        sStr = sStr & Space(100000)
    Loop
    Mid$(sStr, pStr) = sStr2
    pStr = pStr + Len(sStr2)
End Sub

Public Function LZWCompress(sSource As String) As String

    Dim TmpStr As String
    Dim Ch As String
    Dim DictIdx As Integer
    Dim LastDictIdx As Integer
    Dim FirstInPair As Boolean
    Dim HalfCh As Integer
    Dim lCount As Long
    Dim ostr As String
    
    InitDict
    FirstInPair = True
    pStr = 1
    For lCount = 1 To Len(sSource)
        Ch = Mid$(sSource, lCount, 1)
        DictIdx = AddToDict(TmpStr & Ch)
        If DictIdx = -1 Then
            If FirstInPair Then
                HalfCh = (LastDictIdx And 15) * 16
            Else
                WriteStrBuf ostr, Chr(HalfCh Or (LastDictIdx And 15))
            End If
            WriteStrBuf ostr, Chr(LastDictIdx \ 16)
            FirstInPair = Not FirstInPair
            TmpStr = Ch
            LastDictIdx = Asc(Ch)
        Else
            TmpStr = TmpStr & Ch
            LastDictIdx = DictIdx
        End If
    Next lCount
    WriteStrBuf ostr, IIf(FirstInPair, Chr(LastDictIdx \ 16) & Chr((LastDictIdx And 15) * 16), Chr(HalfCh Or (LastDictIdx And 15)) & Chr(LastDictIdx \ 16))
    LZWCompress = Left(ostr, pStr - 1)
End Function


Function LZWDeCompress(sSource As String) As String
Dim DictIdx As Integer
Dim FirstInPair As Boolean
Dim lCount As Long
Dim sStr As String
Dim sStr2 As String

    InitDict
    pStr = 1
    lCount = 1
    FirstInPair = True
    Do While lCount < Len(sSource)
        If FirstInPair Then
            DictIdx = (Asc(Mid$(sSource, lCount, 1)) * 16) Or (Asc(Mid$(sSource, lCount + 1, 1)) \ 16)
            lCount = lCount + 1
        Else
            DictIdx = (Asc(Mid$(sSource, lCount + 1, 1)) * 16) Or (Asc(Mid$(sSource, lCount, 1)) And 15)
            lCount = lCount + 2
        End If
        FirstInPair = Not FirstInPair
        If lCount > 2 Then
            If DictIdx = NextDictIdx Or (DictIdx = 256 And NextDictIdx = 4096) Then
                AddToDict sStr2 & Left$(sStr2, 1)
            Else
                AddToDict sStr2 & Left$(Dict(DictIdx), 1)
            End If
        End If
        sStr2 = Dict(DictIdx)
        WriteStrBuf sStr, sStr2
    Loop
    LZWDeCompress = Left(sStr, pStr - 1)
End Function


