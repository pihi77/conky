#!/bin/bash
rm nic-*.conf
rm autoconfig.sh
pocitadlo=1
pozicia_y=20
pozicia_x=1400
min_sirka=500
substring=w
for nic in $(ip a | grep -B1 "ether" | grep -v ether | awk '{print $2}' | cut -d":" -f1)
do 

if [ "${nic/$substring}" = "$nic" ] ; then
#  echo "${substring} is not in ${nic}"
vyska=137
else
#  echo "${substring} was found in ${nic}"
vyska=182
fi

  #echo $pocitadlo $pozicia_y $nic
  source create_nic_conf.sh $pocitadlo $pozicia_y $nic $pozicia_x $min_sirka
  (( pozicia_y += vyska ))
  (( pocitadlo += 1 ))
done

filename=global_network_default.conf
cp nic_default.conf $filename
cat network_default.conf >> "$filename"

pozicia_y=20
search="pozicia_y";
sed -i "s/$search/$pozicia_y/" $filename

pozicia_x=20
search="pozicia_x";
sed -i "s/$search/$pozicia_x/" $filename

min_sirka=800
search="min_sirka";
sed -i "s/$search/$min_sirka/" $filename


echo "conky -q -c $filename" >> autoconfig.sh

source autoconfig.sh

