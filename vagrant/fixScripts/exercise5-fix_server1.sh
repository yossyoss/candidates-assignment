#!/bin/bash
#add fix to exercise5-server1 here
#change ssh configuration
echo "Host *" > /home/vagrant/.ssh/config && echo " StrictHostKeyChecking no" >> /home/vagrant/.ssh/config
#SSH-Key generate to the right location
ssh-keygen -N "" -f /home/vagrant/.ssh/id_rsa
#copy public key to the shared volume/mount
cp /home/vagrant/.ssh/id_rsa.pub /vagrant/server1.key

chown -R vagrant:vagrant /home/vagrant/