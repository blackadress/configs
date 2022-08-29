local saga = require("lspsaga")

saga.init_lsp_saga({
  move_in_saga = { prev = "<C-p>", next = "<C-n>" },
})

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
-- local lsp_installer = require("nvim-lsp-installer")
require("nvim-lsp-installer").setup({
  automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗",
    },
  },
})

local lspconfig = require("lspconfig")

lspconfig.angularls.setup({})
lspconfig.bashls.setup({})
lspconfig.emmet_ls.setup({})
lspconfig.gopls.setup({})
lspconfig.pyright.setup({})
lspconfig.rust_analyzer.setup({})
lspconfig.sqls.setup({
  cmd = {
    "/home/erland/.local/share/nvim/lsp_servers/sqls/sqls",
    "-config",
    "/home/erland/.local/share/nvim/lsp_servers/sqls/config.yml",
  },
})
lspconfig.sumneko_lua.setup({
  settings = lua_settings,
})
lspconfig.texlab.setup({})
lspconfig.tsserver.setup({})

-- require("bc-lsp/lspsaga_config")
