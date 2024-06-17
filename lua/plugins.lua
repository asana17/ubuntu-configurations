local plugins = {
  { "marko-cerovac/material.nvim" }, -- colorscheme theme
  { "nvim-lua/plenary.nvim" }, -- common util
  { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true }}, -- status line
  { "MattesGroeger/vim-bookmarks"}, -- mark as bookmark

  -- search
  { "haya14busa/vim-asterisk" }, -- improve * search
  { 'kevinhwang91/nvim-hlslens' }, -- show search info
  { "petertriho/nvim-scrollbar",
    dependencies = {
      "kevinhwang91/nvim-hlslens",
      "lewis6991/gitsigns.nvim",
    }
  },

  -- telescope
  { "nvim-telescope/telescope.nvim", version = "0.1.2" },

  -- text editing
  { "rhysd/accelerated-jk" }, -- faster j/k scroll
  { "tpope/vim-surround" }, -- edit brackets
  { "windwp/nvim-autopairs" }, -- complete brackets automatically
  { "preservim/nerdcommenter" }, -- comment functions
  { "terryma/vim-expand-region" }, -- expand visual selection by +/-
  { "tversteeg/registers.nvim" }, -- show register popup window
  { "kevinhwang91/nvim-bqf"}, -- add preview window for quickfix
  { "bkad/CamelCaseMotion" }, -- move, delete by CamelCase
  { "godlygeek/tabular" }, -- align with :Tab
  { "lambdalisue/suda.vim" }, -- text edit with sudo
  { "junegunn/vim-easy-align" }, -- align with :EasyAlign
  { "mtdl9/vim-log-highlighting" }, -- coloring log
  { "nicwest/vim-camelsnek" }, -- convert between CamelCase and snake_case

  -- text view
  { "lukas-reineke/indent-blankline.nvim" }, -- show indent line
  { "lambdalisue/readablefold.vim" }, -- show fold preview text
  { "t9md/vim-quickhl" }, -- highlight words under cursor, etc
  { "unblevable/quick-scope" }, -- highlight unique character in line

  -- git
  --{ "airblade/vim-gitgutter" }, -- show git status in LineNr
  { "tpope/vim-fugitive" }, -- run git comannd on vim command
  { "lewis6991/gitsigns.nvim" }, -- show git status
  { "ruanyl/vim-gh-line" }, -- go to github page
  { "rhysd/committia.vim" }, -- improve git editor window

  -- fern file tree viewer
  { "lambdalisue/fern.vim",
    dependencies = {
      "lambdalisue/fern-hijack.vim", -- override default vim editor
      "lambdalisue/fern-git-status.vim", -- show git change status
      "LumaKernel/fern-mapping-fzf.vim", -- use fzf in fern
    }
  },

  -- syntax
  { "preservim/tagbar" }, -- open code objects list window
  { "LeafCage/vimhelpgenerator" }, -- syntax highlight logs
  { "rhysd/vim-grammarous" }, -- grammar check: to fix bug temporaliy, need to delete vim-grammarous/autoload/grammarous.vim L698: "call grammarous#info_win#close()

  -- completion
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/vim-vsnip" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-cmdline"},
  { "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "honza/vim-snippets",
    }
  },
  { "petertriho/cmp-git", dependencies = "nvim-lua/plenary.nvim" },

  -- lsp
  { "neovim/nvim-lspconfig" }, -- official configuration
  { "williamboman/mason.nvim", build = ":MasonUpdate" }, -- lsp server install helper
  { "williamboman/mason-lspconfig.nvim"}, -- package support above
  { "jose-elias-alvarez/null-ls.nvim",  dependencies = "nvim-lua/plenary.nvim"}, -- formatter and linter
  { "folke/neodev.nvim" }, -- neovim setup for luaAPI
  { "folke/trouble.nvim", dependencies = "nvim-tree/nvim-web-devicons" },

  -- treesitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-refactor",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/nvim-treesitter-context",
      "yioneko/nvim-yati",
    }, -- syntax tree analyzer
  },
  { "m-demare/hlargs.nvim" }, -- highlight arguments of function

  -- github copilot
  { "github/copilot.vim" },

  -- runner
  { "michaelb/sniprun", build = "bash ./install.sh" }, -- run visual snipped code

  -- open browser
  { "tyru/open-browser.vim" },
  { "tyru/open-browser-github.vim", dependencies = "tyru/open-browser.vim"},

  -- rust
  { "rust-lang/rust.vim" },
  { "simrat39/rust-tools.nvim" },

  -- markdown
  { "preservim/vim-markdown" }, -- markdown syntax highlightning and extensions
  { "mattn/vim-maketable" }, -- make table easily
  { "previm/previm" }, -- preview markdown on browser with Ctrl-P

  -- latex
  { "vim-latex/vim-latex", version = "*" },

  -- others
  {"norcalli/nvim-colorizer.lua"}, -- highlight rgb colors
}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(plugins,opts)
