@echo off
rem 设置变量
set input_video=
set start_time=00:00:00
set end_time=00:01:31
set output_video=
set output_format=

:input_video_loop
set /p input_video=请输入输入视频的名称（不要忘记扩展名）：
if "%input_video%"=="" (
    echo 你没有输入任何内容，请重新输入。
    goto input_video_loop
) else (
    echo 你输入的视频名称是：%input_video%
)

:start_time_loop
set /p start_time=请输入裁剪的开始时间（格式为 hh:mm:ss）：
if "%start_time%"=="" (
    echo 你没有输入任何内容，将使用默认值 00:00:00。
    set start_time=00:00:00
) else (
    echo 你输入的开始时间是：%start_time%
)

:end_time_loop
set /p end_time=请输入裁剪的结束时间（格式为 hh:mm:ss）：
if "%end_time%"=="" (
    echo 你没有输入任何内容，将使用默认值 00:01:31。
    set end_time=00:01:31
) else (
    echo 你输入的结束时间是：%end_time%
)

:output_video_loop
set /p output_video=请输入输出视频的名称（不要输入扩展名）：
if "%output_video%"=="" (
    echo 你没有输入任何内容，请重新输入。
    goto output_video_loop
) else (
    echo 你输入的视频名称是：%output_video%
)

:output_format_loop
set /p output_format=请输入输出视频的格式（比如mp4, mkv, flv, avi等）：
if "%output_format%"=="" (
    echo 你没有输入任何内容，请重新输入。
    goto output_format_loop
) else (
    echo 你输入的视频格式是：%output_format%
)

ffmpeg -i %input_video% -ss %start_time% -to %end_time% -c:v copy -c:a copy %output_video%.%output_format%

echo 视频剪切完成，输出视频为：%output_video%.%output_format%

:option_loop
rem 转换完成，打印提示信息
echo.
echo 转换完成！
rem 提供两个选项，按x结束进程，按c跳转到指定的网址
choice /c xc /m "按x退出，按c跳转到https://space.bilibili.com/4262942"
rem 判断用户的选择，执行相应的操作
if errorlevel 2 start https://space.bilibili.com/4262942
if errorlevel 1 exit