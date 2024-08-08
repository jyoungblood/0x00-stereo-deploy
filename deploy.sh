#!/bin/bash

GIT_BRANCH="master"
COMMIT_MESSAGE="Updates - $(date +"%Y-%m-%d %T")"
SSH_USER="xxxxxx"
SSH_SERVER="xxx.xxx.xx.xx"
SSH_PORT="xxxx"
DEPLOYMENT_PATH="/home/xx/public_html"
# SITE_PATH="."





# alt option - deploy w/ rsync
# rsync version - will delete files/folders on server that aren't local (unless) specified
  # using .gitignore is more sustainable but git deploy is more involved setup
# add '-n' for dry run
# rsync -avhHP --delete-after --chmod=Du=rwx,Dg=rx,D=x,Fu=rwx,Fg=r,Fo=r --exclude '.env' --exclude '.well-known' --exclude 'cgi-bin' $SITE_PATH -e "ssh -p $SSH_PORT" $SSH_USER@$SSH_SERVER:$DEPLOYMENT_PATH
















# (build step optional, uncomment to enable)

## Build FE assets
# npm run build


## Add new files to repo
git add --all


## Prompt for commit message (and provide a default)
echo "Enter Git commit message (default: $COMMIT_MESSAGE)"
read NEW_MESSAGE
[ -n "$NEW_MESSAGE" ] && COMMIT_MESSAGE=$NEW_MESSAGE
git commit -am "$COMMIT_MESSAGE"


## Push to origin branch
git push origin $GIT_BRANCH



## Pull on remote via ssh
ssh $SSH_USER@$SSH_SERVER -p $SSH_PORT -t "cd $DEPLOYMENT_PATH && git pull origin $GIT_BRANCH"



exit









