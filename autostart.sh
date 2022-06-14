#!/bin/bash
cd $(dirname $0)
killall conky
rm auto_*

pocitadlo=1
pozicia_y=20
pozicia_x=1400
min_sirka=500
substring=w
min_vyska=0

# network interfaces
for nic in $(ip a | grep -B1 "ether" | grep -v ether | awk '{print $2}' | cut -d":" -f1)
do 
if [ "${nic/$substring}" = "$nic" ] ; then
#  echo "${substring} is not in ${nic}"
vyska=137
else
#  echo "${substring} was found in ${nic}"
vyska=182
fi
(( min_vyska = vyska + 40))
echo $min_vyska
  #echo $pocitadlo $pozicia_y $nic
  source ./components/create_nic_conf.sh $pocitadlo $pozicia_y $nic $pozicia_x $min_sirka $min_vyska
  (( pozicia_y += vyska ))
  (( pocitadlo += 1 ))
done

# port monitor
filename=auto_port_monitor.conf
cp ./components/default.conf $filename
cat ./components/port_monitor.conf >> "$filename"

pozicia_y=20
search="pozicia_y";
sed -i "s/$search/$pozicia_y/" $filename

pozicia_x=20
search="pozicia_x";
sed -i "s/$search/$pozicia_x/" $filename

min_sirka=800
search="min_sirka";
sed -i "s/$search/$min_sirka/" $filename

min_vyska=500
search="min_vyska";
sed -i "s/$search/$min_vyska/" $filename
echo "conky -q -c $filename |" >> auto_config.sh

# logy
filename=auto_logy.conf
cp ./components/default.conf $filename
cat ./components/log.conf >> "$filename"

pozicia_y=820
search="pozicia_y";
sed -i "s/$search/$pozicia_y/" $filename

pozicia_x=0
search="pozicia_x";
sed -i "s/$search/$pozicia_x/" $filename

min_sirka=1900
search="min_sirka";
sed -i "s/$search/$min_sirka/" $filename

min_vyska=600
search="min_vyska";
sed -i "s/$search/$min_vyska/" $filename
echo "conky -q -c $filename" >> auto_config.sh

# run conky
source auto_config.sh

