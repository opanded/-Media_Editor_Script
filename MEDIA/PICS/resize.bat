@echo off
echo ��ѡ��Ҫ������ά�ȣ��������֣���
echo 1. ����
echo 2. ���
set /p dimensionChoice="���������ѡ��"
if %dimensionChoice%==1 set dimension=-1
if %dimensionChoice%==2 set dimension=-2
echo ��ѡ��Ŀ�������������������֣���
echo 1. 720
echo 2. 1080
echo 3. 1440
echo 4. 1280
echo 5. 1920
echo 6. 3840
echo 7. �Զ���
set /p sizeChoice="���������ѡ��"
if %sizeChoice%==1 set size=720
if %sizeChoice%==2 set size=1080
if %sizeChoice%==3 set size=1440
if %sizeChoice%==4 set size=1280
if %sizeChoice%==5 set size=1920
if %sizeChoice%==6 set size=3840
if %sizeChoice%==7 set /p size="�������Զ��������������"
echo ��ѡ��ת�����ͼƬ��ʽ���������֣���
echo 1. PNG
echo 2. JPG
set /p formatChoice="���������ѡ��"
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
rem ת����ɣ���ӡ��ʾ��Ϣ
echo.
echo ת����ɣ�
rem �ṩ����ѡ���x�������̣���c��ת��ָ������ַ
choice /c xc /m "��x�˳�����c��ת��https://space.bilibili.com/4262942"
rem �ж��û���ѡ��ִ����Ӧ�Ĳ���
if errorlevel 2 start https://space.bilibili.com/4262942
if errorlevel 1 exit