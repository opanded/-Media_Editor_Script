@echo off
echo �˽ű���ת����ǰĿ¼�µ�������Ƶ�ļ���.mp4��.flv��.mkv��.avi��.mov����MP4��ʽ��
echo ת������ļ�����������Ϊ"converted"�����ļ����С�
echo ���������ʼת��...
pause >nul
mkdir converted
for %%a in (*.mp4 *.flv *.mkv *.avi *.mov) do (
    ffmpeg -i "%%a" -map 0:v:0 -map 0:a:0 -codec copy "converted\%%~na.mp4"
)
rem ת����ɣ���ӡ��ʾ��Ϣ
echo.
echo ת����ɣ�
rem �ṩ����ѡ���x�������̣���c��ת��ָ������ַ
choice /c xc /m "��x�˳�����c��ת��https://space.bilibili.com/4262942"
rem �ж��û���ѡ��ִ����Ӧ�Ĳ���
if errorlevel 2 start https://space.bilibili.com/4262942
if errorlevel 1 exit