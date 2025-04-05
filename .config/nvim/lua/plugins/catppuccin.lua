if true then
  return {}
end
local themes = require("user.colors")

return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    enabled = true,
    config = function()
      require("catppuccin").setup({
        -- no_bold = true,
        no_italic = true,
        transparent_background = true, -- disables setting the background color.
        term_colors = true,
        color_overrides = {
          macchiato = themes.nero3(),
          frappe = themes.nero2(),
        },
        highlight_overrides = {
          all = function(colors)
            return {
              -- ["@function.method"] = { fg = colors.sapphire },
              -- ["@function.builtin"] = { fg = colors.sapphire },
              -- ["@parameter"] = { fg = colors.peach },
              -- ["@keyword"] = { fg = colors.red },
              -- ["@tag.tsx"] = { fg = colors.flamingo },
              -- ["NeoTreeNormal"] = { bg = colors.base },
              -- ["NeoTreeVertSplit"] = { fg = colors.base, bg = colors.base },
              -- ["NeoTree"] = { fg = colors.base, bg = colors.base },
              -- ["LazySpecial"] = { fg = colors.mauve },
              -- ["@variable.member.go"] = { fg = colors.sky },
            }
          end,
        },
      })
    end,
  },
  -- {
  --   "rose-pine/neovim",
  --   name = "rose-pine",
  --   enabled = false,
  --   event = "VeryLazy",
  --   config = function()
  --     require("rose-pine").setup({
  --       variant = "auto", -- auto, main, moon, or dawn
  --       dark_variant = "main", -- main, moon, or dawn
  --       dim_inactive_windows = false,
  --       extend_background_behind_borders = true,
  --
  --       enable = {
  --         terminal = true,
  --         legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
  --         migrations = true, -- Handle deprecated options automatically
  --       },
  --
  --       styles = {
  --         bold = true,
  --         italic = true,
  --         transparency = false,
  --       },
  --
  --       groups = {
  --         border = "muted",
  --         link = "iris",
  --         panel = "surface",
  --
  --         error = "love",
  --         hint = "iris",
  --         info = "foam",
  --         note = "pine",
  --         todo = "rose",
  --         warn = "gold",
  --
  --         git_add = "foam",
  --         git_change = "rose",
  --         git_delete = "love",
  --         git_dirty = "rose",
  --         git_ignore = "muted",
  --         git_merge = "iris",
  --         git_rename = "pine",
  --         git_stage = "iris",
  --         git_text = "rose",
  --         git_untracked = "subtle",
  --
  --         h1 = "iris",
  --         h2 = "foam",
  --         h3 = "rose",
  --         h4 = "gold",
  --         h5 = "pine",
  --         h6 = "foam",
  --       },
  --
  --       palette = {
  --         -- Override the builtin palette per variant
  --         -- moon = {
  --         --     base = '#18191a',
  --         --     overlay = '#363738',
  --         -- },
  --       },
  --
  --       highlight_groups = {
  --         -- Comment = { fg = "foam" },
  --         -- VertSplit = { fg = "muted", bg = "muted" },
  --       },
  --
  --       before_highlight = function(group, highlight, palette)
  --         -- Disable all undercurls
  --         -- if highlight.undercurl then
  --         --     highlight.undercurl = false
  --         -- end
  --         --
  --         -- Change palette colour
  --         -- if highlight.fg == palette.pine then
  --         --     highlight.fg = palette.foam
  --         -- end
  --       end,
  --     })
  --
  --     -- vim.cmd("colorscheme rose-pine")
  --     -- vim.cmd("colorscheme rose-pine-main")
  --     -- vim.cmd("colorscheme rose-pine-moon")
  --     -- vim.cmd("colorscheme rose-pine-dawn")
  --   end,
  -- },
  -- {
  --
  --   "eldritch-theme/eldritch.nvim",
  -- },
}
