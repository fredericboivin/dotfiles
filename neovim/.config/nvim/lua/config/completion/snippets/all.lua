local ls = require "luasnip"
local s = ls.snippet
local f = ls.function_node
local text = ls.text_node
local insert = ls.insert_node
local p = require("luasnip.extras").partial
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local snippets = {
  s({ trig = "$ymd", name = "Current date", dscr = "Insert the current date" }, {
    p(os.date, "%Y-%m-%d"),
  }),

  s(
    "$date",
    f(function()
      return os.date "%D - %H:%M"
    end)
  ),
  s(
    {
      trig = "drink",
      namr = "",
      dscr = "",
    },
    fmt(
      [[
        - title: {}
          ingredients:
            - {} 
          instructions:
            - {}
          tags:
            - {}
      ]],
      {
        insert(1, "title"),
        insert(2),
        insert(3),
        insert(4),
      }
    )
  ),
}

return snippets
