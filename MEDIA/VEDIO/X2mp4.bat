@echo off
echo �˽ű���ת����ǰĿ¼�µ�������Ƶ�ļ���.flv��.mkv��.avi��.mov����MP4��ʽ��
echo ת������ļ�����������Ϊ"converted"�����ļ����С�
echo ���������ʼת��...
pause >nul
mkdir converted
for %%a in (*.flv *.mkv *.avi *.mov) do (
    ffmpeg -i "%%a" -map 0:v:0 -map 0:a:0 -codec copy "converted\%%~na.mp4"
)
echo ת����������t����ת�������Ƶ�滻ת��ǰ����Ƶ�ļ��������������������������ġ�
set /p userinp="�������ѡ��(t/����):"
if /i "%userinp%"=="t" (
    for %%a in (*.flv *.mkv *.avi *.mov) do (
        del "%%a"
        move "converted\%%~na.mp4" "%%~na.mp4"
    )
)
rem ת����ɣ���ӡ��ʾ��Ϣ
echo.
echo ת����ɣ�
rem �ṩ����ѡ���x�������̣���c��ת��ָ������ַ
choice /c xc /m "��x�˳�����c��ת��https://space.bilibili.com/4262942"
rem �ж��û���ѡ��ִ����Ӧ�Ĳ���
if errorlevel 2 start https://space.bilibili.com/4262942
if errorlevel 1 exit