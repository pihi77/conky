#!/bin/bash
cd $(dirname $0)
killall conky
rm -r ./auto_generated/auto_*
offset_x=3840
offset_y=0

res_x=$(cat /sys/class/graphics/*/virtual_size | cut -d"," -f1)
res_y=$(cat /sys/class/graphics/*/virtual_size | rev | cut -d"," -f1 | rev)

tretina=$(( (res_x*33/100) ))
sirka_okna=$(( tretina - 20 ))
dve_tretiny=$((tretina + tretina)) 
#create_conf.sh conf_name text_name offset_x offset_y size_x size_y [flag (last, network)]

# screen
source ./components/create_conf.sh screen screen $((offset_x+0)) $((offset_y+0)) $res_x $res_y

#prva tretina
source ./components/create_conf.sh default network $((offset_x+dve_tretiny+20)) 10 $sirka_okna 30
source ./components/scan_nic.sh default $((offset_x+dve_tretiny+20)) 70 $sirka_okna 0
source ./components/create_conf.sh default process $((offset_x+dve_tretiny+20)) 620 $sirka_okna 30

#druha tretina
source ./components/create_conf.sh default system_info $((offset_x+tretina+20)) 10 $sirka_okna 100 
source ./components/create_conf.sh default storage $((offset_x+tretina+20)) 300 $sirka_okna 300
source ./components/create_conf.sh default memory $((offset_x+tretina+20)) 597 $sirka_okna 300 

#tretia tretina
source ./components/create_conf.sh default port_monitor $((offset_x+10)) 10 $sirka_okna 300
source ./components/create_conf.sh default cpu $((offset_x+10)) 650 $sirka_okna 300

#spodna polovica
source ./components/create_conf.sh default logs $((offset_x+20)) 1020 1880 300 last

# run conky
source ./auto_generated/auto_config.sh

