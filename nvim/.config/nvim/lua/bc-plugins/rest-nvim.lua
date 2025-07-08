return {
  -- rest client
  -- { "rest-nvim/rest.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  --patched version of above
  -- { "blackadress/rest.nvim", branch = "response_body_stored" },
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },
  {
    -- "blackadress/rest.nvim",
    "rest-nvim/rest.nvim",
    -- dir = "home/erland/proyectos/lua/rest.nvim",
    ft = "http",
    lazy = true,
    -- commit = "8b62563",
    dependencies = { "luarocks.nvim" },
    tag = "v2.0.1",
    config = function()
      local rest = require("rest-nvim")

      rest.setup({
        client = "curl",
        env_file = ".env",
        env_pattern = "\\.env$",
        env_edit_command = "tabedit",
        encode_url = true,
        skip_ssl_verification = false,
        custom_dynamic_variables = {},
        logs = {
          level = "info",
          save = true,
        },
        result = {
          split = {
            horizontal = false,
            in_place = true,
            stay_in_current_window_after_split = true,
          },
          behavior = {
            decode_url = true,
            show_info = {
              url = true,
              headers = true,
              http_info = true,
              curl_command = true,
            },
            statistics = {
              enable = true,
              ---@see https://curl.se/libcurl/c/curl_easy_getinfo.html
              stats = {
                { "total_time", title = "Time taken:" },
                { "size_download_t", title = "Download size:" },
              },
            },
            formatters = {
              json = "jq",
              html = function(body)
                if vim.fn.executable("tidy") == 0 then
                  return body, { found = false, name = "tidy" }
                end
                local fmt_body = vim.fn
                  .system({
                    "tidy",
                    "-i",
                    "-q",
                    "--tidy-mark",
                    "no",
                    "--show-body-only",
                    "auto",
                    "--show-errors",
                    "0",
                    "--show-warnings",
                    "0",
                    "-",
                  }, body)
                  :gsub("\n$", "")

                return fmt_body, { found = true, name = "tidy" }
              end,
            },
          },
        },
        highlight = {
          enable = true,
          timeout = 750,
        },
        keybinds = {
          {
            "<leader>re",
            "<cmd>Rest run<cr>",
            "Run request under the cursor",
          },
        },
      })

      -- vim.api.nvim_create_autocmd("FileType", {
      --   pattern = "http",
      --
      --   callback = function()
      --     local buff = tonumber(vim.fn.expand("<abuf>"), 10)
      --     vim.keymap.set("n", "<leader>re", rest.run, { buffer = buff })
      --     vim.keymap.set("n", "<leader>rr", rest.last, { buffer = buff })
      --     vim.keymap.set("n", "<leader>pr", function()
      --       rest.run(true)
      --     end, { buffer = buff })
      --   end,
      -- })
    end,
  },
}
