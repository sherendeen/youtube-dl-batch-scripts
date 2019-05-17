@echo off
echo Input the youtube video to be downloaded
set /p video=:

youtube-dl -x --audio-format mp3 %video%

pause