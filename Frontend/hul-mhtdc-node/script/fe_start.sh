#!/bin/sh

bin_dir=$(dirname `readlink -f $0`)

cd $bin_dir

#$bin_dir/message.sh & #> /dev/null 2> /dev/null &
./message.sh > /dev/null 2> /dev/null &

#ctrl_bin=$HOME/hul_software/HRM/bin/set_nimio
# master_ip=192.168.12.104
#$ctrl_bin $master_ip

sleep 1

for i in 104 105 106 107 108 109 110 111 112
do
    nodeid=`expr $((0x600)) + $i`
    nickname=hul-mhtdc-`expr + $i`
    dataport=`expr 9000 + $i` 
    sitcp_ip=192.168.12.$i
    min_window=0
    max_window=200
    only_leading=0
    master=--slave
    if [ $i -eq 104 ]; then
	master=--master
    fi

    $bin_dir/frontend.sh \
	$nickname \
	$nodeid \
	$dataport \
	$sitcp_ip \
	$min_window \
	$max_window \
	$only_leading \
	$master \
	>/dev/null 2>/dev/null &
done
