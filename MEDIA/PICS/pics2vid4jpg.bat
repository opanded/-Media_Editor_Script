@echo off
setlocal enabledelayedexpansion
rem 这是一个将图片文件夹中的图片转换为视频的bat文件
rem 使用方法：双击运行，按照提示输入图片文件夹的路径，输出视频的帧率和时长，然后等待转换完成
rem 转换完成后，会在脚本所在的文件夹下创建一个pic2vid文件夹，存放生成的视频文件
rem 可以按x退出，或者按c跳转到https://space.bilibili.com/4262942

rem 提示用户输入图片文件夹的路径
set /p folder=请输入图片文件夹的路径（默认为脚本所在文件夹）：/d %~dp0
rem 判断输入是否为空，如果为空则用脚本所在的路径作为默认值
if not defined folder set folder=%~dp0
rem 提示用户输入输出视频的帧率
set /p fps=请输入输出视频的帧率（默认为1）：/d 1
rem 判断输入是否为空，如果为空则用1作为默认值
if not defined fps set fps=1
rem 提示用户输入输出视频的时长（秒）
set /p duration=请输入输出视频的时长（秒）（默认为5）：/d 5
rem 判断输入是否为空，如果为空则用5作为默认值
if not defined duration set duration=5
rem 设置输出视频的格式
set format=mp4
rem 获取脚本所在的路径
set script=%~dp0
rem 设置输出视频的文件夹的路径
set pic2vid=%script%pic2vid
rem 创建输出视频的文件夹
if not exist %pic2vid% md %pic2vid%
rem 遍历图片文件夹中的图片，包括子文件夹
for /r "%folder%" %%a in (*.jpg *.jpeg) do (
rem 获取图片的文件名（不含后缀），去掉空格
for /f "delims=" %%b in ("%%~na") do set name=%%b
set name=!name: =!
rem 调用ffmpeg将图片转换为视频，覆盖同名文件
ffmpeg -y -loop 1 -i "%folder%\!name!.jpg" -c:v libx264 -t %duration% -pix_fmt yuv420p -r %fps% "%pic2vid%\!name!.%format%"
)
rem 转换完成，打印提示信息
echo.
echo 转换完成！
rem 提供两个选项，按x结束进程，按c跳转到指定的网址
choice /c xc /m "按x退出，按c跳转到https://space.bilibili.com/4262942"
rem 判断用户的选择，执行相应的操作
if errorlevel 2 start https://space.bilibili.com/4262942
if errorlevel 1 exit