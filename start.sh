#!/bin/sh
if [ ! -d "/opt/hadoopdata/tmp" ];then
    hdfs namenode -format
fi
while(true)
do
    pid=`ps -ef|grep "sshd"|grep -v "grep" | awk '{print $2}'`
if [ "${pid}" = "" ]
then
    /usr/sbin/sshd -D &
fi
    pid=`ps -ef|grep "secondarynamenode"|grep -v "grep" | awk '{print $2}'`
    pid2=`ps -ef|grep "nodemanager"|grep -v "grep" | awk '{print $2}'`
if [ "${pid}" = "" ] || [ "${pid2}" = "" ]
then
    /opt/hadoop/sbin/stop-all.sh
    /opt/hadoop/sbin/start-dfs.sh
    /opt/hadoop/sbin/start-yarn.sh
    echo "hadoop start end"
fi
sleep 10
done
