vim.cmd [[
  let g:vim_markdown_new_list_item_indent = 2
  let g:vim_markdown_folding_disabled = 1
  set shiftwidth=2
]]

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt.shiftwidth = 2
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
  end,
})
