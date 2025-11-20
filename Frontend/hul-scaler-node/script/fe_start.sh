#!/bin/sh

bin_dir=$(dirname `readlink -f $0`)

cd $bin_dir

$bin_dir/message.sh > /dev/null 2> /dev/null &

sleep 1

for i in 101 102 # 103
do
    nodeid=`expr $((0x600)) + $i`
    nickname=hul-scaler-$i
    dataport=`expr 9000 + $i`
    sitcp_ip=192.168.13.$i
    master=--master
    en_block=0x3

    $bin_dir/frontend.sh \
	$nickname \
	$nodeid \
	$dataport \
	$sitcp_ip \
	$master \
	$en_block \
	>/dev/null 2>/dev/null &
done
