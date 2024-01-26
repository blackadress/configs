return {
  -- rest client
  -- { "rest-nvim/rest.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  --patched version of above
  -- { "blackadress/rest.nvim", branch = "response_body_stored" },
  {
    -- "blackadress/rest.nvim",
    "rest-nvim/rest.nvim",
    -- dir = "home/erland/proyectos/lua/rest.nvim",
    ft = "http",
    lazy = true,
    -- commit = "8b62563",
    dependencies = { { "nvim-lua/plenary.nvim" } },
    config = function()
      local rest = require("rest-nvim")

      rest.setup({
        jump_to_request = true,
        result_split_horizontal = false,
        result_split_in_place = true,
        highlight = {
          enabled = true,
          timeout = 150,
        },
        result = {
          show_url = true,
          show_curl_command = false,
          show_http_info = true,
          show_headers = true,
          formatters = {
            json = "jq",
            html = function(body)
              return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
            end,
          },
        },
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "http",

        callback = function()
          local buff = tonumber(vim.fn.expand("<abuf>"), 10)
          vim.keymap.set("n", "<leader>re", rest.run, { buffer = buff })
          vim.keymap.set("n", "<leader>rr", rest.last, { buffer = buff })
          vim.keymap.set("n", "<leader>pr", function()
            rest.run(true)
          end, { buffer = buff })
        end,
      })
    end,
  },
}
