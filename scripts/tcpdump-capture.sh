#!/bin/bash

counter=1;

while [ 1 ]; do
	filename="tcpdump_cap_$counter.pcap"
	rm $filename 2> /dev/null
	echo "Writing to $filename start at `date`"
	/usr/sbin/tcpdump -ttt -lni eth1 -s0 -w $filename 2>/dev/null &
	sleep 600
	killall tcpdump

	counter=$(( $counter + 1 ))
	if [ $counter -eq 13 ]; then 
		counter=1
	fi
done

#df -h . | grep sda2 | cut -c 40-42
