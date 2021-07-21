FROM ubuntu:20.04

ENV LANG C.UTF-8
RUN sed -i s/archive.ubuntu.com/mirrors.aliyun.com/g /etc/apt/sources.list && \
    sed -i s/security.ubuntu.com/mirrors.aliyun.com/g /etc/apt/sources.list

RUN apt-get update -y && apt-get upgrade -y
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get install sudo curl wget git nano psmisc openjdk-8-jdk -y
RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install openssh-server -y
RUN mkdir /run/sshd

RUN ssh-keygen -t rsa -f /root/.ssh/id_rsa -N ''
RUN cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/authorized_keys

ENV HADOOP_HOME /opt/hadoop
ENV PATH /opt/hadoop/bin:$PATH

ENV HDFS_DATANODE_USER=root
ENV HDFS_DATANODE_SECURE_USER=hdfs
ENV HDFS_NAMENODE_USER=root
ENV HDFS_SECONDARYNAMENODE_USER=root
ENV YARN_RESOURCEMANAGER_USER=root
ENV HDFS_DATANODE_SECURE_USER=yarn
ENV YARN_NODEMANAGER_USER=root

CMD [ "/usr/sbin/sshd", "-D" ]
