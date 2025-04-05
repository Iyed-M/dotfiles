if true then
  return {}
end
local function get_truncated_path()
  local filepath = vim.fn.expand("%:p")
  local cwd = vim.fn.getcwd()
  local relative_path = vim.fn.fnamemodify(filepath, ":~:.")

  local parts = {}
  for part in string.gmatch(relative_path, "[^/]+") do
    table.insert(parts, part)
  end

  -- Adjust the starting index to 4 to get the path from 'GroupOverview'
  local start_index = 4
  if #parts > start_index then
    return table.concat(parts, "/", start_index, #parts)
  else
    return relative_path
  end
end

return {
  "b0o/incline.nvim",
  enabled = true,
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local helpers = require("incline.helpers")
    local devicons = require("nvim-web-devicons")
    require("incline").setup({
      window = {
        padding = 0,
        margin = { horizontal = 0, vertical = 0 },
      },
      render = function(props)
        -- local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        local filename = get_truncated_path()

        if filename == "" then
          filename = "[No Name]"
        end
        local ft_icon, ft_color = devicons.get_icon_color(filename)
        local modified = vim.bo[props.buf].modified
        local res = {
          ft_icon and { " ", ft_icon, "  ", guibg = "#2EC1DC", guifg = helpers.contrast_color(ft_color) } or "",
          " ",
          { filename, gui = modified and "bold,italic" or "bold" },
          guibg = "#0F1A2D",
        }
        -- if props.focused then
        --   for _, item in ipairs(navic.get_data(props.buf) or {}) do
        --     table.insert(res, {
        --       { " > ", group = "NavicSeparator" },
        --       { item.icon, group = "NavicIcons" .. item.type },
        --       { item.name, group = "NavicText" },
        --     })
        --   end
        -- end
        table.insert(res, " ")
        return res
      end,
    })
  end,
}
