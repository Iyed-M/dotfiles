if true then
  return {}
end
return {
  "CWood-sdf/pineapple",
  dependencies = require("themeswitch.pineapple"),
  opts = {
    installedRegistry = "themeswitch.pineapple",
    colorschemeFile = "after/plugin/theme.lua",
    colorschemeSet = function(scheme)
      return "vim.cmd('colorscheme " .. scheme .. "')"
    end,
  },
  cmd = "Pineapple",
}
