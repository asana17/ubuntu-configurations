local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',
--   command_mode = 'c',


-- Do not yank with x
keymap("n", "x", '"_x', opts)

-- exit insert mode with jj
keymap("i", "jj", "<Esc>", opts)

-- remove highlight with esc esc
keymap("n", "<Esc><Esc>", ":<C-u>set nohlsearch<Return>", opts)

-- automatically insert space after commas
keymap("i", ",", ",<Space>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- exit terminal insert mode with esc
keymap("t", "<Esc>", "<C-\\><c-n>", {silent = true})
