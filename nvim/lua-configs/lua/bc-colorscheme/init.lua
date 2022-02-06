--[[ tokyonight_style]]
-- vim.g.tokyonight_style = "night"
-- vim.cmd("colorscheme tokyonight")

--[[ gruvbox-baby ]]
-- vim.cmd("colorscheme gruvbox-baby")

--[[ gruvbox ]]
-- vim.o.background = "dark" -- or "light" for light mode
-- vim.cmd([[colorscheme gruvbox]])

--[[ gruvbox material]]
-- vim.g.gruvbox_material_background = "soft"
-- vim.g.gruvbox_material_enable_bold = 1
-- vim.g.gruvbox_material_palette = 'mix'
-- vim.cmd([[colorscheme gruvbox-material]])

--[[ github theme ]]
-- require("github-theme").setup({
--   function_style = "bold",
--   transparent = false,
-- })

--[[ subtle_dark -- solarized ]]
-- vim.cmd([[colorscheme subtle_dark]]) -- doesn't work with indent_blankline

--[[ material ]]
require("material").setup({
  italics = {
    comments = true,
  },
  custom_highlight = {
    -- CursorLine = '#0000FF',
    -- LineNr = '#FFFFFF'
  },
  disable = {
    background = false
  }
})
vim.g.material_style = "oceanic"
vim.cmd([[colorscheme material]])

--[[ nebulous ]]
-- require("nebulous").setup({
--   variant = "fullmoon",
--   disable = {
--     background = true,
--     endOfBuffer = false,
--     terminal_colors = false,
--   },
--   italic = {
--     comments = true,
--     keywords = false,
--     functions = false,
--     variables = false,
--   },
--   custom_colors = { -- this table can hold any group of colors with their respective values
--     -- LineNr = { fg = "#5BBBDA", bg = "NONE", style = "NONE" },
--     -- CursorLineNr = { fg = "#E1CD6C", bg = "NONE", style = "NONE" },
--
--     -- it is possible to specify only the element to be changed
--     TelescopePreviewBorder = { fg = "#A13413" },
--     LspDiagnosticsDefaultError = { bg = "#E11313" },
--     TSTagDelimiter = { style = "bold,italic" },
--   },
-- })
