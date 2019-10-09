FROM ubuntu:latest
MAINTAINER Susmit Shannigrahi <sshannigrahi@tntech.edu>
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install software-properties-common 
RUN add-apt-repository ppa:named-data/ppa
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install nfd ndn-tools repo-ng
RUN easy_install supervisor
ADD ./scripts/start.sh /start.sh
ADD ./configs/supervisord.conf /etc/supervisord.conf
RUN mkdir /var/log/supervisor/
EXPOSE 80
CMD ["/bin/bash", "/start.sh"]
