#!/bin/bash
echo "Reading configurations ..."
source ../config/server.conf

PROJ_ROOT="/home/$USERNAME/$PROJECT_NAME.com"
PROJ_DIR="/home/$USERNAME/$PROJECT_NAME.com/$USERNAME"

echo "creating user $USERNAME"
sudo adduser --disabled-password $USERNAME
cd /home/"$USERNAME"
sudo -u $USERNAME mkdir "$PROJECT_NAME".com
cd "$PROJECT_NAME".com
sudo -u $USERNAME mkdir static
sudo -u $USERNAME mkdir media

echo "cloning project..."
sudo -u $USERNAME git clone $PROJECT_REPO $PROJECT_NAME
cd $PROJECT_NAME

echo "updating settings file a local.py..."
sudo -u $USERNAME cp "$PROJ_DIR"/config/local.py.example "$PROJ_DIR"/config/local.py
echo "Now switch to $USERNAME and run script2 ..."
