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
vyska=183
fi
(( min_vyska = vyska -40))
#echo $min_vyska
  #echo $pocitadlo $pozicia_y $nic
  source ./components/create_nic_conf.sh $nic $pozicia_x $pozicia_y $min_sirka $min_vyska
  (( pozicia_y += vyska ))
  (( pocitadlo += 1 ))
done