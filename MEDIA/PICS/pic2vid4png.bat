@echo off
setlocal

:: �û�����Ŀ¼·����Ϊ����Ĭ��Ϊ�ű�����Ŀ¼
set /p dir="������Ŀ¼·�� (Ĭ��Ϊ�ű�����Ŀ¼): "
if "%dir%"=="" set dir=%~dp0

:: �û�������Ƶ���ȣ�Ϊ����Ĭ����5��
set /p length="��������Ƶ���� (Ĭ��Ϊ5��): "
if "%length%"=="" set length=5

:: �û�������Ƶ֡�ʣ�Ϊ����Ĭ����1
set /p framerate="��������Ƶ֡�� (Ĭ��Ϊ1): "
if "%framerate%"=="" set framerate=1

:: �����Ƶ���ļ���Ϊ�ű������ļ����ڵ��½��ļ���pic2vid
set outputdir=%~dp0pic2vid
if not exist "%outputdir%" mkdir "%outputdir%"

:: ����Ŀ¼�µ�����png��webp�ļ�
for %%i in ("%dir%\*.png" "%dir%\*.webp") do (
    :: ʹ��ffmpeg��ͼƬת��Ϊ����͸��ͨ����mov��Ƶ
    ffmpeg -loop 1 -i "%%i" -c:v png -t %length% -r %framerate% -pix_fmt rgba "%outputdir%\%%~ni.mov"
)

endlocal

rem ת����ɣ���ӡ��ʾ��Ϣ
echo.
echo ת����ɣ�
rem �ṩ����ѡ���x�������̣���c��ת��ָ������ַ
choice /c xc /m "��x�˳�����c��ת��https://space.bilibili.com/4262942"
rem �ж��û���ѡ��ִ����Ӧ�Ĳ���
if errorlevel 2 start https://space.bilibili.com/4262942
if errorlevel 1 exit