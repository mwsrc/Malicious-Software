{ Just example of small webdownloader by Greedy Fly
  Credits to MS-Rem}
program Downloader;
function URLDownloadToFileA(Caller: Cardinal; URL: PChar; FileName: PChar; Reserved: LongWord;LPBINDSTATUSCALLBACK: pointer): Longword ; stdcall; external 'urlmon.dll' name 'URLDownloadToFileA';
function ShellExecute(hWnd: Cardinal; Operation, FileName, Parameters, Directory: PChar; ShowCmd: Integer): Cardinal; stdcall; external 'shell32.dll' name 'ShellExecuteA';
const
  urladdress = 'http://www.google.co.uk/intl/en_com/images/srpr/logo1w.png';
  const1 = 'c:\GoogleLogo.png';
begin
URLDownloadToFileA(0,urladdress,const1,0,nil);
ShellExecute(0, nil, PChar(const1), nil, nil, 1);
end.
