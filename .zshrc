# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

setopt histignorealldups sharehistory

autoload -Uz colors
colors

bindkey -v '^?' backward-delete-char

export CLICOLOR=true
export LSCOLORS='exfxcxdxbxGxDxabagacad'
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'


# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit


# 補完候補を一覧で表示する
setopt auto_list

# 補完キー連打で候補順に自動で補完する
setopt auto_menu

# cd 時に自動でディレクトリスタックに追加する
setopt auto_pushd

# コマンド履歴に実行時間も記録する
#setopt extended_history

# 履歴中の重複行をすべて削除する
setopt hist_ignore_all_dups

# 直前と重複するコマンドを記録しない
setopt hist_ignore_dups

# コマンド中の余分なスペースは削除して履歴に記録する
setopt hist_reduce_blanks

# 履歴と重複するコマンドを記録しない
#setopt hist_save_no_dups

# ^D でシェルを終了しない
setopt ignore_eof

# 履歴をすぐに追加する（通常はシェル終了時）
setopt inc_append_history

# # 以降をコメントとして扱う
setopt interactive_comments

# ビープを無効にする
setopt no_beep
setopt no_hist_beep
setopt no_list_beep

# = 以降も補完する（例：--option=value）
setopt magic_equal_subst

setopt nonomatch

# バックグラウンド処理の状態変化をすぐに通知する
setopt notify

# 8bit文字を有効にする
setopt print_eight_bit

# 終了ステータスが0以外の場合にステータスを表示する
#setopt print_exit_value

# VCS情報の表示を有効にする
setopt prompt_subst

# ディレクトリスタックと重複したディレクトリをスタックに追加しない
setopt pushd_ignore_dups

# rm * の前に確認をとる
setopt rm_star_wait

# Zsh間で履歴を共有する
setopt share_history

# コマンド実行後は右プロンプトを消す
setopt transient_rprompt

#no match errorの解決
setopt +o nomatch

zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' use-cache true
zstyle ':completion:*' verbose yes
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*:options' description 'yes'
eval "$(dircolors -b)"
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'

if type trash-put &> /dev/null
  then
    alias rm=trash-put
fi

# for persistent undo
mkdir -p /tmp/nvim/undo


fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

alias ls='ls --color=auto'
function chpwd() {ls -v -F --color=auto }

alias cat='bat'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

XDG_CONFIG_HOME=.config

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

function zle-line-init zle-keymap-select {
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

export PATH="$PATH":~/.local/bin

export FZF_DEFAULT_OPTS="--multi --height=60% --select-1 --exit-0 \
  --reverse --bind ctrl-d:preview-page-down,ctrl-u:preview-page-up"

export FZF_CTRL_R_OPTS=$(cat <<"EOF"
--preview '
  echo {} \
  | awk "{ sub(/\s*[0-9]*?\s*/, \"\"); gsub(/\\\\n/, \"\\n\"); print }" \
  | bat --color=always --language=sh --style=plain
'
--preview-window 'down,40%,wrap'
EOF
)

export FZF_CTRL_T_COMMAND="rg --files --hidden --no-heading -g '!{.git,node_modules,.rustup,.cargo,.local/share/Trash}'"
export FZF_CTRL_T_OPTS=" \
--preview ' \
    bat --color=always \
      --line-range :200 {}' \
--preview-window 'down,60%,wrap,+3/2,~3'"

export FZF_ALT_C_COMMAND="find ./ -type d \( -name '.git' -o -name 'node_modules' \) -prune -o -type d"
export FZF_ALT_C_OPTS="--preview 'tree -aC -L 1 {} | head -200'"

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zdharma/fast-syntax-highlighting
zinit light romkatv/powerlevel10k
zinit light chrissicool/zsh-256color
zinit light zsh-users/zsh-history-substring-search
### End of Zinit's installer chunk

alias tl='tmux list-sessions'
alias ta="tmux attach-session -t"
function tmux-on-directory() {
  (cd $1 || exit; tmux)
}
alias td=tmux-on-directory

alias cp="cp -r"

# online-judge-tools test. To submit, use acc s
alias ojt='g++ main.cpp && oj t -N -d ./tests'

alias i3lock="i3lock -c 000000"
