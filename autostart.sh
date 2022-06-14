#!/bin/bash
cd $(dirname $0)
killall conky
rm -r ./auto_generated/auto_*

source ./components/scan_nic.sh
source ./components/create_conf.sh port_monitor.conf 20 20 800 500
source ./components/create_conf.sh log.conf 0 820 1900 600 last

# run conky
source ./auto_generated/auto_config.sh

