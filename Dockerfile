# Minecraft Forge 1.12.2

FROM gr4y/docker-java8

MAINTAINER Sascha Wessel <swessel@gr4yweb.de>

# Update System
RUN apt-get -y update && apt-get -y upgrade

ENV MC_VERSION 1.14.4
ENV FORGE_VERSION 28.1.0
ENV FORGE_PREFIX forge-${MC_VERSION}-${FORGE_VERSION}
ENV FORGE_URL https://files.minecraftforge.net/maven/net/minecraftforge/forge/${MC_VERSION}-${FORGE_VERSION}/${FORGE_PREFIX}-installer.jar
# Download Minecraft Server
RUN wget ${FORGE_URL}
RUN java -Xmx2048M -jar /${FORGE_PREFIX}-installer.jar --installServer && rm -r ${FORGE_PREFIX}-installer.jar

# Accept Mojang EULA
RUN echo eula=true > eula.txt

WORKDIR /data
VOLUME /data

EXPOSE 25565

# Run minecraft.service
CMD java -Xmx4096M -jar /${FORGE_PREFIX}.jar nogui
