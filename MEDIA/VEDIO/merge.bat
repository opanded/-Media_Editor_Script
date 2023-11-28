@echo off
set /p vbitrate="请输入视频比特率（默认为4000kbps）："
if "%vbitrate%"=="" set vbitrate=4000k
set /p abitrate="请输入音频比特率（默认为320kbps）："
if "%abitrate%"=="" set abitrate=320k
echo 请选择视频的高度：
echo 1. 720p
echo 2. 1080p
echo 3. 1440p
echo 4. 2160p
set /p height="请输入选项（1-4，默认为1080p）："
if "%height%"=="1" set resolution=1280x720
if "%height%"=="2" set resolution=1920x1080
if "%height%"=="3" set resolution=2560x1440
if "%height%"=="4" set resolution=3840x2160
if not defined resolution set resolution=1920x1080
mkdir temp
for %%f in (*.mp4,*.flv,*.mkv,*.avi) do (
  ffmpeg -i "%%f" -s %resolution% -b:v %vbitrate% -b:a %abitrate% -f mpegts "temp\%%~nf.ts"
  echo file 'temp\%%~nf.ts' >> list.txt
)
ffmpeg -f concat -safe 0 -i list.txt -c copy merged_video.mp4
rd /s /q temp
del list.txt
rem 转换完成，打印提示信息
echo.
echo 转换完成！
rem 提供两个选项，按x结束进程，按c跳转到指定的网址
choice /c xc /m "按x退出，按c跳转到https://space.bilibili.com/4262942"
rem 判断用户的选择，执行相应的操作
if errorlevel 2 start https://space.bilibili.com/4262942
if errorlevel 1 exit
