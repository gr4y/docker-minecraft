# Minecraft 16w42a

FROM gr4y/docker-java8

MAINTAINER Sascha Wessel <swessel@gr4yweb.de>

# Update System
RUN apt-get -y update && apt-get -y upgrade

# Download Minecraft Server
RUN wget -q https://s3.amazonaws.com/Minecraft.Download/versions/16w42a/minecraft_server.16w42a.jar

# Accept Mojang EULA
RUN echo eula=true > eula.txt

WORKDIR /data
VOLUME /data

EXPOSE 25565

# Run minecraft.service
CMD java -Xmx2048M -jar /minecraft_server.16w42a.jar nogui
