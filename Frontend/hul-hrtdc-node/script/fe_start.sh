#!/bin/sh

bin_dir=$(dirname `readlink -f $0`)

cd $bin_dir

#$bin_dir/message.sh & #> /dev/null 2> /dev/null &
./message.sh > /dev/null 2> /dev/null &

sleep 1

for i in 121 122 123 125 142 143 144 202 #124 
do
    nodeid=`expr $((0x600)) + $i`
    nickname=hul-hrtdc-$i
    dataport=`expr 9000 + $i`
    sitcp_ip=192.168.13.$i
    min_window=0
    max_window=200
    en_slot=0x3
    if [ "$i" = 144 -o "$i" = 202 ]; then
	en_slot=0x1
    elif [ "$i" = 124 -o "$i" = 125 ]; then
	en_slot=0x2
    fi    
    $bin_dir/frontend.sh \
	$nickname \
	$nodeid \
	$dataport \
	$sitcp_ip \
	$min_window \
	$max_window \
	$en_slot \
	>/dev/null 2>/dev/null &
done
