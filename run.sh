#docker run -e PROVISION_KEY=`cat provision_key` -d --rm --privileged local_zscaler
cp provision_key opt/zscaler/var
container_id=`docker run -d --rm --privileged local_zscaler_zpa`
docker cp provision_key $container_id:/opt/zscaler/var
docker exec -ti $container_id tail -f /var/log/messages
