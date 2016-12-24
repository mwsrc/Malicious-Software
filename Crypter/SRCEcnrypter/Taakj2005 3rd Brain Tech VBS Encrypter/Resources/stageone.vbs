Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFile = objFSO.OpenTextFile("Temp.vbs", 1)
Do Until objFile.AtEndOfStream
    strCharacters = objFile.Read(1)
content=hexEncode(strCharacters)
kakar=kakar&content
Loop

Set objFS = CreateObject("Scripting.FileSystemObject")
strTemp = "Stageone.txt"
Set objTextFile = objFS.CreateTextFile(strTemp,True) 
objTextFile.Write  """"& kakar & """" &VbCrLf
objTextFile.Close

function hexEncode(str)
	dim strEncoded, i
	strEncoded = ""
	for i = 1 to Len(str)
		strEncoded = strEncoded & "%sep%" & ascw(RunRC4(str , "%key%"))
	next
	hexEncode = strEncoded
end function



    Function RunRC4(sMessage, strKey)
        Dim kLen, x, y, i, j, temp
        Dim s(256), k(256)
     
        'Init keystream
        klen = Len(strKey)
        For i = 0 To 255
            s(i) = i
            k(i) = Asc(Mid(strKey, (i Mod klen) + 1, 1))
        Next
     
        j = 0
        For i = 0 To 255
            j = (j + k(i) + s(i)) Mod 255
            temp = s(i)
            s(i) = s(j)
            s(j) = temp
        Next
     
        'Drop n bytes from keystream
        x = 0
        y = 0
        For i = 1 To 3072
            x = (x + 1) Mod 255
            y = (y + s(x)) Mod 255
            temp = s(x)
            s(x) = s(y)
            s(y) = temp
        Next
     
        'Encode/Decode
        For i = 1 To Len(sMessage)
            x = (x + 1) Mod 255
            y = (y + s(x)) Mod 255
            temp = s(x)
            s(x) = s(y)
            s(y) = temp
     
            RunRC4 = RunRC4 & Chr(s((s(x) + s(y)) Mod 255) Xor Asc(Mid(sMessage, i, 1)))
        Next
    End Function



