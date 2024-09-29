---@type LazySpec
return {

  {
    "Wansmer/treesj",
    cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
    opts = { use_default_keymaps = false },
  },
  {

    "nvim-treesitter/nvim-treesitter",

    opts = function(_, opt)
      opt.incremental_selection = {
        enable = true,
        keymaps = { init_selection = "m", node_incremental = "m", scope_incremental = false, node_decremental = "M" },
      }
      return opt
    end,
    keys = {
      { "m", desc = "Increment Selection" },
      { "M", desc = "Decrement Selection" },
    },
  },
}
