#!/bin/sh

exit 0

mkdir -p /var/atlas-probe/

sudo docker run --detach --restart=always --log-opt max-size=10m \
    --cpus=1 --memory=64m --memory-reservation=64m \
    --cap-add=SYS_ADMIN --cap-add=NET_RAW --cap-add=CHOWN \
    --mount type=tmpfs,destination=/var/atlasdata,tmpfs-size=64M \
    --label=com.centurylinklabs.watchtower.enable=true \
    -v /var/atlas-probe/etc:/var/atlas-probe/etc \
    -v /var/atlas-probe/status:/var/atlas-probe/status \
    -e RXTXRPT=yes \
    --name ripe-atlas --hostname "$(hostname --fqdn)" \
    jamesits/ripe-atlas:latest

echo "you key to register "
cat /var/atlas-probe/etc/probe_key.pub

cat /var/atlas-probe/etc/probe_key.pub | xclip

echo "visit https://atlas.ripe.net/apply/swprobe/ and register"
echo "visit https://isbgpsafeyet.com/ to find you AS number"
echo "key copied for clipboard"
echo "Создание резервной копии сводится с копированию содержимого папки /var/atlas-probe в надежное место "

