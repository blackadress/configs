-- FORMATER.VIM
require("formatter").setup(
  {
    logging = false,
    filetype = {
      html = {
        function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
            stdin = true
          }
        end
      },
      css = {
        function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
            stdin = true
          }
        end
      },
      javascript = {
        -- prettier
        function()
          return {exe = "dprint", args = {"fmt"}, stdin = false}
        end
      },
      typescript = {
        -- prettier
        function()
          return {
            exe = "dprint",
            args = {"fmt", "--config", "~/Documents/configs/dprint/config.json"},
            stdin = false
          }
        end
      },
      rust = {
        -- Rustfmt
        function()
          return {exe = "rustfmt", args = {"--emit=stdout"}, stdin = true}
        end
      },
      go = {
        -- gofmt
        function()
          return {exe = "goimports", stdin = true}
        end
      },
      lua = {
        -- luafmt
        function()
          return {
            exe = "luafmt",
            args = {"--indent-count", 2, "--stdin", "--line-width", "100"},
            stdin = true
          }
        end
      },
      haskell = {
        -- hindent
        function()
          return {exe = "hindent", stdin = true}
        end
      },
      python = {
        -- black
        function()
          return {exe = "black", stdin = false}
        end
      }
    }
  }
)

vim.api.nvim_set_keymap("n", "<Leader>xf", ":Format<CR>", {noremap = true, silent = true})
vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePre *.html,*.js,*.ts,*.rs,*.lua,*.hs,*.go,*py FormatWrite
augroup END
]],
  true
)
