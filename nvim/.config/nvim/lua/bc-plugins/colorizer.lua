return {
  "catgoose/nvim-colorizer.lua",
  config = function()
    vim.o.termguicolors = true
    -- colorizer
    require("colorizer").setup()
  end,
}
