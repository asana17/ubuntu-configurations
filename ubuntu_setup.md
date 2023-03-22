# ubuntu setup

## apps
1. Google Chrome
1. tilix (apt)
1. zsh (apt)
1. git
1. github-cli
1. neovim (from GitHub)
1. fzf
1. bat
1. ripgrep
1. trash-cli (apt)
1. nemo

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
- Download `.zshrc` from this repo
- install `zplug` from GitHub

### neovim
#### install
- get nightly from github
- `sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim`
- install `dein` from GitHub
- download `init.vim` \& `dein.toml` from this repo
#### undo setting
- make directory `~/.config/nvim/undo`

#### lsp
you need `g++-12` for LSP in ubuntu22.04
#### tagbar
1. You need to install ctags [description](https://docs.ctags.io/en/latest/autotools.html#gnu-linux-distributions)
2. copy .ctags from this repo

### nemo
#### setting
```
xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search
gsettings set org.gnome.desktop.background show-desktop-icons false
gsettings set org.nemo.desktop show-desktop-icons true
```
### bat
```
sudo apt install bat
ln -s /usr/bin/batcat ~/.local/bin/bat
```

### ripgrep
```
sudo apt install ripgrep
```

## UI
1. gnome shell extensions
  dash to panel
2. Gnome tweaks
  change font to Mplus1
  change monospace font to Cica

## time
fix misalignment of windows time
`timedatectl set-local-rtc 1`
