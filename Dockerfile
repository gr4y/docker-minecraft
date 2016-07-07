# Minecraft 1.10.2

FROM gr4y/docker-java8

MAINTAINER Sascha Wessel <swessel@gr4yweb.de>

WORKDIR /data
VOLUME /data

EXPOSE 25565

# Update System
RUN apt-get -y update && apt-get -y upgrade

# Download Minecraft Server
RUN wget -q https://s3.amazonaws.com/Minecraft.Download/versions/1.10.2/minecraft_server.1.10.2.jar
	
# Accept Mojang EULA
RUN echo eula=true > eula.txt

# Run minecraft.service
CMD java -Xmx2048M -jar /minecraft_server.1.10.2.jar nogui