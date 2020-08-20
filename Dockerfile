# Minecraft Forge 1.14.4

FROM gr4y/docker-java8
LABEL maintainer="swessel+dockerhub@gr4yweb.de"

# Update System
RUN apt-get -y update && apt-get -y upgrade

ENV JVM_OPTS "-Xmx2048M"
ENV MC_VERSION 1.14.4
ENV FORGE_VERSION 28.2.23
ENV FORGE_PREFIX forge-${MC_VERSION}-${FORGE_VERSION}
ENV FORGE_URL https://files.minecraftforge.net/maven/net/minecraftforge/forge/${MC_VERSION}-${FORGE_VERSION}/${FORGE_PREFIX}-installer.jar
# Download Minecraft Server
RUN wget ${FORGE_URL}
RUN java ${JVM_OPTS} -jar /${FORGE_PREFIX}-installer.jar --installServer && rm -r ${FORGE_PREFIX}-installer.jar

# Accept Mojang EULA
RUN echo eula=true > eula.txt

WORKDIR /data
VOLUME /data

EXPOSE 25565 25575

# Run minecraft.service
CMD java ${JVM_OPTS} -jar /${FORGE_PREFIX}-universal.jar nogui
