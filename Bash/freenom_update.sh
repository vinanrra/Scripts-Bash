#!/bin/bash

# Github
# https://github.com/vinanrra/Scripts-Linux

### LOG

exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
mkdir -p ./freenom-updater/logs
exec 1>>./freenom-updater/logs/freenom.log 2>&1

# Everything below will go to the file 'PATH/TO/SCRIPT/freenom-updater/logs/freenom.log':

# Store date to variable
now=$(date)

# Get IP and store to file
dig +short myip.opendns.com @resolver1.opendns.com > ./freenom-updater/ip.txt

# Load IP from ip.txt to a variable
myip="$(cat ./freenom-updater/ip.txt)"

# Get actual IP from myip.opendns.com
newip="$(dig +short myip.opendns.com @resolver1.opendns.com)"

# Print info with OLD and NEW IP that will be store to log

echo ----------------------------------------------------------
echo "Checking if the have changed IP..."
echo "NEW = $newip"
echo "OLD = $myip"

# Check IPs if they are equal stop script
# if they are different will update DNS
if [ "$myip" == "$newip" ];then

    echo IPs are equal, the update isnt need it.
    echo $now
    echo ----------------------------------------------------------

    else

   # Execute freenom-dns to update DNS with new IP
   # You can change commands to others if you dont use freenom-dns
   # https://github.com/dabendan2/freenom-dns

   freenom-dns set www.DOMAIN.tk A $myip
   sleep 1m
   freenom-dns set .DOMAIN.tk A $myip
   sleep 1m
   freenom-dns set SUBDOMAIN.DOMAIN.tk A $myip
   sleep 1m
   freenom-dns set SUBDOMAIN.DOMAIN.tk A $myip
   sleep 1m
   freenom-dns set SUBDOMAIN.DOMAIN.tk A $myip
   sleep 1m
   freenom-dns set SUBDOMAIN.DOMAIN.tk A $myip
   sleep 1m
   freenom-dns set SUBDOMAIN.DOMAIN.tk A $myip
   sleep 1m
   freenom-dns set SUBDOMAIN.DOMAIN.tk A $myip
   echo $now
   echo ----------------------------------------------------------

fi

# Get log size
file_size=`du -b ./freenom-updater/logs/freenom.log | tr -s '\t' ' ' | cut -d' ' -f1`

# Check log size and if its bigget than 2MB move to freenom-logs
# If folder doesnt exist it will be created.
MaxFileSize=2048
if [ $file_size -gt $MaxFileSize ];then
    timestamp=`date +%s`
    mv ./freenom-updater/logs/freenom.log ./freenom-updater/logs/freenom.log.$(date +%m_%d_%H_%Y)
    touch ./freenom-updater/logs/freenom.log
fi
