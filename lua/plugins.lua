-- ~/.config/nvim/lua/plugins.lua

-- Auto-install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({
			'git',
			'clone',
			'--depth',
			'1',
			'https://github.com/wbthomason/packer.nvim',
			install_path
		})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- LSP Servers
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'
	use 'neovim/nvim-lspconfig'

	-- Auto-completion plugin and its sources
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'

	-- Snippet engine and snippet collection (optional)
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'

	-- Telescope for fuzzy finding
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use {
		'stevearc/dressing.nvim',
		config = function()
			local themes = require('telescope.themes')
			require('dressing').setup {
				select = { telescope = themes.get_cursor(), },  -- use Telescope under the hood
			}
		end,
	}

	-- Treesitter for better syntax highlighting, code navigation, etc...
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	-- NvimTree for file browser
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons', -- optional, for file icons
		},
	}

	-- OneDark Theme
	use 'navarasu/onedark.nvim'

	-- EdenEast NightFox Theme
	use 'EdenEast/nightfox.nvim'

	-- Install vim-fugitive
	use 'tpope/vim-fugitive'

	-- Install vim-gitgutter
	use 'airblade/vim-gitgutter'

	-- Install todo-comments
	use {
		'folke/todo-comments.nvim',
		requires = {
			'nvim-lua/plenary.nvim'
		}
	}

	use {
		'simrat39/symbols-outline.nvim',
		config = function()
			require("symbols-outline").setup()
		end
	}

	if packer_bootstrap then
		require('packer').sync()
	end

	use {
		'kevinhwang91/nvim-ufo',
		requires = 'kevinhwang91/promise-async',
		config = function()
			-- Recommended: use Treesitter for better syntax awareness
			require('ufo').setup()

			-- Optional: adjust Neovim's built-in folding options
			vim.o.foldcolumn = '1'      -- Show fold column
			vim.o.foldlevel = 99        -- Open folds by default
			vim.o.foldlevelstart = 99   -- Open folds at startup
			vim.o.foldenable = true     -- Enable folding
		end
	}

end)
