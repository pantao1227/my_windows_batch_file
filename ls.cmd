@echo off
REM 目录
for /f %%i in ('dir /AD /b') do echo   [96m%%i[0m
REM 文件
for /f %%i in ('dir /A-D /b') do echo   [92m%%i[0m
