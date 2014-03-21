#
# A Dockerfile to create an Oracle JDK8 container.
# Copyright(c) 2014 Joshua Goldie
# Provided under MIT license (http://opensource.org/licenses/MIT)
#  
FROM ubuntu:13.04

#
# Add packages/install java-8-oracle
#
RUN echo "deb http://archive.ubuntu.com/ubuntu raring universe" >> /etc/apt/sources.list
RUN apt-get install -y python-software-properties software-properties-common sudo
RUN add-apt-repository -y ppa:webupd8team/java 
RUN apt-get update -y 
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get install -y oracle-java8-installer 
RUN apt-get -y clean 
RUN update-java-alternatives -s java-8-oracle 
RUN echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> ~/.bashrc 
RUN echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> /etc/environment

