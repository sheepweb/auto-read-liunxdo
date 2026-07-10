@echo off
setlocal

cd /d "%~dp0"

where node >nul 2>nul
if errorlevel 1 (
  echo Node.js was not found. Please install Node.js or add it to PATH.
  call :pause_if_needed %*
  exit /b 1
)

node .\bypasscf.js
set "EXIT_CODE=%ERRORLEVEL%"

if not "%EXIT_CODE%"=="0" (
  echo.
  echo bypasscf.js exited with code %EXIT_CODE%.
)

call :pause_if_needed %*
exit /b %EXIT_CODE%

:pause_if_needed
if /i "%~1"=="--no-pause" exit /b 0
echo.
pause
exit /b 0
