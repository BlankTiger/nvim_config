return {
	"nvim-lua/plenary.nvim",
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		config = function()
			require("config.lualine")
		end
	},

	{
		"nvim-treesitter/nvim-treesitter",
		lazy = true,
		-- event = "VeryLazy",
		config = function()
			require("config.treesitter")
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"nvim-treesitter/nvim-treesitter-context",
			"JoosepAlviste/nvim-ts-context-commentstring",
		}
	},

	{
		"nvim-telescope/telescope.nvim",
		event = "VeryLazy",
		lazy = true,
		config = function()
			require("config.telescope")
		end,
		dependencies = {
			"nvim-telescope/telescope-file-browser.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build =
				"cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
			},
		}
	},

	{
		"neovim/nvim-lspconfig",
		event = "VeryLazy",
		config = function()
			require("config.lsp")
		end
	},
	{
		"williamboman/mason.nvim",
		lazy = true,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = true,
	},
	{
		"sindrets/diffview.nvim",
		lazy = true,
	},
	{
		"nvimtools/none-ls.nvim",
		lazy = true,
	},
	{
		"MunifTanjim/prettier.nvim",
		lazy = true,
		config = function()
			require("config.prettier")
		end
	},
	{ "lervag/vimtex",                 lazy = true },
	{ "barreiroleo/ltex-extra.nvim",   lazy = true },
	{ "simrat39/rust-tools.nvim",      lazy = true },
	{ "Vimjas/vim-python-pep8-indent", lazy = true },

	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			require("config.cmp")
		end,
		dependencies = {

			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			--[[ "hrsh7th/cmp-copilot", ]]
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
		}
	},
	-- "rafamadriz/friendly-snippets",

	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		config = function()
			require("config.gitsigns")
		end
	},
	--[[ 'luk400/vim-jukit', ]]
	{
		"norcalli/nvim-colorizer.lua",
		event = "VeryLazy",
		config = function()
			require("config.colorizer")
		end
	},
	--[[ "kyazdani42/nvim-web-devicons", ]]
	{
		"folke/zen-mode.nvim",
		event = "VeryLazy",
		config = function()
			require("config.zen-mode")
		end
	},
	{ "folke/twilight.nvim",  event = "VeryLazy" },
	{ "romainl/vim-cool",     event = "VeryLazy" },
	{ "ThePrimeagen/harpoon", event = "VeryLazy" },
	{ "mbbill/undotree",      event = "VeryLazy" },

	--[[ "github/copilot.vim", ]]
	--
	{ "tpope/vim-fugitive",   event = "VeryLazy" },
	{ "tpope/vim-surround",   event = "VeryLazy" },
	{ "tpope/vim-repeat",     event = "VeryLazy" },
	{ "tpope/vim-sleuth",     event = "VeryLazy" },
	{ "tpope/vim-obsession",  event = "VeryLazy" },

	--[[ "windwp/nvim-autopairs", ]]
	--[[ { "numToStr/Comment.nvim", event = "VeryLazy" }, ]]
	--[[ "moll/vim-bbye", ]]
	{ "folke/which-key.nvim", lazy = true },
	{ "fedepujol/move.nvim",  event = "VeryLazy" },
	--[[ "ggandor/leap.nvim", ]]
	{ "preservim/tagbar",     event = "VeryLazy" },
	--"TimUntersberger/neogit",
	--[[ "amadeus/vim-evokai", ]]
	--[[ "B4mbus/oxocarbon-lua.nvim", ]]
	--[[ "kyazdani42/nvim-tree.lua", ]]
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		event = "VeryLazy",
		config = function()
			require("config.neotree")
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		}
	},

	{
		"glepnir/dashboard-nvim",
		lazy = false,
		config = function()
			require("config.dashboard")
		end
	},

	--[[ { "roobert/search-replace.nvim" }, ]]
	--[[ { "catppuccin/nvim",            name = "catppuccin" }, ]]
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"AckslD/nvim-neoclip.lua",
		event = "VeryLazy",
		config = function()
			require("config.neoclip")
		end
	},
	--[[ { dir = "/home/blanktiger/Projects/unorphanize.nvim" }, ]]
	--[[ "vale1410/vim-minizinc", ]]
	{ "NoahTheDuke/vim-just",  event = "VeryLazy" },
	{ "kevinhwang91/nvim-bqf", event = "VeryLazy" },
	"junegunn/fzf",
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
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
		},
		event = "VeryLazy",
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
		end,
		-- config = function()
		-- end
	},
	-- { "chrisgrieser/nvim-spider", lazy = true },

	{
		'echasnovski/mini.ai',
		version = false,
		event = "VeryLazy",
		config = function()
			require("config.mini-ai")
		end
	},
	{
		'echasnovski/mini.indentscope',
		version = false,
		event = "VeryLazy",
		config = function()
			require("config.mini-indentscope")
		end
	},
	{
		'echasnovski/mini.pairs',
		version = false,
		event = "VeryLazy",
		config = function()
			require("config.mini-pairs")
		end
	},
	{
		'echasnovski/mini.surround',
		version = false,
		event = "VeryLazy",
		config = function()
			require("config.mini-surround")
		end
	},
	{
		'echasnovski/mini.comment',
		version = false,
		event = "VeryLazy",
		config = function()
			require("config.mini-comment")
		end
	},

	{
		"folke/todo-comments.nvim",
		event = "VeryLazy",
		config = function()
			require("config.todo-comments")
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{
		"folke/trouble.nvim",
		event = "VeryLazy",
		config = function()
			require("config.trouble")
		end
	},

	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
	},

	{
		"RRethy/vim-illuminate",
		lazy = true,
		-- event = "VeryLazy",
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		version = "2.20.8",
		event = "InsertEnter",
		config = function()
			require("config.indentline")
		end
	},

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
			{
				"rcarriga/nvim-notify",
				config = function()
					require("config.notify")
				end
			},
		}
	},

	{ "nvim-pack/nvim-spectre" },

	{ 'eandrju/cellular-automaton.nvim', lazy = true }
}
