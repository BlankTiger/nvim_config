local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		--[[ null_ls.builtins.diagnostics.eslint_d.with({ ]]
		--[[ 	diagnostics_format = '[eslint] #{m}\n(#{c})' ]]
		--[[ }), ]]
		formatting.black.with({ extra_args = { "--fast", "--line-length", "100" } }),
		formatting.isort.with({ extra_args = { "--profile", "black", "-l", "100" } }),
		diagnostics.mypy,
		diagnostics.ruff,
		--[[ formatting.stylua, ]]
		-- diagnostics.flake8
	},
})
