@echo off
rem ����һ����ʱ�ļ��������ת�����ts�ļ�
mkdir temp
rem ������ǰĿ¼�µ�������Ƶ�ļ�
for %%f in (*.mp4,*.flv,*.mkv,*.avi) do (
  rem ����Ƶ�ļ�ת��Ϊts��ʽ��������޸���Ƶ�ֱ��ʺ���Ƶ����
  rem ��Ƶ�ֱ���ѡ�a��1920x1080p��b��1280x720p
  rem ��Ƶ����ѡ�a��128kbps��b��160kbps��c��192kbps��d��256kbps��e��320kbps
  rem ���磬�������Ҫ��Ƶ�ֱ���Ϊ1280x720p����Ƶ����Ϊ192kbps������Խ�����Ĵ����Ϊ
  rem ffmpeg -i "%%f" -s 1280x720 -b:a 192k -f mpegts "temp\%%~nf.ts"
  ffmpeg -i "%%f" -s 1920x1080 -b:a 320k -f mpegts "temp\%%~nf.ts"
  rem ��ת�����ts�ļ����ļ���д��һ���ı��ļ������ں���ĺϲ�
  echo file 'temp\%%~nf.ts' >> list.txt
)
rem ʹ��concat demuxer���ϲ����е�ts�ļ�Ϊһ��mp4�ļ���������޸�����ļ���
rem ���磬�������Ҫ����ļ���Ϊmerged_video.mp4������Խ�����Ĵ����Ϊ
rem ffmpeg -f concat -safe 0 -i list.txt -c copy merged_video.mp4
ffmpeg -f concat -safe 0 -i list.txt -c copy output.mp4
rem ɾ����ʱ�ļ��к��ı��ļ�
rd /s /q temp
del list.txt
