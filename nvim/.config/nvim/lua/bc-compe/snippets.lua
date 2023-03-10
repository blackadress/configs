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

-- make sure to reload snippets when sourcing this file
package.loaded["bc-compe.ft-snippets.go"] = nil
package.loaded["bc-compe.ft-snippets.python"] = nil
package.loaded["bc-compe.ft-snippets.tex"] = nil
package.loaded["bc-compe.ft-snippets.tsx"] = nil
package.loaded["bc-compe.ft-snippets.lua"] = nil

local go_snpts = require("bc-compe.ft-snippets.go")
local python_snpts = require("bc-compe.ft-snippets.python")
local tex_snpts = require("bc-compe.ft-snippets.tex")
local tsx_snpts = require("bc-compe.ft-snippets.tsx")
local lua_snpts = require("bc-compe.ft-snippets.lua")
local csharp_snpts = require("bc-compe.ft-snippets.csharp")
-- local ts_snpts = require("bc-compe.ft-snippets.js")

ls.add_snippets("all", {})

ls.add_snippets("lua", lua_snpts)
ls.add_snippets("python", python_snpts)
ls.add_snippets("typescript", {
  s("cl", {
    t({ "console.log(" }),
    i(1),
    t({ ")" }),
  }),
})
ls.add_snippets("typescriptreact", tsx_snpts)
ls.add_snippets("go", go_snpts)
ls.add_snippets("tex", tex_snpts)
ls.add_snippets("cs", csharp_snpts)

require("luasnip.loaders.from_vscode").lazy_load()
