@echo off
rem ���ñ���
set input_video=
set start_time=00:00:00
set end_time=00:01:31
set output_video=
set output_format=

:input_video_loop
set /p input_video=������������Ƶ�����ƣ���Ҫ������չ������
if "%input_video%"=="" (
    echo ��û�������κ����ݣ����������롣
    goto input_video_loop
) else (
    echo ���������Ƶ�����ǣ�%input_video%
)

:start_time_loop
set /p start_time=������ü��Ŀ�ʼʱ�䣨��ʽΪ hh:mm:ss����
if "%start_time%"=="" (
    echo ��û�������κ����ݣ���ʹ��Ĭ��ֵ 00:00:00��
    set start_time=00:00:00
) else (
    echo ������Ŀ�ʼʱ���ǣ�%start_time%
)

:end_time_loop
set /p end_time=������ü��Ľ���ʱ�䣨��ʽΪ hh:mm:ss����
if "%end_time%"=="" (
    echo ��û�������κ����ݣ���ʹ��Ĭ��ֵ 00:01:31��
    set end_time=00:01:31
) else (
    echo ������Ľ���ʱ���ǣ�%end_time%
)

:output_video_loop
set /p output_video=�����������Ƶ�����ƣ���Ҫ������չ������
if "%output_video%"=="" (
    echo ��û�������κ����ݣ����������롣
    goto output_video_loop
) else (
    echo ���������Ƶ�����ǣ�%output_video%
)

:output_format_loop
set /p output_format=�����������Ƶ�ĸ�ʽ������mp4, mkv, flv, avi�ȣ���
if "%output_format%"=="" (
    echo ��û�������κ����ݣ����������롣
    goto output_format_loop
) else (
    echo ���������Ƶ��ʽ�ǣ�%output_format%
)

ffmpeg -i %input_video% -ss %start_time% -to %end_time% -c:v copy -c:a copy %output_video%.%output_format%

echo ��Ƶ������ɣ������ƵΪ��%output_video%.%output_format%

:option_loop
echo �밴���¼�ѡ������Ҫ�Ĳ�����
echo 1����x���˳�����
echo 2����v����ת��https://space.bilibili.com/4262942
choice /c xv /n
if errorlevel 2 (
    start https://space.bilibili.com/4262942
    goto option_loop
) else if errorlevel 1 (
    exit
)
