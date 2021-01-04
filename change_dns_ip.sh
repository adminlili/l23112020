#!/bin/bash

FILE_for_change_DNSIP=$(ls -l /etc/sysconfig/network-scripts/ifcfg-* | awk '{print $9;}')

DNS_IP1="192.168.0.1"
DNS_IP2="127.0.0.1"
#DNS_IP4=
#DNS_IP5=
#....

for file in  $FILE_for_change_DNSIP
do
echo -e " -- FILE --------** $file **----------------"
sed  -i 's/DNS1=\"\?.*\"\?/DNS1='$DNS_IP1'/g' $file
sed  -i 's/DNS2=\"\?.*\"\?/DNS2='$DNS_IP2'/g' $file
done

systemctl restart NetworkManager

echo -e "\n**************************  RESULT  **************************************\n"
cat /etc/sysconfig/network-scripts/ifcfg* | grep DNS

