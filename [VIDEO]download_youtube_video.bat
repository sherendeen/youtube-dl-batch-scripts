@echo off
echo Input link representing video to be downloaded
set /p video=:
youtube-dl -f mp4 %video%

pause