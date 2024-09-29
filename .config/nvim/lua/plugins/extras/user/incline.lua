return {
  "b0o/incline.nvim",
  enabled = true,
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    hide = {
      focused_win = true,
      only_win = true,
    },
    window = {
      zindex = 10,
      margin = {
        horizontal = 0,
        vertical = 1,
      },
    },
    render = function(props)
      local bufnr = props.buf
      local modified_indicator = " "
      local bufname = vim.api.nvim_buf_get_name(props.buf)
      local filename = bufname ~= "" and vim.fn.fnamemodify(bufname, ":t") or "[No Name]"
      local icon, _ = require("nvim-web-devicons").get_icon(filename, nil, {
        default = true,
      })
      if vim.api.nvim_get_option_value("modified", { buf = bufnr }) then
        modified_indicator = "  "
      end
      return { { " " .. icon .. " " }, { filename }, { modified_indicator } }
    end,
  },
}
