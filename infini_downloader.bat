@echo off
title infini downloader youtube-dl script

REM Seth Herendeen 2021-08-07
REM ... No Rights Reserved
REM ... This work is public domain
REM INITIAL MENU SCREEN
color 4b

:initial
cls
echo Welcome to Infini Downloader, a YouTube-DL script. Version 1
echo This script is public domain.
echo.
echo.
echo 1) single download [download and then close]
echo 2) multidownload 
echo 3) update
echo 4) [exit]

set /p option=:

IF %option%==1 goto download
IF %option%==2 goto multidownload
IF %option%==3 goto update
if %option%==4 goto eof

echo Option input "%option%" is invalid. Please type option '1' or '2.'
goto initial

:update
cls
youtube-dl -U
pause
goto eof


:multidownload
goto download
REM cls
REM echo Download again?
REM set /p response=:
rem if %response%==no goto initial 
rem if %response%==n goto initial
rem if %response%==y goto download
rem if %response%==yes goto download
REM fallthrough to :download_no_convert


:download_mp3_again
cls
echo Input URL for mp3 download:
set /p video=:
:download_mp3


youtube-dl -x --audio-format mp3 %video%
if %option%==2 goto multidownload
rem if %option%==2 goto download_mp3_again
REM fallthrough
goto eof



:download_flac_again
cls
echo Input URL for flac download:
set /p flac_url=:
:download_flac

youtube-dl -x --audio-format flac %flac_url%
if %option%==2 goto multidownload
rem if %option%==2 goto download_flac_again
REM fallthrough
goto eof



:download
cls
echo.
echo.
echo file type to download and save as
echo.
echo 1. download and convert to mp3
echo 2. download and convert to flac
echo 3. download without conversion
echo 4. return to [main menu]
echo 5. exit
echo.
set /p opt=:
REM download mp3 again is necessary even if one
rem mp3
if %opt%==1 goto download_mp3_again
rem flac
if %opt%==2 goto download_flac_again
rem no convert
if %opt%==3 goto download_no_convert
rem initial
if %opt%==4 goto initial
if %opt%==5 goto eof



:download_no_convert
cls
echo Input url that you wish to download from
set /p url=:
youtube-dl.exe %URL%
pause
REM FALL THROUGH TO EOF



:eof

color 07
echo.
echo Goodbye
echo %status%
exit