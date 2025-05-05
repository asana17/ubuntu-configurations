#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source ${SCRIPT_DIR}/utils.sh

FAILED_PKGS=()

bat_install() {
  pkg_install bat
  sudo ln -s /usr/bin/batcat /usr/bin/bat
}

ctag_install() {
  pkg_install gcc make pkg-config autoconf automake python3-docutils && \
    libjansson-dev libyaml-dev libxml2-dev

  git clone https://github.com/universal-ctags/ctags.git
  cd ctags
  ./autogen.sh
  ./configure --prefix=/usr/local
  make
  sudo make install
  cd ..
  rm -rf ctags
  cp ${SCRIPTDIR}/.ctags ~/.ctags
}

chrome_install() {
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo dpkg -i google-chrome-stable_current_amd64.deb
  rm google-chrome-stable_current_amd64.deb
}

fd_install() {
  pkg_install fd-find
  sudo ln -s $(which fdfind) /usr/bin/fd
}

nemo_install() {
  non_interactive_pkg_install nemo
  if command -v nemo &> /dev/null; then
    xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search
    gsettings set org.gnome.desktop.background show-desktop-icons false
    gsettings set org.nemo.desktop show-desktop-icons true
  fi
}

nvim_install() {
  local arg=$1
  pkg_install xsel xclip

  local nvim_pkg_name="nvim-linux-x86_64"
  local version="stable"
  if [ $NVIM_COMPATIBLE -eq 1 ]; then
    nvim_pkg_name="nvim-linux64"
    version="v0.10.0"
  fi
  wget https://github.com/neovim/neovim/releases/download/${version}/${nvim_pkg_name}.tar.gz
  tar -xzf ${nvim_pkg_name}.tar.gz
  local install_path="/usr/"
  nvim_bin_path="${install_path}/bin/nvim"
  sudo mv ${nvim_pkg_name}/bin/nvim $nvim_bin_path
  sudo mv ${nvim_pkg_name}/lib/nvim $install_path/lib/
  sudo mv ${nvim_pkg_name}/share/nvim $install_path/share/
  rm -rf ${nvim_pkg_name} ${nvim_pkg_name}.tar.gz

  if [ -z "$nvim_bin_path" ]; then
      error "neovim" "Neovim is not installed"
  fi

  sudo update-alternatives --install /usr/bin/editor editor $nvim_bin_path 100
  sudo update-alternatives --install /usr/bin/vi vi $nvim_bin_path 100
  sudo update-alternatives --install /usr/bin/vim vim $nvim_bin_path 100
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

EXTRA_INSTALL=0
GUI_INSTALL=0
NVIM_COMPATIBLE=0

usage() {
  echo "Usage: $0 [options]"
  echo "Options:"
  echo "  -h, --help        Show this help message"
  echo "  --extra           Install extra packages"
  echo "  --gui             Install GUI packages"
  echo "  --nvim-compatible  Install nvim compatible version"
}

if ! TEMP=$(
  getopt --options "h" \
    --longoptions "extra,help,gui,nvim-compatible" \
    -- "$@"
  ); then
  usage
  exit 1
fi

eval set -- "$TEMP"
unset TEMP

while true; do
  case "$1" in
    -h|--help)
      usage
      exit 0
      ;;
    --extra)
      EXTRA_INSTALL=1
      shift
      ;;
    --gui)
      GUI_INSTALL=1
      shift
      ;;
    --nvim-compatible)
      NVIM_COMPATIBLE=1
      shift
      ;;
    --)
      shift
      break
      ;;
    *)
      echo "Invalid option: $1"
      usage
      exit 1
      ;;
  esac
done


sudo apt-get update

pkg_install curl git ripgrep tar unzip wget trash-cli \
clangd tmux fontconfig


if [ $EXTRA_INSTALL -eq 1 ]; then
  non_interactive_pkg_install tzdata
  pkg_install build-essential clang python3-venv python3-pip
  ctag_install
fi

node_install
nvim_install
bat_install
fd_install
zsh_install

if [ $GUI_INSTALL -eq 1 ]; then
  chrome_install
  tilix_install
  nemo_install
fi

check_install
