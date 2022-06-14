#!/bin/bash
#echo $nic $pozicia_x $pozicia_y $min_sirka $min_vyska
#echo $1 $2 $3 $4 $5
filename="./auto_generated/auto_nic-"$1".conf"
substring=w
pozicia_x=$2
pozicia_y=$3
min_sirka=$4
min_vyska=$5

cp ./components/default.conf $filename

if [ "${1/$substring}" = "$1" ] ; then
#  echo "${substring} is not in ${1}"
eth=./components/default_eth.conf
else
#  echo "${substring} was found in ${1}"
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
sed -i "s/$search/$1/g" $filename
#conky -q -c $filename
echo "conky -q -c $filename |" >> ./auto_generated/auto_config.sh

