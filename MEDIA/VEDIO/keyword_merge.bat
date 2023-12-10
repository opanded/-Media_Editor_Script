@echo off
setlocal

set /p "input=ÇëÊäÈëÒªËÑË÷µÄ×Ö·û´®: "

set "temp=temp.txt"

for %%i in (*%input%*.mp4) do echo file '%%i' >> %temp%
ffmpeg -f concat -safe 0 -i %temp% -c copy %input%.mp4

del %temp%
