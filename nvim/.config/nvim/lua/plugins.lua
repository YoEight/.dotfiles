local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(
    function(use)
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'
        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate'
        }

        -- Companion to help writing my vim configuration scripts.
        use 'svermeulen/vimpeccable'
        use 'rafcamlet/nvim-luapad'

        use {
            'nvim-telescope/telescope.nvim',
            requires = { {'nvim-lua/plenary.nvim'} }
        }

        use 'wsdjeg/luarefvim'
        use 'euclidianAce/BetterLua.vim'
        use 'neovim/nvim-lspconfig'
        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/nvim-cmp'
        use 'L3MON4D3/LuaSnip'
        use 'saadparwaiz1/cmp_luasnip'
        use 'kyazdani42/nvim-tree.lua'
        use 'tpope/vim-commentary'
        use 'tpope/vim-fugitive'
        -- use 'mfussenegger/nvim-jdtls'

        use 'ntpeters/vim-better-whitespace'

        -- UI
        use 'kyazdani42/nvim-web-devicons'
        use 'akinsho/toggleterm.nvim'
        use 'lukas-reineke/indent-blankline.nvim'
        use 'onsails/lspkind-nvim'
        -- use 'Mofiqul/vscode.nvim'
        use 'sainnhe/gruvbox-material'
        use 'hoob3rt/lualine.nvim'

        if packer_bootstrap then
            require('packer').sync()
        end
    end
)
