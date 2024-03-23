#!/bin/sh
trap "exit 0" SIGQUIT
trap "echo '\nMESSAGE'; sleep 1" SIGINT

while true
do
clear
date "+HORLOGE : %H:%M:%S"
sleep 1
done
