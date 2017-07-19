#!/bin/sh
export HEALTH_MODULES_DIR=/opt/openchs/health_modules
export IMPL_DIR=/opt/openchs/impl
cd /opt/openchs/impl && nohup sh setup.sh > /opt/openchs/impl/setup_impl.log 2>&1 &