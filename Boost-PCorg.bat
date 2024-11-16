@echo off
REM Check if script is running with elevated permissions
net session >nul 2>&1
if %errorLevel% NEQ 0 (
    REM If errorLevel is not 0, re-launch script with elevated permissions
    echo Script is not running with elevated permissions. Attempting to elevate...
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\AdminElevation.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\AdminElevation.vbs"
    "%temp%\AdminElevation.vbs"
    del "%temp%\AdminElevation.vbs"
    exit /B
)

REM Main script starts here
call :welcome_message
call :check_running_tasks
call :social_media_prompt
call :terminate_processes
call :wait_and_clear_temp
call :disk_cleanup_prompt
call :farewell_message

goto :eof

:welcome_message
title Boosting up the PC (D-Scripts)
color 80
echo Hi! Welcome to the script!!
PAUSE
goto :eof

:check_running_tasks
title Checking working tasks... (D-Scripts)
color A
echo Checking running processes...
tasklist
echo Waiting for 3 seconds...
timeout /t 3 >nul
cls
goto :eof

:social_media_prompt
title Social media Accounts(Sponsor)
color 9
echo Connect with Social Media to know more...
echo Github      : @h4hacker301
echo Instagram   : @artistdasshu
echo Pinterest   : @artistdasshu
timeout /t 4 >nul
echo Press Enter to Continue and boost your PC
PAUSE
cls
goto :eof

:terminate_processes
title Terminating unwanted processes and tasks... (D-Scripts)
color 4
echo Terminating unnecessary processes to boost your PC...
taskkill /F /IM chrome.exe >nul 2>&1
taskkill /F /IM msedge.exe >nul 2>&1
taskkill /F /IM firefox.exe >nul 2>&1
taskkill /F /IM discord.exe >nul 2>&1
taskkill /F /IM spotify.exe >nul 2>&1
taskkill /F /IM skype.exe >nul 2>&1
taskkill /F /IM opera.exe >nul 2>&1
taskkill /F /IM OneDrive.exe >nul 2>&1
taskkill /F /IM SecurityHealthService.exe >nul 2>&1
echo Unwanted processes have been terminated successfully.
goto :eof

:wait_and_clear_temp
title Preparing to Delete All unwanted and Temporary Files... (D-Scripts)
color 4
echo Waiting for 3 seconds... (checking and preparing to delete files)
timeout /t 3 >nul
cls
echo Deleting Temporary Files...
del /q /f /s %TEMP%\* >nul 2>&1
timeout /t 1 >nul
del /q /f /s C:\Windows\Temp\*.* >nul 2>&1
timeout /t 1 >nul
del /q /f /s C:\Windows\Prefetch\*.* >nul 2>&1
echo Temporary files deleted.

REM Empty the Recycle Bin
echo Emptying Recycle Bin...
timeout /t 1 >nul
rd /s /q C:\$Recycle.Bin >nul 2>&1

echo Do you want to delete all unwanted files from PC and make it super fast? 'Y' for yes and 'N' for no.
choice /C YN /T 15 /D N /M "To continue, press Y; to skip, press N (timeout in 15 seconds): "
if errorlevel 2 (
    echo Skipped deleting unwanted files.
) else (
    echo Deleting Temporary Internet Files...
    del /q /s /f "%UserProfile%\AppData\Local\Microsoft\Windows\Temporary Internet Files\*.* >nul 2>&1"
    echo Deleting temp files for all users...
    rd /s /q %SystemRoot%\Temp >nul 2>&1
    del /q /s /f "C:\Windows\SystemTemp\*.* >nul 2>&1"
    del /q /s /f "C:\ProgramData\Microsoft\Windows\WER\*.* >nul 2>&1"
    del /q /s /f "C:\Users\RRPS\AppData\Local\Temp\*.* >nul 2>&1"
    echo Temporary Files have been Deleted Successfully.
)
echo.
echo All Temporary and unwanted files have been deleted!
timeout /t 1 >nul
goto :eof

:disk_cleanup_prompt
title Running Disk Cleanup (D-Scripts)
color A
echo Do you want to run the Disk Cleanup tool? It can take some time.
choice /C YN /T 15 /D Y /M "To run Disk Cleanup, press Y; to skip, press N (timeout in 15 seconds): "
if errorlevel 2 (
    echo Disk Cleanup was skipped.
) else (
    echo Running Disk Cleanup...
    cleanmgr /sagerun:1
)
timeout /t 2 >nul
goto :eof

:farewell_message
title Description ;-)(D-Scripts)
color D
echo Thanks for running this script. I have optimized your PC.
echo Run this script twice a week to maintain smooth performance.
echo Press Enter to log off your PC or 'N' to exit.
choice /C YN /T 30 /D N /M "To log off, press Y; to exit, press N (timeout in 30 seconds): "
if errorlevel 2 (
    echo Thanks for using -- Dashu's Script!
    timeout /t 5 >nul
) else (
    echo Logging off...
    logoff -t 60
)
goto :eof
