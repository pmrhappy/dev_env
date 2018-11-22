FROM ubuntu:latest

RUN apt-get update
RUN apt-get install sudo -y
RUN apt-get install vim -y 
RUN apt-get install silversearcher-ag -y
RUN apt-get install cscope -y
RUN apt-get install ssh -y

# git related tools
RUN apt-get install git -y
RUN git config --global alias.st status
RUN git config --global alias.co checkout
RUN git config --global alias.br branch
RUN git config --global rerere.enabled true
RUN git config --global push.default current
RUN echo "source /usr/share/bash-completion/completions/git" >> ~/.bashrc && \
    echo "export PATH=${PATH}:/mnt/scripts" >> ~/.bashrc
RUN apt-get install tig -y

RUN apt-get install build-essential -y
RUN apt-get install rsync -y

# python related tools
RUN apt-get install curl -y
RUN apt-get install python2.7 python-dev -y
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python get-pip.py
RUN pip install pycscope

# for vimrc and plugins
RUN cd && git clone https://github.com/pmrhappy/vimrc.git && cp -r vimrc/. ~ && rm -rd vimrc
RUN ~/scripts/install_dep_tools

# install docker (for Docker-in-Docker usage)
RUN yes | apt-get install apt-transport-https ca-certificates software-properties-common
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN apt-key fingerprint 0EBFCD88
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
RUN yes | apt-get update
RUN yes | apt-get install docker-ce
