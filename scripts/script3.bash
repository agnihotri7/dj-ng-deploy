#!/bin/bash
echo "Reading configurations ..."
source ./config/server.conf

PROJ_DIR="/home/$USERNAME/$PROJECT_NAME.com/$USERNAME"

echo "update system ..."
apt-get update

echo "install requirements ..."
apt-get install git gcc python-dev python-setuptools python-virtualenv libjpeg-dev zlib1g-dev libpq-dev nginx supervisor

echo "add supervisor.conf ..."
cp "$PROJ_DIR"/config/supervisor/"$PROJECT_NAME".conf /etc/supervisor/conf.d/"$PROJECT_NAME".conf
supervisorctl reread
supervisorctl update
supervisorctl status $PROJECT_NAME

echo "add nginx.conf ..."
cp "$PROJ_DIR"/config/nginx/"$PROJECT_NAME".conf /etc/nginx/sites-available/"$PROJECT_NAME".conf
ln -s /etc/nginx/sites-available/"$PROJECT_NAME".conf /etc/nginx/sites-enabled/"$PROJECT_NAME".conf
rm /etc/nginx/sites-enabled/default
nginx -t
service nginx restart
echo "FINISH"
echo "Go to browser and check $DOMAIN_OR_IP"
