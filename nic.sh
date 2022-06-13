#!/bin/bash
rm nic-*.conf
rm autoconfig.sh
pocitadlo=1
pozicia=30
substring=w
for nic in $(ip a | grep -B1 "ether" | grep -v ether | awk '{print $2}' | cut -d":" -f1)
do 

if [ "${nic/$substring}" = "$nic" ] ; then
#  echo "${substring} is not in ${3}"
vyska=137
else
#  echo "${substring} was found in ${3}"
vyska=182
fi

  #echo $pocitadlo $pozicia $nic
  source create_nic_conf.sh $pocitadlo $pozicia $nic
  (( pozicia += vyska ))
  (( pocitadlo += 1 ))
done

filename=global_network_default.conf
cp nic_default.conf $filename
cat network_default.conf >> "$filename"


search="posun_y";
sed -i "s/$search/$pozicia/" $filename
echo "conky -q -c $filename" >> autoconfig.sh

source autoconfig.sh

