return {
	"nvim-lua/plenary.nvim",
	{ "nvim-lualine/lualine.nvim", event = "VeryLazy" },
	"nvim-treesitter/nvim-treesitter",
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-file-browser.nvim",
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	{ "sindrets/diffview.nvim",    event = "VeryLazy" },
	"jose-elias-alvarez/null-ls.nvim",
	{ "MunifTanjim/prettier.nvim",     event = "VeryLazy" },
	{ "lervag/vimtex",                 event = "VeryLazy" },
	{ "barreiroleo/ltex-extra.nvim",   event = "VeryLazy" },
	{ "simrat39/rust-tools.nvim",      event = "VeryLazy" },
	{ "Vimjas/vim-python-pep8-indent", event = "VeryLazy" },
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",
	--[[ "hrsh7th/cmp-copilot", ]]
	"saadparwaiz1/cmp_luasnip",
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",
	{ "lewis6991/gitsigns.nvim",     event = "VeryLazy" },
	--[[ 'luk400/vim-jukit', ]]
	{ "norcalli/nvim-colorizer.lua", event = "VeryLazy" },
	--[[ "kyazdani42/nvim-web-devicons", ]]
	{ "folke/zen-mode.nvim",         event = "VeryLazy" },
	{ "folke/twilight.nvim",         event = "VeryLazy" },
	{ "romainl/vim-cool",            event = "VeryLazy" },
	{ "ThePrimeagen/harpoon",        event = "VeryLazy" },
	{ "mbbill/undotree",             event = "VeryLazy" },

	--[[ "github/copilot.vim", ]]
	"tpope/vim-fugitive",
	"tpope/vim-surround",
	"tpope/vim-repeat",
	"tpope/vim-sleuth",
	{ "tpope/vim-obsession", event = "VeryLazy" },
	--[[ "windwp/nvim-autopairs", ]]
	--[[ { "numToStr/Comment.nvim", event = "VeryLazy" }, ]]
	"JoosepAlviste/nvim-ts-context-commentstring",
	--[[ "moll/vim-bbye", ]]
	"folke/which-key.nvim",
	{ "fedepujol/move.nvim", event = "VeryLazy" },
	--[[ "ggandor/leap.nvim", ]]
	{ "preservim/tagbar",    event = "VeryLazy" },
	--"TimUntersberger/neogit",
	--[[ "amadeus/vim-evokai", ]]
	--[[ "B4mbus/oxocarbon-lua.nvim", ]]
	--[[ "kyazdani42/nvim-tree.lua", ]]
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		}
	},
	"glepnir/dashboard-nvim",
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build =
		"cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},
	--[[ { "roobert/search-replace.nvim" }, ]]
	--[[ { "catppuccin/nvim",            name = "catppuccin" }, ]]
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{ "AckslD/nvim-neoclip.lua", dependencies = { "nvim-telescope/telescope.nvim" } },
	--[[ { dir = "/home/blanktiger/Projects/unorphanize.nvim" }, ]]
	--[[ "vale1410/vim-minizinc", ]]
	{ "NoahTheDuke/vim-just",    event = "VeryLazy" },
	"kevinhwang91/nvim-bqf",
	"junegunn/fzf",
	{
		"rcarriga/nvim-dap-ui",
		dependencies = "mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end
	},
	{ "mfussenegger/nvim-dap", },
	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
		dependencies = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
		},
		config = function(_, _)
			local path = "~/venv/bin/python"
			require("dap-python").setup(path)
		end,
	},
	-- { "chrisgrieser/nvim-spider", lazy = true },

	{ 'echasnovski/mini.ai',          version = false },
	{ 'echasnovski/mini.indentscope', version = false },
	{ 'echasnovski/mini.pairs',       version = false },
	{ 'echasnovski/mini.surround',    version = false },
	{ 'echasnovski/mini.comment',     version = false },

	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{ "folke/trouble.nvim" },
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
	},

	{ "RRethy/vim-illuminate" },
	{ "lukas-reineke/indent-blankline.nvim" },

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		}
	},

	{ "nvim-pack/nvim-spectre" },

	{ 'eandrju/cellular-automaton.nvim', event = "VeryLazy" }
}
