* sudo zfs send familyPool/vm/ubuntuserver-livbsa | gzip > /mnt/backup/zvolback/ubuntuBackup230320.gz
先把ubuntuserver-livbsa这个zvol发送出去，然后通过gzip压缩后，放到ubuntuBackup230320.gz文件中

* sudo zcat /mnt/backup/zvolback/ubuntuBackup230320.gz | sudo zfs receive backup/ubuntuserver-livbsa
注意名称ubuntuserver-livbsa必须完全一样