vim.api.nvim_set_keymap(
        'n', '<c-P>',
        "<cmd>lua require('fzf-lua').grep_project()<CR>",
        { noremap = true, silent = true }
)


vim.api.nvim_set_keymap(
        'n', '<c-U>',
        "<cmd>lua require('fzf-lua').grep_project()<CR>",
        { noremap = true, silent = true}
)


