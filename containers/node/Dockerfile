FROM centos:7

ARG AMBARI_REPO_URL
ARG HDP_REPO_URL
RUN yum install -y sudo wget openssl-devel postgresql-jdbc mysql-connector-java unzip
RUN wget -nv ${AMBARI_REPO_URL} -O /etc/yum.repos.d/ambari.repo
RUN wget -nv ${HDP_REPO_URL} -O /etc/yum.repos.d/hdp.repo
# Uncomment if you want to run kerberos in container
# RUN yum install -y krb5-server krb5-libs krb5-workstation
RUN true \
&& yum install -y ambari-agent \
&& yum install -y ambari-metrics-* \
&& yum install -y ambari-logsearch-* \
&& yum install -y hadoop* \
&& yum install -y zookeeper* \
&& yum install -y hive* \
&& yum install -y phoenix_* \
&& yum install -y ranger* \
&& yum install -y storm_* \
&& yum install -y kafka_* \
&& yum install -y pig_* \
&& yum install -y datafu_* \
&& yum install -y spark* livy* \
&& yum install -y zeppelin* \
&& yum install -y falcon_* \
&& yum install -y oozie_* \
# && yum install -y lucidworks-hdpsearch
&& yum install -y smartsense* \
&& yum install -y druid* \
&& yum install -y superset* \
&& yum install -y lzo snappy-devel rpcbind \
&& yum install -y openssh openssh-server openssh-clients \
&& yum-complete-transaction \
&& yum -y clean all \
&& rm /etc/yum.repos.d/hdp*.repo \
&& true

# add ssh key
RUN rm -rf /root/.ssh
RUN mkdir /root/.ssh
ADD ssh/id_rsa /root/.ssh/id_rsa
ADD ssh/id_rsa.pub /root/.ssh/id_rsa.pub
ADD ssh/authorized_keys /root/.ssh/authorized_keys

RUN rm -f /start.sh
ADD scripts/start.sh /start.sh
CMD /start.sh
