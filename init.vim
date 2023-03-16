" Ward off unexpected things that your distro might have made, as
" well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Set Dein base path (required)
let s:dein_base = '/home/kaightasa/.local/share/dein'

" Set Dein source path (required)
let s:dein_src = '/home/kaightasa/.local/share/dein/repos/github.com/Shougo/dein.vim'

" Set Dein runtime path (required)
execute 'set runtimepath+=' . s:dein_src

" Call Dein initialization (required)
if dein#load_state(s:dein_base)
  call dein#begin(s:dein_base)

  call dein#add(s:dein_src)
  let g:rc_dir = expand('~/.config/nvim/dein/toml')
  let s:toml = g:rc_dir . '/dein.toml'
  call dein#load_toml(s:toml, {'lazy': 0})

  " Your plugins go here:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')

  " Finish Dein initialization (required)
  call dein#end()
  call dein#save_state()
endif

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
if has('filetype')
  filetype indent plugin on
endif

" Enable syntax highlighting
if has('syntax')
  syntax on
endif

" Uncomment if you want to install not-installed plugins on startup.
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
set smartindent
set noswapfile
set title
set mouse=a
set whichwrap=b,s,h,l,<,>,[,],~
set formatoptions-=cro
set wildmenu
autocmd BufNewFile,BufRead * setlocal formatoptions-=ro
inoremap <silent> jj <ESC>

set shell=/usr/bin/zsh

set clipboard+=unnamedplus

" terminal
tnoremap <Esc> <C-\><c-n>
command! -nargs=* T split | wincmd j | resize 20 | terminal <args>
autocmd TermOpen * startinsert

" back to last cursor
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" Theme
colorscheme tender
hi Normal ctermbg=NONE ctermfg=252 guibg=#NONE guifg=#c6c8d1
hi NonText ctermbg=NONE guibg=#NONE
hi LineNr ctermbg=NONE guibg=#NONE
hi Folded ctermbg=NONE guibg=#NONE
hi EndOfBuffer ctermbg=NONE guibg=#NONE
hi VertSplit ctermbg=NONE guibg=#NONE
hi NVimInternalError ctermfg=0 guifg=White
hi Error ctermfg=255 ctermbg=125 guifg=#eeeeee guibg=#cd617e
set pumblend=10

" persisitend_undo
if has('persistent_undo')
  let undo_path = expand('~/.config/nvim/undo')
  exe 'set undodir=' .. undo_path
  set undofile
endif
