# hadoop docker 环境配置

使用 docker 搭建 hadoop 环境

## conf

`etc/hadoop` 下的一些配置文件

conf
├── core-site.xml
├── hadoop-env.sh
├── hdfs-site.xml
├── mapred-site.xml
├── workers
└── yarn-site.xml

## sbin

`sbin` 下的一些脚本

sbin
├── start-dfs.sh
├── start-yarn.sh
├── stop-dfs.sh
└── stop-yarn.sh

## ssh 登录的 key

`ssh` 免密登录

ssh
├── authorized_keys
├── id_rsa
└── id_rsa.pub

## hadoop

hadoop release 文件
