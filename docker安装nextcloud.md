sudo docker pull nextcloud
sudo docker network create nextcloud_network
sudo docker run -d \
    --name nextcloud_db \
    -v /usr/local/mysql/data:/var/lib/mysql \
    --network nextcloud_network \
    -e MYSQL_ROOT_PASSWORD=my-secret-pw \
    -e MYSQL_DATABASE=nextcloud \
    -e MYSQL_USER=nextcloud \
    -e MYSQL_PASSWORD=nextcloud \
    mariadb:latest

sudo docker run -d \
    --name nextcloud \
    --network nextcloud_network \
    -p 8080:80 \
    -v nextcloud:/var/www/html \
    -e NEXTCLOUD_TRUSTED_DOMAINS=* \
    -e MYSQL_HOST=localhost \
    -e MYSQL_DATABASE=nextcloud \
    -e MYSQL_USER=nextcloud \
    -e MYSQL_PASSWD=nextcloud \
    nextcloud

* 安装onlyoffice
sudo docker run -d --name onlyoffice -p 6060:80 -v /app/onlyoffice/logs:/var/log/onlyoffice -v /app/onlyoffice/data:/var/www/onlyoffice/Data -v /app/onlyoffice/lib:/var/lib/onlyoffice -v /app/onlyoffice/db:/var/lib/postgresql --restart=always onlyoffice/documentserver:7.0.1

* 安装mysql
sudo docker run -d \
    --name nextcloud_db \
    -v /usr/local/mysql/data:/var/lib/mysql \
    --network nextcloud_network \
    -e MYSQL_ROOT_PASSWORD=my-secret-pw \
    -e MYSQL_DATABASE=nextcloud \
    -e MYSQL_USER=nextcloud \
    -e MYSQL_PASSWORD=nextcloud \
    mariadb:latest