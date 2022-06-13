#!/bin/bash
#echo $pocitadlo $pozicia $nic
#echo $1 $2 $3
filename="nic-"$1".conf"
substring=w
posun=$2
cp nic_default.conf $filename

if [ "${3/$substring}" = "$3" ] ; then
#  echo "${substring} is not in ${3}"
eth=eth_default.conf
else
#  echo "${substring} was found in ${3}"
eth=wifi_default.conf
fi
cat "$eth" >> "$filename"

search="posun_y";
sed -i "s/$search/$posun/" $filename

search="adapter_nazov";
sed -i "s/$search/$3/g" $filename
#conky -q -c $filename
echo "conky -q -c $filename |" >> autoconfig.sh

