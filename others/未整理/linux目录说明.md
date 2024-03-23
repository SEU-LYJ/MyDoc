按照根目录说明
# 1. 最小系统
一般最小unix系统都会包含以下目录，下面分别对以下目录的内容进行介绍
```shell
drwxr-xr-x    2 root     root         12288 Dec 21 18:28 bin
drwxr-xr-x    5 root     root           360 Jan  7 15:24 dev
drwxr-xr-x    1 root     root          4096 Jan  7 15:24 etc
drwxr-xr-x    2 nobody   nobody        4096 Dec 21 18:28 home
drwxr-xr-x    2 root     root          4096 Dec 21 18:28 lib
dr-xr-xr-x  387 root     root             0 Jan  7 15:24 proc
drwx------    1 root     root          4096 Jan  7 15:24 root
dr-xr-xr-x   13 root     root             0 Jan  7 15:24 sys
drwxrwxrwt    2 root     root          4096 Dec 21 18:28 tmp
drwxr-xr-x    4 root     root          4096 Dec 21 18:28 usr
drwxr-xr-x    4 root     root          4096 Dec 21 18:28 var
```
## bin
binary的缩写，所有用户共享的linux命令存放位置，里面有一些基础的unix工具，如ls、which、whoami等等。
## dev
device的缩写，存放的是linux设备，但是这里的设备不一定是对应一个真实的物理设备，比如在linux里面打开一个命令行终端对应的也会是一个tty设备。如：
* 首先打开一个终端，显示/dev/pts下的设备数为2个.第6行调用tty显示当前终端就是对应的pts/0设备。
```shell {.line-numbers}
/ # cd /dev/pts
/dev/pts # ls -l
total 0
crw--w----    1 root     tty       136,   0 Jan  7 15:44 0
crw-rw-rw-    1 root     root        5,   2 Jan  7 15:44 ptmx
/dev/pts # tty
/dev/pts/0
```
* 再打开一个新终端，重复上述操作，显示pts设备就多了一个1.对应的正好是新的终端
```shell {.line-numbers}
/ # cd /dev/pts
/dev/pts # ls -l
total 0
crw--w----    1 root     tty       136,   0 Jan  7 15:44 0
crw--w----    1 root     tty       136,   0 Jan  7 15:44 1
crw-rw-rw-    1 root     root        5,   2 Jan  7 15:44 ptmx
/dev/pts # tty
/dev/pts/0
/dev/pts/1
```

## etc
etceteras，附加项目，一般存放各种应用配置

## home
用户的主目录

## lib
Library，存放着各种动态链接库

## proc
porcess的缩写，是虚拟文件系统，映射了内核运行状态的各种文件，包括各种运行中的进程等等

## sys
Linux2.6的内核开始出现的一个新文件系统sysfs。是内核设备树的一个直观反映，比如我的系统下面有这些文件夹
```shell {.line-numbers}
dr-xr-xr-x  13 root root    0 1月   8 12:25 ./
drwxr-xr-x  20 root root 4096 1月   2 22:06 ../
drwxr-xr-x   2 root root    0 1月   8 12:25 block/
drwxr-xr-x  46 root root    0 1月   8 12:25 bus/
drwxr-xr-x  79 root root    0 1月   8 12:25 class/
drwxr-xr-x   4 root root    0 1月   8 12:25 dev/
drwxr-xr-x  16 root root    0 1月   8 12:25 devices/
drwxr-xr-x   6 root root    0 1月   8 12:25 firmware/
drwxr-xr-x   9 root root    0 1月   8 12:25 fs/
drwxr-xr-x   2 root root    0 1月   8 12:36 hypervisor/
drwxr-xr-x  16 root root    0 1月   8 12:25 kernel/
drwxr-xr-x 211 root root    0 1月   8 12:25 module/
drwxr-xr-x   3 root root    0 1月   8 12:25 power/
```
## tmp
temporary，存放临时文件
## usr
unix shared resource的缩写,即共享资源，类似windows下的program files,/usr/bin下面也会有很多通用的linux命令存放。
## var
variable的缩写，变量的意思，一般会把经常修改的目录放在这里，比如日志。
# 扩展系统

# cdrom





# media

# mnt

# opt


# run

# sbin

# snap

# srv

