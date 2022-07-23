--[[ tokyonight_style ]]
-- vim.g.tokyonight_style = "night" -- "day", "storm" or "night"
-- vim.cmd("colorscheme tokyonight")

--[[ gruvbox-baby ]]
-- vim.g.gruvbox_baby_background_color = "medium" -- "medium" or "dark"
-- vim.g.gruvbox_baby_transparent_mode = false -- "false" or "true"
-- vim.g.gruvbox_baby_keyword_style = "bold" -- see :h attr-list
-- vim.g.gruvbox_baby_function_style = "italic" -- see :h attr-list
-- vim.g.gruvbox_baby_variable_style = "NONE" -- see :h attr-list
-- vim.cmd("colorscheme gruvbox-baby")

--[[ gruvbox ]]
-- vim.o.background = "dark" -- "light" or "dark"
-- vim.cmd([[colorscheme gruvbox]])

--[[ gruvbox material]]
-- vim.cmd([[set background=dark]]) -- "light" or "dark"
-- vim.g.gruvbox_material_background = "medium" -- "soft", "medium" or "hard"
-- vim.g.gruvbox_material_enable_bold = 1
-- vim.g.gruvbox_material_enable_italic = 1
-- vim.g.gruvbox_material_transparent_background  = 0 -- 1 for transparent
-- vim.g.gruvbox_material_palette = "mix" -- "material", "mix" or "original"
-- vim.cmd([[colorscheme gruvbox-material]])

--[[ github theme ]]
-- require("github-theme").setup({
--   theme_style = "dark",  --"light_colorblind", "light_default", "light", "dark_colorblind", "dark_default", "dimmed", "dark"
--   function_style = "bold",
--   transparent = false,
--   keyword_style = "italic",
-- })

--[[ subtle_dark -- solarized ]]
-- doesn't work with indent_blankline)
-- vim.cmd([[colorscheme subtle_dark]]) -- subtle_light subtle_dark

--[[ soluarized -- solarized ]]
-- vim.cmd([[colorscheme soluarized]])

--[[ material ]]
-- require("material").setup({
--   italics = {
--     comments = true,
--   },
--   custom_highlight = {
--     -- CursorLine = '#0000FF',
--     -- LineNr = '#FFFFFF'
--   },
--   disable = {
--     background = false
--   }
-- })
-- vim.g.material_style = "oceanic" -- "lighter", "palenight", "oceanic", "deep ocean", "darker"
-- vim.cmd([[colorscheme material]])

--[[ nebulous ]]
-- require("nebulous").setup({
--   variant = "fullmoon", -- "night", "twilight", "midnight", "fullmoon" or "quasar"
--   disable = {
--     background = false,
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
--     -- TelescopePreviewBorder = { fg = "#A13413" },
--     -- LspDiagnosticsDefaultError = { bg = "#E11313" },
--     TSTagDelimiter = { style = "bold,italic" },
--   },
-- })

--[[ catppuccin ]]
-- require("catppuccin").setup({
--   transparent_background = false,
-- })
-- vim.cmd([[colorscheme catppuccin]])

--[[ leaf ]]
-- require("leaf").setup({
--   undercurl = true,
--   commentStyle = "italic",
--   functionStyle = "NONE",
--   keywordStyle = "italic",
--   statementStyle = "bold",
--   typeStyle = "NONE",
--   variablebuiltinStyle = "italic",
--   transparent = false,
--   colors = {},
--   overrides = {},
--   theme = "dark", -- default, alternatives: "light", "dark", "lighter", "darker", "lightest", "darkest"
-- })
--
-- -- setup must be called before loading
-- vim.cmd("colorscheme leaf")

-- [[ nightfox ]]
require("nightfox").setup({
  options = {
    styles = {
      comments = "italic",
      constants = "bold",
      keywords = "bold",
    },
  },
})

vim.cmd("colorscheme nightfox")
