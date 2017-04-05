# Ubuntu-Vivado
Packer templates for Ubuntu+Vivado VirtualBox Vagrant boxes. These packer 
templates provision on top of an exisiting ubuntu image to save time.

## Building

Ubuntu 16.04 x64 + Vivado 2016.4 Lab Edition
`packer build -var-file=ubuntu-16-04.json -var-file=vivado-2016-04-lab.json -var 'vivado_install_archive_path=/path/to/Xilinx_Vivado_Lab_Lin_2016.4_0124_1.tar.gz' ubuntu-vivado.json`
