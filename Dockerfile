FROM openjdk:11.0.3-jdk-stretch

RUN apt-get -y update && apt-get -y install gradle postgresql
RUN mkdir work && cd work && git clone https://github.com/hibernate/hibernate-orm.git
RUN cd work/hibernate-orm && ./gradlew assemble
