#!/bin/bash

#Assumes mcast output for cumulative upgrade is in /tmp/ackfile.txt
#and has been collected previous to this scripts execution

#Get a clean list of ips with no 'ACK:' header
cut -d' ' -f2 /tmp/ackfile.txt | sort > /tmp/t1.txt



#Get Mgmt ip for vlan 1
mysql -e "select IpAddr from VLanRemote where InterfaceId = 'sat0' and VLanID = 1 " nms > /tmp/mainlist.txt

#Get rid of blank lines if they were dead records in database and ipaddr header
grep \. /tmp/mainlist.txt | grep -v IpAddr | sort > /tmp/t3.txt

diff -b /tmp/t1.txt /tmp/t3.txt > /tmp/missing.txt


grep -v , /tmp/missing.txt | grep -v a | cut -d' ' -f2 > /tmp/final-missing.txt

#Get rid of diff spam to get accurate count.
echo -n "Number of missing ACKS is:"
cat /tmp/final-missing.txt | wc -l
echo "Look at /tmp/final-missing.txt for list"

