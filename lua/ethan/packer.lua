-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

local map = vim.keymap.set

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use 'tjdevries/colorbuddy.vim'

	-- BEGIN: Colorscheme
	use ({
		"ellisonleao/gruvbox.nvim",
		as = 'gruvbox',
	})
	-- MONOKAI
	use ({
		"loctvl842/monokai-pro.nvim",
		as = 'monokai',
	})

	--MOLOKAI (dark monokai)
	use 'UtkarshVerma/molokai.nvim'

	-- AYU
	use ({
		'Shatur/neovim-ayu',
		as = 'ayu',
	})
	-- SPACEDUCK
	use ({
		'pineapplegiant/spaceduck'
	})
	-- CATPUCCIN
	use ({
		"catppuccin/nvim",
		as = "catppuccin"
	})
	-- ROSÉ PINE
	use({
		"rose-pine/neovim",
		as = "rose-pine"
	})
	-- NEWPAPER
	use({
		'yorik1984/newpaper.nvim',
		as = 'newpaper'
	})
	use({
		"folke/tokyonight.nvim",
		as = "tokyonight"
	})

	-- NIGHTFOX
	use "EdenEast/nightfox.nvim"

	-- NEOFUSION
	use "diegoulloao/neofusion.nvim"

	-- END: Colorscheme
	-- BEGIN: Status Bar
	-- use 'feline-nvim/feline.nvim'
	-- use "Hitesh-Aggarwal/feline_one_monokai.nvim"
	-- END: Status Bar

	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

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
	--
	-- BEGIN: Metals LSP for Scala
	use {
		"scalameta/nvim-metals",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"j-hui/fidget.nvim",
				opts = {},
			},
			{
				"mfussenegger/nvim-dap",
				config = function(self, opts)
					-- Debug settings if you're using nvim-dap
					local dap = require("dap")

					dap.configurations.scala = {
						{
							type = "scala",
							request = "launch",
							name = "RunOrTest",
							metals = {
								runType = "runOrTestFile",
								--args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
							},
						},
						{
							type = "scala",
							request = "launch",
							name = "Test Target",
							metals = {
								runType = "testTarget",
							},
						},
					}
				end
			},
		},
		ft = { "scala", "sbt", "java" },
		opts = function()
			local metals_config = require("metals").bare_config()

			-- Example of settings
			metals_config.settings = {
				showImplicitArguments = true,
				excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
			}

			-- *READ THIS*
			-- I *highly* recommend setting statusBarProvider to either "off" or "on"
			--
			-- "off" will enable LSP progress notifications by Metals and you'll need
			-- to ensure you have a plugin like fidget.nvim installed to handle them.
			--
			-- "on" will enable the custom Metals status extension and you *have* to have
			-- a have settings to capture this in your statusline or else you'll not see
			-- any messages from metals. There is more info in the help docs about this
			metals_config.init_options.statusBarProvider = "off"

			-- Example if you are using cmp how to make sure the correct capabilities for snippets are set
			metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

			metals_config.on_attach = function(client, bufnr)
				require("metals").setup_dap()

				-- LSP mappings
				map("n", "gD", vim.lsp.buf.definition)
				map("n", "K", vim.lsp.buf.hover)
				map("n", "gi", vim.lsp.buf.implementation)
				map("n", "gr", vim.lsp.buf.references)
				map("n", "gds", vim.lsp.buf.document_symbol)
				map("n", "gws", vim.lsp.buf.workspace_symbol)
				map("n", "<leader>cl", vim.lsp.codelens.run)
				map("n", "<leader>sh", vim.lsp.buf.signature_help)
				map("n", "<leader>rn", vim.lsp.buf.rename)
				map("n", "<leader>f", vim.lsp.buf.format)
				map("n", "<leader>ca", vim.lsp.buf.code_action)

				map("n", "<leader>ws", function()
					require("metals").hover_worksheet()
				end)

				-- all workspace diagnostics
				map("n", "<leader>aa", vim.diagnostic.setqflist)

				-- all workspace errors
				map("n", "<leader>ae", function()
					vim.diagnostic.setqflist({ severity = "E" })
				end)

				-- all workspace warnings
				map("n", "<leader>aw", function()
					vim.diagnostic.setqflist({ severity = "W" })
				end)

				-- buffer diagnostics only
				map("n", "<leader>d", vim.diagnostic.setloclist)

				map("n", "[c", function()
					vim.diagnostic.goto_prev({ wrap = false })
				end)

				map("n", "]c", function()
					vim.diagnostic.goto_next({ wrap = false })
				end)

				-- Example mappings for usage with nvim-dap. If you don't use that, you can
				-- skip these
				map("n", "<leader>dc", function()
					require("dap").continue()
				end)

				map("n", "<leader>dr", function()
					require("dap").repl.toggle()
				end)

				map("n", "<leader>dK", function()
					require("dap.ui.widgets").hover()
				end)

				map("n", "<leader>dt", function()
					require("dap").toggle_breakpoint()
				end)

				map("n", "<leader>dso", function()
					require("dap").step_over()
				end)

				map("n", "<leader>dsi", function()
					require("dap").step_into()
				end)

				map("n", "<leader>dl", function()
					require("dap").run_last()
				end)
			end

			return metals_config
		end,
		config = function(self, metals_config)
			local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
			vim.api.nvim_create_autocmd("FileType", {
				pattern = self.ft,
				callback = function()
					require("metals").initialize_or_attach(metals_config)
				end,
				group = nvim_metals_group,
			})
		end

	}
	-- END: Metals LSP for Scala

	-- BEGIN: Tree
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional
		},
	}
	-- END: Tree
	-- BEGIN: Lualine
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}
	-- END: Lualine

	-- BEGIN: barbar
	-- These optional plugins should be loaded directly because of a bug in Packer lazy loading
	-- use 'romgrk/barbar.nvim'
	-- END: barbar

	-- BEGIN: indent-lines
	use {
		"lukas-reineke/indent-blankline.nvim"
	}
	-- END: indent-lines

	-- BEGIN: nvim-cmp autocomplete
	use "hrsh7th/nvim-cmp"
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/cmp-path"
	use "hrsh7th/cmp-nvim-lua"
	use "hrsh7th/cmp-nvim-lsp"
	use "saadparwaiz1/cmp_luasnip"
	-- END: nvim-cmp autocomplete
	--
	-- rust-tools
	use 'simrat39/rust-tools.nvim'

	-- plenary (for scala metals)
	use "nvim-lua/plenary.nvim"

	-- Vimtex
	use {
		'lervag/vimtex',
		-- tag = 'v2.15',
		config = function()
			-- Optional: Vimtex configuration
			vim.g.tex_flavor = 'latex'
			vim.g.vimtex_view_method = 'zathura'
			vim.g.vimtex_quickfix_mode = 0
			-- Add any other Vimtex configuration here
		end
	}

	use {
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup()
		end
	}

	use({
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	})

	use({
		"stevearc/conform.nvim"
	})

	use({
		'MeanderingProgrammer/render-markdown.nvim',
		after = { 'nvim-treesitter' },
		requires = { 'echasnovski/mini.nvim', opt = true }, -- if you use the mini.nvim suite
		-- requires = { 'echasnovski/mini.icons', opt = true }, -- if you use standalone mini plugins
		-- requires = { 'nvim-tree/nvim-web-devicons', opt = true }, -- if you prefer nvim-web-devicons
		config = function()
			require('render-markdown').setup({})
		end,
	})

	use "tamarin-prover/editors"

end)
