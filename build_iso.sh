#!/bin/bash

VAGRANT_HOME=/home/vagrant
BUILD_FILES=${VAGRANT_HOME}/iso/build_files
SEED_FILES=${VAGRANT_HOME}/iso/seeds
NEW_ISO_NAME=ubuntu-1204-chef-`date +%F-%T`.iso

apt-get update
apt-get install -y mkisofs

echo "Mounting iso"
mkdir -p /mnt/iso
mount -o loop /home/vagrant/iso/UbuntuServer.iso /mnt/iso

echo "Copying original iso"
mkdir -p /opt/serveriso
cp -rT /mnt/iso /opt/serveriso
chmod -R 777 /opt/serveriso/

echo "Modifying original"
pushd /opt/serveriso
echo en > isolinux/langlist
cp ${SEED_FILES}/chef-bootstrap-seed.cfg /opt/serveriso/preseed/chef-bootstrap-seed.cfg
cp ${BUILD_FILES}/txt.cfg /opt/serveriso/isolinux/txt.cfg

chmod -R 777 /opt/serveriso/

echo "Creating iso"
mkisofs -D -r -V "ATTENDLESS_UBUNTU" -cache-inodes -J -l -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -o /home/vagrant/iso/${NEW_ISO_NAME} /opt/serveriso
echo "New iso ${NEW_ISO_NAME} complete"
