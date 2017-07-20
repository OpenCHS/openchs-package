#!/bin/sh
export HEALTH_MODULES_DIR=/opt/openchs/health_modules
export SERVER_DIR=/opt/openchs
cd $HEALTH_MODULES_DIR && nohup sh deploy.sh > /var/log/openchs/deploy_health_modules.log 2>&1 &
