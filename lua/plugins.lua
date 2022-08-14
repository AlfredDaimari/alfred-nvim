local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
        packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 
                'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}


return packer.startup( 
        function (use)
                use 'wbthomason/packer.nvim'
                        -- File Tree
                use {
                'kyazdani42/nvim-tree.lua',
                        requires = {
                                'kyazdani42/nvim-web-devicons', -- optional, for file icons
                        },
                        keys = {"<C-b>"},
                        cmd = {
                                "NvimTreeToggle",
                                "NvimTreeOpen",
                                "NvimTreeClose",
                                "NvimTreeFocus",
                                "NvimTreeFindFileToggle",
                                "NvimTreeResize",
                                "NvimTreeCollapse",
                                "NvimTreeCollapseKeepBuffers",
                                "NvimTreeRefresh",
                                "NvimTreeFindFile"
                        },
                        config = function() require("plugins.nvimtree") end
                }   
                 use {
                        'nvim-lualine/lualine.nvim',
                        requires = { 
                                'kyazdani42/nvim-web-devicons', opt = true 
                        },
                        config = function() require("plugins.lualine") end
                }    

                -- TreeSitter
                use {
                        "nvim-treesitter/nvim-treesitter",
                        run = ":TSUpdate",
                        config = function() require("plugins.treesitter") end
                }

                use { 
                        'ibhagwan/fzf-lua',
                        requires = { 
                                'kyazdani42/nvim-web-devicons' 
                        },
                }

                use {
                        "folke/which-key.nvim",
                        config = function()
                        require("which-key").setup {
                                -- your configuration comes here
                                -- or leave it empty to use the default settings
                                -- refer to the configuration section below
                        } end
                }

                use "EdenEast/nightfox.nvim"

                use {
                        "lukas-reineke/indent-blankline.nvim",
                        config = function() require("plugins.blankline") end 
                }
                
                -- lsp
                use "neovim/nvim-lspconfig"

                -- cmp
                use 'hrsh7th/nvim-cmp' -- The completion plugin
                use 'hrsh7th/cmp-nvim-lsp'
                use 'hrsh7th/cmp-buffer' -- buffer completions
                use 'hrsh7th/cmp-path' -- path completions
                use 'hrsh7th/cmp-cmdline' -- cmdline completions
        end
)

