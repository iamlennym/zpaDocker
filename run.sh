#docker run -e PROVISION_KEY=`cat provision_key` -d --rm --privileged local_zscaler
docker run -d --rm --privileged local_zscaler_zpa
