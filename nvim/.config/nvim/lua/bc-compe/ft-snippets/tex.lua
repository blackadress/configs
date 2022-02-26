local ls = require("luasnip")

local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")

local copy = require("bc-compe.ft-snippets.utils").copy

local snippets = {
    s("ue", {
      t({ "\\usepackage{" }),
      i(1, "package"),
      t({ "}", "" }),
      i(0),
    }),
    s("uo", {
      t({ "\\usepackage[" }),
      i(1, "option"),
      t("]{"),
      i(2, "package"),
      t({ "}", "" }),
      i(0),
    }),
    s("!!", {
      t({ "\\documentclass{" }),
      i(1, "class"),
      t({ "}", "" }),
      t({ "\\title{" }),
      i(2, "title"),
      t({ "}", "" }),
      t({ "\\author{" }),
      i(3, "author"),
      t({ "}", "", "" }),
      t("\\usepackage["),
      i(4, "lang"),
      t({ "]{babel}", "", "" }),
      t({ "\\begin{document}", "\t" }),
      i(5, "text"),
      t({ "", "\\end{document}" }),
    }),
    s("begin", {
      t({ "\\begin{" }),
      i(1, "foo"),
      t({ "}", "\t" }),
      i(0),
      t({ "", "\\end{" }),
      f(copy, 1),
      t({ "}", "" }),
    }),
  }

return snippets
