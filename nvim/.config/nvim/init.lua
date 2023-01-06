-- require 'plugins'
-- require 'mappings'
-- require 'treesitter'
-- require 'config'
-- require 'ui'

local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	is_bootstrap = true
	vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim.git', install_path }
	vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use {
		'neovim/nvim-lspconfig',
		requires = {
			'j-hui/fidget.nvim',
			'folke/neodev.nvim',
		},
	}

	use { -- Highlight, edit, and navigate code
		'nvim-treesitter/nvim-treesitter',
	    	run = function()
	      		pcall(require('nvim-treesitter.install').update { with_sync = true })
	    	end,
	}

	use { -- Additional text objects via treesitter
		'nvim-treesitter/nvim-treesitter-textobjects',
		after = 'nvim-treesitter',
  	}

	-- Git related plugins
	use 'tpope/vim-fugitive'
	use 'tpope/vim-rhubarb'
	use 'lewis6991/gitsigns.nvim'

	use 'navarasu/onedark.nvim' -- Theme inspired by Atom
	use 'nvim-lualine/lualine.nvim' -- Fancier statusline
	use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
	use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
	use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically

	-- Fuzzy Finder (files, lsp, etc)
	use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

	-- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
	local has_plugins, plugins = pcall(require, 'custom.plugins')
	if has_plugins then
		plugins(use)
	end

	if is_bootstrap then
		require('packer').sync()
	end
end)
