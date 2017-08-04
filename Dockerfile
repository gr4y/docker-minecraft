# Minecraft 1.12

FROM gr4y/docker-java8

MAINTAINER Sascha Wessel <swessel@gr4yweb.de>

# Update System
RUN apt-get -y update && apt-get -y upgrade

ENV MC_VERSION 1.12.1
ENV SHA 2ce9731e5bafdf69014e4e6db1cc56149958c5a8

# Download Minecraft Server
RUN wget -q https://launcher.mojang.com/mc/game/$MC_VERSION/server/$SHA/server.jar

# Accept Mojang EULA
RUN echo eula=true > eula.txt

WORKDIR /data
VOLUME /data

EXPOSE 25565

# Run minecraft.service
CMD java -Xmx2048M -jar /server.jar nogui
