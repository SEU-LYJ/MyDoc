* docker转码命令参考
  * --rm表示结束后清理容器
  * -crf 建议值18-28
  * 固定码率可以使用-b:v 4M
  * 指定分辨率可以使用 -vf scale=1280:720
``` 
sudo docker run --rm --it \
    -v /mnt/moviePool/movie:/input  \
    -v /mnt/moviePool/processed/temp:/ouput  \
    linuxserver/ffmpeg  \
    -i /input/movies/input.mkv \
    -c:v libx265    \
    -preset veryslow    \
    -crf 23     \
    -c:a copy   \
    /output/output.mkv 
```

sudo docker run --rm --it \
    -v /mnt/moviePool/movie:/input  \
    -v /mnt/moviePool/processed/temp:/ouput  \
    linuxserver/ffmpeg  \
    -i /input/movies/The.Missing.Gun.2002.1080p.WEB-DL.AVC.AC3.5.1-Knight.mkv \
    -c:v libx265    \
    -preset veryslow    \
    -crf 23     \
    -c:a copy   \
    /output/output.mkv 