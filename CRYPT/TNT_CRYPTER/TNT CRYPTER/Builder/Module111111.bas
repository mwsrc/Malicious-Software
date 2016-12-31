Attribute VB_Name = "Module1"
Option Explicit

Global cpuid As String

' Polynom-Tabelle
Dim bCRC32Init As Boolean
Dim nCRC32LookUp() As Long

Public Sub CRC32_Init()
  ' Polynom-Tabelle erstellen
  ' Hier wird das offizielle Polynom verwendet, das
  ' auch von WinZip/PKZip verwendet wird
 
  ' Falls die LookUp-Tabelle bereits erstellt...
  If bCRC32Init Then Exit Sub
 
  Const nPolynom = &HEDB88320
 
  Dim i As Long
  Dim u As Long
 
  ReDim nCRC32LookUp(255)
  Dim nCRC32 As Long

  For i = 0 To 255
    nCRC32 = i
    For u = 0 To 7
      If (nCRC32 And 1) Then
        nCRC32 = (((nCRC32 And &HFFFFFFFE) \ 2&) And &H7FFFFFFF) _
          Xor nPolynom
      Else
        nCRC32 = ((nCRC32 And &HFFFFFFFE) \ 2&) And &H7FFFFFFF
      End If
    Next u
    nCRC32LookUp(i) = nCRC32
  Next i
  bCRC32Init = True
End Sub

' Der optionale Parameter "nResult" sollte nur von
' CRC32_File verwendet werden!
Public Function CRC32(ByRef Bytes() As Byte, _
  Optional ByVal nResult As Long = &HFFFFFFFF) As Long
 
  Dim i As Long
  Dim Index As Long
  Dim nSize As Long
 
  ' ggf. LookUp-Tabelle erstellen...
  If Not bCRC32Init Then CRC32_Init

  nSize = UBound(Bytes)
  For i = 0 To nSize
    Index = (nResult And &HFF) Xor Bytes(i)
    nResult = (((nResult And &HFFFFFF00) \ &H100) And 16777215) _
      Xor nCRC32LookUp(Index)
  Next i

  CRC32 = Not (nResult)
End Function

' CRC32-Checksumme einer Datei berechnen
Public Function CRC32FromFile(ByVal sFile As String) As Long
  ' Um die Verarbeitung von großen Dateien zu beschleunigen,
  ' wird der Inhalt blockweise ausgelesen. Hierbei hat sich
  ' eine Blockgröße von 4096 Bytes (4 KB) als sehr gut erwiesen
  Const BlockSize As Long = 4096
 
  Dim FileSize As Long
  Dim FilePos As Long
  Dim BytesToRead As Long
  Dim nResult As Long
  Dim Bytes() As Byte
  Dim F As Integer
 
  On Error GoTo ErrHandler
 
  ' Datei binär öffnen
  F = FreeFile
  Open sFile For Binary Access Read Shared As #F
 
  ' Dateigröße
  FileSize = LOF(F)
 
  ' Datei blockweise einlesen und verarbeiten
  nResult = &HFFFFFFFF
  ReDim Bytes(BlockSize - 1)
  While FilePos < FileSize
    If FilePos + BlockSize > FileSize Then
      BytesToRead = FileSize - FilePos
      ReDim Bytes(BytesToRead - 1)
    Else
      BytesToRead = BlockSize
    End If
   
    Get #F, , Bytes()
    nResult = Not (CRC32(Bytes, nResult))

    FilePos = FilePos + BytesToRead
  Wend
  Close #F
 
  CRC32FromFile = Not (nResult)
  On Error GoTo 0
  Exit Function
 
ErrHandler:
  If F > 0 Then Close #F
  CRC32FromFile = -1
End Function

