#!/bin/bash

error() {
  # if two arguments
  if [ "$#" -eq 2 ]; then
    echo "Failed to install $1: $2" 1>&2
    FAILED_PKGS+=("$1")
  else
    echo "$1" 1>&2
  fi
}

check_install() {
    if [ ${#FAILED_PKGS[@]} -gt 0 ]; then
        echo "The following packages failed to install:"
        printf "%s\n" "${FAILED_PKGS[@]}"
    fi
}

pkg_install() {
    sudo apt-get install -y "$@" || FAILED_PKGS+=("$@")
}

non_interactive_pkg_install() {
    sudo DEBIAN_FRONTEND=noninteractive apt-get install -y "$@" || FAILED_PKGS+=("$@")
}

dotfiles_setup() {

  mkdir -p ${HOME}/.config/nvim && \
    cp ${HOME}/ubuntu-configurations/.zshrc ${HOME}/.zshrc && \
    cp ${HOME}/ubuntu-configurations/.tmux.conf ${HOME}/.tmux.conf && \
    cp ${HOME}/ubuntu-configurations/.p10k.zsh ${HOME}/.p10k.zsh && \
    cp ${HOME}/ubuntu-configurations/init.lua ${HOME}/.config/nvim/ && \
    cp -r ${HOME}/ubuntu-configurations/lua ${HOME}/.config/nvim/ && \
    cp -r ${HOME}/ubuntu-configurations/plugin ${HOME}/.config/nvim/
}

terminal_padding() {
  mkdir -p ${HOME}/.config/gtk-3.0
  echo \
    "VteTerminal,\n\
TerminalScreen,\n\
vte-terminal {\n\
  padding: 40px 40px 30px 30px;\n\
  -VteTerminal-inner-border: 20px 20px 20px 20px;\n\
}" \
  >> ${HOME}/.config/gtk-3.0/gtk.css
}

bat_install() {
  pkg_install bat
  sudo ln -s /usr/bin/batcat /usr/bin/bat
}

chrome_install() {
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo dpkg -i google-chrome-stable_current_amd64.deb
  sudo apt-get install -f -y
  rm google-chrome-stable_current_amd64.deb
}

fzf_install() {
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  if ! echo y y y | ~/.fzf/install; then
    error "fzf" "Failed to install fzf"
  fi
}

nemo_install() {
  non_interactive_pkg_install nemo
  if command -v nemo &> /dev/null; then
    xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search
    gsettings set org.gnome.desktop.background show-desktop-icons false
    gsettings set org.nemo.desktop show-desktop-icons true
  fi
}

neovim_install() {
    pkg_install xsel xclip

    wget https://github.com/neovim/neovim/releases/download/v0.10.0/nvim-linux64.tar.gz
    tar -zxvf nvim-linux64.tar.gz
    local nvim_bin_path="${HOME}/.local/bin/nvim"
    mkdir -p ${HOME}/.local/bin
    mkdir -p ${HOME}/.local/lib
    mkdir -p ${HOME}/.local/share
    mv nvim-linux64/bin/nvim $nvim_bin_path
    mv nvim-linux64/lib/nvim ${HOME}/.local/lib/nvim
    mv nvim-linux64/share/nvim/ ${HOME}/.local/share/nvim
    rm -rf nvim-linux64 && \
    rm nvim-linux64.tar.gz && \

    sudo update-alternatives --install /usr/bin/editor editor $nvim_bin_path 100
    sudo update-alternatives --install /usr/bin/vi vi $nvim_bin_path 100
    sudo update-alternatives --install /usr/bin/vim vim $nvim_bin_path 100

    if command -v vim &> /dev/null; then
      vim +:MasonUpdate +:qall
    else
      error "neovim" "neovim not found in ${nvim_bin_path}"
    fi
}

nerdfonts_install(){
  # install if env nerf-fonts is set
  if [ -z "$NERD_FONTS" ]; then
    return
  fi
  git clone https://github.com/ryanoasis/nerd-fonts.git
  ./nerd-fonts/install.sh
}

node_install() {
  curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
  pkg_install nodejs
}

tilix_install() {
  pkg_install tilix
  if command -v tilix &> /dev/null; then
    gsettings set com.gexperts.Tilix.Settings quake-height-percent 100
  else
    error "tilix", "Tilix is not installed"
  fi
}

zsh_install() {
  pkg_install zsh
  zsh -c "source ~/.zshrc; exit"
  sudo sed s/required/sufficient/g -i /etc/pam.d/chsh
  chsh -s $(which zsh)
  sudo sed s/sufficient/required/g -i /etc/pam.d/chsh
}

usage() {
  echo "Usage: $0 [--nerd-fonts]" 1>&2
  echo "  --nerd-fonts  Install nerd-fonts" 1>&2
}


# check longoption --nerd-fonts passed and set nerdfonts env
while [ "$#" -gt 0 ]; do
  case "$1" in
    --help)
      usage
      exit 0
      ;;
    --nerd-fonts)
      NERD_FONTS=1
      shift
      ;;
    *)
      echo "Unknown option: $1" 1>&2
      exit 1
      ;;
  esac
done

sudo apt-get update

pkg_install curl git ripgrep tar unzip wget trash-cli \
  build-essential python3-venv python3-pip clang tmux

non_interactive_pkg_install tzdata

node_install

dotfiles_setup

terminal_padding

bat_install

zsh_install

fzf_install

neovim_install

chrome_install
tilix_install
nemo_install

nerdfonts_install

check_install
