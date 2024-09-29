local settings = require("settings")
if false then
  require("frecency")
end
return {
  {
    "danielfalk/smart-open.nvim",
    branch = "0.2.x",
    enabled = settings.fild_finder == "smart_open",
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
  {
    "nvim-telescope/telescope-frecency.nvim",
    enabled = settings.fild_finder == "frecency",
    config = function()
      require("frecency").setup({
        workspaces = {
          ["r"] = "/home/iyed/projects/ican/frontend/src/routes",
          ["c"] = "/home/iyed//projects/ican/frontend/src/components/",
          ["p"] = "/home/iyed/projects/ican/frontend/src/pages",
        },
      })
      require("telescope").load_extension("frecency")
    end,
  },
}
