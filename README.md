# ubuntu-configurations
My ubuntu configuration files for zsh, vim, and so on.

Read [ubuntu_setup.md](./ubuntu_setup.md) for more info.

# Bash script for automation

You can automatically install all settings with [./scripts/ubuntu_setup.sh](./scripts/ubuntu_setup.sh).

```
./scripts/ubuntu_setup.sh
```

If you want to install nerd-fonts automatically, add `--nerd-fonts` option.

```
./scripts/ubuntu_setup.sh --nerd-fonts
```

This adds long configuring time because all of the fonts are downloaded by this option.

<a id="create-docker-container"></a>
# Create Docker container

[./dockerfiles/Dockerfile](./dockerfiles/Dockerfile) can be used to create docker image with these configs.

This Dockerfile is based on `ubuntu:20.04.`

## Use Makefile to create Docker container

To build image and run container, do:

```
cd ./dockerfiles
make
```

or

```
make OPTS=--no-cache
```

To start zsh in the container, do:

```
make docker-exec
```

To delete container, do:
```
make clean
```

To delete container and image, do:

```
make mrproper
```

## Manual build and run


To build image and run container, do:

```
docker build -t <image_name> . -f dockerfiles/Dockerfile
docker run -dit --net host -e DISPLAY=$DISPLAY -e TERM=xterm-256color -v $HOME/.Xauthority:/root/.Xauthority --name <container_name> <image_name>:latest
```

To exec zsh in the container, do:

```
docker exec -it <container_name> /usr/bin/zsh
```


# Test for automation script

**Please use pre-configured container in [Create Docker container](#create-docker-container) for normal usage.**

The automation script is tested in `ubuntu:20.04` docker container. [./dockerfiles/test.Dockerfile](./dockerfiles/test.Dockerfile).

```
docker build -t vanilla_ubuntu ./scripts -f ./dockerfiles/test.Dockerfile --no-cache # specify folder of ubuntu_setup.sh
docker run -it --net host -e DISPLAY=$DISPLAY -e TERM=xterm-256color -v $HOME/.Xauthority:/root/.Xauthority --name van vanilla_ubuntu:latest /usr/bin/bash
./ubuntu_setup.sh # in docker container
```
