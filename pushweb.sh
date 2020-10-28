#!/bin/bash

#date 10/28/20
#file push.sh
#brief Push website code to the AWS server via rsync
#author ben roberts
#lecture: Lab 9

#Constants
AWSHOST="ec2-3-94-166-96.compute-1.amazonaws.com"
AWSUSER="push-web"
LOCALDIR="web-content"

#Change Wording Directory
cd /root/chron-lab

#RSync
rsync -e "ssh -i keys/push-web" -vraO --no-perms --delete --chmod=600 --chown=push-web:www-data "${LOCALDIR}/" "$>
#Log it
LOG="Pushed web content to $AWSHOST"
logger -t $0 $LOG
(echo $LOG | ssmtp $2)
