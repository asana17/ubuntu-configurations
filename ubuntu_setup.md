# ubuntu setup

## apps
1. google chrome
1. tilix (apt)
1. zsh (apt)
1. git
1. neovim (from github)
1. fzf
1. trash-cli (apt)
1. nemo
1. ccat

## terminal
### tilix
#### tilix settings
- Appearance
  - Window style : disable CSD
  - Terminal title style : none
  - Theme variant : dark
  - Check 'use a wide handle for splitters'
  - remove check 'show the terminal title even if it's the only terminal'
- Quake
  - Height percent : 90
  - change height percent to 100% `gsettings set com.gexperts.Tilix.Settings quake-height-percent 100`

- Profiles
  - Command: run as a login shell  
          run a custom command 'zsh'
  - Color: scheme 'Monokai Dark'  
          add transparency
#### others
- add custom keyboard shortcuts to ubuntu
- add extra space to terminal : edit `~/.config/gtk-3.0/gtk.css`

    ```
    VteTerminal,
    TerminalScreen,
    vte-terminal {
      padding: 40px 40px 40px 40px;
      -VteTerminal-inner-border: 20px 20px 20px 20px;
    }
    ```

### zsh
#### install
- run `$chsh -s $(which zsh)` and change login shell to zsh
#### settings
- Download `.zshrc` from my github repo
- install `zplug` from github

### neovim
#### install
- `sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim`
- install `dein` from github
- download `init.vim` \& `dein.toml` from my github repo

#### nemo
#### setting
```
xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search
gsettings set org.gnome.desktop.background show-desktop-icons false
gsettings set org.nemo.desktop show-desktop-icons true
```
#### ccat
```
wget https://github.com/jingweno/ccat/releases/download/v1.1.0/linux-amd64-1.1.0.tar.gz
tar xfz linux-amd64-1.1.0.tar.gz
sudo cp linux-amd64-1.1.0/ccat /usr/local/bin
sudo chmod +x /usr/local/bin/ccat
```


## UI
1. gnome shell extensions
  dash to panel
2. gnome tweaks
  change font to Mplus1
  change monospace font to Cica

## time
fix misalignment of windows time
`timedatectl set-local-rtc 1`
