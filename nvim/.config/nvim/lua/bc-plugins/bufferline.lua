return {
  "akinsho/bufferline.nvim",
  dependencies = "kyazdani42/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      --- level is a string "error" | "warning"
      --- diagnostics_dict is a dictionary from error level ("error", "warning" or "info")to number of errors for each level.
      --- this should return a string
      --- Don't get too fancy as this function will be executed a lot
      options = {
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
        always_show_bufferline = true,
      },
    })
  end,
}
