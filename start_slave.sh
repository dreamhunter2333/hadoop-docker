#!/bin/sh
while(true)
do
    pid=`ps -ef|grep "sshd"|grep -v "grep" | awk '{print $2}'`
if [ "${pid}" = "" ]
then
    /usr/sbin/sshd -D &
fi
sleep 10
done
