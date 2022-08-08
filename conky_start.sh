#!/bin/bash
cd $(dirname $0)
killall conky
mkdir ~/.fonts > /dev/null 2>&1 
cp fonts/*.*tf ~/.fonts > /dev/null 2>&1 
mkdir ~/.local/share/fonts/ > /dev/null 2>&1 
cp fonts/*.*tf ~/.local/share/fonts/ > /dev/null 2>&1 
fc-cache ~/.fonts                                     
conky -q -c ./v_1/cpu.conf |
conky -q -c ./v_1/infofile.conf | 
conky -q -c ./v_1/memory.conf |
conky -q -c ./v_1/network.conf |
conky -q -c ./v_1/process.conf |
conky -q -c ./v_1/storage.conf

