#!/bin/bash
apt-get update

apt-get -y install linux-image-extra-$(uname -r) linux-image-extra-virtual
apt-get -y install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get -y install docker-ce

apt-get update
apt-get -y install software-properties-common
add-apt-repository ppa:certbot/certbot
apt-get update
apt-get -y install certbot

certbot certonly --standalone -d hub.qualibrate.org -m herminio.vazquez@iovio.com --agree-tos

mkdir -p /home/ubuntu/certs
cp /etc/letsencrypt/live/hub.qualibrate.org/privkey.pem /home/ubuntu/certs/domain.key
cat /etc/letsencrypt/live/hub.qualibrate.org/cert.pem /etc/letsencrypt/live/hub.qualibrate.org/chain.pem > /home/ubuntu/certs/domain.crt
chmod 777 /home/ubuntu/certs/domain.crt
chmod 777 /home/ubuntu/certs/domain.key
chmod -R 777 /home/ubuntu/certs

mkdir -p /home/ubuntu/auth
docker run --entrypoint htpasswd registry:2 -Bbn nasdaq Welcome2QFP#_7102 > auth/htpasswd
chmod -R 777 /home/ubuntu/auth

docker run -d -p 5000:5000 --restart=always --name qualibrate-hub -v /home/ubuntu/auth:/auth -e "REGISTRY_AUTH=htpasswd" -e "REGISTRY_AUTH_HTPASSWD_REALM=Registry Realm" -e REGISTRY_AUTH_HTPASSWD_PATH=/auth/htpasswd  -v /home/ubuntu/certs:/certs -v /opt/docker-registry:/var/lib/registry -e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/domain.crt -e REGISTRY_HTTP_TLS_KEY=/certs/domain.key registry:2


