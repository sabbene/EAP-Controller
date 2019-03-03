# Builds a docker image for TP-Link´s  EAP Controller
From debian:stable-slim
#From openjdk:latest
MAINTAINER sabbene@0hy.es

###############################################
##                UPDATE                     ##
###############################################

RUN apt-get update && apt-get install -y locales apt-utils && apt-get upgrade -y && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8


###############################################
##           ENVIRONMENTAL CONFIG            ##
###############################################
# Set correct environment variables
ENV DEBIAN_FRONTEND noninteractive


###############################################
##   INTALL ENVIORMENT, INSTALL OPENVPN      ##
###############################################
COPY install.sh /tmp/
RUN chmod +x /tmp/install.sh && sleep 1 && /tmp/install.sh && rm /tmp/install.sh


###############################################
##             PORTS AND VOLUMES             ##
###############################################

COPY start.sh /tmp/
RUN chmod +x /tmp/start.sh
CMD /tmp/start.sh

#expose 8088/tcp
VOLUME /config
