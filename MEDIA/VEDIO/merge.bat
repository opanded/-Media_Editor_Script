@echo off
set /p vbitrate="��������Ƶ�����ʣ�Ĭ��Ϊ4000kbps����"
if "%vbitrate%"=="" set vbitrate=4000k
set /p abitrate="��������Ƶ�����ʣ�Ĭ��Ϊ320kbps����"
if "%abitrate%"=="" set abitrate=320k
echo ��ѡ����Ƶ�ĸ߶ȣ�
echo 1. 720p
echo 2. 1080p
echo 3. 1440p
echo 4. 2160p
set /p height="������ѡ�1-4��Ĭ��Ϊ1080p����"
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
rem ת����ɣ���ӡ��ʾ��Ϣ
echo.
echo ת����ɣ�
rem �ṩ����ѡ���x�������̣���c��ת��ָ������ַ
choice /c xc /m "��x�˳�����c��ת��https://space.bilibili.com/4262942"
rem �ж��û���ѡ��ִ����Ӧ�Ĳ���
if errorlevel 2 start https://space.bilibili.com/4262942
if errorlevel 1 exit
