#!/bin/sh
nohup java -Xmx250m -XX:ErrorFile=/log/jvm.log -jar /opt/openchs/lib/openchs-server-0.1-SNAPSHOT.jar > log/openchs-server.log 2>&1 &
echo $! > /var/run/openchs/openchs.pid
