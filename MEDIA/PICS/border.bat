@echo off
echo ��ѡ��߿���ɫ���������֣���
echo 1. ��ɫ
echo 2. ��ɫ
echo 3. ��ɫ
echo 4. ��ɫ
echo 5. ��ɫ
echo 6. ��ɫ
echo 7. ��ɫ
set /p colorChoice="���������ѡ��"
if %colorChoice%==1 set color=black
if %colorChoice%==2 set color=white
if %colorChoice%==3 set color=gray
if %colorChoice%==4 set color=red
if %colorChoice%==5 set color=yellow
if %colorChoice%==6 set color=green
if %colorChoice%==7 set color=blue
set /p borderThickness="������߿�ĺ�ȣ����أ���"
mkdir bordered
for %%a in (*.png *.jpg *.jpeg *.webp) do (
    ffmpeg -i "%%a" -vf "pad=width=iw+2*%borderThickness%:height=ih+2*%borderThickness%:x=%borderThickness%:y=%borderThickness%:color=%color%" "bordered\%%~na_bordered.png"
)