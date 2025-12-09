vim.opt.tabstop = 4 -- Number of spaces tabs count for
vim.opt.shiftwidth = 4 -- Size of an indent
vim.opt.wrap = false -- Disable line wrap
vim.opt.guicursor = ""
vim.g.ai_cmp = false
-- vim.opt.guicursor = "n-v-c:block-CusCursor,i-ci:ver25-CusCursor,r-cr:hor20-CusCursor"
vim.opt.guicursor = "n-v-c:block,i-ci:ver25,r-cr:hor20"
-- vim.opt.guicursor = "n-v-c-i-ci:block-CusCursor,r-cr:hor20-CusCursor"
vim.lsp.inlay_hint.enable(false)
vim.opt.confirm = true -- Confirm to save changes before exiting modified buffer
