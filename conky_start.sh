cd $(dirname $0)
killall conky
conky -q -c cpu.conf |
conky -q -c infofile.conf | 
conky -q -c memory.conf |
conky -q -c network.conf |
conky -q -c process.conf |
conky -q -c storage.conf

