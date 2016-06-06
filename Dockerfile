# Pull base image
FROM ubuntu

MAINTAINER Shamal Roy <shamal.roy@gmail.com>

# Install add-apt-repository command dependency
RUN apt-get update
RUN apt-get -y install software-properties-common nano

# Install Java.
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

# Define working directory.
#WORKDIR /data

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Define default command.
CMD ["bash"]

COPY jar /var/aem

RUN java -jar -Xmx1024M /var/aem/cq-quickstart-6.1.0.jar -unpack

COPY install /var/aem/crx-quickstart/_install
COPY init.py /var/aem/crx-quickstart/init.py

WORKDIR /var/aem/crx-quickstart

EXPOSE 4502 5005 4503 5006
