#!/bin/bash
pozicia_x=$3
pozicia_y=$4
min_sirka=$5
min_vyska=$6
flag=$7
substring=w

# nastavenie suborov
conf_file="./components/conf/$1.conf"
if [[ $flag = "network" ]];
then
    if [ "${2/$substring}" = "$2" ] ; then
    #  echo "${substring} is not in ${2}"
    text_file="./components/text/eth_text.conf"
    else
    #  echo "${substring} was found in ${2}"
    text_file="./components/text/wifi_text.conf"
    fi
else
    text_file="./components/text/$2_text.conf"
fi
auto_file="./auto_generated/auto_$2.conf"
auto_config="./auto_generated/auto_config.sh"
# plnenie suborov
cp $conf_file $auto_file
cat $text_file >> "$auto_file"

search="pozicia_x";
sed -i "s/$search/$pozicia_x/" $auto_file

search="pozicia_y";
sed -i "s/$search/$pozicia_y/" $auto_file

search="min_sirka";
sed -i "s/$search/$min_sirka/" $auto_file

search="min_vyska";
sed -i "s/$search/$min_vyska/" $auto_file

if [[ $flag = "network" ]];
then
    search="adapter_nazov";
    sed -i "s/$search/$2/g" $auto_file
fi
# zapis do autoconfigu
if [[ $flag = "last" ]];
then
    echo "conky -q -c $auto_file" >> $auto_config
else
    #echo "conky -q -c $auto_file |" >> $auto_config
    echo "conky -q -c $auto_file &" >> $auto_config
fi