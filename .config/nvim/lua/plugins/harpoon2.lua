return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  ---@type HarpoonConfig
  opts = {
    settings = {
      save_on_toggle = true,
    },
    menu = {
      width = vim.api.nvim_win_get_width(0) - 4,
    },
  },
}
