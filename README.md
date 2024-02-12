# ubuntu-configurations
My ubuntu configuration files for zsh, vim, and so on.

Read [ubuntu_setup.md](./ubuntu_setup.md) for more info.

# Auto install

You can automatically install all settings with [./scripts/ubuntu_setup.sh](./scripts/ubuntu_setup.sh).

```
./scripts/ubuntu_setup.sh
```

If you want to install nerd-fonts automatically, add `--nerd-fonts` option.

```
./scripts/ubuntu_setup.sh --nerd-fonts
```

This adds long configuring time because all of the fonts are downloaded by this option.


## Test for auto install
This script is tested in `ubuntu:20.04` docker container. [./dockerfiles/test.Dockerfile](./dockerfiles/test.Dockerfile).

```
docker build -t vanilla_ubuntu ./scripts -f ./dockerfiles/test.Dockerfile --no-cache # specify folder of ubuntu_setup.sh
docker run -it --net host -e DISPLAY=$DISPLAY -v $HOME/.Xauthority:/root/.Xauthority --name van vanilla_ubuntu:latest env TERM=xterm-256color /usr/bin/bash
./ubuntu_setup.sh # in docker container
```

**Use pre-configured container in [Create Docker container](#create-docker-container) for normal usage.**

## TODO
- Install ctags automatically

<a id="create-docker-container"></a>
# Create Docker container

[./dockerfiles/Dockerfile](./dockerfiles/Dockerfile) can be used to create docker image with these configs.

This Dockerfile is based on `ubuntu:20.04.`

```
docker build -t <image_name> . -f dockerfiles/Dockerfile
docker run -it --net host -e DISPLAY=$DISPLAY -v $HOME/.Xauthority:/root/.Xauthority --name <container_name> <image_name>:latest env TERM=xterm-256color /usr/bin/zsh
```

After exit:
```
docker restart <container_name>
docker exec -it <container_name> /usr/bin/zsh
docker stop <container_name> # when work finished
```
