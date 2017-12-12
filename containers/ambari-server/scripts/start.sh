#!/bin/bash

sleep 20
ambari-server restart

chmod 700 /root/.ssh
chmod 600 /root/.ssh/id_rsa
chmod 640 /root/.ssh/id_rsa.pub
service sshd restart

while true; do
  sleep 3
  tail -f /var/log/ambari-server/ambari-server.log
done
