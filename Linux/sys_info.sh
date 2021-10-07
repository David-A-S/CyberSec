#!/bin/bash

current_time=`date +%H:%M:%S`
current_date=`date +%Y:%m:%d`
output=$HOME/research/sys_info.txt
ipaddress=$(ip addr | grep inet | tail -2 | head -1)
files=$(find /home -type f -perm 777 2>/dev/null)

if [ $UID -eq 0 ]
then
echo "Please do not run as root"
exit
fi

if [ ! -d ~/research ]
then
mkdir ~/research
fi

if [ ~/research/sys_info.txt ]
then
rm ~/research/sys_info.txt
fi

echo "A Quick System Audit Script" >> $output
echo -e $current_time $current_date >> $output
echo "" >> $output
echo "Machine Type Info:" >> $output
echo $MACHTYPE >> $output
echo -e "Uname info: $(uname -a) \n" >> $output
echo -e "IP info: $(ip addr | grep inet | tail -2 | head -1) \n" >> $output
echo "Hostname: $(hostname -s)" >> $output
echo -e "\n777 Files:" >> $output
find / -type f -perm 777 2>/dev/null >> $output
echo -e "\nTOP 10 Processes:" >> $output
ps aux -m | awk {'print $1, $2, $3, $4, $11'} | head >> $output
