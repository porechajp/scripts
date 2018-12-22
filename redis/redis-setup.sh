#! /bin/sh
apt update
apt install gcc -y -q
rm /tmp/redis.tar.gz
rm -rf /opt/redis
wget -O /tmp/redis.tar.gz http://download.redis.io/releases/redis-5.0.3.tar.gz
mkdir /opt/redis
tar xvf /tmp/redis.tar.gz --directory /opt/redis --strip 1
apt install make -y -q
cd /opt/redis
make
sed -e '/save/ s/^#*/#/' -i /opt/redis/redis.conf
sed -e 's#dump.rdb#/tmp/dump.rdb#' -i /opt/redis/redis.conf
ln -s /opt/redis/src/redis-server /bin/redis-server
ln -s /opt/redis/src/redis-cli /bin/redis-cli


