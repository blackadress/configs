-- galaxy line
local gl = require("galaxyline")
local gls = gl.section
gl.short_line_list = {"LuaTree", "vista", "dbui"}

local colors = {
  bg = "#282c34",
  yellow = "#fabd2f",
  cyan = "#2aa198",
  darkblue = "#081633",
  green = "#afd700",
  orange = "#cb4b16",
  purple = "#5d4d7a",
  magenta = "#d16d9e",
  grey = "#c0c0c0",
  blue = "#0087d7",
  red = "#dc322f",
  another_blue = "#004c8c",
  another_yellow = "#cd9e23"
}

local separators = {
  slanted_right = "",
  slanted_left = "",
  block_full = "█",
  block_half = "▋"
}

local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand("%:t")) ~= 1 then
    return true
  end
  return false
end

gls.left[1] = {
  FirstElement = {
    provider = function()
      return separators.block_full .. " "
    end,
    highlight = {colors.another_yellow, colors.another_blue}
  }
}
gls.left[2] = {
  ViMode = {
    provider = function()
      local alias = {
        n = "NORMAL",
        i = "INSERT",
        c = "COMMAND",
        v = "VISUAL",
        V = "VISUAL LINE",
        [""] = "VISUAL BLOCK"
      }
      return alias[vim.fn.mode()]
    end,
    separator = separators.slanted_left,
    separator_highlight = {
      colors.another_blue,
      function()
        if not buffer_not_empty() then
          return colors.another_blue
        end
        return colors.darkblue
      end
    },
    highlight = {colors.another_yellow, colors.another_blue, "bold"}
  }
}
gls.left[3] = {
  FileIcon = {
    provider = "FileIcon",
    condition = buffer_not_empty,
    highlight = {require("galaxyline.provider_fileinfo").get_file_icon_color, colors.darkblue}
  }
}
gls.left[4] = {
  FileName = {
    provider = {"FileName", "FileSize"},
    condition = buffer_not_empty,
    separator = separators.slanted_right,
    separator_highlight = {colors.another_blue, colors.darkblue},
    highlight = {colors.cyan, colors.darkblue}
  }
}

gls.left[5] = {
  GitIcon = {
    provider = function()
      return "  "
    end,
    condition = buffer_not_empty,
    highlight = {colors.orange, colors.another_blue}
  }
}
gls.left[6] = {
  GitBranch = {
    provider = "GitBranch",
    condition = buffer_not_empty,
    highlight = {colors.grey, colors.another_blue}
  }
}

local checkwidth = function()
  local squeeze_width = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

gls.left[7] = {
  DiffAdd = {
    provider = "DiffAdd",
    condition = checkwidth,
    icon = " ",
    highlight = {colors.green, colors.another_blue}
  }
}
gls.left[8] = {
  DiffModified = {
    provider = "DiffModified",
    condition = checkwidth,
    icon = " ",
    highlight = {colors.orange, colors.another_blue}
  }
}
gls.left[9] = {
  DiffRemove = {
    provider = "DiffRemove",
    condition = checkwidth,
    icon = " ",
    highlight = {colors.red, colors.another_blue}
  }
}
gls.left[10] = {
  LeftEnd = {
    provider = function()
      return separators.slanted_left
    end,
    separator = separators.slanted_left,
    separator_highlight = {colors.another_blue, colors.bg},
    highlight = {colors.another_blue, colors.another_blue}
  }
}
gls.left[11] = {
  DiagnosticError = {
    provider = "DiagnosticError",
    icon = "  ",
    highlight = {colors.red, colors.bg}
  }
}
gls.left[12] = {
  Space = {
    provider = function()
      return ""
    end
  }
}
gls.left[13] = {
  DiagnosticWarn = {
    provider = "DiagnosticWarn",
    icon = "  ",
    highlight = {colors.blue, colors.bg}
  }
}
gls.right[1] = {
  FileFormat = {
    provider = "FileFormat",
    separator = separators.slanted_left,
    separator_highlight = {colors.bg, colors.another_blue},
    highlight = {colors.grey, colors.another_blue}
  }
}
gls.right[2] = {
  LineInfo = {
    provider = "LineColumn",
    separator = " | ",
    separator_highlight = {colors.darkblue, colors.another_blue},
    highlight = {colors.grey, colors.another_blue}
  }
}
gls.right[3] = {
  PerCent = {
    provider = "LinePercent",
    separator = separators.slanted_right,
    separator_highlight = {colors.darkblue, colors.another_blue},
    highlight = {colors.grey, colors.darkblue}
  }
}
gls.right[4] = {
  ScrollBar = {
    provider = "ScrollBar",
    highlight = {colors.another_yellow, colors.another_blue}
  }
}

gls.short_line_left[1] = {
  BufferType = {
    provider = "FileTypeName",
    separator = separators.slanted_left,
    separator_highlight = {colors.another_blue, colors.bg},
    highlight = {colors.grey, colors.another_blue}
  }
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider = "BufferIcon",
    separator = separators.slanted_right,
    separator_highlight = {colors.another_blue, colors.bg},
    highlight = {colors.grey, colors.another_blue}
  }
}
