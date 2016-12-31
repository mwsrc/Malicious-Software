VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsThreading"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'----------------------------------------------------------------------------------------'
'
' Multi Downloader using multithreadings
' Created by Suk Yong Kim, 03/14/2001
'
' This project is my first project to upload to the PSC.
' Many persons contribute to create this project
' I really appreicate their efforts and codes and the great server PSC.
'
' if any question, mail to : techtrans@dreamwiz.com
' This class moduesis contributed by Philipp Weidmann
' I really thank him for his codes.
'----------------------------------------------------------------------------------------'
'clsThreading:
'Simple class that allows you to implement multithreading in your app
'
'(C) 2001 by Philipp Weidmann

'API Declarations
'Creates a new thread
Private Declare Function CreateThread Lib "kernel32" (ByVal lpThreadAttributes As Any, ByVal dwStackSize As Long, ByVal lpStartAddress As Long, lpParameter As Any, ByVal dwCreationFlags As Long, lpThreadID As Long) As Long
'Terminates a thread
Private Declare Function TerminateThread Lib "kernel32" (ByVal hThread As Long, ByVal dwExitCode As Long) As Long
'Sets the priority of a thread
Private Declare Function SetThreadPriority Lib "kernel32" (ByVal hThread As Long, ByVal nPriority As Long) As Long
'Returns the proirity of a thread
Private Declare Function GetThreadPriority Lib "kernel32" (ByVal hThread As Long) As Long
'Enables a disabled Thread
Private Declare Function ResumeThread Lib "kernel32" (ByVal hThread As Long) As Long
'Disables a thread
Private Declare Function SuspendThread Lib "kernel32" (ByVal hThread As Long) As Long
'Returns the handle of the current thread
Private Declare Function GetCurrentThread Lib "kernel32" () As Long
'Returns the ID of the current thread
Private Declare Function GetCurrentThreadId Lib "kernel32" () As Long

'Consts
Private Const MAXLONG = &H7FFFFFFF

'Thread priority consts
Private Const THREAD_BASE_PRIORITY_IDLE = -15
Private Const THREAD_BASE_PRIORITY_LOWRT = 15
Private Const THREAD_BASE_PRIORITY_MAX = 2
Private Const THREAD_BASE_PRIORITY_MIN = -2
Private Const THREAD_PRIORITY_HIGHEST = THREAD_BASE_PRIORITY_MAX
Private Const THREAD_PRIORITY_LOWEST = THREAD_BASE_PRIORITY_MIN
Private Const THREAD_PRIORITY_ABOVE_NORMAL = (THREAD_PRIORITY_HIGHEST - 1)
Private Const THREAD_PRIORITY_BELOW_NORMAL = (THREAD_PRIORITY_LOWEST + 1)
Private Const THREAD_PRIORITY_ERROR_RETURN = (MAXLONG)
Private Const THREAD_PRIORITY_IDLE = THREAD_BASE_PRIORITY_IDLE
Private Const THREAD_PRIORITY_NORMAL = 0
Private Const THREAD_PRIORITY_TIME_CRITICAL = THREAD_BASE_PRIORITY_LOWRT

'Thread creation flags
Private Const CREATE_ALWAYS = 2
Private Const CREATE_NEW = 1
Private Const CREATE_NEW_CONSOLE = &H10
Private Const CREATE_NEW_PROCESS_GROUP = &H200
Private Const CREATE_NO_WINDOW = &H8000000
Private Const CREATE_PROCESS_DEBUG_EVENT = 3
Private Const CREATE_SUSPENDED = &H4
Private Const CREATE_THREAD_DEBUG_EVENT = 2

'Types and Enums
Public Enum ThreadPriority
    tpLowest = THREAD_PRIORITY_LOWEST
    tpBelowNormal = THREAD_PRIORITY_BELOW_NORMAL
    tpNormal = THREAD_PRIORITY_NORMAL
    tpAboveNormal = THREAD_PRIORITY_ABOVE_NORMAL
    tpHighest = THREAD_PRIORITY_HIGHEST
End Enum

'Vars
Private mThreadHandle As Long
Private mThreadID As Long
Private mPriority As Long
Private mEnabled As Boolean
Private mCreated As Boolean
Private mID As Long
Public Function CreateNewThread(ByVal iDownloader As Long, ByVal cFunction As Long, Optional ByVal cPriority As Long = tpNormal, Optional ByVal cEnabled As Boolean = True)
    'Creates a new Thread
    Dim mHandle As Long
    Dim CreationFlags As Long
    Dim lpThreadID As Long
    
    'Look if the thread has already been created
    If mCreated = True Then Exit Function
    
    'Look if the thread should be enabled
    If cEnabled = True Then
        CreationFlags = 0
    Else
        'Create a disabled thread, can be enabled later with the
        ''Enabled' property
        CreationFlags = CREATE_SUSPENDED
    End If
    
    'The CreateThread Function returns the handle of the created thread;
    'if the handle is 0, it failed creating the thread
    mHandle = CreateThread(ByVal 0&, ByVal 0&, cFunction, ByVal 0&, CreationFlags, lpThreadID)
    
    If mHandle = 0 Then 'Failed creating the thread
        'Insert your own error handling
        'Debug.Print "InitializeThread Function in clsThreading failed creating a new thread"
    Else
        mThreadHandle = mHandle
        mThreadID = lpThreadID
        mCreated = True
        mID = iDownloader
    End If
End Function
Public Property Get iDownloader() As Long
    iDownloader = mID
End Property
Public Function TerminateCurrentThread()
    'Terminates the current thread
    
    'Ignore errors to prevent crashing if no thread has been created
    On Error Resume Next
    'Terminate the thread to prevent crashing if the app is closed
    'and the thread is still running (dangerous!)
    Call TerminateThread(mThreadHandle, ByVal 0&)
    mCreated = False
End Function

Public Property Get ThreadHandle() As Long
    'Returns the Handle of the current Thread
    ThreadHandle = mThreadHandle
End Property

Public Property Get ThreadID() As Long
    'Returns the ID of the current thread
    ThreadID = mThreadID
End Property

Public Property Get Priority() As Long
    'Returns a long value because the thread might have other priorities
    'than our five in the enum
    
    'Ignore errors to prevent crashing if no thread has been created
    On Error Resume Next
    Priority = GetThreadPriority(mThreadHandle)
End Property

Public Property Let Priority(ByVal tmpValue As Long)
    'Sets the Thread Priority of the actual thread
    mPriority = tmpValue
    Call SetThreadPriority(mThreadHandle, tmpValue)
End Property

Public Property Get Enabled() As Boolean
    'Returns whether the Thread is enabled or not
    Enabled = mEnabled
End Property

Public Property Let Enabled(ByVal tmpValue As Boolean)
    'Enables/Disables the Thread
    
    'Ignore errors to prevent crashing if no thread has been created
    On Error Resume Next
    If tmpValue = True Then
        'Enable the thread
        Call ResumeThread(mThreadHandle)
    ElseIf tmpValue = False Then
        'Disable the thread
        Call SuspendThread(mThreadHandle)
    End If
End Property

Private Sub Class_Terminate()
    'Terminate the thread to prevent crashing if the app is closed
    'and the thread is still running (dangerous!)
    Call TerminateCurrentThread
End Sub
