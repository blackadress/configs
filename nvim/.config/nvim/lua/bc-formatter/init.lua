-- FORMATER.VIM
require("formatter").setup({
  logging = false,
  filetype = {
    html = {
      function()
        return {
          exe = "prettier",
          args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
          stdin = true,
        }
      end,
    },
    css = {
      function()
        return {
          exe = "prettier",
          args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
          stdin = true,
        }
      end,
    },
    javascript = {
      function()
        -- return {
        --   exe = "dprint",
        --   args = {
        --     "fmt",
        --     "--stdin",
        --     vim.api.nvim_buf_get_name(0),
        --     "--config",
        --     "~/configs/dprint/config.json",
        --   },
        --   stdin = true,
        -- }
        return {
          exe = "prettierd",
          args = { vim.api.nvim_buf_get_name(0) },
          stdin = true,
        }
      end,
    },
    javascriptreact = {
      function()
        --[[ return {
          exe = "dprint",
          args = { "fmt", "--config", "~/configs/dprint/config.json" },
          stdin = false,
        } ]]
        return {
          exe = "prettierd",
          args = { vim.api.nvim_buf_get_name(0) },
          stdin = true,
        }
      end,
    },
    typescript = {
      function()
        return {
          exe = "dprint",
          args = {
            "fmt",
            "--stdin",
            vim.api.nvim_buf_get_name(0),
            "--config",
            "~/configs/dprint/config.json",
          },
          stdin = true,
        }
      end,
    },
    typescriptreact = {
      function()
        return {
          --[[ exe = "dprint",
          args = { "fmt", "--config", "~/configs/dprint/config.json" },
          stdin = false, ]]
          exe = "prettierd",
          args = { vim.api.nvim_buf_get_name(0) },
          stdin = true,
        }
      end,
    },
    json = {
      function()
        return {
          --[[ exe = "dprint",
          args = { "fmt", "--config", "~/configs/dprint/config.json" },
          stdin = false, ]]
          exe = "prettierd",
          args = { vim.api.nvim_buf_get_name(0) },
          stdin = true,
        }
      end,
    },
    xml = {
      function()
        return { exe = "xmlstarlet", args = { "format" }, stdin = true }
      end,
    },
    rust = {
      function()
        return { exe = "rustfmt", args = { "--emit=stdout" }, stdin = true }
      end,
    },
    go = {
      function()
        return { exe = "goimports", stdin = true }
      end,
    },
    lua = {
      function()
        return { exe = "stylua", stdin = false }
      end,
    },
    haskell = {
      function()
        return { exe = "hindent", stdin = true }
      end,
    },
    python = {
      function()
        return { exe = "black", stdin = false }
      end,
    },
    sql = {
      function()
        return { exe = "pg_format", stdin = true }
      end,
    },
    cs = {
      function()
        return {
          exe = "dotnet-csharpier",
          args = {
            "--write-stdout",
            vim.api.nvim_buf_get_name(0),
          },
          stdin = true,
        }
      end,
    },
  },
})

vim.keymap.set("v", "<Leader>t", "<cmd>lua vim.lsp.buf.format()<CR>")
vim.keymap.set("n", "<Leader>t", ":Format<CR>")

vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.lua,*.rs,*.hs,*.go FormatWrite
augroup END
]],
  true
)
-- autocmd BufWritePost *.html,*.js,*.jsx,*.ts,*.rs,*.lua,*.hs,*.go,*py FormatWrite
