return {
  "olexsmir/gopher.nvim",
  ft = "go",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("gopher").setup({
      gotag = {
        transform = "camelcase",

        -- default tags to add to struct fields
        default_tag = "json",
      },
      commands = {
        go = "go",
        gomodifytags = "gomodifytags",
        gotests = "gotests", -- also you can set custom command path
        impl = "impl",
        iferr = "iferr",
      },
    })
    vim.keymap.set("n", "<leader>le", "<cmd>:GoIfErr<CR>", { desc = "Go - If Err" })
  end,
  build = function()
    vim.cmd([[silent! GoInstallDeps]])
  end,
}
