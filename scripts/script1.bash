#!/bin/bash
echo "Reading configurations ..."
source ./config/server.conf

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
sudo -u $USERNAME cp config/local.py.example config/local.py

sed_param=s/ALLOWED_HOSTS\ =\ .*/ALLOWED_HOSTS\ =\ [\""$DOMAIN_OR_IP"\",]/
sed -i "$sed_param" config/local.py

sed_param=s/DEBUG\ =\ .*/DEBUG\ =\ "False"/
sed -i "$sed_param" config/local.py

echo "Now switch to $USERNAME and run script2 ..."
