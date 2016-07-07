# Minecraft 1.10.2

FROM ubuntu:xenial

MAINTAINER Sascha Wessel <swessel@gr4yweb.de>

WORKDIR /data
VOLUME /data

EXPOSE 25565

# Update System
RUN apt-get -y update && apt-get -y upgrade

RUN apt-get install -y software-properties-common screen && \ 
    apt-add-repository ppa:webupd8team/java && \
    apt-get update -y && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get install -y oracle-java8-installer && \
    apt-get install -y oracle-java8-unlimited-jce-policy && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/oracle-jdk8-installer
	
# Set JAVA_HOME
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Download Minecraft Server
RUN wget -q https://s3.amazonaws.com/Minecraft.Download/versions/1.10.2/minecraft_server.1.10.2.jar
	
# Accept Mojang EULA
RUN echo eula=true > eula.txt

# Run minecraft.service
CMD /usr/bin/screen -mS minecraft /bin/java -Xmx2048M -jar minecraft_server.10.2.jar nogui