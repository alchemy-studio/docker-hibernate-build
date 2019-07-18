#!/bin/sh
#rm -rf /data/hibernate
#mkdir -p /data/hibernate
#ln -s /work/hibernate-orm /data/hibernate
su - postgres -c "/usr/lib/postgresql/9.6/bin/postgres -D /var/lib/postgresql/9.6/main -c config_file=/etc/postgresql/9.6/main/postgresql.conf"
