#!/bin/bash

printf "\nCreating .env file from sample.env."

cd .. && cp sample.env .env

if [ "$?" = "0" ]; then
  printf "\n.env file created. Addind HOSTNAME, UID and GID from current user to .env file."
else
  printf "\nCannot create .env file!\n" 1>&2
  exit 1
fi

HOSTNAME=$(hostname)
echo "\n# Autogenerated local variables" >> .env
echo "HOSTNAME=$HOSTNAME" >> .env

if [ "$?" = "0" ]; then
  printf "\nHOSTNAME $HOSTNAME written into .env file."
else
  printf "\nCannot write info .env file\n" 1>&2
  exit 1
fi

USERID=$(id -u)
echo "USERID=$USERID" >> .env

if [ "$?" = "0" ]; then
  printf "\nUSERID $USERID written into .env file."
else
  printf "\nCannot write info .env file\n" 1>&2
  exit 1
fi

GROUPID=$(id -g)
echo "GROUPID=$GROUPID" >> .env

if [ "$?" = "0" ]; then
  printf "\nGROUPID $GROUPID written into .env file."
else
  printf "\nCannot write info .env file\n" 1>&2
  exit 1
fi

printf "\n"
