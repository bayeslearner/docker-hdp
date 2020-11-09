#!/bin/bash
sed -i "s/hostname=localhost/hostname=ambari-server/" /etc/ambari-agent/conf/ambari-agent.ini
grep -q '^force_https_protocol' /etc/ambari-agent/conf/ambari-agent.ini && echo "force_https exists!" || sed -i 's/^\[security\]/\[security\]\nforce_https_protocol=PROTOCOL_TLSv1_2/' /etc/ambari-agent/conf/ambari-agent.ini 
ambari-agent restart

# todo: docker zombie reaping issue. 
chmod 700 /root/.ssh
chmod 600 /root/.ssh/id_rsa
chmod 640 /root/.ssh/id_rsa.pub
service sshd restart

# relieve pam access restricts
rm -rf /etc/pam.d/*
echo 'auth sufficient pam_permit.so' >> /etc/pam.d/other
echo 'account sufficient pam_permit.so' >> /etc/pam.d/other
echo 'password sufficient pam_permit.so' >> /etc/pam.d/other
echo 'session sufficient pam_permit.so' >> /etc/pam.d/other

while true; do
  sleep 3
  tail -f /var/log/ambari-agent/ambari-agent.log
done
