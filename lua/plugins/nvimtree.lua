local status_ok, tree = pcall(require, "nvim-tree")
if not status_ok then return end

tree.setup{
        view = {
        adaptive_size = false,
        centralize_selection = false,
        width = 20,
        height = 30,
        hide_root_folder = false,
        side = "left",
        preserve_window_proportions = false,
        number = false,
        relativenumber = false,
        signcolumn = "yes",
        mappings = {
                custom_only = false,
                list = {
                -- user mappings go here
                },
        },
    }
}

vim.api.nvim_set_keymap('n', '<C-b>', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
vim.cmd [[
  augroup AutoClose
    autocmd!
    autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
  augroup end
]]
