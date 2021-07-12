#!/bin/sh
if [ ! -d "/opt/hadoopdata" ];then
    rm -rf /opt/hadoopdata
    ssh hadoop002 "rm -rf /opt/hadoopdata"
    ssh hadoop003 "rm -rf /opt/hadoopdata"
    /opt/hadoop/bin/hdfs namenode -format
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
    # ssh hadoop002 "killall java && rm -rf /tmp/hadoop*"
    /opt/hadoop/sbin/start-dfs.sh
    /opt/hadoop/sbin/start-yarn.sh
    echo "hadoop start end"
fi
sleep 10
done
