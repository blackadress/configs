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
local lsp_installer = require("nvim-lsp-installer")
-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
  local opts = {}

  if server.name == "emmet_ls" then
    opts.filetypes = {
      "html",
      "css",
      "scss",
      "javascriptreact",
      "typescriptreact",
      "xml",
      "sass",
    }
  end

  if server.name == "sumneko_lua" then
    opts.settings = lua_settings
  end
  if server.name == "sqls" then
    opts.cmd = {
      "/home/erland/.local/share/nvim/lsp_servers/sqls/sqls",
      "-config",
      "/home/erland/.local/share/nvim/lsp_servers/sqls/config.yml",
    }
    opts.on_attach = function(client, bufnr)
      require("sqls").on_attach(client, bufnr)
    end
  end

  -- This setup() function is exactly the same as lspconfig's setup function.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server:setup(opts)
end)

-- require("bc-lsp/lspsaga_config")
