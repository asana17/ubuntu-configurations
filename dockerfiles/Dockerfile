FROM ubuntu:20.04
ARG USER="ubuntu"
ARG UID="1000"
ARG GROUP="ubuntu"
ARG GID="1000"
ARG DOCKER_CONTAINER_NAME="ubuntu:20.04"

RUN useradd -m $USER && \
    usermod -u $UID $USER && \
    groupmod -g $GID $GROUP

ENV TZ=Asia/Tokyo
RUN apt-get update && \
    apt-get update && \
    apt-get install -y curl git ripgrep tar unzip wget sudo trash-cli\
    build-essential clang tmux zsh bat xsel python3-venv fd-find && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata && \
    ln -s /usr/bin/batcat /usr/bin/bat && \
    ln  -s $(which fdfind) /usr/bin/fd && \
    chsh -s /usr/bin/zsh $USER

ARG USER_HOME="/home/$USER"
RUN mkdir -p $USER_HOME && \
    chown -R $UID:$GID $USER_HOME && \
    echo "$USER ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers

# Install nvim
RUN wget https://github.com/neovim/neovim/releases/download/v0.10.0/nvim-linux64.tar.gz && \
    tar -zxvf nvim-linux64.tar.gz && \
    mv nvim-linux64/bin/nvim usr/bin/nvim && \
    mv nvim-linux64/lib/nvim usr/lib/nvim && \
    mv nvim-linux64/share/nvim/ usr/share/nvim && \
    rm -rf nvim-linux64 && \
    rm nvim-linux64.tar.gz && \
    update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 100 && \
    update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 100 && \
    update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 100

RUN apt-get install -y locales && \
    locale-gen ja_JP.UTF-8

ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8

# Install Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - &&\
    apt-get install -y nodejs

# Install ctags
RUN  apt-get install -y \
    gcc make \
    pkg-config autoconf automake \
    python3-docutils \
    libseccomp-dev \
    libjansson-dev \
    libyaml-dev \
    libxml2-dev &&\
    git clone https://github.com/universal-ctags/ctags.git && \
    cd ctags && \
    ./autogen.sh && \
    ./configure --prefix=/usr/local && \
    make && \
    make install && \
    cd .. && \
    rm -rf ctags

USER $USER

ENV HOME $USER_HOME

WORKDIR $HOME

# Setup environment
RUN git clone https://github.com/asana17/ubuntu-configurations.git && \
    mkdir -p ~/.config/nvim && \
    cp ~/ubuntu-configurations/.zshrc ~/.zshrc && \
    cp ~/ubuntu-configurations/.tmux.conf ~/.tmux.conf && \
    cp ~/ubuntu-configurations/.p10k.zsh ~/.p10k.zsh && \
    cp ~/ubuntu-configurations/init.lua ~/.config/nvim/ && \
    cp -r ~/ubuntu-configurations/lua ~/.config/nvim/ && \
    cp -r ~/ubuntu-configurations/plugin ~/.config/nvim/ && \
    sed -i \
    "0,/typeset -g POWERLEVEL9K_CONTEXT_{DEFAULT,SUDO}_{CONTENT,VISUAL_IDENTIFIER}_EXPANSION/s//  # &/" \
    ~/.p10k.zsh && \
    sed -i \
    "0,/POWERLEVEL9K_CONTEXT_PREFIX.*/s//&\n  typeset -g POWERLEVEL9K_CONTEXT_SUFFIX=':🐳 ${DOCKER_CONTAINER_NAME}'/" \
    ~/.p10k.zsh && \
    rm -rf ~/ubuntu-configurations

RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && \
    echo y y y | ~/.fzf/install

RUN ["/usr/bin/zsh", "-c", "export TERM=xterm-256color; source ~/.zshrc; vim +:MasonUpdate +:qall"]
