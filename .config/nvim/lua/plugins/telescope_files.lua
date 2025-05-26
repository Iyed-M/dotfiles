if true then
  return {}
end
return {
  {
    "danielfalk/smart-open.nvim",
    branch = "0.2.x",
    enabled = true,
    dependencies = {
      "kkharji/sqlite.lua",
      -- Only required if using match_algorithm fzf
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      -- Optional.  If installed, native fzy will be used when match_algorithm is fzy
      { "nvim-telescope/telescope-fzy-native.nvim" },
    },
    config = function()
      local telescope = require("telescope")
      telescope.load_extension("smart_open")
      telescope.setup({
        extensions = {
          smart_open = {
            match_algorithm = "fzf",
            disable_devicons = false,
            ignore_patterns = { "*.git/*", "*/tmp/*", "*/node_modules/*" },
          },
        },
      })
    end,
  },
}
