#!/bin/bash
 
if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    exit
fi
 
# In any case remove the ip this is useful to prevent dups
sed -i "/deny $2;/d" /tmp/deny-hosts
 
# If action is ban add ip to deny-hosts file
if [ $1 == "ban" ] 
then
   echo "deny $2;" >> /tmp/deny-hosts
fi

aws s3 cp /tmp/deny-hosts s3://sony-exchange-docker/fail2ban/deny-hosts 
