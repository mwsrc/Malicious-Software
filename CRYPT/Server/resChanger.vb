
Imports System.Runtime.InteropServices

Public Module resChanger

    Const ENUM_CURRENT_SETTINGS As Integer = -1
    Const CDS_UPDATEREGISTRY As Integer = &H1
    Const CDS_TEST As Long = &H2

    Const CCDEVICENAME As Integer = 32
    Const CCFORMNAME As Integer = 32

    Const DISP_CHANGE_SUCCESSFUL As Integer = 0
    Const DISP_CHANGE_RESTART As Integer = 1
    Const DISP_CHANGE_FAILED As Integer = -1

    Private Declare Function EnumDisplaySettings Lib "user32" Alias "EnumDisplaySettingsA" (ByVal lpszDeviceName As Integer, ByVal iModeNum As Integer, ByRef lpDevMode As DEVMODE) As Integer
    Private Declare Function ChangeDisplaySettings Lib "user32" Alias "ChangeDisplaySettingsA" (ByRef DEVMODE As DEVMODE, ByVal flags As Long) As Integer

    <StructLayout(LayoutKind.Sequential)> Public Structure DEVMODE
        <MarshalAsAttribute(UnmanagedType.ByValTStr, SizeConst:=CCDEVICENAME)> Public dmDeviceName As String
        Public dmSpecVersion As Short
        Public dmDriverVersion As Short
        Public dmSize As Short
        Public dmDriverExtra As Short
        Public dmFields As Integer
        Public dmOrientation As Short
        Public dmPaperSize As Short
        Public dmPaperLength As Short
        Public dmPaperWidth As Short
        Public dmScale As Short
        Public dmCopies As Short
        Public dmDefaultSource As Short
        Public dmPrintQuality As Short
        Public dmColor As Short
        Public dmDuplex As Short
        Public dmYResolution As Short
        Public dmTTOption As Short
        Public dmCollate As Short
        <MarshalAsAttribute(UnmanagedType.ByValTStr, SizeConst:=CCFORMNAME)> Public dmFormName As String
        Public dmUnusedPadding As Short
        Public dmBitsPerPel As Short
        Public dmPelsWidth As Integer
        Public dmPelsHeight As Integer
        Public dmDisplayFlags As Integer
        Public dmDisplayFrequency As Integer
    End Structure

    Public Sub changeRes(ByVal theWidth As Integer, ByVal theHeight As Integer)

        Dim DevM As DEVMODE

        DevM.dmDeviceName = New [String](New Char(32) {})
        DevM.dmFormName = New [String](New Char(32) {})
        DevM.dmSize = CShort(Marshal.SizeOf(GetType(DEVMODE)))


        If 0 <> EnumDisplaySettings(Nothing, ENUM_CURRENT_SETTINGS, DevM) Then
            Dim lResult As Integer

            DevM.dmPelsWidth = theWidth
            DevM.dmPelsHeight = theHeight
            DevM.dmPelsWidth = 1280
            DevM.dmPelsHeight = 1024

            lResult = ChangeDisplaySettings(DevM, CDS_TEST)

            If lResult = DISP_CHANGE_FAILED Then
                ' MsgBox("Display Change Failed.", MsgBoxStyle.OKOnly + MsgBoxStyle.Critical,"Screen Resolution Change Failed")
            Else

                lResult = ChangeDisplaySettings(DevM, CDS_UPDATEREGISTRY)

                Select Case lResult
                    Case DISP_CHANGE_RESTART
                        ' MsgBox("You must restart your computer to apply these changes.", MsgBoxStyle.OKOnly + MsgBoxStyle.Critical,"Screen Resolution Has Changed")
                    Case DISP_CHANGE_SUCCESSFUL
                        ' MsgBox("Display Change Successful.", MsgBoxStyle.OKOnly + MsgBoxStyle.Information,"Screen Resolution Successful")
                    Case Else
                        '  MsgBox("Display Change Failed.", MsgBoxStyle.OKOnly + MsgBoxStyle.Critical,"Screen Resolution Change Failed")
                End Select
            End If


        End If
    End Sub

End Module
