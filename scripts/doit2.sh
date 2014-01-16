MAXPKT=1500
MAXPPS=800
MINPPS=100
SLEEP=5

x=`date '+%N%S'`
RANDOM=$x

RNDPPS=$(($MAXPPS - $MINPPS))


echo "At `date` random seed is: $x MaxPkt: $MAXPKT  MaxPPS: $MAXPPS Sleep: $SLEEP"  >> seed_capture.txt

while [ 1 ]; do

 killall udpblast 

 for TGT in 172.18.244.2 172.18.244.6 172.18.244.10 172.18.244.14 172.18.244.18 172.18.244.22 172.18.244.26 172.18.244.30 172.18.244.34 172.18.244.38 172.18.244.46 172.18.244.50 172.18.244.54 172.18.244.58 172.18.244.62 172.18.244.66 172.18.244.70 172.18.244.74 172.18.244.78 172.18.244.82 172.18.244.86 172.18.244.90 172.18.244.94 172.18.244.98 172.18.244.102 172.18.244.106 172.18.244.110 172.18.244.114 172.18.244.118 172.18.244.122 172.18.244.126 172.18.244.130 172.18.244.138 172.18.244.142 172.18.244.146 172.18.244.150 172.18.244.154 172.18.244.158 172.18.244.162 172.18.244.166 172.18.244.170 172.18.244.174 172.18.244.178 172.18.244.182 172.18.244.186 172.18.244.190 172.18.244.194 172.18.244.198
 do

 nohup udpblast -m C $TGT -s $(($RANDOM%$MAXPKT)) -pps $(($RANDOM%$RNDPPS+$MINPPS)) > /dev/null 2> /dev/null &


 done


 echo "     Run Complete" >>  seed_capture.txt

 sleep $SLEEP

done