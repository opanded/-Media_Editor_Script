@echo off
echo 请选择要调整的维度（输入数字）：
echo 1. 长度
echo 2. 宽度
set /p dimensionChoice="请输入你的选择："
if %dimensionChoice%==1 set dimension=-1
if %dimensionChoice%==2 set dimension=-2
echo 请选择目标像素数量（输入数字）：
echo 1. 720
echo 2. 1080
echo 3. 1440
echo 4. 1280
echo 5. 1920
echo 6. 3840
echo 7. 自定义
set /p sizeChoice="请输入你的选择："
if %sizeChoice%==1 set size=720
if %sizeChoice%==2 set size=1080
if %sizeChoice%==3 set size=1440
if %sizeChoice%==4 set size=1280
if %sizeChoice%==5 set size=1920
if %sizeChoice%==6 set size=3840
if %sizeChoice%==7 set /p size="请输入自定义的像素数量："
echo 请选择转换后的图片格式（输入数字）：
echo 1. PNG
echo 2. JPG
set /p formatChoice="请输入你的选择："
if %formatChoice%==1 set format=png
if %formatChoice%==2 set format=jpg
set folder=resized
set /a count=1
:loop
if exist "%folder%" (
    set folder=resized_%count%
    set /a count+=1
    goto :loop
)
mkdir %folder%
for %%a in (*.jpg *.png *.webp *.jpeg) do (
    ffmpeg -i "%%a" -vf "scale=%dimension%:%size%" "%folder%\%%~na_resized.%format%"
)
rem 转换完成，打印提示信息
echo.
echo 转换完成！
rem 提供两个选项，按x结束进程，按c跳转到指定的网址
choice /c xc /m "按x退出，按c跳转到https://space.bilibili.com/4262942"
rem 判断用户的选择，执行相应的操作
if errorlevel 2 start https://space.bilibili.com/4262942
if errorlevel 1 exit