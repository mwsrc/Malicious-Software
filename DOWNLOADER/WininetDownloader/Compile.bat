DCC32  -Q System.pas SysInit.pas -M -Y -Z -$D- -O
DCC32 WininetDownloader.dpr
UPX WininetDownloader.exe
DEL System.dcu
DEL SysInit.dcu
PAUSE