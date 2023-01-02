return require('packer').startup(function(use)

	-- Packer can manage itself
	use { 'wbthomason/packer.nvim' }

	-------------
	----tools----
	-------------
	-- bufferline
	use { "akinsho/bufferline.nvim" }
	use { "moll/vim-bbye" }
	-- comment
	use { "numToStr/Comment.nvim" }
	use { "JoosepAlviste/nvim-ts-context-commentstring" }

	-- nvim-tree
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
		tag = 'nightly', -- optional, updated every week. (see issue #1193)
	}
	-- telescope
	use {
		"nvim-telescope/telescope.nvim", tag = '0.1.0',
		-- or                            , branch = '0.1.x',
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-project.nvim",
			-- "BurntSushi/ripgrep", -- BurntSushi/ripgrep is required for live_grep and grep_string
		}
	}
	use { "BurntSushi/ripgrep" }
	-- use { 'nvim-telescope/telescope-media-files.nvim' }
	-- toggleterm
	use { "akinsho/toggleterm.nvim" } -- floating terminal
	-- dashboard
	use { "glepnir/dashboard-nvim" }
	use { "goolord/alpha-nvim" }

	-------------
	-----lsp-----
	-------------
	use {
		-- manage external editor tooling such as LSP servers, DAP servers, linters,
		-- and formatters through a single interface.
		"williamboman/mason.nvim"
	}
	use { "williamboman/mason-lspconfig.nvim" }
	use { "neovim/nvim-lspconfig" } -- Collection of configurations for built-in LSP client
	use {
		'kosayoda/nvim-lightbulb',
		requires = 'antoinemadec/FixCursorHold.nvim',
	} -- code action
	use { 'ray-x/lsp_signature.nvim' } -- show function signature when typing


	-------------
	-----cmp-----
	-------------
	-- code completion
	use { "hrsh7th/nvim-cmp" } -- the completion plugin
	use { "hrsh7th/cmp-nvim-lsp" } -- lsp completion
	use { "hrsh7th/cmp-nvim-lua" } -- lua completion
	use { "hrsh7th/cmp-buffer" } -- buffer compltion
	use { "hrsh7th/cmp-path" } -- path completion
	use { "hrsh7th/cmp-cmdline" } -- cmdline completion
	use { "L3MON4D3/LuaSnip" } --snippet engine（the dependence of using cmp_luasnip）
	use { "saadparwaiz1/cmp_luasnip" } -- snippet completion
	use { "f3fora/cmp-spell" } -- spell check
	use { "windwp/nvim-autopairs" } -- autopairs
	-- formatting and linters
	use { "jose-elias-alvarez/null-ls.nvim" }

	-- colorthemes
	use { "olimorris/onedarkpro.nvim" }
	use { "lunarvim/colorschemes" }
	use {"projekt0n/github-nvim-theme"}


	-- treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	}
	use { "p00f/nvim-ts-rainbow" }





end)
