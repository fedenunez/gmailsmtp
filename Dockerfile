FROM ubuntu:22.04 as gmailsmtp
MAINTAINER Federico Nuñez "fedenunez+dockerhub@gmail.com"
# Based/Inspired on: https://github.com/Softinnov/gmailsmtp

# Set the env variable DEBIAN_FRONTEND to noninteractive
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y postfix

COPY entrypoint.sh /

# Force google domains 
RUN echo 'nameserver 8.8.8.8' >> /var/spool/postfix/etc/resolv.conf

RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
