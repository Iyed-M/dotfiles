local l = require("lazy")
---@type LazyPlugin[]
local ps = l.plugins()
local m = vim.tbl_filter(function(p)
  return p.name == "nvim-lspconfig"
end, ps)
vim.print(m[1].opts.keys)
