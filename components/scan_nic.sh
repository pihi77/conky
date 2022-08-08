#!/bin/bash
config=$1
pozicia_x=$2
pozicia_y=$3
min_sirka=$4
min_vyska=$5
substring=w

# network interfaces
for nic in $(ip a | grep -B1 "ether" | grep -v ether | awk '{print $2}' | cut -d":" -f1)
do 
if [ "${nic/$substring}" = "$nic" ] ; then
#  echo "${substring} is not in ${nic}"
vyska=100
else
#  echo "${substring} was found in ${nic}"
vyska=150
fi
(( min_vyska = vyska -40))
  source ./components/create_conf.sh $1 $nic $pozicia_x $pozicia_y $min_sirka $min_vyska network
  (( pozicia_y += vyska ))
  (( pocitadlo += 1 ))
done