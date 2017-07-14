#!/bin/sh
nohup java $SERVER_OPTS $DEBUG_OPTS -jar /opt/openchs/lib/openchs-server-0.1-SNAPSHOT.jar > log/openchs-server.log 2>&1 &
echo $! > /var/run/openchs/openchs.pid
