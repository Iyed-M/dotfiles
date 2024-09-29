return {
  "nvim-telescope/telescope.nvim",
  lazy = false,
  dependencies = {
    {
      "jvgrootveld/telescope-zoxide",
    },
  },

  opts = function()
    local conf = require "nvchad.configs.telescope"
    local actions = require "telescope.actions"

    local open_with_trouble = function(...)
      return require("trouble.providers.telescope").open_with_trouble(...)
    end
    local open_selected_with_trouble = function(...)
      return require("trouble.providers.telescope").open_selected_with_trouble(...)
    end

    conf.defaults.mappings.n = { ["q"] = actions.close }
    conf.defaults.mappings.i = {

      ["<c-t>"] = open_with_trouble,
      ["<a-t>"] = open_selected_with_trouble,
      ["<c-v>"] = actions.select_vertical,
      ["<C-Down>"] = actions.cycle_history_next,
      ["<C-Up>"] = actions.cycle_history_prev,
      ["<C-f>"] = actions.preview_scrolling_down,
      ["<C-b>"] = actions.preview_scrolling_up,
    }
    conf.defaults.get_selection_window = function()
      local wins = vim.api.nvim_list_wins()
      table.insert(wins, 1, vim.api.nvim_get_current_win())
      for _, win in ipairs(wins) do
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.bo[buf].buftype == "" then
          return win
        end
      end
      return 0
    end

    return conf
  end,
}
