#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

error() {
  echo "$1" 1>&2
}

dotfiles_setup() {
  mkdir -p ${HOME}/.config/nvim && \
    cp ${SCRIPT_DIR}/.zshrc ${HOME}/.zshrc && \
    cp ${SCRIPT_DIR}/.tmux.conf ${HOME}/.tmux.conf && \
    cp ${SCRIPT_DIR}/.p10k.zsh ${HOME}/.p10k.zsh && \
    cp -r ${SCRIPT_DIR}/nvim ${HOME}/.config/

    local nvim_bin_path=$(which nvim)
    if [ -z "$nvim_bin_path" ]; then
        error "Neovim is not installed"
    fi
    if command -v nvim &> /dev/null; then
      nvim +:MasonUpdate +:qall
    fi

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


fzf_install() {
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  if ! echo y y y | ~/.fzf/install; then
    error "fzf" "Failed to install fzf"
  fi
}

nerdfonts_install(){
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/FiraCode.zip
  mkdir -p ~/.local/share/fonts
  unzip FiraCode.zip -d ~/.local/share/fonts
  rm FiraCode.zip
  fc-cache -fv
}

dotfiles_setup

terminal_padding
fzf_install
nerdfonts_install
