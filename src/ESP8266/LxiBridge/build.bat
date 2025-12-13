@echo off
setlocal enabledelayedexpansion

:: LXI Serial Bridge - PlatformIO Build Script
:: Usage: build.bat [command] [environment]
::
:: Commands:
::   build    - Compile the project (default)
::   upload   - Build and upload to device
::   monitor  - Open serial monitor
::   clean    - Clean build files
::   run      - Build, upload, and monitor
::   devices  - List connected devices
::   envs     - List available environments
::
:: Environments:
::   esp8266  - NodeMCU v2 (default)
::   esp12e   - ESP-12E module
::   d1_mini  - Wemos D1 Mini

set "SCRIPT_DIR=%~dp0"
cd /d "%SCRIPT_DIR%"

:: Default values
set "CMD=build"
set "ENV=esp8266"

:: Parse arguments
if not "%~1"=="" set "CMD=%~1"
if not "%~2"=="" set "ENV=%~2"

:: Check if PlatformIO is available
where pio >nul 2>&1
if errorlevel 1 (
    echo Error: PlatformIO CLI not found.
    echo Please install PlatformIO Core or add it to your PATH.
    echo https://docs.platformio.org/en/latest/core/installation.html
    exit /b 1
)

:: Execute command
if /i "%CMD%"=="build" (
    echo Building for environment: %ENV%
    pio run -e %ENV%
    goto :end
)

if /i "%CMD%"=="upload" (
    echo Building and uploading to %ENV%...
    pio run -e %ENV% --target upload
    goto :end
)

if /i "%CMD%"=="monitor" (
    echo Opening serial monitor for %ENV%...
    pio device monitor -e %ENV%
    goto :end
)

if /i "%CMD%"=="clean" (
    echo Cleaning build files...
    pio run --target clean
    goto :end
)

if /i "%CMD%"=="run" (
    echo Building, uploading, and monitoring %ENV%...
    pio run -e %ENV% --target upload && pio device monitor -e %ENV%
    goto :end
)

if /i "%CMD%"=="devices" (
    echo Connected devices:
    pio device list
    goto :end
)

if /i "%CMD%"=="envs" (
    echo Available environments:
    echo   esp8266  - NodeMCU v2
    echo   esp12e   - ESP-12E module
    echo   d1_mini  - Wemos D1 Mini
    goto :end
)

if /i "%CMD%"=="help" (
    goto :usage
)

echo Unknown command: %CMD%
goto :usage

:usage
echo.
echo LXI Serial Bridge - Build Script
echo.
echo Usage: build.bat [command] [environment]
echo.
echo Commands:
echo   build    - Compile the project (default)
echo   upload   - Build and upload to device
echo   monitor  - Open serial monitor
echo   clean    - Clean build files
echo   run      - Build, upload, and monitor
echo   devices  - List connected devices
echo   envs     - List available environments
echo   help     - Show this help message
echo.
echo Environments:
echo   esp8266  - NodeMCU v2 (default)
echo   esp12e   - ESP-12E module
echo   d1_mini  - Wemos D1 Mini
echo.
echo Examples:
echo   build.bat                  Build for NodeMCU v2
echo   build.bat build d1_mini    Build for D1 Mini
echo   build.bat upload           Upload to NodeMCU v2
echo   build.bat run esp12e       Build, upload, monitor ESP-12E
echo.
exit /b 1

:end
exit /b %errorlevel%
