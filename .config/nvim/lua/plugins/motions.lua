return {
  { "smoka7/hop.nvim", opts = {
    keys = "qwertyuiopsadfghkjlvbnm",
  } },
  {
    "max397574/better-escape.nvim",
    lazy = false,
    enabled = false,
    config = function()
      require("better_escape").setup()
    end,
  },
}
