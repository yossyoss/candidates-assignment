#!/bin/bash
#add fix to exercise5-server2 here
#change ssh configuration
echo "Host *" > /home/vagrant/.ssh/config && echo " StrictHostKeyChecking no" >> /home/vagrant/.ssh/config
#copy server1 pub-key to server2 auth keys
cat /vagrant/server1.key | tee -a /home/vagrant/.ssh/authorized_keys

chown -R vagrant:vagrant /home/vagrant/