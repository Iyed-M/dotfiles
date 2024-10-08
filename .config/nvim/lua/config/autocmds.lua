-- vim.api.nvim_create_autocmd("InsertLeavePre", {
--   group = vim.api.nvim_create_augroup("ChangeCursorGroupEnter", {}),
--   callback = function()
--     vim.api.nvim_set_hl(0, "lCursor", { background = "#0DB9D7", foreground = "#0DB9D7" })
--     vim.api.nvim_set_hl(0, "CursorIM", { background = "#0DB9D7", foreground = "#0DB9D7" })
--     vim.api.nvim_set_hl(0, "TermCursor", { background = "#0DB9D7", foreground = "#0DB9D7" })
--   end,
-- })
--
-- vim.api.nvim_create_autocmd("InsertEnter", {
--   group = vim.api.nvim_create_augroup("ChangeCursorGroupLeave", {}),
--   callback = function()
--     vim.api.nvim_set_hl(0, "Cursor", { background = "#0DB9D7", foreground = "#0DB9D7" })
--   end,
-- })
vim.api.nvim_create_autocmd({ "BufNew", "BufEnter" }, {
  group = vim.api.nvim_create_augroup("USER_HYPRLANG", {}),
  pattern = "*.conf",
  callback = function()
    vim.cmd("set filetype=hyprlang")
  end,
})
