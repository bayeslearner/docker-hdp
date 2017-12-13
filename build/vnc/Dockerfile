FROM tuminglei/ubuntu-vnc

# add ssh key
RUN rm -rf /root/.ssh
RUN mkdir /ambari_ssh
ADD ssh/id_rsa /root/.ssh/id_rsa
ADD ssh/id_rsa.pub /root/.ssh/id_rsa.pub
ADD ssh/authorized_keys /root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/id_rsa
RUN service ssh restart
