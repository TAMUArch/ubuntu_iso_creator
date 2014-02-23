#!/bin/bash

ISO_NAME=ubuntu-12.04.4-server-amd64.iso
ISO_URL=http://releases.ubuntu.com/12.04/${ISO_NAME}
ISO_MD5SUM=e83adb9af4ec0a039e6a5c6e145a34de
ISO_ALTNAME=UbuntuServer.iso

if [ ! -f ${ISO_NAME} ]
then
  echo "Image not found beginning download"
  wget $ISO_URL
  DL_MD5SUM=`md5sum $ISO_NAME | awk '{print $1}'`
  if [ $DL_MD5SUM != $ISO_MD5SUM ]
  then
    echo "Bad checksum"
    return 1
  fi
  ln -s $ISO_NAME $ISO_ALTNAME
fi

vagrant up
