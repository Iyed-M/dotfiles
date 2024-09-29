
  return  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    ---@type oil.setupOpts
    opts =  {
      win_options = {
      },
      buf_options = {
        buflisted = false,
        bufhidden = "hide",
      },
      skip_confirm_for_simple_edits = true,
      keymaps = {
        [")"] = "actions.preview",
        ["s"] = "actions.select_vsplit",
        ["L"] = "actions.select",
        ["q"] = "actions.close",
        ["H"] = "actions.parent",
      },
    },
  }
