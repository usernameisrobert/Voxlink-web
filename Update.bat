@echo off
title VoxLink Updater
echo ╔══════════════════════════════════════╗
echo ║        VoxLink Updater v1.0          ║
echo ╚══════════════════════════════════════╝
echo.

echo [1/3] Checking for updates...
git pull
if %ERRORLEVEL% neq 0 (
    echo.
    echo WARNING: Could not pull updates. Continuing with local version...
    echo.
)

echo.
echo [2/3] Building VoxLink (Release)...
cargo build --bin voxlink --release

if %ERRORLEVEL% neq 0 (
    echo.
    echo ════════════════════════════════════════
    echo   BUILD FAILED! Check errors above.
    echo ════════════════════════════════════════
    pause
    exit /b %ERRORLEVEL%
)

echo.
echo [3/3] Installing...
copy /Y "target\release\voxlink.exe" "VoxLink.exe" >nul

echo.
echo ════════════════════════════════════════
echo   Update complete!
echo   Launch VoxLink.exe to start chatting.
echo ════════════════════════════════════════
pause
