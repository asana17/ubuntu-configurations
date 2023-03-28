local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- open quickfix window
autocmd("QuickFixCmdPost", {
  pattern = "*grep*",
  command = "cwindow"
})
autocmd("FileType", {
  pattern = "qf",
  command = "wincmd J",
})

-- open terminal with ":T"
vim.cmd "command! -nargs=* T split | wincmd j | resize 15 | terminal <args>"

-- start terminal with insert mode
autocmd("TermOpen", {
  pattern = "*",
  command = "startinsert",
})

-- remove whitespace on save
autocmd("BufWritePre", {
  pattern = "*",
  command = ":%s/\\s\\+$//e",
})

-- avoid newline commented
autocmd("BufEnter", {
  pattern = "*",
  command = "set fo-=c fo-=r fo-=o",
})

-- restore cursor
autocmd({ "BufReadPost" }, {
  pattern = { "*" },
  callback = function()
    vim.api.nvim_exec('silent! normal! g`"zv', false)
  end,
})

-- attempt to determine filetypes
vim.cmd [[
  if has('filetype')
    filetype indent plugin on
  endif
]]

-- enable syntax highlights
vim.cmd [[
  if has('syntax')
    syntax on
  endif
]]

-- persisitent undo
vim.cmd [[
  if has('persistent_undo')
    let undo_path = expand('/tmp/nvim/undo')
    exe 'set undodir=' .. undo_path
    set undofile
  endif
]]
