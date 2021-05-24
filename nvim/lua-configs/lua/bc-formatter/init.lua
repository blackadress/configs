-- FORMATER.VIM
require("formatter").setup(
  {
    logging = false,
    filetype = {
      javascript = {
        -- prettier
        function()
          return {
            exe = "prettier",
            args = {
              "--stdin-filepath",
              vim.api.nvim_buf_get_name(0),
              "--single-quote"
            },
            stdin = true
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
          return {exe = "gofmt", stdin = true}
        end
      },
      lua = {
        -- luafmt
        function()
          return {
            exe = "luafmt",
            args = {"--indent-count", 2, "--stdin", "--line-width", "100"},
            stdin = true
            -- exe = "lua-format",
            -- args = {"--indent-width", 2},
            -- stdin = true
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
          return {
            exe = "black",
            stdin = false
          }
        end
      }
    }
  }
)

vim.api.nvim_set_keymap("n", "<Leader>ff", ":Format<CR>", {noremap = true, silent = true})
