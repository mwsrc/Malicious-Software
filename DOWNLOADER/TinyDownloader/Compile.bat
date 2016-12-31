DCC32  -Q system.pas sysinit.pas -M -Y -Z -$D- -O
DCC32 Downloader.dpr
UPX Downloader.exe
DEL SYSTEM.DCU
DEL SYSINIT.DCU