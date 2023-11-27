@echo off
setlocal

:: 用户输入目录路径，为空则默认为脚本所在目录
set /p dir="请输入目录路径 (默认为脚本所在目录): "
if "%dir%"=="" set dir=%~dp0

:: 用户输入视频长度，为空则默认是5秒
set /p length="请输入视频长度 (默认为5秒): "
if "%length%"=="" set length=5

:: 用户输入视频帧率，为空则默认是1
set /p framerate="请输入视频帧率 (默认为1): "
if "%framerate%"=="" set framerate=1

:: 输出视频的文件夹为脚本所在文件夹内的新建文件夹pic2vid
set outputdir=%~dp0pic2vid
if not exist "%outputdir%" mkdir "%outputdir%"

:: 遍历目录下的所有png和webp文件
for %%i in ("%dir%\*.png" "%dir%\*.webp") do (
    :: 使用ffmpeg将图片转换为带有透明通道的mov视频
    ffmpeg -loop 1 -i "%%i" -c:v png -t %length% -r %framerate% -pix_fmt rgba "%outputdir%\%%~ni.mov"
)

endlocal

rem 转换完成，打印提示信息
echo.
echo 转换完成！
rem 提供两个选项，按x结束进程，按c跳转到指定的网址
choice /c xc /m "按x退出，按c跳转到https://space.bilibili.com/4262942"
rem 判断用户的选择，执行相应的操作
if errorlevel 2 start https://space.bilibili.com/4262942
if errorlevel 1 exit