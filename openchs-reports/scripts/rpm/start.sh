#!/bin/sh
cd /opt/openchs-reports && nohup java  -jar /opt/openchs-reports/lib/metabase.jar >> /var/log/openchs-reports/openchs-reports.log 2>&1 &
echo $! > /var/run/openchs-reports/openchs-reports.pid
