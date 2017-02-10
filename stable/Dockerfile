# Minecraft 1.11.2

FROM gr4y/docker-java8

MAINTAINER Sascha Wessel <swessel@gr4yweb.de>

# Update System
RUN apt-get -y update && apt-get -y upgrade

ENV MC_VERSION 1.11.2
ENV SHA f00c294a1576e03fddcac777c3cf4c7d404c4ba4

# Download Minecraft Server
RUN wget -q https://launcher.mojang.com/mc/game/$MC_VERSION/server/$SHA/server.jar

# Accept Mojang EULA
RUN echo eula=true > eula.txt

WORKDIR /data
VOLUME /data

EXPOSE 25565

# Run minecraft.service
CMD java -Xmx2048M -jar /server.jar nogui
