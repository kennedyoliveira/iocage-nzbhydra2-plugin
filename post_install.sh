#!/bin/sh

echo "Creating the folder structure"
mkdir -p /usr/local/nzbhydra2
mkdir -p /usr/local/nzbhydra2/data

echo "Downloading the software"
cd /usr/local/nzbhydra2
curl -L https://github.com/theotherp/nzbhydra2/releases/download/v3.14.2/nzbhydra2-3.14.2-linux.zip --silent -o ./nzbhydra2.zip
unzip nzbhydra2.zip
rm nzbhydra2.zip

echo "Adding new user"
pw useradd nzbhydra2 -u 444 -c "NZBHydra2 daemon user" -d /nonexistent -s /sbin/nologin

echo "Updating permission"
chown -R nzbhydra2:nogroup /usr/local/jdownloader

# Set the options for the daemon
sysrc nzbhydra2_enable=YES
sysrc nzbhydra2_user=nzbhydra2
sysrc nzbhydra2_dir=/usr/local/nzbhydra2

echo "Starting the service"
service nzbhydra2 start
