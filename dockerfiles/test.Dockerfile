FROM ubuntu:20.04
ARG USER="ubuntu"
ARG UID="1000"
ARG GROUP="ubuntu"
ARG GID="1000"
ARG DOCKER_CONTAINER_NAME="ubuntu:20.04"


RUN useradd -m $USER && \
    usermod -u $UID $USER && \
    groupmod -g $GID $GROUP

RUN apt-get update && \
    apt-get install -y sudo git

RUN apt-get install -y locales && \
    locale-gen ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ=Asia/Tokyo


ARG USER_HOME="/home/$USER"
RUN mkdir -p $USER_HOME && \
    chown -R $UID:$GID $USER_HOME && \
    echo "$USER ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers


USER $USER
ENV HOME $USER_HOME

WORKDIR $HOME
RUN git clone https://www.github.com/asana17/ubuntu-configurations.git && \
  chown +x ubuntu-configurations/scripts/ubuntu_setup.sh
