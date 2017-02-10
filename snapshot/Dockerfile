# Minecraft snapshot

FROM gr4y/docker-java8

MAINTAINER Sascha Wessel <swessel@gr4yweb.de>

# Update System
RUN apt-get -y update && apt-get -y upgrade

ENV SHA 37441cab126ee2a4f292c9bf488c9dd800cff841
ENV MC_VERSION 17w06a

# Download Minecraft Server
RUN wget -q https://launcher.mojang.com/mc/game/$MC_VERSION/server/$SHA/server.jar

# Accept Mojang EULA
RUN echo eula=true > eula.txt

WORKDIR /data
VOLUME /data

EXPOSE 25565

# Run minecraft.service
CMD java -Xmx2048M -jar /server.jar nogui
