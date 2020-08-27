@echo off
call :echoGreen --------------------------------------------------
echo.
call :echoGreen 这个脚本用于设置 EDA 工具的环境变量
echo.
call :echoCyan Pt 2020.8.21
echo.
call :echoGreen --------------------------------------------------

:set_vivado
echo.
echo Version of vivado already installed:
echo.
echo  [1] 2017.4           [2] 2018.3
echo  [3] 2019.1           [4] not set
echo.
set /p op= Enter the vivado you want to use:
echo.
if %op%==1 (
    set vivado_ver_str=2017.4
    goto vivado_2017_4
) else if %op%==2 (
    set vivado_ver_str=2018.3
    goto vivado_2018_3
) else if %op%==3 (
    set vivado_ver_str=2019.1
    goto vivado_2019_1
) else if %op%==4 (
    set vivado_ver_str=nune
    goto set_vsim  
) else goto quit_with_error

:vivado_2017_4
call :echoYellow * Set environment for Vivado 2017.4
CALL C:\Apps\Xilinx\Vivado\2017.4\.settings64-Vivado.bat
CALL C:\Apps\Xilinx\SDK\2017.4\.settings64-SDK_Core_Tools.bat
CALL D:\Xilinx\DocNav\.settings64-DocNav.bat
goto set_vsim

:vivado_2018_3
call :echoYellow * Set environment for Vivado 2018.3
CALL C:\Apps\Xilinx\Vivado\2018.3\.settings64-Vivado.bat
CALL C:\Apps\Xilinx\SDK\2018.3\.settings64-SDK_Core_Tools.bat
CALL D:\Xilinx\DocNav\.settings64-DocNav.bat
goto set_vsim

:vivado_2019_1
call :echoYellow * Set environment for Vivado 2019.1
CALL D:\Xilinx\Vivado\2019.1\.settings64-Vivado.bat
CALL D:\Xilinx\SDK\2019.1\.settings64-SDK_Core_Tools.bat
CALL D:\Xilinx\DocNav\.settings64-DocNav.bat
goto set_vsim

:set_vsim
echo.
echo Simulation tools already installed:
echo.
echo  [1] modelsim 2019.2          [2] questasim 2020.1
echo  [3] questasim 10.7c          [4] not set
echo.
set /p op=  Enter the simulation tool you want to use: 
echo.
if %op%==1 (
    set sim_str=ModelSim 2019.2
    goto modelsim_2019_2
) else if %op%==2 (
    set sim_str=QuestaSim 2020.1
    goto questasim_2020_1
) else if %op%==3 (
    set sim_str=QuestaSim 10.7c
    goto questasim_10_7c
) else if %op%==4 (
    set sim_str=no simulator
    goto cmdline
) else goto quit_with_error

:modelsim_2019_2
call :echoYellow * Add modeltech64_2019.2 to PATH
path %PATH%C:\Apps\modeltech64_2019.2\win64;
goto cmdline

:questasim_2020_1
call :echoYellow * Add questasim64_2020.1 to PATH
path %PATH%C:\Apps\questasim64_2020.1\win64;
goto cmdline

:questasim_10_7c
call :echoYellow * Add questasim64_10.7c to PATH
path %PATH%C:\Apps\questasim64_10.7c\win64;
goto cmdline

:cmdline
echo.
set /p subtitle=Enter the subtitle for the commandline window:  
title Vivado %vivado_ver_str% - %sim_str% - %subtitle%
echo.
cd %USERPROFILE%
cmd /k
goto EOF

:quit_with_error
echo invalid argument
pause
goto EOF

:echoRed
echo [91m%*[0m
goto EOF

:echoGreen
echo [92m%*[0m
goto EOF

:echoYellow
echo [93m%*[0m
goto EOF

:echoBlue
echo [94m%*[0m
goto EOF

:echoCyan
echo [96m%*[0m
goto EOF

:EOF