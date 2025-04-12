-- lua/lsp_setup.lua

-- Initialize mason, which will handle installing LSP servers.
require("mason").setup()

-- Configure mason-lspconfig to ensure the desired language servers are installed.
require("mason-lspconfig").setup({
  ensure_installed = {
    "clangd",      -- C/C++
    "ts_ls",    -- JavaScript/TypeScript
    "html",        -- HTML
    "cssls",       -- CSS
    "pyright",     -- Python
    "intelephense",-- PHP
    "sqls",        -- SQL/MySQL
    "glslls",      -- GLSL for graphics shaders (if available)
  },
})

-- Define common on_attach and capabilities functions.
-- on_attach is where you can set your keymaps per buffer.
local on_attach = function(client, bufnr)
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  -- Example keybindings for LSP features:
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, bufopts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, bufopts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, bufopts)
end

-- Enhance LSP capabilities for autocompletion (assuming you use cmp-nvim-lsp)
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- A list of servers to set up
local servers = { "clangd", "ts_ls", "html", "cssls", "pyright", "intelephense", "sqls", "glslls" }

-- Loop through the list and set up each server.
for _, server in ipairs(servers) do
  require('lspconfig')[server].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    },
    -- For some servers you can add server-specific settings
    -- For example, sqls might require connection details:
    -- settings = server == "sqls" and {
    --  sqls = {
    --    connections = {
    --      {
    --        driver = "mysql",
    --        host = "127.0.0.1",
    --        port = 3306,
    --        username = "your_db_username",
    --        password = "your_db_password",
    --        database = "your_database",
    --      },
    --    },
    --  },
    --} or nil,
  }
end
