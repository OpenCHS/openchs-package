#!/bin/bash

OPENCHS_DB_SERVER=localhost #default for manual/non ansible RPM installs

. /etc/openchs/openchs.conf

#create openchs user and group if doesn't exist
USERID=openchs
GROUPID=openchs
/bin/id -g $GROUPID 2>/dev/null
[ $? -eq 1 ]
groupadd openchs

/bin/id $USERID 2>/dev/null
[ $? -eq 1 ]
useradd -g openchs openchs

#create links
ln -s /opt/openchs/etc /etc/openchs
ln -s /opt/openchs/bin/openchs /etc/init.d/openchs
ln -s /opt/openchs/run /var/run/openchs
ln -s /opt/openchs/openchs /var/run/openchs/openchs
ln -s /opt/openchs/log /var/log/openchs

setupConfFiles() {
    	rm -f /etc/httpd/conf.d/opnechs_ssl.conf
    	cp -f /opt/openchs/etc/openchs_ssl.conf /etc/httpd/conf.d/openchs_ssl.conf
}
#setupConfFiles

#create a database if it doesn't exist and if it is not passive machine.
if [ "${IS_PASSIVE:-0}" -ne "1" ]; then
    RESULT_USER=`psql -U postgres -h$OPENCHS_DB_SERVER -tAc "SELECT count(*) FROM pg_roles WHERE rolname='openchs'"`
    RESULT_DB=`psql -U postgres -h$OPENCHS_DB_SERVER -tAc "SELECT count(*) from pg_catalog.pg_database where datname='openchs'"`
    if [ "$RESULT_USER" == "0" ]; then
        echo "creating postgres user - openchs with roles CREATEDB,NOCREATEROLE,SUPERUSER,REPLICATION"
        createuser -Upostgres  -h$OPENCHS_DB_SERVER -d -R -s --replication openchs;
    fi

    if [ "$RESULT_DB" == "0" ]; then
        if [ "${IMPLEMENTATION_NAME:-default}" = "default" ]; then
            createdb -Upostgres -h$OPENCHS_DB_SERVER openchs;
            #psql -Uopenchs -h$OPENCHS_DB_SERVER openchs < /opt/openchs/db-dump/openchs_demo_dump.sql
        else
            (cd /opt/openchs/migrations && scripts/initDB.sh openchs-base.dump)
        fi
    fi
fi

chkconfig openchs on

# permissions
chown -R openchs:openchs /opt/openchs
chown -R openchs:openchs /var/log/openchs
chown -R openchs:openchs /var/run/openchs
chown -R openchs:openchs /etc/init.d/openchs
chown -R openchs:openchs /etc/openchs

