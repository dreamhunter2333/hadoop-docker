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

ENV HADOOP_HOME /opt/hadoop
ENV PATH /opt/hadoop/bin:$PATH

CMD [ "/usr/sbin/sshd", "-D" ]
