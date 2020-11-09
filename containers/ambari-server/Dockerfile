FROM centos:7

ARG AMBARI_REPO_URL
RUN yum install -y wget sudo net-tools
RUN wget -nv ${AMBARI_REPO_URL} -O /etc/yum.repos.d/ambari.repo
RUN yum install -y ambari-server postgresql-jdbc
RUN yum install -y openssh openssh-server openssh-clients
RUN ambari-server setup --database=postgres --databasehost=postgres --databaseport=5432 --databasename=ambari --postgresschema=ambari  --databaseusername=ambari --databasepassword=dev --silent
RUN ambari-server setup --jdbc-db postgres --jdbc-driver=/usr/share/java/postgresql-jdbc.jar

# add ssh key
RUN rm -rf /root/.ssh
RUN mkdir /root/.ssh
ADD ssh/id_rsa /root/.ssh/id_rsa
ADD ssh/id_rsa.pub /root/.ssh/id_rsa.pub
ADD ssh/authorized_keys /root/.ssh/authorized_keys

RUN rm -f /start.sh
ADD scripts/start.sh /start.sh
CMD /start.sh
