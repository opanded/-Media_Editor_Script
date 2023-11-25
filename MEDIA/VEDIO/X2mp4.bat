@echo off
mkdir converted
for %%a in (*.mp4 *.flv *.mkv *.avi *.mov) do (
    ffmpeg -i "%%a" -map 0:v:0 -map 0:a:0 -codec copy "converted\%%~na.mp4"
)
