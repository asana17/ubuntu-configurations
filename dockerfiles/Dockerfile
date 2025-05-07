FROM ubuntu:22.04
ARG USER="ubuntu"
ARG UID="1000"
ARG GROUP="ubuntu"
ARG GID="1000"
ARG DOCKER_CONTAINER_NAME="ubuntu:22.04"


RUN useradd -m $USER && \
    usermod -u $UID $USER && \
    groupmod -g $GID $GROUP

RUN apt-get update && \
    apt-get install -y sudo locales && \
    locale-gen ja_JP.UTF-8

ENV LANG=ja_JP.UTF-8
ENV LANGUAGE=ja_JP:ja
ENV LC_ALL=ja_JP.UTF-8
ENV TZ=Asia/Tokyo

ARG USER_HOME="/home/$USER"
RUN mkdir -p $USER_HOME && \
    chown -R $UID:$GID $USER_HOME && \
    echo "$USER ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers

USER $USER
ENV HOME=$USER_HOME

WORKDIR $HOME

RUN sudo apt-get install -y git
RUN git clone https://www.github.com/asana17/ubuntu-configurations.git

RUN ubuntu-configurations/ubuntu_configuration.sh

RUN sed -i \
    "0,/typeset -g POWERLEVEL9K_CONTEXT_{DEFAULT,SUDO}_{CONTENT,VISUAL_IDENTIFIER}_EXPANSION/s//  # &/" \
    ~/.p10k.zsh && \
    sed -i \
    "0,/POWERLEVEL9K_CONTEXT_PREFIX.*/s//&\n  typeset -g POWERLEVEL9K_CONTEXT_SUFFIX=':🐳 ${DOCKER_CONTAINER_NAME}'/" \
    ~/.p10k.zsh
