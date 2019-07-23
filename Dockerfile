FROM openjdk:11.0.3-jdk-stretch
RUN apt-get -y update && apt-get -y install gradle postgresql postgresql-client postgresql-contrib vim
RUN  /etc/init.d/postgresql start &&\
    su postgres -c "psql --command \"create user foo_usr with password 'foo';\" " &&\
    su postgres -c "psql --command \"create database foo_db with owner foo_usr;\" " &&\
    su postgres -c "psql --command \"alter role postgres with password 'foo';\" " &&\
    /etc/init.d/postgresql stop
RUN sed -ie "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" /etc/postgresql/9.6/main/postgresql.conf
RUN echo "host all all 0.0.0.0/0 md5" >> /etc/postgresql/9.6/main/pg_hba.conf
RUN mkdir work && cd work && git clone https://github.com/hibernate/hibernate-orm.git
RUN cd work/hibernate-orm && ./gradlew compile
COPY config.patch work/hibernate-orm/
RUN cd work/hibernate-orm && ls . && patch -p1 < config.patch
COPY postinstall.sh /var/run

# sshd
RUN apt-get -y install openssh-server telnet netcat
RUN mkdir -p /run/sshd && /usr/sbin/sshd

RUN sed -ie "s/#PermitRootLogin prohibit-password/PermitRootLogin yes/" /etc/ssh/sshd_config
RUN echo "root:foo" | chpasswd
