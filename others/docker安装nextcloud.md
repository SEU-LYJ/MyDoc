sudo docker pull nextcloud


* 安装mysql
sudo docker run -d --name nextcloud_db -p 3306:3306 -v /data/mysql/data:/var/lib/mysql -v /data/mysql/conf:/etc/mysql/conf.d -e MYSQL_ROOT_PASSWORD=mypassword -e MYSQL_DATABASE=nextcloud -e MYSQL_USER=nextcloud -e MYSQL_PASSWORD=nextcloud --restart=always mariadb:latest

* 安装nextcloud
sudo docker run -itd --name nextcloud -p 8080:80 -v /data/nextcloud/html:/var/www/html --restart=always nextcloud

* 安装collobora（如果安装这个就不需要onlyoffice）
sudo docker run -itd --name colloboraOffice -p 9980:9980 -e username=myusername -e password=mypassword -e host=0.0.0.0 -e disable_certificate_validation=true -e extra_params='--o:ssl.enable=false' --restart always collabora/code

* 安装onlyoffice
sudo docker run -d --name onlyoffice -p 6060:80 --restart=always onlyoffice/documentserver:7.0.1

* 进入nextcloud，安装onlyoffice，然后再onlyoffice配置中填写上面的onlyoffice地址，类似http://192.168.1.2:6060
如果nextcloud中安装onlyoffice插件一直不成功，尝试在宿主机先安装apache2
```
sudo apt install apache2
sudo a2enmod proxy proxy_wstunnel proxy_http ssl
```

* 关于nextcloud提示域名非法问题
  进入config.php(如果是按照上面路径配置的，则在 /usr/local/nextcloud/html/config/config.php),找到trusted_domains array，在里面添加被提示非法的域名

* 关于应用下载慢问题
  在config.php里面最后添加这两行，使用国内的应用源：
    'appstoreenabled' => true,
  'appstoreurl' => 'https://www.orcy.net/ncapps/v2/',

    如果仍然无法安装，则可以直接离线下载（目前的应有都在familyPool/share/software/nextcloud里面，25说明对应的nextcloud版本是25），把下载后的压缩包解压到/usr/local/nextclound/html/custom_app目录下，把owner和group都改成www-data，然后重启docker即可。