#!/bin/bash
#echo $pocitadlo $pozicia_y $nic $pozicia_x $min_sirka
#echo $1 $2 $3 $4 $5
filename="auto_nic-"$1".conf"
substring=w
pozicia_y=$2
pozicia_x=$4
min_sirka=$5
min_vyska=$6

cp ./components/default.conf $filename

if [ "${3/$substring}" = "$3" ] ; then
#  echo "${substring} is not in ${3}"
eth=./components/default_eth.conf
else
#  echo "${substring} was found in ${3}"
eth=./components/default_wifi.conf
fi
cat "$eth" >> "$filename"

search="pozicia_y";
sed -i "s/$search/$pozicia_y/" $filename

search="pozicia_x";
sed -i "s/$search/$pozicia_x/" $filename

search="min_sirka";
sed -i "s/$search/$min_sirka/" $filename

search="min_vyska";
sed -i "s/$search/$min_vyska/" $filename

search="adapter_nazov";
sed -i "s/$search/$3/g" $filename
#conky -q -c $filename
echo "conky -q -c $filename |" >> auto_config.sh

