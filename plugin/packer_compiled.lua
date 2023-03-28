-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/kaightasa/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/kaightasa/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/kaightasa/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/kaightasa/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/kaightasa/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  CamelCaseMotion = {
    loaded = true,
    path = "/home/kaightasa/.local/share/nvim/site/pack/packer/start/CamelCaseMotion",
    url = "https://github.com/bkad/CamelCaseMotion"
  },
  ["accelerated-jk"] = {
    loaded = true,
    path = "/home/kaightasa/.local/share/nvim/site/pack/packer/start/accelerated-jk",
    url = "https://github.com/rhysd/accelerated-jk"
  },
  ["committia.vim"] = {
    loaded = true,
    path = "/home/kaightasa/.local/share/nvim/site/pack/packer/start/committia.vim",
    url = "https://github.com/rhysd/committia.vim"
  },
  ["ddx.vim"] = {
    loaded = true,
    path = "/home/kaightasa/.local/share/nvim/site/pack/packer/start/ddx.vim",
    url = "https://github.com/Shougo/ddx.vim"
  },
  ["denops.vim"] = {
    loaded = true,
    path = "/home/kaightasa/.local/share/nvim/site/pack/packer/start/denops.vim",
    url = "https://github.com/vim-denops/denops.vim"
  },
  ["fern-hijack.vim"] = {
    loaded = true,
    path = "/home/kaightasa/.local/share/nvim/site/pack/packer/start/fern-hijack.vim",
    url = "https://github.com/lambdalisue/fern-hijack.vim"
  },
  ["fern-mapping-fzf.vim"] = {
    loaded = true,
    path = "/home/kaightasa/.local/share/nvim/site/pack/packer/start/fern-mapping-fzf.vim",
    url = "https://github.com/LumaKernel/fern-mapping-fzf.vim"
  },
  ["fern.vim"] = {
    loaded = true,
    path = "/home/kaightasa/.local/share/nvim/site/pack/packer/start/fern.vim",
    url = "https://github.com/lambdalisue/fern.vim"
  },
  fzf = {
    loaded = true,
    path = "/home/kaightasa/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/home/kaightasa/.local/share/nvim/site/pack/packer/start/fzf.vim",
    url = "https://github.com/junegunn/fzf.vim"
  },
  ["hlargs.nvim"] = {
    loaded = true,
    path = "/home/kaightasa/.local/share/nvim/site/pack/packer/start/hlargs.nvim",
    url = "https://github.com/m-demare/hlargs.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/kaightasa/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/kaightasa/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["material.nvim"] = {
    loaded = true,
    path = "/home/kaightasa/.local/share/nvim/site/pack/packer/start/material.nvim",
    url = "https://github.com/marko-cerovac/material.nvim"
  },
  nerdcommenter = {
    loaded = true,
    path = "/home/kaightasa/.local/share/nvim/site/pack/packer/start/nerdcommenter",
    url = "https://github.com/preservim/nerdcommenter"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/kaightasa/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-bqf"] = {
    loaded = true,
    path = "/home/kaightasa/.local/share/nvim/site/pack/packer/start/nvim-bqf",
    url = "https://github.com/kevinhwang91/nvim-bqf"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/kaightasa/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-hlslens"] = {
    loaded = true,
    path = "/home/kaightasa/.local/share/nvim/site/pack/packer/start/nvim-hlslens",
    url = "https://github.com/kevinhwang91/nvim-hlslens"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/kaightasa/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/kaightasa/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["nvim-yati"] = {
    loaded = true,
    path = "/home/kaightasa/.local/share/nvim/site/pack/packer/start/nvim-yati",
    url = "https://github.com/yioneko/nvim-yati"
  },
  ["open-browser-github.vim"] = {
    loaded = true,
    path = "/home/kaightasa/.local/share/nvim/site/pack/packer/start/open-browser-github.vim",
    url = "https://github.com/tyru/open-browser-github.vim"
  },
  ["open-browser.vim"] = {
    loaded = true,
    path = "/home/kaightasa/.local/share/nvim/site/pack/packer/start/open-browser.vim",
    url = "https://github.com/tyru/open-browser.vim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/kaightasa/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/kaightasa/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/kaightasa/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  previm = {
    loaded = true,
    path = "/home/kaightasa/.local/share/nvim/site/pack/packer/start/previm",
    url = "https://github.com/previm/previm"
  },
  ["quick-scope"] = {
    loaded = true,
    path = "/home/kaightasa/.local/share/nvim/site/pack/packer/start/quick-scope",
    url = "https://github.com/unblevable/quick-scope"
  },
  ["readablefold.vim"] = {
    loaded = true,
    path = "/home/kaightasa/.local/share/nvim/site/pack/packer/start/readablefold.vim",
    url = "https://github.com/lambdalisue/readablefold.vim"
  },
  ["registers.nvim"] = {
    loaded = true,
    path = "/home/kaightasa/.local/share/nvim/site/pack/packer/start/registers.nvim",
    url = "https://github.com/tversteeg/registers.nvim"
  },
  sniprun = {
    loaded = true,
    path = "/home/kaightasa/.local/share/nvim/site/pack/packer/start/sniprun",
    url = "https://github.com/michaelb/sniprun"
  },
  tabular = {
    loaded = true,
    path = "/home/kaightasa/.local/share/nvim/site/pack/packer/start/tabular",
    url = "https://github.com/godlygeek/tabular"
  },
  tagbar = {
    loaded = true,
    path = "/home/kaightasa/.local/share/nvim/site/pack/packer/start/tagbar",
    url = "https://github.com/preservim/tagbar"
  },
  ["vim-asterisk"] = {
    loaded = true,
    path = "/home/kaightasa/.local/share/nvim/site/pack/packer/start/vim-asterisk",
    url = "https://github.com/haya14busa/vim-asterisk"
  },
  ["vim-expand-region"] = {
    loaded = true,
    path = "/home/kaightasa/.local/share/nvim/site/pack/packer/start/vim-expand-region",
    url = "https://github.com/terryma/vim-expand-region"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/kaightasa/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/home/kaightasa/.local/share/nvim/site/pack/packer/start/vim-gitgutter",
    url = "https://github.com/airblade/vim-gitgutter"
  },
  ["vim-grammarous"] = {
    loaded = true,
    path = "/home/kaightasa/.local/share/nvim/site/pack/packer/start/vim-grammarous",
    url = "https://github.com/rhysd/vim-grammarous"
  },
  ["vim-maketable"] = {
    loaded = true,
    path = "/home/kaightasa/.local/share/nvim/site/pack/packer/start/vim-maketable",
    url = "https://github.com/mattn/vim-maketable"
  },
  ["vim-markdown"] = {
    loaded = true,
    path = "/home/kaightasa/.local/share/nvim/site/pack/packer/start/vim-markdown",
    url = "https://github.com/preservim/vim-markdown"
  },
  ["vim-quickhl"] = {
    loaded = true,
    path = "/home/kaightasa/.local/share/nvim/site/pack/packer/start/vim-quickhl",
    url = "https://github.com/t9md/vim-quickhl"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/kaightasa/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  vimhelpgenerator = {
    loaded = true,
    path = "/home/kaightasa/.local/share/nvim/site/pack/packer/start/vimhelpgenerator",
    url = "https://github.com/LeafCage/vimhelpgenerator"
  }
}

time([[Defining packer_plugins]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
