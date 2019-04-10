FROM ubuntu:latest

COPY ./setup_env /
COPY ./install_vimrc_and_plugins /

ENV TIME_ZONE=Asia/Taipei
ENV TERM=xterm-256color
RUN ln -snf /usr/share/zoneinfo/${TIME_ZONE} /etc/localtime && echo ${TIME_ZONE} > /etc/timezone
RUN apt-get update
RUN /setup_env
RUN /install_vimrc_and_plugins

# install docker (for Docker-in-Docker usage)
RUN yes | apt-get install apt-transport-https ca-certificates software-properties-common
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN apt-key fingerprint 0EBFCD88
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
RUN yes | apt-get update
RUN yes | apt-get install docker-ce
