* docker转码命令参考
  * --rm表示结束后清理容器
  * -crf 建议值18-28
  * 固定码率可以使用-b:v 4M
  * 指定分辨率可以使用 -vf scale=1280:720
  * -metadata修改元数据
  * -metadata:s 修改所有流的元数据
  * -metadata:s:0 修改第0个流的数据
``` 
sudo docker run --rm -it \
    -v /mnt/moviePool/movie/movie:/input  \
    -v /mnt/moviePool/movie/recode:/output  \
    linuxserver/ffmpeg  \
    -i /input/$1/$1.$2 \
    -c:v libx265    \
    -preset veryslow \
    -crf $4     \
    -metadata:s title="" \
    -metadata title=$3 \
    -c:a copy   \
    -c:s copy   \
    /output/$3
```


我常用的脚本
```
sudo docker run --rm -it \
    -v /mnt/moviePool/movie/movie:/input  \
    -v /mnt/moviePool/movie/recode:/output  \
    linuxserver/ffmpeg  \
    -i /input/$1/$1.$2 \
    -c:v libx265    \
    -preset veryslow \
    -crf $4     \
    -metadata:s title="" \
    -metadata title=$3 \
    -c:a copy   \
    -c:s copy   \
    /output/$3
```
 
添加字幕
ffmpeg -i test_1280x720_3.mp4 -i test_1280x720_3.srt -c copy output.mkv

# crf设置值参考（x265编码）
23 对于1080p 10bit的已经足够无损了
28 对于1080p 也已经足够高清了，不是大片足够了。
23和28的文件差不多会大20%

默认速度为slow
速度与大小无关，fast有可能比特率低于slow，也就是相同crf目标下，fast码率有可能低于slow。
可以考虑对非特效电影默认设置fast试试
同样速度配置下，crf设置越高（越小），文件越大

