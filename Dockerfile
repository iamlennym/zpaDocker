FROM redhat/ubi8-init
ENV container docker
RUN yum -y install rsyslog; yum clean all; systemctl enable rsyslog;
COPY etc/yum.repos.d/zscaler.repo /etc/yum.repos.d/zscaler.repo
RUN yum -y install zpa-connector; yum clean all; 
# COPY provision_key /opt/zscaler/var/provision_key
COPY usr/lib/systemd/system/zpa-connector.service /usr/lib/systemd/system/zpa-connector.service
RUN systemctl enable zpa-connector.service

CMD [ "/sbin/init" ]
