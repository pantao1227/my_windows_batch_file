@echo off
if "%1"=="/?" goto help
if "%1"=="" goto help
set str=%*
set str=%str:\e=%
echo %str%
goto EOF

:help
echo Usage:
echo This command arbitrarily replaces the "\e" whith 0x1B to support ANSI code.
echo.

:EOF
