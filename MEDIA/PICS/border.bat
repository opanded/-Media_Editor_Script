@echo off
echo 请选择边框颜色（输入数字）：
echo 1. 黑色
echo 2. 白色
echo 3. 灰色
echo 4. 红色
echo 5. 黄色
echo 6. 绿色
echo 7. 蓝色
set /p colorChoice="请输入你的选择："
if %colorChoice%==1 set color=black
if %colorChoice%==2 set color=white
if %colorChoice%==3 set color=gray
if %colorChoice%==4 set color=red
if %colorChoice%==5 set color=yellow
if %colorChoice%==6 set color=green
if %colorChoice%==7 set color=blue
set /p borderThickness="请输入边框的厚度（像素）："
set /p directory="请输入图片所在的目录（不输入的话默认是当前目录）："
cd /d %directory%
mkdir bordered
for %%a in (*.png *.jpg *.jpeg *.webp) do (
    ffmpeg -i "%%a" -vf "pad=width=iw+2*%borderThickness%:height=ih+2*%borderThickness%:x=%borderThickness%:y=%borderThickness%:color=%color%" "bordered\%%~na_bordered.png"
)
rem 转换完成，打印提示信息
echo.
echo 转换完成！
rem 提供两个选项，按x结束进程，按c跳转到指定的网址
choice /c xc /m "按x退出，按c跳转到https://space.bilibili.com/4262942"
rem 判断用户的选择，执行相应的操作
if errorlevel 2 start https://space.bilibili.com/4262942
if errorlevel 1 exit
