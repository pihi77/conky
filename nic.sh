rm nic-*.conf
pocitadlo=1
vyska=200
pozicia=30
for nic in $(ip a | grep -B1 "ether" | grep -v ether | awk '{print $2}' | cut -d":" -f1)
do 
  
  #echo $pocitadlo $pozicia $nic
  source create_nic_conf.sh $pocitadlo $pozicia $nic
  (( pozicia += vyska ))
  (( pocitadlo += 1 ))
done

