local map = vim.api.nvim_set_keymap

local default_opts = { noremap = true, silent= true }
local expr_opts = { noremap = true, expr = true, silent = true }

-- Better escape using jk in insert and terminal mode
--map("i", "<M-i>", "<ESC>", default_opts)
--map("t", "<M-i>", "<C-\\><C-n>", default_opts)


map('n', '<Space>', '<NOP>', default_opts)

-- To Prove that I'm a real vimmer
map('n', '<Up>', '<Nop>', default_opts)
map('n', '<Down>', '<Nop>', default_opts)
map('n', '<Left>', '<Nop>', default_opts)
map('n', '<Right>', '<Nop>', default_opts)

-- Leader Key
vim.g.mapleader = ' '


-- Better buffer moving
map('n', '<C-h>',     '<C-w>h', {silent = true})
map('n', '<C-j>',     '<C-w>j', {silent = true})
map('n', '<C-k>',     '<C-w>k', {silent = true})
map('n', '<C-l>',     '<C-w>l', {silent = true})


-- Buffer resizing
map('n', '<M-h>',     '<cmd>vertical resize -2<CR>', {silent = true})
map('n', '<M-l>',     '<cmd>vertical resize +2<CR>', {silent = true})
map('n', '<M-j>',     '<cmd>resize +2<CR>', {silent = true})
map('n', '<M-k>',     '<cmd>resize -2<CR>', {silent = true})

-- For file searching at crtl + p

map('n', '<C-P>', "<cmd>lua require('fzf-lua').files()<CR>",
        { 
                noremap = true, silent = true 
        }
)

-- new tab remapping
map('n', '<S-t>', '<cmd>tabnew<CR>', {silent = true})


-- new mappings for code completion

