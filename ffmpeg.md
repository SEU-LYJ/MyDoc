* docker转码命令参考
  * --rm表示结束后清理容器
  * -crf 建议值18-28
  * 固定码率可以使用-b:v 4M
  * 指定分辨率可以使用 -vf scale=1280:720
``` 
sudo docker run --rm -it \
    -v /mnt/moviePool/movie:/input  \
    -v /mnt/moviePool/processed/temp:/output  \
    linuxserver/ffmpeg  \
    -i /input/movies/input.mkv \
    -c:v libx265    \
    -preset veryslow    \
    -crf 23     \
    -c:a copy   \
    /output/output.mkv 
```


我常用的脚本
```
sudo docker run --rm -it \
    -v /mnt/moviePool/movie/movie:/input  \
    -v /mnt/moviePool/movie/recode:/output  \
    linuxserver/ffmpeg  \
    -i /input/$1/$1.$2 \
    -c:v libx265    \
    -preset slow    \
    -crf $4     \
    -c:a copy   \
    -c:s copy   \
    /output/$3
```

添加字幕
ffmpeg -i test_1280x720_3.mp4 -i test_1280x720_3.srt -c copy output.mkv

# crf设置值参考（x265编码）
23 对于1080p 10bit的已经足够无损了
28 对于1080p 也已经足够搞清了

默认速度为slow