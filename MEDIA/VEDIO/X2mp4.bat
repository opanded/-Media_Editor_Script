@echo off
echo 此脚本将转换当前目录下的所有视频文件（.flv、.mkv、.avi、.mov）到MP4格式。
echo 转换后的文件将保存在名为"converted"的新文件夹中。
echo 按任意键开始转换...
pause >nul
mkdir converted
for %%a in (*.flv *.mkv *.avi *.mov) do (
    ffmpeg -i "%%a" -map 0:v:0 -map 0:a:0 -codec copy "converted\%%~na.mp4"
)
echo 转换结束。按t，用转换后的视频替换转换前的视频文件；按其他按键，不做其他更改。
set /p userinp="输入你的选择(t/其他):"
if /i "%userinp%"=="t" (
    for %%a in (*.flv *.mkv *.avi *.mov) do (
        del "%%a"
        move "converted\%%~na.mp4" "%%~na.mp4"
    )
)
rem 转换完成，打印提示信息
echo.
echo 转换完成！
rem 提供两个选项，按x结束进程，按c跳转到指定的网址
choice /c xc /m "按x退出，按c跳转到https://space.bilibili.com/4262942"
rem 判断用户的选择，执行相应的操作
if errorlevel 2 start https://space.bilibili.com/4262942
if errorlevel 1 exit