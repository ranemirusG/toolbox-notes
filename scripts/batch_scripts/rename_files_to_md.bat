@echo off
setlocal enabledelayedexpansion
rem Store the current directory
set "directory=%CD%"
rem Change directory to the current directory
cd /d "%directory%"
for %%F in (*) do (
    if "%%~xF"=="" echo Renamed "%%F" to "%%~nF.md" && ren "%%F" "%%~nF.md"
    if /i "%%~xF"==".txt" echo Renamed "%%F" to "%%~nF.md" && ren "%%F" "%%~nF.md"
)
echo All files renamed.
