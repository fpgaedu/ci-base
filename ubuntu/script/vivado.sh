#!/bin/sh -ex

mkdir /tmp/vivado_install
tar -xvzf $VIVADO_INSTALL_ARCHIVE -C /tmp/vivado_install --strip-components=1

# Execute setup using configuration file. Install into 
/tmp/vivado_install/xsetup --agree 3rdPartyEULA,WebTalkTerms,XilinxEULA --batch Install --config $VIVADO_INSTALL_CONFIG --location $XILINX_INSTALL_PATH

# source settings64.sh in .bashrc
touch /home/vagrant/.bashrc
echo "source $VIVADO_INSTALL_PATH/settings64.sh" >> /home/vagrant/.bashrc

# must change working directory or else driver install will fail.
cd $VIVADO_INSTALL_PATH/data/xicom/cable_drivers/lin64/install_script/install_drivers/

# drivers must be installed as sudo
sudo ./install_drivers

# cleanup
rm -rf /tmp/vivado_install/
rm -rf $VIVADO_INSTALL_ARCHIVE
rm -rf $VIVADO_INSTALL_CONFIG
