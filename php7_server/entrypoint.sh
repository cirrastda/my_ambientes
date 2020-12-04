#!/bin/bash

# Removing Apache PID if necessary
rm -f /var/run/apache2/apache2.pid

service cron start
service apache2 start

#/usr/sbin/apache2ctl -D FOREGROUND

tail -f /var/log/apache2/access.log 

