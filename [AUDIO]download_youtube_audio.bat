@echo off

REM Public Domain scripts. Use these however you want
REM Originally made by Seth G. R. Herendeen

echo Input the youtube video to be downloaded
set /p video=:

youtube-dl -x --audio-format mp3 %video%

pause
