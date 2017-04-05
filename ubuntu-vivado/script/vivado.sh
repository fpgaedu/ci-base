#!/bin/sh -ex

mkdir /tmp/vivado_install
tar -xvzf $VIVADO_INSTALL_ARCHIVE -C /tmp/vivado_install --strip-components=1

# Execute setup using configuration file. Install into 
/tmp/vivado_install/xsetup --agree 3rdPartyEULA,WebTalkTerms,XilinxEULA --batch Install --config $VIVADO_INSTALL_CONFIG --location $XILINX_INSTALL_PATH

# source settings64.sh in .bashrc
touch /home/vagrant/.bashrc
echo "source $VIVADO_INSTALL_PATH/settings64.sh" >> /home/vagrant/.bashrc
echo "export LC_ALL=\"en_US.UTF-8\"" >> /home/vagrant/.bashrc

# In order to support headless vm's, as per https://www.xilinx.com/support/answers/62553.html,
# a line in base.tcl containing rdi:x11_workaround needs to be removed
grep -v rdi::x11_workaround $VIVADO_INSTALL_PATH/lib/scripts/rdi/features/base/base.tcl > /tmp/base.tcl
mv /tmp/base.tcl $VIVADO_INSTALL_PATH/lib/scripts/rdi/features/base/base.tcl

# must change working directory or else driver install will fail.
cd $VIVADO_INSTALL_PATH/data/xicom/cable_drivers/lin64/install_script/install_drivers/

# drivers must be installed as sudo
sudo ./install_drivers

# cleanup
rm -rf /tmp/vivado_install/
rm -rf $VIVADO_INSTALL_ARCHIVE
rm -rf $VIVADO_INSTALL_CONFIG
