local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Plugins without setup
	{ "nvim-tree/nvim-web-devicons" }, -- Pretty icons
	{ "nvim-lua/plenary.nvim" }, -- Dependency for a lot of plugins
	{ "tpope/vim-commentary" }, -- Comment action
	{ "powerman/vim-plugin-ruscmd" }, -- Vim works on russian layout :^)
	{ "tpope/vim-fugitive" }, -- Git integration
	{ "nvzone/volt" },
	{ "MunifTanjim/nui.nvim" },
	{ "Bekaboo/dropbar.nvim", opts = {} },
	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
	{
		"stevearc/oil.nvim",
		opts = {
			delete_to_trash = true,
			view_options = {
				show_hidden = true,
			},
			float = {
				preview_split = "right",
				max_width = 0.5,
				max_height = 0.5,
			},
		},
	},
	{
		"mistricky/codesnap.nvim",
		build = "make",
		keys = {
			{ "<leader>cc", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
			{ "<leader>cs", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
		},
		opts = {
			save_path = "~/Pictures",
			has_breadcrumbs = true,
			bg_color = "#535c68",
			code_font_family = "Lilex Nerd Font",
			watermark = "",
		},
	},
	{
		"echaya/neowiki.nvim",
		opts = {
			wiki_dirs = {
				-- neowiki.nvim supports both absolute and relative paths
				{ name = "NeoWiki", path = "~/neowiki" },
			},
		},
		keys = {
			{ "<leader>ww", "<cmd>lua require('neowiki').open_wiki()<cr>", desc = "Open Wiki" },
		},
	},
	{
		"catgoose/nvim-colorizer.lua",
		opts = {
			user_default_options = {
				mode = "virtualtext",
				virtualtext = "",
				virtualtext_inline = "before",
				names = false,
			},
		},
	},

	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({})
		end,
	},
	{
		"folke/todo-comments.nvim",
		opts = {},
	},
	{
		"kylechui/nvim-surround", -- Working with surrounds
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	{
		"windwp/nvim-autopairs", -- Autopair plugin, pretty simple
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	{
		"nvzone/floaterm",
	},
	{
		"nvimdev/lspsaga.nvim",
		config = function()
			require("lspsaga").setup({
				lightbulb = {
					enable = false,
				},
			})
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {},
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},

	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			-- {
			-- 	"<leader>cs",
			-- 	"<cmd>Trouble symbols toggle focus=false<cr>",
			-- 	desc = "Symbols (Trouble)",
			-- },
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},

	{
		"everviolet/nvim",
		name = "evergarden",
		priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
		opts = {
			theme = {
				variant = "fall",
			},
			editor = {
				transparent_background = false,
				override_terminal = true,
				-- sign = {
				-- 	color = "surface0",
				-- },
			},
			style = {
				tabline = { "reverse" },
				search = { "italic" },
				incsearch = { "reverse" },
				types = { "italic" },
				keyword = { "italic" },
				comment = { "italic" },
			},
			integrations = {
				-- blink_cmp = true,
				gitsigns = true,
				indent_blankline = true,
				-- nvimtree = true,
				-- rainbow_delimiters = true,
				-- symbols_outline = true,
				telescope = true,
				which_key = true,
			},
		},
	},

	-- Plugins with custom setup
	require("plugins.themes"),
	require("plugins.lsp"),
	-- require("plugins.blink"),
	require("plugins.conform"),
	require("plugins.telescope"),
	require("plugins.treesitter"),
	require("plugins.alpha"),
	require("plugins.project"),
	require("plugins.blankline"),
	require("plugins.cursorline"),
	require("plugins.render-markdown"),
})
