#!/bin/sh

docker ps -a --no-trunc  | grep "portainer" | awk '{print $1}' | xargs docker container stop

docker pull portainer/portainer-ce

echo y | docker system prune --volumes

sudo docker volume create portainer_data
#    -p 8000:8000 \

sudo docker run -d \
    -p 9000:9000 \
    --name=portainer \
    --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer_data:/data \
    portainer/portainer-ce
