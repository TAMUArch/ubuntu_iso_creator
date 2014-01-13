#!/bin/bash

echo "Regenerating host keys"
KEYS="rsa dsa"

for KEY in $KEYS
do
  rm /etc/ssh/ssh_host_${KEY}_key
  ssh-keygen -f /etc/ssh/ssh_host_${KEY}_key -N '' -t $KEY
done

echo "Upgrading to latest software..."
apt-get update && apt-get dist-upgrade -y

echo "Cleaning up self"
rm /etc/rc2.d/s99bootstrap
