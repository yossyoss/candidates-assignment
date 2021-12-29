#!/bin/bash
#add fix to exercise6-fix here
if [[ $# -lt 2 ]]
then
	echo "please add more then 2 arguments"
  exit 1
fi

ARRAY=( $@ )
len=${#ARRAY[@]}
DESTFOLDER=${ARRAY[$len-1]}
SOURCES=${ARRAY[@]:0:$len-1}

SRCHOST=`hostname`
if [[ `hostname` == server1 ]] 
then 
	DESTHOST=server2
else
	DESTHOST=server1
	#since this part doesnt exit in ex5 (we asked to allow ssh from server1 to server2 but not from 2 to 1 so we need to add the sme logic here)
	if [[ -f .ssh/id_rsa && -f .ssh/id_rsa.pub ]]; then
		ssh-keygen -N "" -f /home/vagrant/.ssh/id_rsa
		cp /home/vagrant/.ssh/id_rsa.pub /vagrant/server2.key
	fi
fi

scp -r $SOURCES vagrant@$DESTHOST:$DESTFOLDER 

BYTESCOUNT=0
for i in  $SOURCES ; do
	let "`stat -c "%s"  $i` + $BCOUNT"
done
echo $BYTESCOUNT