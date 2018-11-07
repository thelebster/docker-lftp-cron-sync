#!/bin/bash

# Stops the script, if an error occurred.
set -e

HOST=$FTP_HOST
USER=$FTP_USER
PASS=$FTP_PASS
TARGETFOLDER=$FTP_TARGET || '/'
SOURCEFOLDER=$FTP_SOURCE || '/'

lftp -e "
set ssl:verify-certificate no;
open $HOST;
user $USER $PASS;
mirror \
--delete \
--only-newer \
--verbose \
--allow-chown \
--allow-suid \
--no-umask \
--continue \
$SOURCEFOLDER $TARGETFOLDER;
bye;
"
