@echo off
set title=StopWatch
title %title%
mode 40,6
color d

:reset
cls
echo 0 : 0 : 0
echo.
echo.
echo.
echo Enter = Start 
pause >nul

set sec=-1
set min=0
set hr=0

:start
title %title% ~ Started
cls
set /a sec=%sec%+1
if %sec%==60 set /a min=%min%+1 
if %sec%==60 set sec=0
if %min%==60 set /a hr=%hr%+1
if %min%==60 set min=0
if %min%==60 set sec=0
echo %hr% : %min% : %sec%
echo.
echo.
echo 'Z' = Pause 
echo 'S' = Stop
choice /c szc /n /t 1 /d c
if %ERRORLEVEL% equ 1 goto stop
if %ERRORLEVEL% equ 2 goto pause
if %ERRORLEVEL% equ 3 goto start

:pause
title %title% ~ Paused
cls
echo %hr% : %min% : %sec%
echo.
echo.
echo 'Z' = Continue 
echo 'S' = Stop
choice /c zs /n
if %ERRORLEVEL% equ 1 goto start
if %ERRORLEVEL% equ 2 goto stop
pause >nul

:stop
title %title% ~ Stopped
cls
echo Elapsed Time : %hr% : %min% : %sec%
echo.
echo.
echo 'R' = Reset 
echo 'Q' = Exit!
choice /c rq /n
if %ERRORLEVEL% equ 1 goto reset
if %ERRORLEVEL% equ 2 exit