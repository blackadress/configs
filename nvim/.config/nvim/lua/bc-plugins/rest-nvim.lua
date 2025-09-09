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
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "http",

        callback = function()
          local buff = tonumber(vim.fn.expand("<abuf>"), 10)
          vim.keymap.set("n", "<leader>re", ":Rest run<Enter>", { buffer = buff })
          vim.keymap.set("n", "<leader>rr", ":Rest last<Enter>", { buffer = buff })
          vim.keymap.set("n", "<leader>pr", ":Rest logs<Enter>", { buffer = buff })
        end,
      })
    end,
  },
}
