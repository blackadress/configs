local saga = require("lspsaga")

saga.setup({})

-- Configure lua language server for neovim development
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local lua_settings = {
  Lua = {
    runtime = {
      -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
      version = "LuaJIT",
      -- Setup your lua path
      path = runtime_path,
    },
    diagnostics = {
      -- Get the language server to recognize the `vim` global
      globals = { "vim" },
    },
    workspace = {
      -- Make the server aware of Neovim runtime files
      library = vim.api.nvim_get_runtime_file("", true),
    },
    -- Do not send telemetry data containing a randomized but unique identifier
    telemetry = {
      enable = false,
    },
  },
}

-- lsp-install
require("mason").setup({
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗",
    },
  },
})

local lspconfig = require("lspconfig")

local config = require("utils").VARS

lspconfig.angularls.setup({})
lspconfig.bashls.setup({})
lspconfig.emmet_ls.setup({})
lspconfig.gopls.setup({})
lspconfig.omnisharp.setup({
  cmd = {
    "dotnet",
    config["OMNISHARP"],
  },
})
lspconfig.pyright.setup({})
lspconfig.rust_analyzer.setup({})
lspconfig.sqls.setup({
  cmd = {
    config["SQLS_BIN"],
    "-config",
    config["SQLS_CONF"],
  },
})
lspconfig.lua_ls.setup({
  settings = lua_settings,
})
lspconfig.texlab.setup({})
lspconfig.tsserver.setup({})

-- require("bc-lsp/lspsaga_config")
