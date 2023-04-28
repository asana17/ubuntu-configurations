vim.cmd [[
  autocmd BufRead,BufNewFile *.md  set filetype=markdown
  nnoremap <silent> <C-p> :PrevimOpen<CR>
  let g:vim_markdown_folding_disabled=1
  let g:previm_enable_realtime=1
]]
