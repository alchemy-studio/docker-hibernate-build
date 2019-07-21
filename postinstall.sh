#!/bin/sh
set -x

/usr/sbin/sshd
su - postgres -c "/usr/lib/postgresql/9.6/bin/postgres -D /var/lib/postgresql/9.6/main -c config_file=/etc/postgresql/9.6/main/postgresql.conf"
