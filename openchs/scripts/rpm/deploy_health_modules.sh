#!/bin/sh
export HEALTH_MODULES_DIR=/opt/openchs/health_modules
export SERVER_DIR=/opt/openchs
cd $HEALTH_MODULES_DIR && nohup sh deploy.sh | tee /var/log/openchs/deploy_health_modules.log
