FROM openjdk:11.0.3-jdk-stretch

RUN apt-get -y update && apt-get -y install gradle postgresql postgresql-client postgresql-contrib vim
RUN  /etc/init.d/postgresql start &&\
    su postgres -c "psql --command \"CREATE USER foo_usr with password '';\" " &&\
    su postgres -c "psql --command \"CREATE DATABASE foo_db with owner foo_usr;\" "
RUN mkdir work && cd work && git clone https://github.com/hibernate/hibernate-orm.git
RUN cd work/hibernate-orm && ./gradlew compile
COPY postinstall.sh /var/run



