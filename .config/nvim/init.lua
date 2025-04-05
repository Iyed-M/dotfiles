vim.g.nvchad_enabled = false

if vim.g.nvchad_enabled then
  vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46_cache/"
end

-- put this after lazy setup
require("config.lazy")

-- (method 1, For heavy lazyloaders)
-- dofile(vim.g.base46_cache .. "defaults")
-- dofile(vim.g.base46_cache .. "statusline")

-- (method 2, for non lazyloaders) to load all highlights at once
if vim.g.nvchad_enabled then
  for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
    dofile(vim.g.base46_cache .. v)
  end
end

vim.api.nvim_set_hl(0, "lCursor", { background = "#0DB9D7", foreground = "#0DB9D7" })
vim.api.nvim_set_hl(0, "CursorIM", { background = "#0DB9D7", foreground = "#0DB9D7" })
vim.api.nvim_set_hl(0, "TermCursor", { background = "#0DB9D7", foreground = "#0DB9D7" })
