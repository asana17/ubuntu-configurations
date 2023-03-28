vim.cmd [[
  function! s:find_rip_grep() abort
        call fzf#vim#grep(
                    \   'rg --ignore-file ~/.ignore --column --line-number --no-heading --hidden --smart-case .+',
                    \   1,
                    \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%', '?'),
                    \   0,
                    \ )
    endfunction
    nnoremap <silent> <Leader>g :<C-u>silent call <SID>find_rip_grep()<CR>
]]
