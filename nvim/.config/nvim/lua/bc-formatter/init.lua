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
        return {
          exe = "dprint",
          args = { "fmt", "--config", "~/configs/dprint/config.json" },
          stdin = false,
        }
      end,
    },
    javascriptreact = {
      function()
        return {
          exe = "dprint",
          args = { "fmt", "--config", "~/configs/dprint/config.json" },
          stdin = false,
        }
      end,
    },
    typescript = {
      function()
        return {
          exe = "dprint",
          args = { "fmt", "--config", "~/configs/dprint/config.json" },
          stdin = false,
        }
      end,
    },
    json = {
      function()
        return {
          exe = "dprint",
          args = { "fmt", "--config", "~/configs/dprint/config.json" },
          stdin = false,
        }
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
        return {
          -- exe = "luafmt",
          -- args = {"--indent-count", 2, "--stdin", "--line-width", "100"},
          -- stdin = true
          exe = "stylua",
          stdin = false,
        }
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
        return {
          exe = "pg_format",
          stdin = true,
        }
      end,
    },
  },
})

vim.api.nvim_set_keymap("n", "<Leader>t", ":Format<CR>", { noremap = true, silent = true })
vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.rs,*.hs,*.go FormatWrite
augroup END
]],
  true
)
-- autocmd BufWritePost *.html,*.js,*.jsx,*.ts,*.rs,*.lua,*.hs,*.go,*py FormatWrite
