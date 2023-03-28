-- automatically install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end


-- reload nvim when plugin list updated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

require("packer").startup(function()
  use { "wbthomason/packer.nvim" } -- manage plugins
  use { "marko-cerovac/material.nvim" } -- colorscheme theme
  use { "nvim-lua/plenary.nvim" } -- common util
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } } -- status line

  -- search
  use { "junegunn/fzf", run = "bash ./install --all" }
  use { "junegunn/fzf.vim"}
  use { "haya14busa/vim-asterisk" } -- improve * search
  use {'kevinhwang91/nvim-hlslens'} -- show search info

  -- text editing
  use { "rhysd/accelerated-jk" } -- faster j/k scroll
  use { "tpope/vim-surround" } -- edit brackets
  use { "windwp/nvim-autopairs" } -- complete brackets automatically
  use { "preservim/nerdcommenter" } -- comment functions
  use { "terryma/vim-expand-region" } -- expand visual selection by +/-
  use { "tversteeg/registers.nvim" } -- show register popup window
  use { "kevinhwang91/nvim-bqf"} -- add preview window for quickfix
  use { "bkad/CamelCaseMotion" } -- move, delete by CamelCase
  use { "godlygeek/tabular" } -- align with :Tab

  -- text view
  use { "lukas-reineke/indent-blankline.nvim" } -- show indent line
  use { "lambdalisue/readablefold.vim" } -- show fold preview text
  use { "t9md/vim-quickhl" } -- highlight words under cursor, etc
  use { "unblevable/quick-scope" } -- highlight unique character in line

  -- git
  use { "airblade/vim-gitgutter" } -- show git status in LineNr
  use { "tpope/vim-fugitive" } -- run git comannd on vim command
  use { "rhysd/committia.vim" } -- improve git editor window

  -- fern file tree viewer
  use { "lambdalisue/fern.vim" }
  use { "lambdalisue/fern-hijack.vim" } -- override default vim editor
  use { "LumaKernel/fern-mapping-fzf.vim" } -- use fzf in fern

  -- syntax
  use { "preservim/tagbar" } -- open code objects list window
  use { "LeafCage/vimhelpgenerator" } -- syntax highlight logs
  use { "rhysd/vim-grammarous" } -- grammar check: to fix bug temporaliy, need to delete vim-grammarous/autoload/grammarous.vim L698: "call grammarous#info_win#close()


  -- treesitter
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" } -- syntax tree analyzer
  use { "nvim-treesitter/playground" } -- common functions
  use { "yioneko/nvim-yati",  tag = "*" } -- indent
  use { "m-demare/hlargs.nvim" } -- highlight arguments of function

  -- runner
  use { "michaelb/sniprun", run = "bash ./install.sh" } -- run visual snipped code

  -- open browser
  use { "tyru/open-browser.vim" }
  use { "tyru/open-browser-github.vim" }

  -- rust
  use { "rust-lang/rust.vim" }

  -- markdown
  use { "preservim/vim-markdown" } -- markdown syntax highlightning and extensions
  use { "mattn/vim-maketable" } -- make table easily
  use { "previm/previm" } -- preview markdown on browser with Ctrl-P

  -- latex
  use { "vim-latex/vim-latex", tag = "*" }

  -- binary editor
  use { "vim-denops/denops.vim" } -- common functions
  use { "Shougo/ddx.vim" } -- binary editor

  -- others
  use {"norcalli/nvim-colorizer.lua"} -- highlight rgb colors


  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

