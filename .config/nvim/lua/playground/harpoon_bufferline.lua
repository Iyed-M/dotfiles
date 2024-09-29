if true then
  return {}
end
local function reloadBufferline()
  require("bufferline.ui").refresh()
end
require("harpoon"):extend({
  REORDER = reloadBufferline,
  REMOVE = reloadBufferline,
  POSITION_UPDATED = reloadBufferline,
  ADD = reloadBufferline,
  NAVIGATE = reloadBufferline,
})
local function isHarpooned(buf)
  -- if true then
  --   return true
  -- end
  local l = require("harpoon"):list():display()
  for _, v in pairs(l) do
    if buf.path:match(".*" .. v .. "$") then
      return true
    end
  end
  return false
end

local sort_by_harpoon = function(buf_a, buf_b)
  local idx_a = 0
  local idx_b = 0
  local l = require("harpoon"):list():display()
  for idx, item in ipairs(l) do
    if buf_a.path:match(".*" .. item .. "$") then
      idx_a = idx
    end
    if buf_b.path:match(".*" .. item .. "$") then
      idx_b = idx
    end
  end
  return idx_a < idx_b
end

return {
  {
    "akinsho/bufferline.nvim",
    ---@type bufferline.UserConfig
    opts = {
      options = {
        sort_by = sort_by_harpoon,
        duplicates_across_groups = false,
        groups = {
          items = {
            {
              name = "Harpoon", -- Mandatory
              priority = 1, -- determines where it will appear relative to other groups (Optional)
              icon = " ", -- Optional
              matcher = isHarpooned,
            },
            {
              name = "other", -- Mandatory
              priority = 2, -- determines where it will appear relative to other groups (Optional)
              icon = " ", -- Optional
              matcher = function(a, b)
                return not isHarpooned(a, b)
              end,
            },
          },
        },
      },
    },
  },
}
