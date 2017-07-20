#!/bin/sh
export HEALTH_MODULES_DIR=/opt/openchs/health_modules
export IMPL_DIR=/opt/openchs/impl
cd /opt/openchs/impl && nohup sh deploy.sh > /var/log/openchs/deploy_impl.log 2>&1 &