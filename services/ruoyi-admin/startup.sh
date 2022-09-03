#!/bin/bash
server_name="tom"
# 切换到jar目录启动，目的配置外置
cd /home/ruoyi/jar
# 启动
java -jar -Duser.timezone=GMT+08 -server -XX:+HeapDumpOnOutOfMemoryError -Xms512m -Xmx512m $server_name.jar
