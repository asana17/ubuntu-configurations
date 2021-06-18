if &compatible
  set nocompatible               " Be iMproved
endif

augroup MyAutoCmd
  autocmd!
augroup END

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" Required:
set runtimepath+=/home/asana/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/asana/.cache/dein')
  call dein#begin('/home/asana/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/asana/.cache/dein/repos/github.com/Shougo/dein.vim')

  let g:rc_dir = expand('~/.config/nvim/dein/toml')
  let s:toml = g:rc_dir . '/dein.toml'
	"let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
  call dein#load_toml(s:toml, {'lazy': 0})
  "call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

set number
set autoindent
set shiftwidth=2
set splitright
set expandtab
set hls
set nowritebackup
set backspace=indent,eol,start
set incsearch
set hlsearch
set showmatch matchtime=1
set cmdheight=2
set display=lastline
set list
set tabstop=2
set smartindent
set noswapfile
set title
set mouse=a
set whichwrap=b,s,h,l,<,>,[,],~
inoremap <silent> jj <ESC>
"set termkey=<A-w>
"tnoremap jj <A-w><S-n>

augroup rememberEditPosition
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line ("'\"") <= line("$") |
        \   exe "normal! g'\"" |
        \ endif
augroup end

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

set shell=/usr/bin/zsh

set clipboard+=unnamedplus
