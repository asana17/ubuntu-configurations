# ubuntu20.04 setup

## apps
1. google chrome
2. tilix
3. zsh
4. git
5. neovim


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
- Profiles
  - Command: run a custom command 'zsh'
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

#### neovim
#### install
- install `dein` from github
- download `init.vim` \& `dein.toml` from my github repo

## UI
1. gnome shell extensions
  dash to panel
2. gnome tweaks
  change font to M1plus
