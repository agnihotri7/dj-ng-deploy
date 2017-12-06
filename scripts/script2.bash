#!/bin/bash
echo "Reading configurations ..."
source ./config/server.conf

PROJ_ROOT="/home/$USERNAME/$PROJECT_NAME.com"
PROJ_DIR="/home/$USERNAME/$PROJECT_NAME.com/$USERNAME"

cd $PROJ_DIR
echo "creating virtualenv with python 3.5 inside env dir and installing requirements..."
virtualenv -p /usr/bin/python3.5 env
source env/bin/activate
pip install -r requirements.txt
pip install gunicorn

echo "applying migrations ..."
python manage.py migrate

echo "creating super user ..."
python manage.py createsuperuser

echo "using collectstatic ..."
python manage.py collectstatic
echo "Now switch to root and run script3 ..."
