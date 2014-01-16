MAXPKT=1500
MAXPPS=800
SLEEP=5

x=`date '+%N%S'`
RANDOM=$x

echo "At `date` random seed is: $x MaxPkt: $MAXPKT  MaxPPS: $MAXPPS Sleep: $SLEEP"  >> seed_capture.txt

while [ 1 ]; do

 killall udpblast 

 nohup udpblast -m C 172.18.244.2 -s $(($RANDOM%$MAXPKT)) -pps $(($RANDOM%$MAXPPS)) > /dev/null 2> /dev/null &
 nohup udpblast -m C 172.18.244.6 -s $(($RANDOM%$MAXPKT)) -pps $(($RANDOM%$MAXPPS)) > /dev/null 2>/dev/null &
 nohup udpblast -m C 172.18.244.10 -s $(($RANDOM%$MAXPKT)) -pps $(($RANDOM%$MAXPPS)) > /dev/null 2>/dev/null &
 nohup udpblast -m C 172.18.244.14 -s $(($RANDOM%$MAXPKT)) -pps $(($RANDOM%$MAXPPS)) > /dev/null 2>/dev/null &
 nohup udpblast -m C 172.18.244.18 -s $(($RANDOM%$MAXPKT)) -pps $(($RANDOM%$MAXPPS)) > /dev/null 2>/dev/null &
 nohup udpblast -m C 172.18.244.22 -s $(($RANDOM%$MAXPKT)) -pps $(($RANDOM%$MAXPPS)) > /dev/null 2>/dev/null &
 nohup udpblast -m C 172.18.244.26 -s $(($RANDOM%$MAXPKT)) -pps $(($RANDOM%$MAXPPS)) > /dev/null 2>/dev/null &
 nohup udpblast -m C 172.18.244.30 -s $(($RANDOM%$MAXPKT)) -pps $(($RANDOM%$MAXPPS)) > /dev/null 2>/dev/null &
 nohup udpblast -m C 172.18.244.34 -s $(($RANDOM%$MAXPKT)) -pps $(($RANDOM%$MAXPPS)) > /dev/null 2>/dev/null &
 nohup udpblast -m C 172.18.244.38 -s $(($RANDOM%$MAXPKT)) -pps $(($RANDOM%$MAXPPS)) > /dev/null 2>/dev/null &
 nohup udpblast -m C 172.18.244.46 -s $(($RANDOM%$MAXPKT)) -pps $(($RANDOM%$MAXPPS)) > /dev/null 2>/dev/null &
 nohup udpblast -m C 172.18.244.50 -s $(($RANDOM%$MAXPKT)) -pps $(($RANDOM%$MAXPPS)) > /dev/null 2>/dev/null &
 nohup udpblast -m C 172.18.244.54 -s $(($RANDOM%$MAXPKT)) -pps $(($RANDOM%$MAXPPS)) > /dev/null 2>/dev/null &
 nohup udpblast -m C 172.18.244.58 -s $(($RANDOM%$MAXPKT)) -pps $(($RANDOM%$MAXPPS)) > /dev/null 2>/dev/null &
 nohup udpblast -m C 172.18.244.62 -s $(($RANDOM%$MAXPKT)) -pps $(($RANDOM%$MAXPPS)) > /dev/null 2>/dev/null &
 nohup udpblast -m C 172.18.244.66 -s $(($RANDOM%$MAXPKT)) -pps $(($RANDOM%$MAXPPS)) > /dev/null 2>/dev/null &
 nohup udpblast -m C 172.18.244.70 -s $(($RANDOM%$MAXPKT)) -pps $(($RANDOM%$MAXPPS)) > /dev/null 2>/dev/null &
 nohup udpblast -m C 172.18.244.74 -s $(($RANDOM%$MAXPKT)) -pps $(($RANDOM%$MAXPPS)) > /dev/null 2>/dev/null &
 nohup udpblast -m C 172.18.244.78 -s $(($RANDOM%$MAXPKT)) -pps $(($RANDOM%$MAXPPS)) > /dev/null 2>/dev/null &
 nohup udpblast -m C 172.18.244.82 -s $(($RANDOM%$MAXPKT)) -pps $(($RANDOM%$MAXPPS)) > /dev/null 2>/dev/null &
 nohup udpblast -m C 172.18.244.86 -s $(($RANDOM%$MAXPKT)) -pps $(($RANDOM%$MAXPPS)) > /dev/null 2>/dev/null &
 nohup udpblast -m C 172.18.244.90 -s $(($RANDOM%$MAXPKT)) -pps $(($RANDOM%$MAXPPS)) > /dev/null 2>/dev/null &
 nohup udpblast -m C 172.18.244.94 -s $(($RANDOM%$MAXPKT)) -pps $(($RANDOM%$MAXPPS)) > /dev/null 2>/dev/null &
 nohup udpblast -m C 172.18.244.98 -s $(($RANDOM%$MAXPKT)) -pps $(($RANDOM%$MAXPPS)) > /dev/null 2>/dev/null &
 nohup udpblast -m C 172.18.244.102 -s $(($RANDOM%$MAXPKT)) -pps $(($RANDOM%$MAXPPS)) > /dev/null 2>/dev/null &
 nohup udpblast -m C 172.18.244.106 -s $(($RANDOM%$MAXPKT)) -pps $(($RANDOM%$MAXPPS)) > /dev/null 2>/dev/null &
 nohup udpblast -m C 172.18.244.110 -s $(($RANDOM%$MAXPKT)) -pps $(($RANDOM%$MAXPPS)) > /dev/null 2>/dev/null &
 nohup udpblast -m C 172.18.244.114 -s $(($RANDOM%$MAXPKT)) -pps $(($RANDOM%$MAXPPS)) > /dev/null 2>/dev/null &
 nohup udpblast -m C 172.18.244.118 -s $(($RANDOM%$MAXPKT)) -pps $(($RANDOM%$MAXPPS)) > /dev/null 2>/dev/null &
 nohup udpblast -m C 172.18.244.122 -s $(($RANDOM%$MAXPKT)) -pps $(($RANDOM%$MAXPPS)) > /dev/null 2>/dev/null &
 nohup udpblast -m C 172.18.244.126 -s $(($RANDOM%$MAXPKT)) -pps $(($RANDOM%$MAXPPS)) > /dev/null 2>/dev/null &
 nohup udpblast -m C 172.18.244.130 -s $(($RANDOM%$MAXPKT)) -pps $(($RANDOM%$MAXPPS)) > /dev/null 2>/dev/null &
 nohup udpblast -m C 172.18.244.138 -s $(($RANDOM%$MAXPKT)) -pps $(($RANDOM%$MAXPPS)) > /dev/null 2>/dev/null &
 nohup udpblast -m C 172.18.244.142 -s $(($RANDOM%$MAXPKT)) -pps $(($RANDOM%$MAXPPS)) > /dev/null 2>/dev/null &
 nohup udpblast -m C 172.18.244.146 -s $(($RANDOM%$MAXPKT)) -pps $(($RANDOM%$MAXPPS)) > /dev/null 2>/dev/null &
 nohup udpblast -m C 172.18.244.150 -s $(($RANDOM%$MAXPKT)) -pps $(($RANDOM%$MAXPPS)) > /dev/null 2>/dev/null &
 nohup udpblast -m C 172.18.244.154 -s $(($RANDOM%$MAXPKT)) -pps $(($RANDOM%$MAXPPS)) > /dev/null 2>/dev/null &
 nohup udpblast -m C 172.18.244.158 -s $(($RANDOM%$MAXPKT)) -pps $(($RANDOM%$MAXPPS)) > /dev/null 2>/dev/null &
 nohup udpblast -m C 172.18.244.162 -s $(($RANDOM%$MAXPKT)) -pps $(($RANDOM%$MAXPPS)) > /dev/null 2>/dev/null &
 nohup udpblast -m C 172.18.244.166 -s $(($RANDOM%$MAXPKT)) -pps $(($RANDOM%$MAXPPS)) > /dev/null 2>/dev/null &
 nohup udpblast -m C 172.18.244.170 -s $(($RANDOM%$MAXPKT)) -pps $(($RANDOM%$MAXPPS)) > /dev/null 2>/dev/null &
 nohup udpblast -m C 172.18.244.174 -s $(($RANDOM%$MAXPKT)) -pps $(($RANDOM%$MAXPPS)) > /dev/null 2>/dev/null &
 nohup udpblast -m C 172.18.244.178 -s $(($RANDOM%$MAXPKT)) -pps $(($RANDOM%$MAXPPS)) > /dev/null 2>/dev/null &
 nohup udpblast -m C 172.18.244.182 -s $(($RANDOM%$MAXPKT)) -pps $(($RANDOM%$MAXPPS)) > /dev/null 2>/dev/null &
 nohup udpblast -m C 172.18.244.186 -s $(($RANDOM%$MAXPKT)) -pps $(($RANDOM%$MAXPPS)) > /dev/null 2>/dev/null &
 nohup udpblast -m C 172.18.244.190 -s $(($RANDOM%$MAXPKT)) -pps $(($RANDOM%$MAXPPS)) > /dev/null 2>/dev/null &
 nohup udpblast -m C 172.18.244.194 -s $(($RANDOM%$MAXPKT)) -pps $(($RANDOM%$MAXPPS)) > /dev/null 2>/dev/null &
 nohup udpblast -m C 172.18.244.198 -s $(($RANDOM%$MAXPKT)) -pps $(($RANDOM%$MAXPPS)) > /dev/null 2>/dev/null &

 echo "     Run Complete" >>  seed_capture.txt

 sleep $SLEEP

done
