# ubuntu-configurations
My ubuntu configuration files for zsh, vim, and so on.

Read [ubuntu_setup.md](./ubuntu_setup.md) for more info.

# Docker setup

[Dockerfile](./Dockerfile) can be used to create docker image with these configs.

This Dockerfile is based on ubuntu:20.04.

```
docker build -t <image_name> .
docker run -it --net host -e DISPLAY=$DISPLAY -v $HOME/.Xauthority:/root/.Xauthority --name <container_name> <image_name>:latest env TERM=xterm-256color /usr/bin/zsh
```
