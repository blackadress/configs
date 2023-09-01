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
-- lspconfig.csharp_ls.setup({})
lspconfig.omnisharp.setup({
  cmd = {
    "dotnet",
    config["OMNISHARP"],
  },
  analyze_open_documents_only = true,
  on_attach = function(client, bufnr)
    local tokenModifiers = client.server_capabilities.semanticTokensProvider.legend.tokenModifiers
    for i, v in ipairs(tokenModifiers) do
      tokenModifiers[i] = v:gsub(" ", "_")
    end
    local tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes
    for i, v in ipairs(tokenTypes) do
      tokenTypes[i] = v:gsub(" ", "_")
    end
  end,
})
lspconfig.pyright.setup({})
lspconfig.rust_analyzer.setup({
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        allFeatures = true,
        overrideCommand = {
          "cargo",
          "clippy",
          "--workspace",
          "--message-format=json",
          "--all-targets",
          "--all-features",
        },
      },
    },
  },
})
lspconfig.sqlls.setup({})
lspconfig.lua_ls.setup({
  settings = lua_settings,
})
lspconfig.texlab.setup({})
lspconfig.tsserver.setup({
  on_attach = function(client, _)
    client.server_capabilities.semanticTokensProvider = nil
  end,
})

-- require("bc-lsp/lspsaga_config")
