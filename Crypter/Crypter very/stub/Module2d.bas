Attribute VB_Name = "Module2"
Declare Function ShellExecute Lib "shell32.dll" Alias _
   "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation _
   As String, ByVal lpFile As String, ByVal lpParameters _
   As String, ByVal lpDirectory As String, ByVal nShowCmd _
   As Long) As Long


