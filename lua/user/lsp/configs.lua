local status_ok, lsp_installer = pcall(require, "mason")
if not status_ok then
  return
end

lsp_installer.setup()
local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")

local servers = { "pyright", "rust_analyzer", "ltex", "texlab", "jsonls", "lua_ls", "dockerls", "tsserver", "clangd",
  "cssls", "emmet_ls", "html", "marksman", "taplo", "yamlls", "jdtls", "marksman", "kotlin_language_server", "asm_lsp",
  "bashls", "tailwindcss", "nil_ls"
}
-- ruff_lsp
-- local servers = { "pyright", "rust_analyzer", "powershell_es", "asm_lsp", "dockerls", "elixirls", "texlab", "vimls", "terraformls", "jsonls", "sumneko_lua", "tsserver", "ansiblels", "clangd", "cssls", "cssmodules_ls", "emmet_ls", "html", "jdtls", "julials", "marksman" }

mason_lspconfig.setup({
  ensure_installed = servers,
})

for _, server in pairs(servers) do
  local opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }

  local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server)
  if has_custom_opts then
    opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
  end

  if server == "ltex" then
    require("lspconfig").ltex.setup {
      on_attach = function(client, bufnr)
        -- your other on_attach functions.
        require("ltex_extra").setup {
          load_langs = { "pl-PL", "en-US" }, -- table <string> : languages for witch dictionaries will be loaded
          init_check = true,                 -- boolean : whether to load dictionaries on startup
          path = nil,                        -- string : path to store dictionaries. Relative path uses current working directory
          log_level = "none",                -- string : "none", "trace", "debug", "info", "warn", "error", "fatal"
        }
      end,
      settings = {
        ltex = {
          language = "auto"
        }
      }
    }

    goto continue
  end

  if server == "rust_analyzer" then
    local keymap = vim.keymap.set
    local key_opts = { silent = true }

    keymap("n", "<leader>rh", "<cmd>RustSetInlayHints<Cr>", key_opts)
    keymap("n", "<leader>rhd", "<cmd>RustDisableInlayHints<Cr>", key_opts)
    keymap("n", "<leader>th", "<cmd>RustToggleInlayHints<Cr>", key_opts)
    keymap("n", "<leader>rr", "<cmd>RustRunnables<Cr>", key_opts)
    keymap("n", "<leader>rem", "<cmd>RustExpandMacro<Cr>", key_opts)
    keymap("n", "<leader>roc", "<cmd>RustOpenCargo<Cr>", key_opts)
    keymap("n", "<leader>rpm", "<cmd>RustParentModule<Cr>", key_opts)
    keymap("n", "<leader>rjl", "<cmd>RustJoinLines<Cr>", key_opts)
    keymap("n", "<leader>rha", "<cmd>RustHoverActions<Cr>", key_opts)
    keymap("n", "<leader>rhr", "<cmd>RustHoverRange<Cr>", key_opts)
    keymap("n", "<leader>rmd", "<cmd>RustMoveItemDown<Cr>", key_opts)
    keymap("n", "<leader>rmu", "<cmd>RustMoveItemUp<Cr>", key_opts)
    keymap("n", "<leader>rsb", "<cmd>RustStartStandaloneServerForBuffer<Cr>", key_opts)
    keymap("n", "<leader>rd", "<cmd>RustDebuggables<Cr>", key_opts)
    keymap("n", "<leader>rv", "<cmd>RustViewCrateGraph<Cr>", key_opts)
    keymap("n", "<leader>rw", "<cmd>RustReloadWorkspace<Cr>", key_opts)
    keymap("n", "<leader>rss", "<cmd>RustSSR<Cr>", key_opts)
    keymap("n", "<leader>rxd", "<cmd>RustOpenExternalDocs<Cr>", key_opts)

    -- local ext_path = 'C:/Users/work/.vscode/extensions/lldb-172/'
    -- local codelldb_path = ext_path .. "adapter/codelldb"
    -- local liblldb_path = ext_path .. "adapter/liblldb.lib"

    require("rust-tools").setup {
      -- dap = {
      --   adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path)
      -- },
      tools = {
        on_initialized = function()
          vim.cmd [[
        autocmd BufEnter,CursorHold,InsertLeave,BufWritePost *.rs lua vim.lsp.codelens.refresh()
        " autocmd BufEnter,CursorHold,InsertLeave,BufWritePost *.rs silent! lua vim.lsp.codelens.refresh()
        ]]
        end,
      },
      server = {
        on_attach = require("user.lsp.handlers").on_attach,
        capabilities = require("user.lsp.handlers").capabilities,
        settings = {
          ["rust-analyzer"] = {
            completion = {
              postfix = {
                enable = true
              },
            },
            lens = {
              enable = true,
            },
            checkOnSave = {
              command = "clippy",
            },
          },
        },
      },
    }
    goto continue
  end

  lspconfig[server].setup(opts)
  ::continue::
end
