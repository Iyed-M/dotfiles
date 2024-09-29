for _, x in pairs(vim.api.nvim_tabpage_list_wins(0)) do
  vim.print(vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(x)))
end
local M = {
  hi = function()
    vim.print("hi form utils")
  end,
}

function M.Close(buf)
  if not buf then
    buf = vim.api.nvim_get_current_buf()
  end
  local is_oiled = require("oil.util").is_oil_bufnr(buf)
  if is_oiled then
    require("oil").close()
    return
  end
  vim.cmd("q")
end
function M.hi1()
  vim.print("hi1 from utils")
end
function M:hi2()
  vim.print("hi2 from utils")
end

function M.Chat() end
M.Chat()
return M
