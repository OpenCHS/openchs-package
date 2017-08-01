#!/bin/bash

#create openchs user and group if doesn't exist
USERID=openchs
GROUPID=openchs
id -g $GROUPID
if [ $? -eq 1 ]; then
groupadd openchs
fi

id $USERID
if [ $? -eq 1 ]; then
useradd -g openchs openchs
fi

#create links
ln -s /opt/openchs-reports/etc /etc/openchs-reports
ln -s /opt/openchs-reports/bin/openchs-reports /etc/init.d/openchs-reports
ln -s /opt/openchs-reports/run /var/run/openchs-reports
ln -s /opt/openchs-reports/log /var/log/openchs-reports

setupConfFiles() {
    	rm -f /etc/httpd/conf.d/openchs-reports_ssl.conf
    	cp -f /opt/openchs-reports/etc/openchs_reports_ssl.conf /etc/httpd/conf.d/openchs_reports_ssl.conf
}
setupConfFiles

chkconfig openchs-reports on

# permissions
chown -R openchs:openchs /opt/openchs-reports
chown -R openchs:openchs /var/log/openchs-reports
chown -R openchs:openchs /var/run/openchs-reports
chown -R openchs:openchs /etc/init.d/openchs-reports
chown -R openchs:openchs /etc/openchs-reports

