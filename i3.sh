#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source ${SCRIPT_DIR}/utils.sh

FAILED_PKGS=()

pkg_install i3 i3lock i3blocks fcitx fcitx-mozc feh scrot arandr wmctrl xdotool

mkdir -p ${HOME}/.config/i3
cp ${SCRIPT_DIR}/i3/* ${HOME}/.config/i3/

echo "export DefaultImModule=fcitx" >> ${HOME}/.profile
echo "export GTK_IM_MODULE=fcitx" >> ${HOME}/.profile
echo "export QT_IM_MODULE=fcitx" >> ${HOME}/.profile
echo "export XMODIFIERS=\"@im=fcitx\"" >> ${HOME}/.profile
