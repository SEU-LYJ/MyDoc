sudo rsync -rv --progress /usr/local/nextcloud/ /data/nextcloud/ 将nextcloud文件夹下的内容原样传到/data/nextcloud下面，显示进度（-v）和进度条(--progress)

sudo rsync -avhuL --progress {{remote_host}}:{{path/to/remote_directory}} {{path/to/local_directory}}
* a:相当于-rlptgoD，
  * r: 递归复制 
  * l: 拷贝符号链接
  * p: 保留文件属性
  * t：保留文件修改时间
  * g: 保留文件属组权限
  * o：保留文件属主权限
  * D: 保留设备文件和特殊文件
* v：显示详细输出
* h：以人可读形式显示
* u：只更新源中更新的文件到目的中
* L：处理链接文件时，将链接指向的文件复制到文件夹
* 