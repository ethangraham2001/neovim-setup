-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- BEGIN: Colorscheme
	use ( {
		"ellisonleao/gruvbox.nvim",
		as = 'gruvbox',
		config = function()
			vim.cmd('colorscheme gruvbox')
		end
	})
	-- END: Colorscheme
    -- BEGIN: Status Bar
    use 'feline-nvim/feline.nvim'
    -- END: Status Bar

	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}) -- install treesitter

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.4',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

    -- BEGIN: LSP
    use {
        "williamboman/nvim-lsp-installer",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }
    -- END: LSP

    -- BEGIN: Tree
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }
    -- END: Tree
    -- BEGIN: nvim-cmp autocomplete
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-nvim-lua"
    use "hrsh7th/cmp-nvim-lsp"
    use "saadparwaiz1/cmp_luasnip"
    -- END: nvim-cmp autocomplete
end)
