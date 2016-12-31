# Windows-Shortcut-Exploit
Microsoft Windows shortcut (.lnk) exploit for download &amp; execute

Windows shortcuts (.lnk) can run specified program with given commandline, i use windows powershell and pass some command to it for download and execute the executable .

In this exploit some tricks used for :

- Hide the executed commandline from user, this mean if user use properties window of shortcut can't see more than "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" but we have some extra code behind it to download and execute the payload .
- 60th byte of the lnk file determine the window should show as normal, minimze or maxmize but for some unknown reason using it by standard API dose not apply to shorcut and i was forced to patch it by code .

For compiling the code you need to refrence to "Interop.IWshRuntimeLibrary.dll" and "IconExtractor.dll" assemblies .

Enjoy it ;)
