#!/bin/sh
export HEALTH_MODULES_DIR=/opt/openchs/health_modules
cd /opt/openchs/health_modules && nohup sh setup.sh > /opt/openchs/health_modules/install_health_modules.log 2>&1 &