#!/bin/bash
sed -i "s/hostname=localhost/hostname=ambari-server.dev/" /etc/ambari-agent/conf/ambari-agent.ini
ambari-agent start

chmod 700 /root/.ssh
chmod 640 /root/.ssh/authorized_keys
service sshd start

while true; do
  sleep 3
  tail -f /var/log/ambari-agent/ambari-agent.log
done
