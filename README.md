Dj-Ng-Deploy
============

# Overview

This project is build to deploy your Django project over Ubuntu using Nginx + Gunicorn within 2 minutes.

## Clone the Source

    # Clone Dj_Init repository
    git clone https://github.com/agnihotri7/dj-ng-deploy.git dj-ng-deploy

## Configure It

    # update configurations in server.conf file
    vi server.conf

## Run Scripts

    # run script1 to create user and clone the project under user home directory
    ./script1.bash

    # run script2 to setup virtualenv with newly created user
    sudo su username
    ./script2.bash

    # run script3 to install and setup supervisor/nginx with root user
    # switch to root user (CTRL+D to come out of current user terminal)
    sudo su
    ./script3.bash

    # check your IP/Domain name in browser.
