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
RUN echo "source /usr/share/bash-completion/completions/git" >> ~/.bashrc
RUN apt-get install tig -y

# python related tools
RUN apt-get install curl -y
RUN apt-get install python2.7 -y
RUN ln -s `which python2.7` /usr/bin/python
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python get-pip.py

# for vimrc and plugins
RUN cd && git clone https://github.com/pmrhappy/vimrc.git && cp -r vimrc/. ~ && rm -rd vimrc
RUN ~/scripts/install_dep_tools

