@echo off
:: Batch script to clean Recent, Temp, and Prefetch folders
:: Must be run as Administrator

:: Check for admin rights
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if %errorlevel% NEQ 0 (
    echo.
    echo ****************************************************
    echo   Please run this script as Administrator!
    echo ****************************************************
    echo.
    pause
    exit /b
)

echo.
echo ********************************************
echo        Please wait, program started...
echo ********************************************
echo.

:: Delete Recent files
echo ----------Deleting Recent Files----------
del /f /q "%APPDATA%\Microsoft\Windows\Recent\*.*"
echo.

:: Delete Temp files
echo ----------Deleting Temp Files----------
del /f /q "%TEMP%\*.*"
for /d %%d in ("%TEMP%\*") do rd /s /q "%%d"
echo.

:: Delete Prefetch files
echo ----------Deleting Prefetch Files----------
del /f /q "C:\Windows\Prefetch\*.*"
echo.

echo ********************************************
echo        All clean-up tasks are complete.
echo ********************************************
echo.
pause
