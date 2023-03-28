-- fern
vim.cmd [[
  let g:fern#default_hidden=1
  command! -nargs=* E e.
]]

-- fern-mapping-fzf
vim.cmd[[
 nmap <C-t> <Plug>(fern-action-fzf-files)
]]
