*  sudo fdisk /dev/vdb 
*  使用n命令创建新分区
*  一路自动回车完成创建
*  输入t修改谷歌创建的分区类型，一般8E为lvm
*  p检查创建的分区是否正确
*  w保存并退出fdisk
*  sudo pvcreate /dev/vdb1 创建新的lvm物理卷
*  sudo vgcreate flexVolume /dev/vdb1 创建新的lvm卷组
*  sudo lvcreate -l 100%FREE -n nextCloudVolume flexVolume 在卷组flexVolume中创建新的卷
*  sudo mkfs.ext4 /dev/flexVolume/nextCloudVolume 格式化新的卷
*  mkdir /data && sudo mount /dev/flexVolume/nextCloudVolume /data 挂载新的卷到data目录
*  配置开机自动挂载，把挂载项添加到/etc/fstab下面即可