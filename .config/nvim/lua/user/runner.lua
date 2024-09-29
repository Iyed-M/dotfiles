---@param item string[]
---@return string
local format_item = function(item)
  local str = ""
  for _, v in ipairs(item) do
    str = str .. v
  end
  return str
end
---@param cmd string[]
---@param buf number?
local execute_cmd = function(cmd, buf)
  if not buf then
    buf = vim.api.nvim_create_buf(false, true)
    vim.cmd("sb " .. buf)
  end
  vim.fn.jobstart(cmd, {
    stdout_buffered = true,
    on_stdout = function(_, data)
      if data then
        vim.api.nvim_buf_set_lines(buf, -1, -1, false, data)
      end
    end,
    on_stderr = function(_, data)
      -- data = { "stderr", unpack(data) }
      if data then
        vim.print(data)
        vim.api.nvim_buf_set_lines(buf, -1, -1, false, data)
      end
    end,
  })
end
local function select_exec()
  vim.ui.select({ { "go", "run", "lua/user/main.go" }, { "ls" } }, {
    format_item = format_item,
  }, function(item, _)
    execute_cmd(item)
  end)
end

select_exec()
