x=1

while [ $x -lt 81 ]
do
	echo "[RouteMapRule_${x}_1_1]"
	echo "   se_as_action = 1"
	echo "   se_as_times = 2"
	echo "[RouteMapRule_${x}_2_1]"
	echo "   se_loc_pref = 80"
	x=`expr $x + 1`
done

x=1
while [ $x -lt 81 ] 
do
	echo "[CONFIG_TABLE_${x}_1]"
	echo "   nexthop_self = 1"
	echo "   export_map = 1"
	echo "[CONFIG_TABLE_${x}_2]"
	echo "   nexthop_self = 1"
	echo "   import_map = 2"
	x=`expr $x + 1`
done
