#!/bin/bash

# Requeriments:
# https://github.com/dabendan2/freenom-dns

myip="$(cat ip.txt)"
newip="$(dig +short myip.opendns.com @resolver1.opendns.com)"
now=$(date)
MaxFileSize=2048

file_size=`du -b ./freenom.log | tr -s '\t' ' ' | cut -d' ' -f1`

if [ $file_size -gt $MaxFileSize ];then
    timestamp=`date +%s`
    mkdir -p ./freenom-logs
    mv ./freenom.log ./freenom-logs/freenom.log.$(date +%m_%d_%H_%Y)
    touch ./freenom.log
fi

dig +short myip.opendns.com @resolver1.opendns.com > ./ip.txt

echo ----------------------------------------------------------
echo "Checking if the have changed IP..."
echo "NEW = $newip"
echo "OLD = $myip"

if [ "$myip" == "$newip" ];then
    echo IPs are equal, the update isnt need it.
    echo $now
    echo ----------------------------------------------------------
else
   freenom-dns set www.vfguerra.tk A $myip
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
