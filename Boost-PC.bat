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
call :terminate_processes "chrome.exe"
call :terminate_processes "discord.exe"
call :terminate_processes "spotify.exe"
call :terminate_processes "firefox.exe"
call :terminate_processes "Phone Link.exe"
call :terminate_processes "msedge.exe"
call :terminate_processes "Feedback Hub.exe"
call :terminate_processes "Skype.exe"
call :wait_and_clear_temp
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
tasklist | find /i "%1" > nul
if not errorlevel 1 taskkill /f /im "%1"
timeout /t 1 >nul
goto :eof

:wait_and_clear_temp
title Preparing to Delete All unwanted and Temporary Files ... (D-Scripts)
color 4
echo Waiting for 3 seconds... (checking and preparing to delete files)
timeout /t 3 >nul
cls
del /q /f /s %TEMP%\
timeout /t 1 >nul
echo Deleting Temproray files from Windows admin files...
del /q C:\Windows\Temp\*.*
timeout /t 1 >nul
del /q C:\Windows\Prefetch\*.*
echo .
echo Emptying Recycle Bin...
timeout /t 1 >nul
rd /s /q C:\$Recycle.Bin
echo Do you want to delete all unwanted files from pc and make it super fast? 'Y' for yes and 'N' for no.
choice /C YN /T 15 /D N /M "To continue, press Y; to skip, press N (timeout in 15 seconds): "
if errorlevel 2 (
    echo Skipped deleting unwanted files.
) else (
    echo Deleting Temporary Internet Files...
    del /q /s /f "%UserProfile%\AppData\Local\Microsoft\Windows\Temporary Internet Files\*.*"
    echo Deleting temp files for all users...
    rd /s /q %SystemRoot%\Temp
    echo .
    echo Temporary Files have been Deleted Successfully.
    timeout /t 1 >nul
)

echo .
echo All Temporary and unwanted files has been deleted!
timeout /t 1 >nul
color b
echo.
echo This PC has been cleared successfully!
PAUSE
cls
goto :eof

:farewell_message
title Description ;-)(D-Scripts)
color D
echo Thanks for running this script. I have optimized your PC.(run this script twice a week to run smoothly and delete all temp files...)
echo Press Enter to log off your PC or 'N' to exit.
echo .
echo .
echo .
choice /C YN /T 30 /D N /M "To log off, press Y; to exit, press N (timeout in 30 seconds): "
if errorlevel 2 (
    echo Thanks for using --Dashu's Script!
    timeout /t 5 >nul
) else (
    logoff -t 60
)
goto :eof
