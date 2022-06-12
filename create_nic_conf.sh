#!/bin/bash
#echo $pocitadlo $pozicia $nic
echo $1 $2 $3
filename="nic-"$1".conf"
substring=w
if [ "${3/$substring}" = "$3" ] ; then
  echo "${substring} is not in ${3}"
  cp eth_default.conf $filename
else
  echo "${substring} was found in ${3}"
  cp wifi_default.conf $filename
fi

cp nic_default.conf $filename

search="posun_y";
sed -i "s/$search/$2/" $filename

search="adapter_nazov";
sed -i "s/$search/$3/g" $filename
conky -q -c $filename
#echo "conky -q -c $filename |" >> autoconfig.sh
