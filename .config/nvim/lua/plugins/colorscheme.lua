---@diagnostic disable: inject-field
---@param M  ColorScheme
local colors = function(M) end

---@param hl tokyonight.Highlights
---@param c ColorScheme
local highlights = function(hl, c)
  hl.CursorLineNr = { fg = c.orange, bold = true }
  -- hl.LineNr = { fg = c.orange, bold = true }
  hl.LineNrAbove = { fg = c.fg_gutter }
  hl.LineNrBelow = { fg = c.fg_gutter }
  hl.TelescopeBorder = { fg = c.cyan, bg = c.bg }
  hl.TelescopeNormal = { bg = c.bg }
  hl.TelescopePreviewBorder = { fg = c.cyan, bg = c.bg }
  hl.TelescopePreviewNormal = { bg = c.bg }
  hl.TelescopePreviewTitle = { fg = c.bg, bg = c.blue1 }
  hl.TelescopePromptBorder = { fg = c.bg_dark, bg = c.bg_dark }
  hl.TelescopePromptNormal = { fg = c.fg, bg = c.bg_dark }
  hl.TelescopePromptPrefix = { fg = c.blue1, bg = c.bg_dark }
  hl.TelescopePromptTitle = { fg = c.bg, bg = c.cyan }
  hl.TelescopeResultsBorder = { fg = c.cyan, bg = c.bg }
  hl.TelescopeResultsNormal = { bg = c.bg }
  hl.TelescopeResultsTitle = { fg = c.bg, bg = c.blue1 }
  --
  --

  hl.TSRainbowRed = { fg = c.red }
  hl.TSRainbowYellow = { fg = c.yellow }
  hl.TSRainbowBlue = { fg = c.blue }
  hl.TSRainbowOrange = { fg = c.orange }
  hl.TSRainbowGreen = { fg = c.green2 }
  hl.TSRainbowViolet = { fg = c.purple }
  hl.TSRainbowCyan = { fg = c.cyan }

  hl["@lsp.type.operator"] = { link = "@operator" }
  hl["Identifier"] = { fg = "#78ccf0" }
  hl["String"] = { fg = "#ddc29c" }
  hl["Keyword"] = { fg = "#c790ea" }
  hl["@keyword"] = { fg = "#c790ea" }
  hl["Statement"] = { fg = "#c792ea" }
  hl["Conditional"] = { fg = "#c792ea" }
  hl["@property"] = { fg = "#baebe2" }
  hl["@object.key"] = { link = "@property" }
end
return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    ---@param opts tokyonight.Config
    config = function(_, opts)
      -- opts.on_highlights = highlights
      -- opts.on_colors = colors
      opts.italic = false
      opts.bold = true
      opts.inactive_statusline = true
      opts.dim_inactive = false
      opts.lualine_bold = true
      opts.styles = {
        comments = { italic = true },
        keywords = { italic = false, bold = false },
        functions = { italic = false, bold = false },
        variables = { italic = false, bold = false },
      }
      if not vim.g.neovide then
        opts.transparent = true
        opts.styles.sidebars = "transparent"
        opts.styles.floats = "transparent"
      end
      require("tokyonight").setup(opts)
    end,
  },

  {
    "LazyVim/LazyVim",
    ---@type LazyVimConfig
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
