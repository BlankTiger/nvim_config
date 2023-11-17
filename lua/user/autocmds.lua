local autocmd_group = vim.api.nvim_create_augroup(
	"My custom auto commands",
	{ clear = true }
)

vim.g.lsp_loaded = false

vim.api.nvim_create_autocmd(
	{ "BufEnter" },
	{
		pattern = { "*.*" },
		callback = function()
			if not vim.g.lsp_loaded then
				require("lspconfig")
				require("nvim-treesitter")
				vim.g.lsp_loaded = true
				return
			end
		end,
		group = autocmd_group,
	}
)
