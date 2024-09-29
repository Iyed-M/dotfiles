local themes = require("user.colors")
return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        transparent_background = false,
        color_overrides = {
          mocha = themes.nero3(),
        },

        highlight_overrides = {
          all = function(colors)
            return {
              ["@function.method"] = { fg = colors.sapphire, style = { "bold" } },
              ["@function.builtin"] = { fg = colors.sapphire, style = { "bold" } },
              ["@parameter"] = { fg = colors.peach },
              ["@keyword"] = { fg = colors.red, style = { "bold" } },
              ["NeoTreeNormal"] = { bg = colors.base },
              ["NeoTreeVertSplit"] = { fg = colors.base, bg = colors.base },
              ["NeoTree"] = { fg = colors.base, bg = colors.base },
              ["LazySpecial"] = { fg = colors.mauve },
              ["@variable.member.go"] = { fg = colors.sky },
            }
          end,
        },
      })
    end,
  },
}
