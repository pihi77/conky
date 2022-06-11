cd $(dirname $0)
killall conky
mkdir ~/.fonts > /dev/null 2>&1 
cp fonts/*.*tf ~/.fonts > /dev/null 2>&1 
mkdir ~/.local/share/fonts/ > /dev/null 2>&1 
cp fonts/*.*tf ~/.local/share/fonts/ > /dev/null 2>&1 
fc-cache ~/.fonts                                     
conky -q -c cpu.conf |
conky -q -c infofile.conf | 
conky -q -c memory.conf |
conky -q -c network.conf |
conky -q -c process.conf |
conky -q -c storage.conf

