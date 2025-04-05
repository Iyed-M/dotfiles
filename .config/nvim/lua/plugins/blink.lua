if true then
  return {}
end
return {
  require("lazyvim.plugins.extras.coding.blink"),
  {
    "aghen/blink.cmp",
    opts = {
      keymap = {
        ["<C-n>"] = { "select_next", "show", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
      },
    },
  },
}
