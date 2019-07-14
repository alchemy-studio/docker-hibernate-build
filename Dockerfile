FROM openjdk:11.0.3-jdk-stretch

RUN apt-get -y update && apt-get -y install gradle postgresql
RUN mkdir work && pushd work && git clone https://github.com/hibernate/hibernate-orm.git && popd
