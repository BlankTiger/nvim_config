local autocmd_group = vim.api.nvim_create_augroup(
	"My custom auto commands",
	{ clear = true }
)

vim.g.lsp_loaded = false

vim.api.nvim_create_autocmd(
	{ "BufEnter" },
	{
		pattern = { "*.*" },
		desc = "Load lsp stuff if we enter any buffer with extension",
		callback = function()
			if not vim.g.lsp_loaded then
				require("nvim-treesitter")
				require("lspconfig")
				require("cmp")
				require("noice")
				vim.g.lsp_loaded = true
				return
			end
		end,
		group = autocmd_group,
	}
)
