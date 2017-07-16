#!/bin/sh
cd /opt/openchs && nohup java $SERVER_OPTS -jar /opt/openchs/lib/openchs.jar > /var/log/openchs/openchs.log 2>&1 &
echo $! > /var/run/openchs/openchs.pid
