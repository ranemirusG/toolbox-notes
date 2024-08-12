@echo off
SET BrowserPath="C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" 
:loop
SET Str=%~1
REM echo TextPart: %Str%
IF %Str:~0,4%==http (
   REM echo Execute: %Str%
   cmd /c %BrowserPath% %Str%
)
IF %Str:~0,3%==www (
   REM echo Execute: %Str%
   cmd /c %BrowserPath% %Str%
)
SHIFT
IF NOT "%~1"=="" GOTO loop
REM pause