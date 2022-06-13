#!/bin/bash
#echo $pocitadlo $pozicia_y $nic $pozicia_x $min_sirka
#echo $1 $2 $3 $4 $5
filename="nic-"$1".conf"
substring=w
pozicia_y=$2
pozicia_x=$4
min_sirka=$5
cp nic_default.conf $filename

if [ "${3/$substring}" = "$3" ] ; then
#  echo "${substring} is not in ${3}"
eth=eth_default.conf
else
#  echo "${substring} was found in ${3}"
eth=wifi_default.conf
fi
cat "$eth" >> "$filename"

search="pozicia_y";
sed -i "s/$search/$pozicia_y/" $filename

search="pozicia_x";
sed -i "s/$search/$pozicia_x/" $filename

search="min_sirka";
sed -i "s/$search/$min_sirka/" $filename


search="adapter_nazov";
sed -i "s/$search/$3/g" $filename
#conky -q -c $filename
echo "conky -q -c $filename |" >> autoconfig.sh

