@echo off
setlocal enabledelayedexpansion
rem ����һ����ͼƬ�ļ����е�ͼƬת��Ϊ��Ƶ��bat�ļ�
rem ʹ�÷�����˫�����У�������ʾ����ͼƬ�ļ��е�·���������Ƶ��֡�ʺ�ʱ����Ȼ��ȴ�ת�����
rem ת����ɺ󣬻��ڽű����ڵ��ļ����´���һ��pic2vid�ļ��У�������ɵ���Ƶ�ļ�
rem ���԰�x�˳������߰�c��ת��https://space.bilibili.com/4262942

rem ��ʾ�û�����ͼƬ�ļ��е�·��
set /p folder=������ͼƬ�ļ��е�·����Ĭ��Ϊ�ű������ļ��У���/d %~dp0
rem �ж������Ƿ�Ϊ�գ����Ϊ�����ýű����ڵ�·����ΪĬ��ֵ
if not defined folder set folder=%~dp0
rem ��ʾ�û����������Ƶ��֡��
set /p fps=�����������Ƶ��֡�ʣ�Ĭ��Ϊ1����/d 1
rem �ж������Ƿ�Ϊ�գ����Ϊ������1��ΪĬ��ֵ
if not defined fps set fps=1
rem ��ʾ�û����������Ƶ��ʱ�����룩
set /p duration=�����������Ƶ��ʱ�����룩��Ĭ��Ϊ5����/d 5
rem �ж������Ƿ�Ϊ�գ����Ϊ������5��ΪĬ��ֵ
if not defined duration set duration=5
rem ���������Ƶ�ĸ�ʽ
set format=mp4
rem ��ȡ�ű����ڵ�·��
set script=%~dp0
rem ���������Ƶ���ļ��е�·��
set pic2vid=%script%pic2vid
rem ���������Ƶ���ļ���
if not exist %pic2vid% md %pic2vid%
rem ����ͼƬ�ļ����е�ͼƬ���������ļ���
for /r "%folder%" %%a in (*.jpg *.jpeg) do (
rem ��ȡͼƬ���ļ�����������׺����ȥ���ո�
for /f "delims=" %%b in ("%%~na") do set name=%%b
set name=!name: =!
rem ����ffmpeg��ͼƬת��Ϊ��Ƶ������ͬ���ļ�
ffmpeg -y -loop 1 -i "%folder%\!name!.jpg" -c:v libx264 -t %duration% -pix_fmt yuv420p -r %fps% "%pic2vid%\!name!.%format%"
)
rem ת����ɣ���ӡ��ʾ��Ϣ
echo.
echo ת����ɣ�
rem �ṩ����ѡ���x�������̣���c��ת��ָ������ַ
choice /c xc /m "��x�˳�����c��ת��https://space.bilibili.com/4262942"
rem �ж��û���ѡ��ִ����Ӧ�Ĳ���
if errorlevel 2 start https://space.bilibili.com/4262942
if errorlevel 1 exit