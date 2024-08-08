#!/bin/bash

SSH_USER="xxxxxx"
SSH_SERVER="xxx.xxx.xx.xx"
SSH_PORT="xxxx"
SITE_PATH="."
DEPLOYMENT_PATH="/xx/xx/public_html"


npm run build

# add '-n' for dry run
# --exclude '.htaccess'

rsync -avhHP --delete-after --chmod=Du=rwx,Dg=rx,D=x,Fu=rwx,Fg=r,Fo=r --exclude '.env' --exclude '.well-known' --exclude 'cgi-bin' $SITE_PATH -e "ssh -p $SSH_PORT" $SSH_USER@$SSH_SERVER:$DEPLOYMENT_PATH

exit
