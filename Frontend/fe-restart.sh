#!/bin/sh

cd

huls=(scaler mhtdc hrtdc)

for h in ${huls[@]}
do
    $HOME/hul-$h-node/script/fe_kill.sh
    sleep 0.1
done

for h in ${huls[@]}
do
    $HOME/hul-$h-node/script/fe_start.sh
    sleep 0.1
done
