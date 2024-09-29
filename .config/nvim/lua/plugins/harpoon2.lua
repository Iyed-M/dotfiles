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

-- return {
--   {
--     "ThePrimeagen/harpoon",
--     branch = "harpoon2",
--     dependencies = {
--       "nvim-lua/plenary.nvim",
--       "nvim-telescope/telescope.nvim",
--       { "AstroNvim/astroui", opts = { icons = { Harpoon = "󱡀" } } },
--       {
--         "AstroNvim/astrocore",
--         opts = function(_, opts)
--           local maps = opts.mappings
--           maps.n["<Leader>ka"] = { function() require("harpoon"):list():add() end, desc = "Add file" }
--           maps.n["<Leader>kd"] = { function() require("harpoon"):list():remove() end, desc = "Delete file" }
--           maps.n["<Leader>kt"] = { "<Cmd>Telescope harpoon marks<CR>", desc = "Show marks in Telescope" }
--           maps.n["<Leader>ke"] = {
--             function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end,
--             desc = "Toggle quick menu",
--           }
--           maps.n["<C-q>"] = {
--             function() require("harpoon"):list():select(1) end,
--             desc = "Harpoon to File 1",
--           }
--           maps.n["<C-w>"] = {
--             function() require("harpoon"):list():select(2) end,
--             desc = "Harpoon to File 2",
--           }
--           maps.n["<C-a>"] = {
--             function() require("harpoon"):list():select(3) end,
--             desc = "Harpoon to File 3",
--           }
--           maps.n["<C-s>"] = {
--             function() require("harpoon"):list():select(4) end,
--             desc = "Harpoon to File 4",
--           }
--         end,
--       },
