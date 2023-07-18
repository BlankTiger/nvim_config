return {
	"nvim-lua/plenary.nvim",
	"nvim-lualine/lualine.nvim",
	"nvim-treesitter/nvim-treesitter",
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-file-browser.nvim",
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"sindrets/diffview.nvim",
	"jose-elias-alvarez/null-ls.nvim",
	"MunifTanjim/prettier.nvim",
	"lervag/vimtex",
	"barreiroleo/ltex-extra.nvim",
	"simrat39/rust-tools.nvim",
	"Vimjas/vim-python-pep8-indent",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",
	--[[ "hrsh7th/cmp-copilot", ]]
	"saadparwaiz1/cmp_luasnip",
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",
	"lewis6991/gitsigns.nvim",
	--[[ 'luk400/vim-jukit', ]]
	"norcalli/nvim-colorizer.lua",
	"kyazdani42/nvim-web-devicons",
	"folke/zen-mode.nvim",
	"folke/twilight.nvim",
	"frazrepo/vim-rainbow",
	"romainl/vim-cool",
	"ThePrimeagen/harpoon",
	"mbbill/undotree",
	--[[ "github/copilot.vim", ]]
	"tpope/vim-fugitive",
	"tpope/vim-surround",
	"tpope/vim-repeat",
	"tpope/vim-sleuth",
	"tpope/vim-obsession",
	"windwp/nvim-autopairs",
	"numToStr/Comment.nvim",
	"JoosepAlviste/nvim-ts-context-commentstring",
	"moll/vim-bbye",
	"akinsho/toggleterm.nvim",
	"ahmedkhalf/project.nvim",
	"lukas-reineke/indent-blankline.nvim",
	"folke/which-key.nvim",
	"fedepujol/move.nvim",
	"ggandor/leap.nvim",
	"preservim/tagbar",
	--"TimUntersberger/neogit",
	"amadeus/vim-evokai",
	"B4mbus/oxocarbon-lua.nvim",
	"kyazdani42/nvim-tree.lua",
	"glepnir/dashboard-nvim",
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build =
		"cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},
	{ "roobert/search-replace.nvim" },
	{ "catppuccin/nvim",                                 name = "catppuccin" },
	{ "AckslD/nvim-neoclip.lua",                         dependencies = { "nvim-telescope/telescope.nvim" } },
	{ dir = "/home/blanktiger/Projects/unorphanize.nvim" },
	"vale1410/vim-minizinc",
	"NoahTheDuke/vim-just",
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
		config = function(_, opts)
			local path = "~/Projects/venv/bin/python"
			require("dap-python").setup(path)
		end,
	},
	--[[ { "chrisgrieser/nvim-spider", lazy = true }, ]]
}
