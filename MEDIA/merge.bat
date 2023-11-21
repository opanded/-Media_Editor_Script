@echo off
rem 创建一个临时文件夹来存放转换后的ts文件
mkdir temp
rem 遍历当前目录下的所有视频文件
for %%f in (*.mp4,*.flv,*.mkv,*.avi) do (
  rem 将视频文件转换为ts格式，你可以修改视频分辨率和音频码率
  rem 视频分辨率选项：a是1920x1080p，b是1280x720p
  rem 音频码率选项：a是128kbps，b是160kbps，c是192kbps，d是256kbps，e是320kbps
  rem 例如，如果你想要视频分辨率为1280x720p，音频码率为192kbps，你可以将下面的代码改为
  rem ffmpeg -i "%%f" -s 1280x720 -b:a 192k -f mpegts "temp\%%~nf.ts"
  ffmpeg -i "%%f" -s 1920x1080 -b:a 320k -f mpegts "temp\%%~nf.ts"
  rem 将转换后的ts文件的文件名写入一个文本文件，用于后面的合并
  echo file 'temp\%%~nf.ts' >> list.txt
)
rem 使用concat demuxer来合并所有的ts文件为一个mp4文件，你可以修改输出文件名
rem 例如，如果你想要输出文件名为merged_video.mp4，你可以将下面的代码改为
rem ffmpeg -f concat -safe 0 -i list.txt -c copy merged_video.mp4
ffmpeg -f concat -safe 0 -i list.txt -c copy output.mp4
rem 删除临时文件夹和文本文件
rd /s /q temp
del list.txt
