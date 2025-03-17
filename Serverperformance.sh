#! /bin/bash

end=$((SECONDS+10))
while [ $SECONDS -lt $end ]; do
echo "-----------------------------------------"
echo "-----------------------------------------"
echo "-----------------------------------------"
MEMORY=$(free -m | awk 'NR==2{printf "%.2f%%\t\t", $3*100/$2 }')
DISK=$(df -h | awk '$NF=="/"{printf "%s\t\t", $5}')
CPU=$(top -bn1 | grep load | awk '{printf "%.2f%%\t\t\n", $(NF-2)}')
PSprocess=$(ps aux | sort -nrk 3,3 | head -n 5)
printf "Memory\t\tDisk\t\tCPU\n"
echo "$MEMORY$DISK$CPU"
echo "------------------------------------------"
echo "------------------------------------------"
hostnamectl | awk 'NR==7'
echo "Users connected to the system "
who
echo " tiempo Systme up arriba"
uptime
echo "TOP 5 PROCESSES / TOP 5 PROCESSES"
echo "$PSprocess"
LogInFailed=$(less | grep -i Failed /var/log/auth.log | wc -l)
echo "User Failed to Log in = $LogInFailed"
sleep 5
done
