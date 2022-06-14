#!/bin/bash
cd $(dirname $0)
killall conky
rm -r ./auto_generated/auto_*

res_x=$(cat /sys/class/graphics/*/virtual_size | cut -d"," -f1)
res_y=$(cat /sys/class/graphics/*/virtual_size | rev | cut -d"," -f1 | rev)

#create_conf.sh conf_name text_name offset_x offset_y size_x size_y [flag (last, network)]
source ./components/create_conf.sh screen screen 0 0 $res_x $res_y
source ./components/scan_nic.sh
source ./components/create_conf.sh default port_monitor 20 20 800 500
source ./components/create_conf.sh default storage 1000 20 300 300 
source ./components/create_conf.sh default logs 0 820 1900 600 last

# run conky
source ./auto_generated/auto_config.sh

